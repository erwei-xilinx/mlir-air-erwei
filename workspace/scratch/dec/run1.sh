set -e
export PATH=/home/erweiw/mlir-air/build-gpu/bin:/shared/erweiw/llvm-56bcc187/bin:$PATH
cd /home/erweiw/mlir-air/workspace/scratch/dec
N=$1
air-opt $N.mlir -air-to-rocdl -o $N.s1.mlir
air-opt $N.s1.mlir -air-gpu-outlining -o $N.s2.mlir
mlir-opt "--pass-pipeline=builtin.module(func.func(lower-affine, convert-linalg-to-loops, convert-scf-to-cf), gpu-kernel-outlining)" $N.s2.mlir -o $N.s3.mlir
mlir-opt "--pass-pipeline=builtin.module(rocdl-attach-target{chip=gfx942 O=3},gpu.module(convert-gpu-to-rocdl{chipset=gfx942 runtime=HIP},reconcile-unrealized-casts),gpu-module-to-binary, func.func(gpu-async-region),gpu-to-llvm,convert-to-llvm,reconcile-unrealized-casts)" $N.s3.mlir -o $N.s4.mlir
L=/shared/erweiw/llvm-56bcc187/lib
timeout 300 mlir-runner --entry-point-result=void \
  --shared-libs=$L/libmlir_rocm_runtime.so --shared-libs=$L/libmlir_runner_utils.so \
  --shared-libs=$L/libmlir_c_runner_utils.so \
  --shared-libs=/home/erweiw/mlir-air/build-gpu/lib/libairgpu.so $N.s4.mlir
echo "EXIT=$?"
