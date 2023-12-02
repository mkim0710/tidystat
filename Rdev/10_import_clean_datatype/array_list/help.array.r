# > ## Compute row and column sums for a matrix:
# > x <- cbind(x1 = 3, x2 = c(4:1, 2:5))
# > x
#      x1 x2
# [1,]  3  4
# [2,]  3  3
# [3,]  3  2
# [4,]  3  1
# [5,]  3  2
# [6,]  3  3
# [7,]  3  4
# [8,]  3  5
# > dimnames(x)[[1]] <- letters[1:8]
# > apply(x, 2, mean, trim = .2)
# x1 x2 
#  3  3 
# > col.sums <- apply(x, 2, sum)
# > row.sums <- apply(x, 1, sum)
# > rbind(cbind(x, Rtot = row.sums), Ctot = c(col.sums, sum(col.sums)))
#      x1 x2 Rtot
# a     3  4    7
# b     3  3    6
# c     3  2    5
# d     3  1    4
# e     3  2    5
# f     3  3    6
# g     3  4    7
# h     3  5    8
# Ctot 24 24   48
# > 
# > all( apply(x,2, is.vector)) # TRUE [was not in R <= 0.63.2]
# [1] TRUE
# > 
# > ## Sort the columns of a matrix
# > apply(x, 2, sort)
#      x1 x2
# [1,]  3  1
# [2,]  3  2
# [3,]  3  2
# [4,]  3  3
# [5,]  3  3
# [6,]  3  4
# [7,]  3  4
# [8,]  3  5
# > 
# > ##- function with extra args:
# > cave <- function(x, c1,c2) c(mean(x[c1]),mean(x[c2]))
# > apply(x,1, cave,  c1="x1", c2=c("x1","x2"))
#        a b   c d   e f   g h
# [1,] 3.0 3 3.0 3 3.0 3 3.0 3
# [2,] 3.5 3 2.5 2 2.5 3 3.5 4
# > 
# > ma <- matrix(c(1:4, 1, 6:8), nr = 2)
# > ma
#      [,1] [,2] [,3] [,4]
# [1,]    1    3    1    7
# [2,]    2    4    6    8
# > apply(ma, 1, table)  #--> a list of length 2
# [[1]]
# 
# 1 3 7 
# 2 1 1 
# 
# [[2]]
# 
# 2 4 6 8 
# 1 1 1 1 
# 
# > apply(ma, 1, quantile)# 5 x n matrix with rownames
#      [,1] [,2]
# 0%      1  2.0
# 25%     1  3.5
# 50%     2  5.0
# 75%     4  6.5
# 100%    7  8.0
# > 
# > all(dim(ma) == dim(apply(ma, 1:2, sum)))## wasn't ok before R 0.63.1
# [1] TRUE
# > 
# > ## Compute row and column sums for a matrix:
# > x <- cbind(x1 = 3, x2 = c(4:1, 2:5))
# > x
#      x1 x2
# [1,]  3  4
# [2,]  3  3
# [3,]  3  2
# [4,]  3  1
# [5,]  3  2
# [6,]  3  3
# [7,]  3  4
# [8,]  3  5
# > dimnames(x)[[1]] <- letters[1:8]
# > apply(x, 2, mean)
# x1 x2 
#  3  3 
# > col.sums <- apply(x, 2, sum)
# > row.sums <- apply(x, 1, sum)
# > rbind(cbind(x, Rtot = row.sums), Ctot = c(col.sums, sum(col.sums)))
#      x1 x2 Rtot
# a     3  4    7
# b     3  3    6
# c     3  2    5
# d     3  1    4
# e     3  2    5
# f     3  3    6
# g     3  4    7
# h     3  5    8
# Ctot 24 24   48
# > 
# > all( apply(x,2, is.vector)) # TRUE [was not in R <= 0.63.2]
# [1] TRUE
# > 
# > ## Sort the columns of a matrix
# > apply(x, 2, sort)
#      x1 x2
# [1,]  3  1
# [2,]  3  2
# [3,]  3  2
# [4,]  3  3
# [5,]  3  3
# [6,]  3  4
# [7,]  3  4
# [8,]  3  5
# > 
# > ##- function with extra args:
# > cave <- function(x, c1,c2) c(mean(x[c1]),mean(x[c2]))
# > apply(x,1, cave,  c1="x1", c2=c("x1","x2"))
#        a b   c d   e f   g h
# [1,] 3.0 3 3.0 3 3.0 3 3.0 3
# [2,] 3.5 3 2.5 2 2.5 3 3.5 4
# > 
# > ma <- matrix(c(1:4, 1, 6:8), nr = 2)
# > ma
#      [,1] [,2] [,3] [,4]
# [1,]    1    3    1    7
# [2,]    2    4    6    8
# > apply(ma, 1, table)  #--> a list of length 2
# [[1]]
# 
# 1 3 7 
# 2 1 1 
# 
# [[2]]
# 
# 2 4 6 8 
# 1 1 1 1 
# 
# > apply(ma, 1, quantile)# 5 x n matrix with rownames
#      [,1] [,2]
# 0%      1  2.0
# 25%     1  3.5
# 50%     2  5.0
# 75%     4  6.5
# 100%    7  8.0
# > 
# > all(dim(ma) == dim(apply(ma, 1:2, sum)))## wasn't ok before R 0.63.1
# [1] TRUE
