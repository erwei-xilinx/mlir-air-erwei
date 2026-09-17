#!/usr/bin/env python3
"""Transpose ONLY the lm head weight to [vocab][dim]. Nothing else.

Measured per operator on MI350X, ms/token: transposing every weight moved
lm_head 1.640 -> 0.313 and made all four layer matmuls worse (qkv +0.24,
gate_up +0.18, o_proj +0.15, down +0.11). The win and the losses have
different causes and only the win is worth keeping.

The lm head weight is 1024 x 151936 = 311 MB. Held [dim][vocab], walking the
reduction for one output column steps 151936 * 2 = 304 KB, so a single output
touches a thousand separate DRAM pages. Held [vocab][dim] each thread streams
one contiguous 2 KB row. The four layer matmuls are 2-6 MB and never had that
problem, so for them the transpose only costs the lane coalescing they had.
"""
import sys
src = open(sys.argv[1]).read()


def sub1(old, new):
    global src
    assert src.count(old) == 1, f"{src.count(old)} matches for {old[:60]!r}"
    src = src.replace(old, new)


sub1('LMTB = f"memref<{dim}x{vocab}xbf16>"',
     'LMTB = f"memref<{vocab}x{dim}xbf16>"')
sub1("memref.store %b, %WlmB[%i, %j] : {LMTB}",
     "memref.store %b, %WlmB[%j, %i] : {LMTB}")
sub1("memref.load %WlmB[%i, %v] : {LMTB}",
     "memref.load %WlmB[%v, %i] : {LMTB}")
sub1("%wb = memref.load %swlm[%i, %v] : {LMTB}",
     "%wb = memref.load %swlm[%v, %i] : {LMTB}")
open(sys.argv[2], "w").write(src)
print("wrote", sys.argv[2])
