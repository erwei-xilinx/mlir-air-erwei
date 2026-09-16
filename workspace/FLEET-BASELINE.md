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
| AIR, **now** | MI300X | f32 | **153.0** | 15x slower |
| AIR (as measured earlier) | MI350X | f32 | 28 700 | 2 740x slower |

The AIR row moved by **68x** on 2026-09-16; see "Closing the gap" below for
what did it and what did not. The 10 430 and the 153.0 are the same node
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

### Measuring this at all

Two-point slopes over `--repeat` have a ~2 s noise floor against a fixed cost
of ~69 s (three gigabytes of weights off NFS, plus the single-threaded host
reference). At `1 -> 3` launches the signal is ~1.4 s and **the measurement is
worthless** -- it produced a 55.0 ms/token that did not reproduce and a 229.7
from the same snapshot minutes later. At `1 -> 9` the spread between repeats
is under 1%. `workspace/bench.sh` does the wide version, always runs from a
snapshot of the generator (editing it mid-run silently gives the two halves of
a measurement two different programs -- that happened once), and logs
`squeue -w $(hostname)` around every measurement.

`workspace/isa.sh` is the other half: it compiles the generated chain to gfx950
assembly and counts these instructions in **0.6 s**, no GPU involved.

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
