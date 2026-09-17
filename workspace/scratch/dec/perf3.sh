export PATH=/home/erweiw/mlir-air/build-gpu/bin:/shared/erweiw/llvm-56bcc187/bin:$PATH
export MLIR_AIR_INSTALL_DIR=/home/erweiw/mlir-air/build-gpu
export LLVM_INSTALL_DIR=/shared/erweiw/llvm-56bcc187
# Same number of steps, different token counts in them:
#   P10 W5 S2 -> two prefill steps of 5 tokens each
#   P5  W5 S2 -> one prefill of 5, then a decode step of 1
# If the second is slower, the cost is not the work.
P10=785,6722,315,9625,374,12095,13,576,6722,315
for cfg in "2 $P10" "2 785,6722,315,9625,374"; do
  set -- $cfg; S=$1; PR=$2
  for R in 1 3; do
    T0=$(date +%s.%N)
    QWEN_DIR=/shared/erweiw/qwen3-0.6b PY=/shared/erweiw/venv/bin/python \
      STEPS=$S WIN=5 REPEAT=$R PROMPT=$PR \
      TMPDIR=/home/erweiw/mlir-air/workspace/scratch/dec/qwentmp \
      bash /home/erweiw/mlir-air/test/gpu/megakernel_gen/run_qwen.sh > /tmp/r.$R 2>&1
    rc=$?; T1=$(date +%s.%N)
    echo "ntok=$(awk -F, '{print NF}' <<< $PR) STEPS=$S REPEAT=$R wall=$(echo "$T1-$T0"|bc) rc=$rc pass=$(grep -c PASS /tmp/r.$R)"
  done
done
