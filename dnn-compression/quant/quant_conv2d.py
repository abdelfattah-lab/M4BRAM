import torch
import torch.nn.functional as F
from torch.nn import Parameter
from quant.quant_module import QuantModule

FULL_PRECISION_BITS = 16


class QuantConv2D(QuantModule):
    def __init__(self, layer, weight_bit=8, activation_bit=8,
                 act_percentile=0, weight_percentile=0, positive_activation=False):
        super(QuantConv2D, self).__init__(layer, weight_bit, activation_bit,
                                          act_percentile, weight_percentile, positive_activation)

        self.weight = Parameter(layer.weight.data.clone())
        self.padding = layer.padding
        self.stride = layer.stride
        self.dilation = layer.dilation
        self.groups = layer.groups

    def __repr__(self):
        return '{}(weight_bit={}, activation_bit={}, act_percentile={}, weight_percentile={}, positive_activations={})'.format(
            self.__class__.__name__,
            self.weight_bit,
            self.activation_bit,
            self.act_percentile,
            self.weight_percentile,
            self.positive_activations
        )

    def forward(self, x):
        if not self.profiled:
            self.profile(x)

        quantized_x, quantized_w = self._quantize_input_and_weights(x)
        out = F.conv2d(quantized_x, quantized_w, self.bias, self.stride, self.padding, self.dilation, self.groups)

        return out


class MultiQuantConv2D(QuantConv2D):
    def __init__(self, layer, weight_bits=[8, 4], percentages=[0.5, 0.5], activation_bit=4,
                 act_percentile=0, positive_activation=False, permute_optimize=False):
        super(MultiQuantConv2D, self).__init__(layer, weight_bits[0], activation_bit,
                                               act_percentile, 0, positive_activation)

        assert len(weight_bits) <= 2, "weight_bits can have a maximum size of two"
        assert weight_bits == sorted(weight_bits, reverse=True), "weight_bits should be in decreasing order"

        self.weight_bits = weight_bits
        self.percentages = percentages
        self.permute_optimize = permute_optimize

        # Calculate permutation masks if permute_optimize is enabled
        if self.permute_optimize:
            device = self.weight.device
            self.permutation_indices = torch.arange(self.weight.shape[0]).long().to(device)
            self.inverse_permutation_indices = self.permutation_indices.clone()
            self._calculate_permutation_masks()

        self.weight_percentiles = self._precalculate_weight_percentiles()

    def _calculate_permutation_masks(self):
        # The lowest bitwidth
        lowest_bitwidth = self.weight_bits[-1]

        # The number of channels to permute to the front
        num_channels_to_permute = int(self.percentages[0] * self.weight.shape[0])

        # Set the weight_bit to the lowest bitwidth for quantization
        self.weight_bit = lowest_bitwidth

        # Quantize the weight to the lowest bitwidth
        # Chicken and egg problem with percentiles, so we set it to 1.0
        quantized_weight = self._quantize_weight(self.weight, weight_percentile=1.0)

        # Compute the quantization error for each channel
        quant_error = (self.weight - quantized_weight).pow(2).mean(dim=(1, 2, 3))

        # Find the channels with the highest error
        _, high_error_channels = torch.topk(quant_error, num_channels_to_permute)

        # Create the permutation indices
        self.permutation_indices[:num_channels_to_permute] = high_error_channels

        # Create a mask to exclude high error channels
        mask = torch.ones(self.weight.shape[0], dtype=bool).to(self.weight.device)
        mask[high_error_channels] = 0
        self.permutation_indices[num_channels_to_permute:] = torch.arange(self.weight.shape[0]).to(self.weight.device)[
            mask]

        # Create the inverse permutation indices
        _, self.inverse_permutation_indices = self.permutation_indices.sort()

    def __repr__(self):
        return '{}(weight_bits={}, percentages={}, activation_bit={}, act_percentile={}, weight_percentiles={}, positive_activations={})'.format(
            self.__class__.__name__,
            self.weight_bits,
            self.percentages,
            self.activation_bit,
            self.act_percentile,
            self.weight_percentiles,
            self.positive_activations
        )

    def _precalculate_weight_percentiles(self):
        weight_percentiles = [0] * len(self.weight_bits)
        total_weights = self.weight.shape[0]
        current_index = 0

        # Permute weights if permute_optimize is enabled
        if self.permute_optimize:
            original_weights = self.weight.data.clone()
            self.weight.data = self.weight.data.index_select(0, self.permutation_indices)

        for i in range(len(self.weight_bits)):
            segment_size, start, end = self._get_segment_info(i, total_weights, current_index)
            if segment_size > 0:  # skip if the segment size is zero
                w_slice = self.weight[start:end]
                self.weight_bit = self.weight_bits[i]  # Update weight_bit for _quantize_weight
                weight_percentiles[i] = self._get_optimal_percentile(w_slice, self._quantize_weight)
            current_index = end

        # Revert permutation if permute_optimize is enabled
        if self.permute_optimize:
            self.weight.data = original_weights

        return weight_percentiles

    def forward(self, x):
        if not self.profiled:
            self.profile(x)

        if self.permute_optimize:
            self.weight.data = self.weight.data.index_select(0, self.permutation_indices)
        quantized_w = self.slice_and_quantize_weights(self.weight_bits)
        if self.permute_optimize:
            self.weight.data = self.weight.data.index_select(0, self.inverse_permutation_indices)
            quantized_w = quantized_w.index_select(0, self.inverse_permutation_indices)

        if self.activation_bit > 0:
            quantized_x = self._quantize_activation(x, self.act_percentile)
        else:
            quantized_x = x
        out = F.conv2d(quantized_x, quantized_w, self.bias, self.stride, self.padding, self.dilation, self.groups)
        return out

    def get_memory_cost(self, include_bias: bool = False) -> float:
        weight_bits = sum((w_bit * p * self.weight.numel() for w_bit, p in zip(self.weight_bits, self.percentages)))
        bias_bits = (self.bias.numel() if include_bias else 0) * FULL_PRECISION_BITS

        total_bits = weight_bits + bias_bits
        total_bytes = total_bits / 8
        total_mib = total_bytes / (1024 * 1024)

        return total_mib
