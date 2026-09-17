module {
  func.func @t(%a: memref<8xi32>) {
    %c0 = arith.constant 0 : index
    %one = arith.constant 1 : i32
    %zero = arith.constant 0 : i32
    %tx = gpu.thread_id x
    %isLead = arith.cmpi eq, %tx, %c0 : index
    %v = scf.if %isLead -> (i32) {
      %r = memref.atomic_rmw addi %one, %a[%c0] : (i32, memref<8xi32>) -> i32
      scf.yield %r : i32
    } else {
      scf.yield %zero : i32
    }
    %b = rocdl.readfirstlane %v : i32
    memref.store %b, %a[%c0] : memref<8xi32>
    return
  }
}
