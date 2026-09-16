# Fleet baseline: what runs, what does not, and the numbers

## Numbers

| | | |
|---|---|---|
| Fleet torch baseline | Qwen3-0.6B decode | **26.57 ms/token** |
| AIR chain (this repo) | Qwen3-0.6B, 5-token prefill | **8.34 s** = 1.67 s/token |
| Fleet MPK (megakernel) | — | **not obtained**, see below |

**The two numbers are not directly comparable and should not be put side by
side without this sentence.** 26.57 ms is per decoded token; 1.67 s is per
prefilled token. Per token the linear layers do the same work either way, so
the ratio is roughly meaningful — the AIR chain is **~60x slower than the HF
torch baseline** — but it is a rough ratio, not a measurement of the same
quantity. To compare properly the AIR side has to decode, which needs the
window to shrink to one token after the first step (NEXT.md §4).

Why the AIR chain is slow is not a mystery and is already recorded in
NEXT.md §5: **one thread per workgroup**. 32 workgroups x 1 thread = 32 threads.
5.97 GFLOP in 8.34 s is 0.72 GFLOP/s against ~163 TFLOP/s of fp32 peak. f32 vs
bf16 and no matrix cores account for some of it; the thread count accounts for
most.

How the AIR number was measured: `--repeat` R = 1, 3, 5 gave 21.98 / 38.60 /
55.34 s wall. The slope is the per-launch device cost, 8.34 s; the intercept,
13.6 s, is reading 3 GB of weights off NFS plus the single-threaded host
reference. Timing from inside the kernel is still unavailable
(`mgpuEventElapsedTime` returns `hipErrorInvalidHandle`, NEXT.md §5).

## Getting the torch baseline to run

Five obstacles, all environmental:

1. No torch on the node. `python3 -m venv /shared/erweiw/venv-torch` and
   `pip install torch --index-url .../rocm6.4` gives torch 2.9.1+rocm6.4, which
   works on this ROCm 7.2.3 machine (`torch.cuda.is_available()` is true,
   "AMD Instinct MI300X"). The wheel carries its own ROCm userspace.
2. No submodules. **This Fleet snapshot is a single squashed commit with no
   submodule gitlinks**, so there are no pinned revisions to restore and every
   dependency version is a guess. Cloned json, z3, cutlass and
   composable_kernel at their tips.
3. `src/search/search_context.cc:34` does not compile: `SearchLevel` has no
   serializer, so the unqualified `from_json(j, c.level)` finds only the
   `SearchContext` overload in that namespace, and nlohmann's generic enum
   conversion lives in `nlohmann::detail` where ADL does not reach.
   **Patched**: added `NLOHMANN_JSON_SERIALIZE_ENUM(SearchLevel, ...)` in
   `include/mirage/search/search_context.h`. json 3.11.2 fails the same way, so
   this is not a version mismatch. This is the superoptimizer's JSON plumbing;
   no kernel goes through it.
4. CMake 4 rejects json 3.11.2's `cmake_minimum_required`.
   `CMAKE_POLICY_VERSION_MINIMUM=3.5` gets past it.
5. mirage and torch fight over the HSA runtime: mirage links ROCm 7.2's
   `libamdhip64.so.7`, torch brings 6.4's, and whichever loads first wins
   (`undefined symbol: hsa_amd_memory_get_preferred_copy_engine`).
   `LD_PRELOAD=/opt/rocm/lib/libhsa-runtime64.so.1` resolves it.

Command:

```bash
cd fleet-chiplet-megakernel
export MIRAGE_HOME=$PWD HF_HOME=/shared/erweiw/hf
LD_PRELOAD=/opt/rocm/lib/libhsa-runtime64.so.1 \
  /shared/erweiw/venv-torch/bin/python demo/qwen3/demo.py \
  --model Qwen/Qwen3-0.6B --max-new-tokens 32
```

## Why the megakernel does not build

The generated kernel is compiled by hipcc at run time. Two things had to be
set, neither of which needs a source change:

- `AMDGPU_TARGETS=gfx942`. Without it `persistent_kernel.py:350` defaults to
  `gfx950`, which is MI355, not this machine.
- `ROCM_PATH` picks the includes and libs; `/opt/rocm-6.4.0` on this machine is
  a 264 KB stub with only `libexec` in it, so ROCm 7.2.3 is the only toolchain
  available and its clang is version 22.

What blocks it is composable_kernel. `linear_ck_mi300.cuh` uses

```c++
ck_tile::WarpGemmMfmaBf16Bf16F32M16N16K32TransposedCDistribution{}   // line 77, no <>
ck_tile::WarpGemmMfmaBf16Bf16F32M32N32K16TransposedCDistribution<>{} // line 92, with <>
```

so it needs one of those to be a plain alias and the other an alias template.
**No released CK tag has that combination:**

| CK tag | M16N16K32 | M32N32K16 |
|---|---|---|
| rocm-7.0.2 | plain alias | plain alias |
| rocm-7.1.0 … 7.2.4, develop | alias template | alias template |

At 7.0.2 line 92 fails; at 7.1.0 and later line 77 fails. Older still
(rocm-6.4.4) has the shape line 77 wants but its `arch.hpp` does not compile
under clang 22 (`get_warp_size()` "constexpr function never produces a constant
expression"), and CK at develop additionally requires a `CK_CMAKE_GPU_TARGET_IDS`
macro that only its own CMake defines.

Adding `<>` to line 77 is semantically inert — the template's only parameter,
`AttrNumAccess`, is defaulted, so `X<>` and `X` denote the same type — and that
was **patched** to get further. The next error is not:

```
call to object of type 'Pipeline'
  (aka 'GemmPipelineAGmemBGmemCRegV2<...>') is ambiguous
```

in `linear_ck_mi300.cuh:863`, `gang_splitk_linear_mi300.cuh:115` and
`gang_ksplit_linear_mi300.cuh:103`. Resolving that means choosing among
overloads inside the kernels that are the thing being benchmarked, so it was
left alone.

**Reading**: this is a reproduction problem in this environment, not a defect in
Fleet. The code was evidently written against a composable_kernel commit on
`develop` between rocm-7.0.2 and rocm-7.1.0, on a machine with a matching ROCm,
and most of the MI300 path is guarded by `MIRAGE_AMD_MI300` while the default
target is gfx950. Getting the megakernel number needs that exact CK revision,
which the snapshot does not record.

## Local modifications to the vendored snapshot

Both are in `fleet-chiplet-megakernel/`, which is untracked here:

- `include/mirage/search/search_context.h` — added the missing enum serializer.
  Required to build the package at all.
- `include/mirage/persistent_kernel/tasks/mi300/linear_ck_mi300.cuh` — added
  `<>` to one type name. Semantically inert.

Neither changes any kernel's behaviour. Revert both to get back to the
snapshot as delivered.

## Useful thing found along the way

`persistent_kernel.py:330-350` reads the paper's mechanisms off environment
variables:

```
USE_GANG=1        -DMPK_ENABLE_GANG_TASKS      the Chiplet-task work split
USE_NT_WEIGHTS=1  -DMPK_NT_WEIGHT_LOADS        non-temporal weight loads
MPK_DEVICE_TIMING=1, MPK_EVENT_TIMING=1        per-task and per-event timing
```

So once the megakernel builds, the mechanisms can be turned off one at a time —
which is the comparison worth having, rather than one aggregate number.
