import os

import torch
import numpy as np

import torch.backends.cudnn as cudnn
import torch.optim
import torch.utils.data

from transformers import AutoModelForSequenceClassification, AutoTokenizer, Trainer, TrainingArguments
from datasets import load_dataset, load_metric

from torch.utils.data import DataLoader

from quant import quantize_utils
from low_rank import low_rank_utils
import utils

# Load metric
accuracy_metric = load_metric("accuracy")


def compute_metrics(eval_pred):
    logits, labels = eval_pred
    predictions = np.argmax(logits, axis=-1)
    return accuracy_metric.compute(predictions=predictions, references=labels)


def nlp_parse_args(parser):
    model_names = ['bert-base-uncased', 'prajjwal1/bert-tiny', 'prajjwal1/bert-small', 'distilbert-base-uncased',
                   'textattack/distilbert-base-uncased-MRPC']
    parser.add_argument('--arch', '-a', metavar='ARCH', default='bert-base-uncased',
                        choices=model_names,
                        help='model architecture: ' + ' | '.join(model_names) +
                             ' (default: bert-base-uncased)')
    return parser.parse_args()


def main():
    general_parser = utils.parse_args()
    args = nlp_parse_args(general_parser)

    os.environ["CUDA_VISIBLE_DEVICES"] = args.device
    utils.set_seed(args.seed)

    multi_quant_percentages = list(map(float, args.multi_quant_percentages.split(',')))
    multi_quant_bits = list(map(int, args.multi_quant_bits.split(',')))
    quantized = args.weight_bits > 0 or args.activation_bits > 0

    if not os.path.exists(args.log_dir):
        os.makedirs(args.log_dir)

    # Set up model and tokenizer
    model = AutoModelForSequenceClassification.from_pretrained(args.arch)
    # Put model on device for factorizations and profiling
    device = torch.device("cuda")
    model = model.to(device)
    tokenizer = AutoTokenizer.from_pretrained(args.arch)

    if quantized:
        model, compressed_modules = quantize_utils.quantize_model(model, multi_quant=args.multi_quant,
                                                                  weight_bits=args.weight_bits,
                                                                  multi_quant_percentages=multi_quant_percentages,
                                                                  multi_quant_bits=multi_quant_bits,
                                                                  activation_bits=args.activation_bits,
                                                                  act_range_percentile=args.act_range_percentile,
                                                                  weight_range_percentile=args.weight_range_percentile,
                                                                  positive_activations=args.positive_activations,
                                                                  permute_optimize=args.permute_optimize)
    elif args.low_rank:
        model, compressed_modules = low_rank_utils.low_rank_linearize_model(model, args.low_rank_ratio)
    else:
        compressed_modules = {}

    cudnn.benchmark = True

    # Load MRPC dataset
    dataset = load_dataset("glue", "mrpc")
    train_dataset = dataset['train']
    eval_dataset = dataset['validation']

    def tokenize(batch):
        return tokenizer(batch['sentence1'], batch['sentence2'], truncation=True, padding='max_length')

    train_dataset = train_dataset.map(tokenize, batched=True, batch_size=len(train_dataset))
    eval_dataset = eval_dataset.map(tokenize, batched=True, batch_size=len(eval_dataset))

    # Set formats of the datasets
    train_dataset.set_format('torch', columns=['input_ids', 'attention_mask', 'label'])
    eval_dataset.set_format('torch', columns=['input_ids', 'attention_mask', 'label'])

    memory = 0
    for name, module in compressed_modules.items():
        memory += module.get_memory_cost(include_bias=False)
    print('Memory cost: {:.4f} MB'.format(memory))

    if quantized:
        print('Profiling activations:')
        profile_activations(train_dataset, model, args)

    for item in compressed_modules.items():
        print(item)

    training_args = TrainingArguments(
        output_dir='./results',
        num_train_epochs=args.epochs,
        per_device_train_batch_size=args.batch_size,
        per_device_eval_batch_size=args.batch_size,
        learning_rate=args.lr,
        logging_dir='./logs',
        logging_steps=10,
        evaluation_strategy="epoch",
        eval_steps=10,
    )

    trainer = Trainer(
        model=model,
        args=training_args,
        train_dataset=train_dataset,
        eval_dataset=eval_dataset,
        compute_metrics=compute_metrics
    )

    # Initial evaluation
    initial_eval = trainer.evaluate()
    print('Initial evaluation: {}'.format(initial_eval))

    trainer.train()

    # Final evaluation
    eval_result = trainer.evaluate()
    print('Evaluation result: {}'.format(eval_result))


def profile_activations(train_dataset, model, args):
    model.train()

    # Create a DataLoader
    train_dataloader = DataLoader(train_dataset, batch_size=args.batch_size)

    # Get a batch
    batch = next(iter(train_dataloader))

    # Get device from model parameters
    device = next(model.parameters()).device

    # Prepare inputs for model
    inputs = {key: batch[key].to(device) for key in ['input_ids', 'attention_mask']}
    labels = batch['label'].to(device)

    # Run the batch through the model
    model(**inputs, labels=labels)


if __name__ == "__main__":
    main()
