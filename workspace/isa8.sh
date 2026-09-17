#!/usr/bin/env bash
# isa.sh with a wavefront count, so the multi-wave path can be counted too.
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WAVES="${WAVES:-8}"
T="$(mktemp -d)"; trap 'rm -rf "$T"' EXIT
/shared/erweiw/venv/bin/python "$SCRIPT_DIR/../test/gpu/megakernel_gen/gen.py" \
    --layers 1 --dim 1024 --inter 3072 --heads 16 --kv-heads 8 --head-dim 128 \
    --tasks 32 --workers 32 --tokens 5 --cache 32 --vocab 1024 --waves "$WAVES" > "$T/c.mlir"
air-opt "$T/c.mlir" -air-to-rocdl -o "$T/s1.mlir"
air-opt "$T/s1.mlir" -air-gpu-outlining -o "$T/s2.mlir"
mlir-opt "--pass-pipeline=builtin.module(func.func(lower-affine, convert-linalg-to-loops, convert-scf-to-cf), gpu-kernel-outlining)" "$T/s2.mlir" -o "$T/s3.mlir"
mlir-opt "--pass-pipeline=builtin.module(rocdl-attach-target{chip=gfx950 O=3},gpu.module(convert-gpu-to-rocdl{chipset=gfx950 runtime=HIP},reconcile-unrealized-casts),gpu-module-to-binary{format=isa})" "$T/s3.mlir" -o "$T/isa.mlir"
/shared/erweiw/venv/bin/python - "$T/isa.mlir" > "$T/o.s" <<'PY'
import re,sys
src=open(sys.argv[1],encoding="utf-8",errors="surrogateescape").read()
m=re.search(r'assembly = "((?:[^"\\]|\\.)*)"',src,re.S)
if not m: sys.exit("no assembly")
sys.stdout.write(re.sub(r'\\([0-9A-Fa-f]{2})',lambda h:chr(int(h.group(1),16)),m.group(1)))
PY
c(){ printf '%-28s %6d\n' "$1" "$(grep -c -- "$2" "$T/o.s" || true)"; }
echo "--- waves=$WAVES"
grep -o "group_segment_fixed_size: *[0-9]*" "$T/o.s" | head -1
c "ds_write" "	ds_write"; c "ds_read" "	ds_read"
c "s_barrier" "	s_barrier"; c "v_mfma" "v_mfma"
[ -n "${1:-}" ] && cp "$T/o.s" "$1"
exit 0
