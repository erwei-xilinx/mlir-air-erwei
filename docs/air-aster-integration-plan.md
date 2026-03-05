# AIR-Aster Integration Plan: End-to-End AMD GPU Compilation Stack

## Context

AIR (Asynchronous IR) provides a spatial programming model (`air.launch`/`air.segment`/`air.herd`/`air.channel`) originally designed for AMD AIE arrays. AIR already has an early-stage GPU path (`air-to-rocdl`, disabled by default via `AIR_ENABLE_GPU=OFF`) that lowers to the MLIR GPU dialect and then to ROCDL, but it generates naive scalar load/store loops, ignores `air.channel`, and cannot leverage MFMA or LDS staging.

Aster is an MLIR-based tool for programmable AMD GPU assembly production, with an AMDGCN dialect that directly represents registers (`vgpr`, `sgpr`, `agpr`), instructions (VOP2/3, VOP3P/MFMA, memory, SOPP), LDS allocation, and async tokens (`read_token`/`write_token`). Aster's pipeline goes from high-level MLIR (`scf.for`, `memref`, `arith`) all the way to HSACO binaries via register allocation, instruction scheduling, and hazard analysis.

**Goal**: Replace the naive `air-to-rocdl` path with an Aster-backed codegen pipeline that maps AIR's spatial abstractions to optimized AMD GPU assembly, enabling MFMA matrix operations, coalesced memory access, LDS staging, and fine-grained synchronization.

---

## Architecture: Where AIR Ends and Aster Begins

```
User-facing AIR Python API
  (air.launch / air.segment / air.herd / air.channel / air.dma_memcpy_nd)
        |
        v
[mlir-air] AIR Transform Passes (existing)
  (air-dependency, air-dma-to-channel, air-ping-pong-transform, etc.)
        |
        v
[mlir-air] NEW: air-channel-to-gpu-lds   (channels -> LDS buffers + barriers)
[mlir-air] NEW: air-to-aster             (replaces air-to-rocdl)
  Output: amdgcn.module { amdgcn.kernel { ... scf.for, arith, memref,
          amdgcn.alloc_lds, gpu.block_id/thread_id, lsir ops ... } }
        |
        v
[aster] Standard aster-opt pipeline
  (scheduling -> SROA -> codegen -> register coloring -> hazards -> NOP)
        |
        v
[aster] aster-translate --mlir-to-asm  ->  HSACO binary
        |
        v
[runtime] HIP kernel launch (aster.hip / gpu-to-llvm)
```

The boundary is at the **Aster high-level input format**: `amdgcn.module` containing `amdgcn.kernel` ops whose bodies use `scf.for`, `arith`, `memref`, `amdgcn.alloc_lds`, and optionally Aster library function calls for cooperative copies and MFMA patterns. From there, Aster's standard pipeline handles everything downstream without modification.

---

## AIR Abstraction Mapping

### Mapping strategy: herd tile = wave (Aster-first design)

The existing `AIRToROCDLPass.cpp` maps herd tile = 1 GPU thread. This is **not** the mapping used for `air-to-aster`. Aster operates at **wave granularity** — its `amdgcn.kernel` body represents what one wave executes, and MFMA instructions operate across all lanes of a wave cooperatively. The Aster kittens/GEMM examples (e.g., `test_007_gemm_fp16_4wave.mlir`) use wave-level distribution where each wave independently computes its own MFMA tile.

**The `air-to-aster` pass uses a wave-centric mapping:**

- `air.launch(gx, gy)` → GPU grid `(gx, gy, 1)` — each launch instance = 1 workgroup
- `air.segment` → Workgroup scope — segment body becomes kernel-level code (LDS allocation, cooperative loads, barriers); segment iteration vars → `gpu.block_id`
- `air.herd(wx, wy)` → Wave grid within the block — each herd tile = 1 wavefront (64 threads on CDNA, 32 on RDNA). Block size = `wx × wy × wave_size`. Herd tile indices → `wave_id % wx`, `wave_id / wx` where `wave_id = gpu.thread_id / wave_size`.

This matches Aster's kernel format where `block_dims = array<i32: N, 1, 1>` and waves are distributed via `delinearize_index(wave_id, [wx, wy])`.

| AIR Abstraction | GPU/Aster Target | Strategy |
|---|---|---|
| `air.launch(gx, gy)` | GPU grid `(gx, gy, 1)` | Launch size operands → grid dims in `amdgcn.kernel` |
| `air.segment` | Workgroup scope | Unwrapped; body = kernel-level code; segment iteration vars → `gpu.block_id` |
| `air.herd(wx, wy)` | Wave grid `(wx, wy)` within block | Block dims = `wx*wy*wave_size`; herd tile indices → wave_id decomposition |
| Herd body (per-tile program) | Wave-level program | Each herd tile's body = code one wave executes (MFMA, per-lane ops) |
| `air.dma_memcpy_nd` (L3→L2) | Global load → LDS | Wave-cooperative `global_load_dwordx4` + `ds_write_b128` (like Aster's `@global_load_to_lds_wave_16x16_f16_wait`) |
| `air.dma_memcpy_nd` (L2→L1) | LDS → VGPR registers | `ds_read_b64` for MFMA fragments (like Aster's `@lds_read_A_wave_16x16xf16_fragment_wait`) |
| `air.dma_memcpy_nd` (L1→L3) | VGPR → global | Wave-cooperative `global_store_dwordx4` |
| `air.channel.put/get` (dma_stream) | LDS buffer + `s_barrier` | Producer wave writes LDS, barrier, consumer wave reads LDS |
| `air.channel.put/get` (broadcast) | SGPR or LDS broadcast | Uniform data via SGPR; non-uniform via LDS |
| `air.execute` async region | Sequential per-wave code | Unwrap to sequential ops (within a wave, instructions are ordered) |
| `air.wait_all` | `s_barrier` or `s_waitcnt` | Barrier for cross-wave sync; waitcnt for memory ordering |
| L3 memory (space=0) | Global VRAM | `global_load/store` instructions |
| L2 memory (space=1) | LDS (96KB/CU) | `amdgcn.alloc_lds` + `ds_read/write` |
| L1 memory (space=2) | VGPR/AGPR registers per wave | `amdgcn.alloca` for register ranges (`!vx4`, `!vx2`). Each wave has 256 VGPRs. |
| `air_AsyncToken` | `!amdgcn.read_token<flat>` / `!amdgcn.write_token` | Map to Aster async tokens + `amdgcn.wait` |

### Why herd tile = wave (not thread)

1. **MFMA requires wave-level execution** — `v_mfma_f32_16x16x16_f16` operates across all 64 lanes of a wave cooperatively. With herd tile = wave, the compute body inside each herd tile directly maps to MFMA candidates.
2. **Aster's kernel format is wave-centric** — kittens examples use `wave_id = tid / 64` for distribution. Each wave runs MFMA, LDS fragment reads, and global loads independently.
3. **Semantic match to AIE** — On AIE, each herd tile is an independent core with local memory and program. A GPU wave is similarly a unit of execution with its own register file and MFMA capability.
4. **L1 → registers is natural** — AIE L1 is per-tile local SRAM. GPU registers (VGPRs) are per-wave. With herd tile = wave, L1 allocations map to VGPR ranges.
5. **Cooperative copy library** — Aster's copy functions (e.g., `@global_load_to_lds_wave_16x16_f16_wait`) are wave-cooperative. `air.dma_memcpy_nd` in segment scope → all waves cooperate on the copy.

### Comparison: existing `air-to-rocdl` (Strategy A) vs new `air-to-aster` (Strategy B)

| Aspect | `air-to-rocdl` (existing) | `air-to-aster` (new) |
|---|---|---|
| Herd tile maps to | 1 GPU thread | 1 GPU wavefront (64 threads) |
| Block size | herd dims directly | herd dims × wave_size |
| MFMA support | None (scalar mulf+addf) | Native (herd body → MFMA) |
| L1 mapping | Per-thread private (GPU space 5) | Per-wave VGPR file (`amdgcn.alloca`) |
| DMA lowering | Naive scalar loops | Wave-cooperative coalesced copies |
| Async tokens | Ignored | Mapped to `read_token`/`write_token` |
| Backend | ROCDL → LLVM → binary | Aster → assembly → HSACO |

### Example: how a 4-wave GEMM would look in AIR (new format)

```
air.launch (Mtiles, Ntiles)       → grid of workgroups
  air.segment                      → workgroup scope
    alloc memref<..., 1>           → LDS buffer (shared across waves)
    air.dma_memcpy_nd (L3→L2)     → cooperative global-to-LDS load (all waves participate)
    gpu.barrier / s_barrier        → sync after LDS populated
    air.herd (2, 2)                → 2×2 wave grid = 4 waves = 256 threads/block
      alloc memref<..., 2>         → per-wave VGPR accumulator
      air.dma_memcpy_nd (L2→L1)   → LDS fragment read → VGPR (ds_read_b64)
      linalg.matmul / mulf+addf   → MFMA candidate (v_mfma_f32_16x16x16_f16)
    air.dma_memcpy_nd (L1→L3)     → cooperative VGPR-to-global store
```

---

## New Passes

### Pass 1: `air-channel-to-gpu-lds` (mlir-air, runs before `air-to-aster`)

Converts `air.channel` declarations and put/get ops to explicit LDS buffer management:

- Each `air.channel` declaration -> `memref.alloc` with memory_space=1 (L2/LDS)
- `air.channel.put @ch[idx](memref)` -> cooperative store to LDS region + `s_barrier`
- `air.channel.get @ch[idx](memref)` -> `s_barrier` + cooperative load from LDS region
- Broadcast channels: single write + barrier + multiple reads
- `cascade` channels: error/unsupported on GPU (no hardware equivalent)

**Files**:
- `mlir/lib/Conversion/AIRChannelToGPULDSPass.cpp` (NEW)
- `mlir/include/air/Conversion/AIRChannelToGPULDSPass.h` (NEW)

### Pass 2: `air-to-aster` (mlir-air, replaces `air-to-rocdl`)

Main conversion pass that transforms the AIR compute hierarchy into Aster's `amdgcn.kernel` input format, using wave-centric mapping (herd tile = 1 wavefront):

1. Create `amdgcn.module` with target attribute (e.g., `#amdgcn.target<gfx942>`, ISA `#amdgcn.isa<cdna3>`)
2. `air.launch(gx, gy)` → `amdgcn.kernel` with grid dims `(gx, gy, 1)` and block dims `(wx*wy*wave_size, 1, 1)` where `wx, wy` are from `air.herd`
3. `air.segment` → unwrap body into kernel scope; segment iteration vars → `gpu.block_id` x/y
4. `air.herd(wx, wy)` → unwrap body; insert wave-id decomposition: `wave_id = gpu.thread_id / wave_size`, `herd_x = wave_id % wx`, `herd_y = wave_id / wx`. Herd tile indices replaced with these derived values.
5. `memref.alloc` with space=1 → `amdgcn.alloc_lds` (workgroup-shared LDS, matching Aster's `shared_memory_size` attribute)
6. `memref.alloc` with space=2 → `amdgcn.alloca` for VGPR ranges (per-wave registers, matching Aster's `!vx4`, `!vx2` types)
7. `air.dma_memcpy_nd` (segment scope, L3→L2) → calls to Aster cooperative copy library functions (e.g., `@global_load_to_lds_wave_16x16_f16_wait`), or direct `amdgcn.load` + `amdgcn.ds.write` sequences
8. `air.dma_memcpy_nd` (herd scope, L2→L1) → `amdgcn.ds.read` for MFMA fragment loads (e.g., `@lds_read_A_wave_16x16xf16_fragment_wait`)
9. Compute loops (mulf+addf patterns) → candidates for Aster's MFMA ISel (`amdgcn.vop3p.vop3p_mai`)
10. Async tokens → `!amdgcn.read_token<flat>` / `!amdgcn.write_token<shared>` for Aster's wait optimization
11. `gpu.barrier` / `air.wait_all` → `amdgcn.sopp.sopp <s_barrier>`

**Pass options**: `device` (gfx942, gfx950, gfx1201), `wave-size` (64 for CDNA, 32 for RDNA)

**Files**:
- `mlir/lib/Conversion/AIRToAsterPass.cpp` (NEW)
- `mlir/include/air/Conversion/AIRToAsterPass.h` (NEW)

### Pass 3 (optional, Phase 4): `air-gpu-async-lowering` (mlir-air)

Maps AIR's dependency graph to GPU synchronization:
- Analyze `air.async.token` producer-consumer chains
- Same-wave deps: elide (implicit ordering within a wavefront)
- Cross-wave deps in same workgroup: `s_barrier`
- Memory deps: Aster `!amdgcn.read_token` / `!amdgcn.write_token` + `amdgcn.wait`
- Ping-pong patterns: double-buffered LDS with modular index selection (matching Aster's `test_010_gemm_fp16_lds_2buf.mlir` pattern)
- SCF pipelining: emit `sched.stage` attributes for Aster's `aster-scf-pipeline` pass

---

## Memory Hierarchy Lowering Detail

### Global -> LDS (L3 -> L2)

Replace naive scalar loops from current `air-to-rocdl` (lines 586-713) with wave-cooperative coalesced copies. Reference pattern from Aster's kittens examples (`contrib/kittens/test/test_010_gemm_fp16_lds_2buf.mlir`) and copy library (`mlir_kernels/library/common/copies.mlir`):

```
// Wave-cooperative global-to-LDS copy (each of 64 lanes loads a portion)
func.call @global_load_to_lds_wave_16x16_f16_wait(%pos_desc, %lds_base, %lds_stride)
    : (!tensor_position_descriptor_2level_2d, index, index) -> ()
s_barrier  // all waves in block sync after LDS is fully populated
```

The `air-to-aster` pass generates calls to Aster library functions that distribute the copy across all lanes of each wave. When `air.dma_memcpy_nd` appears at segment scope (outside herd), all waves in the block cooperate. When it appears inside a herd tile, only that wave's lanes participate.

For the LDS-to-register path (L2→L1), MFMA fragment reads are generated:

```
// Per-wave LDS fragment read for MFMA operand
%a_frag = func.call @lds_read_A_wave_16x16xf16_fragment_wait(%lds_pos_desc, %false)
    : (!lds_position_descriptor_2d, i1) -> !vx2
```

### LDS -> Registers (L2 -> L1)

For MFMA operands, generate fragment loads matching the MFMA layout:

```
// Load A/B fragments from LDS into VGPRs for v_mfma_f32_16x16x16_f16
%frag = amdgcn.ds.read ds_read_b64 ... : !amdgcn.vgpr_range<[? + 2]>
```

### Ping-Pong Buffering

AIR's `air-ping-pong-transform` already identifies double-buffer opportunities. On GPU:
- Allocate 2x LDS for the channel/DMA buffer
- Even iterations use buffer 0, odd iterations use buffer 1
- Overlap global loads (iteration N+1) with compute (iteration N) via separate LDS banks

---

## MFMA Integration

Detect multiply-accumulate patterns in `air.herd` bodies and lower to MFMA:

1. Recognize nested loops with `arith.mulf` + `arith.addf` (as in `test/gpu/4k_4k_mul/air_sync.mlir:171-180`)
2. Match tile dimensions to available MFMA instructions (e.g., 16x16x16 for f16->f32)
3. Generate LDS fragment loads + `amdgcn.vop3p.vop3p_mai` (MFMA instruction)
4. Accumulate in VGPR/AGPR ranges

This leverages Aster's VOP3P instruction definitions at `aster/include/aster/Dialect/AMDGCN/IR/Instructions/VOP3P.td`.

---

## Files to Create/Modify

### mlir-air (new files)

| File | Description |
|---|---|
| `mlir/lib/Conversion/AIRToAsterPass.cpp` | Main AIR -> Aster conversion |
| `mlir/lib/Conversion/AIRChannelToGPULDSPass.cpp` | Channel -> LDS lowering |
| `mlir/include/air/Conversion/AIRToAsterPass.h` | Pass declaration |
| `mlir/include/air/Conversion/AIRChannelToGPULDSPass.h` | Pass declaration |
| `python/air/backend/gpu_runner.py` | GPU backend runner (analogous to xrt_runner.py) |
| `test/gpu/vecadd_aster/*.mlir` | Vector add e2e test |
| `test/gpu/matmul_aster/*.mlir` | Matmul e2e test with MFMA |
| `test/gpu/channel_aster/*.mlir` | Channel-based data movement test |

### mlir-air (modify)

| File | Change |
|---|---|
| `mlir/include/air/Conversion/GPUPasses.td` | Add `ConvertAIRToAster`, `ConvertAIRChannelToGPULDS` pass definitions |
| `mlir/lib/Conversion/CMakeLists.txt` | Add new source files, link Aster libraries |
| `CMakeLists.txt` | Add `ASTER_DIR` option, find Aster package |

### Aster (new files, minimal)

| File | Description |
|---|---|
| `mlir_kernels/library/common/air_copies.mlir` | AIR-compatible cooperative copy routines |
| `python/aster/air_integration.py` | Python helper to run AIR-specific pipeline variant |

---

## Implementation Phases

### Phase 1: Minimal Viable Pipeline

**Goal**: Single vector-add kernel: AIR -> Aster -> HSACO -> GPU execution.

1. Implement `air-to-aster` handling `air.launch` + `air.segment` (no herd, no channels)
2. Generate `amdgcn.module` + `amdgcn.kernel` with naive element-wise global loads/stores
3. Wire into Aster's standard pass pipeline for register allocation + assembly
4. Use `aster.hip.execute_hsaco` for runtime validation
5. LIT tests for each conversion pattern in `mlir/test/Conversion/AIRToAster/`

### Phase 2: Memory Hierarchy + Herd (wave mapping)

**Goal**: Full 3-level memory (L3/L2/L1) with `air.herd` → wave grid, MFMA compute.

1. Implement `air.herd(wx, wy)` → wave-id decomposition (blockDim = wx*wy*64, wave_id = tid/64, herd_x/y from wave_id)
2. Implement LDS allocation for L2 memrefs (`amdgcn.alloc_lds` with padding for bank conflict avoidance)
3. Generate calls to Aster wave-cooperative copy library functions for `air.dma_memcpy_nd`
4. Implement MFMA fragment loads from LDS (`@lds_read_A_wave_16x16xf16_fragment_wait`)
5. Lower compute loops to MFMA candidates (matching Aster's `@mfma_f32_16x16x16_f16` wrapper pattern)
6. Write new GEMM test: AIR input with `air.herd(2,2)` → 4-wave kernel → Aster → HSACO

### Phase 3: Channel Lowering

**Goal**: `air.channel.put/get` working on GPU.

1. Implement `air-channel-to-gpu-lds` pass for `dma_stream` channels
2. Implement broadcast channel lowering
3. Barrier insertion for cross-wave synchronization within workgroup (`s_barrier`)
4. Test with channel-based tiled matmul

### Phase 4: Async Optimization + Scheduling

**Goal**: Overlapped compute/memory, double-buffered LDS, instruction scheduling.

1. Map AIR dependency graph to GPU barriers/waits
2. Double-buffered LDS for ping-pong patterns
3. Integrate Aster's `aster-op-scheduling` and `aster-scf-pipeline`
4. Performance benchmarking vs hand-written Aster kernels

### Phase 5: Python API + Tooling

**Goal**: User-facing `--device=gfx942` support in `aircc.py`.

1. Create `gpu_runner.py` backend
2. Integrate `--device=gfx942/gfx950` in `aircc.py`
3. Add GPU programming examples
4. Documentation

---

## Relationship to existing `air-to-rocdl`

The existing `AIRToROCDLPass.cpp` uses a different mapping (herd tile = 1 thread) and remains as-is for backward compatibility. It targets the MLIR GPU dialect → ROCDL → LLVM backend path, which works for simple element-wise kernels but cannot use MFMA. The new `air-to-aster` pass is a separate, independent pass that targets Aster's `amdgcn.kernel` format with wave-centric mapping. Users choose one or the other via the pipeline:
- `air-to-rocdl` + `air-gpu-outlining` → ROCDL path (existing, no MFMA)
- `air-channel-to-gpu-lds` + `air-to-aster` → Aster path (new, with MFMA)

## Key Challenges

1. **LLVM version alignment**: mlir-air and Aster may pin different LLVM commits. The integration boundary should be at textual MLIR IR level (serialize → parse) if versions differ, or share the same LLVM build if possible.
2. **Register pressure**: L1 memory (space=2) maps to VGPRs (256 max per wave on CDNA3). The pass must validate register pressure and potentially spill to LDS.
3. **LDS size limits**: 96KB per CU on MI300. Total LDS from channels + L2 buffers + ping-pong must not exceed this. Emit compile-time errors when exceeded.
4. **No cascade on GPU**: `cascade` channels have no GPU equivalent. Programs must restructure to use `dma_stream` channels.
5. **MFMA layout constraints**: MFMA instructions require specific data layouts in VGPRs. Fragment load patterns must match exactly (e.g., f16 pairs in consecutive VGPRs for `v_mfma_f32_16x16x16_f16`).
6. **Wave size varies by architecture**: CDNA3 (gfx942) has 64-thread waves, RDNA4 (gfx1201) has 32-thread waves. The `air-to-aster` pass needs a `wave-size` option, and herd dims × wave_size must not exceed 1024 threads/block.
7. **Herd dim constraints for GPU**: On AIE, herds can be large (e.g., 4×4 = 16 tiles). On GPU, max waves per block is typically 8-16. The pass must validate that `wx × wy ≤ max_waves_per_block`.

---

## Verification

1. **Phase 1**: Run vector-add through `air-to-aster` -> `aster-opt` -> `aster-translate` -> `assemble_to_hsaco`. Execute on MI300X via HIP. Compare output vs CPU reference.
2. **Phase 2**: Run 4096x4096 matmul through full pipeline. Verify correctness and measure TFLOPS vs Aster-native GEMM kernel.
3. **Phase 3**: Run channel-based producer-consumer test. Verify LDS staging and barrier placement via assembly inspection.
4. **Phase 4**: Measure pipeline utilization via `rocprof` hardware counters. Compare latency hiding effectiveness.
5. **Regression**: Existing `test/gpu/` tests must continue to pass (can optionally migrate from ROCDL path to Aster path).

---

## Critical Reference Files

- Existing GPU conversion to study/replace: [AIRToROCDLPass.cpp](mlir/lib/Conversion/AIRToROCDLPass.cpp)
- GPU pass declarations: [GPUPasses.td](mlir/include/air/Conversion/GPUPasses.td)
- Existing GPU matmul test: [air_sync.mlir](test/gpu/4k_4k_mul/air_sync.mlir)
- AIR dialect ops (channel, DMA, herd): [AIR.td](mlir/include/air/Dialect/AIR/AIR.td)
- Aster target ops: `aster/include/aster/Dialect/AMDGCN/IR/AMDGCNOps.td`
- Aster MFMA instructions: `aster/include/aster/Dialect/AMDGCN/IR/Instructions/VOP3P.td`
- Aster pass pipeline: [pass_pipelines.py](aster/python/aster/pass_pipelines.py)
- Aster GEMM reference kernel: `aster/mlir_kernels/gemm_dword4_mxnxk_16x16x16_f16f16f32.mlir`
- Aster copy library: `aster/mlir_kernels/library/common/copies.mlir`
