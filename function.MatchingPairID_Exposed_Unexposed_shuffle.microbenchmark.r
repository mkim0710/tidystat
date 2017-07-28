

#@ function.MatchingPairID_isExposed_PERSON_ID_shuffle() ---------
function.MatchingPairID_isExposed_PERSON_ID_shuffle0 = function(MatchingPairID_isExposed_PERSON_ID, var_MatchingPairID = "MatchingPairID", var_PERSON_ID = "PERSON_ID", seed = NULL) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.MatchingPairID_Exposed_Unexposed_shuffle.source.r")
    library(tidyverse)
    MatchingPairID_isExposed_PERSON_ID = MatchingPairID_isExposed_PERSON_ID[order(MatchingPairID_isExposed_PERSON_ID[[var_MatchingPairID]]), ]
    
    if(!is.null(seed)) {
        set.seed(seed); 
    }
    sample.vec = sample(0:1, nrow(MatchingPairID_isExposed_PERSON_ID)/2, replace = T)
    index4Exposed = ( 1 : (nrow(MatchingPairID_isExposed_PERSON_ID)/2) ) * 2 - sample.vec
    
    out = MatchingPairID_isExposed_PERSON_ID
    out$isExposed_shuffle = F
    out$isExposed_shuffle[index4Exposed] = T
    out
}
function.MatchingPairID_isExposed_PERSON_ID_shuffle1 = function(MatchingPairID_isExposed_PERSON_ID, var_MatchingPairID = "MatchingPairID", var_PERSON_ID = "PERSON_ID", seed = NULL) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.MatchingPairID_Exposed_Unexposed_shuffle.source.r")
    # library(tidyverse)
    MatchingPairID_isExposed_PERSON_ID = MatchingPairID_isExposed_PERSON_ID[order(MatchingPairID_isExposed_PERSON_ID[[var_MatchingPairID]]), ]
    
    if(!is.null(seed)) {
        set.seed(seed);
    }
    sample.vec = sample(0:1, nrow(MatchingPairID_isExposed_PERSON_ID)/2, replace = T)
    index4Exposed = ( 1 : (nrow(MatchingPairID_isExposed_PERSON_ID)/2) ) * 2 - sample.vec
    
    out = MatchingPairID_isExposed_PERSON_ID
    out$isExposed_shuffle = F
    out$isExposed_shuffle[index4Exposed] = T
    out
}
function.MatchingPairID_isExposed_PERSON_ID_shuffle2 = function(MatchingPairID_isExposed_PERSON_ID, var_MatchingPairID = "MatchingPairID", var_PERSON_ID = "PERSON_ID", seed = NULL) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.MatchingPairID_Exposed_Unexposed_shuffle.source.r")
    # library(tidyverse)
    MatchingPairID_isExposed_PERSON_ID = MatchingPairID_isExposed_PERSON_ID[order(MatchingPairID_isExposed_PERSON_ID[[var_MatchingPairID]]), ]
    
    # if(!is.null(seed)) {
    #     set.seed(seed); 
    # }
    sample.vec = sample(0:1, nrow(MatchingPairID_isExposed_PERSON_ID)/2, replace = T)
    index4Exposed = ( 1 : (nrow(MatchingPairID_isExposed_PERSON_ID)/2) ) * 2 - sample.vec
    
    out = MatchingPairID_isExposed_PERSON_ID
    out$isExposed_shuffle = F
    out$isExposed_shuffle[index4Exposed] = T
    out
}
function.MatchingPairID_isExposed_PERSON_ID_shuffle3 = function(MatchingPairID_isExposed_PERSON_ID, var_MatchingPairID = "MatchingPairID", var_PERSON_ID = "PERSON_ID", seed = NULL) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.MatchingPairID_Exposed_Unexposed_shuffle.source.r")
    # library(tidyverse)
    out = MatchingPairID_isExposed_PERSON_ID[order(MatchingPairID_isExposed_PERSON_ID[[var_MatchingPairID]]), ]
    
    # if(!is.null(seed)) {
    #     set.seed(seed); 
    # }
    sample.vec = sample(0:1, nrow(out)/2, replace = T)
    index4Exposed = ( 1 : (nrow(out)/2) ) * 2 - sample.vec
    
    # out = MatchingPairID_isExposed_PERSON_ID
    out$isExposed_shuffle = F
    out$isExposed_shuffle[index4Exposed] = T
    out
}
function.MatchingPairID_isExposed_PERSON_ID_shuffle4 = function(MatchingPairID_isExposed_PERSON_ID, var_MatchingPairID = "MatchingPairID", var_PERSON_ID = "PERSON_ID", seed = NULL) {
    out = MatchingPairID_isExposed_PERSON_ID[order(MatchingPairID_isExposed_PERSON_ID[[var_MatchingPairID]]), ]
    sample.vec = sample(0:1, nrow(out)/2, replace = T)
    index4Exposed = ( 1 : (nrow(out)/2) ) * 2 - sample.vec
    out$isExposed_shuffle = F
    out$isExposed_shuffle[index4Exposed] = T
    out
}



#@ test) function.MatchingPairID_isExposed_PERSON_ID_shuffle() ---------
library(tidyverse)
n = 100
data = data_frame(
    PERSON_ID = as.factor(1:(n * 2))
    , MatchingPairID = as.factor((1:(n * 2) + 1) %/% 2)
    , isExposed = rep(c(F,T), n) )
set.seed(1)
data = data %>% mutate(Outcome = isExposed + 10 + rnorm(2 * n, 0, 3) + (((1:nrow(data) + 1) %/% 2) %% 5) )
data
data %>% summary
# > data
# # A tibble: 200 x 4
#    PERSON_ID MatchingPairID isExposed   Outcome
#       <fctr>         <fctr>     <lgl>     <dbl>
#  1         1              1     FALSE  9.120639
#  2         2              1      TRUE 12.550930
#  3         3              2     FALSE  9.493114
#  4         4              2      TRUE 17.785842
#  5         5              3     FALSE 13.988523
#  6         6              3      TRUE 11.538595
#  7         7              4     FALSE 15.462287
#  8         8              4      TRUE 17.214974
#  9         9              5     FALSE 11.727344
# 10        10              5      TRUE 10.083835
# # ... with 190 more rows
# > data %>% summary
#    PERSON_ID   MatchingPairID isExposed          Outcome
#  1      :  1   1      :  2    Mode :logical   Min.   : 5.257
#  2      :  1   2      :  2    FALSE:100       1st Qu.:10.466
#  3      :  1   3      :  2    TRUE :100       Median :12.507
#  4      :  1   4      :  2                    Mean   :12.607
#  5      :  1   5      :  2                    3rd Qu.:14.698
#  6      :  1   6      :  2                    Max.   :21.226
#  (Other):194   (Other):188
set.seed(1)
function.MatchingPairID_isExposed_PERSON_ID_shuffle(MatchingPairID_isExposed_PERSON_ID = data)
# > function.MatchingPairID_isExposed_PERSON_ID_shuffle(MatchingPairID_isExposed_PERSON_ID = data)
# # A tibble: 200 x 5
#    PERSON_ID MatchingPairID isExposed   Outcome isExposed_shuffle
#       <fctr>         <fctr>     <lgl>     <dbl>             <lgl>
#  1         1              1     FALSE  9.120639             FALSE
#  2         2              1      TRUE 12.550930              TRUE
#  3         3              2     FALSE  9.493114             FALSE
#  4         4              2      TRUE 17.785842              TRUE
#  5         5              3     FALSE 13.988523              TRUE
#  6         6              3      TRUE 11.538595             FALSE
#  7         7              4     FALSE 15.462287              TRUE
#  8         8              4      TRUE 17.214974             FALSE
#  9         9              5     FALSE 11.727344             FALSE
# 10        10              5      TRUE 10.083835              TRUE
# # ... with 190 more rows

# system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle0(MatchingPairID_isExposed_PERSON_ID = data)))
# system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle1(MatchingPairID_isExposed_PERSON_ID = data)))
# system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle2(MatchingPairID_isExposed_PERSON_ID = data)))
# system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle3(MatchingPairID_isExposed_PERSON_ID = data)))
# system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle4(MatchingPairID_isExposed_PERSON_ID = data)))
# # > system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle0(MatchingPairID_isExposed_PERSON_ID = data)))
# #  사용자  시스템 elapsed
# #    9.13    0.89   10.05
# # > system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle1(MatchingPairID_isExposed_PERSON_ID = data)))
# #  사용자  시스템 elapsed
# #    7.69    0.00    7.69
# # > system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle2(MatchingPairID_isExposed_PERSON_ID = data)))
# #  사용자  시스템 elapsed
# #    7.61    0.00    7.60
# # > system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle3(MatchingPairID_isExposed_PERSON_ID = data)))
# #  사용자  시스템 elapsed
# #    7.64    0.00    7.64
# # > system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle2(MatchingPairID_isExposed_PERSON_ID = data)))
# #  사용자  시스템 elapsed
# #    7.69    0.00    7.72
# # > system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle3(MatchingPairID_isExposed_PERSON_ID = data)))
# #  사용자  시스템 elapsed
# #    7.60    0.00    7.59
# # > system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle2(MatchingPairID_isExposed_PERSON_ID = data)))
# #  사용자  시스템 elapsed 
# #    7.83    0.00    7.84 
# # > system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle3(MatchingPairID_isExposed_PERSON_ID = data)))
# #  사용자  시스템 elapsed 
# #    7.93    0.00    7.98 
# # > system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle4(MatchingPairID_isExposed_PERSON_ID = data)))
# #  사용자  시스템 elapsed 
# #    7.88    0.00    7.92 

library(microbenchmark)
mbm = microbenchmark(
    fun0 = function.MatchingPairID_isExposed_PERSON_ID_shuffle0(data)
    , fun1 = function.MatchingPairID_isExposed_PERSON_ID_shuffle1(data)
    , fun2 = function.MatchingPairID_isExposed_PERSON_ID_shuffle2(data)
    , fun3 = function.MatchingPairID_isExposed_PERSON_ID_shuffle3(data)
    , fun4 = function.MatchingPairID_isExposed_PERSON_ID_shuffle4(data)
)
autoplot(mbm)
mbm
# > mbm
# Unit: microseconds
#  expr     min       lq     mean   median       uq      max neval cld
#  fun0 854.950 878.7180 951.3550 939.1400 987.1760 1497.669   100   b
#  fun1 686.571 693.9360 719.3937 700.1290 711.6780 1430.049   100  a 
#  fun2 682.554 693.7685 747.7638 698.6225 708.4975 3236.022   100  a 
#  fun3 680.211 693.9360 765.3817 698.6220 708.3305 6030.510   100  a 
#  fun4 678.537 693.7690 708.9061 699.1245 708.1635 1264.349   100  a 

mbm = microbenchmark(
    fun0 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle0(MatchingPairID_isExposed_PERSON_ID = data))
    , fun1 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle1(MatchingPairID_isExposed_PERSON_ID = data))
    , fun2 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle2(MatchingPairID_isExposed_PERSON_ID = data))
    , fun3 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle3(MatchingPairID_isExposed_PERSON_ID = data))
    , fun4 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle4(MatchingPairID_isExposed_PERSON_ID = data))
)
autoplot(mbm)
mbm
# > mbm
# Unit: milliseconds
#  expr      min       lq     mean   median       uq       max neval cld
#  fun0 89.03495 91.59327 97.02183 93.78571 97.79819 288.54421   100   b
#  fun1 71.22863 73.35881 75.75307 74.71421 77.32760 105.66563   100  a 
#  fun2 71.03213 73.52434 77.86088 76.11262 78.13585 161.26649   100  a 
#  fun3 71.50547 73.40986 76.11265 75.33266 77.74017  88.54957   100  a 
#  fun4 71.49375 73.60535 78.54732 75.32663 78.91665 249.81639   100  a 


# mbm = microbenchmark(
#     fun0 = replicate(10^3, function.MatchingPairID_isExposed_PERSON_ID_shuffle0(MatchingPairID_isExposed_PERSON_ID = data))
#     , fun1 = replicate(10^3, function.MatchingPairID_isExposed_PERSON_ID_shuffle1(MatchingPairID_isExposed_PERSON_ID = data))
#     , fun2 = replicate(10^3, function.MatchingPairID_isExposed_PERSON_ID_shuffle2(MatchingPairID_isExposed_PERSON_ID = data))
#     , fun3 = replicate(10^3, function.MatchingPairID_isExposed_PERSON_ID_shuffle3(MatchingPairID_isExposed_PERSON_ID = data))
# )
# autoplot(mbm)
# mbm
# > mbm = microbenchmark(
# +     fun0 = replicate(10^3, function.MatchingPairID_isExposed_PERSON_ID_shuffle0(MatchingPairID_isExposed_PERSON_ID = data))
# +     , fun1 = replicate(10^3, function.MatchingPairID_isExposed_PERSON_ID_shuffle1(MatchingPairID_isExposed_PERSON_ID = data))
# +     , fun2 = replicate(10^3, function.MatchingPairID_isExposed_PERSON_ID_shuffle2(MatchingPairID_isExposed_PERSON_ID = data))
# +     , fun3 = replicate(10^3, function.MatchingPairID_isExposed_PERSON_ID_shuffle3(MatchingPairID_isExposed_PERSON_ID = data))
# + )
# > autoplot(mbm)
# > mbm
# Unit: milliseconds
#  expr      min       lq     mean   median       uq       max neval cld
#  fun0 910.1155 933.1027 964.2700 941.0774 954.5384 1258.4620   100   b
#  fun1 730.8555 754.1079 785.2054 763.6029 778.8028 1155.5436   100  a
#  fun2 734.4156 749.4259 780.4045 758.4355 772.6972  967.7241   100  a
#  fun3 732.1835 752.5610 777.8573 763.6901 771.6769  976.8993   100  a




function.MatchingPairID_isExposed_PERSON_ID_shuffle0(MatchingPairID_isExposed_PERSON_ID = data)
function.MatchingPairID_isExposed_PERSON_ID_shuffle1(MatchingPairID_isExposed_PERSON_ID = data)
function.MatchingPairID_isExposed_PERSON_ID_shuffle2(MatchingPairID_isExposed_PERSON_ID = data)
function.MatchingPairID_isExposed_PERSON_ID_shuffle3(MatchingPairID_isExposed_PERSON_ID = data)
# > profvis::profvis({function.MatchingPairID_isExposed_PERSON_ID_shuffle0(MatchingPairID_isExposed_PERSON_ID = data)
# + function.MatchingPairID_isExposed_PERSON_ID_shuffle1(MatchingPairID_isExposed_PERSON_ID = data)
# + function.MatchingPairID_isExposed_PERSON_ID_shuffle2(MatchingPairID_isExposed_PERSON_ID = data)
# + function.MatchingPairID_isExposed_PERSON_ID_shuffle3(MatchingPairID_isExposed_PERSON_ID = data)})

# fun0 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle0(MatchingPairID_isExposed_PERSON_ID = data))
# fun1 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle1(MatchingPairID_isExposed_PERSON_ID = data))
# fun2 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle2(MatchingPairID_isExposed_PERSON_ID = data))
# fun3 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle3(MatchingPairID_isExposed_PERSON_ID = data))
# # > profvis::profvis({fun0 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle0(MatchingPairID_isExposed_PERSON_ID = data))
# # + fun1 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle1(MatchingPairID_isExposed_PERSON_ID = data))
# # + fun2 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle2(MatchingPairID_isExposed_PERSON_ID = data))
# # + fun3 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle3(MatchingPairID_isExposed_PERSON_ID = data))})



#@ function.MatchingPairID_Exposed_Unexposed_shuffle_vec() -------------

function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec0 = function(MatchingPairID_isExposed_PERSON_ID, var_MatchingPairID = "MatchingPairID", var_PERSON_ID = "PERSON_ID", seed = NULL) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.MatchingPairID_Exposed_Unexposed_shuffle.source.r")
    library(tidyverse)
    MatchingPairID_isExposed_PERSON_ID = MatchingPairID_isExposed_PERSON_ID[order(MatchingPairID_isExposed_PERSON_ID[[var_MatchingPairID]]), ]
    
    if(!is.null(seed)) {
        set.seed(seed);
    }
    sample.vec = sample(0:1, nrow(MatchingPairID_isExposed_PERSON_ID)/2, replace = T)
    index4Exposed = ( 1 : (nrow(MatchingPairID_isExposed_PERSON_ID)/2) ) * 2 - sample.vec
    
    out = MatchingPairID_isExposed_PERSON_ID[[var_PERSON_ID]][index4Exposed]
    out
}
function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec1 = function(MatchingPairID_isExposed_PERSON_ID, var_MatchingPairID = "MatchingPairID", var_PERSON_ID = "PERSON_ID", seed = NULL) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.MatchingPairID_Exposed_Unexposed_shuffle.source.r")
    # library(tidyverse)
    MatchingPairID_isExposed_PERSON_ID = MatchingPairID_isExposed_PERSON_ID[order(MatchingPairID_isExposed_PERSON_ID[[var_MatchingPairID]]), ]
    
    if(!is.null(seed)) {
        set.seed(seed);
    }
    sample.vec = sample(0:1, nrow(MatchingPairID_isExposed_PERSON_ID)/2, replace = T)
    index4Exposed = ( 1 : (nrow(MatchingPairID_isExposed_PERSON_ID)/2) ) * 2 - sample.vec
    
    out = MatchingPairID_isExposed_PERSON_ID[[var_PERSON_ID]][index4Exposed]
    out
}
function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec2 = function(MatchingPairID_isExposed_PERSON_ID, var_MatchingPairID = "MatchingPairID", var_PERSON_ID = "PERSON_ID", seed = NULL) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.MatchingPairID_Exposed_Unexposed_shuffle.source.r")
    # library(tidyverse)
    MatchingPairID_isExposed_PERSON_ID = MatchingPairID_isExposed_PERSON_ID[order(MatchingPairID_isExposed_PERSON_ID[[var_MatchingPairID]]), ]
    
    # if(!is.null(seed)) {
    #     set.seed(seed); 
    # }
    sample.vec = sample(0:1, nrow(MatchingPairID_isExposed_PERSON_ID)/2, replace = T)
    index4Exposed = ( 1 : (nrow(MatchingPairID_isExposed_PERSON_ID)/2) ) * 2 - sample.vec
    
    out = MatchingPairID_isExposed_PERSON_ID[[var_PERSON_ID]][index4Exposed]
    out
}


system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle0(MatchingPairID_isExposed_PERSON_ID = data)))
system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle1(MatchingPairID_isExposed_PERSON_ID = data)))
system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle2(MatchingPairID_isExposed_PERSON_ID = data)))
system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec0(MatchingPairID_isExposed_PERSON_ID = data)))
system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec1(MatchingPairID_isExposed_PERSON_ID = data)))
system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec2(MatchingPairID_isExposed_PERSON_ID = data)))
# > system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle0(MatchingPairID_isExposed_PERSON_ID = data)))
#  사용자  시스템 elapsed 
#    8.96    0.98    9.94 
# > system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle1(MatchingPairID_isExposed_PERSON_ID = data)))
#  사용자  시스템 elapsed 
#    7.87    0.00    7.89 
# > system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle2(MatchingPairID_isExposed_PERSON_ID = data)))
#  사용자  시스템 elapsed 
#    7.98    0.00    8.00 
# > system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec0(MatchingPairID_isExposed_PERSON_ID = data)))
#  사용자  시스템 elapsed 
#    7.67    0.91    8.60 
# > system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec1(MatchingPairID_isExposed_PERSON_ID = data)))
#  사용자  시스템 elapsed 
#    6.75    0.03    6.83 
# > system.time(replicate(10^4, function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec2(MatchingPairID_isExposed_PERSON_ID = data)))
#  사용자  시스템 elapsed 
#    6.71    0.01    6.76 


library(microbenchmark)
mbm = microbenchmark(
    fun0 = function.MatchingPairID_isExposed_PERSON_ID_shuffle0(data)
    , fun1 = function.MatchingPairID_isExposed_PERSON_ID_shuffle1(data)
    , fun2 = function.MatchingPairID_isExposed_PERSON_ID_shuffle2(data)
    , fun_vec0 = function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec0(data)
    , fun_vec1 = function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec1(data)
    , fun_vec2 = function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec2(data)
)
autoplot(mbm)
mbm
# > mbm
# Unit: microseconds
#      expr     min       lq     mean   median       uq      max neval   cld
#      fun0 859.972 884.4085 940.9242 901.9825 964.0790 2228.427   100     e
#      fun1 687.910 696.7815 718.7678 701.9705 717.8705 1071.868   100  bc  
#      fun2 680.881 696.2795 734.7823 701.6360 715.1925 1497.000   100   c  
#  fun_vec0 767.247 786.9965 842.4343 814.6130 867.8390 1194.387   100    d 
#  fun_vec1 599.202 606.3990 632.6602 611.7550 627.9905  942.655   100 a    
#  fun_vec2 597.863 607.2360 659.4402 612.5920 630.5010 3569.767   100 ab   



mbm = microbenchmark(
    fun0 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle0(data))
    , fun1 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle1(data))
    , fun2 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle2(data))
    , fun_vec0 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec0(data))
    , fun_vec1 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec1(data))
    , fun_vec2 = replicate(10^2, function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec2(data))
)
autoplot(mbm)
mbm
# > mbm
# Unit: milliseconds
#      expr      min       lq     mean   median       uq       max neval  cld
#      fun0 89.21404 91.75981 94.56288 94.29487 96.05464 104.99178   100    d
#      fun1 71.73343 73.39329 75.76124 74.89012 77.35287  88.61685   100  b  
#      fun2 71.62732 73.23930 75.95724 75.26721 77.45212  94.53589   100  b  
#  fun_vec0 80.31841 82.95507 85.49400 84.65693 87.20538  96.03623   100   c 
#  fun_vec1 62.84383 64.59356 70.26049 65.84603 68.69692 238.70573   100 a   
#  fun_vec2 62.75345 64.39188 66.77792 65.43278 68.50210  83.21533   100 a   



#@ end --------
