#!/usr/bin/env bash
#===- bench.sh ------------------------------------------------------------===//
#
# Time the generated megakernel on a real checkpoint, as ms per decoded token.
#
# The wall clock of one run is mostly not the device: three gigabytes of
# weights come off NFS and the single-threaded host reference recomputes the
# whole model, and both happen once however many times the chain is launched.
# So this times two launch counts and takes the slope, which is the only part
# that scales with the device work.
#
#   workspace/bench.sh <label> [gen.py]
#
# With a second argument the run uses that generator instead of the one in the
# tree, through a shadow copy of the directory, so two revisions can be timed
# back to back on the same node in the same minute. That matters more than it
# sounds: this cluster is shared and a number taken an hour apart is not
# comparable to one taken now.
#
# Records who else is on the node around each measurement. Somebody else's job
# appearing halfway through has made a mode look 3.5x slower before, and
# without this line there is no way to tell that after the fact.
#
#===------------------------------------------------------------------===//
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LABEL="${1:-run}"

# Refuse to start if another run of this script is already on the node. Two
# runs sharing one GPU produce numbers that look fine and mean nothing, and
# that is exactly what happened when a relaunch raced a copy that had not
# actually died.
LOCK=/tmp/air_bench.lock
exec 9>"$LOCK"
if ! flock -n 9; then
  echo "another bench.sh holds $LOCK on $(hostname) -- refusing to share the GPU" >&2
  exit 1
fi
ALTGEN="${2:-}"
export QWEN_DIR="${QWEN_DIR:-/shared/erweiw/qwen3-0.6b}"
export PY="${PY:-/shared/erweiw/venv/bin/python}"
export STEPS="${STEPS:-6}"
# The slope is taken against a fixed cost of about 80 s that varies by roughly
# half a second run to run, so the resolution is (fixed-cost jitter) / (HI - LO)
# and nothing else. Measured on rad-mi300x-2, 2026-09-17:
#
#   HI     signal    same snapshot twice        resolves
#     3     0.4 s    55.0 and 229.7 ms/token    nothing
#     9     1.1 s    40.1 and 50.4              nothing under 10 ms
#   100    11.7 s    18.1 and 19.6              nothing under 1.5 ms
#   300    35 s                                 ~0.5 ms, at +35 s a run
#
# The 100 row is the correction: an earlier batch of four runs agreed to under
# 1% and that was read as the resolution of the method. It is not -- it was the
# resolution of that hour. Use 100 to rank changes worth several ms and 300 for
# anything smaller, and never believe a difference smaller than a repeat of the
# *same* snapshot taken in the same session.
LO="${LO:-1}"
HI="${HI:-100}"

# Always run out of a snapshot, never out of the tree. A run takes minutes and
# regenerates the IR each time; editing the generator while one is in flight
# silently gives the two halves of a measurement two different programs. That
# has already happened once here.
SRC="$SCRIPT_DIR/../test/gpu/megakernel_gen"
RUNDIR="/tmp/air_bench_gen_$$"
mkdir -p "$RUNDIR"
cp "$SRC"/*.py "$SRC"/*.sh "$SRC"/*.c "$RUNDIR/"
if [ -n "$ALTGEN" ]; then
  [ -f "$ALTGEN" ] || { echo "no such generator: $ALTGEN" >&2; exit 1; }
  cp "$ALTGEN" "$RUNDIR/gen.py"
fi
echo "--- generator snapshot: $(md5sum "$RUNDIR/gen.py" | cut -c1-12)" >&2

# The header goes to stderr on purpose: stdout of this function is captured as
# the elapsed time, and a stray line there silently turns the subtraction below
# into zero.
t() {
  local r="$1" out="$2" s e
  echo "--- REPEAT=$r, others on node: $(squeue -w "$(hostname)" -h -o '%i:%u' | tr '\n' ' ')" >&2
  s=$(date +%s.%N)
  if ! REPEAT="$r" TMPDIR="/tmp/air_bench_$$_$r" "$RUNDIR/run_qwen.sh" > "$out" 2>&1; then
    if [ -z "${DIAG:-}" ]; then
      echo "FAIL: run_qwen.sh returned nonzero, see $out" >&2; tail -20 "$out" >&2; exit 1
    fi
  fi
  e=$(date +%s.%N)
  # DIAG=1 is for deliberately-incorrect builds used to attribute cost. It
  # skips the PASS requirement, so never use it to time something you intend
  # to keep.
  if [ -z "${DIAG:-}" ]; then
    grep -q '^PASS' "$out" || { echo "FAIL: no PASS line in $out" >&2; tail -20 "$out" >&2; exit 1; }
  fi
  echo "$e $s" | awk '{printf "%.3f\n", $1-$2}'
}

L="/tmp/${LABEL}.lo.log"; H="/tmp/${LABEL}.hi.log"
TLO=$(t "$LO" "$L")
THI=$(t "$HI" "$H")
echo "--- after,  others on node: $(squeue -w "$(hostname)" -h -o '%i:%u' | tr '\n' ' ')" >&2
awk -v lo="$LO" -v hi="$HI" -v tlo="$TLO" -v thi="$THI" -v st="$STEPS" -v lab="$LABEL" \
  'BEGIN {
     per = (thi - tlo) / (hi - lo);
     if (per <= 0) { printf "%-14s  BAD: slope %.3fs is not positive (wall %.2f -> %.2f)\n",
                            lab, per, tlo, thi; exit 1 }
     printf "%-14s  wall(%d)=%.2fs  wall(%d)=%.2fs  per launch=%.3fs  per token=%.1f ms\n",
            lab, lo, tlo, hi, thi, per, per * 1000 / st;
   }'
