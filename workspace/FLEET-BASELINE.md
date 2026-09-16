# Fleet baseline: numbers, and what it takes to run it

## The one thing to read first

**Fleet is documented as MI350 (gfx950) only.** README line 1: "a cooperative
task scheduling system for LLM inference on AMD MI350 GPUs". Hardware
Requirements: "AMD Instinct MI350 (gfx950), 248 CUs in 8 XCDs, 4 MB L2 per XCD,
ROCm 7.0+". `grep -i "mi300\|gfx942"` over README.md, INSTALL.md and docs/
returns **nothing**.

I spent a long stretch trying to build it on MI300X (gfx942) before reading
that. The `--offload-arch=gfx950` default in `persistent_kernel.py:350` is not
a bug, it is the target. Everything in the "MI300X attempt" section below is
therefore a story about the wrong platform.

The cluster has MI350: partition `mi350x-es`, nodes
`smci350-rck-g03-d13-21` (idle) and `smci350-rck-g03-f13-21` (inval).

## Numbers so far

| | | |
|---|---|---|
| Fleet torch baseline, MI300X | Qwen3-0.6B decode | **26.57 ms/token** |
| AIR chain (this repo), MI300X | Qwen3-0.6B decode | **~6.4 s/token** |
| Fleet MPK megakernel | — | **builds on MI350**; run blocked on node faults |

**These first two are now the same quantity.** The AIR chain decodes (NEXT.md
§2.9), so this is per decoded token on both sides, same GPU, same model, same
weights: **the AIR chain is about 240x slower than the HF torch baseline.**
Why is already recorded in NEXT.md §5 -- one thread per workgroup -- and is not
this work's priority.

Measured by the slope over `REPEAT`, which isolates the device from the
one-off cost of reading three gigabytes off NFS and running the host
reference. Every slope below came from 2-3 points and each was re-run and
reproduced to within 1%:

| prompt | window | steps | device s/launch |
|--:|--:|--:|--:|
| 5 | 5 | 1 | 8.37 |
| 10 | 10 | 1 | 16.20 |
| 5 | 5 | 2 | 36.88 |
| 10 | 5 | 2 | 60.87 |
| 5 | 5 | 6 | 62.36 |

**Two readings, one of them unexplained.**

1. *Within one step the cost is exactly linear in tokens*: 5 -> 10 tokens takes
   8.37 -> 16.20 s, a factor of 1.94. About **1.6 s per token position**.
2. *Splitting the same work across steps costs 3.8x*: ten token positions cost
   **16.20 s in one step and 60.87 s in two**. Identical arithmetic, identical
   weights, 3.8x apart. Rows 3, 4 and 5 are all within a few percent of 3.8x
   their single-step equivalents, so it is a one-time penalty for `steps > 1`
   rather than a per-step cost.

**I do not know what causes (2), and did not guess in public.** Two hypotheses
were tested and both failed: the kernel is not being specialised for the
single-trip step loop (the gpu.module is 3493 vs 3494 lines for steps 1 and 2),
and no device loop is bounded by anything that grows with `steps`. A
per-stage-barrier model does not fit either -- it would need ~174 ms per
barrier to explain row 4, and rows 1 and 2 bound the barrier cost at ~2 ms.

Settling it needs in-kernel timing, which is **currently broken**: `mgpuEventRecord`
records on a stream `gpu-to-llvm` does not launch the kernel on, so
`mgpuEventElapsedTime` returns `hipErrorInvalidHandle` (NEXT.md §5;
`test/gpu/4k_4k_mul` has been printing this error all along). Fleet solves the
same problem with `s_memrealtime` accumulators behind `MPK_DEVICE_TIMING`,
which is the cheaper thing to copy.

**The number to quote is the multi-step one.** The 8.34 s/launch in the earlier
version of this file was the `steps = 1` row, and at 1.67 s/token it is
optimistic by that same 3.8x for anything that actually decodes.

Why the AIR chain is slow is already recorded in NEXT.md §5: **one thread per
workgroup**, so 32 workgroups x 1 thread = 32 threads. 5.97 GFLOP in 8.34 s is
0.72 GFLOP/s against ~163 TFLOP/s of fp32 peak. f32-vs-bf16 and no matrix cores
explain some of it; the thread count explains most.

Measured with `--repeat` R = 1, 3, 5 -> 21.98 / 38.60 / 55.34 s wall. Slope is
the per-launch device cost, 8.34 s; intercept 13.6 s is reading 3 GB of weights
off NFS plus the single-threaded host reference. In-kernel timing is still
unavailable (`mgpuEventElapsedTime` returns `hipErrorInvalidHandle`, NEXT.md §5).

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
2. **The Fleet snapshot is a single squashed commit with no submodule
   gitlinks**, so there are no pinned dependency revisions to restore and every
   version is a guess. json, z3, cutlass, composable_kernel all cloned by hand.
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

**With LD_PRELOAD the import succeeds and the next failure is the hardware:**

```
RuntimeError: No HIP GPUs are available
```

Not a torch-vs-gfx950 problem -- `strings libtorch_hip.so` lists **gfx950**, and
the wheel is 2.9.1+rocm6.4. It is the node. Minutes later:

```
$ sinfo -p mi350x-es -o "%n %T %E"
smci350-rck-g03-f13-21  inval   gres/gpu count reported lower than configured (0 < 8)
smci350-rck-g03-d13-21  mixed-                     # trailing '-' = draining
```

Both MI350 nodes in this cluster are unhealthy: one reports zero of its eight
GPUs, and the one that did the build is draining. **So the Fleet MPK number is
blocked on hardware availability, not on anything in Fleet or in the
toolchain.** `/shared/erweiw/probe350.sbatch` (job 71830) is queued and will
run the moment a node comes back -- it tries torch with and without the
preload, and torch-then-mirage both ways, so it settles which combination
works in one shot before spending 40 minutes on a demo.

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
