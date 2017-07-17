function.sequence_with_leading_zeros = function(num) {
  # source("https://github.com/mkim0710/tidystat/raw/master/function.sequence_with_leading_zeros.source.r")
  digits_with_leading_zeros = trunc(log10(num)) + 1
  sprintf(paste0("%0",digits_with_leading_zeros,"d"), 1:num)
}

# > function.sequence_with_leading_zeros(9.9)
# [1] "1" "2" "3" "4" "5" "6" "7" "8" "9"
# > function.sequence_with_leading_zeros(10)
#  [1] "01" "02" "03" "04" "05" "06" "07" "08" "09" "10"
