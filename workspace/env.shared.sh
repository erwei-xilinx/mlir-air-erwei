# Same as workspace/env.sh but rooted at the /shared staging copy, for nodes
# that do not mount the real home (rad-mi300x-splinter*, which get a fresh
# local /home).
export MLIR_AIR_INSTALL_DIR=/shared/erweiw/airtree/build-gpu
export LLVM_INSTALL_DIR=/shared/erweiw/llvm-56bcc187
export PATH=$MLIR_AIR_INSTALL_DIR/bin:$LLVM_INSTALL_DIR/bin:/shared/erweiw/venv/bin:/opt/rocm/llvm/bin:$PATH
cd /shared/erweiw/airtree
