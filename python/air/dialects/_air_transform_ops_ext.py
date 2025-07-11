# ./python/air/dialects/_air_transform_ops_ext.py -*- Python -*-

# Copyright (C) 2023, Advanced Micro Devices, Inc.
# SPDX-License-Identifier: MIT

from ..ir import *
from ..dialects import pdl
from ._air_transform_ops_gen import *

from ._ods_common import get_op_result_or_value as _get_op_result_or_value

from typing import List, Optional, Sequence, Union

IntOrAttrList = Sequence[Union[IntegerAttr, int]]
OptionalIntList = Optional[Union[ArrayAttr, IntOrAttrList]]


class LinalgTileOp(LinalgTileOp):
    """Specialization for LinalgTileOp class."""

    def __init__(
        self,
        target: Union[Operation, Value],
        *,
        sizes: Optional[
            Union[Sequence[Union[int, IntegerAttr, Operation, Value]], ArrayAttr]
        ] = None,
        loc=None,
        ip=None
    ):
        pdl_operation_type = pdl.OperationType.get()

        if sizes is None:
            sizes = []

        static_sizes = []
        dynamic_sizes = []
        if isinstance(sizes, ArrayAttr):
            sizes_attr = sizes
        else:
            for size in sizes:
                if isinstance(size, int):
                    static_sizes.append(size)
                else:
                    static_sizes.append(ShapedType.get_dynamic_size())
                    dynamic_sizes.append(_get_op_result_or_value(size))
            sizes_attr = DenseI64ArrayAttr.get(static_sizes)

        super().__init__(
            pdl_operation_type,
            pdl_operation_type,
            _get_op_result_or_value(target),
            dynamic_sizes=dynamic_sizes,
            static_sizes=sizes_attr,
            loc=loc,
            ip=ip,
        )
