#!/usr/bin/env bash
# Compile Fleet device code for gfx950 (MI350 / CDNA4).
#
#   megakernel.cpp  — the REAL persistent worker + scheduler control flow
#                     (persistent_kernel.cuh:180-1918, sed-extracted verbatim)
#   fleet_probe.cpp — isolated scheduling/sync fragments
#   fleet_probe2.cpp— naive-fallback counterfactual + NT/WT stores
#
# Requires clang >= 19 (gfx950). Ubuntu's clang-14 will NOT work:
#   curl -L -o llvm.tar.xz \
#     https://github.com/llvm/llvm-project/releases/download/llvmorg-22.1.8/LLVM-22.1.8-Linux-X64.tar.xz
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLANG="${CLANG:-/tmp/llvm22/LLVM-22.1.8-Linux-X64/bin/clang}"
LLVMBIN="$(dirname "$CLANG")"
MEGA="${MEGA:-/home/erweiw/mlir-air/fleet-chiplet-megakernel}"
FLEET="$MEGA/include/mirage/persistent_kernel"
INC="$MEGA/include"
ARCH="${ARCH:-gfx950}"

[[ -x "$CLANG" ]] || { echo "clang not found at $CLANG (need >= 19)" >&2; exit 1; }

mkdir -p "$HERE/out"

# --- regenerate the verbatim extraction so it can never drift from source ---
sed -n '180,1918p' "$FLEET/persistent_kernel.cuh" > "$HERE/src/megakernel_loops.inc"
echo "extracted $(wc -l < "$HERE/src/megakernel_loops.inc") lines from persistent_kernel.cuh:180-1918"

HIPFLAGS=(-x hip --offload-device-only --offload-arch="$ARCH"
          -nogpulib -nogpuinc -O3 -std=c++17 -w
          -I "$HERE/src/shim" -I "$FLEET" -I "$INC")

echo "[$ARCH] megakernel (real control flow)"
"$CLANG" "${HIPFLAGS[@]}" -S -emit-llvm "$HERE/src/megakernel.cpp" -o "$HERE/out/megakernel.ll"
"$CLANG" "${HIPFLAGS[@]}" -S            "$HERE/src/megakernel.cpp" -o "$HERE/out/megakernel.s"
# assemble directly: -c would invoke the device linker, which needs ROCm's
# libockl for device-side printf
"$CLANG" --target=amdgcn-amd-amdhsa -mcpu="$ARCH" -c "$HERE/out/megakernel.s" \
         -o "$HERE/out/megakernel.o"
"$LLVMBIN/llvm-objdump" -d --mcpu="$ARCH" "$HERE/out/megakernel.o" > "$HERE/out/megakernel.dis"

for f in fleet_probe fleet_probe2; do
  echo "[$ARCH] $f"
  "$CLANG" "${HIPFLAGS[@]}" -S -emit-llvm "$HERE/src/$f.cpp" -o "$HERE/out/$f.ll"
  "$CLANG" "${HIPFLAGS[@]}" -S            "$HERE/src/$f.cpp" -o "$HERE/out/$f.s"
  "$CLANG" --target=amdgcn-amd-amdhsa -mcpu="$ARCH" -c "$HERE/out/$f.s" -o "$HERE/out/$f.o"
done

echo
echo "=== megakernel: per-kernel control flow ==="
for k in _Z13worker_kernelN6mirage7runtime13RuntimeConfigE \
         _Z16scheduler_kernelN6mirage7runtime13RuntimeConfigE \
         _Z17persistent_kernelN6mirage7runtime13RuntimeConfigE; do
  blk=$(awk "/<${k}>:/{f=1} f{print} f&&/s_endpgm/{c++} c==1&&f{exit}" "$HERE/out/megakernel.dis")
  short=$(echo "$k" | sed 's/_Z[0-9]*//;s/N6mirage.*//')
  printf "  %-18s instrs=%-5s branches=%-4s s_sleep=%-3s wbl2=%-3s atomics=%s\n" \
    "$short" "$(echo "$blk" | wc -l)" "$(echo "$blk" | grep -cE 's_cbranch|s_branch')" \
    "$(echo "$blk" | grep -c s_sleep)" "$(echo "$blk" | grep -c buffer_wbl2)" \
    "$(echo "$blk" | grep -c atomic)"
done

echo
echo "=== megakernel: LDS per kernel ==="
grep -E '^\s+\.name:|group_segment_fixed_size:' "$HERE/out/megakernel.s" | \
  sed 's/_Z[0-9]*//;s/N6mirage7runtime13RuntimeConfigE.*//' | paste - - | \
  sed 's/^/  /' | head -6

echo
echo "=== probes: L2 writeback / atomic scope audit ==="
awk '
/^_Z[0-9]+k_/ { if(k) pk(); k=$1; wb=0; a_sys=0; a_dev=0 }
{ if (/buffer_wbl2/) wb++
  if (/atomic/ && /sc0/ && /sc1/) a_sys++
  else if (/atomic/) a_dev++ }
END { if(k) pk() }
function pk(){ printf "  %-46s wbl2=%d  atomic[sc0+sc1]=%d  atomic[local]=%d\n", k, wb, a_sys, a_dev }
' "$HERE/out/fleet_probe.s" "$HERE/out/fleet_probe2.s"
