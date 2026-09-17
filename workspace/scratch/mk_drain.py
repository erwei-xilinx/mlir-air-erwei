#!/usr/bin/env python3
"""Mark a chiplet queue drained so stealers read a flag instead of claiming.

Measured: dropping `dies` from 16 to 8 was worth 4.85 ms/token, about 0.6 ms
per probe removed, and it is not the broadcast barriers (removing one changed
nothing) nor false sharing on the counters (a line each made it 0.13 worse).
What is left is the device-scope atomic itself: every workgroup does one per
chiplet queue per stage, and seven of its eight find nothing.

So the first workgroup to get an out-of-range claim from a queue writes a flag
next to that queue's counter, and everyone else loads the flag and skips. The
load is uniform across the workgroup -- same address, same value -- so unlike
the claim it needs no broadcast at all. The race is benign: a few extra claims
happen before the flag lands, and a claim that finds nothing was already free
of side effects.
"""
import sys
src = open(sys.argv[1]).read()


def sub1(old, new):
    global src
    assert src.count(old) == 1, f"{src.count(old)} matches for {old[:60]!r}"
    src = src.replace(old, new)


# two words per queue: the counter, and the drained flag beside it
sub1("    qslots = (stages + extras) * maxdies",
     "    qslots = (stages + extras) * maxdies * 2")
sub1("          %hb{l}_{stage} = arith.constant {stage * maxdies} : index",
     "          %hb{l}_{stage} = arith.constant {stage * maxdies * 2} : index")
sub1("          %hsingle{stage}_{l} = arith.constant {stage * maxdies} : index",
     "          %hsingle{stage}_{l} = arith.constant {stage * maxdies * 2} : index")

# read the flag before touching the queue
sub1("""            %hidx = arith.addi %hb{l}_{stage}, %d : index
            %inner:2 = scf.while (%go = %true, %acc = %outer) : (i1, i32) -> (i1, i32) {{
              scf.condition(%go) %go, %acc : i1, i32
            }} do {{""",
     """            %d2 = arith.muli %d, %c2_s : index
            %hidx = arith.addi %hb{l}_{stage}, %d2 : index
            %fidx = arith.addi %hidx, %c1_s : index
            // Uniform load: every thread reads the same word and gets the same
            // answer, so skipping a drained queue costs one load and no
            // broadcast, against an atomic and a broadcast to discover the
            // same thing.
            %flg = memref.load %sq[%step, {lc}, %fidx] : {QUT}
            %drained = arith.cmpi ne, %flg, %zero_s : i32
            %inner1 = scf.if %drained -> (i32) {{
              scf.yield %outer : i32
            }} else {{
            %inner:2 = scf.while (%go = %true, %acc = %outer) : (i1, i32) -> (i1, i32) {{
              scf.condition(%go) %go, %acc : i1, i32
            }} do {{""")

# close the scf.if and set the flag on the claim that found nothing
sub1("""              }} else {{
                scf.yield %acc : i32
              }}
              scf.yield %has, %acc2 : i1, i32
            }}
            scf.yield %inner#1 : i32
          }}""",
     """              }} else {{
                scf.if %isLead {{
                  memref.store %one_s, %sq[%step, {lc}, %fidx] : {QUT}
                }}
                scf.yield %acc : i32
              }}
              scf.yield %has, %acc2 : i1, i32
            }}
            scf.yield %inner#1 : i32
            }}
            scf.yield %inner1 : i32
          }}""")
open(sys.argv[2], "w").write(src)
print("wrote", sys.argv[2])
