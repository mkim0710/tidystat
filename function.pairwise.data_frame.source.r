function.pairwise.data_frame = function(vars) {
  # source("https://github.com/mkim0710/tidystat/raw/master/function.pairwise.data_frame.source.r")
  library(tidyverse)
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
