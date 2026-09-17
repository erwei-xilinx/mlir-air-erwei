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
| AIR, **now** | MI300X | bf16 | **18.1** | 1.7x slower |
| AIR (as measured earlier) | MI350X | f32 | 28 700 | 2 740x slower |

The AIR row moved by **576x** on 2026-09-16/17; see "Closing the gap" below for
what did it and what did not. Read 18.1 as 18.1 +/- 1.5 -- see the correction
in "Measuring this at all". Like-for-like against Fleet's 2.431 the gap is
**7.4x**, down from 9.2x. The 10 430 and the 153.0 are the same node
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
