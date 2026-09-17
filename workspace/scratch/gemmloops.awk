/^\.LBB[0-9_]+:/ { name=$1; sub(/:$/,"",name); line[name]=NR }
/s_cbranch|s_branch/ {
  t=""; for(i=1;i<=NF;i++) if($i ~ /^\.LBB/) t=$i
  if (t!="" && (t in line) && line[t]<NR) { h=line[t]; if(NR-h>2 && NR-h<600) lo[h]=NR }
}
END {
  for (h in lo) {
    n=0; us=0; dw=0; x2=0; x4=0; fa=0; a64=0; wc=0
    cmd="sed -n \"" h "," lo[h] "p\" " FILENAME
    while ((cmd|getline L)>0) {
      if (L !~ /^[ \t]+[a-z]/) continue
      n++
      if (L~/global_load_ushort/) us++
      if (L~/global_load_dword\b/) dw++
      if (L~/load_dwordx2/) x2++
      if (L~/load_dwordx4/) x4++
      if (L~/v_mul_f32|v_add_f32|v_fmac_f32|v_fma_f32/) fa++
      if (L~/_u64|_b64|_i64/) a64++
      if (L~/s_waitcnt/) wc++
    }
    close(cmd)
    if (us>0) printf "  loop@%-6d size %4d  ushort %3d  dword %3d  x2 %2d  x4 %2d  fp32 %3d  64bit %3d  waitcnt %3d\n", h, n, us, dw, x2, x4, fa, a64, wc
  }
}
