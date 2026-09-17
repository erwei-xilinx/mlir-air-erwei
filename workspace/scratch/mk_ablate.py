#!/usr/bin/env python3
"""Build a deliberately-wrong generator that removes exactly one cost.

usage: mk_ablate.py <in.py> <out.py> mm|lm|attn|norm

These produce WRONG ANSWERS by construction -- each shortens a reduction to
one step so the arithmetic disappears while the task decomposition, the stores,
the LDS traffic and the whole event protocol stay exactly where they were. Run
only under `bench.sh DIAG=1`, which skips the PASS requirement. Never ship one.

The point: the current stage breakdown was measured at a 24.0 ms control and
two of its lines have since been fixed. Everything ranked off it -- including
"matmul is 58%" -- is inferred by subtraction from a stale table.
"""
import sys

src = open(sys.argv[1]).read()
mode = sys.argv[3]


def sub(old, new, n=None):
    global src
    c = src.count(old)
    if n is not None:
        assert c == n, f"{c} matches (wanted {n}) for {old[:60]!r}"
    else:
        assert c >= 1, f"no match for {old[:60]!r}"
    src = src.replace(old, new)


if mode == "mm":
    # the four per-layer matmuls: single-wave and multi-wave reduction loops
    sub("""%a = scf.for %i = %c0_s to {red_c} step %c1_s""",
        """%a = scf.for %i = %c0_s to %c1_s step %c1_s""")
    sub("""%part0 = scf.for %i = %ksl{l}_{stage} to {red_c} step %cKS{l}_{stage}""",
        """%part0 = scf.for %i = %ksl{l}_{stage} to %c1_s step %cKS{l}_{stage}""")
elif mode == "lm":
    # the lm head GEMM only (a strided_stage, not matmul_stage)
    sub("""                  %a = scf.for %i = %c0_s to %cdim_s step %c1_s
                      iter_args(%sacc = %fzero_s) -> (f32) {{
                    %xv = memref.load %sr[%m, %i] : {AT}""",
        """                  %a = scf.for %i = %c0_s to %c1_s step %c1_s
                      iter_args(%sacc = %fzero_s) -> (f32) {{
                    %xv = memref.load %sr[%m, %i] : {AT}""", 1)
elif mode == "attn":
    # both attention reductions: the QK dot down the head, and the weighted V sum
    sub("""%dotp = scf.for %hdi = %lid to %chd_s step %nlane""",
        """%dotp = scf.for %hdi = %lid to %c1_s step %nlane""", 1)
    sub("""                  %a = scf.for %t = %c0_s to %curlen step %c1_s
                      iter_args(%sacc = %fzero_s) -> (f32) {{
                    %e = memref.load %ssc[%m, %ix, %t] : {SCT}""",
        """                  %a = scf.for %t = %c0_s to %c1_s step %c1_s
                      iter_args(%sacc = %fzero_s) -> (f32) {{
                    %e = memref.load %ssc[%m, %ix, %t] : {SCT}""", 1)
elif mode == "norm":
    # the three rmsnorms: sum-of-squares pass and the normalise pass
    for a, b in (("%sp{l} = scf.for %i = %tx_s to %cdim_s step %nthr",
                  "%sp{l} = scf.for %i = %tx_s to %c1_s step %nthr"),
                 ("%spa{l} = scf.for %i = %tx_s to %cdim_s step %nthr",
                  "%spa{l} = scf.for %i = %tx_s to %c1_s step %nthr"),
                 ("%fp = scf.for %i = %tx_s to %cdim_s step %nthr",
                  "%fp = scf.for %i = %tx_s to %c1_s step %nthr")):
        sub(a, b, 1)
else:
    sys.exit("mode must be mm|lm|attn|norm")

open(sys.argv[2], "w").write(src)
print("wrote", sys.argv[2], "mode", mode)
