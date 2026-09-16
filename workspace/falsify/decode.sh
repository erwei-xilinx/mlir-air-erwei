#!/usr/bin/env bash
# Break the decode mechanism on the device side only, one thing at a time, and
# confirm each break is visible.
#
# The host reference lives in the same file and several lines are textually
# identical on both sides -- `%curlen = arith.addi %wbase, %nat : index`
# appears once in each. A plain sed edits both, both sides are then wrong in
# the same way, and the comparison reports 0. That is the sixth kind of
# vacuous green, and an md5 guard does not catch it because the file *did*
# change. So every sed here is line-addressed to start at `func.func @chain`,
# which is where the device code begins, and the number of sites changed is
# checked against what the variant expects.
export PATH=/home/erweiw/mlir-air/build-gpu/bin:/shared/erweiw/llvm-56bcc187/bin:$PATH
D=/home/erweiw/mlir-air/workspace/scratch/dec
cd "$D"
GEN=/home/erweiw/mlir-air/test/gpu/megakernel_gen/gen.py
L=/shared/erweiw/llvm-56bcc187/lib

run() {
  N=$1
  air-opt $N.mlir -air-to-rocdl -o $N.s1.mlir 2>/dev/null
  air-opt $N.s1.mlir -air-gpu-outlining -o $N.s2.mlir 2>/dev/null
  mlir-opt "--pass-pipeline=builtin.module(func.func(lower-affine, convert-linalg-to-loops, convert-scf-to-cf), gpu-kernel-outlining)" $N.s2.mlir -o $N.s3.mlir 2>/dev/null
  mlir-opt "--pass-pipeline=builtin.module(rocdl-attach-target{chip=gfx942 O=3},gpu.module(convert-gpu-to-rocdl{chipset=gfx942 runtime=HIP},reconcile-unrealized-casts),gpu-module-to-binary, func.func(gpu-async-region),gpu-to-llvm,convert-to-llvm,reconcile-unrealized-casts)" $N.s3.mlir -o $N.s4.mlir 2>/dev/null
  timeout 300 mlir-runner --entry-point-result=void \
    --shared-libs=$L/libmlir_rocm_runtime.so --shared-libs=$L/libmlir_runner_utils.so \
    --shared-libs=$L/libmlir_c_runner_utils.so \
    --shared-libs=/home/erweiw/mlir-air/build-gpu/lib/libairgpu.so $N.s4.mlir > $N.out 2>&1
  rc=$?
  if [ $rc -ne 0 ]; then printf "  exit=%s%s\n" "$rc" "$([ $rc = 124 ] && echo ' (hang)')"; return; fi
  num() { grep -a "$1" $N.out | tail -1 | awk '{print $NF}'; }
  printf "  hidden=%-5s logits=%-5s tokens=%-4s total=%s\n" \
    "$(num 'output elements')" "$(num 'logit elements')" \
    "$(num 'tokens differing')" "$(num 'total differences')"
}

# One variant: name, expected number of device sites, the sed body.
try() {
  name=$1; want=$2; pat=$3; rep=$4
  cp base.mlir v.mlir
  start=$(grep -n 'func.func @chain' v.mlir | cut -d: -f1)
  n=$(awk -v s="$start" -v p="$pat" 'NR>=s && index($0,p)' v.mlir | wc -l)
  if [ "$n" != "$want" ]; then
    echo "=== $name"; echo "  PATTERN HIT $n DEVICE SITES, EXPECTED $want -- proved nothing"; return
  fi
  # Refuse if the pattern also appears in the host half: that edit would be
  # applied to only one of two identical sides here, but the count above is
  # what makes the claim, so say when the text is ambiguous.
  hostn=$(awk -v s="$start" -v p="$pat" 'NR<s && index($0,p)' v.mlir | wc -l)
  sed -i "${start},\$ s|${pat}|${rep}|" v.mlir
  echo "=== $name  (device sites: $n, same text in host: $hostn)"
  run v
}

echo "### config 1: prompt 5 in a window of 2 -- prefill 2,2,1 then decode 1,1"
python3 "$GEN" --layers 2 --tokens 2 --steps 5 --prompt-len 5 \
                --tasks 8 --workers 32 > base.mlir
echo "=== baseline"; run base

try "A the window never shrinks after the prompt" 1 \
  '%nat = arith.select %isPre_s, %capped_s, %c1_s : index' \
  '%nat = arith.select %isPre_s, %ctok_s, %ctok_s : index'
try "B the sequence advances by the window, not the step's tokens" 1 \
  '%seqn = arith.addi %seq, %nat : index' \
  '%seqn = arith.addi %seq, %ctok_s : index'
try "C attention length does not grow with the step's tokens" 1 \
  '%curlen = arith.addi %wbase, %nat : index' \
  '%curlen = arith.addi %wbase, %c1_s : index'
try "D generated tokens overwrite prompt slots (guard dropped)" 1 \
  '%past = arith.cmpi sge, %nxt, %plen_s : index' \
  '%past = arith.cmpi sge, %nxt, %c0_s : index'
try "E padding rows computed instead of skipped" 17 \
  '%mAct = arith.cmpi ult, %m, %nat : index' \
  '%mAct = arith.cmpi ult, %m, %ctok_s : index'
try "F the step reads the stream from 0, not from where it left off" 1 \
  '%tp = arith.addi %seq, %m : index' \
  '%tp = arith.addi %c0_s, %m : index'

echo
echo "### config 2: prompt 4 in a window of 2 -- the last prefill chunk is full,"
echo "###           so the row the next token comes from is observable"
python3 "$GEN" --layers 2 --tokens 2 --steps 4 --prompt-len 4 \
                --tasks 8 --workers 32 > base.mlir
echo "=== baseline"; run base
try "G next token taken from the first row of the chunk, not the last" 1 \
  '%lastm = arith.subi %nat, %c1_s : index' \
  '%lastm = arith.subi %c1_s, %c1_s : index'
