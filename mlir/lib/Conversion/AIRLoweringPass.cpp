//===- AIRLoweringPass.cpp --------------------------------------*- C++ -*-===//
//
// Copyright (C) 2020-2022, Xilinx Inc. All rights reserved.
// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//

#include "PassDetail.h"

#include "air/Conversion/AIRLoweringPass.h"
#include "air/Conversion/AIRPipeline.h"
#include "air/Dialect/AIR/AIRDialect.h"
#include "air/Dialect/AIRRt/AIRRtDialect.h"
#include "air/Dialect/AIRRt/AIRRtOps.h"
#include "air/Util/Dependency.h"
#include "air/Util/Util.h"

#include "aie/Dialect/AIE/IR/AIEDialect.h"

#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Affine/IR/AffineValueMap.h"
#include "mlir/Dialect/Bufferization/IR/Bufferization.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/Dialect/Linalg/IR/Linalg.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/IRMapping.h"
#include "mlir/IR/IntegerSet.h"
#include "mlir/IR/OperationSupport.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Transforms/DialectConversion.h"

#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

#include <vector>

#define DEBUG_TYPE "air-lowering-pass"

using namespace mlir;
using namespace xilinx;

namespace {

class AIRLaunchConversion : public ConversionPattern {
public:
  explicit AIRLaunchConversion(MLIRContext *context)
      : ConversionPattern(air::LaunchOp::getOperationName(), 1, context) {}

  LogicalResult
  matchAndRewrite(Operation *op, ArrayRef<Value> operands,
                  ConversionPatternRewriter &rewriter) const override {
    air::LaunchOp launch = cast<air::LaunchOp>(op);

    std::string launch_name("launch");
    if (auto attr =
            op->getAttrOfType<StringAttr>(SymbolTable::getSymbolAttrName()))
      launch_name = attr.getValue().str();

    SmallVector<Value> lbs, ubs, steps;
    auto c0 = rewriter.create<arith::ConstantIndexOp>(op->getLoc(), 0);
    auto c1 = rewriter.create<arith::ConstantIndexOp>(op->getLoc(), 1);

    // make scf.parallel to replace air.launch
    for (auto d : launch.getSizeOperands()) {
      lbs.push_back(c0);
      ubs.push_back(d);
      steps.push_back(c1);
    }
    if (lbs.empty()) {
      lbs.push_back(c0);
      ubs.push_back(c1);
      steps.push_back(c1);
    }
    auto scfPar =
        rewriter.create<scf::ParallelOp>(op->getLoc(), lbs, ubs, steps);

    // map launch iteration space to scf.parallel ivs
    for (auto p : llvm::zip(launch.getIds(), scfPar.getInductionVars()))
      std::get<0>(p).replaceAllUsesWith(std::get<1>(p));

    // map launch size to scf.parallel upper bounds
    for (auto p : llvm::zip(launch.getSizeOperands(), scfPar.getUpperBound()))
      if (std::get<0>(p) != std::get<1>(p))
        std::get<0>(p).replaceAllUsesWith(std::get<1>(p));

    int i = 0;
    for (auto arg : launch.getKernelArguments())
      arg.replaceAllUsesWith(launch.getKernelOperand(i++));

    auto &body = launch.getBody().front().getOperations();
    scfPar.getBody()->getOperations().splice(scfPar.getBody()->begin(), body,
                                             body.begin(), --body.end());

    if (op->getNumResults()) {
      rewriter.setInsertionPoint(scfPar);
      SmallVector<Value> deps;
      for (auto &o : operands)
        if (o.getType().isa<airrt::EventType>())
          deps.push_back(o);
      rewriter.replaceOpWithNewOp<airrt::WaitAllOp>(
          op, airrt::EventType::get(op->getContext()), deps);
    } else
      rewriter.eraseOp(launch);
    return success();
  }
};

class AIRSegmentConversion : public ConversionPattern {
public:
  explicit AIRSegmentConversion(MLIRContext *context)
      : ConversionPattern(air::SegmentOp::getOperationName(), 1, context) {}

  LogicalResult
  matchAndRewrite(Operation *op, ArrayRef<Value> operands,
                  ConversionPatternRewriter &rewriter) const override {
    air::SegmentOp segment = cast<air::SegmentOp>(op);
    if (auto attr =
            op->getAttrOfType<StringAttr>(SymbolTable::getSymbolAttrName())) {
      auto segment_name = attr.getValue().str();
      rewriter.create<airrt::SegmentLoadOp>(op->getLoc(), rewriter.getI64Type(),
                                            segment_name);
    }

    SmallVector<Value> deps;
    for (auto &o : operands)
      if (o.getType().isa<airrt::EventType>())
        deps.push_back(o);
    if (op->getNumResults()) {
      auto w = rewriter.create<airrt::WaitAllOp>(
          op->getLoc(), airrt::EventType::get(op->getContext()), deps);
      segment.getResult(0).replaceAllUsesWith(w.getResult(0));
    }

    SmallVector<Value> lbs, ubs, steps;
    auto c0 = rewriter.create<arith::ConstantIndexOp>(op->getLoc(), 0);
    auto c1 = rewriter.create<arith::ConstantIndexOp>(op->getLoc(), 1);

    // make scf.parallel to replace air.segment
    for (auto d : segment.getSizeOperands()) {
      lbs.push_back(c0);
      ubs.push_back(d);
      steps.push_back(c1);
    }
    if (lbs.empty()) {
      lbs.push_back(c0);
      ubs.push_back(c1);
      steps.push_back(c1);
    }
    auto scfPar =
        rewriter.create<scf::ParallelOp>(op->getLoc(), lbs, ubs, steps);

    // map segment iteration space to scf.parallel ivs
    for (auto p : llvm::zip(segment.getIds(), scfPar.getInductionVars()))
      std::get<0>(p).replaceAllUsesWith(std::get<1>(p));

    // map segment size to scf.parallel upper bounds
    for (auto p : llvm::zip(segment.getSizeOperands(), scfPar.getUpperBound()))
      std::get<0>(p).replaceAllUsesWith(std::get<1>(p));

    int i = 0;
    for (auto arg : segment.getKernelArguments())
      arg.replaceAllUsesWith(segment.getKernelOperand(i++));

    auto &body = segment.getBody().front().getOperations();
    scfPar.getBody()->getOperations().splice(scfPar.getBody()->begin(), body,
                                             body.begin(), --body.end());

    rewriter.eraseOp(op);
    return success();
  }
};

class AIRHerdConversion : public ConversionPattern {
public:
  explicit AIRHerdConversion(MLIRContext *context)
      : ConversionPattern(air::HerdOp::getOperationName(), 1, context) {}

  LogicalResult
  matchAndRewrite(Operation *op, ArrayRef<Value> operands,
                  ConversionPatternRewriter &rewriter) const override {
    air::HerdOp herd = cast<air::HerdOp>(op);

    auto herd_name_attr =
        op->getAttrOfType<StringAttr>(SymbolTable::getSymbolAttrName());
    if (!herd_name_attr) {
      emitError(op->getLoc(),
                "error lowering air.herd: herd name is undefined.\n");
      return failure();
    }

    rewriter.create<airrt::HerdLoadOp>(op->getLoc(), rewriter.getI64Type(),
                                       herd_name_attr.getValue().str());

    SmallVector<Value, 4> deps;
    for (auto &o : operands)
      if (o.getType().isa<airrt::EventType>())
        deps.push_back(o);
    if (op->getNumResults()) {
      auto w = rewriter.create<airrt::WaitAllOp>(
          op->getLoc(), airrt::EventType::get(op->getContext()), deps);
      herd.getResult(0).replaceAllUsesWith(w.getResult(0));
    }

    // If the herd doesn't contain a dma op, then it can be deleted
    SmallVector<Operation *> herdOps;
    herd.walk([&](air::DmaMemcpyNdOp op) { herdOps.push_back(op); });

    auto herd_size = herd.getSizeOperands();
    int64_t herd_size_x = herd.getNumCols();
    int64_t herd_size_y = herd.getNumRows();

    auto outer =
        rewriter.create<affine::AffineForOp>(herd.getLoc(), 0, herd_size_x);
    auto outer_builder = OpBuilder::atBlockBegin(outer.getBody());
    auto inner = outer_builder.create<affine::AffineForOp>(herd.getLoc(), 0,
                                                           herd_size_y);

    outer->setAttr("air.herd", StringAttr::get(op->getContext(), "outer"));
    inner->setAttr("air.herd", StringAttr::get(op->getContext(), "inner"));

    herd.getSize()[0].replaceAllUsesWith(herd_size[0]);
    herd.getSize()[1].replaceAllUsesWith(herd_size[1]);
    herd.getIds()[0].replaceAllUsesWith(outer.getInductionVar());
    herd.getIds()[1].replaceAllUsesWith(inner.getInductionVar());

    if (herdOps.size()) {
      int i = 0;
      for (auto arg : herd.getKernelArguments())
        arg.replaceAllUsesWith(herd.getKernelOperand(i++));

      auto &body = herd.getBody().front().getOperations();
      inner.getBody()->getOperations().splice(inner.getBody()->begin(), body,
                                              body.begin(), --body.end());
    }
    rewriter.eraseOp(op);
    return success();
  }
};

class AIRPipelineConversion : public ConversionPattern {
public:
  explicit AIRPipelineConversion(MLIRContext *context)
      : ConversionPattern(air::HerdPipelineOp::getOperationName(), 1, context) {
  }

  LogicalResult
  matchAndRewrite(Operation *op, ArrayRef<Value> operands,
                  ConversionPatternRewriter &rewriter) const override {
    auto pipeOp = cast<air::HerdPipelineOp>(op);
    Block &bb = pipeOp.getBody().front();
    rewriter.eraseOp(pipeOp.getBody().back().getTerminator());
    bb.getOperations().splice(Block::iterator(op), bb.getOperations());
    rewriter.eraseOp(op);
    return success();
  }
};

class AIRPipelinePutConversion : public ConversionPattern {
public:
  explicit AIRPipelinePutConversion(MLIRContext *context)
      : ConversionPattern(air::PipelinePutOp::getOperationName(), 1, context) {}

  LogicalResult
  matchAndRewrite(Operation *op, ArrayRef<Value> operands,
                  ConversionPatternRewriter &rewriter) const override {
    rewriter.eraseOp(op);
    return success();
  }
};

class AIRPipelineGetConversion : public ConversionPattern {
public:
  explicit AIRPipelineGetConversion(MLIRContext *context)
      : ConversionPattern(air::PipelineGetOp::getOperationName(), 1, context) {}

  LogicalResult
  matchAndRewrite(Operation *op, ArrayRef<Value> operands,
                  ConversionPatternRewriter &rewriter) const override {
    auto getOp = cast<air::PipelineGetOp>(op);
    SmallVector<Value, 2> gets;
    for (auto r : getOp.getResults()) {
      if (auto ty = r.getType().dyn_cast<RankedTensorType>())
        gets.push_back(rewriter.create<bufferization::AllocTensorOp>(
            op->getLoc(), ty, ValueRange{}));
      else
        return failure();
    }
    rewriter.replaceOp(op, gets);
    return success();
  }
};

class AIRWaitAllToAIRRtConversion : public OpConversionPattern<air::WaitAllOp> {
public:
  using OpConversionPattern<air::WaitAllOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(air::WaitAllOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    SmallVector<Type, 1> tys;
    if (op->getNumResults())
      tys.push_back(airrt::EventType::get(op->getContext()));

    rewriter.replaceOpWithNewOp<airrt::WaitAllOp>(op, tys,
                                                  adaptor.getOperands());
    return success();
  }
};

class AIRDmaMemcpyNdToAIRRtConversion
    : public OpConversionPattern<air::DmaMemcpyNdOp> {
public:
  using OpConversionPattern<air::DmaMemcpyNdOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(air::DmaMemcpyNdOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    auto loc = op->getLoc();
    auto ctx = op->getContext();

    SmallVector<Value, 4> deps;
    for (auto o : adaptor.getOperands())
      if (o.getType().isa<airrt::EventType>())
        deps.push_back(o);
    if (deps.size())
      rewriter.create<airrt::WaitAllOp>(
          op->getLoc(), airrt::EventType::get(op->getContext()), deps);

    MemRefType src = op.getSrcMemref().getType().cast<MemRefType>();
    MemRefType dst = op.getDstMemref().getType().cast<MemRefType>();
    bool isFromTile = false;
    bool isFullMemcpy = false;
    if (src.getMemorySpaceAsInt() == (int)air::MemorySpace::L1 &&
        dst.getMemorySpaceAsInt() == (int)air::MemorySpace::L3) {
      isFromTile = true;
    } else if (dst.getMemorySpaceAsInt() == (int)air::MemorySpace::L1 &&
               src.getMemorySpaceAsInt() == (int)air::MemorySpace::L3) {
      isFromTile = false;
    } else if (src.getMemorySpaceAsInt() == (int)air::MemorySpace::L1 &&
               dst.getMemorySpaceAsInt() == (int)air::MemorySpace::L2) {
      isFromTile = true;
    } else if (dst.getMemorySpaceAsInt() == (int)air::MemorySpace::L1 &&
               src.getMemorySpaceAsInt() == (int)air::MemorySpace::L2) {
      isFromTile = false;
    } else if (src.getMemorySpaceAsInt() == (int)air::MemorySpace::L3 &&
               dst.getMemorySpaceAsInt() == (int)air::MemorySpace::L2) {
      isFullMemcpy = true;
    } else if (dst.getMemorySpaceAsInt() == (int)air::MemorySpace::L3 &&
               src.getMemorySpaceAsInt() == (int)air::MemorySpace::L2) {
      isFromTile = true;
      isFullMemcpy = true;
    } else
      return failure();

    SmallVector<Value, 16> opers;

    if (!isFullMemcpy) {
      auto idTy = IntegerType::get(op->getContext(), 32);
      if (auto id_attr = op->getAttrOfType<IntegerAttr>("id")) {
        opers.push_back(rewriter.create<arith::ConstantOp>(loc, idTy, id_attr));
      } else {
        opers.push_back(rewriter.create<arith::ConstantOp>(
            loc, idTy, IntegerAttr::get(idTy, 0)));
      }

      air::HerdOp launch = op->getParentOfType<air::HerdOp>();
      if (!launch) {

        affine::AffineForOp afo = op->getParentOfType<affine::AffineForOp>();
        while (afo && !afo->getAttr("air.herd"))
          afo = afo->getParentOfType<affine::AffineForOp>();
        if (!afo)
          return failure();
        opers.push_back(afo.getInductionVar());

        afo = afo->getParentOfType<affine::AffineForOp>();
        while (afo && !afo->getAttr("air.herd"))
          afo = afo->getParentOfType<affine::AffineForOp>();
        if (!afo)
          return failure();
        opers.push_back(afo.getInductionVar());
      } else {
        auto tileIds = launch.getIds();
        opers.push_back(tileIds[0]);
        opers.push_back(tileIds[1]);
      }
      opers[1] = rewriter.create<arith::IndexCastOp>(
          op->getLoc(), IntegerType::get(op->getContext(), 64), opers[1]);
      opers[2] = rewriter.create<arith::IndexCastOp>(
          op->getLoc(), IntegerType::get(op->getContext(), 64), opers[2]);

      if (isFromTile)
        opers.push_back(op.getDstMemref());
      else
        opers.push_back(op.getSrcMemref());
    } else {
      opers.push_back(op.getDstMemref());
      opers.push_back(op.getSrcMemref());
    }
    auto i64Ty = rewriter.getI64Type();
    auto zero = rewriter.create<arith::ConstantOp>(loc, i64Ty,
                                                   IntegerAttr::get(i64Ty, 0));
    auto one = rewriter.create<arith::ConstantOp>(loc, i64Ty,
                                                  IntegerAttr::get(i64Ty, 1));

    SmallVector<Value, 4> offsets(4, zero);
    SmallVector<Value, 4> lengths(4, one);
    SmallVector<Value, 3> strides(3, zero);

    int idx = 4 - src.getRank();
    for (auto o : isFromTile ? op.getDstOffsets() : op.getSrcOffsets())
      offsets[idx++] = rewriter.create<arith::IndexCastOp>(
          op->getLoc(), IntegerType::get(ctx, 64), o);
    idx = 4 - dst.getRank();
    auto op_strides = isFromTile ? op.getDstStrides() : op.getSrcStrides();
    if (op_strides.size())
      for (auto o : op_strides.drop_back())
        strides[idx++] = rewriter.create<arith::IndexCastOp>(
            op->getLoc(), IntegerType::get(ctx, 64), o);
    idx = 4 - src.getRank();
    for (auto o : isFromTile ? op.getDstSizes() : op.getSrcSizes())
      lengths[idx++] = rewriter.create<arith::IndexCastOp>(
          op->getLoc(), IntegerType::get(ctx, 64), o);

    opers.append(offsets);
    opers.append(lengths);
    opers.append(strides);

    Operation *airrtOp = nullptr;
    SmallVector<Type, 1> tys;
    if (op->getNumResults())
      tys.push_back(airrt::EventType::get(ctx));
    if (isFullMemcpy) {
      airrtOp = rewriter.create<airrt::MemcpyNdOp>(loc, tys, opers);
    } else {
      airrtOp = rewriter.create<airrt::DmaMemcpyNdOp>(loc, tys, opers);
    }
    rewriter.replaceOp(op, airrtOp->getResults());
    return success();
  }
};

class AIRChannelPutToAIRRtConversion
    : public OpConversionPattern<xilinx::air::ChannelPutOp> {
public:
  using OpConversionPattern<xilinx::air::ChannelPutOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(xilinx::air::ChannelPutOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    auto loc = op->getLoc();
    auto ctx = op->getContext();

    if (op->getParentOfType<air::HerdOp>())
      return failure();

    if (op->getParentOfType<AIE::CoreOp>())
      return failure();

    // Resolve channel op's dependency list
    SmallVector<Value, 4> deps;
    xilinx::airrt::WaitAllOp placeholder = nullptr;
    for (auto o : adaptor.getOperands())
      if (o.getType().isa<xilinx::airrt::EventType>())
        deps.push_back(o);
    if (deps.size())
      placeholder = rewriter.create<xilinx::airrt::WaitAllOp>(
          op->getLoc(), xilinx::airrt::EventType::get(op->getContext()), deps);

    // Get src and dst memref types
    auto getOps = getTheOtherChannelOpThroughSymbol(op);
    auto getOp = getOps[0];

    MemRefType srcType = op.getSrc().getType().cast<MemRefType>();
    MemRefType dstType = getOp.getDst().getType().cast<MemRefType>();

    bool isFromTile =
        srcType.getMemorySpaceAsInt() == (int)xilinx::air::MemorySpace::L1;
    bool isFullMemcpy = false;
    if (srcType.getMemorySpaceAsInt() == (int)xilinx::air::MemorySpace::L3 &&
        dstType.getMemorySpaceAsInt() == (int)xilinx::air::MemorySpace::L2) {
      isFullMemcpy = true;
    } else if (dstType.getMemorySpaceAsInt() ==
                   (int)xilinx::air::MemorySpace::L3 &&
               srcType.getMemorySpaceAsInt() ==
                   (int)xilinx::air::MemorySpace::L2) {
      isFullMemcpy = true;
    }
    if (!isFromTile && !isFullMemcpy) {
      SmallVector<Value, 16> opers;

      auto idTy = IntegerType::get(op->getContext(), 32);
      // Get op id of the internal put/get op
      if (auto id_attr = getOp->getAttrOfType<IntegerAttr>("id")) {
        opers.push_back(rewriter.create<arith::ConstantOp>(loc, idTy, id_attr));
      } else {
        opers.push_back(rewriter.create<arith::ConstantOp>(
            loc, idTy, IntegerAttr::get(idTy, 0)));
      }

      auto i64Ty = rewriter.getI64Type();
      auto zero = rewriter.create<arith::ConstantOp>(
          loc, i64Ty, IntegerAttr::get(i64Ty, 0));
      auto one = rewriter.create<arith::ConstantOp>(loc, i64Ty,
                                                    IntegerAttr::get(i64Ty, 1));

      scf::ParallelOp launch = op->getParentOfType<scf::ParallelOp>();
      if (!launch) {
        if (auto for_op = op->getParentOfType<scf::ForOp>()) {
          // TODO: complete this.
          assert(false);
        } else {
          opers.push_back(zero);
          opers.push_back(zero);
        }
      } else {
        opers.push_back(rewriter.create<arith::IndexCastOp>(
            op->getLoc(), IntegerType::get(op->getContext(), 64),
            launch.getInductionVars()[0]));
        opers.push_back(rewriter.create<arith::IndexCastOp>(
            op->getLoc(), IntegerType::get(op->getContext(), 64),
            launch.getInductionVars()[1]));
      }

      opers.push_back(op.getSrcMemref());

      SmallVector<Value, 4> offsets(4, zero);
      SmallVector<Value, 4> lengths(4, one);
      SmallVector<Value, 3> strides(3, zero);

      int idx = 4 - srcType.getRank();
      for (auto o : op.getSrcOffsets()) {
        offsets[idx++] = rewriter.create<arith::IndexCastOp>(
            op->getLoc(), IntegerType::get(ctx, 64), o);
      }

      idx = 4 - dstType.getRank();
      auto op_strides = op.getSrcStrides();
      if (op_strides.size())
        for (auto o : op_strides.drop_back())
          strides[idx++] = rewriter.create<arith::IndexCastOp>(
              op->getLoc(), IntegerType::get(ctx, 64), o);
      idx = 4 - srcType.getRank();
      for (auto o : op.getSrcSizes())
        lengths[idx++] = rewriter.create<arith::IndexCastOp>(
            op->getLoc(), IntegerType::get(ctx, 64), o);

      opers.append(offsets);
      opers.append(lengths);
      opers.append(strides);

      Operation *airrtOp = nullptr;
      SmallVector<Type, 1> tys;
      if (op->getNumResults())
        tys.push_back(airrt::EventType::get(ctx));
      if (isFullMemcpy) {
        airrtOp = rewriter.create<airrt::MemcpyNdOp>(loc, tys, opers);
      } else {
        airrtOp = rewriter.create<airrt::DmaMemcpyNdOp>(loc, tys, opers);
      }

      rewriter.replaceOp(op, airrtOp->getResults());
      return success();
    }

    // If memcpy between L1 and L3, and this op is the L1 side, then this
    // indicates a bug because it should have been deleted with herd.
    assert(false);
    return failure();
  }
};

class AIRChannelGetToAIRRtConversion
    : public OpConversionPattern<xilinx::air::ChannelGetOp> {
public:
  using OpConversionPattern<xilinx::air::ChannelGetOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(xilinx::air::ChannelGetOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    auto loc = op->getLoc();
    auto ctx = op->getContext();

    if (op->getParentOfType<air::HerdOp>())
      return failure();

    if (op->getParentOfType<AIE::CoreOp>())
      return failure();

    // Resolve channel op's dependency list
    SmallVector<Value, 4> deps;
    xilinx::airrt::WaitAllOp placeholder = nullptr;
    for (auto o : adaptor.getOperands())
      if (o.getType().isa<xilinx::airrt::EventType>())
        deps.push_back(o);
    if (deps.size())
      placeholder = rewriter.create<xilinx::airrt::WaitAllOp>(
          op->getLoc(), xilinx::airrt::EventType::get(op->getContext()), deps);

    // Get src and dst memref types
    auto putOps = getTheOtherChannelOpThroughSymbol(op);
    auto putOp = putOps[0];

    MemRefType srcType = putOp.getSrc().getType().cast<MemRefType>();
    MemRefType dstType = op.getDst().getType().cast<MemRefType>();

    bool isToTile =
        dstType.getMemorySpaceAsInt() == (int)xilinx::air::MemorySpace::L1;
    bool isFullMemcpy = false;
    if (srcType.getMemorySpaceAsInt() == (int)xilinx::air::MemorySpace::L3 &&
        dstType.getMemorySpaceAsInt() == (int)xilinx::air::MemorySpace::L2) {
      isFullMemcpy = true;
    } else if (dstType.getMemorySpaceAsInt() ==
                   (int)xilinx::air::MemorySpace::L3 &&
               srcType.getMemorySpaceAsInt() ==
                   (int)xilinx::air::MemorySpace::L2) {
      isFullMemcpy = true;
    }
    if (!isToTile && !isFullMemcpy) {
      SmallVector<Value, 16> opers;

      auto idTy = IntegerType::get(op->getContext(), 32);
      // Get op id of the internal put/get op
      if (auto id_attr = putOp->getAttrOfType<IntegerAttr>("id")) {
        opers.push_back(rewriter.create<arith::ConstantOp>(loc, idTy, id_attr));
      } else {
        opers.push_back(rewriter.create<arith::ConstantOp>(
            loc, idTy, IntegerAttr::get(idTy, 0)));
      }

      auto i64Ty = rewriter.getI64Type();
      auto zero = rewriter.create<arith::ConstantOp>(
          loc, i64Ty, IntegerAttr::get(i64Ty, 0));
      auto one = rewriter.create<arith::ConstantOp>(loc, i64Ty,
                                                    IntegerAttr::get(i64Ty, 1));

      scf::ParallelOp launch = op->getParentOfType<scf::ParallelOp>();
      if (!launch) {
        if (auto for_op = op->getParentOfType<scf::ForOp>()) {
          // TODO: complete this.
          assert(false);
        } else {
          opers.push_back(zero);
          opers.push_back(zero);
        }
      } else {
        opers.push_back(rewriter.create<arith::IndexCastOp>(
            op->getLoc(), IntegerType::get(op->getContext(), 64),
            launch.getInductionVars()[0]));
        opers.push_back(rewriter.create<arith::IndexCastOp>(
            op->getLoc(), IntegerType::get(op->getContext(), 64),
            launch.getInductionVars()[1]));
      }

      opers.push_back(op.getDstMemref());

      SmallVector<Value, 4> offsets(4, zero);
      SmallVector<Value, 4> lengths(4, one);
      SmallVector<Value, 3> strides(3, zero);

      int idx = 4 - srcType.getRank();
      for (auto o : op.getDstOffsets()) {
        offsets[idx++] = rewriter.create<arith::IndexCastOp>(
            op->getLoc(), IntegerType::get(ctx, 64), o);
      }

      idx = 4 - dstType.getRank();
      auto op_strides = op.getDstStrides();
      if (op_strides.size())
        for (auto o : op_strides.drop_back())
          strides[idx++] = rewriter.create<arith::IndexCastOp>(
              op->getLoc(), IntegerType::get(ctx, 64), o);
      idx = 4 - srcType.getRank();
      for (auto o : op.getDstSizes())
        lengths[idx++] = rewriter.create<arith::IndexCastOp>(
            op->getLoc(), IntegerType::get(ctx, 64), o);

      opers.append(offsets);
      opers.append(lengths);
      opers.append(strides);

      Operation *airrtOp = nullptr;
      SmallVector<Type, 1> tys;
      if (op->getNumResults())
        tys.push_back(airrt::EventType::get(ctx));
      if (isFullMemcpy) {
        airrtOp = rewriter.create<airrt::MemcpyNdOp>(loc, tys, opers);
      } else {
        airrtOp = rewriter.create<airrt::DmaMemcpyNdOp>(loc, tys, opers);
      }

      rewriter.replaceOp(op, airrtOp->getResults());
      return success();
    }

    // If memcpy between L1 and L3, and this op is the L1 side, then this
    // indicates a bug because it should have been deleted with herd.
    assert(false);
    return failure();
  }
};

class L2AllocToAIRRtConversion : public ConversionPattern {
public:
  explicit L2AllocToAIRRtConversion(MLIRContext *context)
      : ConversionPattern(memref::AllocOp::getOperationName(), 1, context) {}

  LogicalResult
  matchAndRewrite(Operation *op, ArrayRef<Value> operands,
                  ConversionPatternRewriter &rewriter) const override {
    auto alloc = cast<memref::AllocOp>(op);
    auto type = alloc.getType();
    if (type.getMemorySpaceAsInt() == (int)air::MemorySpace::L2) {
      rewriter.replaceOpWithNewOp<airrt::AllocOp>(op, type);
      return success();
    }
    return failure();
  }
};

class L2DeallocToAIRRtConversion : public ConversionPattern {
public:
  explicit L2DeallocToAIRRtConversion(MLIRContext *context)
      : ConversionPattern(memref::DeallocOp::getOperationName(), 1, context) {}

  LogicalResult
  matchAndRewrite(Operation *op, ArrayRef<Value> operands,
                  ConversionPatternRewriter &rewriter) const override {
    auto dealloc = cast<memref::DeallocOp>(op);
    auto type = dealloc.getMemref().getType().cast<MemRefType>();
    if (type.getMemorySpaceAsInt() == (int)air::MemorySpace::L2) {
      rewriter.replaceOpWithNewOp<airrt::DeallocOp>(op, SmallVector<Type>{},
                                                    op->getOperands());
      return success();
    }
    return failure();
  }
};

LogicalResult lowerAirExecute(Operation *op) {
  ModuleOp module = dyn_cast<ModuleOp>(op);
  if (!module)
    return failure();

  SmallVector<Operation *, 8> erased;
  module->walk([&](air::ExecuteOp exe) {
    auto &bb = exe.getBody().front();
    unsigned idx = 0;

    OpBuilder builder(exe);
    if (exe.getAsyncDependencies().size())
      builder.create<air::WaitAllOp>(op->getLoc(), Type{},
                                     exe.getAsyncDependencies());

    for (auto &arg : bb.getArguments()) {
      arg.replaceAllUsesWith(exe.getOperand(idx));
      idx++;
    }
    exe.walk([&](air::ExecuteTerminatorOp t) {
      int resultIdx = 1;
      for (auto r : t->getOperands())
        exe.getResult(resultIdx++).replaceAllUsesWith(r);
      erased.push_back(t);
    });
    exe->getBlock()->getOperations().splice(Block::iterator(exe),
                                            bb.getOperations());
    if (exe.getNumResults() > 0) {
      auto w = builder.create<air::WaitAllOp>(
          op->getLoc(), air::AsyncTokenType::get(exe->getContext()),
          SmallVector<Value>{});
      exe.getResult(0).replaceAllUsesWith(w.getResult(0));
    }
    erased.push_back(exe);
  });
  for (auto a : erased)
    a->erase();
  return success();
}

class ScfYieldOpConversion : public OpConversionPattern<scf::YieldOp> {
public:
  using OpConversionPattern<scf::YieldOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(scf::YieldOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    SmallVector<Value, 8> operands{adaptor.getOperands()};
    SmallVector<Type, 2> retTys;
    for (auto t : op->getResultTypes()) {
      if (t.isa<air::AsyncTokenType>()) {
        retTys.push_back(airrt::EventType::get(op->getContext()));
      } else {
        retTys.push_back(t);
      }
    }
    rewriter.replaceOpWithNewOp<scf::YieldOp>(op, retTys, operands);
    return success();
  }
};

class ScfReduceOpConversion : public OpConversionPattern<scf::ReduceOp> {
public:
  using OpConversionPattern<scf::ReduceOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(scf::ReduceOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    auto newOp =
        rewriter.replaceOpWithNewOp<scf::ReduceOp>(op, adaptor.getOperand());
    auto body = &op.getRegion().front();
    auto newBody = &newOp.getRegion().front();

    for (int i = 0, e = body->getNumArguments(); i < e; i++) {
      body->getArgument(i).replaceAllUsesWith(newBody->getArgument(i));
    }

    auto &ops = body->getOperations();
    auto &newOps = newBody->getOperations();
    newOps.splice(newOps.begin(), ops, ops.begin(), ops.end());
    return success();
  }
};

class ScfReduceReturnOpConversion
    : public OpConversionPattern<scf::ReduceReturnOp> {
public:
  using OpConversionPattern<scf::ReduceReturnOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(scf::ReduceReturnOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    SmallVector<Value, 8> operands{adaptor.getOperands()};
    SmallVector<Type, 2> retTys;
    for (auto t : op->getResultTypes()) {
      if (t.isa<air::AsyncTokenType>()) {
        retTys.push_back(airrt::EventType::get(op->getContext()));
      } else {
        retTys.push_back(t);
      }
    }
    rewriter.replaceOpWithNewOp<scf::ReduceReturnOp>(op, retTys, operands);
    return success();
  }
};

class ScfIfOpConversion : public OpConversionPattern<scf::IfOp> {
public:
  using OpConversionPattern<scf::IfOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(scf::IfOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {

    SmallVector<Type, 2> retTys;
    for (auto t : op->getResultTypes()) {
      if (t.isa<air::AsyncTokenType>()) {
        retTys.push_back(airrt::EventType::get(op->getContext()));
      } else {
        retTys.push_back(t);
      }
    }

    bool hasElseBlock = op.elseBlock() != nullptr;
    auto newIf = rewriter.replaceOpWithNewOp<scf::IfOp>(
        op, retTys, op.getCondition(), hasElseBlock);

    auto &thenOps = op.thenBlock()->getOperations();
    auto &newThenOps = newIf.thenBlock()->getOperations();
    newThenOps.splice(newThenOps.begin(), thenOps, thenOps.begin(),
                      thenOps.end());

    if (!hasElseBlock)
      return success();

    auto &elseOps = op.elseBlock()->getOperations();
    auto &newElseOps = newIf.elseBlock()->getOperations();
    newElseOps.splice(newElseOps.begin(), elseOps, elseOps.begin(),
                      elseOps.end());

    return success();
  }
};

class ScfForOpConversion : public OpConversionPattern<scf::ForOp> {
public:
  using OpConversionPattern<scf::ForOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(scf::ForOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    auto newOp = rewriter.replaceOpWithNewOp<scf::ForOp>(
        op, adaptor.getLowerBound(), adaptor.getUpperBound(), adaptor.getStep(),
        adaptor.getInitArgs());
    auto body = op.getBody();
    auto newBody = newOp.getBody();

    for (int i = 0, e = body->getNumArguments(); i < e; i++) {
      body->getArgument(i).replaceAllUsesWith(newBody->getArgument(i));
    }

    auto &ops = body->getOperations();
    auto &newOps = newBody->getOperations();
    newOps.splice(newOps.begin(), ops, ops.begin(), ops.end());
    return success();
  }
};

class ScfParOpConversion : public OpConversionPattern<scf::ParallelOp> {
public:
  using OpConversionPattern<scf::ParallelOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(scf::ParallelOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    auto newOp = rewriter.replaceOpWithNewOp<scf::ParallelOp>(
        op, adaptor.getLowerBound(), adaptor.getUpperBound(), adaptor.getStep(),
        adaptor.getInitVals());
    auto body = op.getBody();
    auto newBody = newOp.getBody();

    for (int i = 0, e = body->getNumArguments(); i < e; i++) {
      body->getArgument(i).replaceAllUsesWith(newBody->getArgument(i));
    }

    auto &ops = body->getOperations();
    auto &newOps = newBody->getOperations();
    newOps.splice(newOps.begin(), ops, ops.begin(), --ops.end());
    return success();
  }
};

class AIRLoweringPass : public air::AIRLoweringBase<AIRLoweringPass> {

public:
  AIRLoweringPass() = default;
  AIRLoweringPass(const AIRLoweringPass &pass) {}

  void getDependentDialects(::mlir::DialectRegistry &registry) const override {
    registry.insert<affine::AffineDialect, airrt::AIRRtDialect,
                    LLVM::LLVMDialect, scf::SCFDialect>();
  }

  void runOnOperation() override {

    auto module = getOperation();
    auto context = module.getContext();

    TypeConverter converter;
    converter.addConversion([&](Type type) -> std::optional<Type> {
      // convert !air.async.token to !airrt.event
      if (auto t = type.dyn_cast<air::AsyncTokenType>())
        return airrt::EventType::get(context);
      else
        return type;
    });
    auto addUnrealizedCast = [](OpBuilder &builder, Type type,
                                ValueRange inputs, Location loc) {
      auto cast = builder.create<UnrealizedConversionCastOp>(loc, type, inputs);
      return std::optional<Value>(cast.getResult(0));
    };
    converter.addSourceMaterialization(addUnrealizedCast);
    converter.addTargetMaterialization(addUnrealizedCast);

    ConversionTarget target(*context);

    target.addLegalDialect<
        LLVM::LLVMDialect, func::FuncDialect, arith::ArithDialect,
        affine::AffineDialect, scf::SCFDialect, linalg::LinalgDialect,
        memref::MemRefDialect, bufferization::BufferizationDialect,
        airrt::AIRRtDialect>();

    // AIR ExecuteOp conversion
    if (failed(lowerAirExecute(module))) {
      emitError(UnknownLoc::get(context), "error lowering air.execute\n");
      signalPassFailure();
    }

    // Replace the PipelineStageOps first, followed by the
    // HerdPipelineOps, then run the rest of the patterns.
    // This avoids creating invalid intermediate code with respect
    // to the herd->pipeline->stages nesting requirements.

    // PipelineStageOp conversion
    RewritePatternSet air_pipe_stage_patterns(context);
    air_pipe_stage_patterns.insert<air::AIRPipeStageConversion>(
        context, air::AIRPipeStageConversion::LoweringType::AllocBuffer);
    if (failed(applyPartialConversion(module, target,
                                      std::move(air_pipe_stage_patterns)))) {
      emitError(UnknownLoc::get(context),
                "error lowering air.pipeline.stage\n");
      signalPassFailure();
    }

    // HerdPipelineOp conversion
    RewritePatternSet air_pipe_patterns(context);
    air_pipe_patterns.insert<AIRPipelineConversion, AIRPipelineGetConversion,
                             AIRPipelinePutConversion>(context);
    if (failed(applyPartialConversion(module, target,
                                      std::move(air_pipe_patterns)))) {
      emitError(UnknownLoc::get(context), "error lowering air.pipeline\n");
      signalPassFailure();
    }

    // DMA and HerdOp conversion
    RewritePatternSet air_patterns(context);

    target.addDynamicallyLegalOp<memref::AllocOp>([&](memref::AllocOp op) {
      return (op.getType().getMemorySpaceAsInt() != (int)air::MemorySpace::L2);
    });

    target.addDynamicallyLegalOp<memref::DeallocOp>([&](memref::DeallocOp op) {
      return (
          op.getMemref().getType().cast<MemRefType>().getMemorySpaceAsInt() !=
          (int)air::MemorySpace::L2);
    });

    target.addDynamicallyLegalOp<scf::ForOp>([&](scf::ForOp op) {
      for (auto o : op.getRegionIterArgs()) {
        if (o.getType().isa<air::AsyncTokenType>())
          return false;
      }
      return true;
    });

    target.addDynamicallyLegalOp<scf::ParallelOp>([&](scf::ParallelOp op) {
      for (auto o : op.getInitVals()) {
        if (o.getType().isa<air::AsyncTokenType>())
          return false;
      }
      return true;
    });

    target.addDynamicallyLegalOp<scf::YieldOp>([&](scf::YieldOp op) {
      for (auto v : op.getResults()) {
        if (v.getType().isa<air::AsyncTokenType>())
          return false;
      }
      return true;
    });

    target.addDynamicallyLegalOp<scf::ReduceOp>([&](scf::ReduceOp op) {
      if (op.getOperand().getType().isa<air::AsyncTokenType>())
        return false;
      else
        return true;
    });

    target.addDynamicallyLegalOp<scf::ReduceReturnOp>(
        [&](scf::ReduceReturnOp op) {
          if (op.getResult().getType().isa<air::AsyncTokenType>())
            return false;
          else
            return true;
        });

    target.addDynamicallyLegalOp<scf::IfOp>([&](scf::IfOp op) {
      for (auto v : op.getResults()) {
        if (v.getType().isa<air::AsyncTokenType>())
          return false;
      }
      return true;
    });

    air_patterns.add<
        ScfYieldOpConversion, ScfIfOpConversion, ScfParOpConversion,
        ScfReduceReturnOpConversion, ScfReduceOpConversion, ScfForOpConversion,
        L2AllocToAIRRtConversion, L2DeallocToAIRRtConversion,
        AIRLaunchConversion, AIRSegmentConversion, AIRHerdConversion>(context);

    populateFunctionOpInterfaceTypeConversionPattern<func::FuncOp>(air_patterns,
                                                                   converter);

    air_patterns
        .add<AIRDmaMemcpyNdToAIRRtConversion, AIRChannelPutToAIRRtConversion,
             AIRChannelGetToAIRRtConversion, AIRWaitAllToAIRRtConversion>(
            converter, context);

    if (failed(
            applyPartialConversion(module, target, std::move(air_patterns)))) {
      emitError(UnknownLoc::get(context), "error lowering air dialect\n");
      signalPassFailure();
    }

    // If scf parallel loops containing memcpy ops exist in the same scope as
    // herd load, then attempt to serialize the asynchronous control programs.
    module.walk([&](func::FuncOp f) {
      bool hasCandidateSCFParallel = false;
      for (auto par : f.getBody().getOps<scf::ParallelOp>()) {
        par.walk(
            [&](airrt::DmaMemcpyNdOp c) { hasCandidateSCFParallel = true; });
      }
      if (hasCandidateSCFParallel)
        serializeAsyncControlFlows(f);
    });
  }

private:
  // Util function getting child scf.for from scf loop. Note: at the moment only
  // getting the first child for loop.
  scf::ForOp getChildSCFForFromSCFLoop(Operation *loop) const {
    if (!loop)
      return scf::ForOp();
    if (auto par_loop = dyn_cast<scf::ParallelOp>(loop)) {
      for (auto child_for : par_loop.getBody()->getOps<scf::ForOp>()) {
        return child_for;
      }
    } else if (auto for_loop = dyn_cast<scf::ForOp>(loop)) {
      for (auto child_for : for_loop.getBody()->getOps<scf::ForOp>()) {
        return child_for;
      }
    } else if (auto afor_loop = dyn_cast<affine::AffineForOp>(loop)) {
      for (auto child_for : afor_loop.getBody()->getOps<scf::ForOp>()) {
        return child_for;
      }
    }
    return scf::ForOp();
  }

  // Util function getting child airrt.memcpy from scf loop. Note: at the moment
  // only getting the first child memcpy op.
  airrt::DmaMemcpyNdOp getChildDmaMemcpyFromSCFLoop(Operation *loop) const {
    if (!loop)
      return airrt::DmaMemcpyNdOp();
    if (auto par_loop = dyn_cast<scf::ParallelOp>(loop)) {
      for (auto child : par_loop.getBody()->getOps<airrt::DmaMemcpyNdOp>()) {
        return child;
      }
    }
    if (auto for_loop = dyn_cast<scf::ForOp>(loop)) {
      for (auto child : for_loop.getBody()->getOps<airrt::DmaMemcpyNdOp>()) {
        return child;
      }
    }
    return airrt::DmaMemcpyNdOp();
  }

  // Remap memcpy
  void remapOpAndOperands(OpBuilder builder, Operation *op,
                          IRMapping &remap) const {
    for (auto operand : op->getOperands()) {
      if (operand.getDefiningOp()) {
        if (auto index_cast =
                dyn_cast<arith::IndexCastOp>(operand.getDefiningOp())) {
          remapOpAndOperands(builder, operand.getDefiningOp(), remap);
          builder.clone(*index_cast, remap);
        } else if (auto const_op =
                       dyn_cast<arith::ConstantOp>(operand.getDefiningOp())) {
          builder.clone(*const_op, remap);
        } else if (auto muli_op =
                       dyn_cast<arith::MulIOp>(operand.getDefiningOp())) {
          remapOpAndOperands(builder, operand.getDefiningOp(), remap);
          builder.clone(*muli_op, remap);
        }
      }
    }
    builder.clone(*op, remap);
  }

  // Remap for loop's region
  void remapLoopRegion(OpBuilder builder, scf::ForOp src_for,
                       scf::ForOp dst_for, IRMapping &remap) const {
    remap.map(src_for.getInductionVar(), dst_for.getInductionVar());
    for (unsigned i = 0; i < src_for.getRegionIterArgs().size(); i++) {
      remap.map(src_for.getRegionIterArgs()[i], dst_for.getRegionIterArgs()[i]);
    }
    if (dst_for.getBody()->empty())
      builder.setInsertionPointToStart(dst_for.getBody());
    else if (dst_for.getBody()->getTerminator())
      builder.setInsertionPoint(dst_for.getBody()->getTerminator());
    else
      builder.setInsertionPointToEnd(dst_for.getBody());
    for (auto &op : src_for.getBody()->getOperations()) {
      if (!isa<scf::YieldOp>(op))
        remapOpAndOperands(builder, &op, remap);
    }
  }

  SmallVector<Value, 1> lookupOrDefaultRange(SmallVector<Value, 1> vec,
                                             IRMapping &remap) const {
    SmallVector<Value, 1> output;
    for (auto v : vec) {
      output.push_back(remap.lookupOrDefault(v));
    }
    return output;
  }

  // This function is a workaround for vck190 having one single control
  // processor, where all the async. control programs are serialized here.
  void serializeAsyncControlFlows(func::FuncOp func) const {

    std::vector<Operation *> scf_loops;
    for (auto scf_loop : func.getBody().getOps<scf::ForOp>()) {
      scf_loops.push_back(scf_loop);
    }
    for (auto scf_loop : func.getBody().getOps<scf::ParallelOp>()) {
      scf_loops.push_back(scf_loop);
    }

    // Create one single control program.
    affine::AffineForOp ctrl_outer = nullptr;
    affine::AffineForOp ctrl_inner = nullptr;
    func.walk([&](affine::AffineForOp afo) {
      if (afo->hasAttr("air.herd")) {
        if (afo->getAttrOfType<StringAttr>("air.herd").str() == "inner") {
          ctrl_inner = afo;
        }
        if (afo->getAttrOfType<StringAttr>("air.herd").str() == "outer") {
          ctrl_outer = afo;
        }
      }
    });
    assert(ctrl_inner);
    assert(ctrl_outer);
    OpBuilder builder(ctrl_inner);
    for (auto scf_loop : scf_loops) {
      IRMapping remap;
      if (auto scf_par = dyn_cast<scf::ParallelOp>(scf_loop)) {
        builder.setInsertionPoint(ctrl_inner.getBody()->getTerminator());
        remap.map(scf_par.getInductionVars()[0], ctrl_outer.getInductionVar());
        remap.map(scf_par.getInductionVars()[1], ctrl_inner.getInductionVar());
        scf::ForOp this_child_for = getChildSCFForFromSCFLoop(scf_par);
        scf::ForOp ctrl_child_for = getChildSCFForFromSCFLoop(ctrl_inner);

        bool hasClonedMemcpy = false;
        if (auto child_dma = getChildDmaMemcpyFromSCFLoop(scf_par)) {
          remapOpAndOperands(builder, child_dma, remap);
          hasClonedMemcpy = true;
        }

        while (this_child_for && !hasClonedMemcpy) {
          if (ctrl_child_for) {
            builder.setInsertionPointToStart(ctrl_child_for.getBody());
            if (auto child_dma = getChildDmaMemcpyFromSCFLoop(this_child_for)) {
              remapLoopRegion(builder, this_child_for, ctrl_child_for, remap);
              hasClonedMemcpy = true;
            }
            ctrl_child_for = getChildSCFForFromSCFLoop(ctrl_child_for);
          } else {
            builder.clone(*this_child_for.getLowerBound().getDefiningOp(),
                          remap);
            builder.clone(*this_child_for.getUpperBound().getDefiningOp(),
                          remap);
            builder.clone(*this_child_for.getStep().getDefiningOp(), remap);
            for (auto iter_oper : this_child_for.getIterOperands()) {
              remap.map(iter_oper,
                        builder
                            .create<airrt::WaitAllOp>(
                                builder.getUnknownLoc(),
                                airrt::EventType::get(ctrl_inner->getContext()),
                                SmallVector<Value>{})
                            ->getResult(0));
            }
            ctrl_child_for = builder.create<scf::ForOp>(
                ctrl_inner->getLoc(),
                remap.lookupOrDefault(this_child_for.getLowerBound()),
                remap.lookupOrDefault(this_child_for.getUpperBound()),
                remap.lookupOrDefault(this_child_for.getStep()),
                lookupOrDefaultRange(this_child_for.getIterOperands(), remap));
            builder.setInsertionPointToStart(ctrl_child_for.getBody());
            builder.create<scf::YieldOp>(
                builder.getUnknownLoc(),
                SmallVector<Value>{
                    builder
                        .create<airrt::WaitAllOp>(
                            builder.getUnknownLoc(),
                            airrt::EventType::get(ctrl_inner->getContext()),
                            SmallVector<Value>{})
                        ->getResult(0)});
            remapLoopRegion(builder, this_child_for, ctrl_child_for, remap);
            hasClonedMemcpy = true;
          }
          this_child_for = getChildSCFForFromSCFLoop(this_child_for);
        }
      } else if (auto scf_for = dyn_cast<scf::ForOp>(scf_loop)) {
        // TODO: complete this
      }
    }

    // Erase async scf loops
    for (auto scf_loop : scf_loops) {
      scf_loop->erase();
    }
  }
};

class AIRPipelineToAffinePass
    : public air::AIRPipelineToAffineBase<AIRPipelineToAffinePass> {

public:
  AIRPipelineToAffinePass() = default;
  AIRPipelineToAffinePass(const AIRPipelineToAffinePass &pass) {}

  void getDependentDialects(::mlir::DialectRegistry &registry) const override {
    registry.insert<affine::AffineDialect>();
  }

  void runOnOperation() override {
    auto module = getOperation();
    auto context = module.getContext();

    ConversionTarget target(*context);

    target.addLegalDialect<
        LLVM::LLVMDialect, func::FuncDialect, arith::ArithDialect,
        affine::AffineDialect, scf::SCFDialect, linalg::LinalgDialect,
        memref::MemRefDialect, bufferization::BufferizationDialect,
        airrt::AIRRtDialect, air::airDialect>();

    target.addIllegalOp<air::PipelineStageOp, air::PipelineYieldOp>();

    // PipelineStageOp conversion
    RewritePatternSet air_pipe_stage_patterns(context);
    auto loweringType =
        air::AIRPipeStageConversion::LoweringType::PipelineGetPut;
    if (clLoweringType == "buffer")
      loweringType = air::AIRPipeStageConversion::LoweringType::AllocBuffer;
    air_pipe_stage_patterns.insert<air::AIRPipeStageConversion>(context,
                                                                loweringType);
    if (failed(applyPartialConversion(module, target,
                                      std::move(air_pipe_stage_patterns)))) {
      emitError(UnknownLoc::get(context),
                "error lowering air.pipeline.stage\n");
      signalPassFailure();
    }

    SmallVector<Operation *, 8> pipelines;
    module.walk([&](air::HerdPipelineOp p) { pipelines.push_back(p); });

    for (auto p : pipelines) {
      auto pipeOp = cast<air::HerdPipelineOp>(p);
      OpBuilder b(p);
      Block &bb = pipeOp.getBody().front();
      IRMapping remap;
      bb.getTerminator()->erase();
      for (auto &o : bb)
        b.clone(o, remap);
      p->erase();
    }
  }
};

} // namespace

std::unique_ptr<mlir::Pass> xilinx::air::createAIRLoweringPass() {
  return std::make_unique<AIRLoweringPass>();
}

std::unique_ptr<mlir::Pass> xilinx::air::createAIRPipelineToAffinePass() {
  return std::make_unique<AIRPipelineToAffinePass>();
}
