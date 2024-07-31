# https://github.com/mkim0710/tidystat/edit/master/Rdev/10_import_clean_datatype/array_list/help.array.r

structure(1:12, dim = c(3L, 4L), dimnames = list(paste0("X",1:3), paste0("Y",1:4)))
structure(1:12, dim = c(3L, 4L), dimnames = list(paste0("X",1:3), paste0("Y",1:4))) %>% apply(MARGIN = 1, paste, collapse = ",")
structure(1:12, dim = c(3L, 4L), dimnames = list(paste0("X",1:3), paste0("Y",1:4))) %>% apply(MARGIN = 2, paste, collapse = ",")
# > structure(1:12, dim = c(3L, 4L), dimnames = list(paste0("X",1:3), paste0("Y",1:4)))
#    Y1 Y2 Y3 Y4
# X1  1  4  7 10
# X2  2  5  8 11
# X3  3  6  9 12
# > structure(1:12, dim = c(3L, 4L), dimnames = list(paste0("X",1:3), paste0("Y",1:4))) %>% apply(MARGIN = 1, paste, collapse = ",")
#         X1         X2         X3 
# "1,4,7,10" "2,5,8,11" "3,6,9,12" 
# > structure(1:12, dim = c(3L, 4L), dimnames = list(paste0("X",1:3), paste0("Y",1:4))) %>% apply(MARGIN = 2, paste, collapse = ",")
#         Y1         Y2         Y3         Y4 
#    "1,2,3"    "4,5,6"    "7,8,9" "10,11,12" 

structure(1:24, dim = c(3L, 4L, 2L), dimnames = list(paste0("X",1:3), paste0("Y",1:4), paste0("Z",1:2)))
structure(1:24, dim = c(3L, 4L, 2L), dimnames = list(paste0("X",1:3), paste0("Y",1:4), paste0("Z",1:2)))%>% apply(MARGIN = 1, paste, collapse = ",")
structure(1:24, dim = c(3L, 4L, 2L), dimnames = list(paste0("X",1:3), paste0("Y",1:4), paste0("Z",1:2)))%>% apply(MARGIN = 2, paste, collapse = ",")
structure(1:24, dim = c(3L, 4L, 2L), dimnames = list(paste0("X",1:3), paste0("Y",1:4), paste0("Z",1:2)))%>% apply(MARGIN = 3, paste, collapse = ",")
structure(1:24, dim = c(3L, 4L, 2L), dimnames = list(paste0("X",1:3), paste0("Y",1:4), paste0("Z",1:2)))%>% apply(MARGIN = 1:2, paste, collapse = ",")
structure(1:24, dim = c(3L, 4L, 2L), dimnames = list(paste0("X",1:3), paste0("Y",1:4), paste0("Z",1:2)))%>% apply(MARGIN = 2:3, paste, collapse = ",")
structure(1:24, dim = c(3L, 4L, 2L), dimnames = list(paste0("X",1:3), paste0("Y",1:4), paste0("Z",1:2)))%>% apply(MARGIN = c(3, 1), paste, collapse = ",")
structure(1:24, dim = c(3L, 4L, 2L), dimnames = list(paste0("X",1:3), paste0("Y",1:4), paste0("Z",1:2)))%>% apply(MARGIN = c(1, 3), paste, collapse = ",")
# > structure(1:24, dim = c(3L, 4L, 2L), dimnames = list(paste0("X",1:3), paste0("Y",1:4), paste0("Z",1:2)))
# , , Z1
# 
#    Y1 Y2 Y3 Y4
# X1  1  4  7 10
# X2  2  5  8 11
# X3  3  6  9 12
# 
# , , Z2
# 
#    Y1 Y2 Y3 Y4
# X1 13 16 19 22
# X2 14 17 20 23
# X3 15 18 21 24
# 
# > structure(1:24, dim = c(3L, 4L, 2L), dimnames = list(paste0("X",1:3), paste0("Y",1:4), paste0("Z",1:2)))%>% apply(MARGIN = 1, paste, collapse = ",")
#                     X1                     X2                     X3 
# "1,4,7,10,13,16,19,22" "2,5,8,11,14,17,20,23" "3,6,9,12,15,18,21,24" 
# > structure(1:24, dim = c(3L, 4L, 2L), dimnames = list(paste0("X",1:3), paste0("Y",1:4), paste0("Z",1:2)))%>% apply(MARGIN = 2, paste, collapse = ",")
#                  Y1                  Y2                  Y3                  Y4 
#    "1,2,3,13,14,15"    "4,5,6,16,17,18"    "7,8,9,19,20,21" "10,11,12,22,23,24" 
# > structure(1:24, dim = c(3L, 4L, 2L), dimnames = list(paste0("X",1:3), paste0("Y",1:4), paste0("Z",1:2)))%>% apply(MARGIN = 3, paste, collapse = ",")
#                                    Z1                                    Z2 
#          "1,2,3,4,5,6,7,8,9,10,11,12" "13,14,15,16,17,18,19,20,21,22,23,24" 
# > structure(1:24, dim = c(3L, 4L, 2L), dimnames = list(paste0("X",1:3), paste0("Y",1:4), paste0("Z",1:2)))%>% apply(MARGIN = 1:2, paste, collapse = ",")
#    Y1     Y2     Y3     Y4     
# X1 "1,13" "4,16" "7,19" "10,22"
# X2 "2,14" "5,17" "8,20" "11,23"
# X3 "3,15" "6,18" "9,21" "12,24"
# > structure(1:24, dim = c(3L, 4L, 2L), dimnames = list(paste0("X",1:3), paste0("Y",1:4), paste0("Z",1:2)))%>% apply(MARGIN = 2:3, paste, collapse = ",")
#    Z1         Z2        
# Y1 "1,2,3"    "13,14,15"
# Y2 "4,5,6"    "16,17,18"
# Y3 "7,8,9"    "19,20,21"
# Y4 "10,11,12" "22,23,24"
# > structure(1:24, dim = c(3L, 4L, 2L), dimnames = list(paste0("X",1:3), paste0("Y",1:4), paste0("Z",1:2)))%>% apply(MARGIN = c(3, 1), paste, collapse = ",")
#    X1            X2            X3           
# Z1 "1,4,7,10"    "2,5,8,11"    "3,6,9,12"   
# Z2 "13,16,19,22" "14,17,20,23" "15,18,21,24"
# > structure(1:24, dim = c(3L, 4L, 2L), dimnames = list(paste0("X",1:3), paste0("Y",1:4), paste0("Z",1:2)))%>% apply(MARGIN = c(1, 3), paste, collapse = ",")
#    Z1         Z2           
# X1 "1,4,7,10" "13,16,19,22"
# X2 "2,5,8,11" "14,17,20,23"
# X3 "3,6,9,12" "15,18,21,24"

















# -------------------  
structure(1:12, dim = c(3L, 4L))
structure(1:12, dim = c(3L, 4L)) %>% apply(MARGIN = 1, paste, collapse = ",")
structure(1:12, dim = c(3L, 4L)) %>% apply(MARGIN = 2, paste, collapse = ",")
# > structure(1:12, dim = c(3L, 4L))
#      [,1] [,2] [,3] [,4]
# [1,]    1    4    7   10
# [2,]    2    5    8   11
# [3,]    3    6    9   12
# > structure(1:12, dim = c(3L, 4L)) %>% apply(MARGIN = 1, paste, collapse = ",")
# [1] "1,4,7,10" "2,5,8,11" "3,6,9,12"
# > structure(1:12, dim = c(3L, 4L)) %>% apply(MARGIN = 2, paste, collapse = ",")
# [1] "1,2,3"    "4,5,6"    "7,8,9"    "10,11,12"

structure(1:24, dim = c(3L, 4L, 2L))
structure(1:24, dim = c(3L, 4L, 2L)) %>% apply(MARGIN = 1, paste, collapse = ",")
structure(1:24, dim = c(3L, 4L, 2L)) %>% apply(MARGIN = 2, paste, collapse = ",")
structure(1:24, dim = c(3L, 4L, 2L)) %>% apply(MARGIN = 3, paste, collapse = ",")
structure(1:24, dim = c(3L, 4L, 2L)) %>% apply(MARGIN = 1:2, paste, collapse = ",")
structure(1:24, dim = c(3L, 4L, 2L)) %>% apply(MARGIN = 2:3, paste, collapse = ",")
structure(1:24, dim = c(3L, 4L, 2L)) %>% apply(MARGIN = c(3, 1), paste, collapse = ",")
structure(1:24, dim = c(3L, 4L, 2L)) %>% apply(MARGIN = c(1, 3), paste, collapse = ",")
# > structure(1:24, dim = c(3L, 4L, 2L))
# , , 1
# 
#      [,1] [,2] [,3] [,4]
# [1,]    1    4    7   10
# [2,]    2    5    8   11
# [3,]    3    6    9   12
# 
# , , 2
# 
#      [,1] [,2] [,3] [,4]
# [1,]   13   16   19   22
# [2,]   14   17   20   23
# [3,]   15   18   21   24
# 
# > structure(1:24, dim = c(3L, 4L, 2L)) %>% apply(MARGIN = 1, paste, collapse = ",")
# [1] "1,4,7,10,13,16,19,22" "2,5,8,11,14,17,20,23" "3,6,9,12,15,18,21,24"
# > structure(1:24, dim = c(3L, 4L, 2L)) %>% apply(MARGIN = 2, paste, collapse = ",")
# [1] "1,2,3,13,14,15"    "4,5,6,16,17,18"    "7,8,9,19,20,21"    "10,11,12,22,23,24"
# > structure(1:24, dim = c(3L, 4L, 2L)) %>% apply(MARGIN = 3, paste, collapse = ",")
# [1] "1,2,3,4,5,6,7,8,9,10,11,12"          "13,14,15,16,17,18,19,20,21,22,23,24"
# > structure(1:24, dim = c(3L, 4L, 2L)) %>% apply(MARGIN = 1:2, paste, collapse = ",")
#      [,1]   [,2]   [,3]   [,4]   
# [1,] "1,13" "4,16" "7,19" "10,22"
# [2,] "2,14" "5,17" "8,20" "11,23"
# [3,] "3,15" "6,18" "9,21" "12,24"
# > structure(1:24, dim = c(3L, 4L, 2L)) %>% apply(MARGIN = 2:3, paste, collapse = ",")
#      [,1]       [,2]      
# [1,] "1,2,3"    "13,14,15"
# [2,] "4,5,6"    "16,17,18"
# [3,] "7,8,9"    "19,20,21"
# [4,] "10,11,12" "22,23,24"
# > structure(1:24, dim = c(3L, 4L, 2L)) %>% apply(MARGIN = c(3, 1), paste, collapse = ",")
#      [,1]          [,2]          [,3]         
# [1,] "1,4,7,10"    "2,5,8,11"    "3,6,9,12"   
# [2,] "13,16,19,22" "14,17,20,23" "15,18,21,24"
# > structure(1:24, dim = c(3L, 4L, 2L)) %>% apply(MARGIN = c(1, 3), paste, collapse = ",")
#      [,1]       [,2]         
# [1,] "1,4,7,10" "13,16,19,22"
# [2,] "2,5,8,11" "14,17,20,23"
# [3,] "3,6,9,12" "15,18,21,24"





#-----------------  
## Compute row and column sums for a matrix:
x <- cbind(x1 = 3, x2 = c(4:1, 2:5))
x
dimnames(x)[[1]] <- letters[1:8]
apply(x, 2, mean)
col.sums <- apply(x, 2, sum)
row.sums <- apply(x, 1, sum)
rbind(cbind(x, Rtot = row.sums), Ctot = c(col.sums, sum(col.sums)))

all( apply(x,2, is.vector)) # TRUE [was not in R <= 0.63.2]

## Sort the columns of a matrix
apply(x, 2, sort)

##- function with extra args:
cave <- function(x, c1,c2) c(mean(x[c1]),mean(x[c2]))
apply(x,1, cave,  c1="x1", c2=c("x1","x2"))

ma <- matrix(c(1:4, 1, 6:8), nr = 2)
ma
apply(ma, 1, table)  #--> a list of length 2
apply(ma, 1, quantile)# 5 x n matrix with rownames

all(dim(ma) == dim(apply(ma, 1:2, sum)))## wasn't ok before R 0.63.1
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
