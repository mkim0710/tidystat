function.pairwise.data_frame = function(vars) {
  # source("https://github.com/mkim0710/tidystat/raw/master/function.pairwise.data_frame.source.r")
  vars.outer = outer(vars, vars, function(x, y) paste(x, y, sep = "&"))
  tmp = data_frame(vars = vars.outer[lower.tri(vars.outer)])
  out = tmp %>% separate(col = "vars", into = c("var_j", "var_i"), sep = "&")
  out = out[c("var_i", "var_j")]
  out
}

# > function.pairwise.data_frame(LETTERS)
# # A tibble: 325 x 2
#    var_i var_j
#    <chr> <chr>
#  1     A     B
#  2     A     C
#  3     A     D
#  4     A     E
#  5     A     F
#  6     A     G
#  7     A     H
#  8     A     I
#  9     A     J
# 10     A     K
# # ... with 315 more rows
