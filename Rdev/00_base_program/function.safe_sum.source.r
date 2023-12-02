

# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.safe_sum.source.r
function.safe_sum = function(x, y) {if_else(is.na(x)&is.na(y), NA, if_else(is.na(x),0,x)+if_else(is.na(y),0,y))}
Vectorized.safe_sum = Vectorize(function.safe_sum)

x_vector = c(1, NA, 3, NA)
y_vector = c(NA, 2, NA, NA)
function.safe_sum(x_vector, y_vector)
Vectorized.safe_sum(x_vector, y_vector)
# > function.safe_sum(x_vector, y_vector)
# [1]  1  2  3 NA
# > Vectorized.safe_sum(x_vector, y_vector)
# [1]  1  2  3 NA









#--------------
library(dplyr)
library(purrr)

# https://github.com/mkim0710/tidystat/new/master/Rdev/00_base_program/function.safe_sum.source.R
function.safe_sum0 <- function(x, y) {
  sum_vec <- ifelse(is.na(x), 0, x) + ifelse(is.na(y), 0, y)
  ifelse(is.na(x) & is.na(y), NA, sum_vec)
}


# ============
# https://github.com/mkim0710/tidystat/new/master/Rdev/00_base_program/function.safe_sum.source.R
function.safe_sum = function(x, y) {if_else(is.na(x)&is.na(y), NA, if_else(is.na(x),0,x)+if_else(is.na(y),0,y))}
    
    
# Example Data
df1 <- tibble(A01 = c(1, NA, 3), A02 = c(4, NA, NA))
df2 <- tibble(A01 = c(NA, 2, 3), A02 = c(4, 5, NA))
df3 <- tibble(A01 = c(1, 2, NA), A02 = c(NA, 5, NA))
df1 + df2
sum(df1, df2)
map2_df(df1, df2, function.safe_sum)
# > df1 + df2
#   A01 A02
# 1  NA   8
# 2  NA  NA
# 3   6  NA
# > sum(df1, df2)
# [1] NA
# > map2_df(df1, df2, function.safe_sum)
# # A tibble: 3 × 2
#     A01   A02
#   <dbl> <dbl>
# 1     1     8
# 2     2     5
# 3     6    NA



example_list <- list(df1, df2, df3)
reduce(example_list, ~ map2_df(.x, .y, function.safe_sum))
# > reduce(example_list, ~ map2_df(.x, .y, function.safe_sum))
# # A tibble: 3 × 2
#     A01   A02
#   <dbl> <dbl>
# 1     2     8
# 2     4    10
# 3     6    NA
