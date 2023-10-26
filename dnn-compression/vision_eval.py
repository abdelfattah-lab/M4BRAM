import os
import time

import torch
from torch.utils.tensorboard import SummaryWriter
import torch.nn as nn
import torch.nn.parallel
import torch.backends.cudnn as cudnn
import torch.optim
import torch.utils.data
import torchvision.models as models
from torch.optim.lr_scheduler import CosineAnnealingLR
import models.cifar_resnet as resnet
from quant import quantize_utils as vision_utils

import utils

RESNET20_PATH = './checkpoints/resnet20-12fca82f.th'
DEFAULT_CIFAR10_ROOT = './data'
DEFAULT_IMAGENET_ROOT = '/share/abdelfattah/imagenet'


def vision_parse_args(parser):
    model_names = ['resnet20', 'resnet18', 'resnet34', 'alexnet', 'vgg16']

    parser.add_argument('--arch', '-a', metavar='ARCH', default='resnet20',
                        choices=model_names,
                        help='model architecture: ' + ' | '.join(model_names) +
                             ' (default: resnet32)')
    parser.add_argument('--resume', default=RESNET20_PATH, type=str, metavar='PATH',
                        help='path to latest local checkpoint')
    parser.add_argument('--dataset', default='cifar10', choices=['cifar10', 'imagenet'],
                        help='dataset for evaluation: (default: cifar10)')
    parser.add_argument('--cifar-root', default=DEFAULT_CIFAR10_ROOT, type=str,
                        help='path to cifar10 root')
    parser.add_argument('--imagenet-root', default=DEFAULT_IMAGENET_ROOT, type=str,
                        help='path to imagenet root')
    return parser.parse_args()


def main():
    general_parser = utils.parse_args()
    args = vision_parse_args(general_parser)
    utils.set_seed(args.seed)
    writer = SummaryWriter(args.log_dir)
    device = torch.device(args.device)
    multi_quant_percentages = list(map(float, args.multi_quant_percentages.split(',')))
    multi_quant_bits = list(map(int, args.multi_quant_bits.split(',')))
    quantized = args.weight_bits > 0 and args.activation_bits > 0

    if not os.path.exists(args.log_dir):
        os.makedirs(args.log_dir)

    if args.arch == 'resnet20':
        # ResNet20 is a local model because it is not supported by torchvision
        model = resnet.__dict__[args.arch]()
        model = utils.load_resnet20_state(model, args.resume)
    else:
        model = models.__dict__[args.arch](pretrained=True)
    model.to(device)

    if quantized:
        model, quantized_modules = vision_utils.quantize_model(model, multi_quant=args.multi_quant,
                                                               weight_bits=args.weight_bits,
                                                               multi_quant_percentages=multi_quant_percentages,
                                                               multi_quant_bits=multi_quant_bits,
                                                               activation_bits=args.activation_bits,
                                                               act_range_percentile=args.act_range_percentile,
                                                               weight_range_percentile=args.weight_range_percentile,
                                                               positive_activations=args.positive_activations,
                                                               permute_optimize=args.permute_optimize)
    else:
        quantized_modules = {}

    cudnn.benchmark = True

    train_loader = utils.get_dataloader(args, train=True)
    val_loader = utils.get_dataloader(args, train=False)

    criterion = nn.CrossEntropyLoss().to(device)
    optimizer = torch.optim.Adam(model.parameters(), lr=args.lr)
    # Defining the cosine decay scheduler
    scheduler = CosineAnnealingLR(optimizer, T_max=args.epochs, eta_min=0)

    memory = 0
    for name, module in quantized_modules.items():
        memory += module.get_memory_cost()
    print('Memory cost: {:.4f} MB'.format(memory))

    if quantized:
        print('Profiling activations:')
        utils.profile_activations(train_loader, model, args)

    # Initial validation
    print('Initial validation:')
    validate(val_loader, model, criterion, args, writer)

    # Training
    for epoch in range(args.epochs):
        train(train_loader, model, criterion, optimizer, scheduler, epoch, args, writer)
        validate(val_loader, model, criterion, args, writer)
        scheduler.step()

    # Final validation
    print('Final validation:')
    validate(val_loader, model, criterion, args, writer)

    writer.close()


def train(train_loader, model, criterion, optimizer, scheduler, epoch, args, writer):
    device = torch.device(args.device)

    batch_time = utils.AverageMeter()
    losses = utils.AverageMeter()
    top1 = utils.AverageMeter()

    model.train()  # switch to train mode

    end = time.time()
    for i, (input, target) in enumerate(train_loader):
        target = target.to(device)
        input_var = input.to(device)
        target_var = target.to(device)

        # compute output
        output = model(input_var)
        loss = criterion(output, target_var)

        # compute gradient and do backpropagation
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()

        lr = scheduler.get_last_lr()[0]

        # Log lr to TensorBoard
        writer.add_scalar('Train/Learning Rate', lr, epoch*len(train_loader) + i)

        output = output.float()
        loss = loss.float()

        # measure accuracy and record loss
        prec1 = accuracy(output.data, target)[0]
        losses.update(loss.item(), input.size(0))
        top1.update(prec1.item(), input.size(0))

        # Log loss to TensorBoard
        writer.add_scalar('Train/Loss', loss.item(), epoch*len(train_loader) + i)
        writer.add_scalar('Train/Accuracy', prec1.item(), epoch*len(train_loader) + i)

        # measure elapsed time
        batch_time.update(time.time() - end)
        end = time.time()

        if i % args.print_freq == 0:
            print('Train Epoch: [{0}][{1}/{2}]\t'
                  'Time {batch_time.val:.3f} ({batch_time.avg:.3f})\t'
                  'Loss {loss.val:.4f} ({loss.avg:.4f})\t'
                  'Prec@1 {top1.val:.3f} ({top1.avg:.3f})\t'
                  'LR {lr:.6f}'.format(
                      epoch, i, len(train_loader), batch_time=batch_time, loss=losses,
                      top1=top1, lr=lr))


def validate(val_loader, model, criterion, args, writer):
    device = torch.device(args.device)

    batch_time = utils.AverageMeter()
    losses = utils.AverageMeter()
    top1 = utils.AverageMeter()

    # switch to evaluate mode
    model.eval()

    end = time.time()
    with torch.no_grad():
        for i, (input, target) in enumerate(val_loader):
            target = target.to(device)
            input_var = input.to(device)
            target_var = target.to(device)

            # compute output
            output = model(input_var)
            loss = criterion(output, target_var)

            output = output.float()
            loss = loss.float()

            # measure accuracy and record loss
            prec1 = accuracy(output.data, target)[0]
            losses.update(loss.item(), input.size(0))
            top1.update(prec1.item(), input.size(0))

            # Log loss and accuracy to TensorBoard
            writer.add_scalar('Val/Loss', loss.item(), len(val_loader.dataset) // args.batch_size + i)
            writer.add_scalar('Val/Accuracy', prec1.item(), len(val_loader.dataset) // args.batch_size + i)

            # measure elapsed time
            batch_time.update(time.time() - end)
            end = time.time()

            if i != 0 and i % args.print_freq == 0:
                print('Test: [{0}/{1}]\t'
                      'Time {batch_time.val:.3f} ({batch_time.avg:.3f})\t'
                      'Loss {loss.val:.4f} ({loss.avg:.4f})\t'
                      'Prec@1 {top1.val:.3f} ({top1.avg:.3f})'.format(
                          i, len(val_loader), batch_time=batch_time, loss=losses,
                          top1=top1))

    print(' * Prec@1 {top1.avg:.3f}'
          .format(top1=top1))

    return top1.avg


def accuracy(output, target, topk=(1,)):
    """Computes the precision@k for the specified values of k"""
    maxk = max(topk)
    batch_size = target.size(0)

    _, pred = output.topk(maxk, 1, True, True)
    pred = pred.t()
    correct = pred.eq(target.view(1, -1).expand_as(pred))

    res = []
    for k in topk:
        correct_k = correct[:k].view(-1).float().sum(0)
        res.append(correct_k.mul_(100.0 / batch_size))
    return res


if __name__ == "__main__":
    main()
