

?is.expression
length(ex1 <- expression(1 + 0:9)) # 1
ex1
eval(ex1) # 1:10
# > length(ex1 <- expression(1 + 0:9)) # 1
# [1] 1
# > ex1
# expression(1 + 0:9)
# > eval(ex1) # 1:10
#  [1]  1  2  3  4  5  6  7  8  9 10

length(ex3 <- expression(u, 2, u + 0:9)) # 3
mode(ex3 [3])   # expression
mode(ex3[[3]])  # call
# > length(ex3 <- expression(u, 2, u + 0:9)) # 3
# [1] 3
# > mode(ex3 [3])   # expression
# [1] "expression"
# > mode(ex3[[3]])  # call
# [1] "call"

## but not all components are 'call's :
sapply(ex3, mode  ) #  name  numeric  call
sapply(ex3, typeof) # symbol  double  language
# > sapply(ex3, mode  ) #  name  numeric  call
# [1] "name"    "numeric" "call"   
# > sapply(ex3, typeof) # symbol  double  language
# [1] "symbol"   "double"   "language"
rm(ex3)

