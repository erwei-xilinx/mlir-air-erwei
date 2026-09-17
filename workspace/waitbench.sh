#!/usr/bin/env bash
# Wait for allocation 72908 to start on a real MI300X, then run the three
# generator variants against each other twice, interleaved.
#
# Interleaved because the fixed cost of a run wanders by ~0.5 s and that is the
# whole resolution of the method: a control taken an hour before the variant is
# not a control. Two rounds of (head, blocked, transposed) at HI=300 puts every
# number within about twelve minutes of every other.
JOB=72908
LOG=/shared/erweiw/runs/waitbench.log
exec >>"$LOG" 2>&1
echo "=== waiter started $(date)"
for i in $(seq 1 1440); do
  st=$(squeue -j "$JOB" -h -o '%T' 2>/dev/null | head -1)
  [ "$st" = "RUNNING" ] && break
  [ -z "$st" ] && { echo "job $JOB vanished at $(date)"; exit 1; }
  sleep 60
done
NODE=$(squeue -j "$JOB" -h -o '%N' 2>/dev/null | head -1)
echo "=== $JOB running on $NODE at $(date)"
ssh -o StrictHostKeyChecking=no "$NODE" bash -s <<'REMOTE'
cd /home/erweiw/mlir-air
source workspace/env.sh
hostname; squeue -w "$(hostname)" -h -o '%i:%u'
for round in a b; do
  for v in head blk tr; do
    LO=1 HI=300 workspace/bench.sh "${v}_${round}" "/shared/erweiw/gen_${v}.py" \
      || echo "BENCH FAILED: ${v}_${round}"
  done
done
REMOTE
echo "=== waiter done $(date)"
