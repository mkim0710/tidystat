
# https://stackoverflow.com/questions/17606906/find-row-and-column-index-of-maximum-value-in-a-matrix

mat = matrix(1:12, nrow = 3, ncol = 4)
mat
# > mat = matrix(1:12, nrow = 3, ncol = 4)
# > mat
#      [,1] [,2] [,3] [,4]
# [1,]    1    4    7   10
# [2,]    2    5    8   11
# [3,]    3    6    9   12




mat = matrix(1:5, nrow = 3, ncol = 4)
mat
# > mat = matrix(1:5, nrow = 3, ncol = 4)
# Warning message:
# In matrix(1:5, nrow = 3, ncol = 4) :
#   data length [5] is not a sub-multiple or multiple of the number of rows [3]
# > mat
#      [,1] [,2] [,3] [,4]
# [1,]    1    4    2    5
# [2,]    2    5    3    1
# [3,]    3    1    4    2



# > mat %>% {cbind(which.min(.) %% nrow(.), which.min(.) %/% nrow(.) + 1)} #----  
#      [,1] [,2]
# [1,]    1    1
# > mat %>% {cbind(which(. == min(.)) %% nrow(.), which(. == min(.)) %/% nrow(.) + 1)} #----  
#      [,1] [,2]
# [1,]    1    1
# [2,]    0    3
# [3,]    2    4


mat %>% {data.frame(row = (which.min(.)-1) %% nrow(.) + 1, col = which.min(.) %/% nrow(.) + 1)} #----
mat %>% {data.frame(row = (which(. == min(., na.rm = T))-1) %% nrow(.) + 1, col = which(. == min(., na.rm = T)) %/% nrow(.) + 1)} #----
mat %>% {which(. == min(., na.rm = T), arr.ind = TRUE)} #----
# > mat %>% {data.frame(row = (which.min(.)-1) %% nrow(.) + 1, col = which.min(.) %/% nrow(.) + 1)} #----  
#   row col
# 1   1   1
# > mat %>% {data.frame(row = (which(. == min(.))-1) %% nrow(.) + 1, col = which(. == min(.)) %/% nrow(.) + 1)} #----  
#   row col
# 1   1   1
# 2   3   3
# 3   2   4
# > mat %>% {which(. == min(.), arr.ind = TRUE)} #----  
#      row col
# [1,]   1   1
# [2,]   3   2
# [3,]   2   4






mat %>% {data.frame(row = (which.max(.)-1) %% nrow(.) + 1, col = which.max(.) %/% nrow(.) + 1)} #----
mat %>% {data.frame(row = (which(. == max(., na.rm = T))-1) %% nrow(.) + 1, col = which(. == max(., na.rm = T)) %/% nrow(.) + 1)} #----
mat %>% {which(. == max(., na.rm = T), arr.ind = TRUE)} #----
# > mat %>% {data.frame(row = (which.max(.)-1) %% nrow(.) + 1, col = which.max(.) %/% nrow(.) + 1)} #----  
#   row col
# 1   2   2
# > mat %>% {data.frame(row = (which(. == max(.))-1) %% nrow(.) + 1, col = which(. == max(.)) %/% nrow(.) + 1)} #----  
#   row col
# 1   2   2
# 2   1   4
# > mat %>% {which(. == max(.), arr.ind = TRUE)} #----  
#      row col
# [1,]   2   2
# [2,]   1   4




  
  
# __________|------  
# 〚〛 END----  
