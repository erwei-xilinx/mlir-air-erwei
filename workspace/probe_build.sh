#!/usr/bin/env bash
cd /home/erweiw/mlir-air
echo "=== what does build/ point at? ==="
egrep "^(LLVM_DIR|MLIR_DIR|AIE_DIR|AIR_ENABLE_GPU|AIR_ENABLE_AIE|CMAKE_BUILD_TYPE|LLVM_EXTERNAL_LIT|CMAKE_CXX_COMPILER):" build/CMakeCache.txt
echo
echo "=== do those paths exist? ==="
for v in LLVM_DIR MLIR_DIR AIE_DIR LLVM_EXTERNAL_LIT; do
  p=$(egrep "^$v:" build/CMakeCache.txt | cut -d= -f2-)
  [ -n "$p" ] && { [ -e "$p" ] && echo "OK   $v = $p" || echo "MISS $v = $p"; }
done
echo
echo "=== where did the real llvm come from? (ask the binary) ==="
ls -la build/bin/air-opt
echo "-- shared libs it needs:"
ldd build/bin/air-opt 2>&1 | egrep -v "linux-vdso|ld-linux" | head -10
echo
echo "=== shared installs on /shared ? ==="
ls -d /shared/*llvm* /shared/*mlir* /shared_nobackup/*llvm* /shared_nobackup/*mlir* 2>/dev/null | head
ls -d /shared/$USER /shared_nobackup/$USER 2>/dev/null
echo
echo "=== lit available? ==="
which lit; python3 -c "import lit; print('lit', lit.__file__)" 2>&1 | head -2
echo
echo "=== ninja dry-run: what would rebuilding air-opt touch? ==="
cd build && ninja -n air-opt 2>&1 | tail -20
