module {
  func.func @worker(%w: memref<1024xf32>, %o: memref<1024xf32>, %niters: index) {
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    air.launch (%bx, %by) in (%nbx=%c8, %nby=%c1) args(%aw=%w, %ao=%o, %ni=%niters) : memref<1024xf32>, memref<1024xf32>, index {
      air.segment @persistent_worker args(%sw=%aw, %so=%ao, %sn=%ni) : memref<1024xf32>, memref<1024xf32>, index {
        %c0_s = arith.constant 0 : index
        %c1_s = arith.constant 1 : index
        %c64_s = arith.constant 64 : index
        // Discovered once, outside the wave loop: the die binding has to
        // outlive every iteration.
        %rank = air.chiplet_block_id
        %n    = air.chiplet_dim_blocks
        scf.for %iter = %c0_s to %sn step %c1_s {
          // Cooperative tiling: worker %rank of %n walks every %n-th tile.
          scf.for %t = %rank to %c64_s step %n {
            %v = memref.load %sw[%t] : memref<1024xf32>
            %a = arith.addf %v, %v : f32
            memref.store %a, %so[%t] : memref<1024xf32>
          }
        }
        air.herd @herd tile (%tx, %ty) in (%ntx=%c1_s, %nty=%c1_s) {
        }
      }
    }
    return
  }
}
