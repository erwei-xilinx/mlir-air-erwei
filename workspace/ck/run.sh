#!/usr/bin/env bash
# Reproduce the three probes. Needs a compute node (see ../env.sh) and the CK
# revision Fleet pins, which is a submodule of fleet-chiplet-megakernel.
set -e
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$D/../.."
CK="$ROOT/fleet-chiplet-megakernel/deps/composable_kernel/include"
ARCH="${ARCH:-gfx942}"
HIPCC="${HIPCC:-/opt/rocm/bin/hipcc}"
LIB="$LLVM_INSTALL_DIR/lib"

build() {  # <src.hip> <out.bc>
  "$HIPCC" -x hip --cuda-device-only -fgpu-rdc -emit-llvm -c \
      --offload-arch="$ARCH" -O3 -std=c++20 -Wno-unknown-warning-option \
      -I "$CK" "$1" -o "$2" 2>&1 | grep -E "error" || true
}
run() {    # <mlir> <bc>
  mlir-opt "--pass-pipeline=builtin.module(func.func(lower-affine,convert-scf-to-cf),gpu-kernel-outlining)" "$1" -o "$D/t3.mlir"
  mlir-opt "--pass-pipeline=builtin.module(rocdl-attach-target{chip=$ARCH O=3 l=$2},gpu.module(convert-gpu-to-rocdl{chipset=$ARCH runtime=HIP},reconcile-unrealized-casts),gpu-module-to-binary,func.func(gpu-async-region),gpu-to-llvm,convert-to-llvm,reconcile-unrealized-casts)" "$D/t3.mlir" -o "$D/t4.mlir"
  mlir-runner --entry-point-result=void \
      --shared-libs="$LIB/libmlir_rocm_runtime.so" \
      --shared-libs="$LIB/libmlir_runner_utils.so" \
      --shared-libs="$LIB/libmlir_c_runner_utils.so" "$D/t4.mlir"
}

echo "=== 1. calling a hipcc device function from an MLIR kernel (expect 17 19 21 23)"
build "$D/probe.hip" "$D/probe.bc";         run "$D/call.mlir"     "$D/probe.bc" | tail -1
echo "=== 2. __shared__ and __syncthreads() in the callee (expect 63 62 61 ...)"
build "$D/lds_probe.hip" "$D/lds_probe.bc"; run "$D/lds_call.mlir" "$D/lds_probe.bc" | tail -1 | cut -c1-90
echo "=== 3. a ck_tile GEMM pipeline (runs; numerics still wrong, see README)"
build "$D/ck_gemm.hip" "$D/ck_gemm.bc";     run "$D/ck_call.mlir"  "$D/ck_gemm.bc" | tail -1 | cut -c1-90
rm -f "$D"/t3.mlir "$D"/t4.mlir
