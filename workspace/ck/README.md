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

## Numerics: correct, including at M=1

```
M=128, N=32, K=128, A and B all ones   ->  PASS: all 4096 elements == 128.0
M=1   (a decode step), N=32, K=128     ->  PASS: all   32 elements == 128.0
```

Both with **CK's stock `GemmPipelineAGmemBGmemCRegV1` and its default policy**,
at CK's own reference tile -- `M_Tile 128, N_Tile 32, K_Tile 128/sizeof(bf16)`,
`4x1x1` warps, `32x32x8` warp tile (`example/ck_tile/03_gemm/gemm_utils.hpp`
:42-52, `gemm_basic_invoker.hpp:70`). No custom policy of any kind.

### A wrong conclusion this file used to carry

An earlier version said CK's upstream policies "cannot distribute a small-M
tile" and that targeting CK therefore means "targeting CK plus a small-M
policy". **That is false**, and it was reached the way bad conclusions usually
are here -- one failure, generalised without a second data point.

What actually happened: this probe started by copying Fleet's tile config
(`MPerBlock=16, NPerBlock=64, KPerBlock=256`) out of
`gang_ksplit_linear_mi300.cuh`. That config belongs to Fleet's *own*
`GemmPipelineSmallTilePolicy`, so paired with the stock policy it gave wrong
numbers; perturbing it to `KPerBlock=64` while debugging then tripped a static
assertion, and the assertion got read as "small M is unsupported". The wrong
numbers had two causes, both mine: the mismatched tile/policy pair, and a
harness bug in which one MLIR constant served as both the K bound and the block
size -- so the launch carried 128 threads where `BlockWarps<4,1,1>` needs 256.

Nothing in AIR asks for a 16-row tile. **M is 1 at a decode step** -- that is
what decoding one token is, and it is true of Fleet too -- but the *tile* M is
a free blocking parameter, and a 128-row tile handles M=1 correctly because the
tensor view carries the real `m_size` and CK masks the rest.

What Fleet's small-tile policy is actually for is **efficiency, not
capability**: at M=1 a `32x32` warp tile wastes 31 of its 32 output rows, while
Fleet's `16x16` wastes 15 of 16. Choosing the tile for decode is a tuning
question to answer with measurements, not a precondition to clear.

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
