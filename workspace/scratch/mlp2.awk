# Loads in flight = buffer/global loads issued between two waits that actually
# constrain them. lgkmcnt waits are for LDS and do not drain vmcnt, so counting
# every s_waitcnt understates how much Fleet keeps outstanding.
BEGIN{cur=0;max=0;tot=0}
{
  if ($0 ~ /^[ \t]+(global|buffer|flat)_load/) { cur++; tot++ }
  else if ($0 ~ /s_waitcnt/ && $0 ~ /vmcnt/) {
    if (cur>max) max=cur
    n=$0; sub(/.*vmcnt\(/,"",n); sub(/\).*/,"",n)+0
    cur = (n+0 < cur ? n+0 : cur)
  }
}
END{ if(cur>max)max=cur; printf "%-26s %3d loads, max outstanding = %d\n", label, tot, max }
