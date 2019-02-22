# list3d.to.array3d.source.r

list3d.to.array3d = function(list3d) {
    list3d.unlist = list3d %>% unlist 
    dim(list3d.unlist) = dim(list3d)
    dimnames(list3d.unlist) = dimnames(list3d)
    list3d.unlist
}

#@ test: list3d.to.array3d() ------
list3d = as.list(1:(3*4*2))
dim(list3d) = c(3,4,2)
list3d
list3d %>% str
# > list3d
# , , 1
# 
#      [,1] [,2] [,3] [,4]
# [1,] 1    4    7    10  
# [2,] 2    5    8    11  
# [3,] 3    6    9    12  
# 
# , , 2
# 
#      [,1] [,2] [,3] [,4]
# [1,] 13   16   19   22  
# [2,] 14   17   20   23  
# [3,] 15   18   21   24  
# 
# > list3d %>% str
# List of 24
#  $ : int 1
#  $ : int 2
#  $ : int 3
#  $ : int 4
#  $ : int 5
#  $ : int 6
#  $ : int 7
#  $ : int 8
#  $ : int 9
#  $ : int 10
#  $ : int 11
#  $ : int 12
#  $ : int 13
#  $ : int 14
#  $ : int 15
#  $ : int 16
#  $ : int 17
#  $ : int 18
#  $ : int 19
#  $ : int 20
#  $ : int 21
#  $ : int 22
#  $ : int 23
#  $ : int 24
#  - attr(*, "dim")= int [1:3] 3 4 2

list3d.to.array3d(list3d)
# > list3d.to.array3d(list3d)
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

list3d.to.array3d(list3d) %>% str
# > list3d.to.array3d(list3d) %>% str
#  int [1:3, 1:4, 1:2] 1 2 3 4 5 6 7 8 9 10 ...
list3d.to.array3d(list3d) %>% as.vector()
# > list3d.to.array3d(list3d) %>% as.vector()
#  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
