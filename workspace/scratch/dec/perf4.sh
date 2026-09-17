export PATH=/home/erweiw/mlir-air/build-gpu/bin:/shared/erweiw/llvm-56bcc187/bin:$PATH
export MLIR_AIR_INSTALL_DIR=/home/erweiw/mlir-air/build-gpu
export LLVM_INSTALL_DIR=/shared/erweiw/llvm-56bcc187
# Ten token-positions either way. One step or two.
P10=785,6722,315,9625,374,12095,13,576,6722,315
for W in 10 5; do
  S=$((10/W))
  for R in 1 3; do
    T0=$(date +%s.%N)
    QWEN_DIR=/shared/erweiw/qwen3-0.6b PY=/shared/erweiw/venv/bin/python \
      STEPS=$S WIN=$W REPEAT=$R PROMPT=$P10 \
      TMPDIR=/home/erweiw/mlir-air/workspace/scratch/dec/qwentmp \
      bash /home/erweiw/mlir-air/test/gpu/megakernel_gen/run_qwen.sh > /tmp/s.$W.$R 2>&1
    rc=$?; T1=$(date +%s.%N)
    echo "WIN=$W STEPS=$S REPEAT=$R wall=$(echo "$T1-$T0"|bc) rc=$rc pass=$(grep -c PASS /tmp/s.$W.$R)"
  done
done
