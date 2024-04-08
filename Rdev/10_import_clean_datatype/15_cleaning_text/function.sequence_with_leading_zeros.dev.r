function.sequence_with_leading_zeros = function(num) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.sequence_with_leading_zeros.dev.r")
    digits_with_leading_zeros = trunc(log10(num)) + 1
    sprintf(paste0("%0",digits_with_leading_zeros,"d"), 1:num)
}

# > function.sequence_with_leading_zeros(9.9)
# [1] "1" "2" "3" "4" "5" "6" "7" "8" "9"
# > function.sequence_with_leading_zeros(10)
#  [1] "01" "02" "03" "04" "05" "06" "07" "08" "09" "10"









function.integer2factor_with_leading_zeros = function(vec_int) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.sequence_with_leading_zeros.dev.r")
    if(min(vec_int) < 1) {
        out = NA
        attributes(out)$ErrorMessage = "min(vec_int) < 1"
        warning("min(vec_int) < 1")
    } else {
        digits_with_leading_zeros = trunc(log10(max(vec_int))) + 1
        levels.new = sprintf(paste0("%0",digits_with_leading_zeros,"d"), 1:max(vec_int))
        vec.new = sprintf(paste0("%0",digits_with_leading_zeros,"d"), vec_int)
        out = factor(vec_int, levels = levels.new)
    }
    out
}
tmp.vec1 = c(1, 3, 6, 9)
tmp.vec2 = c(1:3, 10)
tmp.vec3 = c(1, 3, 6, 9, -1)

tmp.vec1 %>% function.integer2factor_with_leading_zeros
tmp.vec2 %>% function.integer2factor_with_leading_zeros
tmp.vec3 %>% function.integer2factor_with_leading_zeros
# > tmp.vec1 %>% function.integer2factor_with_leading_zeros
# [1] 1 3 6 9
# Levels: 1 2 3 4 5 6 7 8 9
# > tmp.vec2 %>% function.integer2factor_with_leading_zeros
# [1] <NA> <NA> <NA> 10  
# Levels: 01 02 03 04 05 06 07 08 09 10
# > tmp.vec3 %>% function.integer2factor_with_leading_zeros
# [1] NA
# attr(,"ErrorMessage")
# [1] "min(vec_int) < 1"
# Warning message:
# In function.integer2factor_with_leading_zeros(.) : min(vec_int) < 1



function.integer2factor_with_leading_zeros.v2 = function(vec_int) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.sequence_with_leading_zeros.dev.r")
    if(min(vec_int) < 1) {
        out = NA
        attributes(out)$ErrorMessage = "min(vec_int) < 1"
        warning("min(vec_int) < 1")
    } else {
        digits_with_leading_zeros = trunc(log10(max(vec_int))) + 1
        # levels.new = sprintf(paste0("%0",digits_with_leading_zeros,"d"), 1:max(vec_int))
        # vec.new = sprintf(paste0("%0",digits_with_leading_zeros,"d"), vec_int)
        out = factor(vec_int, levels = 1:max(vec_int))
        out = factor(vec_int, levels = 1:max(vec_int), labels = sprintf(paste0("%0",digits_with_leading_zeros,"d"), 1:max(vec_int)))
    }
    out
}
tmp.vec1 %>% function.integer2factor_with_leading_zeros.v2
tmp.vec2 %>% function.integer2factor_with_leading_zeros.v2
tmp.vec3 %>% function.integer2factor_with_leading_zeros.v2
# > tmp.vec1 %>% function.integer2factor_with_leading_zeros.v2
# [1] 1 3 6 9
# Levels: 1 2 3 4 5 6 7 8 9
# > tmp.vec2 %>% function.integer2factor_with_leading_zeros.v2
# [1] 01 02 03 10
# Levels: 01 02 03 04 05 06 07 08 09 10
# > tmp.vec3 %>% function.integer2factor_with_leading_zeros.v2
# [1] NA
# attr(,"ErrorMessage")
# [1] "min(vec_int) < 1"
# Warning message:
# In function.integer2factor_with_leading_zeros.v2(.) : min(vec_int) < 1

library(microbenchmark)
set.seed(1)
mbm = microbenchmark(
    v1 = sample(-99:999, 10) %>% function.integer2factor_with_leading_zeros
    , v2 = sample(-99:999, 10) %>% function.integer2factor_with_leading_zeros.v2
)
autoplot(mbm)
mbm
# > mbm
# Unit: microseconds
#  expr   min    lq    mean median      uq    max neval cld
#    v1 162.7 190.5 660.099 319.20 1118.85 2666.4   100   a
#    v2 158.4 187.3 681.685 321.25 1203.85 2821.4   100   a



set.seed(1)
mbm = microbenchmark(
    v1 = sample(1:199, 10) %>% function.integer2factor_with_leading_zeros
    , v2 = sample(1:199, 10) %>% function.integer2factor_with_leading_zeros.v2
)
autoplot(mbm)
mbm
# > mbm
# Unit: microseconds
#  expr   min     lq    mean median     uq   max neval cld
#    v1 220.8 243.95 332.699  285.1 441.85 511.8   100   a
#    v2 217.7 247.25 321.078  266.1 434.85 490.7   100   a



set.seed(1)
mbm = microbenchmark(
    v1 = sample(1:15, 3) %>% function.integer2factor_with_leading_zeros
    , v2 = sample(1:15, 3) %>% function.integer2factor_with_leading_zeros.v2
)
autoplot(mbm)
mbm
# > mbm
# Unit: microseconds
#  expr   min     lq    mean median     uq   max neval cld
#    v1 170.5 194.75 205.496  202.1 208.35 347.2   100   a
#    v2 149.7 196.10 212.288  201.6 212.90 555.7   100   a

