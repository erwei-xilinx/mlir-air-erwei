#!/bin/bash
# #1984 probe. Two measurements, both on the machine under test:
#   A  per-dispatch hang rate at depth 1, retries DISABLED. The layer gate
#      normally allows 24 attempts, so "verify passes on the runner" says
#      nothing about the underlying rate. This measures it.
#   B  the same full-depth dispatch with the PLE arm compiled out
#      (DECODE_NO_PLE=1). PLE is the one thing gemma4 has that no working
#      model has.
set -u
G="$1"; PEANO="$2"; N="${3:-20}"
DEC="$G/../../fused_decode_ple"
cd "$G" || exit 1

echo "::group::device + toolchain"
(xrt-smi examine || true) 2>&1 | head -30
cat /sys/module/amdxdna/version 2>/dev/null
echo "::endgroup::"

echo "=== A: depth-1 per-dispatch hang rate (retries disabled), n=$N ==="
make -C "$DEC" compile-decode LBUILD=16 UNI_DEC=1 PEANO_INSTALL_DIR="$PEANO" >/tmp/A_build.log 2>&1 \
  || { echo "A: BUILD FAILED"; tail -20 /tmp/A_build.log; }
hang=0; pass=0; other=0
for i in $(seq 1 "$N"); do
  out=$(python3 validate_layer_npu.py --layer 4 --attn-maxl 16 --retries 1 \
        --cache /tmp/g4_probe_L4.npz $( [ $i = 1 ] && echo --rebuild-cache ) 2>&1)
  if   echo "$out" | grep -q "dispatch state=.*after 1 attempts"; then hang=$((hang+1)); tag=HANG
  elif echo "$out" | grep -q "^PASS:"; then pass=$((pass+1)); tag=pass
  else other=$((other+1)); tag=OTHER; fi
  echo "  A$i $tag  $(echo "$out" | grep -E '^ *cos=|state=' | head -1)"
done
echo "A RESULT: hang=$hang pass=$pass other=$other  of $N"

echo "=== B: depth-35 with the PLE arm compiled out ==="
DECODE_NO_PLE=1 make -f "$G/Makefile" _compile_decode_build LBUILD=1024 \
  SWEEP_UNI_DEC=35 PEANO_INSTALL_DIR="$PEANO" >/tmp/B_build.log 2>&1 \
  || { echo "B: BUILD FAILED"; tail -20 /tmp/B_build.log; exit 0; }
echo "B: templates built"
