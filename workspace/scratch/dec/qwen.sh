export PATH=/home/erweiw/mlir-air/build-gpu/bin:/shared/erweiw/llvm-56bcc187/bin:$PATH
export MLIR_AIR_INSTALL_DIR=/home/erweiw/mlir-air/build-gpu
export LLVM_INSTALL_DIR=/shared/erweiw/llvm-56bcc187
QWEN_DIR=/shared/erweiw/qwen3-0.6b PY=/shared/erweiw/venv/bin/python \
  STEPS=${STEPS:-4} WIN=${WIN:-} TMPDIR=/home/erweiw/mlir-air/workspace/scratch/dec/qwentmp \
  bash /home/erweiw/mlir-air/test/gpu/megakernel_gen/run_qwen.sh
echo "QWEN_EXIT=$?"
