"""
Psi_G survival factor computation.

Computes the G-expectation survival probability factor that appears
in the stochastic orbital integral formula.
"""

import numpy as np


def psi_G(sigma: float, t: float, dim_g: float = 3.0) -> float:
    """Psi_G(x) = G-expectation of indicator that |G-Gaussian| <= x."""
    if sigma == 0:
        return 1.0
    return np.exp(-0.5 * sigma**2 * t * dim_g)


def survival_table(sigmas, ts, dim_g=3.0):
    print(f"{'sigma':>8} {'t':>6} {'Psi_G':>12}")
    print("-" * 30)
    for sigma in sigmas:
        for t in ts:
            print(f"{sigma:>8.3f} {t:>6.1f} {psi_G(sigma, t, dim_g):>12.6f}")


if __name__ == "__main__":
    sigmas = [0.0, 0.01, 0.05, 0.1, 0.2, 0.5]
    ts = [0.5, 1.0, 2.0]
    survival_table(sigmas, ts)
