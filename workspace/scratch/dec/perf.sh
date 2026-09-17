export PATH=/home/erweiw/mlir-air/build-gpu/bin:/shared/erweiw/llvm-56bcc187/bin:$PATH
export MLIR_AIR_INSTALL_DIR=/home/erweiw/mlir-air/build-gpu
export LLVM_INSTALL_DIR=/shared/erweiw/llvm-56bcc187
# Per decode step: hold the prompt fixed, vary the number of decode steps and
# the number of launches. The slope over REPEAT is the device cost of one
# launch; the difference between two STEPS values divided by the step count
# difference is the cost of one decode step.
for S in 2 6; do
  for R in 1 3; do
    T0=$(date +%s.%N)
    QWEN_DIR=/shared/erweiw/qwen3-0.6b PY=/shared/erweiw/venv/bin/python \
      STEPS=$S REPEAT=$R TMPDIR=/home/erweiw/mlir-air/workspace/scratch/dec/qwentmp \
      bash /home/erweiw/mlir-air/test/gpu/megakernel_gen/run_qwen.sh > /tmp/p.$S.$R 2>&1
    rc=$?
    T1=$(date +%s.%N)
    echo "STEPS=$S REPEAT=$R wall=$(echo "$T1-$T0"|bc) rc=$rc $(grep -c PASS /tmp/p.$S.$R)"
  done
done
