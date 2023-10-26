import torch.nn.functional as F
from torch.nn import Parameter
from quant.quant_module import QuantModule

FULL_PRECISION_BITS = 16


class QuantLinear(QuantModule):
    def __init__(self, layer, weight_bit=8, activation_bit=8,
                 act_percentile=0, weight_percentile=0, positive_activation=False):
        super(QuantLinear, self).__init__(layer, weight_bit, activation_bit,
                                          act_percentile, weight_percentile, positive_activation)

        self.weight = Parameter(layer.weight.data.clone())

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
        linear_out = F.linear(quantized_x, weight=quantized_w, bias=self.bias)

        return linear_out


class MultiQuantLinear(QuantLinear):
    def __init__(self, layer, weight_bits=[4, 8], percentages=[0.5, 0.5], activation_bit=4,
                 act_percentile=0, positive_activation=False):
        super(MultiQuantLinear, self).__init__(layer, weight_bits[0], activation_bit,
                                               act_percentile, 0, positive_activation)

        assert len(weight_bits) == len(percentages), "The length of weight_bits and percentages should be the same"
        assert sum(percentages) == 1.0, "Sum of percentages should be 1"

        self.weight_bits = weight_bits
        self.percentages = percentages
        self.weight_percentiles = self._precalculate_weight_percentiles()

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
        for i in range(len(self.weight_bits)):
            segment_size, start, end = self._get_segment_info(i, total_weights, current_index)
            if segment_size > 0:  # skip if the segment size is zero
                w_slice = self.weight[start:end]
                self.weight_bit = self.weight_bits[i]  # Update weight_bit for _quantize_weight
                weight_percentiles[i] = self._get_optimal_percentile(w_slice, self._quantize_weight)
            current_index = end
        return weight_percentiles

    def forward(self, x):
        if not self.profiled:
            self.profile(x)

        quantized_w = self.slice_and_quantize_weights(self.weight_bits)
        if self.activation_bit > 0:
            quantized_x = self._quantize_activation(x, self.act_percentile)
        else:
            quantized_x = x
        linear_out = F.linear(quantized_x, weight=quantized_w, bias=self.bias)
        return linear_out

    def get_memory_cost(self, include_bias: bool = False) -> float:
        weight_bits = sum((w_bit * p * self.weight.numel() for w_bit, p in zip(self.weight_bits, self.percentages)))
        bias_bits = (self.bias.numel() if include_bias else 0) * FULL_PRECISION_BITS

        total_bits = weight_bits + bias_bits
        total_bytes = total_bits / 8
        total_mib = total_bytes / (1024 * 1024)

        return total_mib
