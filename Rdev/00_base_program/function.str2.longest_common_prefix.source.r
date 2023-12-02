# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/array_list/function.list_df2array.source.r

# Function to find the longest common prefix of two strings
# https://github.com/mkim0710/tidystat/new/master/Rdev/00_base_program/function.str2.longest_common_prefix.source.r
function.str2.longest_common_prefix <- function(str1, str2) {
  chars1 <- strsplit(str1, "")[[1]]
  chars2 <- strsplit(str2, "")[[1]]
  min_length <- min(length(chars1), length(chars2))
  chars1 <- chars1[1:min_length]
  chars2 <- chars2[1:min_length]
  prefix_length <- which(map2_int(chars1, chars2, ~ ifelse(.x == .y, 1, 0)) == 0)[1] - 1
  # print(prefix_length)
  if (prefix_length == 0) {
    return(NA)
  } else {
    return(substring(str1, 1, prefix_length))
  }
}

function.str2.longest_common_prefix("TestString1", "TestString2")
function.str2.longest_common_prefix("A01_XYZ", "A01_ABZ")
function.str2.longest_common_prefix("Mismatch", "Example")
# > function.str2.longest_common_prefix("TestString1", "TestString2")
# [1] "TestString"
# > function.str2.longest_common_prefix("A01_XYZ", "A01_ABZ")
# [1] "A01_"
# > function.str2.longest_common_prefix("Mismatch", "Example")
# [1] NA
