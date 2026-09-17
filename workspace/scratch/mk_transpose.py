#!/usr/bin/env python3
"""Rewrite gen.py so the bf16 weights are stored [out][in] instead of [in][out],
and so a matmul piece gives one output column to a whole wavefront.

The two go together and neither is worth anything alone.

With [in][out] and a lane per column, one load instruction's 64 lanes ask for
`cols` adjacent bf16 (8 of them, 16 bytes) in each of `klanes` different rows.
That is eight 128-byte lines fetched to use 128 bytes. Transposing alone does
not fix it -- it just makes the 16 bytes run along `i` instead of `j`.

With [out][in] *and* one column per wave, the 64 lanes of an instruction ask
for `i = lid, lid+1, ... lid+63` of a single row: one full line, every byte
used. The reduction split is then the whole wave, so the fold is the plain
wave_reduce butterfly and there is no cross-wave combine at all -- the LDS
round trip and its two barriers go away, and so does the 64-slot walk that
round four measured as costing more than the arithmetic it was combining.
"""
import re, sys

src = open(sys.argv[1]).read()


def sub1(old, new):
    global src
    assert src.count(old) == 1, f"{src.count(old)} matches for {old[:70]!r}"
    src = src.replace(old, new)


# ---- 1. the bf16 weight types, transposed -------------------------------
for old, new in (
    ('WQTB = f"memref<{layers}x{dim}x{qkvo}xbf16>"',
     'WQTB = f"memref<{layers}x{qkvo}x{dim}xbf16>"'),
    ('WTB = f"memref<{layers}x{qw}x{dim}xbf16>"',
     'WTB = f"memref<{layers}x{dim}x{qw}xbf16>"'),
    ('WGTB = f"memref<{layers}x{dim}x{2 * inter}xbf16>"',
     'WGTB = f"memref<{layers}x{2 * inter}x{dim}xbf16>"'),
    ('WDTB = f"memref<{layers}x{inter}x{dim}xbf16>"',
     'WDTB = f"memref<{layers}x{dim}x{inter}xbf16>"'),
    ('LMTB = f"memref<{dim}x{vocab}xbf16>"',
     'LMTB = f"memref<{vocab}x{dim}xbf16>"'),
):
    sub1(old, new)

# ---- 2. the host-side narrowing writes the transpose ---------------------
for old, new in (
    ("memref.store %b, %WqkvB[%l, %i, %j] : {WQTB}",
     "memref.store %b, %WqkvB[%l, %j, %i] : {WQTB}"),
    ("memref.store %b, %WoB[%l, %i, %j] : {WTB}",
     "memref.store %b, %WoB[%l, %j, %i] : {WTB}"),
    ("memref.store %b, %WguB[%l, %i, %j] : {WGTB}",
     "memref.store %b, %WguB[%l, %j, %i] : {WGTB}"),
    ("memref.store %b, %WdB[%l, %i, %j] : {WDTB}",
     "memref.store %b, %WdB[%l, %j, %i] : {WDTB}"),
    ("memref.store %b, %WlmB[%i, %j] : {LMTB}",
     "memref.store %b, %WlmB[%j, %i] : {LMTB}"),
):
    sub1(old, new)

# ---- 3. the host reference reads it back the same way --------------------
for old, new in (
    ("memref.load %WqkvB[%l, %i, %n] : {WQTB}",
     "memref.load %WqkvB[%l, %n, %i] : {WQTB}"),
    ("memref.load %WoB[%l, %i, %j] : {WTB}",
     "memref.load %WoB[%l, %j, %i] : {WTB}"),
    ("memref.load %WguB[%l, %i, %p] : {WGTB}",
     "memref.load %WguB[%l, %p, %i] : {WGTB}"),
    ("memref.load %WdB[%l, %p, %j] : {WDTB}",
     "memref.load %WdB[%l, %j, %p] : {WDTB}"),
    ("memref.load %WlmB[%i, %v] : {LMTB}",
     "memref.load %WlmB[%v, %i] : {LMTB}"),
):
    sub1(old, new)

# ---- 4. the device lm head ----------------------------------------------
sub1("%wb = memref.load %swlm[%i, %v] : {LMTB}",
     "%wb = memref.load %swlm[%v, %i] : {LMTB}")

# ---- 5. matmul_stage, single-wave path ----------------------------------
sub1("""                  %a = scf.for %i = %c0_s to {red_c} step %c1_s
                      iter_args(%sacc = %fzero_s) -> (f32) {{
                    %lv = memref.load {lhs}[%m, %i] : {lhsty}
                    %wb = memref.load {wmat}[%L{l}, %i, %j]{ntw} : {wty}""",
     """                  %a = scf.for %i = %c0_s to {red_c} step %c1_s
                      iter_args(%sacc = %fzero_s) -> (f32) {{
                    %lv = memref.load {lhs}[%m, %i] : {lhsty}
                    %wb = memref.load {wmat}[%L{l}, %j, %i]{ntw} : {wty}""")

# ---- 6. matmul_stage, multi-wave path: one column per wave ---------------
start = src.index("        # With more than one wave the columns alone cannot keep them busy")
end = src.index('}}""", lanes="block")', start) + len('}}""", lanes="block")')
src = src[:start] + '''        # One output column per wave, and the wave's 64 lanes split the
        # reduction. That is the only lane-to-address map that reads a whole
        # cache line: the weights are [out][in], so for a fixed column the
        # reduction index is the contiguous axis, and lanes lid..lid+63 of one
        # instruction are 64 adjacent bf16 -- exactly the 128 bytes the fetch
        # brings back. The previous map gave a lane a column and put `klanes`
        # different rows in one instruction, which fetched eight lines and used
        # an eighth of each.
        #
        # It also deletes the combine. A column belongs to one wave outright,
        # so folding the lanes is the plain wave_reduce butterfly and nothing
        # crosses waves: no LDS slots, no two barriers per column block, and
        # none of the 64-slot walk that round four measured as costing more
        # than the arithmetic it was combining.
        #
        # The column loop counts blocks rather than striding, so every wave
        # runs the same number of iterations; columns past the end are computed
        # on a clamped index and thrown away, which keeps every load in bounds.
        nblk = (slice_num + waves - 1) // waves
        return strided_stage(l, stage, ev, "%ctasks", "%ntasks_t", f"""                %j0 = arith.muli %ix, {slice_c} : index
                %cnblk{l}_{stage} = arith.constant {nblk} : index
                %cslast{l}_{stage} = arith.constant {slice_num - 1} : index
                scf.for %jb = %c0_s to %cnblk{l}_{stage} step %c1_s {{
                  %jbo = arith.muli %jb, %cwaves : index
                  %jj = arith.addi %jbo, %wid : index
                  %jok = arith.cmpi ult, %jj, {slice_c} : index
                  %jcl = arith.minsi %jj, %cslast{l}_{stage} : index
                  %j = arith.addi %j0, %jcl : index
                  %part = scf.for %i = %lid to {red_c} step %nlane
                      iter_args(%sacc = %fzero_s) -> (f32) {{
                    %lv = memref.load {lhs}[%m, %i] : {lhsty}
                    %wb = memref.load {wmat}[%L{l}, %j, %i]{ntw} : {wty}
                    %wv = arith.extf %wb : bf16 to f32
                    %mp = arith.mulf %lv, %wv : f32
                    %s2 = arith.addf %sacc, %mp : f32
                    scf.yield %s2 : f32
                  }}
{wave_reduce("%part", "%a", "arith.addf", f"mm{l}_{stage}", 18)}
                  %wr = arith.andi %jok, %isL0 : i1
                  scf.if %wr {{
                    %j2 = arith.addi %j0, %jj : index{store_blk}
                  }}
                }}""", lanes="block")''' + src[end:]

open(sys.argv[2], "w").write(src)
print("wrote", sys.argv[2])
