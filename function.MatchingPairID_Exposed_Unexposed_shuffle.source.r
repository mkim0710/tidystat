function.MatchingPairID_Exposed_Unexposed_shuffle = function(MatchingPairID_Exposed_Unexposed, var_MatchingPairID = "MatchingPairID", var_Exposed = "Exposed", var_Unexposed = "Unexposed", seed = NULL) {
    # library(tidyverse)
    # source("https://github.com/mkim0710/tidystat/raw/master/function.MatchingPairID_Exposed_Unexposed_shuffle.source.r")
    if( !identical(colnames(MatchingPairID_Exposed_Unexposed), c(var_MatchingPairID, var_Exposed, var_Unexposed)) ) {
        stop("!identical(colnames(MatchingPairID_Exposed_Unexposed), c(var_MatchingPairID, var_Exposed, var_Unexposed))")
    }
    out = MatchingPairID_Exposed_Unexposed[order(MatchingPairID_Exposed_Unexposed$MatchingPairID), c(var_MatchingPairID, var_Exposed, var_Unexposed)]
    
    MatchingPairID_isExposed_PERSON_ID = out %>% gather(!!var_Exposed, !!var_Unexposed, key = "ExposedUnexposed", value = "PERSON_ID")
    # %>% arrange(!!var_MatchingPairID)
    MatchingPairID_isExposed_PERSON_ID = MatchingPairID_isExposed_PERSON_ID[order(MatchingPairID_isExposed_PERSON_ID$MatchingPairID), ]
    
    # if(!is.null(seed)) {
    #     set.seed(seed); 
    # }
    sample.vec = sample(0:1, nrow(MatchingPairID_isExposed_PERSON_ID)/2, replace = T)
    index4Exposed = ( 1 : (nrow(MatchingPairID_isExposed_PERSON_ID)/2) ) * 2 - sample.vec
    
    out$Exposed_shuffle = MatchingPairID_isExposed_PERSON_ID$PERSON_ID[index4Exposed]
    out$Unexposed_shuffle = MatchingPairID_isExposed_PERSON_ID$PERSON_ID[-index4Exposed]
    out
    
}

# #@ test) function.MatchingPairID_Exposed_Unexposed_shuffle() ---------
# load(url("https://github.com/mkim0710/tidystat/raw/master/library(CrossScreening) nhanes.fish.match.rda"))
# nhanes.fish.match.rename = nhanes.fish.match[,c("treated", "control")] %>% rownames_to_column %>% as.tibble
# names(nhanes.fish.match.rename) = c("MatchingPairID", "Exposed", "Unexposed")
# nhanes.fish.match.rename
# # > nhanes.fish.match.rename
# # # A tibble: 234 x 3
# #    MatchingPairID Exposed Unexposed
# #             <chr>   <int>     <int>
# #  1              1    1003       433
# #  2              2    1045       851
# #  3              3     445       142
# #  4              4     454       783
# #  5              5     460       692
# #  6              6     464        40
# #  7              7     465        92
# #  8              8     473       292
# #  9              9     482       596
# # 10             10     489       309
# # # ... with 224 more rows
# 
# set.seed(1)
# function.MatchingPairID_Exposed_Unexposed_shuffle(nhanes.fish.match.rename)
# function.MatchingPairID_Exposed_Unexposed_shuffle(nhanes.fish.match.rename)
# # > function.MatchingPairID_Exposed_Unexposed_shuffle(nhanes.fish.match.rename)
# # # A tibble: 234 x 5
# #    MatchingPairID Exposed Unexposed Exposed_shuffle Unexposed_shuffle
# #             <chr>   <int>     <int>           <int>             <int>
# #  1              1    1003       433             433              1003
# #  2             10     489       309             309               489
# #  3            100     820       785             820               785
# #  4            101     111       166             111               166
# #  5            102     827        45              45               827
# #  6            103     828       281             828               281
# #  7            104     829       661             829               661
# #  8            105      83       900              83               900
# #  9            106     831      1030             831              1030
# # 10            107      84       859             859                84
# # # ... with 224 more rows
# # > function.MatchingPairID_Exposed_Unexposed_shuffle(nhanes.fish.match.rename)
# # # A tibble: 234 x 5
# #    MatchingPairID Exposed Unexposed Exposed_shuffle Unexposed_shuffle
# #             <chr>   <int>     <int>           <int>             <int>
# #  1              1    1003       433             433              1003
# #  2             10     489       309             489               309
# #  3            100     820       785             820               785
# #  4            101     111       166             111               166
# #  5            102     827        45              45               827
# #  6            103     828       281             281               828
# #  7            104     829       661             661               829
# #  8            105      83       900              83               900
# #  9            106     831      1030             831              1030
# # 10            107      84       859             859                84
# # # ... with 224 more rows





function.MatchingPairID_Exposed_Unexposed_shuffle_vec = function(MatchingPairID_Exposed_Unexposed, var_MatchingPairID = "MatchingPairID", var_Exposed = "Exposed", var_Unexposed = "Unexposed", seed = NULL) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.MatchingPairID_Exposed_Unexposed_shuffle.source.r")
    # library(tidyverse)
    MatchingPairID_isExposed_PERSON_ID = 
        MatchingPairID_Exposed_Unexposed[order(MatchingPairID_Exposed_Unexposed$MatchingPairID), c(var_MatchingPairID, var_Exposed, var_Unexposed)] %>% 
        gather(!!var_Exposed, !!var_Unexposed, key = "ExposedUnexposed", value = "PERSON_ID")
    # %>% arrange(!!var_MatchingPairID)
    MatchingPairID_isExposed_PERSON_ID = MatchingPairID_isExposed_PERSON_ID[order(MatchingPairID_isExposed_PERSON_ID$MatchingPairID), ]
    
    # if(!is.null(seed)) {
    #     set.seed(seed); 
    # }
    sample.vec = sample(0:1, nrow(MatchingPairID_isExposed_PERSON_ID)/2, replace = T)
    index4Exposed = ( 1 : (nrow(MatchingPairID_isExposed_PERSON_ID)/2) ) * 2 - sample.vec
    
    out = MatchingPairID_isExposed_PERSON_ID$PERSON_ID[index4Exposed]
    out
}


# #@ test) function.MatchingPairID_Exposed_Unexposed_shuffle_vec() ---------
# set.seed(1)
# function.MatchingPairID_Exposed_Unexposed_shuffle_vec(nhanes.fish.match.rename) %>% str
# function.MatchingPairID_Exposed_Unexposed_shuffle_vec(nhanes.fish.match.rename) %>% str
# # > function.MatchingPairID_Exposed_Unexposed_shuffle_vec(nhanes.fish.match.rename) %>% str
# #  int [1:234] 433 309 820 111 45 828 829 83 831 859 ...
# # > function.MatchingPairID_Exposed_Unexposed_shuffle_vec(nhanes.fish.match.rename) %>% str
# #  int [1:234] 433 489 820 111 45 281 661 83 831 859 ...
# function.MatchingPairID_Exposed_Unexposed_shuffle_vec(nhanes.fish.match.rename) %>% summary
# function.MatchingPairID_Exposed_Unexposed_shuffle_vec(nhanes.fish.match.rename) %>% summary
# # > function.MatchingPairID_Exposed_Unexposed_shuffle_vec(nhanes.fish.match.rename) %>% summary
# #    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# #     1.0   326.2   547.0   548.1   795.5  1106.0 
# # > function.MatchingPairID_Exposed_Unexposed_shuffle_vec(nhanes.fish.match.rename) %>% summary
# #    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# #     8.0   294.0   531.5   540.8   816.2  1101.0 



function.MatchingPairID_isExposed_PERSON_ID_shuffle = function(MatchingPairID_isExposed_PERSON_ID, var_MatchingPairID = "MatchingPairID", var_PERSON_ID = "PERSON_ID", seed = NULL) {
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

# #@ test) function.MatchingPairID_isExposed_PERSON_ID_shuffle() ---------
# library(tidyverse)
# n = 10^4
# data = data_frame(
#   PERSON_ID = as.factor(1:(n * 2))
#   , MatchingPairID = as.factor((1:(n * 2) + 1) %/% 2)
#   , isExposed = rep(c(F,T), n) )
# set.seed(1)
# data = data %>% mutate(Outcome = isExposed * 100 / n + 10 + rnorm(2 * n, 0, 3) + (((1:nrow(data) + 1) %/% 2) %% 5) )
# data
# data %>% summary
# # > data
# # # A tibble: 20,000 x 4
# #    PERSON_ID MatchingPairID isExposed   Outcome
# #       <fctr>         <fctr>     <lgl>     <dbl>
# #  1         1              1     FALSE  9.120639
# #  2         2              1      TRUE 11.560930
# #  3         3              2     FALSE  9.493114
# #  4         4              2      TRUE 16.795842
# #  5         5              3     FALSE 13.988523
# #  6         6              3      TRUE 10.548595
# #  7         7              4     FALSE 15.462287
# #  8         8              4      TRUE 16.224974
# #  9         9              5     FALSE 11.727344
# # 10        10              5      TRUE  9.093835
# # # ... with 19,990 more rows
# # > data %>% summary
# #    PERSON_ID     MatchingPairID  isExposed          Outcome      
# #  1      :    1   1      :    2   Mode :logical   Min.   :-2.898  
# #  2      :    1   2      :    2   FALSE:10000     1st Qu.: 9.731  
# #  3      :    1   3      :    2   TRUE :10000     Median :11.989  
# #  4      :    1   4      :    2                   Mean   :11.989  
# #  5      :    1   5      :    2                   3rd Qu.:14.212  
# #  6      :    1   6      :    2                   Max.   :24.883  
# #  (Other):19994   (Other):19988                                   
# set.seed(1)
# function.MatchingPairID_isExposed_PERSON_ID_shuffle(MatchingPairID_isExposed_PERSON_ID = data)
# # > function.MatchingPairID_isExposed_PERSON_ID_shuffle(MatchingPairID_isExposed_PERSON_ID = data)
# # # A tibble: 20,000 x 5
# #    PERSON_ID MatchingPairID isExposed   Outcome isExposed_shuffle
# #       <fctr>         <fctr>     <lgl>     <dbl>             <lgl>
# #  1         1              1     FALSE  9.120639             FALSE
# #  2         2              1      TRUE 11.560930              TRUE
# #  3         3              2     FALSE  9.493114              TRUE
# #  4         4              2      TRUE 16.795842             FALSE
# #  5         5              3     FALSE 13.988523             FALSE
# #  6         6              3      TRUE 10.548595              TRUE
# #  7         7              4     FALSE 15.462287             FALSE
# #  8         8              4      TRUE 16.224974              TRUE
# #  9         9              5     FALSE 11.727344              TRUE
# # 10        10              5      TRUE  9.093835             FALSE
# # # ... with 19,990 more rows
# 
# t.test(data$Outcome[data$isExposed==F], data$Outcome[data$isExposed==T])
# t.test(data$Outcome[data$isExposed==F], data$Outcome[data$isExposed==T], paired = T)
# # > t.test(data$Outcome[data$isExposed==F], data$Outcome[data$isExposed==T])
# # 
# # 	Welch Two Sample t-test
# # 
# # data:  data$Outcome[data$isExposed == F] and data$Outcome[data$isExposed == T]
# # t = -1.7156, df = 19997, p-value = 0.08625
# # alternative hypothesis: true difference in means is not equal to 0
# # 95 percent confidence interval:
# #  -0.17268666  0.01148525
# # sample estimates:
# # mean of x mean of y 
# #  11.94861  12.02921 
# # 
# # > t.test(data$Outcome[data$isExposed==F], data$Outcome[data$isExposed==T], paired = T)
# # 
# # 	Paired t-test
# # 
# # data:  data$Outcome[data$isExposed == F] and data$Outcome[data$isExposed == T]
# # t = -1.8992, df = 9999, p-value = 0.05757
# # alternative hypothesis: true difference in means is not equal to 0
# # 95 percent confidence interval:
# #  -0.163790679  0.002589273
# # sample estimates:
# # mean of the differences 
# #              -0.0806007 
# iteration = 10^5
# set.seed(3)
# time1 = Sys.time()
# dist = replicate(iteration, diff(by(data$Outcome, function.MatchingPairID_isExposed_PERSON_ID_shuffle(data)$isExposed_shuffle, mean)))
# time2 = Sys.time()
# hist(dist, col = "gray", breaks = 100)
# abline(v = diff(by(data$Outcome, data$isExposed, mean)), col = "blue", lwd = 2)
# 
# time2 - time1
# sum(dist > diff(by(data$Outcome, data$isExposed, mean)) )/iteration  # one-tailed test
# sum(abs(dist) > abs(diff(by(data$Outcome, data$isExposed, mean))) )/iteration  # two-tailed test
# # > time2 - time1
# # Time difference of 22.65409 mins
# # > sum(dist > diff(by(data$Outcome, data$isExposed, mean)) )/iteration  # one-tailed test
# # [1] 0.02898
# # > sum(abs(dist) > abs(diff(by(data$Outcome, data$isExposed, mean))) )/iteration  # two-tailed test
# # [1] 0.05828


# load(url("https://github.com/mkim0710/tidystat/raw/master/library(CrossScreening) nhanes.fish.match.rda"))
# nhanes.fish.match.rename = nhanes.fish.match[,c("treated", "control")] %>% rownames_to_column %>% as.tibble
# names(nhanes.fish.match.rename) = c("MatchingPairID", "Exposed", "Unexposed")
# nhanes.fish.match.rename
# # > nhanes.fish.match.rename
# # # A tibble: 234 x 3
# #    MatchingPairID Exposed Unexposed
# #             <chr>   <int>     <int>
# #  1              1    1003       433
# #  2              2    1045       851
# #  3              3     445       142
# #  4              4     454       783
# #  5              5     460       692
# #  6              6     464        40
# #  7              7     465        92
# #  8              8     473       292
# #  9              9     482       596
# # 10             10     489       309
# # # ... with 224 more rows
# 
# library(tidyverse)
# MatchingPairID_isExposed_PERSON_ID = nhanes.fish.match.rename %>% gather(Exposed, Unexposed, key = "ExposedUnexposed", value = "PERSON_ID") %>% arrange(MatchingPairID)
# MatchingPairID_isExposed_PERSON_ID
# # > MatchingPairID_isExposed_PERSON_ID
# # # A tibble: 468 x 3
# #    MatchingPairID ExposedUnexposed PERSON_ID
# #             <chr>            <chr>     <int>
# #  1              1          Exposed      1003
# #  2              1        Unexposed       433
# #  3             10          Exposed       489
# #  4             10        Unexposed       309
# #  5            100          Exposed       820
# #  6            100        Unexposed       785
# #  7            101          Exposed       111
# #  8            101        Unexposed       166
# #  9            102          Exposed       827
# # 10            102        Unexposed        45
# # # ... with 458 more rows
# 
# set.seed(1)
# function.MatchingPairID_isExposed_PERSON_ID_shuffle(MatchingPairID_isExposed_PERSON_ID)
# # > function.MatchingPairID_isExposed_PERSON_ID_shuffle(MatchingPairID_isExposed_PERSON_ID)
# # # A tibble: 468 x 4
# #    MatchingPairID ExposedUnexposed PERSON_ID isExposed_shuffle
# #             <chr>            <chr>     <int>             <lgl>
# #  1              1          Exposed      1003             FALSE
# #  2              1        Unexposed       433              TRUE
# #  3             10          Exposed       489             FALSE
# #  4             10        Unexposed       309              TRUE
# #  5            100          Exposed       820              TRUE
# #  6            100        Unexposed       785             FALSE
# #  7            101          Exposed       111              TRUE
# #  8            101        Unexposed       166             FALSE
# #  9            102          Exposed       827             FALSE
# # 10            102        Unexposed        45              TRUE
# # # ... with 458 more rows
# # > function.MatchingPairID_isExposed_PERSON_ID_shuffle(MatchingPairID_isExposed_PERSON_ID)
# # # A tibble: 468 x 4
# #    MatchingPairID ExposedUnexposed PERSON_ID isExposed_shuffle
# #             <chr>            <chr>     <int>             <lgl>
# #  1              1          Exposed      1003             FALSE
# #  2              1        Unexposed       433              TRUE
# #  3             10          Exposed       489              TRUE
# #  4             10        Unexposed       309             FALSE
# #  5            100          Exposed       820              TRUE
# #  6            100        Unexposed       785             FALSE
# #  7            101          Exposed       111              TRUE
# #  8            101        Unexposed       166             FALSE
# #  9            102          Exposed       827             FALSE
# # 10            102        Unexposed        45              TRUE
# # # ... with 458 more rows





function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec = function(MatchingPairID_isExposed_PERSON_ID, var_MatchingPairID = "MatchingPairID", var_PERSON_ID = "PERSON_ID", seed = NULL) {
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

# #@ test) function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec() --------
# set.seed(1)
# function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec(MatchingPairID_isExposed_PERSON_ID = data) %>% str
# function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec(MatchingPairID_isExposed_PERSON_ID = data) %>% str
# function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec(MatchingPairID_isExposed_PERSON_ID = data) %>% str
# > function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec(MatchingPairID_isExposed_PERSON_ID = data) %>% str
#  Factor w/ 200 levels "1","2","3","4",..: 1 4 6 7 9 12 14 16 17 19 ...
# > function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec(MatchingPairID_isExposed_PERSON_ID = data) %>% str
#  Factor w/ 200 levels "1","2","3","4",..: 2 4 5 8 10 11 13 16 18 19 ...
# > function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec(MatchingPairID_isExposed_PERSON_ID = data) %>% str
#  Factor w/ 200 levels "1","2","3","4",..: 1 4 6 8 10 11 14 15 18 20 ...
#  
# set.seed(1)
# function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec(MatchingPairID_isExposed_PERSON_ID) %>% str
# function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec(MatchingPairID_isExposed_PERSON_ID) %>% str
# function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec(MatchingPairID_isExposed_PERSON_ID) %>% str
# function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec(MatchingPairID_isExposed_PERSON_ID) %>% str
# # > function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec(MatchingPairID_isExposed_PERSON_ID) %>% str
# #  int [1:234] 433 309 820 111 45 828 829 83 831 859 ...
# # > function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec(MatchingPairID_isExposed_PERSON_ID) %>% str
# #  int [1:234] 433 489 820 111 45 281 661 83 831 859 ...
# # > function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec(MatchingPairID_isExposed_PERSON_ID) %>% str
# #  int [1:234] 433 489 785 111 827 281 661 900 831 859 ...
# # > function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec(MatchingPairID_isExposed_PERSON_ID) %>% str
# #  int [1:234] 1003 489 820 166 45 828 829 83 831 859 ...




#@ shuffle & calculate Statistic ---------

function.Outcome_mean_diff_byExposed = function(isExposed_Outcome, var_isExposed = "isExposed", var_Outcome = "Outcome") {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.MatchingPairID_Exposed_Unexposed_shuffle.source.r")
    # library(tidyverse)
    # if (!var_isExposed %in% names(isExposed_Outcome)) {
    #     stop("!var_isExposed %in% names(isExposed_Outcome)")
    # } else if (!var_Outcome %in% names(isExposed_Outcome)) {
    #     stop("!var_Outcome %in% names(isExposed_Outcome)")
    # }
    StatisticValue = diff(by(isExposed_Outcome[[var_Outcome]], isExposed_Outcome[[var_isExposed]], mean))
    StatisticValue
}
# function.Outcome_mean_diff_byExposed(data)
# # > function.Outcome_mean_diff_byExposed(data)
# # [1] 0.7823872

function.calculate.StatisticValue = function.Outcome_mean_diff_byExposed

function.MatchingPairID_isExposed_PERSON_ID_shuffle_StatisticValue = function(
    MatchingPairID_isExposed_PERSON_ID
    , var_MatchingPairID = "MatchingPairID"
    , var_PERSON_ID = "PERSON_ID"
    , seed = NULL
    , .function.calculate.StatisticValue = function.calculate.StatisticValue
    , ...
) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.MatchingPairID_Exposed_Unexposed_shuffle.source.r")
    # library(tidyverse)
    MatchingPairID_isExposed_PERSON_ID = MatchingPairID_isExposed_PERSON_ID[order(MatchingPairID_isExposed_PERSON_ID[[var_MatchingPairID]]), ]
    
    # if(!is.null(seed)) {
    #     set.seed(seed); 
    # }
    sample.vec = sample(0:1, nrow(MatchingPairID_isExposed_PERSON_ID)/2, replace = T)
    index4Exposed = ( 1 : (nrow(MatchingPairID_isExposed_PERSON_ID)/2) ) * 2 - sample.vec
    
    data_shuffle = MatchingPairID_isExposed_PERSON_ID
    data_shuffle$isExposed = F
    data_shuffle$isExposed[index4Exposed] = T
    out = .function.calculate.StatisticValue(data_shuffle)
    out
}
# set.seed(5)
# function.MatchingPairID_isExposed_PERSON_ID_shuffle_StatisticValue(data)
# function.MatchingPairID_isExposed_PERSON_ID_shuffle_StatisticValue(data)
# function.MatchingPairID_isExposed_PERSON_ID_shuffle_StatisticValue(data)
# # > function.MatchingPairID_isExposed_PERSON_ID_shuffle_StatisticValue(data)
# # [1] -0.7375218
# # > function.MatchingPairID_isExposed_PERSON_ID_shuffle_StatisticValue(data)
# # [1] -0.4180693
# # > function.MatchingPairID_isExposed_PERSON_ID_shuffle_StatisticValue(data)
# # [1] 0.0853595
# 
# iteration = 10^5
# set.seed(3)
# time1 = Sys.time()
# EmpiricalDistributionOfStatisticValue = replicate(iteration, function.MatchingPairID_isExposed_PERSON_ID_shuffle_StatisticValue(data))
# time2 = Sys.time()
# hist(EmpiricalDistributionOfStatisticValue, col = "gray", breaks = 100)
# abline(v = diff(by(data$Outcome, data$isExposed, mean)), col = "blue", lwd = 2)
# 
# time2 - time1
# sum(EmpiricalDistributionOfStatisticValue > function.calculate.StatisticValue(data) )/iteration  # one-tailed test
# sum(abs(EmpiricalDistributionOfStatisticValue) > abs(function.calculate.StatisticValue(data)) )/iteration  # two-tailed test
# # > time2 - time1
# # Time difference of 2.237994 mins
# # > sum(EmpiricalDistributionOfStatisticValue > function.calculate.StatisticValue(data) )/iteration  # one-tailed test
# # [1] 0.02486
# # > sum(abs(EmpiricalDistributionOfStatisticValue) > abs(function.calculate.StatisticValue(data)) )/iteration  # two-tailed test
# # [1] 0.04855
