import re, sys
src = open(sys.argv[1], encoding="utf-8", errors="surrogateescape").read()
m = re.search(r'assembly = "((?:[^"\\]|\\.)*)"', src, re.S)
if not m:
    sys.exit("no assembly attribute")
sys.stdout.write(re.sub(r'\\([0-9A-Fa-f]{2})',
                        lambda h: chr(int(h.group(1), 16)), m.group(1)))
