# Source this on a compute node. The binaries are glibc 2.39; the staging host
# is 2.35, so nothing here runs there -- see NEXT.md section 1.
export MLIR_AIR_INSTALL_DIR=/home/erweiw/mlir-air/build-gpu
export LLVM_INSTALL_DIR=/shared/erweiw/llvm-56bcc187
export PATH=$MLIR_AIR_INSTALL_DIR/bin:$LLVM_INSTALL_DIR/bin:/shared/erweiw/venv/bin:/opt/rocm/llvm/bin:$PATH
cd /home/erweiw/mlir-air
