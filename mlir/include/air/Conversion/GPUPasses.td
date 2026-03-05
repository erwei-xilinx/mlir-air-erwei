//===- GPUPasses.td ----------------------------------------*- tablegen -*-===//
//
// Copyright (C) 2026, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//

#ifndef AIR_CONVERSION_GPU_PASSES
#define AIR_CONVERSION_GPU_PASSES

include "mlir/Pass/PassBase.td"

def ConvertAIRToROCDL : Pass<"air-to-rocdl", "ModuleOp"> {
  let summary = "Lower AIR dialect to ROCDL dialect";
  let constructor = "xilinx::air::createAIRToROCDLPass()";
  let description = [{
  }];
  let dependentDialects = [
    "gpu::GPUDialect", "ROCDL::ROCDLDialect", "LLVM::LLVMDialect"
  ];
  let options = [];
}

def ConvertGPUKernelOutline : Pass<"air-gpu-outlining", "ModuleOp"> {
  let summary = "Outline GPU Kernel Func from GPU Launch";
  let constructor = "xilinx::air::createGPUKernelOutlinePass()";
  let description = [{
  }];
  let dependentDialects = [
    "gpu::GPUDialect", "ROCDL::ROCDLDialect", "LLVM::LLVMDialect"
  ];
  let options = [];
}

def ConvertAIRToAster : Pass<"air-to-aster", "ModuleOp"> {
  let summary = "Lower AIR dialect to Aster AMDGCN dialect";
  let description = [{
    Converts AIR's spatial compute hierarchy (launch/segment/herd) to Aster's
    amdgcn.module/amdgcn.kernel format for AMD GPU assembly generation.

    Uses a wave-centric mapping where each air.herd tile corresponds to one
    GPU wavefront (64 threads on CDNA, 32 on RDNA). This enables direct MFMA
    instruction generation and efficient register-level data management.

    Mapping:
      air.launch(gx, gy) -> GPU grid (gx, gy, 1)
      air.segment         -> workgroup scope (unwrapped)
      air.herd(wx, wy)    -> wave grid; block_dims = (wx*wy*wave_size, 1, 1)
      memref space=1      -> LDS (amdgcn.alloc_lds)
      memref space=2      -> VGPR registers (amdgcn.alloca)
      air.dma_memcpy_nd   -> async global/LDS load/store with tokens
      air.wait_all        -> s_barrier or amdgcn.wait
  }];
  let constructor = "xilinx::air::createAIRToAsterPass()";
  let dependentDialects = [
    "gpu::GPUDialect"
  ];
  let options = [
    Option<"clDevice", "device", "std::string", /*default=*/"\"gfx942\"",
           "Target GPU device (gfx942, gfx950, gfx1201)">,
    Option<"clWaveSize", "wave-size", "int", /*default=*/"64",
           "Wavefront size (64 for CDNA, 32 for RDNA)">
  ];
}

#endif // AIR_CONVERSION_GPU_PASSES
