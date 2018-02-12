

# cf) https://github.com/mkim0710/tidystat/blob/master/R/function.pairwise.data_frame.source.r
# cf) https://github.com/mkim0710/tidystat/blob/master/R/list_list.to.data_frame.source.r


#@ outer(i, j, function(i, j) {}) ============
library(tidyverse)
outer(c("A","B"), 1:3, paste0)
outer(c("A","B"), 1:3, paste0) %>% as.vector
# > outer(c("A","B"), 1:3, paste0)
#      [,1] [,2] [,3]
# [1,] "A1" "A2" "A3"
# [2,] "B1" "B2" "B3"
# > outer(c("A","B"), 1:3, paste0) %>% as.vector
# [1] "A1" "B1" "A2" "B2" "A3" "B3"

outer(1:2, 1:3, function(i, j) {paste0("R", i, "C", j)})
outer(1:2, 1:3, function(i, j) {paste0("R", i, "C", j)}) %>% as.vector
# > outer(1:2, 1:3, function(i, j) {
# +     paste0("R", i, "C", j)
# + })
#      [,1]   [,2]   [,3]
# [1,] "R1C1" "R1C2" "R1C3"
# [2,] "R2C1" "R2C2" "R2C3"
# > outer(1:2, 1:3, function(i, j) {paste0("R", i, "C", j)}) %>% as.vector
# [1] "R1C1" "R2C1" "R1C2" "R2C2" "R1C3" "R2C3"


# outer(letters[1:3], letters[1:3], paste)
# outer(letters[1:3], letters[1:3], paste) %>% as.vector
# outer(letters[1:3], letters[1:3], paste) %>% as.vector %>% as.tibble
# outer(letters[1:3], letters[1:3], paste) %>% as.vector %>% as.tibble %>% separate(value, into = c("var_i", "var_j"))
# outer(letters[1:3], letters[1:3], paste) %>% as.vector %>% as.tibble %>% separate(value, into = c("var_i", "var_j"), sep = " ")
# # > outer(letters[1:3], letters[1:3], paste)
# #      [,1]  [,2]  [,3] 
# # [1,] "a a" "a b" "a c"
# # [2,] "b a" "b b" "b c"
# # [3,] "c a" "c b" "c c"
# # > outer(letters[1:3], letters[1:3], paste) %>% as.vector
# # [1] "a a" "b a" "c a" "a b" "b b" "c b" "a c" "b c" "c c"
# # > outer(letters[1:3], letters[1:3], paste) %>% as.vector %>% as.tibble
# # # A tibble: 9 x 1
# #   value
# #   <chr>
# # 1   a a
# # 2   b a
# # 3   c a
# # 4   a b
# # 5   b b
# # 6   c b
# # 7   a c
# # 8   b c
# # 9   c c
# # > outer(letters[1:3], letters[1:3], paste) %>% as.vector %>% as.tibble %>% separate(value, into = c("var_i", "var_j"))
# # # A tibble: 9 x 2
# #   var_i var_j
# # * <chr> <chr>
# # 1     a     a
# # 2     b     a
# # 3     c     a
# # 4     a     b
# # 5     b     b
# # 6     c     b
# # 7     a     c
# # 8     b     c
# # 9     c     c


outer(letters[1:3], letters[1:3], paste, sep = "|")
outer(letters[1:3], letters[1:3], paste, sep = "|") %>% as.vector
outer(letters[1:3], letters[1:3], paste, sep = "|") %>% as.vector %>% as.tibble
outer(letters[1:3], letters[1:3], paste, sep = "|") %>% as.vector %>% as.tibble %>% separate(value, into = c("var_i", "var_j"), sep = "\\|")
# > outer(letters[1:3], letters[1:3], paste, sep = "|")
#      [,1]  [,2]  [,3] 
# [1,] "a|a" "a|b" "a|c"
# [2,] "b|a" "b|b" "b|c"
# [3,] "c|a" "c|b" "c|c"
# > outer(letters[1:3], letters[1:3], paste, sep = "|") %>% as.vector
# [1] "a|a" "b|a" "c|a" "a|b" "b|b" "c|b" "a|c" "b|c" "c|c"
# > outer(letters[1:3], letters[1:3], paste, sep = "|") %>% as.vector %>% as.tibble
# # A tibble: 9 x 1
#   value
#   <chr>
# 1   a|a
# 2   b|a
# 3   c|a
# 4   a|b
# 5   b|b
# 6   c|b
# 7   a|c
# 8   b|c
# 9   c|c
# > outer(letters[1:3], letters[1:3], paste, sep = "|") %>% as.vector %>% as.tibble %>% separate(value, into = c("var_i", "var_j"), sep = "\\|")
# # A tibble: 9 x 2
#   var_i var_j
# * <chr> <chr>
# 1     a     a
# 2     b     a
# 3     c     a
# 4     a     b
# 5     b     b
# 6     c     b
# 7     a     c
# 8     b     c
# 9     c     c



function.pairwise.data_frame = function(vars) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.pairwise.data_frame.source.r")
    # library(tidyverse)
    vars.outer = outer(vars, vars, function(x, y) paste(x, y, sep = "&"))
    tmp = data_frame(vars = vars.outer[lower.tri(vars.outer)])
    out = tmp %>% separate(col = "vars", into = c("var_j", "var_i"), sep = "&")
    out = out[c("var_i", "var_j")]
    out
}

# > function.pairwise.data_frame(letters)
# # A tibble: 325 x 2
#    var_i var_j
#    <chr> <chr>
#  1     a     b
#  2     a     c
#  3     a     d
#  4     a     e
#  5     a     f
#  6     a     g
#  7     a     h
#  8     a     i
#  9     a     j
# 10     a     k
# # ... with 315 more rows



#@ end -----
