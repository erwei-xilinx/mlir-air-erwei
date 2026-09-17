#!/usr/bin/env bash
# 重跑 plan 里四条编译验证。需要 clang >= 19(gfx950)。
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLANG="${CLANG:-/tmp/llvm22/LLVM-22.1.8-Linux-X64/bin/clang}"
LLC="$(dirname "$CLANG")/llc"
[[ -x "$CLANG" ]] || { echo "需要 clang>=19。下载:
  curl -L -o llvm.tar.xz https://github.com/llvm/llvm-project/releases/download/llvmorg-22.1.8/LLVM-22.1.8-Linux-X64.tar.xz" >&2; exit 1; }

echo "=== ① syncscope -> fence 三档 (plan §1.1) ==="
"$LLC" -mtriple=amdgcn-amd-amdhsa -mcpu=gfx950 "$HERE/scope.ll" -o /tmp/_s.s
for k in k_agent k_wg k_sys; do printf "  %-9s " $k
  awk "/^${k}:/{f=1} f{print} f&&/s_endpgm/{exit}" /tmp/_s.s | grep -E 'buffer_wbl2|atomic' | sed 's#//.*##' | tr '\n' ' '; echo; done

echo "=== ② global.load.lds \$aux -> nt/sc1 (plan §1.4) ==="
"$LLC" -mtriple=amdgcn-amd-amdhsa -mcpu=gfx950 "$HERE/lds.ll" -o /tmp/_l.s
for k in aux0 aux18_sc1_nt aux2_nt; do printf "  %-14s " $k
  awk "/^${k}:/{f=1} f{print} f&&/s_endpgm/{exit}" /tmp/_l.s | grep -E 'load_lds' | sed 's#//.*##' | head -1; done

echo "=== ③ nontemporal -> nt (plan §1.5) ==="
"$LLC" -mtriple=amdgcn-amd-amdhsa -mcpu=gfx950 "$HERE/nt.ll" -o /tmp/_n.s
for k in plain nontemporal; do printf "  %-12s " $k
  awk "/^${k}:/{f=1} f{print} f&&/s_endpgm/{exit}" /tmp/_n.s | grep -E 'global_store' | sed 's#//.*##' | head -1; done

echo "=== ④ Fleet volatile -> sc0 sc1 (plan §1.1 的 bug) ==="
"$CLANG" -x hip --offload-device-only --offload-arch=gfx950 -nogpulib -nogpuinc -O3 -w \
  -S "$HERE/vol.hip.cpp" -o /tmp/_v.s
for k in k_vol k_plain k_volst k_plainst; do printf "  %-10s " $k
  awk "/^_Z[0-9]*${k}/{f=1} f{print} f&&/s_endpgm/{exit}" /tmp/_v.s | grep -E 'flat_|global_' | sed 's#//.*##' | head -1; done
