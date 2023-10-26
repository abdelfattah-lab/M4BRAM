import argparse

import torch
import torch.nn.parallel
import torch.backends.cudnn as cudnn
import torch.optim
import torch.utils.data

import torchvision.datasets as datasets
import torchvision.transforms as transforms
from collections import OrderedDict


def parse_args():
    parser = argparse.ArgumentParser(description='Multi-Quant Experiments')
    parser.add_argument('--seed', default=0, type=int, help='random seed')
    parser.add_argument('--device', default='cuda', type=str,
                        help='device to use for computation. E.g., cpu, cuda, cuda:1')
    parser.add_argument('-j', '--workers', default=4, type=int, metavar='N',
                        help='number of data loading workers (default: 4)')
    parser.add_argument('-b', '--batch-size', default=128, type=int,
                        metavar='N', help='mini-batch size')
    parser.add_argument('--low-rank', action='store_true',
                        help='If set, use low-rank approximations for Linear layers')
    parser.add_argument('--low-rank-ratio', default=1.0, type=float,
                        help='Ratio for determining the rank in low-rank approximations of Linear layers')
    parser.add_argument('--print-freq', '-p', default=10, type=int,
                        metavar='N', help='print frequency (default: 1)')
    parser.add_argument('--save-dir', dest='log_dir',
                        help='The directory used to save the trained models',
                        default='save_temp', type=str)
    parser.add_argument('--save-every', dest='save_every',
                        help='Saves checkpoints at every specified number of epochs',
                        type=int, default=10)
    parser.add_argument('--log-dir', dest='log_dir', type=str,
                        default='./logs',
                        help='The directory where to store the TensorBoard logs')
    parser.add_argument('--positive-activations', action='store_true',
                        help='Quantize only the positive side of the activations')
    parser.add_argument('--permute-optimize', action='store_true',
                        help='If True, permutation optimization will be used')
    parser.add_argument('--epochs', default=10, type=int, metavar='N',
                        help='number of total epochs to run')
    parser.add_argument('--lr', '--learning-rate', default=1e-5, type=float,
                        metavar='LR', help='initial learning rate')
    parser.add_argument('--multi-quant', action='store_true',
                        help='Whether to use multi quantization or not')
    parser.add_argument('--multi-quant-percentages', default="0.5,0.5", type=str,
                        help='Comma-separated list of multi-quant percentages (default: "0.5,0.5")')
    parser.add_argument('--multi-quant-bits', default="4,8", type=str,
                        help='Comma-separated list of multi-quant bits (default: "4,8")')
    parser.add_argument('--weight-bits', default=0, type=int,
                        help='Bitwidths for weights in the quantized layers')
    parser.add_argument('--activation-bits', default=0, type=int,
                        help='Bitwidths for activations in the quantized layers')
    parser.add_argument('--act-range-percentile', default=0, type=float,
                        help='Percentile for activation range in the quantized layers')
    parser.add_argument('--weight-range-percentile', default=0, type=float,
                        help='Percentile for weight range in the quantized layers')

    return parser


def set_seed(seed):
    torch.manual_seed(seed)
    torch.cuda.manual_seed(seed)
    torch.backends.cudnn.deterministic = True
    torch.backends.cudnn.benchmark = False


class AverageMeter(object):
    """Computes and stores the average and current value"""
    def __init__(self):
        self.val = 0
        self.avg = 0
        self.sum = 0
        self.count = 0
        self.reset()

    def reset(self):
        self.val = 0
        self.avg = 0
        self.sum = 0
        self.count = 0

    def update(self, val, n=1):
        self.val = val
        self.sum += val * n
        self.count += n
        self.avg = self.sum / self.count


def profile_activations(train_loader, model, args):
    device = torch.device(args.device)
    model.train()

    # Get a random batch
    input, _ = next(iter(train_loader))
    input_var = input.to(device)

    # Run the batch through the model
    model(input_var)


def load_imagenet(args, train=True, batch_size=128, imagenet_root=None):
    normalize = transforms.Normalize(mean=[0.485, 0.456, 0.406],
                                     std=[0.229, 0.224, 0.225])

    if train:
        transform = transforms.Compose([
            transforms.RandomResizedCrop(224),
            transforms.RandomHorizontalFlip(),
            transforms.ToTensor(),
            normalize,
        ])
        root_dir = imagenet_root + '/train'
    else:
        transform = transforms.Compose([
            transforms.Resize(256),
            transforms.CenterCrop(224),
            transforms.ToTensor(),
            normalize,
        ])
        root_dir = imagenet_root + '/val'

    dataset = datasets.ImageFolder(root=root_dir, transform=transform)

    return torch.utils.data.DataLoader(
        dataset,
        batch_size=batch_size, shuffle=train,
        num_workers=args.workers, pin_memory=True)


def get_dataloader(args, train=True):
    batch_size = args.batch_size
    if args.dataset == 'cifar10':
        return load_cifar10(args, train=train, batch_size=batch_size, cifar_root=args.cifar_root)
    elif args.dataset == 'imagenet':
        return load_imagenet(args, train=train, batch_size=batch_size, imagenet_root=args.imagenet_root)
    else:
        raise ValueError('Unknown dataset: {}'.format(args.dataset))


def load_cifar10(args, train=True, batch_size=128, cifar_root=None):
    if train:
        transform = transforms.Compose([
            transforms.RandomHorizontalFlip(),
            transforms.RandomCrop(32, padding=4),
            transforms.ToTensor(),
            transforms.Normalize(mean=[0.485, 0.456, 0.406],
                                 std=[0.229, 0.224, 0.225])
        ])
    else:
        transform = transforms.Compose([
            transforms.ToTensor(),
            transforms.Normalize(mean=[0.485, 0.456, 0.406],
                                 std=[0.229, 0.224, 0.225])
        ])

    dataset = datasets.CIFAR10(root=cifar_root, train=train, download=True, transform=transform)

    return torch.utils.data.DataLoader(
        dataset,
        batch_size=batch_size, shuffle=train,
        num_workers=args.workers, pin_memory=True)


def load_resnet20_state(model, resume_path):
    def remove_module_from_checkpoint_state_dict(state_dict):
        new_state_dict = OrderedDict()
        for k, v in state_dict.items():
            if k.startswith('module.'):
                k = k[7:]  # remove 'module.' prefix
            new_state_dict[k] = v
        return new_state_dict

    checkpoint = torch.load(resume_path)
    new_state_dict = remove_module_from_checkpoint_state_dict(checkpoint['state_dict'])
    model.load_state_dict(new_state_dict)

    return model
