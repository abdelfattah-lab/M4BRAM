import torch
from torch.nn import Module
from torch.nn.parameter import Parameter
import torch.nn.functional as F

FULL_PRECISION_BITS = 16


class LowRankLinear(Module):
    def __init__(self, layer, low_rank_ratio):
        super(LowRankLinear, self).__init__()

        # Perform SVD on the weight
        U, S, Vh = torch.linalg.svd(layer.weight.data, full_matrices=False)

        # Calculate the rank for low-rank approximation
        rank = min(U.shape[0], Vh.shape[0])
        low_rank = max(1, int(rank * low_rank_ratio))

        # Truncate the matrices based on the calculated rank
        U = U[:, :low_rank]
        S = S[:low_rank]
        Vh = Vh[:low_rank, :]

        self.U = Parameter(U @ torch.diag(S))
        self.V_transposed = Parameter(Vh)

    def forward(self, x):
        out = F.linear(x, self.V_transposed)
        out = F.linear(out, self.U)

        return out

    def get_memory_cost(self, include_bias: bool = False) -> float:
        U_bits = self.U.numel() * FULL_PRECISION_BITS
        V_transposed_bits = self.V_transposed.numel() * FULL_PRECISION_BITS

        total_bits = U_bits + V_transposed_bits
        total_bytes = total_bits / 8
        total_mib = total_bytes / (1024 * 1024)

        return total_mib
