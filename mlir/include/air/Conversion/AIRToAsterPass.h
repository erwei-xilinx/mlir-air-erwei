//===- AIRToAsterPass.h ------------------------------------------*- C++ -*-===//
//
// Copyright (C) 2026, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//
//
// This pass converts AIR dialect operations (launch/segment/herd/dma/channel)
// to Aster's AMDGCN dialect format for AMD GPU assembly generation.
//
// Uses a wave-centric mapping where each air.herd tile corresponds to one
// GPU wavefront. This enables MFMA instruction generation and efficient
// register-level data management through Aster's codegen pipeline.
//
//===----------------------------------------------------------------------===//

#ifndef CONVERT_AIR_TO_ASTER_H
#define CONVERT_AIR_TO_ASTER_H

#include "mlir/Pass/Pass.h"
#include <memory>

namespace xilinx {
namespace air {

std::unique_ptr<mlir::Pass> createAIRToAsterPass();

} // namespace air
} // namespace xilinx

#endif // CONVERT_AIR_TO_ASTER_H
