import torch

from torch.autograd import Function


def symmetric_linear_scale(num_bits, x_abs_max):
    """
    Compute the scaling factor with the given quantization range for symmetric quantization.

    Parameters:
    ----------
    num_bits : int
        Number of bits for quantization.
    x_abs_max : tensor
        The absolute maximum value of the tensor with 1D shape representing the output channels
    """

    with torch.no_grad():
        n = 2 ** (num_bits - 1)
        scale = torch.clamp(x_abs_max, min=1e-8) / n

    return scale


class SymmetricQuantFunction(Function):
    """
    Class to quantize the given floating-point values using symmetric quantization with given range and bitwidth.
    """

    @staticmethod
    def forward(ctx, x, k, specified_scale=None):
        """
        x: floating point tensor to be quantized
        k: quantization bitwidth
        Note that the current implementation of SymmetricQuantFunction requires pre-calculated scaling factor.
        specified_scale: pre-calculated scaling factor for the tensor x
        """
        n = 2 ** (k - 1)

        if specified_scale is not None:
            scale = specified_scale
        else:
            raise ValueError("The SymmetricQuantFunction requires a pre-calculated scaling factor")

        new_quant_x = torch.round(1. / scale * x)
        new_quant_x = torch.clamp(new_quant_x, -n, n-1)

        ctx.scale = scale
        return new_quant_x

    @staticmethod
    def backward(ctx, grad_output):
        return grad_output.clone() / ctx.scale, None, None


def positive_linear_scale(num_bits, x_abs_max):
    """
    Compute the scaling factor with the given quantization range for positive-only quantization.

    Parameters:
    ----------
    num_bits : int
        Number of bits for quantization.
    x_abs_max : tensor
        The absolute maximum value of the tensor with 1D shape representing the output channels
    """

    with torch.no_grad():
        n = 2 ** num_bits
        scale = torch.clamp(x_abs_max, min=1e-8) / n

    return scale


class PositiveOnlyQuantFunction(Function):
    """
    Class to quantize the given floating-point values using symmetric quantization with given range and bitwidth.
    This is specifically for positive values (e.g., after ReLU activation).
    """

    @staticmethod
    def forward(ctx, x, k, specified_scale=None):
        """
        x: floating point tensor to be quantized
        k: quantization bitwidth
        Note that the current implementation of PositiveOnlyQuantFunction requires pre-calculated scaling factor.
        specified_scale: pre-calculated scaling factor for the tensor x
        """
        n = 2 ** k

        if specified_scale is not None:
            scale = specified_scale
        else:
            raise ValueError("The PositiveOnlyQuantFunction requires a pre-calculated scaling factor")

        new_quant_x = torch.round(1. / scale * x)
        new_quant_x = torch.clamp(new_quant_x, 0, n-1)

        ctx.scale = scale
        return new_quant_x

    @staticmethod
    def backward(ctx, grad_output):
        return grad_output.clone() / ctx.scale, None, None
