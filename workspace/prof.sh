#!/usr/bin/env bash
# Kernel-level truth: how long the device actually runs, as opposed to the
# minute of NFS reads and single-threaded host reference around it.
#
#   LAYERS=2 STEPS=2 workspace/prof.sh
#
# Keep it small. rocprofv3 over a full 28-layer run did not finish in 25
# minutes here.
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export QWEN_DIR="${QWEN_DIR:-/shared/erweiw/qwen3-0.6b}"
export PY="${PY:-/shared/erweiw/venv/bin/python}"
export STEPS="${STEPS:-2}" REPEAT="${REPEAT:-1}" LAYERS="${LAYERS:-2}"
export WORKERS="${WORKERS:-128}" TASKS="${TASKS:-128}"
OUT="${OUT:-/tmp/prof.$$}"
rm -rf "$OUT"; mkdir -p "$OUT"
rocprofv3 --kernel-trace --stats -d "$OUT" -o run -- \
    "$SCRIPT_DIR/../test/gpu/megakernel_gen/run_qwen.sh" > "$OUT/run.log" 2>&1 &
PROF=$!
# rocprofv3 has hung here before; do not let it hold the node.
for i in $(seq "${PROF_TIMEOUT:-600}"); do
  kill -0 $PROF 2>/dev/null || break
  sleep 1
done
if kill -0 $PROF 2>/dev/null; then
  echo "rocprofv3 still running after ${PROF_TIMEOUT:-600}s -- killing" >&2
  kill -9 $PROF 2>/dev/null; pkill -9 -f rocprofv3; pkill -9 -f mlir-runner
  exit 1
fi
wait $PROF || { echo "rocprofv3 failed:"; tail -20 "$OUT/run.log"; exit 1; }
echo "=== kernel stats ($LAYERS layers, $STEPS steps, $WORKERS workers) ==="
F=$(find "$OUT" -name '*kernel_stats*' | head -1)
[ -n "$F" ] || { echo "no stats file; files were:"; find "$OUT" -type f | head; exit 1; }
cat "$F"
