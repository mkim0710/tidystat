# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/array_list/function.list_df2array.source.r

# Function to find the longest common prefix of two strings
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.str2.longest_common_prefix.source.r
function.str2.longest_common_prefix <- function(str1, str2, print.intermediate = F) {
  chars1 <- strsplit(str1, "")[[1]]
  chars2 <- strsplit(str2, "")[[1]]
  if(print.intermediate) {print(chars1) ; print(chars2)}
  min_length <- min(length(chars1), length(chars2))
  chars1 <- chars1[1:min_length]
  chars2 <- chars2[1:min_length]
  if (identical(chars1, chars2)) {
    return(chars1)
  } else {
    prefix_length <- which(map2_int(chars1, chars2, ~ ifelse(.x == .y, 1, 0)) == 0)[1] - 1
    # print(prefix_length)
      if (prefix_length == 0) {
          return(NA)
      } else {
        return(substring(str1, 1, prefix_length))
      }
  }
}

function.str2.longest_common_prefix("TestString", "TestString2", print.intermediate = T)
function.str2.longest_common_prefix("A01_XYZ", "A01_ABZ", print.intermediate = T)
function.str2.longest_common_prefix("Mismatch", "Example", print.intermediate = T)
# > function.str2.longest_common_prefix("TestString", "TestString2", print.intermediate = T)
#  [1] "T" "e" "s" "t" "S" "t" "r" "i" "n" "g"
#  [1] "T" "e" "s" "t" "S" "t" "r" "i" "n" "g" "2"
# [1] "TestString"
# > function.str2.longest_common_prefix("A01_XYZ", "A01_ABZ", print.intermediate = T)
# [1] "A" "0" "1" "_" "X" "Y" "Z"
# [1] "A" "0" "1" "_" "A" "B" "Z"
# [1] "A01_"
# > function.str2.longest_common_prefix("Mismatch", "Example", print.intermediate = T)
# [1] "M" "i" "s" "m" "a" "t" "c" "h"
# [1] "E" "x" "a" "m" "p" "l" "e"
# [1] NA
