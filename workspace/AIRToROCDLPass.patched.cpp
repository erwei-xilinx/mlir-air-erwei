//===- AIRToROCDLPass.cpp -------------------------------------*- C++ -*-===//
//
// Copyright (C) 2026, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
//
//===-------------------------------------------------------------------===//
#include "air/Conversion/AIRToROCDLPass.h"
#include "air/Conversion/GPUPassDetail.h"
#include "air/Dialect/AIR/AIRDialect.h"
#include "air/Util/Util.h"
#include "mlir/Conversion/AffineToStandard/AffineToStandard.h"
#include "mlir/Conversion/GPUToROCDL/GPUToROCDLPass.h"
#include "mlir/Conversion/LLVMCommon/TypeConverter.h"
#include "mlir/Conversion/SCFToControlFlow/SCFToControlFlow.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Arith/Utils/Utils.h"
#include "mlir/Dialect/ControlFlow/IR/ControlFlowOps.h"
#include "mlir/Dialect/GPU/IR/GPUDialect.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/Dialect/LLVMIR/ROCDLDialect.h"
#include "mlir/Dialect/Linalg/Passes.h"
#include "mlir/Dialect/SCF/IR/SCF.h" // Includes the ops like scf::ForOp
#include "mlir/IR/Builders.h"
#include "mlir/IR/IRMapping.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Pass/PassManager.h"
#include "mlir/Transforms/DialectConversion.h"
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"
#include "mlir/Transforms/RegionUtils.h"
using namespace mlir;
using namespace xilinx;
using namespace xilinx::air;

namespace {
#define GEN_PASS_DEF_CONVERTAIRTOROCDL
#include "air/Conversion/Passes.h.inc"

SmallVector<mlir::BlockArgument, 4> gpuArgs;

/// Map a block argument of an air hierarchy op (launch/segment/herd) back to
/// the value passed in from the enclosing scope, or null if `blockArg` is not
/// a kernel argument at all.
///
/// Hierarchy block args are laid out [ids..., sizes..., kernel_args...], with
/// 2 * getNumDims() leading ids and sizes, so a kernel arg's index is *not*
/// its block-arg number. getTiedKernelOperand does that arithmetic and returns
/// null for an id or size arg, which has no counterpart outside the region.
/// Open-coding the offset here is what made a segment with an iteration space
/// index past the end of the operand list and abort.
static mlir::Value getTiedHierarchyOperand(mlir::BlockArgument blockArg) {
  auto hier = mlir::dyn_cast_if_present<air::HierarchyInterface>(
      blockArg.getOwner()->getParentOp());
  if (!hier)
    return {};
  return hier.getTiedKernelOperand(blockArg);
}
class AffineApplyToSubPattern
    : public mlir::OpRewritePattern<mlir::affine::AffineApplyOp> {
  using OpRewritePattern<mlir::affine::AffineApplyOp>::OpRewritePattern;

  mlir::LogicalResult
  matchAndRewrite(mlir::affine::AffineApplyOp affineOp,
                  mlir::PatternRewriter &rewriter) const override {

    for (unsigned j = 0; j < affineOp.getNumOperands(); ++j) {
      mlir::Value nestedOperand = affineOp.getOperand(j);

      if (auto blockArg =
              mlir::dyn_cast_if_present<mlir::BlockArgument>(nestedOperand)) {
        mlir::Block *parentBlock = blockArg.getOwner();

        mlir::Operation *parentOp = parentBlock->getParentOp();
        if (llvm::isa<air::SegmentOp>(parentOp)) {
          unsigned argNumber = blockArg.getArgNumber();
          affineOp.setOperand(j, gpuArgs[j + argNumber]);
        } else if (llvm::isa<air::HerdOp>(parentOp)) {
          unsigned argNumber = blockArg.getArgNumber();
          affineOp.setOperand(j, gpuArgs[j + 3 + argNumber]);
        }
      }
    }

    return mlir::success();
  }
};

class SCFForToSubPattern : public mlir::OpRewritePattern<scf::ForOp> {
  using OpRewritePattern<scf::ForOp>::OpRewritePattern;

  mlir::LogicalResult
  matchAndRewrite(scf::ForOp forOp,
                  mlir::PatternRewriter &rewriter) const override {
    mlir::Region &region = forOp.getRegion();

    mlir::Block &entryBlock = region.front();
    for (mlir::Operation &nestedOp : entryBlock.getOperations()) {
      if (auto storeOp =
              llvm::dyn_cast_if_present<mlir::memref::StoreOp>(nestedOp)) {
        mlir::Value memref = storeOp.getMemRef();
        llvm::SmallVector<mlir::Value> indices(storeOp.getIndices().begin(),
                                               storeOp.getIndices().end());

        if (auto blockArg =
                mlir::dyn_cast_if_present<mlir::BlockArgument>(memref)) {
          // Operand 1 of a memref.store is the memref; if it is a hierarchy
          // kernel argument, name the value from the enclosing scope instead.
          if (mlir::Value outerVal = getTiedHierarchyOperand(blockArg))
            storeOp->setOperand(1, outerVal);
        }
      }
      for (mlir::Value operand : nestedOp.getOperands()) {
        if (auto opResult = dyn_cast_if_present<mlir::OpResult>(operand)) {
          mlir::Operation *op = operand.getDefiningOp();
          for (unsigned j = 0; j < op->getNumOperands(); ++j) {
            mlir::Value nestedOperand = op->getOperand(j);

            if (auto blockArg = mlir::dyn_cast_if_present<mlir::BlockArgument>(
                    nestedOperand)) {
              mlir::Block *parentBlock = blockArg.getOwner();
              mlir::Operation *parentOp = parentBlock->getParentOp();
              Type operandType = nestedOperand.getType();
              if (mlir::Value outerVal = getTiedHierarchyOperand(blockArg)) {
                // A kernel argument: use the value from the enclosing scope.
                op->setOperand(j, outerVal);
              } else if (mlir::isa<MemRefType>(operandType)) {
                // A memref that is an id/size arg cannot happen; nothing to do.
              } else {
                if (llvm::isa<air::SegmentOp>(parentOp)) {
                  unsigned argNumber = blockArg.getArgNumber();
                  op->setOperand(j, gpuArgs[j + argNumber]);
                } else if (llvm::isa<air::HerdOp>(parentOp)) {
                  unsigned argNumber = blockArg.getArgNumber();
                  op->setOperand(j, gpuArgs[j + 3 + argNumber]);
                }
              }
            }
          }
        }
      }
    }

    return mlir::success();
  }
};
class DMAMemcpyToSubPattern
    : public mlir::OpRewritePattern<air::DmaMemcpyNdOp> {
  using OpRewritePattern<air::DmaMemcpyNdOp>::OpRewritePattern;

  void replaceDMAOperand(BlockArgument blockArg,
                         air::DmaMemcpyNdOp dmaOp) const {
    int numOp = -1;
    mlir::Block *parentBlock = blockArg.getOwner();
    Type operandType = blockArg.getType();
    unsigned argNumber = blockArg.getArgNumber(); // Get the argument number

    for (unsigned i = 0; i < dmaOp->getNumOperands(); ++i) {
      if (dmaOp->getOperand(i) == blockArg) {
        numOp = i; // Found the operand index
      }
    }
    // Get the parent operation of the block
    mlir::Operation *parentOp = parentBlock->getParentOp();
    if (auto segmentOp = mlir::dyn_cast_if_present<air::SegmentOp>(parentOp)) {
      if (auto memRefType =
              mlir::dyn_cast_if_present<MemRefType>(operandType)) {
        mlir::Value correspondingValue = segmentOp.getKernelOperand(
            argNumber); // Map back to the original value
        dmaOp.setOperand(numOp, correspondingValue);
      }
    } else if (auto herdOp = mlir::dyn_cast_if_present<air::HerdOp>(parentOp)) {
      if (auto memRefType =
              mlir::dyn_cast_if_present<MemRefType>(operandType)) {
        mlir::Value correspondingValue = herdOp.getKernelOperand(argNumber - 4);
        dmaOp.setOperand(numOp, correspondingValue);
      }
    } else if (auto launchOp =
                   mlir::dyn_cast_if_present<air::LaunchOp>(parentOp)) {
      if (auto memRefType =
              mlir::dyn_cast_if_present<MemRefType>(operandType)) {
        mlir::Value correspondingValue =
            launchOp.getKernelOperand(argNumber - 4);
        dmaOp.setOperand(numOp, correspondingValue);
      }
    }
  }

  mlir::LogicalResult
  matchAndRewrite(air::DmaMemcpyNdOp dmaOp,
                  mlir::PatternRewriter &rewriter) const override {

    mlir::Value sourceMemRef = dmaOp.getSrcMemref();
    mlir::Value dstMemRef = dmaOp.getDstMemref();
    if (auto blockArg =
            mlir::dyn_cast_if_present<BlockArgument>(sourceMemRef)) {
      replaceDMAOperand(blockArg, dmaOp);
    }
    if (auto blockArg = mlir::dyn_cast_if_present<BlockArgument>(dstMemRef)) {
      replaceDMAOperand(blockArg, dmaOp);
    }

    return mlir::success();
  }
};

struct ConvertAIRToROCDLPass
    : public xilinx::air::impl::ConvertAIRToROCDLBase<ConvertAIRToROCDLPass> {

  ConvertAIRToROCDLPass() = default;
  ConvertAIRToROCDLPass(const ConvertAIRToROCDLPass &pass) {}
  SmallVector<Value, 4> blkIdx;
  SmallVector<Value, 4> gridIdx;

  static DenseI32ArrayAttr maybeConstantDimsAttr(gpu::KernelDim3 dims) {
    SmallVector<int32_t, 3> constants;
    MLIRContext *ctx = dims.x.getContext();
    for (Value v : {dims.x, dims.y, dims.z}) {
      APInt constValue;
      if (!matchPattern(v, m_ConstantInt(&constValue)))
        return nullptr;
      // In the event someone called for a too-large block or grid dimension,
      // don't set bounds as it is likely to cause more confusing behavior.
      if (constValue.ugt(std::numeric_limits<uint32_t>::max()))
        return nullptr;
      constants.push_back(
          constValue.getLimitedValue(std::numeric_limits<uint32_t>::max()));
    }
    return DenseI32ArrayAttr::get(ctx, constants);
  }

  template <typename OpTy>
  static void createForAllDimensions(OpBuilder &builder, Location loc,
                                     SmallVectorImpl<Value> &values) {
    for (auto dim : {gpu::Dimension::x, gpu::Dimension::y, gpu::Dimension::z})
      values.push_back(OpTy::create(builder, loc, builder.getIndexType(), dim));
  }

  /// Adds operations generating block/thread ids and grid/block dimensions at
  /// the beginning of the `launchFuncOpBody` region. Add mapping from argument
  /// in entry block of `launchOpBody`, to the corresponding result value of the
  /// added operations.
  static void injectGpuIndexOperations(Location loc, Region &launchFuncOpBody,
                                       Region &launchOpBody, IRMapping &map,
                                       bool hasCluster = false) {
    OpBuilder builder(loc->getContext());
    Block &firstBlock = launchOpBody.front();
    builder.setInsertionPointToStart(&launchFuncOpBody.front());
    SmallVector<Value> indexOps;
    // The order is important here, as it must match the order of the arguments
    createForAllDimensions<gpu::BlockIdOp>(builder, loc, indexOps);
    createForAllDimensions<gpu::ThreadIdOp>(builder, loc, indexOps);
    createForAllDimensions<gpu::GridDimOp>(builder, loc, indexOps);
    createForAllDimensions<gpu::BlockDimOp>(builder, loc, indexOps);
    if (hasCluster) {
      createForAllDimensions<gpu::ClusterIdOp>(builder, loc, indexOps);
      createForAllDimensions<gpu::ClusterDimOp>(builder, loc, indexOps);
    }
    // Replace the leading 12 function args with the respective thread/block
    // index operations. Iterate backwards since args are erased and indices
    // change.
    for (const auto &indexOp : enumerate(indexOps))
      map.map(firstBlock.getArgument(indexOp.index()), indexOp.value());
  }

  static gpu::GPUFuncOp outlineKernelFuncImpl(gpu::LaunchOp launchOp,
                                              StringRef kernelFnName,
                                              SetVector<Value> &operands) {
    Location loc = launchOp.getLoc();
    // Create a builder with no insertion point, insertion will happen
    // separately due to symbol table manipulation.
    OpBuilder builder(launchOp.getContext());
    Region &launchOpBody = launchOp.getBody();

    // Identify uses from values defined outside of the scope of the launch
    // operation.
    mlir::getUsedValuesDefinedAbove(launchOpBody, operands);

    // Create the gpu.func operation.
    SmallVector<Type, 4> kernelOperandTypes;
    kernelOperandTypes.reserve(operands.size());
    for (Value operand : operands) {
      kernelOperandTypes.push_back(operand.getType());
    }
    FunctionType type =
        FunctionType::get(launchOp.getContext(), kernelOperandTypes, {});
    auto outlinedFunc = gpu::GPUFuncOp::create(
        builder, loc, kernelFnName, type,
        TypeRange(ValueRange(launchOp.getWorkgroupAttributionBBArgs())),
        TypeRange(ValueRange(launchOp.getPrivateAttributions())));
    outlinedFunc->setAttr(gpu::GPUDialect::getKernelFuncAttrName(),
                          builder.getUnitAttr());

    // If we can infer bounds on the grid and/or block sizes from the arguments
    // to the launch op, propagate them to the generated kernel. This is safe
    // because multiple launches with the same body are not deduplicated.
    if (auto blockBounds =
            maybeConstantDimsAttr(launchOp.getBlockSizeOperandValues()))
      outlinedFunc.setKnownBlockSizeAttr(blockBounds);
    if (auto gridBounds =
            maybeConstantDimsAttr(launchOp.getGridSizeOperandValues()))
      outlinedFunc.setKnownGridSizeAttr(gridBounds);

    IRMapping map;

    // Map the arguments corresponding to the launch parameters like blockIdx,
    // threadIdx, etc. If cluster is present, then we also generate clusterIdx
    // and clusterDim.
    Region &outlinedFuncBody = outlinedFunc.getBody();
    injectGpuIndexOperations(loc, outlinedFuncBody, launchOpBody, map,
                             launchOp.hasClusterSize());

    // Map memory attributions from the LaunOp op to the GPUFuncOp attributions.
    for (const auto &[launchArg, funcArg] :
         llvm::zip(launchOp.getWorkgroupAttributionBBArgs(),
                   outlinedFunc.getWorkgroupAttributionBBArgs()))
      map.map(launchArg, funcArg);
    for (const auto &[launchArg, funcArg] :
         llvm::zip(launchOp.getPrivateAttributions(),
                   outlinedFunc.getPrivateAttributions()))
      map.map(launchArg, funcArg);

    // Map arguments from gpu.launch region to the arguments of the gpu.func
    // operation.
    Block &entryBlock = outlinedFuncBody.front();
    for (const auto &operand : enumerate(operands))
      map.map(operand.value(), entryBlock.getArgument(operand.index()));

    // Clone the region of the gpu.launch operation into the gpu.func operation.
    launchOpBody.cloneInto(&outlinedFuncBody, map);

    // Replace the terminator op with returns.
    for (Block &block : launchOpBody) {
      Block *clonedBlock = map.lookup(&block);
      auto terminator =
          dyn_cast_if_present<gpu::TerminatorOp>(clonedBlock->getTerminator());
      if (!terminator)
        continue;
      OpBuilder replacer(terminator);
      gpu::ReturnOp::create(replacer, terminator->getLoc());
      terminator->erase();
    }

    // Splice now the entry block of the gpu.launch operation at the end of the
    // gpu.func entry block and erase the redundant block.
    Block *clonedLaunchOpEntry = map.lookup(&launchOpBody.front());
    entryBlock.getOperations().splice(entryBlock.getOperations().end(),
                                      clonedLaunchOpEntry->getOperations());
    clonedLaunchOpEntry->erase();

    return outlinedFunc;
  }

  static void convertToLaunchFuncOp(gpu::LaunchOp launchOp,
                                    gpu::GPUFuncOp kernelFunc,
                                    ValueRange operands) {
    OpBuilder builder(launchOp);
    // The launch op has an optional dynamic shared memory size. If it doesn't
    // exist, we use zero.
    Value asyncToken = launchOp.getAsyncToken();
    std::optional<gpu::KernelDim3> clusterSize =
        launchOp.getClusterSizeOperandValues();
    auto launchFunc = gpu::LaunchFuncOp::create(
        builder, launchOp.getLoc(), kernelFunc,
        launchOp.getGridSizeOperandValues(),
        launchOp.getBlockSizeOperandValues(),
        launchOp.getDynamicSharedMemorySize(), operands,
        asyncToken ? asyncToken.getType() : nullptr,
        launchOp.getAsyncDependencies(), /*asyncObject=*/nullptr, clusterSize);
    launchOp.replaceAllUsesWith(launchFunc);
    launchOp.erase();
  }

  void runOnOperation() override {
    ModuleOp module = getOperation();
    PassManager pm(module.getContext());
    OpBuilder builder(module.getContext());
    mlir::ModuleOp moduleOp = getOperation();
    Value gridXVal, gridYVal;
    // Set when a nested walk hits IR this pass cannot lower. The walks below
    // cannot return out of runOnOperation, so they check this flag and stop
    // doing work; the pass result is signalled once they unwind.
    bool hadFailure = false;

    // Create a pattern rewriter to apply transformations to each function
    PatternRewriter rewriter(moduleOp.getContext());
    // Create a set of patterns for transformation. Freeze once so the same
    // pattern set can be reused across multiple launches in the module
    // (FrozenRewritePatternSet is shareable; the underlying mutable
    // RewritePatternSet would be consumed by std::move on first use).
    RewritePatternSet patterns(&getContext());
    patterns.add<AffineApplyToSubPattern, DMAMemcpyToSubPattern,
                 SCFForToSubPattern>(&getContext());
    FrozenRewritePatternSet frozenPatterns(std::move(patterns));

    // Helper: get the i'th size operand of a launch/herd, or a freshly
    // materialized index constant 1 if the dim is absent. air.launch and
    // air.herd support N-D iteration spaces, but the gpu.launch op this
    // pass produces always wants X, Y, Z grid + block dims, so missing
    // higher dims default to 1 (single iteration in that axis).
    auto sizeOrOne = [&](OperandRange sizes, unsigned i,
                         Operation *insertBefore) -> Value {
      if (i < sizes.size())
        return sizes[i];
      OpBuilder::InsertionGuard guard(builder);
      builder.setInsertionPoint(insertBefore);
      return arith::ConstantOp::create(builder, insertBefore->getLoc(),
                                       builder.getIndexAttr(1));
    };

    // Traverse the module and look for air.launch and air.herd ops.
    module.walk([&](air::LaunchOp launchOp) {
      if (hadFailure)
        return;
      launchOp.walk([&](air::SegmentOp segmentOp) {
        if (hadFailure)
          return;
        // Reset grid/block-dim collections for each (launch, segment)
        // pair. These are class members (not local) so without an
        // explicit clear they would carry stale operands from previous
        // launches in the same module — which then dangle into the new
        // gpu.launch op as use-after-frees.
        blkIdx.clear();
        gridIdx.clear();
        gridXVal = nullptr;
        gridYVal = nullptr;
        segmentOp.walk([&](Operation *childOp) {
          if (auto herdOp = dyn_cast_if_present<xilinx::air::HerdOp>(childOp)) {

            auto launchSizes = launchOp.getSizeOperands();
            auto herdSizes = herdOp.getSizeOperands();
            gridXVal = sizeOrOne(launchSizes, 0, launchOp);
            gridYVal = sizeOrOne(launchSizes, 1, launchOp);
            blkIdx.push_back(sizeOrOne(herdSizes, 0, herdOp));
            blkIdx.push_back(sizeOrOne(herdSizes, 1, herdOp));
            gridIdx.push_back(gridXVal);
            gridIdx.push_back(gridYVal);
          }
        });
        gpu::LaunchOp gpuLaunchOp =
            convertLaunchToGPULaunch(launchOp, builder, gridXVal, gridYVal);
        Block &gpuLaunchBlock = gpuLaunchOp.getBody().front();
        auto blockArgs = gpuLaunchBlock.getArguments();

        gpuArgs.assign(blockArgs.begin(), blockArgs.end());
        (void)applyPatternsGreedily(launchOp, frozenPatterns);
        deleteAirHerd(segmentOp, builder, gpuLaunchOp);
        if (failed(deleteAirSegment(launchOp, builder, gpuLaunchOp))) {
          hadFailure = true;
          return;
        }

        // Move the (now-flattened) air.launch body into this specific
        // gpu.launch's body. Pairing must be 1:1 — a previous nested-walk
        // implementation pairwise-merged every gpu.launch with every
        // air.launch in the module, which folded multi-launch programs
        // into a single gpu.launch and dangled launch block args.
        //
        // Replace launch's block args with the launch's outer kernel
        // operands BEFORE moving the body. Without this, after the body
        // moves into gpu.launch and air.launch is erased, the moved ops
        // still reference air.launch's destroyed block args
        // (use-after-free during block destruction).
        Block &launchBlock = launchOp.getRegion().front();
        unsigned numLaunchKernelArgs = launchOp.getNumKernelOperands();
        // Block args layout: [tile_ids..., size_ids..., kernel_args...].
        // Tile ids and sizes are not used by the moved body in the
        // patterns we lower today (compute uses gpu.thread_id directly
        // after deleteAirHerd remap). Kernel-arg block args sit at the
        // tail of the block-arg list.
        unsigned numNonKernelArgs =
            launchBlock.getNumArguments() - numLaunchKernelArgs;
        for (unsigned i = 0; i < numLaunchKernelArgs; ++i) {
          Value outerVal = launchOp.getKernelOperand(i);
          launchBlock.getArgument(numNonKernelArgs + i)
              .replaceAllUsesWith(outerVal);
        }

        mlir::Block &gpuBlock = gpuLaunchOp.getBody().front();
        for (auto &operation :
             llvm::make_early_inc_range(launchBlock.without_terminator())) {
          mlir::Operation &lastOp = gpuBlock.back();
          operation.moveBefore(&lastOp);
        }
        hoistAlloc(gpuLaunchOp, builder);
      });
    });
    if (hadFailure)
      return signalPassFailure();

    module.walk([&](air::ChipletIdOp chipletOp) {
      convertChipletIdToROCDL(chipletOp, builder);
    });
    module.walk([&](air::DmaMemcpyNdOp dmaOp) {
      convertDMAToGPUMemcpy(dmaOp, builder);
    });
    module.walk([&](air::LaunchOp launchOp) {
      Block &launchBlock = launchOp.getBody().front();
      launchBlock.getTerminator()->erase(); // Erase the terminator
      launchOp.erase();                     // Erase the herd operation
    });
  }

  void getDependentDialects(mlir::DialectRegistry &registry) const override {
    registry.insert<mlir::affine::AffineDialect>(),
        registry.insert<mlir::scf::SCFDialect>(),
        registry.insert<mlir::arith::ArithDialect>(),
        registry.insert<mlir::cf::ControlFlowDialect>(),
        registry.insert<mlir::memref::MemRefDialect>(),
        registry.insert<mlir::func::FuncDialect>(),
        registry.insert<mlir::vector::VectorDialect>(), // If used anywhere
        registry.insert<mlir::ROCDL::ROCDLDialect>();
    registry.insert<mlir::LLVM::LLVMDialect>();
    registry.insert<mlir::gpu::GPUDialect>();
    registry.insert<scf::SCFDialect>();
  }

  // Function to print detailed information about a Value (including block
  // arguments)
  void printValueDetails(Value val) {
    if (auto blockArg = mlir::dyn_cast_if_present<BlockArgument>(val)) {
      llvm::outs() << "Block argument: index=" << blockArg.getArgNumber()
                   << " type=" << blockArg.getType() << "\n";
    } else {
      llvm::outs() << "Operation result: " << val << "\n";
    }
  }

  /// Lower air.chiplet_id to a read of the AMDGPU XCC_ID hardware register.
  ///
  /// ROCDL has no s_getreg op (checked ROCDLOps.td: zero matches for getreg,
  /// hwreg or xcc), so this goes straight to the llvm.amdgcn.s.getreg
  /// intrinsic. Its operand is the packed hwreg descriptor
  ///   id | (offset << 6) | ((size - 1) << 11)
  /// (AMDGPUBaseInfo.h: HwregId = bits 5:0, HwregOffset = 10:6,
  /// HwregSize = 15:11 storing size-1), so HW_REG_XCC_ID = 20 read as
  /// bits [0, 16) is 20 | (15 << 11) = 30740. llc -mcpu=gfx942 prints that
  /// back as `hwreg(HW_REG_XCC_ID, 0, 16)`, the same operand Fleet writes by
  /// hand in persistent_kernel.cuh:188.
  void convertChipletIdToROCDL(air::ChipletIdOp op, OpBuilder &builder) {
    constexpr int32_t hwRegXccIdBits0To16 = 30740;
    OpBuilder::InsertionGuard guard(builder);
    builder.setInsertionPoint(op);
    Location loc = op.getLoc();
    Type i32 = builder.getI32Type();
    // arith.constant, not llvm.mlir.constant: the descriptor is an ImmArg, so
    // it must still be a literal by the time LLVM sees the call. It is Pure and
    // operand-free, so LICM will hoist it out of the gpu.launch, and
    // GPUKernelOutlinePass only rematerializes arith::ConstantOp inside the
    // kernel -- an llvm.mlir.constant instead becomes a kernel argument and the
    // immediate is lost.
    Value desc = arith::ConstantOp::create(builder, loc, i32,
                                           builder.getI32IntegerAttr(
                                               hwRegXccIdBits0To16));
    auto call = LLVM::CallIntrinsicOp::create(
        builder, loc, /*resultType=*/i32,
        builder.getStringAttr("llvm.amdgcn.s.getreg"), ValueRange{desc});
    Value asIndex = arith::IndexCastOp::create(
        builder, loc, builder.getIndexType(), call->getResult(0));
    op.getResult().replaceAllUsesWith(asIndex);
    op.erase();
  }

  LogicalResult deleteAirSegment(air::LaunchOp launchOp, OpBuilder &builder,
                                 gpu::LaunchOp gpuLaunchOp) {
    WalkResult walkResult = launchOp.walk([&](Operation *childOp) {
      auto segmentOp = dyn_cast_if_present<xilinx::air::SegmentOp>(childOp);
      if (!segmentOp || segmentOp.getRegion().empty())
        return WalkResult::advance();
      Block &segmentBlock = segmentOp.getRegion().front();

      // Flattening runs the segment body exactly once. gpu.launch offers two
      // coordinate levels and this pass already spends both -- air.launch
      // supplies the grid, air.herd the block -- so a segment has nowhere to
      // put an iteration space of its own. Dropping it is only sound when the
      // space is a single instance; anything wider would silently compute
      // 1/N of the work.
      bool singleInstance =
          llvm::all_of(segmentOp.getSizeOperands(), [](Value v) {
            APInt c;
            return matchPattern(v, m_ConstantInt(&c)) && c.isOne();
          });
      if (!singleInstance) {
        segmentOp.emitError()
            << "air.segment iteration space is not supported by "
               "-air-to-rocdl: gpu.launch's grid is taken by air.launch and "
               "its block by air.herd, so the segment body can only be run "
               "once; only an all-ones iteration space can be flattened";
        return WalkResult::interrupt();
      }

      // Single instance: every id is 0 and every size is 1. Materialize those
      // so uses in the body survive the segment being erased.
      unsigned numDims = segmentOp.getNumDims();
      if (numDims) {
        auto notEmpty = [](BlockArgument a) { return !a.use_empty(); };
        bool idsUsed = llvm::any_of(segmentOp.getIds(), notEmpty);
        bool sizesUsed = llvm::any_of(segmentOp.getSize(), notEmpty);
        if (idsUsed || sizesUsed) {
          OpBuilder::InsertionGuard guard(builder);
          builder.setInsertionPoint(segmentOp);
          Location loc = segmentOp.getLoc();
          if (idsUsed) {
            Value zero = arith::ConstantOp::create(builder, loc,
                                                   builder.getIndexAttr(0));
            for (BlockArgument id : segmentOp.getIds())
              id.replaceAllUsesWith(zero);
          }
          if (sizesUsed) {
            Value one = arith::ConstantOp::create(builder, loc,
                                                  builder.getIndexAttr(1));
            for (BlockArgument sz : segmentOp.getSize())
              sz.replaceAllUsesWith(one);
          }
        }
      }

      // Remap segment kernel arguments to the values passed in from the
      // enclosing scope. Index through getKernelArgument(), which skips the
      // leading ids/sizes: indexing segmentBlock directly remaps the ids and
      // leaves the kernel args dangling once the segment is erased.
      unsigned numKernelArgs = segmentOp.getNumKernelOperands();
      for (unsigned i = 0; i < numKernelArgs; ++i) {
        Value outerVal = segmentOp.getKernelOperand(i);
        segmentOp.getKernelArgument(i).replaceAllUsesWith(outerVal);
      }

      for (auto &operation :
           llvm::make_early_inc_range(segmentBlock.without_terminator())) {
        operation.moveBefore(segmentOp);
      }
      segmentBlock.getTerminator()->erase();
      segmentOp.erase();
      return WalkResult::advance();
    });
    return failure(walkResult.wasInterrupted());
  }

  void deleteAirHerd(xilinx::air::SegmentOp segmentOp, OpBuilder &builder,
                     gpu::LaunchOp gpuLaunchOp) {
    segmentOp.walk([&](Operation *childOp) {
      if (auto herdOp = dyn_cast_if_present<xilinx::air::HerdOp>(childOp)) {
        if (!herdOp.getRegion().empty()) {
          Block &herdBlock = herdOp.getRegion().front();
          Location loc = herdOp.getLoc();

          // Remap herd block arguments per the AIR compute model
          // (docs/AIRComputeModel.md §2.3 + §4): a PE is one wavefront, so
          // the herd's tile ids name warps, not threads:
          //   tile_x   = thread_id_x / wave_size  (= warp-id within block)
          //   tile_y   = thread_id_y               (block-y is unscaled)
          //   size_x   = block_dim_x / wave_size
          //   size_y   = block_dim_y
          // Lane within a PE is available via gpu.lane_id inside the herd
          // body; user code uses it directly for wave-cooperative ops.
          // Block args layout: [tile_x, tile_y, size_x, size_y, kernel_args...]
          builder.setInsertionPoint(herdOp);
          Value tidx = gpu::ThreadIdOp::create(
              builder, loc, builder.getIndexType(), gpu::Dimension::x);
          Value tidy = gpu::ThreadIdOp::create(
              builder, loc, builder.getIndexType(), gpu::Dimension::y);
          Value bdimx = gpu::BlockDimOp::create(
              builder, loc, builder.getIndexType(), gpu::Dimension::x);
          Value bdimy = gpu::BlockDimOp::create(
              builder, loc, builder.getIndexType(), gpu::Dimension::y);
          Value waveSizeC = arith::ConstantOp::create(
              builder, loc, builder.getIndexAttr(waveSize));
          Value warpIdX = arith::DivUIOp::create(builder, loc, tidx, waveSizeC);
          Value numWarpsX =
              arith::DivUIOp::create(builder, loc, bdimx, waveSizeC);

          herdBlock.getArgument(0).replaceAllUsesWith(warpIdX);
          herdBlock.getArgument(1).replaceAllUsesWith(tidy);
          herdBlock.getArgument(2).replaceAllUsesWith(numWarpsX);
          herdBlock.getArgument(3).replaceAllUsesWith(bdimy);

          // Remap kernel operands to the values passed from enclosing scope.
          unsigned numKernelArgs = herdOp.getNumKernelOperands();
          for (unsigned i = 0; i < numKernelArgs; ++i) {
            Value outerVal = herdOp.getKernelOperand(i);
            herdBlock.getArgument(4 + i).replaceAllUsesWith(outerVal);
          }

          for (auto &operation :
               llvm::make_early_inc_range(herdBlock.without_terminator())) {
            operation.moveBefore(herdOp);
          }
          herdBlock.getTerminator()->erase();
          herdOp.erase();
        }
      }
    });
  }

  // Convert air.launch -> gpu.launch with thread block tuning
  gpu::LaunchOp convertLaunchToGPULaunch(xilinx::air::LaunchOp launchOp,
                                         OpBuilder &builder, Value gridXVal,
                                         Value gridYVal) {
    Location loc = launchOp.getLoc();
    // Define grid and block sizes (modify these values as needed for your use
    // case)
    int64_t gridSizeZ = 1;
    int64_t blockSizeZ = 1;

    builder.setInsertionPoint(launchOp);
    Value gridZVal = arith::ConstantOp::create(builder, loc,
                                               builder.getIndexAttr(gridSizeZ));
    Value blockZVal = arith::ConstantOp::create(
        builder, loc, builder.getIndexAttr(blockSizeZ));

    // blkIdx[i] may be a BlockArgument (herd size operand passed in as an
    // SSA value rather than a constant declared in scope); getDefiningOp()
    // is null in that case and the value already dominates launchOp from
    // the enclosing scope — no move needed.
    if (Operation *blockXValOp = blkIdx[0].getDefiningOp())
      blockXValOp->moveBefore(launchOp);
    if (Operation *blockYValOp = blkIdx[1].getDefiningOp())
      blockYValOp->moveBefore(launchOp);

    // Per AIR compute model §2.3: PE = wavefront. blockDim.x = herd.Nx *
    // wave_size so the herd's PE count becomes a warp count, not a thread
    // count. blockDim.y stays at herd.Ny (PEs are 1D in the wave dim).
    Value waveSizeC =
        arith::ConstantOp::create(builder, loc, builder.getIndexAttr(waveSize));
    Value blockXVal = arith::MulIOp::create(builder, loc, blkIdx[0], waveSizeC);

    // Create the gpu.launch operation
    auto gpuLaunchOp =
        gpu::LaunchOp::create(builder, loc, gridXVal, gridYVal, gridZVal,
                              blockXVal, blkIdx[1], blockZVal);

    // Get thread indices for use within the gpu.launch body
    OpBuilder::InsertionGuard guard(builder);
    builder.setInsertionPointToStart(&gpuLaunchOp.getBody().front());

    gpu::TerminatorOp::create(builder, loc);
    return gpuLaunchOp;
  }

  void hoistAlloc(gpu::LaunchOp launchOp, OpBuilder &builder) {
    Location loc = launchOp.getLoc();
    launchOp.walk([&](memref::AllocOp allocOp) {
      // workgroup
      MemRefType memRefType = allocOp.getType();
      if (air::isL2(memRefType)) {
        mlir::Type elementType = memRefType.getElementType();
        llvm::ArrayRef<int64_t> shape = memRefType.getShape();

        // Create a new MemRefType with the same shape, element type, but with a
        // different memory space
        mlir::MemRefType newType =
            mlir::MemRefType::get(shape, elementType, /*affineMap=*/{}, 3);

        auto wg = launchOp.addWorkgroupAttribution(newType, loc);
        allocOp.replaceAllUsesWith(wg); // Replace row with globalRow
        allocOp.erase();
      } else if (air::isL1(memRefType)) {
        mlir::Type elementType = memRefType.getElementType();
        llvm::ArrayRef<int64_t> shape = memRefType.getShape();

        // Create a new MemRefType with the same shape, element type, but with a
        // different memory space
        mlir::MemRefType newType =
            mlir::MemRefType::get(shape, elementType, /*affineMap=*/{}, 5);
        auto wg = launchOp.addPrivateAttribution(newType, loc);
        allocOp.replaceAllUsesWith(wg); // Replace row with globalRow
        allocOp.erase();
      }
    });
    launchOp.walk([&](memref::DeallocOp deallocOp) { deallocOp.erase(); });
  }

  // Delinearize a flat index into multi-dimensional indices for a given shape.
  static SmallVector<Value> delinearizeIndex(OpBuilder &b, Location loc,
                                             Value linear,
                                             ArrayRef<int64_t> shape) {
    int rank = shape.size();
    SmallVector<Value> indices(rank);
    Value remaining = linear;
    for (int i = rank - 1; i >= 0; --i) {
      Value dimSize = arith::ConstantIndexOp::create(b, loc, shape[i]);
      indices[i] = arith::RemSIOp::create(b, loc, remaining, dimSize);
      remaining = arith::DivSIOp::create(b, loc, remaining, dimSize);
    }
    return indices;
  }

  // Linearize multi-dimensional indices into a flat index for a given shape.
  static Value linearizeIndices(OpBuilder &b, Location loc,
                                ArrayRef<Value> indices,
                                ArrayRef<int64_t> shape) {
    int rank = indices.size();
    assert(rank == (int)shape.size());
    Value flat = arith::ConstantIndexOp::create(b, loc, 0);
    for (int i = 0; i < rank; ++i) {
      int64_t stride = 1;
      for (int j = i + 1; j < rank; ++j)
        stride *= shape[j];
      Value strideVal = arith::ConstantIndexOp::create(b, loc, stride);
      Value term = arith::MulIOp::create(b, loc, indices[i], strideVal);
      flat = arith::AddIOp::create(b, loc, flat, term);
    }
    return flat;
  }

  // Compute memref indices from transfer indices, offsets, and strides.
  // Handles rank mismatches between transfer descriptor and memref.
  SmallVector<Value> computeMemrefIndices(OpBuilder &b, Location loc,
                                          ArrayRef<Value> transferIndices,
                                          ArrayRef<Value> offsets,
                                          ArrayRef<Value> strides,
                                          MemRefType memrefType,
                                          ArrayRef<Value> transferSizes) {
    int memrefRank = memrefType.getRank();
    int transferRank = transferIndices.size();

    if (offsets.empty()) {
      // Entire memref addressed.
      if (memrefRank == transferRank)
        return SmallVector<Value>(transferIndices);
      // Rank mismatch: linearize transfer indices, delinearize into memref.
      SmallVector<int64_t> transferShape;
      for (auto sz : transferSizes) {
        APInt val;
        if (matchPattern(sz, m_ConstantInt(&val)))
          transferShape.push_back(val.getSExtValue());
        else
          transferShape.push_back(1);
      }
      Value flat = linearizeIndices(b, loc, transferIndices, transferShape);
      return delinearizeIndex(b, loc, flat, memrefType.getShape());
    }

    if (memrefRank == transferRank) {
      if (strides.empty()) {
        // Unit strides: idx[i] = offset[i] + transferIdx[i]
        SmallVector<Value> result(memrefRank);
        for (int i = 0; i < memrefRank; ++i)
          result[i] =
              arith::AddIOp::create(b, loc, offsets[i], transferIndices[i]);
        return result;
      }
      // Non-unit strides: linearize via offsets + iv*strides, then delinearize.
      Value baseFlat = linearizeIndices(
          b, loc, SmallVector<Value>(offsets.begin(), offsets.end()),
          memrefType.getShape());
      Value transferFlat = arith::ConstantIndexOp::create(b, loc, 0);
      for (int i = 0; i < transferRank; ++i) {
        Value term =
            arith::MulIOp::create(b, loc, transferIndices[i], strides[i]);
        transferFlat = arith::AddIOp::create(b, loc, transferFlat, term);
      }
      Value flat = arith::AddIOp::create(b, loc, baseFlat, transferFlat);
      return delinearizeIndex(b, loc, flat, memrefType.getShape());
    }

    // Rank-reducing: offsets are in memref dimensions, transfer is lower rank.
    // Linearize: base_flat = linearize(offsets, memref_shape)
    //            flat = base_flat + iv[0] * strides[0] (+ iv[1]*strides[1]...)
    // Then delinearize flat back into memref shape.
    Value baseFlat = linearizeIndices(
        b, loc, SmallVector<Value>(offsets.begin(), offsets.end()),
        memrefType.getShape());
    Value transferFlat = arith::ConstantIndexOp::create(b, loc, 0);
    for (int i = 0; i < transferRank; ++i) {
      Value s = (i < (int)strides.size())
                    ? strides[i]
                    : arith::ConstantIndexOp::create(b, loc, 1);
      Value term = arith::MulIOp::create(b, loc, transferIndices[i], s);
      transferFlat = arith::AddIOp::create(b, loc, transferFlat, term);
    }
    Value flat = arith::AddIOp::create(b, loc, baseFlat, transferFlat);
    return delinearizeIndex(b, loc, flat, memrefType.getShape());
  }

  // Lower air.dma_memcpy_nd to SCF loops with memref.load/store.
  // L3→L2 transfers use thread-cooperative loading with gpu.barrier.
  // All other transfers use per-thread nested loops.
  // TODO: Handle async form (async_dependencies and async_token result).
  // Currently only synchronous DMAs are supported on the GPU path.
  void convertDMAToGPUMemcpy(xilinx::air::DmaMemcpyNdOp dmaOp,
                             OpBuilder &builder) {
    builder.setInsertionPointAfter(dmaOp);
    Location loc = dmaOp.getLoc();

    Value srcMemref = dmaOp.getSrcMemref();
    Value dstMemref = dmaOp.getDstMemref();
    auto srcType = cast<MemRefType>(srcMemref.getType());
    auto dstType = cast<MemRefType>(dstMemref.getType());
    // DmaMemcpyNdOp stores offsets/sizes/strides as mixed static/dynamic
    // values; materialize each into an index Value (constant for static
    // entries) so the loop-nest lowering below can consume them uniformly.
    SmallVector<Value> srcOffsets = getValueOrCreateConstantIndexOp(
        builder, loc, dmaOp.getMixedSrcOffsets());
    SmallVector<Value> dstOffsets = getValueOrCreateConstantIndexOp(
        builder, loc, dmaOp.getMixedDstOffsets());
    SmallVector<Value> srcSizes =
        getValueOrCreateConstantIndexOp(builder, loc, dmaOp.getMixedSrcSizes());
    SmallVector<Value> dstSizes =
        getValueOrCreateConstantIndexOp(builder, loc, dmaOp.getMixedDstSizes());
    SmallVector<Value> srcStrides = getValueOrCreateConstantIndexOp(
        builder, loc, dmaOp.getMixedSrcStrides());
    SmallVector<Value> dstStrides = getValueOrCreateConstantIndexOp(
        builder, loc, dmaOp.getMixedDstStrides());

    // Determine transfer sizes from whichever side has explicit sizes,
    // or fall back to the smaller memref's static shape.
    SmallVector<Value> transferSizes;
    if (!srcSizes.empty()) {
      transferSizes = srcSizes;
    } else if (!dstSizes.empty()) {
      transferSizes = dstSizes;
    } else {
      ArrayRef<int64_t> shape = (srcType.getRank() <= dstType.getRank())
                                    ? srcType.getShape()
                                    : dstType.getShape();
      for (int64_t s : shape)
        transferSizes.push_back(
            arith::ConstantIndexOp::create(builder, loc, s));
    }
    int transferRank = transferSizes.size();

    Value c0 = arith::ConstantIndexOp::create(builder, loc, 0);
    Value c1 = arith::ConstantIndexOp::create(builder, loc, 1);

    bool isGlobalToShared = air::isL3(srcType) && air::isL2(dstType);

    if (isGlobalToShared) {
      // Thread-cooperative loading: distribute total elements across threads.
      Value total = transferSizes[0];
      for (int i = 1; i < transferRank; ++i)
        total = arith::MulIOp::create(builder, loc, total, transferSizes[i]);

      // Linearize 3D thread index to handle multi-dimensional blocks.
      Value tx = gpu::ThreadIdOp::create(builder, loc, builder.getIndexType(),
                                         gpu::Dimension::x);
      Value ty = gpu::ThreadIdOp::create(builder, loc, builder.getIndexType(),
                                         gpu::Dimension::y);
      Value tz = gpu::ThreadIdOp::create(builder, loc, builder.getIndexType(),
                                         gpu::Dimension::z);
      Value bx = gpu::BlockDimOp::create(builder, loc, builder.getIndexType(),
                                         gpu::Dimension::x);
      Value by = gpu::BlockDimOp::create(builder, loc, builder.getIndexType(),
                                         gpu::Dimension::y);
      Value bz = gpu::BlockDimOp::create(builder, loc, builder.getIndexType(),
                                         gpu::Dimension::z);
      // tidx = tx + ty * bx + tz * bx * by
      Value tyBx = arith::MulIOp::create(builder, loc, ty, bx);
      Value bxBy = arith::MulIOp::create(builder, loc, bx, by);
      Value tzBxBy = arith::MulIOp::create(builder, loc, tz, bxBy);
      Value tidx = arith::AddIOp::create(builder, loc, tx, tyBx);
      tidx = arith::AddIOp::create(builder, loc, tidx, tzBxBy);
      // bdim = bx * by * bz
      Value bdim = arith::MulIOp::create(builder, loc, bxBy, bz);

      auto loop = scf::ForOp::create(builder, loc, tidx, total, bdim);
      builder.setInsertionPointToStart(loop.getBody());
      Value linear = loop.getInductionVar();

      // Delinearize into transfer-dimension indices.
      SmallVector<int64_t> transferShape;
      for (auto sz : transferSizes) {
        APInt val;
        if (matchPattern(sz, m_ConstantInt(&val)))
          transferShape.push_back(val.getSExtValue());
        else
          transferShape.push_back(1);
      }
      SmallVector<Value> tIdx =
          delinearizeIndex(builder, loc, linear, transferShape);

      SmallVector<Value> sIdx = computeMemrefIndices(
          builder, loc, tIdx, srcOffsets, srcStrides, srcType, transferSizes);
      SmallVector<Value> dIdx = computeMemrefIndices(
          builder, loc, tIdx, dstOffsets, dstStrides, dstType, transferSizes);

      Value val = memref::LoadOp::create(builder, loc, srcMemref, sIdx);
      memref::StoreOp::create(builder, loc, val, dstMemref, dIdx);

      builder.setInsertionPointAfter(loop);
      if (!isa_and_nonnull<gpu::BarrierOp>(dmaOp->getNextNode()))
        gpu::BarrierOp::create(builder, loc);
    } else {
      // Per-thread path: nested loops over transfer dimensions.
      SmallVector<scf::ForOp> loops;
      for (int i = 0; i < transferRank; ++i) {
        auto loop = scf::ForOp::create(builder, loc, c0, transferSizes[i], c1);
        loops.push_back(loop);
        builder.setInsertionPointToStart(loop.getBody());
      }

      SmallVector<Value> tIdx;
      for (auto &loop : loops)
        tIdx.push_back(loop.getInductionVar());

      SmallVector<Value> sIdx = computeMemrefIndices(
          builder, loc, tIdx, srcOffsets, srcStrides, srcType, transferSizes);
      SmallVector<Value> dIdx = computeMemrefIndices(
          builder, loc, tIdx, dstOffsets, dstStrides, dstType, transferSizes);

      Value val = memref::LoadOp::create(builder, loc, srcMemref, sIdx);
      memref::StoreOp::create(builder, loc, val, dstMemref, dIdx);
    }

    dmaOp.erase();
  }
};
} // namespace

namespace xilinx {
namespace air {

std::unique_ptr<mlir::Pass> createAIRToROCDLPass() {
  return std::make_unique<ConvertAIRToROCDLPass>();
}

} // namespace air
} // namespace xilinx
