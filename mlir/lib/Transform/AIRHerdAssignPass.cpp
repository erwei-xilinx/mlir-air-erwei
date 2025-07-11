//===- AIRHerdAssignPass.cpp ------------------------------------*- C++ -*-===//
//
// Copyright (C) 2020-2022, Xilinx Inc. All rights reserved.
// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//

#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

#include "mlir/Dialect/Affine/Analysis/Utils.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Affine/LoopUtils.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/OperationSupport.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Transforms/DialectConversion.h"

#include "air/Transform/AIRHerdAssignPass.h"
#include "air/Util/Util.h"

#include <deque>
#include <vector>

#define DEBUG_TYPE "air-herd-assign"

using namespace mlir;

static llvm::cl::OptionCategory clOptionsCategory(DEBUG_TYPE " options");

namespace xilinx {
namespace air {

class AIRHerdAssignPass
    : public xilinx::air::impl::AIRHerdAssignBase<AIRHerdAssignPass> {

public:
  AIRHerdAssignPass() = default;
  AIRHerdAssignPass(const AIRHerdAssignPass &pass) {}

  Option<int> HerdAssignDepth{*this, "herd-assign-depth",
                              llvm::cl::desc("herd assign depth"),
                              llvm::cl::init(0)};

  void loopsToParallel(ArrayRef<affine::AffineForOp> nest, int depth) {
    if ((int)nest.size() <= depth + 1) {
      nest.front()->emitOpError("HerdAssignDepth is greater or equal to the "
                                "affine for loop nest depth.");
      return;
    }
    affine::AffineForOp outer = nest[depth];
    affine::AffineForOp inner = nest[depth + 1];

    if (failed(xilinx::air::normalizeLoop(inner)))
      return;
    if (failed(xilinx::air::normalizeLoop(outer)))
      return;
    {
      OpBuilder builder(outer);
      auto loc = outer.getLoc();
      auto ub_map_0 = outer.getUpperBoundMap();
      auto ub_map_1 = inner.getUpperBoundMap();
      if (!ub_map_0.isSingleConstant()) {
        outer->emitOpError("upper bound map isn't a single constant");
        return;
      }
      if (!ub_map_1.isSingleConstant()) {
        inner->emitOpError("upper bound map isn't a single constant");
        return;
      }
      int64_t ub_0 = ub_map_0.getSingleConstantResult();
      int64_t ub_1 = ub_map_1.getSingleConstantResult();

      auto affine_par = builder.create<affine::AffineParallelOp>(
          loc, std::vector<Type>{}, std::vector<arith::AtomicRMWKind>{},
          std::vector<int64_t>{ub_0, ub_1});

      outer.getBody()->back().erase();
      affine_par.getBody()->getOperations().splice(
          affine_par.getBody()->begin(), outer.getBody()->getOperations());
      outer.getInductionVar().replaceAllUsesWith(affine_par.getIVs()[0]);
      outer.erase();

      inner.getBody()->back().erase();
      affine_par.getBody()->getOperations().splice(
          Block::iterator(inner.getOperation()),
          inner.getBody()->getOperations());
      inner.getInductionVar().replaceAllUsesWith(affine_par.getIVs()[1]);
      inner.erase();
    }
  }

  void runOnOperation() override {

    auto module = getOperation();

    LLVM_DEBUG(llvm::outs() << "Starting herd assignment\n");
    LLVM_DEBUG(module.print(llvm::outs()));

    //
    // Herd assignment
    //

    for (auto f : module.getOps<func::FuncOp>()) {
      std::vector<SmallVector<affine::AffineForOp, 6>> bands;
      getTileableBands(f, &bands);
      for (auto &band : bands) {
        auto stringAttr =
            band[0]->getAttrOfType<StringAttr>("affine_opt_label");
        if (!stringAttr)
          continue;
        int depth = HerdAssignDepth;
        loopsToParallel(band, depth);
        LLVM_DEBUG(llvm::outs() << "finished band\n");
        LLVM_DEBUG(module.print(llvm::outs()));
      }
    }
  }

private:
};

} // namespace air
} // namespace xilinx

namespace xilinx {
namespace air {

std::unique_ptr<mlir::Pass> createAIRHerdAssignPass() {
  return std::make_unique<AIRHerdAssignPass>();
}

} // namespace air
} // namespace xilinx
