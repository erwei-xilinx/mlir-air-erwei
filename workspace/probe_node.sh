#!/usr/bin/env bash
# Read-only reconnaissance of a Slurm compute node: what toolchain is there,
# and does the mlir-air build we already have on NFS actually run on it?
echo "=== host ==="
hostname; uname -r; nproc; free -g | sed -n 2p
grep -m1 PRETTY_NAME /etc/os-release
echo "glibc: $(ldd --version | head -1)"

echo; echo "=== gpu ==="
(rocminfo 2>/dev/null | grep -m4 -i "gfx\|Marketing") || echo "no rocminfo"
(rocm-smi --showproductname 2>/dev/null | head -12) || true

echo; echo "=== rocm ==="
ls -d /opt/rocm* 2>/dev/null
for f in /opt/rocm*/.info/version; do [ -f "$f" ] && echo "$f: $(cat $f)"; done
(/opt/rocm/llvm/bin/clang --version 2>/dev/null | head -2) || echo "no rocm clang"
(hipcc --version 2>/dev/null | head -3) || echo "no hipcc"

echo; echo "=== local scratch ==="
df -hT -x tmpfs -x devtmpfs -x squashfs 2>/dev/null | egrep -v "^Filesystem" | sort -k7
for d in /scratch /local /localscratch /tmp; do
  [ -d "$d" ] && { touch $d/.wt_$$ 2>/dev/null && { echo "$d WRITABLE"; rm -f $d/.wt_$$; } || echo "$d not writable"; }
done

echo; echo "=== modules ==="
(module avail 2>&1 | head -30) || echo "no modules"

echo; echo "=== does the existing NFS build run here? ==="
for b in /home/erweiw/mlir-air/build/bin/air-opt /home/erweiw/mlir-air/install/bin/air-opt; do
  [ -x "$b" ] && { echo "-- $b"; $b --version 2>&1 | head -3; }
done
echo "-- llvm/install (built tonight, wrong commit):"
/home/erweiw/mlir-air/llvm/install/bin/mlir-opt --version 2>&1 | head -3

echo; echo "=== python / build tools ==="
python3 --version; (which ninja cmake clang++ lld ccache 2>/dev/null)
cmake --version 2>/dev/null | head -1
