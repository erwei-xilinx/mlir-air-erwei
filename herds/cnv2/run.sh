python $1.py > $1.mlir; aten-opt --aten-to-air $1.mlir > $1.air.mlir; aten-opt --air-name-layers $1.air.mlir > $1.air_named.mlir; aten-opt --air-expand-graph $1.air_named.mlir
