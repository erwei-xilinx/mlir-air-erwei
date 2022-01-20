// (c) Copyright 2020 Xilinx Inc. All Rights Reserved.

#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

#include "mlir/Analysis/Utils.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/StandardOps/IR/Ops.h"
#include "mlir/Dialect/SCF/SCF.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/OperationSupport.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Transforms/DialectConversion.h"
#include "mlir/Transforms/LoopUtils.h"

#include "air/Transform/AIRHerdAssignPass.h"
#include "air/Util/Util.h"

#include <vector>
#include <deque>

#include "PassDetail.h"

#define DEBUG_TYPE "air-herd-assign"

using namespace mlir;
using namespace xilinx::air;

static llvm::cl::OptionCategory clOptionsCategory(DEBUG_TYPE " options");

namespace {

class AIRHerdAssignPass : public AIRHerdAssignBase<AIRHerdAssignPass> {

public:

  AIRHerdAssignPass() = default;
  AIRHerdAssignPass(const AIRHerdAssignPass &pass) {}

  Option<int> HerdAssignDepth{*this, "herd-assign-depth",
                                     llvm::cl::desc("herd assign depth"),
                                     llvm::cl::init(0)};

  void loopsToParallel(ArrayRef<AffineForOp> nest, int depth)
  {
    assert((int)nest.size() > depth+1);
    AffineForOp outer = nest[depth];
    AffineForOp inner = nest[depth+1];

    xilinx::air::normalizeLoop(inner);
    xilinx::air::normalizeLoop(outer);
    {
      OpBuilder builder(outer);
      auto loc = outer.getLoc();
      auto ub_map_0 = outer.getUpperBoundMap();
      auto ub_map_1 = inner.getUpperBoundMap();
      assert(ub_map_0.isSingleConstant() && ub_map_1.isSingleConstant());
      int64_t ub_0 = ub_map_0.getSingleConstantResult();
      int64_t ub_1 = ub_map_1.getSingleConstantResult();

      auto affine_par = builder.create<AffineParallelOp>(loc,
                                                         std::vector<Type>{},
                                                         std::vector<arith::AtomicRMWKind>{},
                                                         std::vector<int64_t>{ub_0,ub_1});

      outer.getBody()->back().erase();
      affine_par.getBody()->getOperations().splice(affine_par.getBody()->begin(),
                                                   outer.getBody()->getOperations());
      outer.getInductionVar().replaceAllUsesWith(affine_par.getIVs()[0]);
      outer.erase();

      inner.getBody()->back().erase();
      affine_par.getBody()->getOperations().splice(Block::iterator(inner.getOperation()),
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

    for (auto f : module.getOps<FuncOp>()) {
      std::vector<SmallVector<AffineForOp, 6>> bands;
      getTileableBands(f, &bands);
      for (auto &band : bands) {
        auto stringAttr = band[0]->getAttrOfType<StringAttr>(
          "affine_opt_label");
        if (!stringAttr) continue;
        int depth = HerdAssignDepth;
        loopsToParallel(band, depth);
        LLVM_DEBUG(llvm::outs() << "finished band\n");
        LLVM_DEBUG(module.print(llvm::outs()));
      }
    }

    for (auto f : module.getOps<FuncOp>()) {
      std::vector<CallOp> kernelOps;
      f.walk([&](Operation *o) {
        if (auto co = dyn_cast<CallOp>(o)) {
          if (co.getCallee().startswith("acap_conv2d_hw_kernel")) {
            kernelOps.push_back(co);
          }
        }
      });
    }
  }

private:

};

} // namespace

namespace xilinx {
namespace air {

std::unique_ptr<mlir::Pass> createAIRHerdAssignPass() {
  return std::make_unique<AIRHerdAssignPass>();
}

} // namespace air
} // namespace xilinx
