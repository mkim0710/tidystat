# source("https://github.com/mkim0710/tidystat/raw/master/data.strata_list.Match.source.r")


data.strata_list = function(
    .mydata
    , .vars4strata = c("female", "age.cut")
) {
    # source("https://github.com/mkim0710/tidystat/raw/master/data.strata_list.Match.source.r")
    if ("strata" %in% names(.mydata)) stop("\"strata\" %in% names(.mydata)")
    .mydata$strata = .mydata[, .vars4strata] %>% apply(MARGIN = 1, FUN = paste, collapse = "_")
    .mydata$strata = .mydata$strata %>% as.factor
    out = map(
        levels(.mydata$strata)
        , function(chr) {
            .mydata %>% filter(strata == !!chr) %>% as.tibble
        }
    )
    names(out) = levels(.mydata$strata)
    out
}
#@ test) data.strata_list() -----
library(tidyverse)
load(url("https://github.com/mkim0710/tidystat/raw/master/rhc_mydata.rda"))
rhc_mydata$age.cut = rhc_mydata$age %>% cut(breaks = c(0, 10 * 1:10, Inf), include.lowest = T, right = F)
rhc_mydata %>% as.tibble
# > rhc_mydata %>% as.tibble
# # A tibble: 5,735 x 14
#      ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut
#    <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>
#  1     0     0     0      0     0       0     0      0 70.25098      0      41         0     0 [70,80)
#  2     0     0     0      0     0       0     0      1 78.17896      1      63         1     1 [70,80)
#  3     0     0     0      0     0       0     1      0 46.09198      1      57         1     0 [40,50)
#  4     1     0     0      0     0       0     0      0 75.33197      1      55         0     1 [70,80)
#  5     0     0     0      0     0       0     0      1 67.90997      0      65         1     1 [60,70)
#  6     0     0     0      0     0       0     0      0 86.07794      1     115         0     0 [80,90)
#  7     0     0     0      0     0       0     1      0 54.96799      0      67         0     0 [50,60)
#  8     1     0     0      0     0       0     0      0 43.63898      0     128         0     1 [40,50)
#  9     0     0     0      0     0       0     1      0 18.04199      1      53         0     0 [10,20)
# 10     1     0     0      0     0       0     0      0 48.42398      1      73         1     0 [40,50)
# # ... with 5,725 more rows
 # %>% map(seq_along(.), function(i) {df = .[[i]]; names(df)[1] = names(.)[i]; t(df)})
rhc_mydata.strata_list = rhc_mydata %>% data.strata_list(.vars4strata = c("female", "age.cut"))
rhc_mydata.strata_list %>% str(max.level = 1)
rhc_mydata.strata_list[[1]]
# > rhc_mydata.strata_list %>% str(max.level = 1)
# List of 20
#  $ 0_[10,20)  :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	22 obs. of  15 variables:
#  $ 0_[100,Inf]:Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	1 obs. of  15 variables:
#  $ 0_[20,30)  :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	135 obs. of  15 variables:
#  $ 0_[30,40)  :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	242 obs. of  15 variables:
#  $ 0_[40,50)  :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	404 obs. of  15 variables:
#  $ 0_[50,60)  :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	527 obs. of  15 variables:
#  $ 0_[60,70)  :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	802 obs. of  15 variables:
#  $ 0_[70,80)  :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	757 obs. of  15 variables:
#  $ 0_[80,90)  :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	270 obs. of  15 variables:
#  $ 0_[90,100) :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	32 obs. of  15 variables:
#  $ 1_[10,20)  :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	11 obs. of  15 variables:
#  $ 1_[100,Inf]:Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	2 obs. of  15 variables:
#  $ 1_[20,30)  :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	117 obs. of  15 variables:
#  $ 1_[30,40)  :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	211 obs. of  15 variables:
#  $ 1_[40,50)  :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	282 obs. of  15 variables:
#  $ 1_[50,60)  :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	390 obs. of  15 variables:
#  $ 1_[60,70)  :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	587 obs. of  15 variables:
#  $ 1_[70,80)  :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	581 obs. of  15 variables:
#  $ 1_[80,90)  :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	305 obs. of  15 variables:
#  $ 1_[90,100) :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	57 obs. of  15 variables:
# > rhc_mydata.strata_list[[1]]
# # A tibble: 22 x 15
#      ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut    strata
#    <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>    <fctr>
#  1     0     0     0      0     0       0     0      1 19.67400      0     105         1     1 [10,20) 0_[10,20)
#  2     0     0     0      0     0       0     0      1 19.35100      0      70         0     0 [10,20) 0_[10,20)
#  3     1     0     0      0     0       0     0      0 19.92599      0      41         0     0 [10,20) 0_[10,20)
#  4     1     0     0      0     0       0     0      0 19.79199      0      66         0     0 [10,20) 0_[10,20)
#  5     0     0     0      0     0       0     0      1 19.14899      0     103         0     0 [10,20) 0_[10,20)
#  6     1     0     0      0     0       0     0      0 19.21999      0     128         0     0 [10,20) 0_[10,20)
#  7     0     0     0      0     0       0     0      1 18.84999      0      63         0     0 [10,20) 0_[10,20)
#  8     0     0     0      0     0       0     0      1 18.41499      0      53         0     0 [10,20) 0_[10,20)
#  9     1     0     0      0     0       0     0      0 19.17599      0      62         0     0 [10,20) 0_[10,20)
# 10     1     0     0      0     0       0     0      0 18.16299      0      65         0     1 [10,20) 0_[10,20)
# # ... with 12 more rows

rhc_mydata.strata_list %>% map(function(df) {
    out = df$treatment %>% table %>% as.data.frame %>% column_to_rownames(var = ".")
    parent.x = get(".x", envir = parent.frame())
    attr(out, "parent_name") = names(parent.x)[which(map_lgl(parent.x, function(object) {identical(df, object)}))]
    names(out)[1] = attr(out, "parent_name")
    out = out %>% t %>% as.data.frame %>% rownames_to_column
    out
}) %>% reduce(bind_rows)
# > rhc_mydata.strata_list %>% map(function(df) {
# +     out = df$treatment %>% table %>% as.data.frame %>% column_to_rownames(var = ".")
# +     parent.x = get(".x", envir = parent.frame())
# +     attr(out, "parent_name") = names(parent.x)[which(map_lgl(parent.x, function(object) {identical(df, object)}))]
# +     names(out)[1] = attr(out, "parent_name")
# +     out = out %>% t %>% as.data.frame %>% rownames_to_column
# +     out
# + }) %>% reduce(bind_rows)
#        rowname   0   1
# 1    0_[10,20)  17   5
# 2  0_[100,Inf]  NA   1
# 3    0_[20,30)  85  50
# 4    0_[30,40) 170  72
# 5    0_[40,50) 230 174
# 6    0_[50,60) 309 218
# 7    0_[60,70) 459 343
# 8    0_[70,80) 427 330
# 9    0_[80,90) 190  80
# 10  0_[90,100)  27   5
# 11   1_[10,20)   8   3
# 12 1_[100,Inf]   2  NA
# 13   1_[20,30)  71  46
# 14   1_[30,40) 130  81
# 15   1_[40,50) 173 109
# 16   1_[50,60) 237 153
# 17   1_[60,70) 353 234
# 18   1_[70,80) 382 199
# 19   1_[80,90) 232  73
# 20  1_[90,100)  49   8


# data.tab_strata_exposure.old = function(
#     .mydata
#     , .vars4strata = c("female", "age.cut")
#     , .exposure = "treatment"
# ) {
#     .mydata.strata_list = .mydata %>% data.strata_list(.vars4strata = .vars4strata)
#     out = .mydata.strata_list %>% map(function(df) {
#         out = df[[.exposure]] %>% table %>% as.data.frame %>% column_to_rownames(var = ".")
#         parent.x = get(".x", envir = parent.frame())
#         attr(out, "parent_name") = names(parent.x)[which(map_lgl(parent.x, function(object) {identical(df, object)}))]
#         names(out)[1] = attr(out, "parent_name")
#         out = out %>% t %>% as.data.frame %>% rownames_to_column
#         out
#     }) %>% reduce(bind_rows)
#     out$total = rowSums(out[, 2:3], na.rm = T)
#     out$ratio = out[[2]] / out[[3]] %>% round(3)
#     out$ratio_inv = out[[3]] / out[[2]] %>% round(3)
#     print(paste0("min(ratio, na.rm = T): ", min(out$ratio, na.rm = T)))
#     print(paste0("min(ratio_inv, na.rm = T): ", min(out$ratio_inv, na.rm = T)))
#     out
# }
data.tab_strata_exposure = function(
    .mydata
    , .vars4strata = c("female", "age.cut")
    , .exposure = "treatment"
    , round_digits = 2
) {
    # source("https://github.com/mkim0710/tidystat/raw/master/data.strata_list.Match.source.r")
    if ("strata" %in% names(.mydata)) stop("\"strata\" %in% names(.mydata)")
    .mydata$strata = .mydata[, .vars4strata] %>% apply(MARGIN = 1, FUN = paste, collapse = "_")
    # tmp = table(.mydata$strata, .mydata[[.exposure]]) %>% as.data.frame
    out = table(.mydata$strata, .mydata[[.exposure]]) %>% as.data.frame.matrix %>% rownames_to_column

    out$total = rowSums(out[, 2:3], na.rm = T)
    out$ratio = out[[2]] / out[[3]] 
    out$ratio = out$ratio %>% round(round_digits)
    out$ratio_inv = out[[3]] / out[[2]] 
    out$ratio_inv = out$ratio_inv %>% round(round_digits)
    print(paste0("min(ratio, na.rm = T): ", min(out$ratio, na.rm = T)))
    print(paste0("min(ratio_inv, na.rm = T): ", min(out$ratio_inv, na.rm = T)))
    out
}

rhc_mydata %>% data.tab_strata_exposure(.vars4strata = c("female", "age.cut"), .exposure = "treatment")
# > rhc_mydata %>% data.tab_strata_exposure(.vars4strata = c("female", "age.cut"), .exposure = "treatment")
# [1] "min(ratio, na.rm = T): 0"
# [1] "min(ratio_inv, na.rm = T): 0"
#        rowname   0   1 total ratio ratio_inv
# 1    0_[10,20)  17   5    22  3.40      0.29
# 2  0_[100,Inf]   0   1     1  0.00       Inf
# 3    0_[20,30)  85  50   135  1.70      0.59
# 4    0_[30,40) 170  72   242  2.36      0.42
# 5    0_[40,50) 230 174   404  1.32      0.76
# 6    0_[50,60) 309 218   527  1.42      0.71
# 7    0_[60,70) 459 343   802  1.34      0.75
# 8    0_[70,80) 427 330   757  1.29      0.77
# 9    0_[80,90) 190  80   270  2.38      0.42
# 10  0_[90,100)  27   5    32  5.40      0.19
# 11   1_[10,20)   8   3    11  2.67      0.38
# 12 1_[100,Inf]   2   0     2   Inf      0.00
# 13   1_[20,30)  71  46   117  1.54      0.65
# 14   1_[30,40) 130  81   211  1.60      0.62
# 15   1_[40,50) 173 109   282  1.59      0.63
# 16   1_[50,60) 237 153   390  1.55      0.65
# 17   1_[60,70) 353 234   587  1.51      0.66
# 18   1_[70,80) 382 199   581  1.92      0.52
# 19   1_[80,90) 232  73   305  3.18      0.31
# 20  1_[90,100)  49   8    57  6.12      0.16


data.Match <- function(
    .mydata
    , .vars4Matching = c("female", "income"), .exposure = "treatment", .MatchingRatio = 5, add_tableone_pre_post = T
) {
    # source("https://github.com/mkim0710/tidystat/raw/master/data.strata_list.Match.source.r")
    library(tidyverse)
    library(Matching)
    select = dplyr::select
    library(tableone)
    library(useful)
    
    if (length(unique(.mydata[[.exposure]])) < 2) {
        warning("length(unique(.mydata[[.exposure]]) < 2")
        out = "length(unique(.mydata[[.exposure]]) < 2"
    } else {
        out = list()
        if (add_tableone_pre_post == T) {
            out$tableone_pre = CreateTableOne(vars = .vars4Matching, strata = .exposure, data = .mydata, test=T, includeNA = T)
        }
        
        # Tr.logical = as.logical(.mydata[[.exposure]])
        .X = build.x(~., .mydata[.vars4Matching])
        .mydata.Match = Match(Tr = .mydata[[.exposure]], M = .MatchingRatio, X = .X, replace = FALSE)
        
        tmpDf = .mydata.Match[c("index.treated","index.control")] %>% as.tibble() %>% mutate(MatchingPairID = as.numeric(as.factor(index.treated)))
        tmpDf$MatchingCtrlNum = 1:.MatchingRatio
        # tmpDf
        
        tmpDf2ctrl = tmpDf[,c("index.control", "MatchingPairID", "MatchingCtrlNum")]
        names(tmpDf2ctrl)[1] = "rowname"
        # tmpDf2ctrl
        
        tmpDf2tx = tmpDf[,c("index.treated", "MatchingPairID", "MatchingCtrlNum")]
        tmpDf2tx$MatchingCtrlNum = 0
        names(tmpDf2tx)[1] = "rowname"
        tmpDf2tx = tmpDf2tx %>% distinct()
        # tmpDf2tx
        
        tmpDf3 = union(tmpDf2tx, tmpDf2ctrl)
        tmpDf3$rowname = tmpDf3$rowname %>% as.character()
        # tmpDf3 %>% arrange(MatchingPairID, MatchingCtrlNum)
        
        .mydataMatching = .mydata %>% rownames_to_column() %>% as.tibble()
        .mydataMatching = inner_join(.mydataMatching, tmpDf3, by = "rowname") %>% arrange(MatchingPairID, MatchingCtrlNum)
        # .mydataMatching$MatchingPairID = paste0()
        # .mydataMatching
        out$data = .mydataMatching
        if (add_tableone_pre_post == T) {
            out$tableone_post_total = CreateTableOne(
                vars = .vars4Matching, strata = .exposure
                , data = .mydataMatching
                , test=T
                , includeNA = T)
            out$tableone_post_i = lapply(1:.MatchingRatio, function(i) {
                CreateTableOne(
                    vars = .vars4Matching, strata = .exposure
                    , data = .mydataMatching %>% filter(MatchingCtrlNum %in% c(0,i))
                    , test=T
                    , includeNA = T)
            })
            names(out$tableone_post_i) = paste0("MatchingCtrlNum", "_0_", 1:.MatchingRatio)
        }
    }
    out
}

#@ test) data.Match() rhc_mydata -----
rhc_mydata.Match = rhc_mydata %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
)
rhc_mydata.Match %>% str(max.level = 1)
# > rhc_mydata.Match %>% str(max.level = 1)
# List of 4
#  $ tableone_pre       :List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ data               :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	4260 obs. of  17 variables:
#  $ tableone_post_total:List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ tableone_post_i    :List of 5

rhc_mydata.Match$tableone_pre %>% print(smd = T)
rhc_mydata.Match$tableone_post_total %>% print(smd = T)
rhc_mydata.Match$tableone_post_i$MatchingCtrlNum_0_5 %>% print(smd = T)
rhc_mydata.Match$data
# > rhc_mydata.Match$tableone_pre %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3551          2184                           
#   female (mean (sd))   0.46 (0.50)   0.41 (0.49)   0.001       0.093
#   age (mean (sd))     61.76 (17.29) 60.75 (15.63)  0.026       0.061
#   meanbp1 (mean (sd)) 84.87 (38.87) 68.20 (34.24) <0.001       0.455
# > rhc_mydata.Match$tableone_post_total %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3550           710                           
#   female (mean (sd))   0.46 (0.50)   0.43 (0.49)   0.083       0.071
#   age (mean (sd))     61.77 (17.29) 60.72 (15.53)  0.133       0.064
#   meanbp1 (mean (sd)) 84.82 (38.79) 69.14 (33.79) <0.001       0.431
# > rhc_mydata.Match$tableone_post_i$MatchingCtrlNum_0_5 %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                     710           710                           
#   female (mean (sd))   0.46 (0.50)   0.43 (0.49)   0.200       0.068
#   age (mean (sd))     61.79 (17.17) 60.72 (15.53)  0.216       0.066
#   meanbp1 (mean (sd)) 84.94 (38.99) 69.14 (33.79) <0.001       0.433
# > rhc_mydata.Match$data
# # A tibble: 4,260 x 17
#    rowname   ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut MatchingPairID MatchingCtrlNum
#      <chr> <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>          <dbl>           <dbl>
#  1       2     0     0     0      0     0       0     0      1 78.17896      1      63         1     1 [70,80)              1               0
#  2    1041     1     0     0      0     0       0     0      0 78.91895      1      62         0     1 [70,80)              1               1
#  3    1871     0     0     0      0     1       0     0      0 77.32495      1      63         0     0 [70,80)              1               2
#  4    2288     1     0     0      0     0       0     0      0 77.46698      1      61         0     1 [70,80)              1               3
#  5    3765     0     0     0      0     1       0     0      0 77.55499      1      62         0     1 [70,80)              1               4
#  6    4800     0     0     0      0     0       0     0      0 76.98798      1      63         0     0 [70,80)              1               5
#  7       3     0     0     0      0     0       0     1      0 46.09198      1      57         1     0 [40,50)              2               0
#  8    1993     0     0     0      0     0       0     0      1 45.43698      1      55         0     0 [40,50)              2               1
#  9    3043     0     0     0      0     0       0     0      1 45.02698      1      57         0     0 [40,50)              2               2
# 10    3887     1     0     0      0     0       0     0      0 47.93399      1      58         0     0 [40,50)              2               3
# # ... with 4,250 more rows

#@ test) data.Match() rhc_mydata.strata_list -----
rhc_mydata.strata_list.Match.old = rhc_mydata.strata_list %>% 
    map(data.Match
        , .vars4Matching = c("age","meanbp1")
        , .exposure = "treatment"
        , .MatchingRatio = 5
    )
# > rhc_mydata.strata_list.Match.old = rhc_mydata.strata_list %>% 
# +     map(data.Match
# +         , .vars4Matching = c("age","meanbp1")
# +         , .exposure = "treatment"
# +         , .MatchingRatio = 5
# +     )
# Warning messages:
# 1: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# 2: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
rhc_mydata.strata_list.Match.old %>% str(max.level = 1)
# > rhc_mydata.strata_list.Match.old %>% str(max.level = 1)
# List of 20
#  $ 0_[10,20)  :List of 4
#  $ 0_[100,Inf]: chr "length(unique(.mydata[[.exposure]]) < 2"
#  $ 0_[20,30)  :List of 4
#  $ 0_[30,40)  :List of 4
#  $ 0_[40,50)  :List of 4
#  $ 0_[50,60)  :List of 4
#  $ 0_[60,70)  :List of 4
#  $ 0_[70,80)  :List of 4
#  $ 0_[80,90)  :List of 4
#  $ 0_[90,100) :List of 4
#  $ 1_[10,20)  :List of 4
#  $ 1_[100,Inf]: chr "length(unique(.mydata[[.exposure]]) < 2"
#  $ 1_[20,30)  :List of 4
#  $ 1_[30,40)  :List of 4
#  $ 1_[40,50)  :List of 4
#  $ 1_[50,60)  :List of 4
#  $ 1_[60,70)  :List of 4
#  $ 1_[70,80)  :List of 4
#  $ 1_[80,90)  :List of 4
#  $ 1_[90,100) :List of 4
rhc_mydata.strata_list.Match.old$`0_[60,70)`$tableone_pre %>% print(smd = T)
rhc_mydata.strata_list.Match.old$`0_[60,70)`$tableone_post_total %>% print(smd = T)
rhc_mydata.strata_list.Match.old$`0_[60,70)`$tableone_post_i$MatchingCtrlNum_0_5 %>% print(smd = T)
rhc_mydata.strata_list.Match.old$`0_[60,70)`$data
# > rhc_mydata.strata_list.Match.old$`0_[60,70)`$tableone_pre %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                     459           343                           
#   age (mean (sd))     65.16 (2.91)  64.97 (2.87)   0.346       0.067
#   meanbp1 (mean (sd)) 85.39 (38.10) 68.43 (36.41) <0.001       0.455
# > rhc_mydata.strata_list.Match.old$`0_[60,70)`$tableone_post_total %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                     455            91                           
#   age (mean (sd))     65.15 (2.90)  65.29 (2.73)   0.676       0.049
#   meanbp1 (mean (sd)) 84.64 (37.36) 69.77 (33.90) <0.001       0.417
# > rhc_mydata.strata_list.Match.old$`0_[60,70)`$tableone_post_i$MatchingCtrlNum_0_5 %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                      91            91                           
#   age (mean (sd))     65.24 (2.88)  65.29 (2.73)   0.909       0.017
#   meanbp1 (mean (sd)) 85.51 (37.50) 69.77 (33.90)  0.003       0.440
# > rhc_mydata.strata_list.Match.old$`0_[60,70)`$data
# # A tibble: 546 x 18
#    rowname   ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut    strata MatchingPairID MatchingCtrlNum
#      <chr> <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>    <fctr>          <dbl>           <dbl>
#  1       1     0     0     0      0     0       0     0      1 67.90997      0      65         1     1 [60,70) 0_[60,70)              1               0
#  2      36     0     1     0      0     0       0     0      0 67.89294      0      66         0     0 [60,70) 0_[60,70)              1               1
#  3     517     1     0     0      0     0       0     0      0 67.89600      0      65         0     1 [60,70) 0_[60,70)              1               2
#  4     538     1     0     0      0     0       0     0      0 67.96997      0      67         0     1 [60,70) 0_[60,70)              1               3
#  5     676     0     0     0      0     0       0     0      0 68.02496      0      63         0     1 [60,70) 0_[60,70)              1               4
#  6     731     0     0     0      0     0       0     1      0 67.79700      0      65         0     1 [60,70) 0_[60,70)              1               5
#  7       2     1     0     0      0     0       0     0      0 68.34796      0      50         1     0 [60,70) 0_[60,70)              2               0
#  8     166     0     0     1      0     0       0     0      0 68.07397      0      53         0     1 [60,70) 0_[60,70)              2               1
#  9     220     0     0     0      0     0       0     0      1 68.51196      0      52         0     1 [60,70) 0_[60,70)              2               2
# 10     227     0     0     0      0     0       0     1      0 68.23297      0      47         0     1 [60,70) 0_[60,70)              2               3
# # ... with 536 more rows


data.stratified.Match = function(
    .mydata
    , .vars4strata = c("female", "age.cut")
    , .vars4Matching = c("age", "income"), .exposure = "treatment", .MatchingRatio = 5
) {
    # source("https://github.com/mkim0710/tidystat/raw/master/data.strata_list.Match.source.r")
    if (!is.data.frame(.mydata)) stop("!is.data.frame(.mydata)")
    .mydata.strata_list = data.strata_list(.mydata = .mydata, .vars4strata = .vars4strata)
    .mydata.strata_list.Match = .mydata.strata_list %>% 
        map(data.Match
            , .vars4Matching = .vars4Matching
            , .exposure = .exposure
            , .MatchingRatio = .MatchingRatio
            , add_tableone_pre_post = F
        )
    out = list()
    out$tableone_pre = CreateTableOne(vars = c(.vars4strata, .vars4Matching), strata = .exposure, data = .mydata, test=T, includeNA = T)
    warning_which = names(.mydata.strata_list.Match)[which(map_chr(.mydata.strata_list.Match, class) == "character")]
    out$data = .mydata.strata_list.Match %>% 
        map(function(object) {
            if (is.character(object)) {
                object = NULL
            }
            object
        }) %>% map(function(x) x$data) %>% reduce(rbind)
    if (length(warning_which) > 0) {
        # warning(paste0("length(unique(.mydata[[.exposure]]) < 2",": \n", paste0(warning_which, collapse = ", ")))
        # warning(paste0("length(unique(.mydata[[.exposure]]) < 2",": \n", dput(warning_which)))
        warning(paste0("length(unique(.mydata[[.exposure]]) < 2",": \n", deparse(warning_which)))
    }
    out$tableone_post_total = CreateTableOne(
        vars = c(.vars4strata, .vars4Matching), strata = .exposure
        , data = out$data
        , test=T
        , includeNA = T)
    out$tableone_post_i = lapply(1:.MatchingRatio, function(i) {
        CreateTableOne(
            vars = c(.vars4strata, .vars4Matching), strata = .exposure
            , data = out$data %>% filter(MatchingCtrlNum %in% c(0,i))
            , test=T
            , includeNA = T)
    })
    names(out$tableone_post_i) = paste0("MatchingCtrlNum", "_0_", 1:.MatchingRatio)
    out
}

#@ test) data.stratified.Match() -----
load(url("https://github.com/mkim0710/tidystat/raw/master/rhc_mydata.rda"))
rhc_mydata$age.cut = rhc_mydata$age %>% cut(breaks = c(0, 10 * 1:10, Inf), include.lowest = T, right = F)
rhc_mydata.stratified.Match = rhc_mydata %>% data.stratified.Match(
    .vars4strata = c("female", "age.cut")
    , .vars4Matching = c("age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
)
# > rhc_mydata.stratified.Match = rhc_mydata %>% data.stratified.Match(
# +     .vars4strata = c("female", "age.cut")
# +     , .vars4Matching = c("age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# + )
# Warning messages:
# 1: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# 2: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# 3: In data.stratified.Match(., .vars4strata = c("female", "age.cut"),  :
#   length(unique(.mydata[[.exposure]]) < 2: 
# c("0_[100,Inf]", "1_[100,Inf]")

rhc_mydata.Match %>% str(max.level = 1)
rhc_mydata.stratified.Match %>% str(max.level = 1)
# > rhc_mydata.Match %>% str(max.level = 1)
# List of 4
#  $ tableone_pre       :List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ data               :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	4260 obs. of  17 variables:
#  $ tableone_post_total:List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ tableone_post_i    :List of 5
# > rhc_mydata.stratified.Match %>% str(max.level = 1)
# List of 4
#  $ tableone_pre       :List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ data               :Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	4212 obs. of  18 variables:
#  $ tableone_post_total:List of 3
#   ..- attr(*, "class")= chr "TableOne"
#  $ tableone_post_i    :List of 5
4260 - 4212
# > 4260 - 4212
# [1] 48
rhc_mydata.stratified.Match$tableone_pre %>% print(smd = T)
rhc_mydata.stratified.Match$tableone_post_total %>% print(smd = T)
rhc_mydata.stratified.Match$tableone_post_i$MatchingCtrlNum_0_5 %>% print(smd = T)
rhc_mydata.stratified.Match$data
# > rhc_mydata.stratified.Match$tableone_pre %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3551          2184                           
#   female (mean (sd))   0.46 (0.50)   0.41 (0.49)   0.001       0.093
#   age.cut (%)                                      NaN         0.241
#      [0,10)               0 ( 0.0)      0 ( 0.0)                    
#      [10,20)             25 ( 0.7)      8 ( 0.4)                    
#      [20,30)            156 ( 4.4)     96 ( 4.4)                    
#      [30,40)            300 ( 8.4)    153 ( 7.0)                    
#      [40,50)            403 (11.3)    283 (13.0)                    
#      [50,60)            546 (15.4)    371 (17.0)                    
#      [60,70)            812 (22.9)    577 (26.4)                    
#      [70,80)            809 (22.8)    529 (24.2)                    
#      [80,90)            422 (11.9)    153 ( 7.0)                    
#      [90,100)            76 ( 2.1)     13 ( 0.6)                    
#      [100,Inf]            2 ( 0.1)      1 ( 0.0)                    
#   age (mean (sd))     61.76 (17.29) 60.75 (15.63)  0.026       0.061
#   meanbp1 (mean (sd)) 84.87 (38.87) 68.20 (34.24) <0.001       0.455
# > rhc_mydata.stratified.Match$tableone_post_total %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3510           702                           
#   female (mean (sd))   0.46 (0.50)   0.46 (0.50)   1.000      <0.001
#   age.cut (%)                                      NaN        <0.001
#      [0,10)               0 ( 0.0)      0 ( 0.0)                    
#      [10,20)             20 ( 0.6)      4 ( 0.6)                    
#      [20,30)            155 ( 4.4)     31 ( 4.4)                    
#      [30,40)            300 ( 8.5)     60 ( 8.5)                    
#      [40,50)            400 (11.4)     80 (11.4)                    
#      [50,60)            540 (15.4)    108 (15.4)                    
#      [60,70)            805 (22.9)    161 (22.9)                    
#      [70,80)            805 (22.9)    161 (22.9)                    
#      [80,90)            420 (12.0)     84 (12.0)                    
#      [90,100)            65 ( 1.9)     13 ( 1.9)                    
#      [100,Inf]            0 ( 0.0)      0 ( 0.0)                    
#   age (mean (sd))     61.69 (17.15) 61.79 (16.94)  0.896       0.005
#   meanbp1 (mean (sd)) 84.29 (38.28) 67.72 (33.91) <0.001       0.458
# > rhc_mydata.stratified.Match$tableone_post_i$MatchingCtrlNum_0_5 %>% print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                     702           702                           
#   female (mean (sd))   0.46 (0.50)   0.46 (0.50)   1.000      <0.001
#   age.cut (%)                                      NaN        <0.001
#      [0,10)               0 ( 0.0)      0 ( 0.0)                    
#      [10,20)              4 ( 0.6)      4 ( 0.6)                    
#      [20,30)             31 ( 4.4)     31 ( 4.4)                    
#      [30,40)             60 ( 8.5)     60 ( 8.5)                    
#      [40,50)             80 (11.4)     80 (11.4)                    
#      [50,60)            108 (15.4)    108 (15.4)                    
#      [60,70)            161 (22.9)    161 (22.9)                    
#      [70,80)            161 (22.9)    161 (22.9)                    
#      [80,90)             84 (12.0)     84 (12.0)                    
#      [90,100)            13 ( 1.9)     13 ( 1.9)                    
#      [100,Inf]            0 ( 0.0)      0 ( 0.0)                    
#   age (mean (sd))     61.71 (17.14) 61.79 (16.94)  0.931       0.005
#   meanbp1 (mean (sd)) 84.69 (38.18) 67.72 (33.91) <0.001       0.470
# > rhc_mydata.stratified.Match$data
# # A tibble: 4,212 x 18
#    rowname   ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut    strata MatchingPairID MatchingCtrlNum
#      <chr> <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>    <fctr>          <dbl>           <dbl>
#  1       1     0     0     0      0     0       0     0      1 19.67400      0     105         1     1 [10,20) 0_[10,20)              1               0
#  2       2     0     0     0      0     0       0     0      1 19.35100      0      70         0     0 [10,20) 0_[10,20)              1               1
#  3       4     1     0     0      0     0       0     0      0 19.79199      0      66         0     0 [10,20) 0_[10,20)              1               2
#  4       5     0     0     0      0     0       0     0      1 19.14899      0     103         0     0 [10,20) 0_[10,20)              1               3
#  5       6     1     0     0      0     0       0     0      0 19.21999      0     128         0     0 [10,20) 0_[10,20)              1               4
#  6      18     0     0     0      0     0       0     1      0 18.94600      0     112         0     1 [10,20) 0_[10,20)              1               5
#  7      15     0     0     0      0     0       0     0      1 19.85199      0      63         1     1 [10,20) 0_[10,20)              2               0
#  8       3     1     0     0      0     0       0     0      0 19.92599      0      41         0     0 [10,20) 0_[10,20)              2               1
#  9       9     1     0     0      0     0       0     0      0 19.17599      0      62         0     0 [10,20) 0_[10,20)              2               2
# 10      13     1     0     0      0     0       0     0      0 19.70999      0      55         0     1 [10,20) 0_[10,20)              2               3
# # ... with 4,202 more rows




#@ end -----
