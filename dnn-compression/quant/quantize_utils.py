from typing import Dict, Tuple, List
import torch
from torch import nn
from quant.quant_conv2d import QuantConv2D, MultiQuantConv2D
from quant.quant_linear import QuantLinear, MultiQuantLinear


def quantize_model(model: torch.nn.Module, multi_quant: bool = False,
                   weight_bits: List[int] = [4, 8],
                   multi_quant_percentages: List[float] = [0.5, 0.5],
                   multi_quant_bits: List[int] = [4, 8],
                   activation_bits: int = 4,
                   act_range_percentile: float = 0,
                   weight_range_percentile: float = 0,
                   positive_activations: bool = False,
                   permute_optimize: bool = False
                   ) -> Tuple[torch.nn.Module, Dict[str, torch.nn.Module]]:
    """Quantize all nn.Conv2d layers within a given resnet model"""
    quantized_modules = {}

    first_conv_layer_encountered = False
    last_linear_layer_encountered = False

    def replace_layer(layer, layer_name):
        nonlocal first_conv_layer_encountered
        nonlocal last_linear_layer_encountered

        positive_activations_temp = positive_activations  # default setting

        if isinstance(layer, nn.Conv2d) and not first_conv_layer_encountered:
            positive_activations_temp = False  # turn off positive activations for the first conv layer
            first_conv_layer_encountered = True
            # Hardcode the first conv layer to be 8-bit
            new_layer = QuantConv2D(layer, weight_bit=8, activation_bit=8,
                                    act_percentile=act_range_percentile,
                                    weight_percentile=weight_range_percentile,
                                    positive_activation=positive_activations_temp)
        elif isinstance(layer, nn.Linear):
            if not last_linear_layer_encountered:
                # Check if this is the last linear layer
                last_linear_layer_encountered = not any(
                    isinstance(l, nn.Linear) for _, l in model.named_modules() if id(l) != id(layer))

            if last_linear_layer_encountered:
                # Hardcode the last linear layer to be 8-bit
                new_layer = QuantLinear(layer, weight_bit=8, activation_bit=8,
                                        act_percentile=act_range_percentile,
                                        weight_percentile=weight_range_percentile,
                                        positive_activation=positive_activations_temp)
            else:
                new_layer = MultiQuantLinear(layer, weight_bits=multi_quant_bits,
                                             percentages=multi_quant_percentages,
                                             activation_bit=activation_bits,
                                             act_percentile=act_range_percentile,
                                             positive_activation=positive_activations_temp) if multi_quant else \
                    QuantLinear(layer, weight_bits, activation_bits,
                                act_percentile=act_range_percentile,
                                weight_percentile=weight_range_percentile,
                                positive_activation=positive_activations_temp)
        else:
            if multi_quant:
                if isinstance(layer, nn.Conv2d):
                    new_layer = MultiQuantConv2D(layer, weight_bits=multi_quant_bits,
                                                 percentages=multi_quant_percentages,
                                                 activation_bit=activation_bits,
                                                 act_percentile=act_range_percentile,
                                                 positive_activation=positive_activations_temp,
                                                 permute_optimize=permute_optimize)
            else:
                if isinstance(layer, nn.Conv2d):
                    new_layer = QuantConv2D(layer, weight_bits, activation_bits,
                                            act_percentile=act_range_percentile,
                                            weight_percentile=weight_range_percentile,
                                            positive_activation=positive_activations_temp)

        quantized_modules[layer_name] = new_layer
        return new_layer

    def replace_module(module, parent_name=''):
        for name, sub_module in module.named_children():
            # Construct the absolute name of the sub_module
            if parent_name:
                abs_name = f"{parent_name}.{name}"
            else:
                abs_name = name

            if isinstance(sub_module, (nn.Conv2d, nn.Linear)):
                module._modules[name] = replace_layer(sub_module, abs_name)
            else:
                replace_module(sub_module, parent_name=abs_name)

    replace_module(model)

    return model, quantized_modules

