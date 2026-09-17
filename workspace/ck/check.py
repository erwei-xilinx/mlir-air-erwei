import re, sys
txt = sys.stdin.read()
i = txt.index("data =")
vals = [float(v) for v in re.findall(r'-?\d+\.?\d*(?:e[-+]?\d+)?', txt[i+6:])]
want = float(sys.argv[1]) if len(sys.argv) > 1 else None
n_expected = int(sys.argv[2]) if len(sys.argv) > 2 else None
print(f"elements={len(vals)} distinct={sorted(set(vals))[:6]}")
if want is not None:
    bad = [v for v in vals if abs(v - want) > 1e-3]
    if n_expected is not None and len(vals) != n_expected:
        print(f"FAIL: expected {n_expected} elements, got {len(vals)}")
    elif bad:
        print(f"FAIL: {len(bad)} of {len(vals)} differ from {want}")
    else:
        print(f"PASS: all {len(vals)} elements == {want}")
