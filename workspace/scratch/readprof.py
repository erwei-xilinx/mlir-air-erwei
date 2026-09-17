import sqlite3, glob, sys
db = sorted(glob.glob("/tmp/prof.*/run_results.db"))[-1]
c = sqlite3.connect(db)
s = [r[0] for r in c.execute("SELECT name FROM sqlite_master WHERE type='table'")]
kd = [t for t in s if t.startswith("rocpd_kernel_dispatch")][0]
ks = [t for t in s if t.startswith("rocpd_info_kernel_symbol")][0]
q = ("SELECT k.display_name, d.grid_size_x, d.workgroup_size_x,"
     " (d.end-d.start)/1e6, k.arch_vgpr_count, k.sgpr_count, k.group_segment_size"
     f" FROM {kd} d JOIN {ks} k ON d.kernel_id=k.id ORDER BY 4 DESC")
print(db)
hdr = ("kernel", "grid", "block", "ms", "vgpr", "sgpr", "lds")
print("%-26s%8s%7s%12s%6s%6s%6s" % hdr)
tot = 0.0
for n, g, b, ms, v, sg, lds in c.execute(q):
    tot += ms
    print("%-26s%8d%7d%12.3f%6s%6s%6s" % (n[:26], g, b, ms, v, sg, lds))
print("%-26s%8s%7s%12.3f" % ("TOTAL device", "", "", tot))
