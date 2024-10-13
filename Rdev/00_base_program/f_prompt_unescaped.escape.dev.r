# https://chatgpt.com/c/670b4a25-1400-800e-80ea-d81cedfee1fa


# @ Use scan to read the regex pattern ----
my.regex <- scan(what = character(), n = 1, allowEscapes = FALSE)
my.regex
# When prompted, paste or type your regex pattern
# > my.regex <- scan(what = character(), n = 1, allowEscapes = FALSE)
# 1: my\.regex
# Read 1 item
# > my.regex
# [1] "my\\.regex"

# @ Use readLines to read the regex pattern ----
# my.regex <- readLines(n = 1, warn = FALSE)
my.regex <- readLines(n = 1)
my.regex
# > my.regex <- readLines(n = 1)
# my\.regex
# > my.regex
# [1] "my\\.regex"



my.regex = r"(my\.regex)"
my.regex
# > my.regex = r"(my\.regex)"
# > my.regex
# [1] "my\\.regex"

