export PATH=/home/erweiw/mlir-air/build-gpu/bin:/shared/erweiw/llvm-56bcc187/bin:$PATH
cd /home/erweiw/mlir-air/workspace/scratch/dec
for S in 1 2; do
  python3 /home/erweiw/mlir-air/test/gpu/megakernel_gen/gen.py --layers 2 --tokens 5 --steps $S --prompt-len 5 > f$S.mlir
  air-opt f$S.mlir -air-to-rocdl -o f$S.a.mlir
  air-opt f$S.a.mlir -air-gpu-outlining -o f$S.b.mlir
  mlir-opt "--pass-pipeline=builtin.module(func.func(lower-affine, convert-linalg-to-loops, convert-scf-to-cf), gpu-kernel-outlining)" f$S.b.mlir -o f$S.c.mlir
  mlir-opt "--pass-pipeline=builtin.module(rocdl-attach-target{chip=gfx942 O=3},gpu.module(convert-gpu-to-rocdl{chipset=gfx942 runtime=HIP},reconcile-unrealized-casts))" f$S.c.mlir -o f$S.d.mlir
  echo "steps=$S: lines in the gpu kernel = $(awk '/gpu.module/,0' f$S.d.mlir | wc -l)"
done
