# function.check.integer.microbenchmark.r

check.integer.tolerance1 = function(x, tolerance = .Machine$double.eps^0.5)  abs(x - round(x)) < tolerance
check.integer.tolerance1(1) # is TRUE
check.integer.tolerance1(9.0)
check.integer.tolerance1(8.9)
check.integer.tolerance1(0)
check.integer.tolerance1(c(9.0, 10), tolerance = .Machine$double.eps^0.5)
# > check.integer.tolerance1(1) # is TRUE
# [1] TRUE
# > check.integer.tolerance1(9.0)
# [1] TRUE
# > check.integer.tolerance1(8.9)
# [1] FALSE
# > check.integer.tolerance1(0)
# [1] TRUE
# > check.integer.tolerance1(c(9.0, 10), tolerance = .Machine$double.eps^0.5)
# [1] TRUE TRUE


check.integer1 = function(x) {x == round(x)}
check.integer1(9.0)
check.integer1(8.9)
check.integer1(0)
check.integer1(c(9.0, 10))
# > check.integer(9.0)
# [1] TRUE
# > check.integer(8.9)
# [1] FALSE
# > check.integer(0)
# [1] TRUE
# > check.integer(c(9.0, 10))
# [1] TRUE TRUE

check.integer2 = function(x) {x%%1==0}
check.integer2(9.0)
check.integer2(8.9)
check.integer2(0)
check.integer2(c(9.0, 10))
# > check.integer(9.0)
# [1] TRUE
# > check.integer(8.9)
# [1] FALSE
# > check.integer(0)
# [1] TRUE
# > check.integer(c(9.0, 10))
# [1] TRUE TRUE

check.integer.tolerance2 = function(x, tolerance = .Machine$double.eps^0.5) {min(abs(c(x%%1, x%%1-1))) < tolerance}
check.integer.tolerance2(9.0)
check.integer.tolerance2(8.9)
check.integer.tolerance2(0)
check.integer.tolerance2(c(9.0, 10), tolerance = .Machine$double.eps^0.5)
# > check.integer.tolerance2 = function(x, tolerance = .Machine$double.eps^0.5) {min(abs(c(x%%1, x%%1-1))) < tolerance}
# > check.integer.tolerance2(9.0)
# [1] TRUE
# > check.integer.tolerance2(8.9)
# [1] FALSE
# > check.integer.tolerance2(0)
# [1] TRUE
# > check.integer.tolerance2(c(9.0, 10), tolerance = .Machine$double.eps^0.5)
# [1] TRUE


check.integer.tolerance2 = function(x, tolerance = .Machine$double.eps^0.5) {pmin(abs(c(x%%1, x%%1-1))) < tolerance}
check.integer.tolerance2(9.0)
check.integer.tolerance2(8.9)
check.integer.tolerance2(0)
check.integer.tolerance2(c(9.0, 10), tolerance = .Machine$double.eps^0.5)
# > check.integer.tolerance2(9.0)
# [1]  TRUE FALSE
# > check.integer.tolerance2(8.9)
# [1] FALSE FALSE
# > check.integer.tolerance2(0)
# [1]  TRUE FALSE
# > check.integer.tolerance2(c(9.0, 10), tolerance = .Machine$double.eps^0.5)
# [1]  TRUE  TRUE FALSE FALSE


system.time(replicate(10^5, check.integer1(8.9)))
system.time(replicate(10^5, check.integer2(8.9)))
system.time(replicate(10^5, check.integer.tolerance1(8.9)))
system.time(replicate(10^5, check.integer.tolerance2(8.9)))
# > system.time(replicate(10^5, check.integer1(8.9)))
#    user  system elapsed 
#    0.11    0.00    0.11 
# > system.time(replicate(10^5, check.integer2(8.9)))
#    user  system elapsed 
#    0.11    0.00    0.11 
# > system.time(replicate(10^5, check.integer.tolerance1(8.9)))
#    user  system elapsed 
#    0.19    0.00    0.18 
# > system.time(replicate(10^5, check.integer.tolerance2(8.9)))
#    user  system elapsed 
#    0.78    0.01    0.79 

library(tidyverse)
library(microbenchmark)
mbm = microbenchmark(
    check.integer1 = check.integer1(8.9)
    , check.integer2 = check.integer2(8.9)
    , check.integer.tolerance1 = check.integer.tolerance1(8.9)
    , check.integer.tolerance2 = check.integer.tolerance2(8.9)
)
autoplot(mbm)
mbm
# > mbm
# Unit: nanoseconds
#                      expr  min   lq    mean median   uq   max neval cld
#            check.integer1    0  395  403.02    395  395  9482   100 a  
#            check.integer2    0    0  122.51      0  395  1185   100 a  
#  check.integer.tolerance1  790  790  960.09    790 1185  2371   100  b 
#  check.integer.tolerance2 5135 5531 6052.41   5531 5926 33580   100   c




# @ end -----  

