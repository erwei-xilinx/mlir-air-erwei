export MLIR_AIR_INSTALL_DIR=/home/erweiw/mlir-air/build-gpu
export LLVM_INSTALL_DIR=/shared/erweiw/llvm-56bcc187
export PATH=$MLIR_AIR_INSTALL_DIR/bin:$LLVM_INSTALL_DIR/bin:/shared/erweiw/venv/bin:$PATH
bash /home/erweiw/mlir-air/workspace/scratch/dec/falsify.sh
echo "########## REGRESSION ##########"
cd /home/erweiw/mlir-air && bash test/gpu/run_all.sh
echo "RUN_ALL_EXIT=$?"
