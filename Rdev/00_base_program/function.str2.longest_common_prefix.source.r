# Function to find the longest common prefix of two strings
# https://github.com/mkim0710/tidystat/new/master/Rdev/00_base_program/function.str2.longest_common_prefix.source.r
function.str2.longest_common_prefix <- function(str1, str2) {
  chars1 <- strsplit(str1, "")[[1]]
  chars2 <- strsplit(str2, "")[[1]]
  min_length <- min(length(chars1), length(chars2))
  chars1 <- chars1[1:min_length]
  chars2 <- chars2[1:min_length]
  prefix_length <- sum(map2_int(chars1, chars2, ~ ifelse(.x == .y, 1, 0)))
  substring(str1, 1, prefix_length)
}
