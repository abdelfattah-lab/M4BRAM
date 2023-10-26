# Compression Project

This project includes implementation for low-rank factorization, quantization, and pruning methods for deep neural 
networks. It supports intra-layer quantization on convolutional and linear layers and therefore
can be used with standard CNN, MLP, and transformer models.

## Setup & Installation

First, clone the project from GitHub:

```bash
git clone https://github.com/abdelfattah/compression.git
cd compression
```

You can create a conda environment and install the dependencies using the \`environment.yml\` file:

```bash
conda env create -f environment.yml
```

Then, activate the environment:

```bash
conda activate compression
```

## Usage Examples

### Intra-Layer Quantization
```bash
python vision_eval.py --arch=resnet34 --multi-quant --weight-bits=8 --activation-bits=8 --multi-quant-percentages=.7,.3
 --dataset=imagenet --positive-activations --multi-quant-bits=8,4
```

### Low-Rank Factorization
```bash
python language_eval.py --arch=textattack/distilbert-base-uncased-MRPC --low-rank --low-rank-ratio=.5
```
