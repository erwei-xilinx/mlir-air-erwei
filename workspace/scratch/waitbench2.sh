#!/usr/bin/env bash
# Second batch: runs as soon as waitbench.sh finishes, on the same allocation.
# Variants: the counted (unrolled) reduction loop on both bases, and blocked
# die mapping combined with the transpose.
LOG=/shared/erweiw/runs/waitbench2.log
exec >>"$LOG" 2>&1
echo "=== batch 2 waiter started $(date)"
for i in $(seq 1 1440); do
  grep -q '=== waiter done' /shared/erweiw/runs/waitbench.log 2>/dev/null && break
  sleep 60
done
st=$(squeue -j 72908 -h -o '%T' 2>/dev/null | head -1)
[ "$st" = "RUNNING" ] || { echo "72908 is $st, not running -- stopping"; exit 1; }
NODE=$(squeue -j 72908 -h -o '%N' 2>/dev/null | head -1)
echo "=== batch 2 on $NODE at $(date)"
ssh -o StrictHostKeyChecking=no "$NODE" bash -s <<'REMOTE'
cd /home/erweiw/mlir-air
source workspace/env.sh
hostname; squeue -w "$(hostname)" -h -o '%i:%u'
for round in a b; do
  for v in head trc hdc cmb; do
    LO=1 HI=300 workspace/bench.sh "${v}2_${round}" "/shared/erweiw/gen_${v}.py" \
      || echo "BENCH FAILED: ${v}2_${round}"
  done
done
REMOTE
echo "=== batch 2 done $(date)"
