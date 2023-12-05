
library(tidyverse)

# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/17_categorical_indicators/function.one_hot_encode.source.r
function.one_hot_encode <- function(df_data, sep4levelname = "_") {
  df_factor <- df_data %>% select_if(is.factor)
  
  # Rename the columns to add separator before the level name
  colnames(df_factor) <- paste0(colnames(df_factor), sep4levelname)

  # Apply one-hot encoding to categorical variables
  df_encoded <- model.matrix(~ . + 0, data = df_factor)

  # Combine one-hot encoded data with the original non-categorical data
  df_final <- bind_cols(df_data %>% select_if(function(vec) !is.factor(vec)), as_tibble(df_encoded))

  return(df_final)
}
# > df_example <- tibble(
# +   id = 1:4,
# +   color = as.factor(c("red", "blue", "green", "red")),
# +   size = as.factor(c("small", "large", "medium", "small"))
# + )
# > 
# > df_encoded_example <- function.one_hot_encode(df_example)
# > df_encoded_example
# # A tibble: 4 × 6
#      id colorblue colorgreen colorred sizemedium sizesmall
#   <int>     <dbl>      <dbl>    <dbl>      <dbl>     <dbl>
# 1     1         0          0        1          0         1
# 2     2         1          0        0          0         0
# 3     3         0          1        0          1         0
# 4     4         0          0        1          0         1




