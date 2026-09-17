# Find backward-branch loops and report the ones that do floating-point work.
/^\.LBB[0-9_]+:/ { name=$1; sub(/:$/,"",name); line[name]=NR }
/s_cbranch|s_branch/ {
  t=""; for(i=1;i<=NF;i++) if($i ~ /^\.LBB/) t=$i
  if (t != "" && (t in line) && line[t] < NR) {
    h=line[t]; n=NR-h
    if (n>2 && n<400) { lo[h]=NR }
  }
}
END {
  for (h in lo) {
    n=0; ld=0; mf=0; fa=0; ds=0; a64=0; bl=0
    cmd="sed -n \"" h "," lo[h] "p\" " FILENAME
    while ((cmd | getline L) > 0) {
      if (L !~ /^[ \t]+[a-z]/) continue
      n++
      if (L ~ /_load/) ld++
      if (L ~ /buffer_load/) bl++
      if (L ~ /v_mfma/) mf++
      if (L ~ /v_fmac_f32|v_fma_f32|v_mul_f32|v_add_f32|v_pk_fma/) fa++
      if (L ~ /ds_read|ds_write/) ds++
      if (L ~ /_u64|_b64|_i64/) a64++
    }
    close(cmd)
    if (fa>0 || mf>0) printf "  loop@%-7d size %4d  loads %3d (buffer %2d)  lds %3d  mfma %3d  fp32ops %3d  64bit %3d\n", h, n, ld, bl, ds, mf, fa, a64
  }
}
