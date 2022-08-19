
# (c) Copyright 2021 Xilinx Inc. All Rights Reserved.

# RUN: %PYTHON %s | FileCheck %s
# CHECK: %[[C0:.*]] = arith.constant 2 : index
# CHECK: %[[C1:.*]] = arith.constant 2 : index
# CHECK: air.herd @pyHerd tile (%{{.*}}, %{{.*}}) in (%{{.*}}=%[[C0]], %{{.*}}=%[[C1]]) {
# CHECK:   %{{.*}} = arith.constant 1 : index
# CHECK:   air.herd_terminator
# CHECK: }
import air
from air.mlir.ir import *
from air.mlir.dialects import air as airdialect
from air.mlir.dialects import arith
from air.mlir.dialects import func

with Context() as ctx, Location.unknown():
  airdialect.register_dialect(ctx)

  module = Module.create()
  with InsertionPoint(module.body):
    ftype = FunctionType.get(
              [IntegerType.get_signless(32),
               IntegerType.get_signless(32)], [])
    fop = func.FuncOp("test", ftype)

    bb = fop.add_entry_block()
    with InsertionPoint(bb):
      idx_ty = IndexType.get()
      size_x = arith.ConstantOp(idx_ty, IntegerAttr.get(idx_ty, 2))
      size_y = arith.ConstantOp(idx_ty, IntegerAttr.get(idx_ty, 2))
      sizes = [size_x.result, size_y.result]
      herd = airdialect.HerdOp("pyHerd", sizes, [])
      with InsertionPoint(herd.body):
        arith.ConstantOp(idx_ty, IntegerAttr.get(idx_ty, 1))
        airdialect.HerdTerminatorOp()
      func.ReturnOp([])

print (module)
