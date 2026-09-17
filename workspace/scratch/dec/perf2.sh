export PATH=/home/erweiw/mlir-air/build-gpu/bin:/shared/erweiw/llvm-56bcc187/bin:$PATH
export MLIR_AIR_INSTALL_DIR=/home/erweiw/mlir-air/build-gpu
export LLVM_INSTALL_DIR=/shared/erweiw/llvm-56bcc187
# The exact configuration NEXT.md 5 measured at 8.34 s per launch: 28 layers,
# 5-token prompt, one step.
for R in 1 3 5; do
  T0=$(date +%s.%N)
  QWEN_DIR=/shared/erweiw/qwen3-0.6b PY=/shared/erweiw/venv/bin/python \
    STEPS=2 REPEAT=$R TMPDIR=/home/erweiw/mlir-air/workspace/scratch/dec/qwentmp \
    bash /home/erweiw/mlir-air/test/gpu/megakernel_gen/run_qwen.sh > /tmp/q.$R 2>&1
  rc=$?; T1=$(date +%s.%N)
  echo "STEPS=2 REPEAT=$R wall=$(echo "$T1-$T0"|bc) rc=$rc pass=$(grep -c PASS /tmp/q.$R)"
done
