#!/usr/bin/env bash
# Compile one generator variant to gfx942 assembly and count what the matmul
# body costs. No GPU: this is pure compilation, which is why it still works on
# a node whose GPU will not run the kernels.
set -e
GEN="$1"; LABEL="$2"; OUT="${3:-}"
T="$(mktemp -d)"; trap 'rm -rf "$T"' EXIT
python "$GEN" --layers 1 --dim 1024 --inter 3072 --heads 16 --kv-heads 8 \
    --head-dim 128 --tasks 128 --workers 128 --tokens 1 --cache 32 \
    --vocab 1024 --waves 8 > "$T/c.mlir"
air-opt "$T/c.mlir" -air-to-rocdl -o "$T/s1.mlir"
air-opt "$T/s1.mlir" -air-gpu-outlining -o "$T/s2.mlir"
mlir-opt "--pass-pipeline=builtin.module(func.func(lower-affine, convert-linalg-to-loops, convert-scf-to-cf), gpu-kernel-outlining)" "$T/s2.mlir" -o "$T/s3.mlir"
mlir-opt "--pass-pipeline=builtin.module(rocdl-attach-target{chip=gfx942 O=3},gpu.module(convert-gpu-to-rocdl{chipset=gfx942 runtime=HIP},reconcile-unrealized-casts),gpu-module-to-binary{format=isa})" "$T/s3.mlir" -o "$T/isa.mlir"
python - "$T/isa.mlir" > "$T/o.s" <<'PY'
import re,sys
src=open(sys.argv[1],encoding="utf-8",errors="surrogateescape").read()
m=re.search(r'assembly = "((?:[^"\\]|\\.)*)"',src,re.S)
if not m: sys.exit("no assembly")
sys.stdout.write(re.sub(r'\\([0-9A-Fa-f]{2})',lambda h:chr(int(h.group(1),16)),m.group(1)))
PY
c(){ printf '  %-26s %6d\n' "$1" "$(grep -c -- "$2" "$T/o.s" || true)"; }
echo "=== $LABEL  ($(grep -c '' "$T/o.s") lines)"
grep -o "group_segment_fixed_size: *[0-9]*" "$T/o.s" | head -1 | sed 's/^/  LDS /'
grep -o "vgpr_count: *[0-9]*" "$T/o.s" | head -1 | sed 's/^/  /'
grep -o "sgpr_count: *[0-9]*" "$T/o.s" | head -1 | sed 's/^/  /'
c "ds_write (any)" "	ds_write"
c "ds_read (any)"  "	ds_read"
c "s_barrier"      "	s_barrier"
c "ds_bpermute"    "ds_bpermute"
c "global_load_ushort" "global_load_ushort"
c "global_load_dword"  "global_load_dword"
c "global_load_dwordx2" "global_load_dwordx2"
c "global_load_dwordx4" "global_load_dwordx4"
c "buffer_load (any)"  "	buffer_load"
c "v_fma/v_fmac"       "v_fma"
c "s_waitcnt vmcnt"    "s_waitcnt vmcnt"
[ -n "$OUT" ] && cp "$T/o.s" "$OUT"
exit 0
