function.MatchingPairID_Exposed_Unexposed_shuffle = function(MatchingPairID_Exposed_Unexposed, var_MatchingPairID = "MatchingPairID", var_Exposed = "Exposed", var_Unexposed = "Unexposed", seed = NULL) {
    library(tidyverse)
    # source("https://github.com/mkim0710/tidystat/raw/master/function.MatchingPairID_Exposed_Unexposed_shuffle.source.r")
    if( !identical(colnames(MatchingPairID_Exposed_Unexposed), c(var_MatchingPairID, var_Exposed, var_Unexposed)) ) {
        stop("!identical(colnames(MatchingPairID_Exposed_Unexposed), c(var_MatchingPairID, var_Exposed, var_Unexposed))")
    }
    out = MatchingPairID_Exposed_Unexposed[order(MatchingPairID_Exposed_Unexposed$MatchingPairID), c(var_MatchingPairID, var_Exposed, var_Unexposed)]
    
    MatchingPairID_isExposed_PERSON_ID = out %>% gather(!!var_Exposed, !!var_Unexposed, key = "ExposedUnexposed", value = "PERSON_ID")
    # %>% arrange(!!var_MatchingPairID)
    MatchingPairID_isExposed_PERSON_ID = MatchingPairID_isExposed_PERSON_ID[order(MatchingPairID_isExposed_PERSON_ID$MatchingPairID), ]
    
    if(!is.null(seed)) {
        set.seed(seed); 
    }
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
    library(tidyverse)
    # source("https://github.com/mkim0710/tidystat/raw/master/function.MatchingPairID_Exposed_Unexposed_shuffle.source.r")
    MatchingPairID_isExposed_PERSON_ID = 
        MatchingPairID_Exposed_Unexposed[order(MatchingPairID_Exposed_Unexposed$MatchingPairID), c(var_MatchingPairID, var_Exposed, var_Unexposed)] %>% 
        gather(!!var_Exposed, !!var_Unexposed, key = "ExposedUnexposed", value = "PERSON_ID")
    # %>% arrange(!!var_MatchingPairID)
    MatchingPairID_isExposed_PERSON_ID = MatchingPairID_isExposed_PERSON_ID[order(MatchingPairID_isExposed_PERSON_ID$MatchingPairID), ]
    
    if(!is.null(seed)) {
        set.seed(seed); 
    }
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

# #@ test) function.MatchingPairID_isExposed_PERSON_ID_shuffle() ---------
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
    MatchingPairID_isExposed_PERSON_ID = MatchingPairID_isExposed_PERSON_ID[order(MatchingPairID_isExposed_PERSON_ID[[var_MatchingPairID]]), ]
    
    if(!is.null(seed)) {
        set.seed(seed); 
    }
    sample.vec = sample(0:1, nrow(MatchingPairID_isExposed_PERSON_ID)/2, replace = T)
    index4Exposed = ( 1 : (nrow(MatchingPairID_isExposed_PERSON_ID)/2) ) * 2 - sample.vec
    
    out = MatchingPairID_isExposed_PERSON_ID[[var_PERSON_ID]][index4Exposed]
    out
}

# #@ test) function.MatchingPairID_isExposed_PERSON_ID_shuffle_vec() --------
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


