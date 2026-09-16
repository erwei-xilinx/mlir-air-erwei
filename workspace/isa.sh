#!/usr/bin/env bash
#===- isa.sh --------------------------------------------------------------===//
#
# Compile the generated megakernel down to gfx950 assembly and count the
# instructions that the AIR-vs-Fleet diff singled out. No GPU is involved --
# this is pure compilation, so it runs on any node with the toolchain and it
# is two orders of magnitude faster than decoding 28 layers.
#
#   workspace/isa.sh                # counts, one line each
#   workspace/isa.sh /tmp/keep.s    # also keeps the assembly
#
# The configuration is the one /shared/erweiw/isadiff/air.mlir was built with,
# so the numbers are directly comparable to the table in
# /shared/erweiw/fleet-artifacts/README.md.
#
#===------------------------------------------------------------------===//
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GEN="${GEN:-$SCRIPT_DIR/../test/gpu/megakernel_gen/gen.py}"
PY="${PY:-python3}"
OUT="${1:-}"
T="$(mktemp -d)"
trap 'rm -rf "$T"' EXIT

# Same shape as /shared/erweiw/isadiff/air.mlir: one Qwen3-0.6B layer.
"$PY" "$GEN" --layers 1 --dim 1024 --inter 3072 --heads 16 --kv-heads 8 \
    --head-dim 128 --tasks 32 --workers 32 --tokens 5 --cache 32 \
    --vocab 1024 > "$T/chain.mlir"

air-opt "$T/chain.mlir" -air-to-rocdl -o "$T/s1.mlir"
air-opt "$T/s1.mlir" -air-gpu-outlining -o "$T/s2.mlir"
mlir-opt "--pass-pipeline=builtin.module(func.func(lower-affine, convert-linalg-to-loops, convert-scf-to-cf), gpu-kernel-outlining)" \
    "$T/s2.mlir" -o "$T/s3.mlir"
mlir-opt "--pass-pipeline=builtin.module(rocdl-attach-target{chip=gfx950 O=3},gpu.module(convert-gpu-to-rocdl{chipset=gfx950 runtime=HIP},reconcile-unrealized-casts),gpu-module-to-binary{format=isa})" \
    "$T/s3.mlir" -o "$T/isa.mlir"

# The assembly arrives as one MLIR string attribute with \XX hex escapes.
"$PY" - "$T/isa.mlir" > "$T/out.s" <<'EOF'
import re, sys
src = open(sys.argv[1], encoding="utf-8", errors="surrogateescape").read()
m = re.search(r'assembly = "((?:[^"\\]|\\.)*)"', src, re.S)
if not m:
    sys.exit("no assembly attribute in the gpu-module-to-binary output")
sys.stdout.write(re.sub(r'\\([0-9A-Fa-f]{2})',
                        lambda h: chr(int(h.group(1), 16)), m.group(1)))
EOF
[ -s "$T/out.s" ] || { echo "ERROR: empty assembly" >&2; exit 1; }
[ -n "$OUT" ] && cp "$T/out.s" "$OUT"

# The assembler writes the _e32/_e64 encoding suffix into the mnemonic, so the
# patterns match on a prefix; "lane 0 only" is the v0-against-zero compare that
# guards every scf.if %isLead.
c() { printf '%-32s %6d\n' "$1" "$(grep -c -- "$2" "$T/out.s" || true)"; }
echo "--- gfx950, $(grep -c '' "$T/out.s") lines of assembly"
c "v_mfma"                 "v_mfma"
c "ds_write_b128"          "ds_write_b128"
c "ds_read_b128"           "ds_read_b128"
c "ds_write (any)"         "	ds_write"
c "ds_read (any)"          "	ds_read"
c "ds_swizzle/ds_bpermute" "	ds_\(swizzle\|bpermute\)"
c "s_sleep"                "	s_sleep"
# gfx950 drops s_barrier when the block is a single wave, which it is here, so
# a zero means nothing until the herd is wider than 1x1.
c "s_barrier"              "	s_barrier"
c "lane-0 guard (vcc,0,v0)" "v_cmp_eq_u32_e32 vcc, 0, v0"
c "v_readfirstlane_b32"    "v_readfirstlane_b32"
c "s_getreg HW_REG_XCC_ID" "HW_REG_XCC_ID"
c "buffer_wbl2"            "buffer_wbl2"
c "buffer_inv"             "buffer_inv"
c "global_load_dword"      "global_load_dword"
c "v_fmac/v_fma_f32"       "v_fma"
