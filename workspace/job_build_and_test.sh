#!/usr/bin/env bash
# Build air-opt against the LLVM install that lives on rad-mi300x-1's local
# /scratch, then prove the deleteAirSegment fix: run the new lit tests with the
# patch reverted (must FAIL), then with it applied (must PASS).
set -u
SRC=/home/erweiw/mlir-air
BLD=$SRC/build-gpu
LLVM=/scratch/erweiw/llvm/install
VENV=/scratch/erweiw/sandbox

echo "=== node: $(hostname)  glibc: $(ldd --version|head -1) ==="
[ -d "$LLVM" ] || { echo "FATAL: $LLVM missing on this node"; exit 1; }
$LLVM/bin/mlir-opt --version | head -2

# lit comes from the venv that was set up alongside this LLVM
if [ -f "$VENV/bin/activate" ]; then source "$VENV/bin/activate"; fi
echo "lit: $(which lit 2>/dev/null || echo MISSING)"
python3 --version

echo; echo "=== configure ==="
cmake -GNinja -S "$SRC" -B "$BLD" \
  -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_DIR=$LLVM/lib/cmake/llvm \
  -DMLIR_DIR=$LLVM/lib/cmake/mlir \
  -DAIR_ENABLE_AIE=OFF -DAIR_ENABLE_GPU=ON \
  -DAIE_ENABLE_BINDINGS_PYTHON=OFF \
  -DBUILD_SHARED_LIBS=OFF -DLLVM_ENABLE_ASSERTIONS=ON \
  -DLLVM_EXTERNAL_LIT="$(which lit 2>/dev/null)" \
  > "$BLD/cfg.log" 2>&1 || { echo "CONFIGURE FAILED"; tail -25 "$BLD/cfg.log"; exit 1; }
echo "configure ok"

build_it() {
  ninja -C "$BLD" -j 60 air-opt > "$BLD/b.log" 2>&1 \
    || { echo "BUILD FAILED"; grep -m15 "error:" "$BLD/b.log"; return 1; }
  echo "build ok: $($BLD/bin/air-opt --version | sed -n 2p)"
}

run_tests() {
  "$BLD/bin/air-opt" "$SRC/mlir/test/Conversion/AIRToROCDL/air_to_rocdl_segment_args.mlir" \
      -air-to-rocdl 2>&1 | tee "$BLD/out_pos.mlir" | tail -40
  echo "--- air-opt exit: ${PIPESTATUS[0]}"
}

echo; echo "############ STEP 1: WITHOUT the fix (expect the bug) ############"
cp "$SRC/mlir/lib/Conversion/AIRToROCDLPass.cpp" /tmp/AIRToROCDLPass.patched.cpp
git -C "$SRC" stash push -u -m "airseg-fix-probe-$$" -- mlir/lib/Conversion/AIRToROCDLPass.cpp >/dev/null 2>&1
STASH=$(git -C "$SRC" stash list --format='%H %gs' | grep "airseg-fix-probe-$$" | head -1 | cut -d' ' -f1)
echo "stashed patch as $STASH"
build_it && run_tests
echo "############ END STEP 1 ############"

echo; echo "=== restoring patch ==="
cp /tmp/AIRToROCDLPass.patched.cpp "$SRC/mlir/lib/Conversion/AIRToROCDLPass.cpp"
[ -n "$STASH" ] && git -C "$SRC" stash drop "$(git -C "$SRC" stash list --format='%gd %gs' | grep "airseg-fix-probe-$$" | head -1 | cut -d' ' -f1)" >/dev/null 2>&1
git -C "$SRC" status --porcelain mlir/lib/Conversion/AIRToROCDLPass.cpp

echo; echo "############ STEP 2: WITH the fix ############"
build_it || exit 1
run_tests
echo "############ END STEP 2 ############"

echo; echo "=== lit: the AIRToROCDL suite ==="
lit -sv "$BLD/mlir/test/Conversion/AIRToROCDL" 2>&1 | tail -40

echo; echo "=== lit: full check-air-mlir ==="
lit -s "$BLD/mlir/test" 2>&1 | tail -30
echo "=== DONE ==="
