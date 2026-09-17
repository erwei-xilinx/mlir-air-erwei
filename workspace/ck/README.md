# Can air-on-gpu target CK for its GPU kernels?

**Yes, the linking mechanism works and CK runs inside an AIR-generated kernel.**
What is not yet working is the pipeline *configuration*, and the reason is
interesting rather than incidental.

Everything here was run on MI300X (gfx942). Reproduce with `./run.sh`.

## What is proven, on device

| probe | what it establishes | result |
|---|---|---|
| `probe.hip` + `call.mlir` | an MLIR-generated kernel can call a hipcc-compiled `__device__` function, linked as bitcode | `[17, 19, 21, 23]`, exact |
| `lds_probe.hip` + `lds_call.mlir` | that callee can own `__shared__` and `__syncthreads()` | array reversed, exact |
| `ck_gemm.hip` + `ck_call.mlir` | `ck_tile` compiles into such a callee and executes | runs; see below |

The mechanism is `rocdl-attach-target{... l=<file>.bc}` -- the ROCDL target
attribute carries a list of bitcode libraries that `gpu-module-to-binary` links
into the module before codegen. So the CK code is inlined and optimised
together with the MLIR-generated kernel, not called across a boundary.

**The instructions CK brings in**, counted in the assembly of the linked
kernel:

```
v_mfma_f32_16x16x16_bf16   96
ds_read                    96
ds_write                   60
s_barrier                  12
buffer_load                60
```

Those are precisely the four counters that the original AIR-vs-Fleet ISA diff
recorded as **0** for AIR (`FLEET-BASELINE.md`, "Where the AIR gap actually
is"). They arrive without a line of MFMA being written in MLIR.

gfx942 selects `v_mfma_f32_16x16x16_bf16`; on gfx950 the dispatcher has the
`16x16x32` that Fleet's assembly uses.

## What is not proven

The GEMM does not yet compute the right numbers. That is a pipeline
configuration problem, and the shape of it matters:

**CK's upstream policies cannot distribute a small-M tile.** With
`MPerBlock=16` and `KPerBlock=64`, `GemmPipelineAGmemBGmemCRegV2DefaultPolicy`
fails a static assertion outright -- `M0 * M1 * M2 == MPerBlock`, "must cover
whole MPerBlock". Upstream CK is tuned for training-shaped GEMMs; a decode step
is M=1. This is exactly why Fleet ships its own `GemmPipelineSmallTilePolicy`
(`linear_ck_mi300.cuh:134`) and passes it explicitly everywhere.

So "target CK" in practice means "target CK *plus* a small-M policy", and
Fleet's is Apache-2.0 and sitting in `deps/`.

## Four things that bite, in the order they bit

1. **`func.func private` is the wrong declaration.** It gets an
   `emit_c_interface` wrapper: MLIR emits a *definition* of `air_ck_probe`
   that calls `_mlir_ciface_air_ck_probe`, which nothing defines. The wrapper
   also shadows the symbol the bitcode provides, so the module fails to load
   and the kernel silently writes zeros. Declare the callee as `llvm.func` and
   call it with `llvm.call`.
2. **`-fgpu-rdc` and `__attribute__((used))`**, or a `__device__` function with
   no caller in its own translation unit is deleted before it reaches the
   bitcode.
3. **CK wants dynamic LDS** -- `extern __shared__ char smem[]`, sized at launch
   (`gang_ksplit_linear_mi300.cuh:70`). `air.launch` does not set a dynamic
   shared memory operand. A wrapper with a fixed-size `__shared__` sidesteps it
   and is proven to work from a linked callee.
4. **The workgroup size is part of the CK type.** `BlockWarps = sequence<1,4>`
   means 256 threads. The megakernel currently runs 512 (`--waves 8`). They
   have to agree.

## What integration would take

Beyond the above:

- **Transpose the weights to `[out][in]`.** CK's GEMM traits name B
  `ColumnMajor`, i.e. `[n][k]`; this repo stores `[k][n]`. That is the same
  transpose already wanted for vector loads, so it pays for itself twice.
- **An f32 workspace and a finalize stage.** Fleet's K-split writes partials
  with `atomicAdd` into f32 and adds the residual in a second task
  (`gang_ksplit_linear_mi300.cuh:8-12`). That is the cross-workgroup K-split
  already identified as the next structural item.
- **Watch occupancy.** A CK pipeline inlined into the megakernel raises the
  whole kernel's VGPR count, and the megakernel is currently at 92 VGPRs with
  8 waves per workgroup. Fleet pays this too.
