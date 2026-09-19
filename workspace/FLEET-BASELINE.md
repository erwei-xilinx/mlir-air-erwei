# Fleet baseline: numbers, and what it takes to run it

## The one thing to read first

**Fleet runs. All three README modes, on MI350X, `rc=0`.** Getting there took
one fact: the pinned `composable_kernel` revision, which was in the clone the
whole time on a non-squashed branch. See "The dependency pin".

Two claims in earlier versions of this file were wrong and are corrected below:

- *"There are no pinned dependency revisions."* There are --
  `git fetch origin && git ls-tree origin/aid-local-weights-v2 deps/`.
- *"The CK problem is MI300X-specific; gfx950 builds clean."* It is not. The
  package builds, but the **megakernel is compiled at runtime by hipcc** and
  that failed identically on both platforms until the CK was right.

Fleet is still documented MI350-only -- README line 1, "AMD MI350 GPUs";
Hardware Requirements "gfx950 ... ROCm 7.0+"; `grep -i "mi300\|gfx942"` over
README/INSTALL/docs returns nothing. But the reason MI300X failed was the CK
revision, not the architecture, so that is now worth retrying.

## Numbers so far -- ALL FOUR MEASURED, 2026-09-16

Qwen3-0.6B, per decoded token. Fleet's own `demo/qwen3/demo.py` for the first
four rows; `--max-num-batched-tokens 1` makes every MPK iteration a single
token, so prefill and decode cost the same and the number is a true per-step
latency, comparable with the torch row.

| what | GPU | dtype | ms/token | vs torch |
|---|---|---|--:|--:|
| Fleet `mirage_mpk` | MI350X | bf16 | **2.431** | 4.3x faster |
| Fleet `fleet_msplit` | MI350X | bf16 | 2.556 | 4.1x faster |
| Fleet `fleet` M-tile | MI350X | bf16 | 2.591 | 4.0x faster |
| torch / HF eager | MI350X | bf16 | **10.48** | 1x |
| AIR, before this work | MI300X | f32 | 10 430 | 1 000x slower |
| AIR, **now** | MI350X | bf16 | **8.85** | 1.2x faster |
| AIR (as measured earlier) | MI350X | f32 | 28 700 | 2 740x slower |

The AIR row moved by **576x** on 2026-09-16/17; see "Closing the gap" below for
what did it and what did not. Read 18.1 as 18.1 +/- 1.5 -- see the correction
in "Measuring this at all"; the same snapshot also measured 19.6.

**The gap against Fleet, on consistent bases** (an earlier version of this line
divided the raw 18.1 by 2.431 and called the result like-for-like next to the
old *adjusted* 9.2x -- two different bases, which flattered the new number):

| basis | before | now |
|---|--:|--:|
| raw headline / Fleet 2.431 | 9.8x | **7.4x** (8.1x at the 19.6 control) |
| like-for-like: pure decode, on MI350X | 9.2x | **7.0x** (7.6x at 19.6) |

Like-for-like removes two confounds, both derived below: the headline averages
one 5-token prefill step with five decode steps (x0.879 to pure decode), and
Fleet's number is on MI350X where AIR is 1.07x slower. Net x0.94. **The 0.879
is carried over from the 23.9 measurement and has not been re-measured since
attention and rmsnorm changed the decode/prefill mix**, so the like-for-like
row is the weaker of the two. Either way this stretch is 1.3x.

The denominator has its own error bar: Fleet's 2.431 is a single sample, see
the caveat below. The 10 430 and the 153.0 are the same node
minutes apart, so they are comparable to each other; the older 6 370 in
previous versions of this table was a different session and is superseded.

torch was repeated three times: 10.420 / 10.275 / 10.515, spread 2.3%. An
earlier 16.52 for the same command is discarded -- its node occupancy was not
recorded and cannot be shown to be clean.

**Two results that do not match the README, both with a caveat I did not
resolve:**

1. *Both Fleet modes are 5-7% SLOWER than plain Mirage MPK here.* The README
   claims Fleet M-tile is 1.13x faster -- but on **Qwen3-8B**, a model 13x
   larger. Each of my three numbers is a single sample, and the node was
   taken over by other users' jobs before I could repeat them. **Unsettled.**
2. *AIR is 4.5x slower on MI350X than on MI300X*, which is the wrong
   direction. Five other jobs were on the node throughout. Also unsettled;
   the MI300X number is the more trustworthy of the two.

AIR's numbers come from the `--repeat` slope (intercept 132.4 s):
launch at 2 steps 82.4 s, at 6 steps 197.2 s, so 28.7 s per decode step.
Correctness held on gfx950: 28 layers, chain and an independent numpy Qwen3
both produce `12095,13,576,6722,315,15344` = " Paris. The capital of Italy".

## Where the AIR gap actually is: the gfx950 ISA diff

Both lowered to gfx950 assembly and compared. AIR via
`gpu-module-to-binary{format=isa}`, Fleet via `hipcc --cuda-device-only -S`.
Saved as `fleet-artifacts/megakernel/{air,fleet}.s`.

**Identical in both -- the scheduling and coherence layer is a faithful
reproduction, not an approximation:**

| | AIR | Fleet |
|---|--:|--:|
| `s_getreg_b32 HW_REG_XCC_ID` | 2 | 6 |
| `buffer_wbl2` | 40 | 410 |
| `buffer_inv` | 40 | 268 |

**Different -- and this is the whole gap:**

| | AIR | Fleet |
|---|--:|--:|
| `v_mfma_f32_16x16x32_bf16` | **0** | 64 |
| `ds_write_b128` / `ds_read_b128` | **0 / 0** | 94 / 130 |
| `s_barrier` | **0** | 36 |
| `v_cmp_eq_u32 vcc, 0, v0` (tid==0) | **57** | 6 |

The same matmul, side by side. Fleet (`fleet.s` near line 17496):

```
ds_write_b128 v29, v[92:95] offset:8816      ; stage the tile into LDS
s_barrier                                     ; whole workgroup
ds_read_b128  v[54:57], v169 offset:8688
v_mfma_f32_16x16x32_bf16 a[0:3], v[54:57], v[88:91], a[0:3]
```

AIR (`air.s`, `.LBB0_250`):

```
global_load_dword v13, v[30:31], off nt       ; one HBM access per weight element
global_load_dword v42, v[32:33], off offset:-4096 nt
v_mul_f32_e32 / v_add_f32_e32                 ; scalar, exec mask = 1 lane
```

MACs per instruction: Fleet `v_mfma_f32_16x16x32_bf16` = 16*16*32 = **8192**;
AIR `v_fma_f32` under a one-lane exec mask = **1**. That 8192x splits into
**64x** from the exec mask and **128x** from MFMA-vs-scalar. The measured
end-to-end gap (~2600x on MI300X) sits below that ceiling because the AIR
chain is memory-bound, not issue-bound.

**Ranked fix, and how to verify each without running the model:**

| | change | expected | ISA check |
|---|---|--:|---|
| 1 | move task bodies from `air.segment` into `air.herd` | ~64x | `v_cmp_eq_u32 vcc,0,v0` falls from 57 |
| 2 | stage tiles through LDS + `s_barrier` | cuts HBM traffic | `ds_read_b128`/`ds_write_b128` leave 0 |
| 3 | bf16 through the matrix core | ~128x | `v_mfma` leaves 0 |

Step 1 is a precondition: without multiple threads there is nothing to put in
LDS and MFMA is a wavefront-level instruction. **The three ISA counters are a
progress bar** -- recompile and count, two orders of magnitude faster than a
28-layer run.

One honest non-match: AIR emits 74 `global_load_dword ... nt`; Fleet emits
**0 in this batch-1 build** (its `nt` weight loads live in the
`gang_ksplit`/`gang_moe` paths, not compiled here). So AIR's `nt` use cannot
be said to agree with Fleet's -- there is nothing to compare against here.

## The GEMM artifact diff, loop for loop (2026-09-17)

Round one compared whole-file instruction counts, which mixes five stages
together. This compares the **GEMM inner loops themselves**. Tools:
`workspace/scratch/{gemmloops,mlp2,loops}.awk`. No GPU needed.

**First, is the comparison even valid?** Fleet's `persistent_kernel` has 353
inner loops. Exactly two are heavy, and they are the same loop emitted twice:
`.LBB5_1185` (line 17402) and its twin at 25035 -- 319 lines, 40 loads, 104
LDS ops, 32 MFMA. Every other loop is under 72 lines. The 48 `v_fmac_f32` in
the whole kernel occur in scattered *pairs* (elementwise, not a GEMM) and the
1174 `global_load_dwordx2` never cluster. **So there is no scalar GEMM path:
at batch 1 Fleet's linear layers go through the MFMA loop.**

| per GEMM inner-loop iteration | Fleet | AIR head | AIR trc |
|---|--:|--:|--:|
| instructions | 317 | 14 | 119 |
| math | 32x `v_mfma_f32_16x16x32_bf16` | 1 mul + 1 add | 16 mul + 16 add |
| raw MACs per wave | 262 144 | 64 | 1 024 |
| **useful MACs at M=1** | **16 384** | **64** | **1 024** |
| loads | 40 `buffer_load_dwordx4` | 1 ushort + 1 dword | 16 + 16 |
| bytes per load per lane | 16 | 2 / 4 | 2 / 4 |
| **max loads outstanding** | **20** | **2** | **32** |
| **bytes in flight per wave** | **20 480** | **384** | **6 144** |
| LDS ops / barriers | 104 / 8 | 0 / 0 | 0 / 0 |
| 64-bit address ops per MAC | **0** | 6 | 0.44 |
| instructions per useful MAC | 0.0193 | 0.219 (**11.3x**) | 0.116 (**6.0x**) |

Taken on the same target: `fleet.s` is gfx950 and AIR was recompiled to gfx950
(`runs/head.950.s`, `runs/trc.950.s`) to rule out an ISA-version artifact. The
numbers are identical to the gfx942 build, because AIR emits no MFMA either
way.

### The three differences, ranked by what they are worth

**1. Memory in flight -- 53x, and it is the whole story.** Neither kernel is
issue-bound (Fleet is at ~0.1% of the matrix core, AIR at 0.04% of the vector
units) and neither is bandwidth-bound (5.6% and 1.1% of HBM). Both are
latency-bound, and for a latency-bound kernel Little's law says throughput is
just bytes-in-flight over latency. Fleet's loop waits on `vmcnt(15)`,
`vmcnt(8)`, `vmcnt(7)` -- it deliberately keeps 7 to 15 loads outstanding, which
is software pipelining. AIR's issues two loads and waits for both. **20 480
bytes in flight against 384.**

That also says the measured 7.5x end-to-end gap is *smaller* than the artifact
difference, which is what you would expect when caches absorb part of it.

**2. Load width -- 8x.** Fleet reads through a buffer resource descriptor,
`buffer_load_dwordx4`, 16 bytes a lane. AIR emits **zero `buffer_load`** in any
variant: flat/global loads of `ushort`, 2 bytes a lane. Same traffic, eight
times the instructions, and eight times fewer bytes per unit of latency.

**3. Addressing -- 32-bit versus 64-bit.** Fleet's loop has *no* 64-bit
arithmetic: 25 `v_add_u32` and 8 `v_lshl_add_u32`, because a buffer descriptor
takes a 32-bit voffset. AIR spends six 64-bit ops per MAC (three
`v_lshl_add_u64`, one `v_cmp_lt_u64`, two 64-bit scalar ops) because MLIR
`index` lowers to i64 and the trip count is unprovable. This is the one the
counted loop already fixes: 6 per MAC down to 0.44.

### And the honest observation about Fleet

**At M=1 Fleet wastes 15/16 of its matrix core.**
`v_mfma_f32_16x16x32_bf16` computes a 16-row output tile; at batch 1 one row is
real. So the headline 827 MACs per instruction is **51.7 useful** MACs per
instruction. The 104 LDS ops and 8 barriers per iteration stage tiles for an A
reuse that does not exist at M=1 either. Fleet's batch-1 GEMM looks like a
prefill kernel being run at batch 1 -- which agrees with the separate finding
below that MFMA at M=1 is *worse* per useful MAC than a scalar FMA.

Two consequences. The bar is not the 180x that raw MACs-per-instruction
suggests: on useful work it is **11.3x**, and `trc` already takes it to 6.0x.
And copying Fleet's kernel exactly is not the target -- the target is its
memory pipelining, not its matrix core.

### What each loop actually waits for, from first principles

**The mechanism.** AMD GPUs have no register scoreboard for memory. A load
issues, the wave keeps running, and the *program* must insert `s_waitcnt`
before reading the destination. Separate counters: `vmcnt` (vector memory),
`lgkmcnt` (LDS, scalar, message), `expcnt`. Within a counter, returns are
**in order** on CDNA -- so `s_waitcnt vmcnt(N)` ("at most N of mine are still
outstanding") is equivalent to "the oldest issued-minus-N have landed". That
turns a wait into a *positional* statement: to consume the k-th oldest
outstanding load, wait `vmcnt(outstanding - k)`. Everything below follows from
that one property.

**Fleet, per GEMM iteration (measured, `.LBB5_1185`):**

1. Issue **20 `buffer_load_dwordx4` back to back** -- 20 KB in flight per wave.
2. One `s_waitcnt vmcnt(0)`. **One memory latency, for all twenty loads.**
3. Ten `ds_write_b128` stage the tile.
4. `s_waitcnt lgkmcnt(0)` + `s_barrier` -- publish the tile to the workgroup.
5. `ds_read_b128` interleaved with `v_mfma`, separated by *partial*
   `lgkmcnt(2)`, `lgkmcnt(3)`, `lgkmcnt(4)` waits: issue the next LDS reads
   while older ones are outstanding, and wait only far enough to have the
   operand the next MFMA needs.
6. A second `vmcnt(0)` later in the body. So two full VMEM drains per
   iteration -- but per **16 384 useful MACs**.

An honest detail: the `vmcnt(18), vmcnt(17) ... vmcnt(10)` sequence that reads
like textbook pipelining is **dead** -- there is no load between it and the
`vmcnt(0)` above it, so the counts are already satisfied. Fleet's global-memory
strategy is not "consume one load at a time while others fly"; it is "batch
twenty, pay one latency". The real pipelining in this loop is on the *LDS*
side, where the partial `lgkmcnt` waits are live.

**Why waiting only for that is sufficient.** The correctness requirement for a
load-to-use is "this destination register is written before it is read". It is
*not* "the memory system is quiescent". Inside the loop the weights are
read-only, the loads target distinct registers, and the only producer/consumer
relationship is within the workgroup through LDS -- which `lgkmcnt(0)` +
`s_barrier` covers exactly. There is nothing else any wave could be waiting to
observe, so any stronger wait is waiting for work whose result nobody reads.

**AIR, per GEMM iteration (measured, verbatim):**

    global_load_ushort v13, v[30:31], off     ; weight
    global_load_dword  v15, v[32:33], off     ; activation
    v_lshl_add_u64 x3 ; v_cmp_lt_u64 ; s_or_b64
    s_waitcnt vmcnt(1)      <- consume v13 with v15 still in flight
    v_lshlrev_b32 v13, 16, v13
    s_waitcnt vmcnt(0)      <- consume v15: FULL DRAIN
    v_mul_f32 / v_add_f32
    s_andn2_b64 exec, exec, s[44:45] ; s_cbranch_execnz

The waits are *locally* optimal -- `vmcnt(1)` is a genuine positional wait and
LLVM did the best it could with what it was given. The redundancy is not a
wasted instruction, it is a **wasted ordering constraint**: with only two loads
in flight, `vmcnt(0)` is reached every iteration, so the next iteration's loads
are not issued until this one's have landed *and been consumed*. Every MAC pays
a serialized HBM round trip.

| full VMEM drains per useful MAC | |
|---|--:|
| Fleet | 1 per 8 192 |
| AIR head | 1 per 64 -- **128x more often** |
| AIR trc | 1 per 1 024 -- 8x more often |

`trc`'s wait sequence is `vmcnt(24)`, then `16, 15, 14 ... 8`, then one
`vmcnt(0)`: the counted loop reproduces Fleet's shape, and its descending waits
are *live* because the sixteen loads really are issued before any is consumed.

**Three causes, in order:**

1. **Nothing to overlap with.** Pipelining needs more than one iteration's
   loads in the body, which needs unrolling, which needs a provable trip count.
   `for i = lid to N step 64` with dynamic `lid` has none -- LLVM cannot even
   prove one iteration runs. Same root cause as the 64-bit addressing.
2. **A loop-carried accumulator.** `v_add_f32 v3, v3, v13` serialises the
   arithmetic too. Fleet's 32 MFMAs write several independent accumulators.
3. **Divergent loop control.** `s_andn2_b64 exec, exec` / `s_cbranch_execnz` --
   a uniform loop compiled as a per-lane one, because the trip count looks
   lane-dependent. Blocks further transformation.

**A hypothesis I tested and killed.** I expected AIR's `gpu.barrier` to lower
to `s_waitcnt vmcnt(0) lgkmcnt(0)`, which would make every one of its 76
barriers throw away all memory parallelism. It does not: the `s_waitcnt`
preceding every `s_barrier` is `lgkmcnt(0)` in **both** kernels, 31 in AIR and
36 in Fleet. AIR's barriers are LDS-scoped, exactly like Fleet's, and are not
the redundant sync. The redundancy is entirely inside the GEMM loop.

### What to do, in order

1. **Vector loads.** `vector<8xbf16>` on the weights takes bytes-per-load from
   2 to 16 a lane and closes the residual 3.3x in bytes-in-flight. Needs the
   `[out][in]` layout, which is why that change comes first.
2. **Ship the counted loop** if it measures, for the 6-per-MAC to 0.44 of
   64-bit addressing and the 2-to-32 loads outstanding.
3. **`buffer_load` instead of flat.** Needs a buffer descriptor in the
   lowering; worth it for the 32-bit addressing alone.
4. **MFMA last, and only with a K-split or multi-token M.** At M=1 it is a
   regression.

## Round six: measure the operators, 16.78 -> 8.85 ms/token (2026-09-17)

**Everything before this section that ranks stages by cost was inferred by
subtraction and several of its conclusions were wrong.** `gen.py --timers`
now reads `s_memrealtime` at the top, middle and bottom of every stage and
accumulates body and rendezvous-wait per stage class, from one workgroup so
the counter cannot overflow and one wall-clock window is not counted `workers`
times. One run prints all fourteen operators. Off by default; the IR with it
off is byte-identical.

### What it said, and what that cost me

| | ms/token | |
|---|--:|---|
| start | 16.78 | |
| lm head weight held `[vocab][dim]` | 15.42 | -1.36 |
| chiplet queues probed: 16 -> 8 | 10.57 | **-4.85** |
| a drained queue sets a flag instead of being claimed again | 8.85 | **-1.70** |

**1.90x, and all three are scheduling, not kernel quality.** Nothing to do with
MFMA, memory layout, load width or any of the three artifact differences the
ISA diff found. Every strided stage, on every workgroup, did a device-scope
atomic claim against all sixteen chiplet queues to discover that fifteen of
them had nothing -- 1176 times per decode.

The lm head is the one layout win and it is a DRAM-page effect, not coalescing:
that weight is 1024 x 151936 = 311 MB, and held `[dim][vocab]` one output
column steps 304 KB per reduction step, so a single output touches a thousand
separate pages. Held `[vocab][dim]` each thread streams a contiguous 2 KB row.
**Only the lm head.** Transposing every weight was measured too and all four
layer matmuls got worse for it (qkv +0.24, gate_up +0.18, o_proj +0.15, down
+0.11) -- those are 2-6 MB and never had the page problem.

### Two hypotheses measured and rejected, before the one that worked

- **The broadcast barriers.** Dropping one of the broadcast's two barriers:
  10.530 vs 10.594. Nothing.
- **False sharing on the queue counters.** A 128-byte line each: 10.536 ->
  10.663, *worse*.

That is what left the atomic itself, and the flag.

### The control that is in every one of these tables

`single_stage` claims once, from one queue, and never probes. `strided_stage`
probes every queue. Across all three changes **the single-task stages did not
move** -- rmsnorm 0.120 -> 0.113 -> 0.127, final_norm and argmax_reduce flat --
while every probing stage fell in proportion to how often it runs. The
hypothesis and its control arrive in the same run.

### Where the 8.85 ms is now

| operator | ms/token | % |
|---|--:|--:|
| gate_up | 2.41 | 27% |
| qkv | 1.72 | 19% |
| down | 1.56 | 18% |
| o_proj | 1.21 | 14% |
| swiglu | 0.46 | 5% |
| attention | 0.41 | 5% |
| rope + kv_append | 0.38 | 4% |
| lm_head | 0.27 | 3% |
| everything else | 0.44 | 5% |

The four layer matmuls are 6.90 of 8.85, **78%**. The rendezvous wait across
all stages was 11.5% before this round -- the stages are not bounded by a
straggler, the bodies are the cost.

### And the end-to-end harness cannot see any of this

`bench.sh` takes the slope of wall clock against launch count, over a ~60 s
fixed cost that wanders by ~3 s. Divided by 299 launches that is **+/-1.7
ms/token**, not the +/-0.5 claimed for HI=300. The same build measured 19.8 and
16.6 on consecutive rounds. **Every ranking taken with it below 3 ms is void,
including "all five GEMM variants are slower"** -- the per-operator timer says
the transposed variant was in fact 0.58 ms *better*, and that all of its win
was the lm head.

Use `--timers` to rank a change. Use `bench.sh` only to confirm a large one.

### The task-count sweep, and what it rules out

`tasks` is how many pieces a stage splits into, and `workers` the workgroups.
Measured per operator, all at 8 waves:

| ms/token | 32 | 64 | 128 |
|---|--:|--:|--:|
| total | 21.52 | 12.72 | **8.87** |
| gate_up | 7.33 | 4.08 | 2.41 |
| qkv | 5.04 | 2.65 | 1.72 |
| o_proj | 2.64 | 1.64 | **1.21** |

**The four layer matmuls are bound by how many workgroups there are and by
nothing else.** In particular not by cache-line utilisation, which varies the
other way: a piece is `width/tasks` columns and the lanes spread across them,
so o_proj uses 16 bytes of every 128-byte line at 128 tasks and 64 bytes at 32
-- and 128 is twice as fast. That kills the "widen the slice" idea outright.

**A 256 column stood here and it has been withdrawn. It was read off a run
that printed `FAIL: total differences = 150878` in the same output as the
numbers.** There is no reading to defend: a program that computed the wrong
logits is not a measurement of how long it takes to compute the right ones.
The conclusion drawn from it -- "`single_stage` is the serialisation point,
`rmsnorm.mlp` goes 0.18 to 2.03, so the rendezvous is what caps the worker
count" -- was drawn from a broken program and does not survive it. What was
actually wrong is below.

The rule this breaks is the one in "Measuring this at all": a number is not a
measurement until the run that produced it says PASS. `run_qwen.sh` prints that
line; the sweep script grepped for `body|wait|PASS|FAIL` and the FAIL went into
the log where it was not read. Grep for the verdict *first*, or do not record
the row.

### What was actually wrong: a workgroup-divergent barrier

Bisected on MI350X, 8 waves, one step, `run_qwen.sh` against the independent
numpy reference. Each cell is that configuration's `total differences`:

| tasks | workers | 1 layer | 28 layers |
|--:|--:|---|---|
| 128 | 128 | pass | pass |
| 256 | 128 | pass | pass |
| 512 | 128 | pass | **pass** |
| 128 | 256 | pass | **FAIL** 318k / 758k |
| 256 | 256 | pass | **FAIL** 697k / 757k / 693k |
| 512 | 512 | hangs | -- |

Read it in this order:

* **The slicing is innocent.** 512 pieces over 128 workgroups is right for 28
  layers. Every failure has 256 workgroups and the piece count does not matter.
* **The arithmetic is innocent.** 256/128 and 256/256 split the reduction
  identically, so they sum in the same order; one is exact and the other is
  not.
* **It is a race, not a logic bug.** The same configuration twice gives 697k
  and 757k differences. And it needs depth -- 2 and 4 layers pass, 8 fails --
  which is what "needs enough trials" looks like.
* **The scheduler's accounting is intact even when the answer is wrong.**
  `device-scope event flushes = 1592` in the failing runs, which is exactly
  199 stages x 8 dies. Every piece was claimed exactly once. They were
  *computed* wrong.

The cause is the drained-queue flag, the -1.70 ms win of `378fa02e`. Its
comment read:

> Uniform load: every thread reads the same word and gets the same answer

Every thread reads the same *address*. It does not get the same answer: another
workgroup is setting that word from 0 to 1 while this one reads it, so two
waves can land either side of the write. And the branch they then disagree on
contains the claim broadcast -- which past one wave is LDS and **two
`gpu.barrier`s**. So the waves of one workgroup met different barriers, and the
claim a wave read out of LDS was some other wave's. The piece is still counted
exactly once, which is why the flush total stayed perfect while the values went
wrong.

Proof, not inference: pinning `%drained` to false and changing nothing else
turned 256/256 at 28 layers from three failures out of three into three passes
out of three, and 128/256 with it.

**The general shape of this, worth keeping:** in a workgroup wider than one
wave, a value another workgroup can write concurrently is not workgroup-uniform
no matter how uniform its address is, and branching on one around a barrier is
a bug even when every thread is reading the same location. Anything read from
the scheduler's shared state has to be read by one thread and broadcast, or not
branched on.

### The fix: the search for a piece belongs to one thread

The flag was worth 1.70 ms and the fix keeps it. What changed is who is allowed
to look at it. `strided_stage` used to be a loop over the dies with a claim loop
inside it, and the flag test sat in the outer loop where every thread evaluated
it. Now there is one loop, and the whole search -- the flag reads, the atomics,
the "this queue is empty now" store -- happens inside `scf.if %isLead`. What
comes out is one broadcast of two numbers, the queue and the piece, and a
sentinel piece index when the scan found nothing so that every wave reaches the
same out-of-range test on the same path.

Nothing outside the lead thread reads a flag, so nothing outside it can branch
on one, so no two waves can meet different barriers. It is uniform by
construction rather than by an argument about addresses.

It also broadcasts less. Before, every die probe that came up empty cost a
claim, a broadcast and two barriers to discover it; now the whole scan is one
broadcast, so a workgroup pays one per piece it actually gets plus one to find
out there are none left, instead of one per die it looks at.

### What 256 workers actually does, now that it computes the right answer

Per operator, 28 layers, 6 steps, device ticks at 100 MHz. Both columns PASS.

| ticks | 128/128 | 256/256 | |
|---|--:|--:|---|
| **total** | **5 413 164** | 5 825 788 | **+7.6% worse** |
| gate_up | 1 275 640 | 1 100 076 | -13.8% |
| qkv | 978 104 | 896 044 | -8.4% |
| lm_head | 159 072 | 113 240 | -29% |
| down | 885 772 | 887 188 | flat |
| o_proj | 694 592 | 747 784 | +7.7% |
| swiglu | 236 052 | 547 052 | **+132%** |
| rope+kv_append | 126 304 | 240 040 | **+90%** |
| attention | 128 292 | 239 460 | **+87%** |
| rmsnorm.attn body | 29 888 | 60 120 | +101% |
| rmsnorm.mlp *wait* | 71 756 | 63 564 | **-11%** |

512 workers does not run at all: 512 workgroups of 8 waves is 4096 waves, more
than the part holds, and a persistent megakernel whose workgroups are not all
resident hangs rather than running slowly. So 256 is the top of this axis.

**The rendezvous is not what caps the worker count.** The rmsnorm waits get
*shorter* at 256, not longer. What the withdrawn table read as "`single_stage`
serialises" was the broken program.

What actually stops it is the opposite of a serialisation point -- it is the
stages that have nothing like enough pieces to go round:

* **`attention` and `rope+kv_append` split by head, so they have `heads` = 16
  pieces however many workgroups there are.** At 128 workers 112 workgroups
  already have nothing to do but probe eight queues and wait; at 256 it is 240.
  That is the whole +90%.
* **`swiglu` gives each piece `inter/tasks` columns and each workgroup 512
  threads**: 24 columns at 128 tasks, 12 at 256. So 24 of 512 threads work and
  488 stride past the end, and halving the piece halves the occupancy again.
* The small bodies also double because two workgroups now share a CU, so
  latency-bound work gets half the issue slots.

Those four stages are **10% of the time in their bodies and 7% more in their
waits** at the shipping config, and essentially all of it is thread and piece
mapping rather than memory. That is the next target, and it is a more ordinary
piece of work than chasing the 64x to the memory floor: split attention by
(head, key block) so it has pieces to give out, and give swiglu a piece worth
512 threads.

### Running two of these at once: the generator is shared mutable state

`run_qwen.sh` and `run.sh` resolve the generator as `$SCRIPT_DIR/gen.py`, and
the established way to test a variant is to copy it over that file. Two jobs
doing that in the same tree edit each other's program: a second job started
here swapped its variant in seven minutes into the first one's run, and
everything the first job measured after that timestamp was measuring the other
job's generator. It was caught by the file timestamp, not by any result looking
wrong -- which is the problem with it.

Every job that swaps generators now copies the whole `megakernel_gen`
directory into its own run directory first and runs from there. Copying only
`gen.py` is not enough; `run_qwen.sh` also resolves `weights_loader.c`,
`weights.py` and `qwen3_ref.py` relative to itself.

### The other thing the ISA says: the rendezvous is asymmetric

Not the cause of the above, but real and still open. The consumer side of every
rendezvous ends:

    gpu.barrier
    llvm.fence syncscope("") acquire      // every thread

and the producer side is:

    gpu.barrier                           // and nothing else
    scf.if %isLead { atomicrmw ... release }

`gpu.barrier` is `s_barrier`. In the emitted ISA every one of them is preceded
by at most `s_waitcnt lgkmcnt(0)` and most carry no `s_waitcnt` at all; none
carries `vmcnt`. So it orders LDS and control flow and says nothing about
whether a wave's global stores have left the wave -- while `vmcnt` is per wave,
so the lead thread's release drains the lead thread's wave and no other. A
workgroup can announce "my piece is readable" with seven waves' stores in
flight.

Closing it with an agent-scope release fence in every thread works and **costs
17.5% of the device ticks** at 128/128 -- rope and attention both double --
because agent scope on this part writes L2 back per wave. It did not change any
of the failures above, which is how we know it is not that bug. A
workgroup-scope fence should emit the `s_waitcnt vmcnt(0)` without the
writeback, and the lead thread's system-scope release already does the L2
flush; that is the version to measure. Not yet done.

### Where the gap against Fleet stands, 2026-09-18

**CORRECTED 2026-09-18. The figures below that came from summing the
per-operator timer are lower bounds, and the true one is about 5.5 ms/token.**
Three instruments agree on it: the in-kernel clock across the whole worker body
says 32.8 ms a launch, `bench.sh` at HI=4000 says 33.9, and the per-operator
table -- once its windows were made to close -- says 32.7. Before that the
table said 19.3, and "The instrument accounted for 59% of the program" is how
the other 41% was found and what it turned out to be.

| | ms/token | x Fleet | x the memory floor |
|---|--:|--:|--:|
| memory floor | 0.14 | 0.06x | 1x |
| **Fleet mirage_mpk** | **2.452** | 1x | 18x |
| **AIR now, whole launch** | **3.68** | **1.50x** | **26x** |
| AIR before the acquire fence was taken once | 5.44 | 2.22x | 39x |
| AIR now, sum of the operators, windows closed | 5.44 | 2.22x | 39x |
| AIR now, sum of the operators, as first measured | 3.20 | 1.30x | 23x |
| AIR at the start of the day, end to end | ~8.9 | 3.6x | 64x |
| torch eager | 10.42 | 4.3x | 75x |

So the day is about **8.9 -> 5.5 ms/token, 1.6x**, not the 2.8x the operator
sums imply. The operator tables are still the right instrument for *ranking*
two builds -- every prediction made from them that had an independent mechanism
behind it came true -- but their absolute totals are not the program and must
not be reported as it.

Four changes, in this order.

1. The claim-path fix cost 0.84% and bought correctness, not speed -- the 8.85
   that stood before it was a real number from a run that passed, but the
   program it measured had a live race that happened to win at 128 workers.
2. `--reduce-unroll 8`: **1.61x**, bit-identical output. 3.6x -> 2.25x.
3. The static claim: **1.60x**. 2.25x -> 1.39x.
4. A per-stage piece count for the dim-wide matmuls: **1.06x**. -> **1.30x**.

Both of the wins came from the same kind of place, and neither was visible in
the operator ranking. The ranking says which operator is expensive; it does not
say what the operator is spending its time on, and in both cases the answer was
something the stage was doing around the work rather than the work.

The 8.9 is the timer sum, not a fresh `bench.sh`: 5 413 164 ticks at 100 MHz is
54.1 ms for six steps, 9.0 ms a step, which agrees with the 8.85 `bench.sh`
measured to well within that instrument's +/- 1.7. There is no point running
`bench.sh` to resolve a 0.84% change.

**Where the 3.6x lives.** Ticks at 128/128, 28 layers, 6 steps, out of
5 413 164:

| | body | wait | share |
|---|--:|--:|--:|
| **four layer matmuls** | 3 834 108 | 392 048 | **78%** |
| swiglu | 236 052 | 44 168 | 5.2% |
| attention | 128 292 | 127 484 | 4.7% |
| rope+kv_append | 126 304 | 91 220 | 4.0% |
| two rmsnorms | 59 264 | 134 740 | 3.6% |
| lm head + argmax | 213 880 | 9 816 | 4.1% |

So the small stages are 17.5% all told. **Even deleting every one of them
outright leaves 7.3 ms/token, still 3x Fleet.** The matmuls are the gap and
everything else is rounding.

### What the matmuls are actually doing, in cycles

gate_up reads 1024 x 6144 bf16 per layer. At 128 tasks a workgroup's piece is
48 columns, its 512 threads split 32 ways across columns and 16 ways across the
reduction, so **a thread loads 96 weights a layer, 2688 over the 28**. That
takes 2.13 ms/token, which at ~2.1 GHz is 4.47M cycles, or

    1660 cycles per weight, against 14 instructions of work

Two waves share a SIMD, so call it 830 cycles a weight per wave slot. **That is
one full memory latency per loop iteration, overlapped with nothing.** The loop
asks for one weight, waits for it, multiplies, and asks for the next.

Little's law says the same thing from the other side. A wave has 128 bytes
outstanding -- 64 lanes x 2 bytes, two half-wave cache lines -- and 1024 waves
gives 131 KB in flight device-wide. Holding 8 TB/s open across a ~1 us latency
needs about 8 MB. We are 60x short, and the achieved 165 GB/s on gate_up is
2% of peak, which is the same 60x.

Fleet's inner loop, from its ISA: 40 `buffer_load_dwordx4` per iteration with
20 outstanding, **20 480 bytes in flight per wave against our 128**.

That is the whole difference, and it is not a workgroup-count problem -- 256
workers made the total worse and 512 does not fit. It is bytes in flight per
wave. `--reduce-unroll` is the first lever at it: issue N weight loads before
waiting on the first. The accumulate chain is untouched, so the result is bit
for bit identical and any difference in the output is a bug.

An earlier note recorded "unrolling does nothing, 8.857 -> 8.807". That was
read off `bench.sh` at +/- 1.7 ms/token resolution, which is the instrument
that has now mis-ranked five separate things. Re-measured per operator, it does
rather a lot.

### Unrolling the reduction: 1.61x, bit for bit

Device ticks at 128/128, 28 layers, 6 steps. Every row printed
`total differences = 0`, which is the point of keeping the accumulate a single
chain in the original order -- the unrolled loop is not an approximation of the
rolled one, it is the same sum.

| ticks | u=1 | u=2 | u=4 | **u=8** | u=16 |
|---|--:|--:|--:|--:|--:|
| gate_up | 1 295 212 | 1 024 016 | 659 812 | **523 452** | 1 258 980 |
| qkv | 997 092 | 706 276 | 521 388 | **429 936** | 966 232 |
| down | 898 004 | 652 004 | 509 536 | **497 552** | 887 676 |
| o_proj | 702 868 | 529 124 | 433 176 | **417 876** | 691 428 |
| **whole model** | **5 413 164** | | | **3 358 532** | 5 404 172 |

**1.61x on the whole model, 2.47x on gate_up.** In ms/token that is about 8.9
to **5.5**, and the gap against Fleet goes **3.6x to 2.25x**.

16 gives it all back and lands on 1's numbers: sixteen weights and sixteen
activations in flight is more registers than the wave has, so the loads stop
being issued back to back. 8 is the knee.

This is the lever the cycle arithmetic pointed at and it moved almost exactly
as predicted. The loop was paying one memory latency per iteration; issuing
eight loads before the first `s_waitcnt` pays one latency per eight.

### What is left after it

At u=8 the shape of the problem has changed -- the matmuls are 63% rather than
78%, and the small stages are a third of the time:

| | body+wait | share |
|---|--:|--:|
| four layer matmuls | 2 127 712 | 63% |
| swiglu | 292 348 | 8.7% |
| attention | 263 004 | 7.8% |
| rope+kv_append | 226 088 | 6.7% |
| two rmsnorms | 209 904 | 6.3% |
| lm head | 161 012 | 4.8% |

Three things worth doing next, in order of how well the measurement supports
them:

1. **lm\_head did not move** (159 932 -> 158 516): it has its own reduction
   loop in `strided_stage`, not `matmul_stage`, and `dot_loop` was never wired
   into it. Its weight is indexed `[v][i]` with `i` fastest, so a lane reads
   contiguously rather than across lanes -- a different pattern, worth its own
   measurement. 4.8%.
2. **swiglu is not compute, it is a rendezvous.** It is elementwise over 3072
   values with 65 536 threads available, so its 8.7% is almost entirely the
   stage existing. Fleet fuses SiLU into gate\_up (`USE_FUSED_SILU=1`). Doing
   the same means slicing the 6144-wide gate/up output by the *pair* index so
   one piece holds both `gate[j]` and `up[j]`, and the stage disappears.
3. **attention and rope have `heads` = 16 pieces** however many workgroups
   exist, so 112 of 128 workgroups sit at the rendezvous. Splitting attention
   by (head, key block) with a flash-style combine is the real fix and the
   largest piece of work of the three.

Of those three, 1 was measured and is a null, 2 turned out to be mostly a
symptom of something else, and 3 is still open -- see below.

### The lm head unroll is a null, and the reason is worth more than the change

The same unroll wired into the lm head moved it from 159 364 ticks to 160 652,
which is nothing. Reverted.

The reason is the access pattern, and it is the same argument that explains the
win in the layer matmuls. In `matmul_stage` a wave's lanes sit across output
columns, so the eight loads a lane issues are eight *different* cache lines and
unrolling multiplies the lines in flight by eight. The lm head weight is
`[vocab][dim]` with the reduction index fastest, so one lane walks a row
contiguously: its eight loads are eight bf16 out of the *same* 64-byte line, one
transaction either way, and there is nothing to overlap.

Which also says the lm head is not the thing to fix. At 159 000 ticks it moves
311 MB in 0.27 ms/token, which is **1.17 TB/s** -- against 404 GB/s for gate_up
after the unroll. It is by a wide margin the best-behaved stage here.

And it explains the falsified `[out][in]` experiment. That layout gives every
layer matmul the lm head's pattern, which is the faster one per lane -- but
gate_up has 6144 output columns to hand to 65 536 lanes, so nine lanes in ten
would have had nothing to do. The lm head gets away with it because it has
151 936.

### The task queue cost 1.60x

`swiglu` was spending 14.7 us per layer step on about a thousandth of `qkv`'s
arithmetic. Nothing about that is the elementwise operation. What a stage was
paying for was the protocol that hands out its pieces: one successful claim
atomic, one failing one, and two LDS broadcasts with four barriers, on a
counter sixteen workgroups a chiplet are hammering. The atomics serialise, so
the last workgroup on a chiplet waits behind all the others to be told which
single piece is its.

The queue was never needed to decide which piece is whose. The chiplet
reporting protocol already gives a workgroup its rank among the workgroups on
its chiplet and how many there are -- both workgroup-uniform, both already paid
for -- and the pieces of chiplet d are exactly the indices congruent to d. So
rank r takes every mycnt-th of them, and the partition is disjoint and complete
by arithmetic. The stage that cannot be split gets it too: rather than every
workgroup racing for a counter to find out which of them runs the rmsnorm, it
is the first workgroup of the first chiplet, which every thread knows already.

One-layer build: 14 queue atomics to 0, 81 `gpu.barrier` to 43, event protocol
untouched at 44 `llvm.atomicrmw` either way.

| ticks, 128/128 | queue | static |
|---|--:|--:|
| **whole model** | **3 300 436** | **2 051 136** |
| swiglu | 242 264 | 52 364 |
| qkv | 425 096 | 171 572 |
| o_proj | 416 708 | 186 192 |
| gate_up | 518 412 | 248 212 |
| down | 496 312 | 281 508 |
| rmsnorm.attn *wait* | 61 136 | **7 664** |

The waits are where it reads most clearly. What the other 127 workgroups were
waiting through at an rmsnorm was never the reduction over 1024 values -- it was
the queue.

**What it gives up.** Stealing, and with it the queue's tolerance for a chiplet
the dispatcher skipped: that chiplet's pieces are never computed, the stage's
event never reaches its total, and the launch hangs. So `dies` goes from "at
least the chiplet count" to "exactly it". `workers >= dies` is checkable at
generation time and is asserted; the rest is a property of the part and is why
`dies` defaults to 8. `--dynamic-claim` puts the queue back and is still
21/21.

There is a way to drop the precondition: partition by the `air.launch` index
rather than by chiplet rank. Piece `ix` would go to workgroup `ix % workers`,
which exists by construction, and since the dispatcher round-robins workgroups
across chiplets that lands piece `ix` on chiplet `ix % 8` -- the same mapping
this has, with no assumption. Untried; the open question is whether the launch
induction variable is reachable inside `air.segment`, whose captures are
explicit.

### What is left at 3.42 ms/token

| | body+wait | share |
|---|--:|--:|
| four layer matmuls | 1 194 392 | 58% |
| attention | 186 240 | 9.1% |
| lm head | 172 044 | 8.4% |
| two rmsnorms | 166 444 | 8.1% |
| rope+kv_append | 162 988 | 7.9% |
| argmax partial | 76 608 | 3.7% |
| swiglu | 80 188 | 3.9% |

`attention` and `rope+kv_append` are now the largest things that are not
matmuls, and they are the two with `heads` = 16 pieces to hand to 128
workgroups.

### The piece count belongs to the stage, not to the model

Re-running the task sweep now that a piece is cheap to get says three different
things want three different counts. Bodies at 32/64/128/256:

|  | 32 | 64 | 128 | 256 |
|---|--:|--:|--:|--:|
| gate_up | 761 036 | 464 392 | **246 988** | 297 740 |
| qkv | 622 300 | 332 236 | **172 216** | 206 064 |
| down | 416 168 | **242 288** | 281 456 | 322 164 |
| o_proj | 283 160 | **175 468** | 184 324 | 257 108 |
| lm_head | 600 372 | 310 400 | 168 628 | **118 664** |

`o_proj` and `down` write a dim-wide output, so a piece at 128 is `dim/128` = 8
columns. The lanes spread across those 8, which is **16 bytes of every 64-byte
line**; the other 48 are fetched and discarded. They run at about 375 GB/s
against gate_up and qkv at 830, and they want the slice wider even at the price
of half the workgroups. Giving them `tasks/2`:

| ticks, body+wait | before | after | |
|---|--:|--:|---|
| down | 384 916 | 303 300 | -21% |
| o_proj | 255 876 | 223 316 | -13% |
| **whole model** | **2 027 708** | **1 918 576** | **-5.4%** |

**And the lm head row is a trap I walked into.** It says 256, so I gave the lm
head 256 pieces, and it got 11% *worse* -- 171 236 ticks to 190 700. The sweep
moves `tasks` and `workers` together, so that row measured 256 *workgroups*,
not 256 pieces. The lm head is the one stage already at about 1.17 TB/s: what
it wants is more of the machine, and two pieces of 594 columns instead of one
of 1187 is the same bytes with one more loop around them. Reverted.

The general form of that mistake is worth keeping: **a sweep that moves two
knobs together cannot tell you which one the operator responded to**, and every
row of this one moves both. The dim-wide rows survived because there is an
independent mechanism -- cache lines -- that predicts them; the lm head row had
none and was just read off.

### Non-temporal on the kv cache: a wash, with a 10% operator underneath

The kv cache reads were marked non-temporal. It is the one thing a decode step
reads again, and the whole cache is about a megabyte over 28 layers, so it
belongs in L2. The last loop of the attention body is a chain of `curlen`
*dependent* loads of it, which made that `curlen` memory round trips end to
end, per head, per layer, per step.

Removing it takes the attention body from 168 516 ticks to 151 560, **10%** --
and the model total does not move at all (2 036 876 to 2 042 044, inside the
spread). Attention's body is not what sets that stage's duration: workgroup 0
computes one of sixteen heads and then waits for the other fifteen either way.
Kept for the operator, not claimed for the model.

### The instrument accounted for 59% of the program

Everything in this file was ranked with the in-kernel `s_memrealtime` counters,
so it matters a great deal that they sum to 1 928 424 ticks on a launch that
takes 3 277 428.

The launch figure comes from two more clock reads bracketing the worker body,
and `bench.sh` independently agrees with it: **33.9 ms a launch against the
in-kernel 32.8**, once it is run at a repeat count where it can resolve
anything. It has been run at HI=100 throughout, which is 1.9 s of kernel
against a 60 s fixed cost that wanders +/- 3 s -- that is the whole story of
its +/- 1.7 ms/token and of the five things it mis-ranked. At HI=4000 it is
76 s of kernel against the same +/- 3 s. Its own repeatability there is still
+/- 0.3 ms/token: measured, by running the same build twice (5.6 and 5.9).

**The gap is not the instrument.** `--timers-total-only` keeps the two launch
reads and emits none of the 69 per-stage ones:

| WHOLE LAUNCH ticks | run 1 | run 2 | run 3 |
|---|--:|--:|--:|
| with the per-stage timers | 3 284 100 | 3 983 109 | 3 286 892 |
| without them | 3 254 368 | 3 259 220 | 3 259 644 |

**0.8%.** The clock reads are nearly free, and the windows they define simply
do not cover the stage. Between one stage's last read and the next stage's
first there is, in the emitted IR, nothing but the timer's own accumulate --
and that accumulate is the 0.8%. So the reads are not where the IR puts them.

**Only one of the two edges was anchored.** A stage's end read sits directly
after its `gpu.barrier` and `llvm.fence`, and the backend will not schedule
across those. Its start read, at the top of the next stage, has address
arithmetic on both sides and nothing to hold it, so it sinks into the body it
was meant to be timing. Every stage was measured from part-way through itself,
and the part before the read was attributed to nobody.

**The fix is to stop opening a second window.** Each stage now ends where the
next one begins, on the read that was already anchored. The classes telescope:
their sum is the last read minus the first, whatever the scheduler does with
anything in between, so drift can only move time from one class to its
neighbour. Measured, two runs of the same build, both PASS:

| | coverage | instrument cost |
|---|--:|--:|
| two reads a stage | 58.8% | 0.8% |
| one shared edge | **99.8%** (99.8% on the repeat) | 0.5% |

No class moves more than 3.1% between the two runs, so the table can now be
read class by class.

Three other explanations were tried first and all came back negative, which is
the only reason this one was looked for:

* the event protocol at **agent scope** instead of system: a wash;
* **one acquire fence per workgroup** instead of one per wave: 2.6% *worse*;
* the counters **in LDS** instead of global memory: 66% *worse*.

The third is what pointed here. An instrument that gets 66% slower when its
accumulator is moved to faster memory is not measuring what it claims to.

**What this changes.** Every share quoted anywhere above this line was a share
of 59% of the program, and every table taken before the fix under-reads each
stage by the same ~8.7 us. Rankings between two builds measured the same way
survive -- the three predictions in this file that had an independent mechanism
behind them (cache lines for the dim-wide matmuls, bytes-in-flight for the
unroll, atomics for the queue) all came true -- but no absolute number or share
from an unchained table means anything.

### What is left

Chained table, 28 layers, 128 workers, 6 steps, run twice. `us/inst` is per
stage instance: 168 of them a launch for a layer stage, 6 for an extra. The
`floor` column is what the class gained when the windows were closed, which is
the part of the stage that has nothing to do with what the stage computes.

| | body | wait | share | us/inst | floor us |
|---|--:|--:|--:|--:|--:|
| gate_up | 384 172 | 92 176 | 14.6% | 28.35 | 8.37 |
| down | 410 328 | 52 168 | 14.1% | 27.53 | 9.06 |
| o_proj | 343 584 | 40 084 | 11.7% | 22.84 | 9.35 |
| qkv | 309 408 | 39 688 | 10.7% | 20.78 | 8.32 |
| attention | 310 916 | 25 880 | 10.3% | 20.05 | 9.84 |
| rope+kv_append | 288 636 | 18 292 | 9.4% | 18.27 | 8.71 |
| rmsnorm.mlp | 217 004 | 12 096 | 7.0% | 13.64 | 8.62 |
| rmsnorm.attn | 207 324 | 11 796 | 6.7% | 13.04 | 8.10 |
| swiglu | 187 040 | 31 152 | 6.7% | 12.99 | 8.13 |
| lm_head | 173 648 | 4 268 | 5.4% | 296.53 | 4.58 |
| argmax_partial | 73 428 | 10 136 | 2.6% | 139.27 | 9.25 |
| argmax_reduce | 8 392 | 416 | 0.3% | 14.68 | 8.20 |
| final_norm | 7 420 | 428 | 0.2% | 13.08 | 8.27 |
| embed | 4 012 | 1 200 | 0.2% | 8.69 | -0.48 |
| **sum** | | | **99.8%** of 3 271 916 | | |

**The floor column is the finding.** It is the same number -- 8.1 to 9.8 us --
for a 12.6 MB matmul and for a 4 KB normalisation, for a stage inside the layer
loop and for one outside it. A stage costs about **8.7 us to exist**, and at
257 stage instances a step that is **2.23 of the 5.46 ms a token takes, 41%**.

This is the "per-stage floor" that was guessed at ~5 us from `final_norm` and
`argmax_reduce` before the instrument was fixed, then withdrawn as an artefact
of the missing 41%. It was not an artefact. It *was* the missing 41%, and it is
75% larger than the guess. Two consequences:

* The three small layer stages -- two rmsnorms and swiglu -- cost 13.0, 13.6
  and 13.0 us each, of which 8.1 to 8.6 is the floor. They move 4 KB. Nothing
  done *inside* them can matter. Splitting them across workgroups **cannot**
  pay either: it would take two stages where there is one, and a second
  stage-floor costs more than the whole reduction does.
* The only move that helps is removing the boundary -- folding the sum of
  squares into the matmul that produced the vector, the normalisation into the
  matmul that consumes it, and swiglu into `down`, which is what Fleet does.
  Three boundaries a layer at 8.7 us is 84 boundaries a step, 0.73 ms of the
  5.46: **13% for fusions that change no arithmetic**, plus the 4-5 us of body
  each of those stages spends on its own account.
* Fewer, bigger stages beats better-balanced ones. Nine stages a layer could be
  five or six, and six would be worth about 2.2 ms/token on its own.

### A stage boundary costs 12.40 us, measured without the timers

`--pad-stages N` adds N empty stages to every layer: same claim, same signal,
same rendezvous, no body. They produce 12095,13,576,6722,315,15344 like
everything else, so the launch clock against N is a line whose slope is what a
boundary costs -- with the per-stage timers switched off entirely, which is the
point. A table cannot check itself.

28 layers, 128 workers, 6 steps, REPEAT=20, whole-launch ticks:

| pads | ticks | stage instances a step |
|--:|--:|--:|
| 0 | 3 255 560 | 257 |
| 1 | 3 471 628 | 285 |
| 2 | 3 671 436 | 313 |
| 3 | 3 883 536 | 341 |

`launch = 3 257 980 + 208 374 x pads`, residuals -2419, +5274, -3290, +435 --
**0.15%**. A pad is 168 stage instances a launch, so a stage boundary is
**12.40 us**, and 257 of them a step is **3.19 of the 5.43 ms a token takes**.

That is larger than the chained table's 8.7 us and both are right: the table
only ever recovered the half of the boundary its windows had been missing, the
part between the previous stage's fence and this stage's first load. The
release, the atomics and the spin were already inside the old window, charged
to the stage, and invisible as overhead. 12.40 is the whole thing.

**What this means for the gap.** If the boundary is 3.19 ms/token then the work
-- every load of every weight, every FMA, the attention, the argmax -- is
2.24 ms/token, and Fleet's *entire* time for the same model is 2.452. AIR's
arithmetic and memory traffic are already at Fleet's level. The gap to Fleet,
all of it and then some, is the cost of the way stages meet.

Two levers, and they are independent:

* **Fewer boundaries.** Each stage removed from a layer is 208 374 ticks a
  launch, **0.35 ms/token**. Folding swiglu into gate_up (pair the gate and up
  column slices in the same piece and it costs no extra traffic at all, which
  is what Fleet does), and the two rmsnorms into their neighbours, is 9 stages
  a layer down to 6: **1.04 ms/token**, before counting the bodies that stop
  being separate stages.
* **A cheaper boundary.** 12.40 us is ~26 000 cycles for four atomics, two
  barriers, a `buffer_inv sc0 sc1` and a spin. If it can be brought to 3 us
  that is 2.4 ms/token, larger than every fusion together. `--pad-strip`
  measures which piece it is: a pad stage publishes nothing and nothing waits
  on its event, so pieces can be removed from one and the tokens stay right.

### What the boundary is made of, and the 1.48x that came out of it

Slopes of the launch clock against `--pad-stages`, each `--pad-strip` level
removing one more piece, every point run twice and the minimum taken:

| a pad stage contains | us/inst | the piece removed | us | share |
|---|--:|---|--:|--:|
| the whole boundary | 12.28 | | | |
| no acquire fence | 4.86 | the fence | **7.42** | **60.4%** |
| no rendezvous, spin or barrier | 2.14 | spin + barrier | 2.72 | 22.1% |
| no signal, no atomics | -0.02 | the four atomics | 2.17 | 17.6% |
| no claim | 0.08 | the claim | -0.10 | 0% |

A pad with no fence, no spin and no atomics is indistinguishable from no pad
at all -- -349 ticks on 3.25 M -- so the pieces account for the whole
boundary, and the claim, which two commits were spent on, is free.

The fence is `llvm.fence syncscope("") acquire`, which is `buffer_inv
sc0 sc1`, and it ran in **all eight waves of every workgroup at every stage**.
Taking it once, in the wave that already waits, inside the `scf.if` it waits
in and before the barrier that releases the other seven:

| | launch ticks | ms/token | x Fleet |
|---|--:|--:|--:|
| per wave | 3 265 096 | 5.44 | 2.22x |
| **once a workgroup** | **2 209 060** | **3.68** | **1.50x** |

**1.48x.** The decomposition predicted 1.67 ms/token for it and it delivered
1.75, which is the best check there is that the instrument is measuring the
program and not itself.

Why it is sound: every wave of a workgroup is on one CU and one XCD, so one
wave's invalidate empties the vector cache and the L2 all of them read
through, and the barrier orders the rest of the workgroup's loads after it. A
line refilled in between can only be fresh -- the producers wrote back past L2
before they signalled, so anyone fetching that address afterwards gets the new
value.

Why it is believed: this is exactly the shape `megakernel_gen_contend` exists
to catch, a workgroup whose waves disagree about memory, and that bug passed
3/3 at 128 workers and failed 3/3 at 256. So the suite 21/21, the contending
shape five more times at 256 workers with `total differences = 0` every time,
and the model at 256/256, 512/128, 128/128 and 64/64 all agreeing with numpy
token for token.

**Agent scope on that fence does nothing** -- 3 262 472 against a baseline of
3 265 096, and with `--acquire-once` already on, 2 215 288 against 2 214 204.
The old "a wash" was right, for the wrong instrument.

**What is left of the boundary**, re-measured on the build that takes the
fence once, same method, minimum of two runs a point:

| a pad stage contains | us/inst | the piece removed | us | share |
|---|--:|---|--:|--:|
| the whole boundary | 5.52 | | | |
| no acquire fence | 4.65 | the fence | 0.87 | 16% |
| and no spin, no barrier | 1.99 | spin + barrier | 2.65 | 48% |
| and no atomics | -0.09 | the four atomics | 2.09 | 38% |

Predicted 5.79 from the old ladder, measured 5.52, and each piece landed where
it was left: fence 0.87 against 7.42/8 = 0.93, spin 2.65 against 2.72, atomics
2.09 against 2.17. So the boundary is still **1.42 of the 3.68 ms a token
takes**, and it is now the rendezvous and the atomics rather than the fence.

A stage removed by fusion is worth 0.35 -> **0.49 ms/token** at the old
boundary price and 0.19 at the new one, so folding the two rmsnorms and swiglu
into their neighbours is now worth ~0.57 ms/token rather than 1.04. The
rendezvous itself is the bigger target.

### The per-class table on the current build

3.73 ms/token on the launch that produced it, classes summing to 99.9% of it.
`us/inst` is per stage instance: 168 a launch for a layer stage, 6 for an
extra, and about 5.5 of every one of them is the boundary.

| | body | wait | share | us/inst |
|---|--:|--:|--:|--:|
| gate_up | 271 644 | 93 304 | 16.3% | 21.72 |
| down | 290 528 | 55 064 | 15.5% | 20.57 |
| o_proj | 221 592 | 43 856 | 11.9% | 15.80 |
| qkv | 200 736 | 37 804 | 10.7% | 14.20 |
| attention | 199 744 | 22 496 | 9.9% | 13.23 |
| rope+kv_append | 177 600 | 17 076 | 8.7% | 11.59 |
| lm_head | 173 820 | 384 | 7.8% | 290.34 |
| rmsnorm.mlp | 104 736 | 11 656 | 5.2% | 6.93 |
| swiglu | 88 888 | 22 488 | 5.0% | 6.63 |
| rmsnorm.attn | 95 440 | 11 772 | 4.8% | 6.38 |
| argmax_partial | 71 008 | 7 352 | 3.5% | 130.60 |
| embed | 3 880 | 1 744 | 0.3% | 9.37 |
| final_norm | 3 448 | 412 | 0.2% | 6.43 |
| argmax_reduce | 4 192 | 440 | 0.2% | 7.72 |

The three small layer stages are 6.4 to 6.9 us each and about 5.5 of that is
the boundary, so what they compute costs around 1 us and there is nothing to
win inside them -- only in not having them.

### The launch clock is bimodal, and it is all in gate_up

About a third of launches come in **1.15 M ticks (11.5 ms, 35%) slow**. Eight
single launches, all PASS: seven at 3.276 to 3.290 M, agreeing to 0.4%, and one
at 4.421 M. With the windows closed the table can say where it went, and the
answer is one class:

| | fastest launch | slow launch | delta |
|---|--:|--:|--:|
| gate_up body | 386 488 | 1 515 631 | **+1 129 143** |
| every other class | | | under 20 000 |

gate_up reads the largest weight matrix in the layer, 12.6 MB, and in the slow
mode workgroup 0 spends 3.9x as long in it while nothing else moves. Not
diagnosed. Until it is, take the **minimum** of repeated launches, not the
mean: the fast mode is the program and the slow mode is something on top of
it. Not yet known whether it correlates with another job on the node.

### The number that reframes all of this

At batch one every weight is read exactly once per token. Qwen3-0.6B is ~553M
parameters, so 1.1 GB of bf16, and MI350X has ~8 TB/s:

    floor = 1.1 GB / 8 TB/s = 0.14 ms/token

| | ms/token | x off the memory floor |
|---|--:|--:|
| roofline | 0.14 | 1x |
| **Fleet mirage_mpk** | 2.452 | **18x** |
| **AIR now** | 8.85 | **64x** |
| torch eager | 10.42 | 75x |

**Fleet is not the ceiling and catching it is not the goal.** It is 18x off a
floor that a decode this small should be able to approach, and the remaining
3.6x to Fleet is a smaller number than the 18x neither of them has claimed.
Anything that gets AIR from 64x to 18x is worth more than anything that closes
the last 3.6x, and the two are probably the same work.

## Closing the gap: 10 430 -> 153 ms/token, 2026-09-16

Step 1 of the ranked fix above landed; steps 2 and 3 did not, and the reason
is that step 1 changed which thing is the limit. Commits on
`erwei/fix-gpu-conversion-passes`, tip `79791a4a`.

| | ms/token | note |
|---|--:|---|
| before | 10 430 | everything under `scf.if %isLead`, one lane in 64 |
| + task bodies on the whole wavefront | 217.4 | `230050fe` |
| + workers and tasks 32 -> 128 | **153.0** | `79791a4a` |
| Fleet, for scale | 2.431 | MI350X, bf16 |

**What step 1 actually needed.** The guard came off the bodies and went onto
the protocol. The claim and the signal stay on the lead lane, because the
scheduler counts workgroups -- the queue hands out one piece per workgroup and
the two-level flush compares its arrivals against `air.chiplet_dim_blocks` --
and the claim reaches the other 63 lanes through `rocdl.readfirstlane`, which
is sound only because `air.herd` is 1x1 and so the block is exactly one wave.
The matmuls, the embed gather, SwiGLU and the lm head then stride their output
loop from the lane id; the three rmsnorms and the attention softmax need a
cross-lane step and get a six-deep `gpu.shuffle` butterfly. `gpu.subgroup_reduce`
says that in one op but **nothing in the pipeline lowers it** -- the patterns
exist only behind `--test-gpu-subgroup-reduce-lowering`.

`v_cmp_eq_u32 vcc, 0, v0` went 50 -> 2, which is what the table above
predicted. But that counter saturates: it reads the same 2 whether one body is
spread or all of them, so it cannot tell you how far you got. What can:
putting a body back on the lead lane while keeping its strided loop leaves the
rest of every slice unwritten, and the host comparison says 383.

**Two things that were expected to matter and did not.**

*The poll loop.* Every stage boundary spun on an acquire load, which on gfx950
is `buffer_inv` -- the whole CU's vector cache, discarded, at full issue rate,
1512 times a launch. Fleet polls relaxed and fences once after the wait
(`persistent_kernel.cuh:944-966`) and backs off with `s_sleep` (:959). Making
AIR do the same measured **1.4% worse**: 221.9 / 219.6 against 217.4 / 217.5,
both changed runs above both unchanged ones. Reverted in `c63e34bf`. The
theory misses because at 32 workgroups on 304 CUs a workgroup has its CU to
itself, so there is no neighbour whose cache `buffer_inv` could be costing.
Worth redoing if occupancy ever gets high.

*Steps 2 and 3, for now.* After step 1 the chain sustains ~0.07% of the FMA
issue rate its waves could manage and ~0.2% of HBM bandwidth. Neither issue
nor bandwidth is the limit, so neither LDS staging nor MFMA is the next lever
-- **latency is**, and the fix for latency is more waves in flight.

**Occupancy is the current limit.** A stage has `tasks` pieces when a step
carries one token, so `tasks` bounds how many workgroups can be doing
anything, and each workgroup is one wavefront:

| workers / tasks | ms/token |
|---|--:|
| 32 / 32 | 227.0 |
| 64 / 64 | 179.1 |
| **128 / 128** | **153.0** |
| 256 / 128 | 261.1 |

The last row is the shape of the cost: a workgroup that finds no piece does
not exit, it spins on every remaining event for the rest of the launch. Keep
workers equal to tasks. 128 is this checkpoint's ceiling rather than an
optimum -- `tasks` has to divide every stage width and the vocabulary is
151936 = 128 * 1187.

**So the next lever is waves per workgroup, not MFMA.** A wider `air.herd`
(4x1 gives 256 threads, four waves) multiplies occupancy without needing more
pieces, and it is the same change that step 2 needs: with more than one wave
per block, `rocdl.readfirstlane` no longer reaches the whole block and the
claim has to be broadcast through LDS. That single change unlocks the LDS
staging of step 2 and the `s_barrier` that goes with it.

### Round two: occupancy, and three theories that lost first

At 153 ms/token the chain sustained 0.3% of HBM bandwidth and 0.07% of the
FMA issue rate its own waves could manage, so the limit was neither. Three
candidate explanations were each measured and each lost:

| theory | the evidence for it | measured |
|---|---|--:|
| acquire-per-poll invalidates L2 | `buffer_inv sc0 sc1` in every spin, 1512 spins a launch | 4% |
| claim atomics | 1024 contended cross-XCD returning atomics per stage, just to find the dies empty | ~0 |
| no-op pieces | a window of 5 decoding 1 token claims 5 pieces per piece of work | ~0 |

The peek-before-claim that removed 62% of the atomics changed nothing
measurable; so did cutting the pieces per stage by 5x. When two independent
ways of removing most of the atomics both do nothing, the atomics are not it.

**rocprofv3 answered it in one line.** `grid 8192, block 64`, 92 VGPRs:

```
kernel                        grid  block          ms  vgpr  sgpr   lds
chain_module                  8192     64      23.911    92   112     0
```

128 workgroups of one wavefront. MI300X holds 6080 wavefronts at 92 VGPRs.
**2.1% of the wave slots, on 42% of the CUs, one wave per CU** -- and at one
wave per CU there is nothing to hide a memory latency behind. That is the
whole of the remaining gap, and it explains the bandwidth number exactly.

Note what rocprof is for here: it did not find a hot spot, it found a shape.
Three rounds of arithmetic about atomics and cache lines were all plausible
and all wrong, and the thing that settled it was two numbers off the
dispatch table.

### Why more workgroups cannot fix it, and what Fleet does instead

A stage's pieces are slices of its output, so the output width caps the
wavefronts a column split can use:

| stage | width | wavefronts, splitting columns |
|---|--:|--:|
| o_proj / down_proj | 1024 | 16 |
| qkv | 4096 | 64 |
| gate+up | 6144 | 96 |
| lm head | 151936 | 2374 |

Fleet names the same layer and the same problem: *"ALL 30 workers per XCD are
active (processing all N-tiles) vs N-split which has only 8 tiles/XCD for
O_proj"* (`gang_ksplit_linear_mi300.cuh:8`). Its answer is to split K. **That
is the sixth Fleet mechanism, and this reproduction did not have it** -- the
five in NEXT.md section 2.1 are all scheduling and coherence, and none of them
puts work on an idle CU.

### The herd widening (commit `fffb5ea3`)

`air.herd` goes 1x1 -> Nx1, the waves divide the reduction, the lanes keep the
columns so the weight reads stay coalesced, and the wave partials meet in LDS.
`ds_write`/`ds_read`/`s_barrier` go from 0/0/0 to 21/70/44 -- the step-2
counters from the original plan, finally positive, though for occupancy rather
than for the HBM traffic they were predicted to save.

Three things stop being free past one wave:

- **the claim.** `rocdl.readfirstlane` is wave-scoped. Through LDS now.
- **the event spin.** It was guarded by thread 0 *of the workgroup*, so waves
  1..N-1 read the else value forever. That is a hang, not a wrong answer, and
  it is what the first waves=8 run did.
- **the release.** `vmcnt` is a wave counter: wave 0's `s_waitcnt` says nothing
  about wave 5's stores, so the workgroup meets at a barrier before signalling.
  **This cost 13% and the tests passed without it** -- 18/18 and the real
  checkpoint, three times each. It is in anyway; a race that a correctness
  suite cannot see is still a race.

Measured, same node, slope over eight extra launches:

| waves/workgroup | ms/token |
|---|--:|
| 1 | 163.6 |
| 4 | 106.8 |
| 8 | **69.8 / 62.9** |

Embed, SwiGLU and the lm head take the whole workgroup (independent columns,
distinct source and destination buffers); the lm head alone is a quarter of
the work. Per-head rope and attention are still wave 0: rope reads both halves
of a head and writes them back, so a second wave arriving late would rotate
what the first already rotated.

### What is left

Still ~27x off Fleet (2.431 ms/token, MI350X, bf16), and the levers are now
ordered by what the profile says rather than by the ISA diff:

1. **More waves still.** 128 x 8 = 1024 of 6080 slots, 17%. The rmsnorms and
   attention are still one wave in eight, which is the Amdahl term; a
   block-wide reduction for them was written and backed out -- it gives 343
   wrong elements at waves=8 and the bug is not yet found. `workspace/` has
   the attempt.
2. **Cross-workgroup K-split**, which is what Fleet actually does -- partial
   GEMM into an f32 workspace with `atomicAdd`, then a finalize task. Within a
   workgroup the split is bounded by the block; across workgroups it is not.
3. **bf16.** Halves the weight traffic and is the precondition for `v_mfma`,
   which is still 0. Worth doing after occupancy, not before: at 0.3% of
   bandwidth an instruction that does 8192 MACs has nothing to eat.

### Round three: the barrier is 59% of a decode launch

Four more changes, each measured, and one measurement method that finally works.

| change | ms/token |
|---|--:|
| after the herd widening | 71.0 |
| one wave waits for the workgroup, acquire once not per poll | 45 |
| per-head norm and rope off a single thread | 44.7 |
| weights not loaded non-temporally | **41.7** |

The first is the same relaxed-poll change that measured **1.4% worse** at 128
single-wave workgroups and was reverted (`c63e34bf`) with a note saying it
would matter if occupancy rose. It rose: widening the herd multiplied the
pollers by eight without anyone deciding to, because the spin had been made
per-wave to fix a hang. One wave waits and a barrier releases the rest -- the
workgroup meets before the next claim anyway -- and that is worth 1.58x.

The second was a stage running on **one thread of five hundred and twelve**:
stage 2's per-head rmsnorm, rope and KV append, 168 times a launch.

The third contradicts the reasoning that put it there. Weights are read once a
layer and dwarf everything else, so they look like the textbook non-temporal
load; they are 7% faster kept. It also settles the "honest non-match" recorded
above -- Fleet's batch-1 build emits no `nt` at all, and now neither does this.

**Two more theories died, and this time the numbers can be trusted.** Agent
scope instead of system scope on all six event atomics: 44.5/44.8 against
44.6/44.4, i.e. nothing. Moving the acquire fence onto the one waiting wave
instead of all eight: nothing. Cache-maintenance scope is simply not where the
time is.

### What the time is, measured rather than argued

Same number of stage boundaries, five times the work per stage (a 30-token
prompt at window 5 against a 6-token prompt at window 1):

```
nat=5   0.555 s/launch
nat=1   0.209 s/launch
T = A + B*W  ->  A = 0.1225 s, B = 0.0865 s
```

**59% of a decode launch is fixed per-stage cost and 41% is work.** That is
81 us of pure barrier at each of the 1512 stage boundaries. The work half moves
10.6 GB in 0.087 s = 123 GB/s, which is 2.3% of HBM -- so the work is still
twenty times off its own latency-bound model too.

A layer sweep says where the stages are: 28 layers is **91%** of the launch
(0.245 s at 28, 0.143 at 14, 0.014 at 1). The lm head and the embed are not
the problem, the layers are.

So the two remaining targets, in the order the measurement ranks them:

1. **81 us per device-wide barrier, 1512 times.** Not the cache ops -- both
   scope experiments came back flat. Most likely the arrival storm itself:
   128 workgroups onto 8 counters across 8 XCDs, plus whatever straggler the
   barrier is waiting for. Fusing SwiGLU into the gate/up matmul would remove
   one of nine barriers a layer if a piece covered (gate_j, up_j) pairs
   instead of a contiguous slice of the concatenated output.
2. **Cross-workgroup K-split**, for the work half. 128 workgroups of 512
   threads occupy at most 128 of 304 CUs, and more workgroups than pieces is
   measurably worse (256 workers against 128 tasks: 48.6 against 44.7). More
   pieces needs K split across workgroups, which is Fleet's
   `gang_ksplit_linear_mi300.cuh`: partial GEMM into an f32 workspace by
   atomicAdd, then a finalize task.

### Round four: ablation, and the end of guessing

Six theories had been argued from instruction counts and four of them were
wrong. The fix was to stop proposing candidate changes to learn things and
build **deliberately-broken diagnostic builds instead** -- each removes exactly
one cost, none is shippable, and together they partition the time. `bench.sh
DIAG=1` tolerates their wrong answers.

| build | ms/token |
|---|--:|
| control | 41.3 / 40.8 |
| arrival release -> monotonic (drops 128 L2 writebacks/stage) | 41.1 |
| flush release -> monotonic (drops 8 system writebacks/stage) | 40.8 |
| **no rendezvous at all** | **35.9** |
| no rendezvous, no flush | 35.6 |

**The entire event protocol -- all 1512 barriers, every atomic -- is 13%.**
The task bodies are 87%. So the "59% fixed cost" recorded above was misread:
that term is the N-direction reduction work, which does not scale with the
token count either. The cache-maintenance scope experiments were chasing 1%.

That is also the answer to whether lowering through CK matters. Fleet's task
bodies are CK tile GEMMs -- `v_mfma_f32_16x16x32_bf16`, LDS staging,
ColumnMajor B, software pipelining. With a *free* scheduler this chain would
still sit at 35.6 against Fleet's 2.431. **The kernel body is the gap**, and
the round-one ISA diff said so before two rounds of occupancy work displaced
it. The occupancy work was worth most of the 436x; it just was not the answer
to the question being asked.

### What the body is actually spending

Same method, one load at a time made loop-invariant so the compiler hoists it:

| build | ms/token | |
|---|--:|---|
| control | 24.4 | |
| activation load hoisted | 22.9 | loads of `lhs[m,i]` are **6%** |
| weight load hoisted | 17.9 | loads of `W[i,j]` are **27%** |

So two thirds of the body is neither load. It is loop overhead and the LDS
combine -- and the combine is the striking one: a piece is `width/tasks`
columns, which at 128 tasks is 8 for anything dim-wide, so a stage's 16384 MACs
spread over 512 threads is **32 MACs per thread**, while the cross-lane combine
reads `waves * klanes` = **64 LDS slots per column**. The bookkeeping costs
twice the arithmetic.

**bf16 is worth exactly nothing in time** (24.6 against 24.7) and that null is
the most useful measurement in this section: halving the bytes changes nothing,
so the decode is not bandwidth-bound -- it is at 1.8% of HBM -- and what costs
is the *number* of memory instructions, which bf16 does not change.

### Round-four changes

| change | ms/token |
|---|--:|
| after round three | 41.7 |
| lanes split across columns **and** the reduction | 24.5 |
| weights read as the bf16 they already are | 24.6 (a wash, kept anyway) |
| no software divide to learn the token index is 0 | **23.9** |

The first is the big one. A lane per column left 8 of 64 lanes busy on o_proj
and down_proj and used 32 bytes of every 128-byte line; splitting the lanes two
ways fills the wave whatever the slice is. 3.7x of arithmetic was being thrown
away and 1.71x of it came back.

The last is small but worth naming: `%k % %nat` with `%nat` a runtime value is
a 64-bit software divide, about thirty instructions, on a path taken up to nine
times per workgroup per stage -- the same order as the MAC loop of the piece it
wins. At decode `%nat` is 1.

### An unexplained failure, left in the open

`lane_reduce` -- an xor butterfly folding the k-lanes inside a wave before LDS,
which would cut the combine from `waves * klanes` slots to `waves` -- produces
garbage in the kernel and is not used. What is known:

- the emitted sequence is correct in isolation. A 512-thread kernel running the
  exact two shuffles gives 96, 100, 104, 108 for lanes 0..3, which is
  `c + (c^16) + (c^32) + (c^48)` exactly.
- it is still correct when preceded by a reduction loop with a lane-varying
  lower bound, which was the obvious suspect.
- it is wrong in the kernel even when the combine is left summing every slot
  and scaling, which is the shape that is right whether or not the butterfly
  ran. So it is the butterfly, not the indexing around it.
- `gpu.shuffle xor` with offset 32 across 8 waves is fine on its own
  (thread 64 gets 64+96=160).

**And it is not the shuffle.** The same fold written with no shuffles at all --
every lane adds its `klanes` partners out of LDS, then wave 0 adds the `waves`
per-wave totals, three barriers, `klanes + waves` deep instead of
`klanes * waves` -- fails in exactly the same way, 377 elements wrong. Two
independent mechanisms for the same logical fold, both correct on the page and
in the emitted IR, both wrong on the device.

What the two failing versions share, and what the working one does not, is the
intermediate per-wave total: the version that works reads the raw per-lane
slots and adds `waves * klanes` of them in one loop. So the thing to suspect is
the lane-to-slot mapping the intermediate step assumes, not the shuffle and not
LDS. Worth roughly 20-30%, and the combine is the largest single item in the
body, so it is worth going back to with fresh eyes.

### Can air-on-gpu target CK? Yes -- mechanism and numerics both

Since the ablation says the gap is the task body and Fleet's bodies are CK, the
question is whether AIR can call CK rather than reimplement it. Four probes,
gfx942, in `workspace/ck/` with a `run.sh` that reproduces them:

| probe | establishes | result |
|---|---|---|
| `probe.hip` | an MLIR-generated kernel can call a hipcc `__device__` function | `[17,19,21,23]`, exact |
| `lds_probe.hip` | the callee can own `__shared__` and `__syncthreads()` | array reversed, exact |
| `ck_gemm.hip`, M=128 | a `ck_tile` GEMM compiles into one and is correct | all 4096 elements == 128 |
| `ck_m1.mlir`, **M=1** | ... including at the shape a decode step has | all 32 elements == 128 |

The hook is `rocdl-attach-target{... l=<file>.bc}` -- the ROCDL target attribute
carries bitcode libraries that `gpu-module-to-binary` links before codegen, so
CK is inlined with the MLIR kernel rather than called across a boundary.

**What CK brings into the linked kernel**, counted in its assembly:

```
v_mfma_f32_16x16x16_bf16   96      ds_write    60
ds_read                    96      s_barrier   12
```

Those are the four counters the original ISA diff recorded as **0** for AIR,
and no MFMA was written in MLIR to get them. (gfx942 picks the 16x16x16 bf16
MFMA; gfx950 has the 16x16x32 that Fleet's assembly uses.)

All of it with **CK's stock pipeline and default policy** --
`GemmPipelineAGmemBGmemCRegV1` at CK's own reference tile, `M_Tile 128,
N_Tile 32, K_Tile 128/sizeof(bf16)`, `4x1x1` warps, `32x32x8` warp tile
(`example/ck_tile/03_gemm/gemm_utils.hpp:42-52`).

**A wrong claim this section used to make.** It said CK's upstream policies
"cannot distribute a small-M tile", so targeting CK meant targeting CK plus a
small-M policy. False, and reached from a single failure generalised without a
second data point -- the same way four of the six performance theories in this
file went wrong.

The probe had started from Fleet's tile config (`MPerBlock=16, NPerBlock=64,
KPerBlock=256`), which belongs to Fleet's *own* `GemmPipelineSmallTilePolicy`;
paired with the stock policy it gave wrong numbers, and perturbing it to
`KPerBlock=64` while debugging tripped a static assertion that got read as
"small M unsupported". The wrong numbers had two causes, both mine: the
mismatched tile/policy pair, and a harness bug where one MLIR constant served
as both the K bound and the block size, so the launch had 128 threads where
`BlockWarps<4,1,1>` needs 256.

Nothing in AIR asks for a 16-row tile. M is 1 at a decode step -- that is what
decoding one token is, and it is equally true of Fleet -- but the *tile* M is a
free blocking parameter, and a 128-row tile is correct at M=1 because the
tensor view carries the real `m_size`. Fleet's small-tile policy buys
**efficiency, not capability**: at M=1 a `32x32` warp tile wastes 31 of 32
output rows against Fleet's 15 of 16. Which tile to use for decode is a tuning
question to measure, not a precondition to clear.

Four things that bite, in the order they bit:

1. **`func.func private` is the wrong declaration.** It gets an
   `emit_c_interface` wrapper, so MLIR emits a *definition* of the symbol that
   calls `_mlir_ciface_<name>`, which nothing defines -- and that definition
   shadows the one the bitcode provides. The module then fails to load and the
   kernel silently writes zeros. Use `llvm.func` and `llvm.call`.
2. **`-fgpu-rdc` plus `__attribute__((used))`**, or a `__device__` function with
   no caller in its translation unit is deleted before it reaches the bitcode.
3. **CK wants dynamic LDS** (`extern __shared__`, sized at launch). `air.launch`
   sets no dynamic shared memory operand; a wrapper with a fixed-size
   `__shared__` sidesteps it and is proven to work from a linked callee.
4. **The workgroup size is part of the CK type.** `BlockWarps<4,1,1>` is 256
   threads; get it wrong and the kernel returns zeros with no diagnostic.

Integration still needs the weights transposed to `[out][in]` -- CK names B
`ColumnMajor` and this repo stores `[k][n]` -- which is the same transpose
already wanted for vector loads, plus the f32 workspace and finalize stage that
the cross-workgroup K-split needs anyway.

### Would enabling CK close the gap? No. It is worth about 1.3x.

Measured, not argued. Same ablation method as round four: a build per stage
class with that class's *body* emptied (claims, counts, barriers all still
run), everything at `LO=1 HI=100`.

First, two confounds removed:

| | ms/token |
|---|--:|
| AIR on **MI350X** (gfx950), the GPU Fleet was measured on, same config | 25.5 |
| AIR on MI300X, same config | 23.9 |

MI350X is **1.07x slower**, not faster. The platform is not the gap -- and the
old "AIR is 4.5x slower on MI350X" note in this file was a contended-node
artifact, now superseded. And on token accounting: the headline AIR number
averages one 5-token prefill step with five decode steps. Pure decode, every
step one token, is **21.0 ms/token**. So like for like, pure decode on MI350X,
AIR is ~22.4 against Fleet's 2.43: **9.2x**.

Where those 24 ms go (MI300X control 24.0):

| stage class | ms | % | does CK replace it? |
|---|--:|--:|---|
| the four matmuls per layer | 7.2 | 30% | **yes** |
| attention | 4.3 | 18% | a different CK kernel (FMHA) |
| lm head + argmax | 3.3 | 14% | the GEMM part |
| rmsnorm x2 per layer + final | 1.9 | 8% | no |
| rope + KV append | 0.9 | 4% | no |
| SwiGLU | 0.7 | 3% | no |
| the whole event protocol, 1512 barriers | 1.1 | 5% | no |
| unattributed (claim loops, per-stage fixed cost) | 4.6 | 19% | no |

So **CK addresses 30% of the time.** Even making the matmuls cost *zero*:

```
CK on the matmuls           -> 16.8 ms/token   1.43x   still 6.9x off Fleet
CK on matmuls + attn + lm   ->  9.2 ms/token   2.61x   still 3.8x off Fleet
```

Realistically CK makes the matmuls 3-5x faster rather than free, so the honest
expectation for CK-on-the-matmuls is **24 -> ~18 ms/token, about 1.3x**.

### And MFMA is the wrong instruction for a decode step

`v_mfma_f32_16x16x16_bf16` computes `C[16][16] += A[16][16] x B[16][16]` --
4096 MACs per wave instruction, ~8 cycles on CDNA3. At M=1 only one row of A is
real, so 16x16 = 256 of those MACs are useful: **32 useful MACs/cycle**. A
`v_fmac_f32` across 64 lanes is 64 MACs in one cycle: **64 useful MACs/cycle**.

At M=1 the matrix core is about **2x worse per cycle than scalar FMA**. It pays
from M=16 up -- prefill, speculative decode, batching -- not at batch-1 decode.
What CK still buys there is the *load* side: `buffer_load_dwordx4` moves 1024 B
per wave instruction against the 128 B of a `global_load_ushort`, an 8x cut in
memory instructions, plus software pipelining and no hand-rolled cross-lane
combine. That is real, and it is 30% of the time.

### What the breakdown actually points at

The stages CK does not touch are exactly the ones running on almost none of the
machine:

| stage | pieces | threads/wg | threads busy | of machine | ms |
|---|--:|--:|--:|--:|--:|
| matmuls, SwiGLU, lm head | 128 | 512 | 65536 | 100% | |
| attention | 16 | 64 | 1024 | **1.6%** | 4.3 |
| rope + KV append | 16 | 64 | 1024 | **1.6%** | 0.9 |
| rmsnorm | **1** | 64 | 64 | **0.1%** | 1.9 |

`rmsnorm` is a `single_stage`: **one workgroup of 128 does the whole row while
the other 127 wait at the barrier**, 336 times a launch. Attention is one piece
per head, 16 of them, and wave 0 only. Those are decomposition mistakes in this
reproduction, not kernel-quality problems, and no amount of CK fixes them.

Ranked by measured cost, and CK is third:

1. **Attention, 4.3 ms at 1.6% occupancy.** Split over key positions as well as
   heads -- Fleet's split-KV -- and let all eight waves work.
2. **rmsnorm, 1.9 ms at 0.1% occupancy.** It is one task because a row
   reduction cannot be split by output slice; it can be split by *input* slice
   into partials plus a reduce, or fused into the producer as Fleet does.
3. **CK for the matmuls and the lm head, ~1.3x.** Necessary eventually,
   and it forces the `[out][in]` transpose and the K-split anyway, but it is
   not the first thing to do and it is not sufficient.

### Round five: the two decomposition mistakes, fixed -- 23.7 -> 18.1

Round four ranked the work by measured cost and said the top two items were
not kernel quality at all but task decomposition, and that CK could not touch
either. Both are now fixed, and both paid what the ablation said they would.

| change | ms/token | what it was |
|---|--:|---|
| control | 23.7 | |
| attention over waves, lanes over the head | 20.4 | 4.3 ms at 1.6% occupancy |
| the three rmsnorms over the whole block | 18.1 | 1.9 ms at 0.1% occupancy |

**Attention.** A lane per key position is the obvious decomposition and it is
the wrong one at batch one. `curlen` is the sequence so far -- ten, in this
benchmark -- so ten lanes of a 512-thread workgroup did the work, and each
walked a 128-deep dependent FMA chain down the head. The head is the only axis
with any width at decode, so a wave now owns one key position and its 64 lanes
split the head, folded with the same xor butterfly the rmsnorm already used;
the waves take key positions in turn. The softmax stays on wave 0 because it
rewrites the slots it reads and eight waves repeating it would race over the
same addresses; it publishes its divisor through LDS. 3.3 ms of the 4.3.

**rmsnorm.** Still one task -- a row reduction cannot be split by output slice
-- so 127 workgroups still wait at the barrier. What changed is that the one
workgroup was using an eighth of itself. The fix is one line of decomposition
and one line of bug: **`single_stage` treated any truthy `lanes` as "wave 0
only"**, so a body that reduced across waves ran with seven of them not there
and its barriers were barriers only one wave reached. That is almost certainly
why the block reduce was tried here once before, came back wrong, and was
backed out. It works now.

The generalisation, and it is the one to carry forward: **every stage that was
written for a single wavefront is suspect.** Three of the four found so far
were the same bug in different clothes.

### The argmax experiment, and why it was thrown away

`argmax_partial` scans `vocab/tasks` = 1187 logits **on the lead thread
alone**, which looks like exactly the same mistake. Spreading it over the block
(plus an index-carrying butterfly, ties to the lower index) measured 18.7, and
spreading only that half measured 19.5, against a control of 18.1 -- and then
the *unchanged* control re-measured at 19.6. All four numbers are one
population. Reverted.

The reason it was never going to be a win is arithmetic that should have been
done first: the lm head is 151936 x 1024 = 156M MACs per token against 152K
compares for the argmax, a factor of a thousand. The 3.3 ms the ablation
attributed to "lm head + argmax" is the matmul, not the scan.

### Where the remaining 18 ms is not

Worth writing down because it rules out three whole families of fix:

- **Not arithmetic.** 523M MACs per token at 18 ms is 29 G MAC/s, which is
  0.04% of what the vector units can do.
- **Not bandwidth.** ~1 GB of bf16 weights per token at 18 ms is 58 GB/s
  against 5300, or 1.1%. This is the same null the bf16 change already gave.
- **Not occupancy of the workgroup** any more, for the stages above.

What is left is **latency with nothing to hide it behind**: 128 workgroups of
512 threads is 1024 wavefronts against 1216 SIMDs, so under one wave per SIMD,
and every memory access is exposed. That is the frame for the next round --
more workgroups (which needs a ragged vocab split, since 151936 = 2^7 x 1187
and `tasks` must divide it), or more independent loads in flight per thread.

### Which nodes can actually run this (2026-09-17)

Not a detail -- it cost an hour.

| partition | node | runs the kernels? |
|---|---|---|
| `mi300x` | `rad-mi300x-2` | **yes**, and every number in this file is from it |
| `mi300x-es` | `rad-mi300x-splinter1` | **no** |
| `mi350x-es` | | yes, see "Running on MI350" |

`rad-mi300x-splinter1` reports `gfx942`, `NPS1, SPX`, one full GPU, and `/shared`
is mounted -- but **/home is a fresh local home, the repo is not there**, and
once a staged copy is in `/shared` and the toolchain runs, every kernel hangs.
A one-layer 64-wide megakernel times out at 150 s, and so does `4k_4k_mul`,
which has no chiplet logic in it at all -- so it is the node, not the
persistent-worker protocol. `rocm-smi` shows 0% GPU while `mlir-runner` sits in
`D` state in `amddrm_sched_entity_flush`. Do not spend time on it.

What the node *is* good for is **compilation**, which needs no GPU: `air-opt`
and `mlir-opt` run fine there off `/shared/erweiw/airtree`. `workspace/env.shared.sh`
sources that copy. That is how the ISA comparison below was taken while the
only working node was four hours down a 114-job queue.

### Two changes written but not yet measured

Both are on `erwei/air-gpu-wip`, both are labelled UNMEASURED in their commit
messages, and neither should be believed until it has a number.

**1. Give each die a contiguous block of pieces, not a stride.** A piece is a
slice of output columns. At 128 tasks over a 1024-wide output that is 8 columns
a piece and 64 a die -- exactly the 64 bf16 in one 128-byte line. The strided
mapping gives all sixteen dies a different eighth of the *same* line, so every
die fetches line 0 of every row of the weight matrix and uses an eighth of it.
The bound becomes two-sided: a die stops at the end of its own block as well as
at the end of the grid.

**2. Weights [out][in], and one output column per wavefront.** These are only
worth anything together. With [in][out] and a lane per column, one load
instruction's 64 lanes ask for 8 adjacent bf16 in each of 8 different rows:
eight lines fetched to use one line's worth. Transposing alone just runs the 16
bytes along `i` instead of `j`. With [out][in] *and* one column per wave, the
64 lanes ask for `i = lid .. lid+63` of a single row -- one line, every byte
used -- and the cross-wave combine disappears, because a column then belongs to
one wave outright.

`workspace/isa_cmp.sh` compiles a variant to gfx942 and counts, no GPU:

| | head | transposed |
|---|--:|--:|
| `ds_read` | 198 | **22** |
| `s_barrier` | 76 | 66 |
| `ds_bpermute` | 8 | 20 |
| VGPRs | 119 | **74** |

119 VGPRs is four waves a SIMD; 74 is six. That is the right direction for a
kernel whose problem is under one wave per SIMD. **But these are instruction
counts, and four of this session's six theories built on instruction counts
were wrong.** `workspace/waitbench.sh` has both variants queued against the
unchanged generator, interleaved, two rounds at HI=300.

**3. Make the reduction loop's trip count a literal.** Found by reading the
assembly rather than guessing, and it may be the biggest of the three. The
matmul inner loop is *thirteen instructions for one multiply-add*:

    global_load_ushort v5,  v[38:39], off
    global_load_dword  v33, v[40:41], off
    v_lshl_add_u64     v[42:43], v[42:43], 0, 64        <- induction variable
    v_cmp_lt_u64       vcc, s[38:39], v[42:43]          <- bound test
    v_lshl_add_u64     v[38:39], v[38:39], 0, s[34:35]  <- weight address
    v_lshl_add_u64     v[40:41], v[40:41], 0, s[36:37]  <- activation address
    ... s_waitcnt, two shifts, v_mul_f32, v_add_f32

Three 64-bit address adds and a 64-bit compare, none of it arithmetic. **That
is what round four's "two thirds of the body is neither load" actually was**,
and the head and transposed variants have the identical loop -- the transpose
does not touch it.

The cause is that the loop is written `for i = lid to N step 64`. `lid` is
dynamic, so LLVM cannot prove the trip count, cannot prove the loop runs even
once, will not unroll, and has to carry a 64-bit induction variable. Written
`for k = 0 to N/64` with `i = k*64 + lid` the trip count is a literal. The
assembly then becomes one base register and sixteen `offset:` immediates:

    global_load_ushort v3,  v[32:33], off
    global_load_ushort v5,  v[32:33], off offset:128
    global_load_ushort v9,  v[32:33], off offset:256
    ... sixteen of them, then one s_waitcnt

**Sixteen loads in flight per thread instead of one.** For a kernel whose
problem is "under one wave per SIMD, so every latency is exposed", memory-level
parallelism inside the thread is the lever that does not need more waves.

It is a real trade, not a free win: VGPRs go 74 -> 107 on the transposed base,
which is four waves a SIMD instead of six. Sixteen loads in flight on four
waves against one on six is still 10x the outstanding traffic, but that is
arithmetic on a whiteboard. `workspace/scratch/mk_countloop.py` builds it on
either base and `waitbench2.sh` has it queued.

### What is left, in the order the measurements rank it

1. **Cross-workgroup K-split** -- Fleet's `gang_ksplit_linear_mi300.cuh`:
   partial GEMM into an f32 workspace by atomicAdd, then a finalize task. It is
   the only change that gives all three things at once: more workgroups (128 of
   304 CUs are reached now), bigger per-thread pieces (32 MACs is far too fine)
   and a cheaper combine (`klanes` falls as the slice widens).
2. **Vector loads.** 27% of the body is weight loads and each fetches one
   element. A `vector<8xbf16>` load fetches eight. Needs either wider slices or
   the ColumnMajor-B layout CK uses, so it follows (1).
3. **MFMA.** Still 0. Worth doing after the loads, not before: at 1.8% of
   bandwidth an instruction that does 8192 MACs has nothing to eat.

### Measuring this at all -- 100 launches, not 3, and not 9

The launch slope is ~0.25 s against a fixed cost of ~63 s (three gigabytes off
NFS plus a single-threaded host reference). At `--repeat 1 -> 3` the signal is
under the noise and the numbers are fiction: one pair read 55.0 and 229.7
ms/token for the *same* generator snapshot. At `1 -> 9` it is about 20%: the
same code measured 40.1 in one batch and 50.4 in the next, which is enough to
invent a win that is not there. At `1 -> 100` four repeats of two variants came
back 44.5 / 44.6 / 44.8 / 44.4 -- under 1%, and it costs about 20 seconds more
per run than `1 -> 9` because the fixed cost dominates either way.

**Use `LO=1 HI=100`.** Every number in the round-three table is from it, and
the agent-scope and fence-placement nulls above are only believable because of
it.

**Correction, 2026-09-17: "under 1%" was the resolution of that hour, not of
the method.** The same snapshot (md5 `2b1409eb40a1`) measured 18.1 and then
19.6 ms/token twenty minutes apart on rad-mi300x-2 with nobody else on the
node, both at `1 -> 100`. The resolution is (fixed-cost jitter) / (HI - LO) and
nothing else: the fixed cost is ~80 s and wanders by about half a second, so
at HI=100 the floor is ~1.5 ms/token and at HI=300 it is ~0.5 ms for 35 s more
per run. Two round-four changes below are well outside that; the argmax
experiment was entirely inside it and was thrown away because of it.

The rule that follows: **before believing a difference, re-measure the
*unchanged* snapshot in the same session.** A control taken an hour ago is not
a control. `bench.sh` now defaults to HI=100 rather than 3 and carries the
table.

Two process failures worth keeping: a relaunch once raced a copy of `bench.sh`
that had not died, and a whole batch was collected with two runs sharing the
GPU -- `bench.sh` now takes a `flock` and refuses. And the tree was twice
edited or branch-switched underneath a running measurement, which is why
`bench.sh` snapshots the generator before it starts.

## What the README says to run

Three configurations, each with its own flags. **I had run with none of them**,
so even a successful build would not have been any published configuration.

| Mode | Environment |
|---|---|
| `mirage_mpk` | `USE_CK_FMHA=1 USE_FUSED_SILU=1` |
| `fleet` (M-tile) | `USE_GANG=1 USE_CK_FMHA=1 USE_FUSED_SILU=1 GANG_M_TILES_GATEUP=1` |
| `fleet_msplit` | `USE_GANG=1 USE_GANG_M_SPLIT=1 USE_CK_FMHA=1 USE_FUSED_SILU=1` |

`rm -rf permanent_output_dir` between modes -- the megakernel is cached and
compiled with mode-specific flags.

Expected (README, Qwen3-8B bf16, MI350, decode-only TPOT):

| BS | Mirage | Fleet M-tile | Fleet M-split | Speedup |
|:--:|:--:|:--:|:--:|:--:|
| 1 | 7.993 ms | 7.076 | 7.012 | 1.13x |
| 32 | 15.186 | 12.357 | 12.923 | 1.23x |
| 64 | 23.343 | 18.176 | 21.923 | 1.28x |

The paper's other headline is the one directly comparable to what this repo
reproduces: **signals 25,200 -> 1,830, a 14.5x reduction**, by scoping
signalling to XCD-local L2 counters and letting only the last worker on each
XCD issue a `buffer_wbl2` and touch the global counter. That is the mechanism
in NEXT.md §2.4.

## Getting the torch baseline to run (done, MI300X)

1. No torch on the node. `/shared/erweiw/venv-torch` with
   `pip install torch --index-url .../rocm6.4` gives torch 2.9.1+rocm6.4, which
   works on ROCm 7.2.3 (`torch.cuda.is_available()` true, "AMD Instinct
   MI300X"). The wheel carries its own ROCm userspace.
2. ~~**The Fleet snapshot is a single squashed commit with no submodule
   gitlinks**, so there are no pinned dependency revisions and every version is
   a guess.~~ **WRONG, and it cost most of a day.** The `amd_mi350` branch is
   squashed, but the same remote has three other branches that all carry the
   gitlinks and all agree. One `git fetch origin` away. See "The dependency
   pin" below.
3. `src/search/search_context.cc:34` does not compile: `SearchLevel` has no
   serializer, so unqualified `from_json(j, c.level)` finds only the
   `SearchContext` overload in that namespace, and nlohmann's generic enum
   conversion is in `nlohmann::detail` where ADL does not reach. **Patched** --
   added `NLOHMANN_JSON_SERIALIZE_ENUM(SearchLevel, ...)` in
   `include/mirage/search/search_context.h`. json 3.11.2 fails identically, so
   it is not a version mismatch. Superoptimizer JSON plumbing; no kernel.
4. CMake 4 rejects json 3.11.2's `cmake_minimum_required`;
   `CMAKE_POLICY_VERSION_MINIMUM=3.5` gets past it.
5. mirage and torch fight over the HSA runtime (mirage links ROCm 7.2's
   `libamdhip64.so.7`, torch brings 6.4's):
   `LD_PRELOAD=/opt/rocm/lib/libhsa-runtime64.so.1`.

```bash
cd fleet-chiplet-megakernel && export MIRAGE_HOME=$PWD HF_HOME=/shared/erweiw/hf
LD_PRELOAD=/opt/rocm/lib/libhsa-runtime64.so.1 \
  /shared/erweiw/venv-torch/bin/python demo/qwen3/demo.py \
  --model Qwen/Qwen3-0.6B --max-new-tokens 32
```

## The MI300X attempt (wrong platform, but the findings are reusable)

Two settings, neither needing a source change: `AMDGPU_TARGETS=gfx942`
(otherwise gfx950), and `ROCM_PATH` for includes/libs -- note `/opt/rocm-6.4.0`
on the MI300X node is a 264 KB stub with only `libexec`, so ROCm 7.2.3 and its
clang 22 are the only toolchain.

The blocker is composable_kernel, and the snapshot pins nothing. What each tag
does to `tasks/mi300/*.cuh`:

| CK tag | M16N16K32 alias | M32N32K16 alias | pipeline `operator()` |
|---|---|---|---|
| rocm-6.4.4 | plain | plain | — (arch.hpp will not compile under clang 22) |
| rocm-7.0.2 | plain | plain | 1 |
| rocm-7.1.0 / 7.1.1 | template | template | 1 |
| rocm-7.2.0 / 7.2.3 | template | template | 2 -> ambiguous |

`linear_ck_mi300.cuh` wants line 77 without `<>` and line 92 with `<>`, i.e.
one plain and one template. **No released tag has that combination**, and
scanning the last 99 upstream commits that touched `warp_gemm.hpp` finds none
either.

One real finding: the line-77 error is *"argument deduction only allowed for
class templates or alias templates"* -- **alias-template CTAD is C++20**, and
`persistent_kernel.py` compiles with `-std=c++17`. Switching that one flag to
`-std=c++20` makes line 77 legal with an unmodified source. That is a build
flag, not a kernel edit. With CK 7.1.1 + C++20 the remaining failure moves to
the pipeline's `operator()` signature not matching Fleet's call, which is where
I stopped: resolving that means editing the kernels being benchmarked.

**Reading: this is a reproduction problem, not a Fleet defect.** The MI300 path
was evidently built against a CK revision on `develop` that no tag matches, and
the documented platform is MI350 anyway.

## Running on MI350 (current)

- Node has **no `/home`** mounted, only `/shared`. Fleet copied to
  `/shared/erweiw/fleet` (372 MB with submodules, no build dir).
- **No ssh to the node** -- use `srun --jobid=<id>` or `sbatch`.
- Local `venv-torch`, `hf` cache and the Qwen checkpoint are all on `/shared`,
  so they are visible from both clusters.
- There is no `tasks/mi350/`; gfx950 compiles the same `tasks/mi300/*.cuh`.
  CK's `#if defined(__gfx950__)` selects different implementations inside, so
  whether the CK mismatch above still bites on gfx950 was an open question.

**Answered: it does not. Fleet builds clean on gfx950.** Job 71763,
`pip install -e . --no-build-isolation`, 04:58:37 -> 05:39:22, **rc=0**, 41
minutes, and `import mirage` works. Node reports
`gfx950:sramecc+:xnack-`. So every CK failure in the section above was a
consequence of building for the wrong architecture, not a missing dependency
revision -- the version table stays useful as a record of what each tag does,
but it was never the blocker.

Two notes on that build, since "it looked stuck" twice:

- The long phase is **`Preparing editable metadata`**, 04:58 to 05:16, which is
  where cmake configures. Then the Cython `core.o` links against a 101 MB
  `libmirage_runtime.a`.
- **The object files go to node-local `/tmp`** (`/tmp/tmp*.build-temp/`), not
  into `/shared/erweiw/fleet/build`. Watching the shared tree for new `.o`
  shows nothing happening when plenty is. The 92 `.o` sitting in
  `build/CMakeFiles` are leftovers from the earlier killed attempt.

**The run then failed, and not for a Fleet reason:**

```
ImportError: /opt/rocm-7.2.3/lib/libamdhip64.so.7: undefined symbol:
             hsa_amd_memory_get_preferred_copy_engine, version ROCR_1
```

`import mirage` on its own is fine. `demo.py` imports `models.modeling_qwen3`
first, which pulls in torch, which brings its own ROCm 6.4
`libhsa-runtime64.so.1`; mirage's extension then loads ROCm 7.2's
`libamdhip64.so.7`, which wants a symbol 6.4 does not export. It is the same
clash as on MI300X and the same fix -- `LD_PRELOAD=/opt/rocm/lib/libhsa-runtime64.so.1`
-- which job 71826 (`/shared/erweiw/fleet_mi350b.sbatch`) applies. That script
skips the build (the editable install persists) and runs the torch baseline
plus all three README modes.

**With LD_PRELOAD the import succeeds and the next failure is:**

```
RuntimeError: No HIP GPUs are available
```

**I first wrote this up as a hardware fault. That was wrong.** The probe job
(71830, `/shared/erweiw/probe350.sbatch`) settled it:

| probe | result |
|---|---|
| A: torch alone, **no** preload | `No HIP GPUs are available` |
| B: torch alone, **with** preload | `No HIP GPUs are available` |
| C: torch then mirage, with preload | same |
| D: torch then mirage, no preload | `libamdhip64.so.7: undefined symbol: hsa_amd_...` |
| E: torch's own hsa-runtime preloaded | same as D |

Row A is the one that matters: **bare torch, no environment tricks at all,
already cannot see the card.** And on the same node in the same job,
`rocm-smi` reports it fine -- `Card Series: AMD Instinct MI350X`, model
`0x75a0` -- while slurm has the node `State=IDLE`, `Gres=...:8`,
`Reason=none`.

**So it is a version problem, not a hardware one.** The venv carries **torch
2.9.1+rocm6.4** and the node is **gfx950 / ROCm 7.2.1**. gfx950 needs ROCm 7.x;
torch's bundled 6.4 userspace does not enumerate the card. D and E add the
other half: mirage links `/opt/rocm-7.2.1`'s `libamdhip64`, torch brings 6.4's
hsa-runtime, and no preload reconciles them -- on MI300X it could, because
gfx942 is supported in 6.4 either way.

**Three things I got wrong and the evidence that corrects them:**

1. *"Both MI350 nodes are unhealthy."* Only `f13-21` is, and for that one the
   evidence is hard: `State=IDLE+DRAIN+INVALID_REG`,
   `Reason=gres/gpu count reported lower than configured (0 < 8)`, flagged by
   slurm since 2026-09-15. `d13-21` has been healthy throughout.
2. *"`mixed-` means draining."* Not checked before being used as a conclusion.
   It was the transient state while job 71763 sat in `CG`. `scontrol show node`
   says `State=IDLE`.
3. *"`strings libtorch_hip.so` lists gfx950, so torch supports it."* That is the
   compile-time code-object list. It says nothing about whether the runtime
   ROCr can enumerate the device, which is exactly what fails.

**The fix, and the job that tries it:** put a torch built for ROCm 7.2 in the
same venv, which for the first time also puts torch and mirage on the same
ROCm userspace. `download.pytorch.org/whl/` carries `rocm7.2`.
`/shared/erweiw/fleet350c.sbatch` (job 72054) does the install, refuses to go
on unless `torch.cuda.get_device_name(0)` works **and** `import torch, mirage`
survives together, and only then runs the torch baseline plus all three README
modes.

Reversal, if the new torch breaks the MI300X baseline:

```bash
pip install --force-reinstall torch --index-url https://download.pytorch.org/whl/rocm6.4
```

**Neither of the two local patches was needed for the architecture.** They were
needed to build the package at all, on either platform.

**A mistake worth not repeating**: the first MI350 build looked like it was
running for 25 minutes and was not. It had been launched under `srun` in a
foreground tool call; when that call timed out and was backgrounded, the srun
step was terminated and took `make` with it. 92 object files, nothing new for
three minutes, load average down to 2.8, no compiler in `ps`. **Long builds go
through `sbatch`**, which is independent of the shell that submitted them.

```bash
sbatch /shared/erweiw/fleet_mi350.sbatch      # builds, then runs two modes
# log: /shared/erweiw/fleet350.<jobid>.log ; build log: fleet350.build.log
squeue -u erweiw
```

QOS rejects `--time=03:00:00` / `--cpus-per-task=64`; 2 h and 32 cpus is
accepted.

## The dependency pin -- the thing that unblocked everything

Every composable_kernel failure, on **both** MI300X and MI350, was one cause:
the wrong CK. The pin was in the clone the whole time.

```bash
cd fleet-chiplet-megakernel && git fetch origin
git ls-tree origin/aid-local-weights-v2 deps/
```
```
160000 commit d8ee107a47d8485dbcffc79eb08e4f7c39ea6335  deps/composable_kernel
160000 commit f3fde58372d33e9a5650ba7b80fc48b3b49d40c8  deps/cutlass
160000 commit 8c391e04fe4195d8be862c97f38cfe10e2a3472e  deps/json
160000 commit f9176fb4b72156bb8ceca7ebe1b817d9e87baf85  deps/z3
```

`amd_mi350` (what HEAD points at) is squashed and has no gitlinks;
`aid-local-weights-v2`, `amd_mi355_gpt_oss120b` and `fleet-mk-vllm-0.27` all
have them and all three agree. `git submodule status` is empty and
`.gitmodules` only gives URLs -- that is what fooled me.

It fits exactly. Fleet passes **14** template arguments to
`TileFmhaFwdSplitKVTraits`; rocm-7.1.1 and the node's ROCm 7.2.1 both declare
**13**. At `d8ee107a` the 14th exists:

```cpp
          index_t kBlockPerCu_             = -1,
          bool kHasSink_                   = false>   // the 14th
struct TileFmhaFwdSplitKVTraits
```

With it: `hipcc rc=0`, **0 errors**, down from 20. The CK-tag table further
down is a record of a search that should never have happened -- the answer was
not in any released tag because it is a `rocm-libraries` revision.

**Do not edit the call site to drop the extra argument.** I considered it; it
would have silently removed a sink-attention flag from the kernel being
benchmarked.

## The runtime environment that works

- ROCm 7.2.1 on the node, gfx950
- **torch 2.14.0+rocm7.2** (`--index-url https://download.pytorch.org/whl/rocm7.2`)
  installed into `/shared/erweiw/venv-torch`, replacing 2.9.1+rocm6.4
- **No `LD_PRELOAD`.** Once torch and mirage share the ROCm 7.2 userspace the
  `hsa_amd_memory_get_preferred_copy_engine` clash is gone.
- Reverse with:
  `pip install --force-reinstall torch --index-url https://download.pytorch.org/whl/rocm6.4`

torch 2.9.1+rocm6.4 **cannot see an MI350X at all** (`No HIP GPUs are
available`) while `rocm-smi` on the same node reports the card fine. gfx950
appearing in `strings libtorch_hip.so` is the compile-time code-object list and
says nothing about runtime enumeration -- I used it as evidence once; it is not.

## Artifacts

`/shared/erweiw/fleet-artifacts/` -- survives node and allocation loss:
`README.md` (pins + stack), `env/deps-pins.txt`, `sbatch/` (all six job
scripts), `logs/` (three modes, full output), `megakernel/test.cu` (what Fleet
generated), `megakernel/{air,fleet}.s` (the gfx950 ISA of both),
`hipcc-ok.log` vs `hipcc-wrong-ck.log` (0 errors vs 20, for whoever hits this
next).

## Local modifications to the vendored snapshot

Both in `fleet-chiplet-megakernel/` (untracked here) and mirrored in
`/shared/erweiw/fleet`:

- `include/mirage/search/search_context.h` -- added the missing enum
  serializer. Required to build the package at all.
- `python/mirage/mpk/persistent_kernel.py` -- `-std=c++17` -> `-std=c++20`
  (two places). A build flag.

Neither changes any kernel's behaviour. The earlier `<>` edit to
`linear_ck_mi300.cuh` was **reverted** once C++20 made it unnecessary.

## Useful knobs found in the source

`persistent_kernel.py:330-350` reads the paper's mechanisms off the
environment, so once it builds they can be turned off one at a time -- which is
a better comparison than one aggregate number:

```
USE_GANG=1              Chiplet-task work split
USE_GANG_M_SPLIT=1      disjoint M-tile assignment
GANG_M_TILES_GATEUP=1   M-tile traversal on the gate/up projection
USE_NT_WEIGHTS=1        non-temporal weight loads
USE_CK_FMHA=1           CK flash attention
USE_FUSED_SILU=1        SiLU fused into gate_up
MPK_DEVICE_TIMING=1 / MPK_EVENT_TIMING=1    per-task and per-event timing
```
