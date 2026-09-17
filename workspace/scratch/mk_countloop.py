#!/usr/bin/env python3
"""Rewrite the matmul reduction loop so its trip count is a literal.

The inner loop compiles to thirteen instructions for one multiply-add:

    global_load_ushort v5, v[38:39], off
    global_load_dword  v33, v[40:41], off
    v_lshl_add_u64     v[42:43], v[42:43], 0, 64      <- induction variable
    v_cmp_lt_u64       vcc, s[38:39], v[42:43]        <- bound test
    v_lshl_add_u64     v[38:39], v[38:39], 0, s[34:35] <- weight address
    v_lshl_add_u64     v[40:41], v[40:41], 0, s[36:37] <- activation address
    ...
    v_mul_f32 / v_add_f32

Three of those thirteen are 64-bit address arithmetic and one is a 64-bit
compare, and none of it is the arithmetic. Round four measured "two thirds of
the body is neither load" and this is what that two thirds is.

It is shaped this way because the loop is written `for i = lid to N step 64`.
`lid` is dynamic, so LLVM cannot prove the trip count is N/64 -- it cannot even
prove the loop runs once -- so it will not unroll, and every address has to be
recomputed from a 64-bit induction variable. Written as `for k = 0 to N/64`
with `i = k*64 + lid`, the trip count is a literal, the loop unrolls, and the
addresses become a base plus a constant `offset:` field on the load.

Only applied where the wave divides the reduction exactly; otherwise the
strided form is left alone, because the alternative is a bound test per
iteration, which is the instruction this is trying to remove.
"""
import sys

src = open(sys.argv[1]).read()


def sub1(old, new):
    global src
    assert src.count(old) == 1, f"{src.count(old)} matches for {old[:70]!r}"
    src = src.replace(old, new)


# matmul_stage needs the reduction length as a number, not just as the name of
# the constant that holds it.
sub1("""    def matmul_stage(l, stage, ev, out, outty, lhs, lhsty, wmat, wty,
                     slice_c, red_c, slice_num, residual=None):""",
     """    def matmul_stage(l, stage, ev, out, outty, lhs, lhsty, wmat, wty,
                     slice_c, red_c, slice_num, red_n, residual=None):""")
for a, b in (('"%csliceQ", "%cdim_s", slice_q))', '"%csliceQ", "%cdim_s", slice_q, dim))'),
             ('"%csliceD", "%cqw_s", slice_d))', '"%csliceD", "%cqw_s", slice_d, qw))'),
             ('"%cslice2I", "%cdim_s", slice_2i))', '"%cslice2I", "%cdim_s", slice_2i, dim))'),
             ('"%csliceD", "%cinter_s", slice_d, residual="%sxa"))',
              '"%csliceD", "%cinter_s", slice_d, inter, residual="%sxa"))')):
    sub1(a, b)

# The two multi-wave forms, whichever one this generator has.
TR = """                  %part = scf.for %i = %lid to {red_c} step %nlane
                      iter_args(%sacc = %fzero_s) -> (f32) {{"""
TR_NEW = """                  %part = scf.for %kk = %c0_s to %cnk{l}_{stage} step %c1_s
                      iter_args(%sacc = %fzero_s) -> (f32) {{
                    %ko = arith.muli %kk, %nlane : index
                    %i = arith.addi %ko, %lid : index"""
HD = """                  %part0 = scf.for %i = %ksl{l}_{stage} to {red_c} step %cKS{l}_{stage}
                      iter_args(%sacc = %fzero_s) -> (f32) {{"""
HD_NEW = """                  %part0 = scf.for %kk = %c0_s to %cnk{l}_{stage} step %c1_s
                      iter_args(%sacc = %fzero_s) -> (f32) {{
                    %ko = arith.muli %kk, %cKS{l}_{stage} : index
                    %i = arith.addi %ko, %ksl{l}_{stage} : index"""

if TR in src:
    assert src.count(TR) == 1
    src = src.replace(TR, TR_NEW)
    split = "wave"
    sub1("                %cnblk{l}_{stage} = arith.constant {nblk} : index",
         "                %cnblk{l}_{stage} = arith.constant {nblk} : index\n"
         "                %cnk{l}_{stage} = arith.constant {red_n // wave} : index")
elif HD in src:
    assert src.count(HD) == 1
    src = src.replace(HD, HD_NEW)
    split = "waves * klanes"
    sub1("                %cnblk{l}_{stage} = arith.constant {nblk} : index",
         "                %cnblk{l}_{stage} = arith.constant {nblk} : index\n"
         "                %cnk{l}_{stage} = arith.constant {red_n // (waves * klanes)} : index")
    # cols/klanes are computed after the single-wave early return, and the
    # divisibility test needs them, so hoist them above it.
    blk = """        cols = 1
        while cols * 2 <= min(slice_num, wave):
            cols *= 2
        klanes = wave // cols
        ksteps = klanes.bit_length() - 1
        nblk = (slice_num + cols - 1) // cols
"""
    assert src.count(blk) == 1
    src = src.replace(blk, "")
    sub1("""        if waves == 1:
            return strided_stage(l, stage, ev, "%ctasks", "%ntasks_t",""",
         blk + """        if waves == 1:
            return strided_stage(l, stage, ev, "%ctasks", "%ntasks_t",""")
else:
    sys.exit("no recognisable multi-wave reduction loop")

# Fall back to the strided form when the split does not divide the reduction:
# a counted loop would then need a bound test per iteration, which is the
# instruction this is removing.
sub1("""        if waves == 1:
            return strided_stage(l, stage, ev, "%ctasks", "%ntasks_t",""",
     f"""        if waves == 1 or red_n % ({split}) != 0:
            return strided_stage(l, stage, ev, "%ctasks", "%ntasks_t",""")

open(sys.argv[2], "w").write(src)
print("wrote", sys.argv[2])
