from torch.nn import Module, Parameter
from quant.quant_operations import *

FULL_PRECISION_BITS = 16
NUM_PERCENTILE_STEPS = 25
MEGA = 10**6


class QuantModule(Module):
    def __init__(self, layer, weight_bit=8, activation_bit=8,
                 act_percentile=0, weight_percentile=0, positive_activations=False):
        super(QuantModule, self).__init__()
        self.weight_bit = weight_bit
        self.activation_bit = activation_bit
        self.quant_function = SymmetricQuantFunction.apply
        self.positive_quant_function = PositiveOnlyQuantFunction.apply
        self.act_percentile = act_percentile
        self.positive_activations = positive_activations
        self.weight_percentile = weight_percentile if weight_percentile > 0 else self._get_optimal_percentile(
            layer.weight, self._quantize_weight)
        try:
            self.bias = Parameter(layer.bias.data.clone())
        except AttributeError:
            self.bias = None
        self.profiled = False

    def profile(self, x):
        self.act_percentile = self._get_optimal_percentile(x, self._quantize_activation)
        self.profiled = True

    def _get_optimal_percentile(self, x, quant_function):
        """Get the optimal percentile for quantization."""
        num_steps = NUM_PERCENTILE_STEPS
        step_size = 1 / num_steps
        min_error = float('inf')
        optimal_percentile = 0

        for i in range(1, num_steps):
            current_percentile = i * step_size
            quantized_x = quant_function(x, current_percentile)

            # Calculate mean-squared error
            quantization_error = torch.mean((x - quantized_x) ** 2)
            if quantization_error < min_error:
                min_error = quantization_error
                optimal_percentile = current_percentile

        return optimal_percentile

    def __repr__(self):
        s = super(QuantModule, self).__repr__()
        s = ("(" + s + " weight_bit={}, activation_bit={}, "
                       "act_percentile={}, weight_percentile={})").format(
            self.weight_bit, self.activation_bit,
            self.act_percentile, self.weight_percentile)
        return s

    def _quantize_weight(self, weight, weight_percentile):
        w_abs_max = torch.abs(weight).max().expand(1)
        w_abs_max = weight_percentile * w_abs_max

        weight_scale = symmetric_linear_scale(self.weight_bit, w_abs_max)
        quantized_w = self.quant_function(weight, self.weight_bit, weight_scale) * weight_scale

        return quantized_w

    def _quantize_activation(self, x, act_percentile):
        x_abs_max = x.data.abs().max().view(1)
        x_abs_max = act_percentile * x_abs_max

        if self.positive_activations:
            act_scale = positive_linear_scale(self.activation_bit, x_abs_max)
            quantized_x = self.positive_quant_function(x, self.activation_bit, act_scale) * act_scale
        else:
            act_scale = symmetric_linear_scale(self.activation_bit, x_abs_max)
            quantized_x = self.quant_function(x, self.activation_bit, act_scale) * act_scale

        return quantized_x

    def _get_segment_info(self, i, total_weights, current_index):
        if i == len(self.weight_bits) - 1:  # For the last segment, ensure we go all the way to the end
            segment_size = total_weights - current_index
        else:
            segment_size = round(total_weights * self.percentages[i])
        start = current_index
        end = start + segment_size
        return segment_size, start, end

    def slice_and_quantize_weights(self, weight_bits):
        quantized_ws = []
        total_weights = self.weight.shape[0]
        current_index = 0
        for i in range(len(weight_bits)):
            segment_size, start, end = self._get_segment_info(i, total_weights, current_index)
            if segment_size == 0:  # skip if the segment size is zero
                continue
            w_slice = self.weight[start:end]
            self.weight_bit = weight_bits[i]  # Update weight_bit for _quantize_weight
            weight_percentile = self.weight_percentiles[i]
            quantized_w = self._quantize_weight(w_slice, weight_percentile)
            quantized_ws.append(quantized_w)
            current_index = end
        return torch.cat(quantized_ws, dim=0)

    def _quantize_input_and_weights(self, x):
        if self.activation_bit > 0:
            quantized_x = self._quantize_activation(x, self.act_percentile)
        else:
            quantized_x = x

        if self.weight_bit > 0:
            weight = self.weight.data.detach()
            quantized_w = self._quantize_weight(weight, self.weight_percentile)
        else:
            quantized_w = self.weight

        return quantized_x, quantized_w

    def forward(self, x):
        raise NotImplementedError

    def get_memory_cost(self, include_bias: bool = False) -> float:
        weight_bits = self.weight.numel() * self.weight_bit
        bias_bits = (self.bias.numel() if include_bias else 0) * FULL_PRECISION_BITS

        total_bits = weight_bits + bias_bits
        total_bytes = total_bits / 8
        total_mib = total_bytes / (1024 * 1024)

        return total_mib

    def get_compute_cost(self, include_bias: bool = False, bops_exponent: int = 2) -> int:
        raise NotImplementedError
