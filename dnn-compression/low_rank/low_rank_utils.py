from typing import Dict, Tuple
import torch
from torch import nn
from low_rank.low_rank_linear import LowRankLinear


def low_rank_linearize_model(model: torch.nn.Module,
                             low_rank_ratio) -> Tuple[torch.nn.Module, Dict[str, torch.nn.Module]]:
    """Replace all nn.Linear layers within a given model with LowRankLinear layers, except the last one."""
    low_rank_linear_modules = {}
    last_linear_layer_encountered = False

    def replace_layer(layer, layer_name):
        nonlocal last_linear_layer_encountered
        if isinstance(layer, nn.Linear):
            if not last_linear_layer_encountered:
                # Check if this is the last linear layer
                last_linear_layer_encountered = not any(
                    isinstance(l, nn.Linear) for _, l in model.named_modules() if id(l) != id(layer))
            if last_linear_layer_encountered:
                # If it's the last linear layer, keep the layer as is
                return layer
            else:
                new_layer = LowRankLinear(layer, low_rank_ratio)
                low_rank_linear_modules[layer_name] = new_layer
                return new_layer
        else:
            return layer

    def replace_module(module, parent_name=''):
        for name, sub_module in module.named_children():
            # Construct the absolute name of the sub_module
            abs_name = f"{parent_name}.{name}" if parent_name else name

            if isinstance(sub_module, nn.Linear):
                module._modules[name] = replace_layer(sub_module, abs_name)
            else:
                replace_module(sub_module, parent_name=abs_name)

    replace_module(model)

    return model, low_rank_linear_modules
