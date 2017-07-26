function.MatchingPairID_Case_Ctrl_shuffle = function(MatchingPairID_Case_Ctrl, var_MatchingPairID = "MatchingPairID", var_Case = "Case", var_Ctrl = "Ctrl", seed = NULL) {
    library(tidyverse)
    # source("https://github.com/mkim0710/tidystat/raw/master/function.MatchingPairID_Case_Ctrl_shuffle.source.r")
    if( !identical(colnames(MatchingPairID_Case_Ctrl), c(var_MatchingPairID, var_Case, var_Ctrl)) ) {
        stop("!identical(colnames(MatchingPairID_Case_Ctrl), c(var_MatchingPairID, var_Case, var_Ctrl))")
    }
    out = MatchingPairID_Case_Ctrl[order(MatchingPairID_Case_Ctrl$MatchingPairID), c(var_MatchingPairID, var_Case, var_Ctrl)]
    
    MatchingPairID_CaseCtrl_PERSON_ID = out %>% gather(!!var_Case, !!var_Ctrl, key = "CaseCtrl", value = "PERSON_ID")
    # %>% arrange(!!var_MatchingPairID)
    MatchingPairID_CaseCtrl_PERSON_ID = MatchingPairID_CaseCtrl_PERSON_ID[order(MatchingPairID_CaseCtrl_PERSON_ID$MatchingPairID), ]
    
    if(!is.null(seed)) {
        set.seed(seed); 
    }
    sample.vec = sample(0:1, nrow(MatchingPairID_CaseCtrl_PERSON_ID)/2, replace = T)
    index4Case = ( 1 : (nrow(MatchingPairID_CaseCtrl_PERSON_ID)/2) ) * 2 - sample.vec
    
    out$Case_shuffle = MatchingPairID_CaseCtrl_PERSON_ID$PERSON_ID[index4Case]
    out$Ctrl_shuffle = MatchingPairID_CaseCtrl_PERSON_ID$PERSON_ID[-index4Case]
    out

}


# #@ test ---------
# load(url("https://github.com/mkim0710/tidystat/raw/master/library(CrossScreening) nhanes.fish.match.rda"))
# nhanes.fish.match.rename = nhanes.fish.match[,c("treated", "control")]
# nhanes.fish.match.rename = nhanes.fish.match.rename %>% rownames_to_column()
# names(nhanes.fish.match.rename) = c("MatchingPairID", "Case", "Ctrl")
# nhanes.fish.match.rename = as.tibble(nhanes.fish.match.rename)
# nhanes.fish.match.rename
# # > nhanes.fish.match.rename
# # # A tibble: 234 x 3
# #    MatchingPairID  Case  Ctrl
# #             <chr> <int> <int>
# #  1              1  1003   433
# #  2              2  1045   851
# #  3              3   445   142
# #  4              4   454   783
# #  5              5   460   692
# #  6              6   464    40
# #  7              7   465    92
# #  8              8   473   292
# #  9              9   482   596
# # 10             10   489   309
# # # ... with 224 more rows
# 
# set.seed(1)
# function.MatchingPairID_Case_Ctrl_shuffle(nhanes.fish.match.rename)
# function.MatchingPairID_Case_Ctrl_shuffle(nhanes.fish.match.rename)
# # > function.MatchingPairID_Case_Ctrl_shuffle(nhanes.fish.match.rename)
# # # A tibble: 234 x 5
# #    MatchingPairID  Case  Ctrl Case_shuffle Ctrl_shuffle
# #             <chr> <int> <int>        <int>        <int>
# #  1              1  1003   433          433         1003
# #  2             10   489   309          309          489
# #  3            100   820   785          820          785
# #  4            101   111   166          111          166
# #  5            102   827    45           45          827
# #  6            103   828   281          828          281
# #  7            104   829   661          829          661
# #  8            105    83   900           83          900
# #  9            106   831  1030          831         1030
# # 10            107    84   859          859           84
# # # ... with 224 more rows
# # > function.MatchingPairID_Case_Ctrl_shuffle(nhanes.fish.match.rename)
# # # A tibble: 234 x 5
# #    MatchingPairID  Case  Ctrl Case_shuffle Ctrl_shuffle
# #             <chr> <int> <int>        <int>        <int>
# #  1              1  1003   433          433         1003
# #  2             10   489   309          489          309
# #  3            100   820   785          820          785
# #  4            101   111   166          111          166
# #  5            102   827    45           45          827
# #  6            103   828   281          281          828
# #  7            104   829   661          661          829
# #  8            105    83   900           83          900
# #  9            106   831  1030          831         1030
# # 10            107    84   859          859           84
# # # ... with 224 more rows
