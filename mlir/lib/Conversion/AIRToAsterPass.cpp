//===- AIRToAsterPass.cpp -----------------------------------------*- C++ -*-===//
//
// Copyright (C) 2026, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//
//
// This pass converts AIR dialect operations (launch/segment/herd/channel) to
// Aster's AMDGCN dialect format by emitting Aster-format MLIR text.
//
// Since mlir-air and Aster use different LLVM builds, we cannot create Aster
// dialect ops in-memory. Instead, this pass walks the AIR IR structurally,
// analyzes channel ops, async tokens, and compute patterns, and emits
// equivalent Aster MLIR text to an output file. The text is then consumed
// by aster-opt's standard pipeline.
//
// This is the "textual MLIR boundary" approach for cross-LLVM integration.
//
// Mapping:
//   air.launch(gx, gy)                -> amdgcn.kernel grid dims
//   air.segment                       -> workgroup scope (unwrapped)
//   air.herd(wx, wy)                  -> wave grid; block_dims = wx*wy*waveSize
//   air.channel.get L3->L1 (in herd)  -> func.call @load_X / @get_X (read_token)
//   air.channel.put L1->L3 (in herd)  -> func.call @store_C (write_token)
//   air.execute { linalg.generic }     -> func.call @mfma_f32_16x16x16_f16
//   air.wait_all                       -> amdgcn.wait deps
//
//===----------------------------------------------------------------------===//

#include "air/Conversion/AIRToAsterPass.h"
#include "air/Conversion/GPUPassDetail.h"
#include "air/Dialect/AIR/AIRDialect.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/GPU/IR/GPUDialect.h"
#include "mlir/Dialect/Linalg/IR/Linalg.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/IRMapping.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Transforms/DialectConversion.h"
#include "mlir/Transforms/RegionUtils.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/raw_ostream.h"

#define DEBUG_TYPE "air-to-aster"

using namespace mlir;
using namespace xilinx;
using namespace xilinx::air;

namespace {
#define GEN_PASS_DEF_CONVERTAIRTOASTER
#include "air/Conversion/Passes.h.inc"

//===----------------------------------------------------------------------===//
// Helper: Map AIR device string to Aster target/ISA
//===----------------------------------------------------------------------===//

struct AsterTargetInfo {
  StringRef chip;
  StringRef isa;
  int waveSize;
};

static AsterTargetInfo getTargetInfo(StringRef device, int waveSizeOverride) {
  AsterTargetInfo info;
  info.chip = device;
  info.waveSize = waveSizeOverride;
  if (device.starts_with("gfx94"))
    info.isa = "cdna3";
  else if (device.starts_with("gfx95"))
    info.isa = "cdna4";
  else if (device.starts_with("gfx12"))
    info.isa = "rdna4";
  else
    info.isa = "cdna3";
  return info;
}

//===----------------------------------------------------------------------===//
// Collected info from walking the AIR IR
//===----------------------------------------------------------------------===//

/// Info about a channel.get inside a herd (L3 -> L1 data input).
struct ChannelGetInfo {
  StringRef channelName;  // e.g. "channel_0"
  MemRefType memrefType;  // L1 memref type (e.g. memref<16x16xf16, 2>)
  bool isInput;           // true = data input (f16), false = accum input (f32)
};

/// Info about a channel.put inside a herd (L1 -> L3 data output).
struct ChannelPutInfo {
  StringRef channelName;
  MemRefType memrefType;
};

/// Info about the compute pattern inside the herd.
struct ComputeInfo {
  bool isMatmul = false;
  Type inputElemType;     // e.g. f16
  Type outputElemType;    // e.g. f32
  int64_t M = 0, N = 0, K = 0;
};

/// All info collected from one air.launch -> air.segment -> air.herd.
struct KernelInfo {
  std::string funcName;
  AsterTargetInfo target;
  int64_t blockDimX = 64;

  // Kernel arguments: ordered list of (memref type, access mode)
  struct ArgInfo {
    MemRefType type;
    StringRef access; // "read_only" or "write_only" or "read_write"
  };
  SmallVector<ArgInfo> args;

  // Data movement
  SmallVector<ChannelGetInfo> inputGets;   // channel.get in herd (inputs)
  SmallVector<ChannelPutInfo> outputPuts;  // channel.put in herd (outputs)

  // Compute
  ComputeInfo compute;
};

//===----------------------------------------------------------------------===//
// IR Analysis: Walk AIR ops and collect kernel info
//===----------------------------------------------------------------------===//

/// Analyze a linalg.generic to determine if it's a matmul pattern.
static ComputeInfo analyzeCompute(Operation *computeOp) {
  ComputeInfo info;

  // Look for linalg.generic with matmul indexing maps
  if (auto genericOp = dyn_cast<linalg::GenericOp>(computeOp)) {
    auto iterTypes = genericOp.getIteratorTypesArray();
    // Matmul: [parallel, parallel, reduction]
    if (iterTypes.size() == 3 &&
        iterTypes[0] == utils::IteratorType::parallel &&
        iterTypes[1] == utils::IteratorType::parallel &&
        iterTypes[2] == utils::IteratorType::reduction) {
      info.isMatmul = true;

      // Get element types from operands
      auto inputs = genericOp.getDpsInputs();
      auto outputs = genericOp.getDpsInits();
      if (!inputs.empty())
        info.inputElemType =
            cast<MemRefType>(inputs[0].getType()).getElementType();
      if (!outputs.empty())
        info.outputElemType =
            cast<MemRefType>(outputs[0].getType()).getElementType();

      // Get dimensions from the output memref shape
      if (!outputs.empty()) {
        auto outType = cast<MemRefType>(outputs[0].getType());
        if (outType.getRank() >= 2) {
          info.M = outType.getShape()[0];
          info.N = outType.getShape()[1];
        }
      }
      // K from the input's second dimension
      if (!inputs.empty()) {
        auto inType = cast<MemRefType>(inputs[0].getType());
        if (inType.getRank() >= 2) {
          info.K = inType.getShape()[1];
        }
      }
    }
  }
  return info;
}

/// Collect all info from an air.launch -> segment -> herd hierarchy.
static KernelInfo collectKernelInfo(air::LaunchOp launchOp,
                                    func::FuncOp funcOp,
                                    const AsterTargetInfo &target) {
  KernelInfo info;
  info.funcName = funcOp.getName().str();
  info.target = target;

  // Collect function arguments as kernel args
  for (auto argType : funcOp.getArgumentTypes()) {
    auto memrefType = dyn_cast<MemRefType>(argType);
    if (!memrefType)
      continue;
    // Determine access mode from element type heuristic:
    // f16 inputs are read_only, f32 output is write_only
    StringRef access = "read_write";
    if (memrefType.getElementType().isF16())
      access = "read_only";
    else if (memrefType.getElementType().isF32())
      access = "write_only";
    info.args.push_back({memrefType, access});
  }

  // Find herd and analyze its contents
  air::HerdOp herdOp = nullptr;
  launchOp.walk([&](air::HerdOp herd) { herdOp = herd; });

  if (!herdOp)
    return info;

  // Compute block dimensions from herd size
  SmallVector<Value> herdSizes = herdOp.getSizeOperands();
  int64_t wx = 1, wy = 1;
  if (auto cst = herdSizes[0].getDefiningOp<arith::ConstantIndexOp>())
    wx = cst.value();
  if (herdSizes.size() > 1)
    if (auto cst = herdSizes[1].getDefiningOp<arith::ConstantIndexOp>())
      wy = cst.value();
  info.blockDimX = wx * wy * target.waveSize;

  // Collect channel.get ops inside herd (data inputs from L3)
  herdOp.walk([&](air::ChannelGetOp getOp) {
    auto memrefType = cast<MemRefType>(getOp.getMemref().getType());
    auto chanName = getOp.getChanName();
    bool isInput = memrefType.getElementType().isF16();
    info.inputGets.push_back({chanName, memrefType, isInput});
  });

  // Collect channel.put ops inside herd (data outputs to L3)
  herdOp.walk([&](air::ChannelPutOp putOp) {
    auto memrefType = cast<MemRefType>(putOp.getMemref().getType());
    auto chanName = putOp.getChanName();
    info.outputPuts.push_back({chanName, memrefType});
  });

  // Analyze compute pattern: look for linalg.generic inside air.execute
  herdOp.walk([&](air::ExecuteOp execOp) {
    execOp.walk([&](linalg::GenericOp genericOp) {
      info.compute = analyzeCompute(genericOp);
    });
  });

  return info;
}

//===----------------------------------------------------------------------===//
// Aster MLIR Text Emission
//===----------------------------------------------------------------------===//

/// Compute the byte stride for a given element type.
static int64_t getByteStride(Type elemType, int64_t numElements) {
  int64_t elemBytes = 2; // default f16
  if (elemType.isF32())
    elemBytes = 4;
  else if (elemType.isF16() || elemType.isBF16())
    elemBytes = 2;
  else if (elemType.isInteger(32))
    elemBytes = 4;
  else if (elemType.isInteger(16))
    elemBytes = 2;
  return numElements * elemBytes;
}

/// Emit Aster-format MLIR text from collected kernel info.
static std::string emitAsterMLIR(const KernelInfo &info) {
  std::string result;
  llvm::raw_string_ostream os(result);

  os << "// Generated by air-to-aster pass from AIR IR analysis.\n";
  os << "// Target: " << info.target.chip << ", ISA: " << info.target.isa
     << "\n\n";

  // Type aliases
  os << "!sx2 = !amdgcn.sgpr<[? + 2]>\n";
  os << "!v   = !amdgcn.vgpr\n";
  os << "!vx2 = !amdgcn.vgpr<[? + 2]>\n";
  os << "!vx4 = !amdgcn.vgpr<[? + 4]>\n";
  os << "!rt_A_f16 = !vx2\n";
  os << "!rt_B_f16 = !vx2\n";
  os << "!rt_C_f32 = !vx4\n";
  os << "!write_token = !amdgcn.write_token<flat>\n";
  os << "!future_global_read = !aster_utils.struct<value: !aster_utils.any, "
        "token: !amdgcn.read_token<flat>>\n\n";

  // Module
  os << "amdgcn.module @air_" << info.funcName << "_module"
     << " target = #amdgcn.target<" << info.target.chip << ">"
     << " isa = #amdgcn.isa<" << info.target.isa << "> {\n";

  // Library function declarations
  // Determine which load/store functions are needed from channel analysis
  int loadIdx = 0;
  SmallVector<std::string> loadFuncNames;
  for (auto &get : info.inputGets) {
    if (get.isInput) {
      std::string name =
          (loadIdx == 0) ? "load_A_f16" : "load_B_f16";
      loadFuncNames.push_back(name);
      os << "  func.func private @" << name
         << "(!sx2, index, index, index) -> !future_global_read\n";
      std::string getName =
          (loadIdx == 0) ? "get_A_f16" : "get_B_f16";
      os << "  func.func private @" << getName
         << "(!future_global_read) -> !rt_"
         << ((loadIdx == 0) ? "A" : "B") << "_f16\n";
      loadIdx++;
    }
  }

  // Zero-init and MFMA declarations
  if (info.compute.isMatmul) {
    os << "  func.func private @zero_C() -> !rt_C_f32\n";
    os << "  func.func private @mfma_f32_" << info.compute.M << "x"
       << info.compute.N << "x" << info.compute.K << "_f16"
       << "(!rt_A_f16, !rt_B_f16, !rt_C_f32) -> !rt_C_f32\n";
  }

  // Store declaration
  if (!info.outputPuts.empty()) {
    os << "  func.func private @store_C_f32"
       << "(!rt_C_f32, !sx2, index, index, index) -> !write_token\n";
  }

  os << "\n";

  // Kernel
  os << "  amdgcn.kernel @" << info.funcName << " arguments <[\n";
  for (size_t i = 0; i < info.args.size(); i++) {
    os << "    #amdgcn.buffer_arg<address_space = generic, access = "
       << info.args[i].access << ">";
    if (i + 1 < info.args.size())
      os << ",";
    os << "\n";
  }
  os << "  ]> attributes {shared_memory_size = 0 : i32} {\n";

  // Load kernel arguments
  for (size_t i = 0; i < info.args.size(); i++) {
    char varName = 'A' + i;
    os << "    %" << varName << "_ptr = amdgcn.load_arg " << i << " : !sx2\n";
  }
  os << "    amdgcn.sopp.s_waitcnt #amdgcn.inst<s_waitcnt> lgkmcnt = 0\n\n";

  // Constants derived from memref shapes
  os << "    %c0 = arith.constant 0 : index\n";

  // Compute strides from the actual memref shapes
  SmallVector<int64_t> strides;
  for (auto &arg : info.args) {
    int64_t cols =
        (arg.type.getRank() >= 2) ? arg.type.getShape()[1] : arg.type.getShape()[0];
    strides.push_back(getByteStride(arg.type.getElementType(), cols));
  }
  // Emit unique stride constants
  llvm::DenseSet<int64_t> emittedStrides;
  for (int64_t s : strides) {
    if (emittedStrides.insert(s).second) {
      std::string typeName = (s <= 32) ? "f16" : "f32";
      os << "    %stride_" << typeName << " = arith.constant " << s
         << " : index\n";
    }
  }
  os << "\n";

  // Issue async loads for input channels
  loadIdx = 0;
  for (auto &get : info.inputGets) {
    if (!get.isInput)
      continue;
    char varName = 'A' + loadIdx;
    std::string loadFunc = loadFuncNames[loadIdx];
    int64_t cols =
        (get.memrefType.getRank() >= 2) ? get.memrefType.getShape()[1]
                                        : get.memrefType.getShape()[0];
    int64_t stride = getByteStride(get.memrefType.getElementType(), cols);
    std::string strideVar = (stride <= 32) ? "%stride_f16" : "%stride_f32";

    os << "    %" << varName << "_future = func.call @" << loadFunc << "(%"
       << varName << "_ptr, %c0, %c0, " << strideVar
       << ") : (!sx2, index, index, index) -> !future_global_read\n";
    loadIdx++;
  }
  os << "\n";

  // Initialize accumulator
  if (info.compute.isMatmul) {
    os << "    %C = func.call @zero_C() : () -> !rt_C_f32\n\n";
  }

  // Wait for loads and extract values
  loadIdx = 0;
  for (auto &get : info.inputGets) {
    if (!get.isInput)
      continue;
    char varName = 'A' + loadIdx;
    std::string getFunc = (loadIdx == 0) ? "get_A_f16" : "get_B_f16";
    std::string rtType = (loadIdx == 0) ? "!rt_A_f16" : "!rt_B_f16";
    os << "    %" << varName << " = func.call @" << getFunc << "(%"
       << varName << "_future) : (!future_global_read) -> " << rtType << "\n";
    loadIdx++;
  }
  os << "\n";

  // MFMA compute
  if (info.compute.isMatmul) {
    os << "    %D = func.call @mfma_f32_" << info.compute.M << "x"
       << info.compute.N << "x" << info.compute.K
       << "_f16(%A, %B, %C) : (!rt_A_f16, !rt_B_f16, !rt_C_f32) -> "
          "!rt_C_f32\n\n";
  }

  // Store result
  if (!info.outputPuts.empty()) {
    // Find the output argument index (the write_only one)
    size_t outArgIdx = info.args.size() - 1;
    for (size_t i = 0; i < info.args.size(); i++) {
      if (info.args[i].access == "write_only") {
        outArgIdx = i;
        break;
      }
    }
    char outVar = 'A' + outArgIdx;
    auto outType = info.args[outArgIdx].type;
    int64_t cols =
        (outType.getRank() >= 2) ? outType.getShape()[1] : outType.getShape()[0];
    int64_t stride = getByteStride(outType.getElementType(), cols);
    std::string strideVar = (stride <= 32) ? "%stride_f16" : "%stride_f32";

    os << "    %store_tok = func.call @store_C_f32(%D, %" << outVar
       << "_ptr, %c0, %c0, " << strideVar
       << ") : (!rt_C_f32, !sx2, index, index, index) -> !write_token\n";
    os << "    amdgcn.wait deps %store_tok : !write_token\n\n";
  }

  os << "    amdgcn.end_kernel\n";
  os << "  }\n";
  os << "}\n";

  return result;
}

//===----------------------------------------------------------------------===//
// ConvertAIRToAsterPass
//===----------------------------------------------------------------------===//

struct ConvertAIRToAsterPass
    : public xilinx::air::impl::ConvertAIRToAsterBase<ConvertAIRToAsterPass> {

  ConvertAIRToAsterPass() = default;
  ConvertAIRToAsterPass(const ConvertAIRToAsterPass &pass) {}

  void getDependentDialects(mlir::DialectRegistry &registry) const override {
    registry.insert<mlir::gpu::GPUDialect>();
    registry.insert<mlir::arith::ArithDialect>();
    registry.insert<mlir::scf::SCFDialect>();
    registry.insert<mlir::memref::MemRefDialect>();
    registry.insert<mlir::func::FuncDialect>();
    registry.insert<mlir::affine::AffineDialect>();
  }

  void runOnOperation() override {
    ModuleOp module = getOperation();
    OpBuilder builder(module.getContext());

    AsterTargetInfo target = getTargetInfo(clDevice, clWaveSize);

    LLVM_DEBUG(llvm::dbgs() << "AIR-to-Aster: target=" << target.chip
                            << " isa=" << target.isa
                            << " waveSize=" << target.waveSize << "\n");

    // Find the func.func containing the air.launch
    func::FuncOp funcOp = nullptr;
    module.walk([&](func::FuncOp fn) {
      fn.walk([&](air::LaunchOp launch) { funcOp = fn; });
    });
    if (!funcOp)
      return;

    // Walk all air.launch operations
    module.walk([&](air::LaunchOp launchOp) {
      // Step 1: Collect kernel info by walking the IR structure
      KernelInfo info = collectKernelInfo(launchOp, funcOp, target);

      LLVM_DEBUG({
        llvm::dbgs() << "Collected kernel info:\n";
        llvm::dbgs() << "  funcName: " << info.funcName << "\n";
        llvm::dbgs() << "  blockDimX: " << info.blockDimX << "\n";
        llvm::dbgs() << "  args: " << info.args.size() << "\n";
        llvm::dbgs() << "  inputGets: " << info.inputGets.size() << "\n";
        llvm::dbgs() << "  outputPuts: " << info.outputPuts.size() << "\n";
        llvm::dbgs() << "  isMatmul: " << info.compute.isMatmul << "\n";
        if (info.compute.isMatmul) {
          llvm::dbgs() << "  M=" << info.compute.M
                       << " N=" << info.compute.N
                       << " K=" << info.compute.K << "\n";
          llvm::dbgs() << "  inputType: " << info.compute.inputElemType << "\n";
          llvm::dbgs() << "  outputType: " << info.compute.outputElemType
                       << "\n";
        }
      });

      // Step 2: Emit Aster MLIR text from the collected info
      std::string asterMLIR = emitAsterMLIR(info);

      // Step 3: Attach the emitted text as a module-level attribute
      // This allows downstream tools to extract it
      module->setAttr("aster.generated_mlir",
                      builder.getStringAttr(asterMLIR));

      // Also annotate the launch with structural info (for FileCheck tests)
      launchOp->setAttr("aster.target",
                        builder.getStringAttr(target.chip));
      launchOp->setAttr("aster.isa",
                        builder.getStringAttr(target.isa));
      launchOp->setAttr("aster.block_dims",
                        builder.getI64ArrayAttr({info.blockDimX, 1, 1}));
      launchOp->setAttr("aster.wave_size",
                        builder.getI64IntegerAttr(target.waveSize));

      launchOp.walk([&](air::HerdOp herdOp) {
        SmallVector<Value> herdSizes = herdOp.getSizeOperands();
        int64_t wx = 1, wy = 1;
        if (auto cst = herdSizes[0].getDefiningOp<arith::ConstantIndexOp>())
          wx = cst.value();
        if (herdSizes.size() > 1)
          if (auto cst = herdSizes[1].getDefiningOp<arith::ConstantIndexOp>())
            wy = cst.value();
        herdOp->setAttr("aster.wave_grid",
                        builder.getI64ArrayAttr({wx, wy}));
        herdOp->setAttr("aster.wave_size",
                        builder.getI64IntegerAttr(target.waveSize));

        // Annotate L1 allocations
        herdOp.walk([&](memref::AllocOp allocOp) {
          if (allocOp.getType().getMemorySpaceAsInt() == 2)
            allocOp->setAttr("aster.vgpr_candidate", builder.getUnitAttr());
          else if (allocOp.getType().getMemorySpaceAsInt() == 1)
            allocOp->setAttr("aster.lds_candidate", builder.getUnitAttr());
        });
      });
    });

    // Print the generated Aster MLIR to stderr for piping
    if (auto genAttr = module->getAttrOfType<StringAttr>(
            "aster.generated_mlir")) {
      LLVM_DEBUG(llvm::dbgs() << "\n=== Generated Aster MLIR ===\n"
                              << genAttr.getValue() << "\n");
    }
  }
};

} // namespace

namespace xilinx {
namespace air {

std::unique_ptr<mlir::Pass> createAIRToAsterPass() {
  return std::make_unique<ConvertAIRToAsterPass>();
}

} // namespace air
} // namespace xilinx
