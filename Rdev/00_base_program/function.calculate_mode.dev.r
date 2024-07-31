# function.calculate_mode.dev.r


library(tidyverse)
set.seed(1); sample(1:9, 30, replace = T) |> dput() #----
# > library(tidyverse)
# > set.seed(1); sample(1:9, 30, replace = T) |> dput() #----
c(3L, 4L, 6L, 9L, 2L, 9L, 9L, 6L, 6L, 1L, 2L, 2L, 7L, 4L, 7L,
5L, 7L, 9L, 4L, 7L, 9L, 2L, 6L, 2L, 3L, 4L, 1L, 4L, 8L, 4L)

set.seed(1); sample(1:9, 30, replace = T) |> table()
set.seed(1); sample(1:9, 30, replace = T) |> table() |> dput() #----
set.seed(1); sample(1:9, 30, replace = T) |> table() |> as.matrix() |> dput() #----
set.seed(1); sample(1:9, 30, replace = T) |> table() |> as.data.frame() |> dput() #----
# > set.seed(1); sample(1:9, 30, replace = T) |> table()
# .
# 1 2 3 4 5 6 7 8 9 
# 2 5 2 6 1 4 4 1 5 
# > set.seed(1); sample(1:9, 30, replace = T) |> table() |> dput() #----
# structure(c(`1` = 2L, `2` = 5L, `3` = 2L, `4` = 6L, `5` = 1L, 
# `6` = 4L, `7` = 4L, `8` = 1L, `9` = 5L), .Dim = 9L, .Dimnames = list(
#     . = c("1", "2", "3", "4", "5", "6", "7", "8", "9")), class = "table")
# > set.seed(1); sample(1:9, 30, replace = T) |> table() |> as.matrix() |> dput() #----
# structure(c(2L, 5L, 2L, 6L, 1L, 4L, 4L, 1L, 5L), .Dim = c(9L, 
# 1L), .Dimnames = list(c("1", "2", "3", "4", "5", "6", "7", "8", 
# "9"), NULL))
# > set.seed(1); sample(1:9, 30, replace = T) |> table() |> as.data.frame() |> dput() #----
# structure(list(. = structure(1:9, .Label = c("1", "2", "3", "4", 
# "5", "6", "7", "8", "9"), class = "factor"), Freq = c(2L, 5L, 
# 2L, 6L, 1L, 4L, 4L, 1L, 5L)), class = "data.frame", row.names = c(NA, 
# -9L))


set.seed(1); sample(1:9, 30, replace = T) %>% tabulate
# > set.seed(1); sample(1:9, 30, replace = T) %>% tabulate
# [1] 2 5 2 6 1 4 4 1 5

set.seed(1); sample(1:9, 30, replace = T) |> table()
set.seed(1); sample(1:9, 30, replace = T) |> table() |> as.vector()
set.seed(1); sample(1:9, 30, replace = T) |> table() |> as.matrix()
# > set.seed(1); sample(1:9, 30, replace = T) |> table()
# .
# 1 2 3 4 5 6 7 8 9 
# 2 5 2 6 1 4 4 1 5 
# > set.seed(1); sample(1:9, 30, replace = T) |> table() |> as.vector()
# [1] 2 5 2 6 1 4 4 1 5
# > set.seed(1); sample(1:9, 30, replace = T) |> table() |> as.matrix()
#   [,1]
# 1    2
# 2    5
# 3    2
# 4    6
# 5    1
# 6    4
# 7    4
# 8    1
# 9    5


set.seed(1); sample(1:9, 30, replace = T) |> table() %>% {.[9]}
set.seed(1); sample(1:9, 30, replace = T) |> table() |> as.vector() %>% {.[9]}
set.seed(1); sample(1:9, 30, replace = T) |> table() |> as.matrix() %>% {.[9,]}
# > set.seed(1); sample(1:9, 30, replace = T) |> table() %>% {.[9]}
# 9 
# 5 
# > set.seed(1); sample(1:9, 30, replace = T) |> table() |> as.vector() %>% {.[9]}
# [1] 5
# > set.seed(1); sample(1:9, 30, replace = T) |> table() |> as.matrix() %>% {.[9,]}
# 9 
# 5 




set.seed(1); sample(1:9, 30, replace = T) |> table() |> as.data.frame() |> tribble_paste() #----
tibble::tribble(
                     ~., ~Freq,
                    "1",    2L,
                    "2",    5L,
                    "3",    2L,
                    "4",    6L,
                    "5",    1L,
                    "6",    4L,
                    "7",    4L,
                    "8",    1L,
                    "9",    5L
                    )




set.seed(1); sample(1:9, 30, replace = T) %>% {tibble(ID = ., Freq = 1)}
set.seed(1); sample(1:9, 30, replace = T) %>% {tibble(ID = ., Freq = 1)} %>% group_by(ID) %>% summarise(Freq = sum(Freq, na.rm = T))
set.seed(1); sample(1:9, 30, replace = T) %>% {tibble(ID = ., Freq = 1)} %>% group_by(ID) %>% summarise(Freq = sum(Freq, na.rm = T)) %>% 
    dplyr::filter(Freq == max(Freq))
# > set.seed(1); sample(1:9, 30, replace = T) %>% {tibble(ID = ., Freq = 1)}
# # A tibble: 30 x 2
#       ID  Freq
#    <int> <dbl>
#  1     3     1
#  2     4     1
#  3     6     1
#  4     9     1
#  5     2     1
#  6     9     1
#  7     9     1
#  8     6     1
#  9     6     1
# 10     1     1
# # ... with 20 more rows
# > set.seed(1); sample(1:9, 30, replace = T) %>% {tibble(ID = ., Freq = 1)} %>% group_by(ID) %>% summarise(Freq = sum(Freq, na.rm = T))
# # A tibble: 9 x 2
#      ID  Freq
#   <int> <dbl>
# 1     1     2
# 2     2     5
# 3     3     2
# 4     4     6
# 5     5     1
# 6     6     4
# 7     7     4
# 8     8     1
# 9     9     5
# > set.seed(1); sample(1:9, 30, replace = T) %>% {tibble(ID = ., Freq = 1)} %>% group_by(ID) %>% summarise(Freq = sum(Freq, na.rm = T)) %>% 
# +     dplyr::filter(Freq == max(Freq))
# # A tibble: 1 x 2
#      ID  Freq
#   <int> <dbl>
# 1     4     6


# https://www.tutorialspoint.com/r/r_mean_median_mode.htm
getmode <- function(v) {
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}
set.seed(1); sample(1:9, 30, replace = T) %>% getmode
# > set.seed(1); sample(1:9, 30, replace = T) %>% getmode
# [1] 4

function.calculate_mode = function(vec, out_as_vector = F) {
    library(tidyverse)
    out = vec %>% {tibble(ID = ., Freq = 1)} %>% group_by(ID) %>% summarise(Freq = sum(Freq, na.rm = T)) %>% 
        dplyr::filter(Freq == max(Freq))
    if (out_as_vector) out = out$ID
    out
}
set.seed(1); sample(1:9, 30, replace = T) %>% function.calculate_mode
set.seed(1); sample(1:9, 30, replace = T) %>% function.calculate_mode(out_as_vector = T)
# > set.seed(1); sample(1:9, 30, replace = T) %>% function.calculate_mode
# # A tibble: 1 x 2
#      ID  Freq
#   <int> <dbl>
# 1     4     6
# > set.seed(1); sample(1:9, 30, replace = T) %>% function.calculate_mode(out_as_vector = T)
# [1] 4




#@ end ----
