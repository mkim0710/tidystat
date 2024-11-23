# > rlang::`%||%`
# function (x, y) 
# {
#     if (is_null(x)) 
#         y
#     else x
# }
# <bytecode: 0x5608e0ee5b10>
# <environment: namespace:rlang>

# `%||%` = f_x.if_null_y = function(x, y) {
#   if (is.null(x)) y else x
# }


# `%||%` = f_x.if_null_y = function(x, y) {
#   if (!is.null(x)) x else y
# }

`%||%` = f_condition1.if_null_condition2 = function(condition1, condition2) {
  if (!is.null(condition1)) condition1 else condition2
}


