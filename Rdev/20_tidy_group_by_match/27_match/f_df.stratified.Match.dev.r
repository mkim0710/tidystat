# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/R/data.stratfied.Match.dev.r")





# #@ function.11matching.by.factors() -----  
# function.11matching.by.factors = function(data, varname4MatchingUpon = "diabetes", varnames4MatchingBy = c("age", "sex"), seed = 1) {
#     .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
#     if ("RowNum_original" %in% names(data)) {
#         warning('"RowNum_original" %in% names(data)')
#     } else {
#         data$RowNum_original = 1:nrow(data)
#     }
#     set.seed(seed)
#     data$runif = runif(nrow(data))
#     data[varnames4MatchingBy] = data[varnames4MatchingBy] %>% map_df(as.factor)
#     data$MatchingGroupID = data[varnames4MatchingBy] %>% apply(1, paste0, collapse = "_") |> as.factor()
#     data = data %>% arrange(MatchingGroupID, desc(!!rlang::sym(varname4MatchingUpon)), runif) |> as_tibble()
#     data.nest = data %>% group_by(MatchingGroupID) %>% nest
#     rm(data)
#     data.nest = data.nest %>% mutate(data = map2(data, MatchingGroupID, function(df, byVar) {
#         minMatch = (df[[varname4MatchingUpon]] |> table() %>% min)
#         # if(minMatch == 0) {
#         if(length(unique(df[[varname4MatchingUpon]])) < 2) {
#             out = df[0, ]
#         } else {
#             # df[[varname4MatchingUpon]] = df[[varname4MatchingUpon]] |> as.factor()
#             out = df[0, ]
#             # for (i in levels(df[[varname4MatchingUpon]])) {
#             for (i in unique(df[[varname4MatchingUpon]])) {
#                 out = out %>% rbind(df[df[[varname4MatchingUpon]] == i, ][1:minMatch, ])
#             }
#             # out$MatchingPairID = paste(out$MatchingGroupID, 1:minMatch, sep = "_")
#             out$MatchingPairID = paste(as.character(byVar), 1:minMatch, sep = "_")
#         }
#         out
#     }))
#     data = data.nest %>% unnest
#     data
# }
# 
# load(url("https://raw.githubusercontent.com/mkim0710/tidystat/master/data/framingham_baseline_2018.rda"))
# framingham_baseline_2018 %>% function.11matching.by.factors %>% select(RowNum_original, age, sex, diabetes, runif, MatchingGroupID, MatchingPairID) %>% dplyr::filter(age == "55")
# # > framingham_baseline_2018 %>% function.11matching.by.factors %>% select(RowNum_original, age, sex, diabetes, runif, MatchingGroupID, MatchingPairID) %>% dplyr::filter(age == "55")
# # # A tibble: 10 x 7
# #    RowNum_original age   sex   diabetes   runif MatchingGroupID MatchingPairID
# #              <int> <fct> <fct>    <dbl>   <dbl> <fct>           <chr>         
# #  1            1359 55    1            1 0.159   55_1            55_1_1        
# #  2            1422 55    1            1 0.681   55_1            55_1_2        
# #  3            1996 55    1            1 0.775   55_1            55_1_3        
# #  4            3811 55    1            0 0.00427 55_1            55_1_1        
# #  5            4336 55    1            0 0.0539  55_1            55_1_2        
# #  6            3333 55    1            0 0.0742  55_1            55_1_3        
# #  7            2914 55    2            1 0.168   55_2            55_2_1        
# #  8            3136 55    2            1 0.298   55_2            55_2_2        
# #  9            3709 55    2            0 0.0132  55_2            55_2_1        
# # 10            3780 55    2            0 0.0204  55_2            55_2_2        
# 
# 
# framingham_baseline_2018 %>% function.11matching.by.factors %>% select(RowNum_original, age, sex, diabetes, runif, MatchingGroupID, MatchingPairID)
# # > framingham_baseline_2018 %>% function.11matching.by.factors %>% select(RowNum_original, age, sex, diabetes, runif, MatchingGroupID, MatchingPairID)
# # # A tibble: 242 x 7
# #    RowNum_original age   sex   diabetes   runif MatchingGroupID MatchingPairID
# #              <int> <fct> <fct>    <dbl>   <dbl> <fct>           <chr>         
# #  1            1293 36    2            1 0.802   36_2            36_2_1        
# #  2            4268 36    2            0 0.0363  36_2            36_2_1        
# #  3            2323 39    1            1 0.808   39_1            39_1_1        
# #  4            3585 39    1            0 0.00553 39_1            39_1_1        
# #  5            2201 39    2            1 0.596   39_2            39_2_1        
# #  6            2255 39    2            0 0.00672 39_2            39_2_1        
# #  7             260 40    2            1 0.935   40_2            40_2_1        
# #  8            3065 40    2            0 0.00148 40_2            40_2_1        
# #  9            4247 41    1            1 0.709   41_1            41_1_1        
# # 10            1097 41    1            0 0.0138  41_1            41_1_1        
# # # ... with 232 more rows







# data.tab_strata_exposure.old = function(
#     .mydata
#     , .vars4strata = c("female", "age.cut")
#     , .exposure = "treatment"
# ) {
#     .mydata.strata_list = .mydata %>% data.strata_list(.vars4strata = .vars4strata)
#     out = .mydata.strata_list %>% map(function(df) {
#         out = df[[.exposure]] |> table() |> as.data.frame() %>% column_to_rownames(var = ".")
#         parent.x = get(".x", envir = parent.frame())
#         attr(out, "parent_name") = names(parent.x)[which(map_lgl(parent.x, function(.object) {identical(df, .object)}))]
#         names(out)[1] = attr(out, "parent_name")
#         out = out %>% t |> as.data.frame() |> rownames_to_column()
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
    , paste.collapse = "_"
) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/R/data.stratfied.Match.dev.r")
    
    if ("strata" %in% names(.mydata)) stop("\"strata\" %in% names(.mydata)")
    .mydata$strata = .mydata[, .vars4strata] %>% apply(MARGIN = 1, FUN = paste, collapse = paste.collapse)
    # tmp = table(.mydata$strata, .mydata[[.exposure]]) |> as.data.frame()
    # out = table(.mydata$strata, .mydata[[.exposure]]) %>% as.data.frame.matrix |> rownames_to_column()
    out = table(.mydata$strata, .mydata[[.exposure]]) |> addmargins() %>% as.data.frame.matrix |> rownames_to_column()
    
    # out$total = rowSums(out[, 2:3], na.rm = T)
    out$ratio = out[[2]] / out[[3]] 
    out$ratio = out$ratio %>% round(round_digits)
    out$ratio_inv = out[[3]] / out[[2]] 
    out$ratio_inv = out$ratio_inv %>% round(round_digits)
    print(paste0("min(ratio, na.rm = T): ", min(out$ratio, na.rm = T)))
    print(paste0("min(ratio_inv, na.rm = T): ", min(out$ratio_inv, na.rm = T)))
    out
}

## @ test) data.tab_strata_exposure() rhc_mydata.rda -----  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
load(url("https://raw.githubusercontent.com/mkim0710/tidystat/master/data/rhc_mydata.rda"))
rhc_mydata$age.cut = rhc_mydata$age %>% cut(breaks = c(0, 10 * 1:10, Inf), include.lowest = T, right = F)
rhc_mydata %>% data.tab_strata_exposure(.vars4strata = c("female", "age.cut"), .exposure = "treatment")
# > rhc_mydata %>% data.tab_strata_exposure(.vars4strata = c("female", "age.cut"), .exposure = "treatment")
# [1] "min(ratio, na.rm = T): 0"
# [1] "min(ratio_inv, na.rm = T): 0"
#        rowname    0    1  Sum ratio ratio_inv
# 1    0_[10,20)   17    5   22  3.40      0.29
# 2  0_[100,Inf]    0    1    1  0.00       Inf
# 3    0_[20,30)   85   50  135  1.70      0.59
# 4    0_[30,40)  170   72  242  2.36      0.42
# 5    0_[40,50)  230  174  404  1.32      0.76
# 6    0_[50,60)  309  218  527  1.42      0.71
# 7    0_[60,70)  459  343  802  1.34      0.75
# 8    0_[70,80)  427  330  757  1.29      0.77
# 9    0_[80,90)  190   80  270  2.38      0.42
# 10  0_[90,100)   27    5   32  5.40      0.19
# 11   1_[10,20)    8    3   11  2.67      0.38
# 12 1_[100,Inf]    2    0    2   Inf      0.00
# 13   1_[20,30)   71   46  117  1.54      0.65
# 14   1_[30,40)  130   81  211  1.60      0.62
# 15   1_[40,50)  173  109  282  1.59      0.63
# 16   1_[50,60)  237  153  390  1.55      0.65
# 17   1_[60,70)  353  234  587  1.51      0.66
# 18   1_[70,80)  382  199  581  1.92      0.52
# 19   1_[80,90)  232   73  305  3.18      0.31
# 20  1_[90,100)   49    8   57  6.12      0.16
# 21         Sum 3551 2184 5735  1.63      0.62





## @ data.tab_strata_exposure() check minimum matching ratio -----  
analyticDF_C24.drop_pmhx_negativetime.list$`_5yr` %>% data.tab_strata_exposure(.vars4strata = c("SEX", "AGE_group"), .exposure = "evnttrth_C24_r") |> summary() #----
analyticDF_C24.drop_pmhx_negativetime.list$`_5yr` %>% data.tab_strata_exposure(.vars4strata = c("SEX", "AGE_group", "Socioeconomic"), .exposure = "evnttrth_C24_r") |> summary() #----
analyticDF_C24.drop_pmhx_negativetime.list$`_5yr` %>% data.tab_strata_exposure(.vars4strata = c("SEX", "AGE_group", "Socioeconomic", "Disability"), .exposure = "evnttrth_C24_r") |> summary() #----
# > analyticDF_C24.drop_pmhx_negativetime.list$`_5yr` %>% data.tab_strata_exposure(.vars4strata = c("SEX", "AGE_group"), .exposure = "evnttrth_C24_r") |> summary() #----  
# [1] "min(ratio, na.rm = T): 159.39"
# [1] "min(ratio_inv, na.rm = T): 0"
#    rowname               0                  1                 Sum                ratio          ratio_inv       
#  Length:9           Length:9           Length:9           Length:9           Min.   : 159.4   Min.   :0.000000  
#  Class :character   Class :AsIs        Class :AsIs        Class :character   1st Qu.: 325.0   1st Qu.:0.000000  
#  Mode  :character   Mode  :character   Mode  :character   Mode  :character   Median : 669.6   Median :0.000000  
#                                                                              Mean   :1082.2   Mean   :0.001111  
#                                                                              3rd Qu.:1032.9   3rd Qu.:0.000000  
#                                                                              Max.   :3914.7   Max.   :0.010000  
# > analyticDF_C24.drop_pmhx_negativetime.list$`_5yr` %>% data.tab_strata_exposure(.vars4strata = c("SEX", "AGE_group", "Socioeconomic"), .exposure = "evnttrth_C24_r") |> summary() #----  
# [1] "min(ratio, na.rm = T): 127.16"
# [1] "min(ratio_inv, na.rm = T): 0"
#    rowname               0                  1                 Sum                ratio          ratio_inv       
#  Length:33          Length:33          Length:33          Length:33          Min.   : 127.2   Min.   :0.000000  
#  Class :character   Class :AsIs        Class :AsIs        Class :character   1st Qu.: 296.2   1st Qu.:0.000000  
#  Mode  :character   Mode  :character   Mode  :character   Mode  :character   Median : 534.6   Median :0.000000  
#                                                                              Mean   :1252.4   Mean   :0.001212  
#                                                                              3rd Qu.:1343.0   3rd Qu.:0.000000  
#                                                                              Max.   :8298.7   Max.   :0.010000  
# > analyticDF_C24.drop_pmhx_negativetime.list$`_5yr` %>% data.tab_strata_exposure(.vars4strata = c("SEX", "AGE_group", "Socioeconomic", "Disability"), .exposure = "evnttrth_C24_r") |> summary() #----  
# [1] "min(ratio, na.rm = T): 9"
# [1] "min(ratio_inv, na.rm = T): 0"
#    rowname               0                  1                 Sum                ratio         ratio_inv       
#  Length:97          Length:97          Length:97          Length:97          Min.   :  9.0   Min.   :0.000000  
#  Class :character   Class :AsIs        Class :AsIs        Class :character   1st Qu.:600.2   1st Qu.:0.000000  
#  Mode  :character   Mode  :character   Mode  :character   Mode  :character   Median :  Inf   Median :0.000000  
#                                                                              Mean   :  Inf   Mean   :0.003196  
#                                                                              3rd Qu.:  Inf   3rd Qu.:0.000000  
#                                                                              Max.   :  Inf   Max.   :0.110000  







## @ -----  
data.strata_list = function(
    .mydata
    , .vars4strata = c("female", "age.cut")
    , paste.collapse = "_"
) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/R/data.stratfied.Match.dev.r")
    if ("strata" %in% names(.mydata)) stop("\"strata\" %in% names(.mydata)")
    .mydata$strata = .mydata[, .vars4strata] %>% apply(MARGIN = 1, FUN = paste, collapse = paste.collapse)
    .mydata$strata = .mydata$strata |> as.factor()
    out = map(
        levels(.mydata$strata)
        , function(chr) {
            out2 = .mydata %>% dplyr::filter(strata == !!chr) |> as_tibble()
            # attr(out2, ".vars4strata") = .vars4strata
            out2
        }
    )
    names(out) = levels(.mydata$strata)
    attr(out, ".vars4strata") = .vars4strata
    attr(out, "function.input") = list(
        data.strata_list = data.strata_list
        , .vars4strata = .vars4strata
    ) # list inside attr() is not shown with str(max.level = 1)
    out
}


## @ test) data.strata_list() rhc_mydata.rda -----  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
load(url("https://raw.githubusercontent.com/mkim0710/tidystat/master/data/rhc_mydata.rda"))
rhc_mydata$age.cut = rhc_mydata$age %>% cut(breaks = c(0, 10 * 1:10, Inf), include.lowest = T, right = F)
rhc_mydata |> as_tibble()
# > rhc_mydata |> as_tibble()
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
rhc_mydata.strata_list |> str(max.level = 1)
rhc_mydata.strata_list[[1]]
# > rhc_mydata.strata_list |> str(max.level = 1)
# List of 20
#  $ 0_[10,20)  :Classes ??tbl_df??, ??tbl?? and 'data.frame':	22 obs. of  15 variables:
#  $ 0_[100,Inf]:Classes ??tbl_df??, ??tbl?? and 'data.frame':	1 obs. of  15 variables:
#  $ 0_[20,30)  :Classes ??tbl_df??, ??tbl?? and 'data.frame':	135 obs. of  15 variables:
#  $ 0_[30,40)  :Classes ??tbl_df??, ??tbl?? and 'data.frame':	242 obs. of  15 variables:
#  $ 0_[40,50)  :Classes ??tbl_df??, ??tbl?? and 'data.frame':	404 obs. of  15 variables:
#  $ 0_[50,60)  :Classes ??tbl_df??, ??tbl?? and 'data.frame':	527 obs. of  15 variables:
#  $ 0_[60,70)  :Classes ??tbl_df??, ??tbl?? and 'data.frame':	802 obs. of  15 variables:
#  $ 0_[70,80)  :Classes ??tbl_df??, ??tbl?? and 'data.frame':	757 obs. of  15 variables:
#  $ 0_[80,90)  :Classes ??tbl_df??, ??tbl?? and 'data.frame':	270 obs. of  15 variables:
#  $ 0_[90,100) :Classes ??tbl_df??, ??tbl?? and 'data.frame':	32 obs. of  15 variables:
#  $ 1_[10,20)  :Classes ??tbl_df??, ??tbl?? and 'data.frame':	11 obs. of  15 variables:
#  $ 1_[100,Inf]:Classes ??tbl_df??, ??tbl?? and 'data.frame':	2 obs. of  15 variables:
#  $ 1_[20,30)  :Classes ??tbl_df??, ??tbl?? and 'data.frame':	117 obs. of  15 variables:
#  $ 1_[30,40)  :Classes ??tbl_df??, ??tbl?? and 'data.frame':	211 obs. of  15 variables:
#  $ 1_[40,50)  :Classes ??tbl_df??, ??tbl?? and 'data.frame':	282 obs. of  15 variables:
#  $ 1_[50,60)  :Classes ??tbl_df??, ??tbl?? and 'data.frame':	390 obs. of  15 variables:
#  $ 1_[60,70)  :Classes ??tbl_df??, ??tbl?? and 'data.frame':	587 obs. of  15 variables:
#  $ 1_[70,80)  :Classes ??tbl_df??, ??tbl?? and 'data.frame':	581 obs. of  15 variables:
#  $ 1_[80,90)  :Classes ??tbl_df??, ??tbl?? and 'data.frame':	305 obs. of  15 variables:
#  $ 1_[90,100) :Classes ??tbl_df??, ??tbl?? and 'data.frame':	57 obs. of  15 variables:
#  - attr(*, ".vars4strata")= chr [1:2] "female" "age.cut"
#  - attr(*, "function.input")=List of 2
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
    out = df$treatment |> table() |> as.data.frame() %>% column_to_rownames(var = ".")
    parent.x = get(".x", envir = parent.frame())
    attr(out, "parent_name") = names(parent.x)[which(map_lgl(parent.x, function(.object) {identical(df, .object)}))]
    names(out)[1] = attr(out, "parent_name")
    out = out %>% t |> as.data.frame() |> rownames_to_column()
    out
}) %>% reduce(bind_rows)
# > rhc_mydata.strata_list %>% map(function(df) {
# +     out = df$treatment |> table() |> as.data.frame() %>% column_to_rownames(var = ".")
# +     parent.x = get(".x", envir = parent.frame())
# +     attr(out, "parent_name") = names(parent.x)[which(map_lgl(parent.x, function(.object) {identical(df, .object)}))]
# +     names(out)[1] = attr(out, "parent_name")
# +     out = out %>% t |> as.data.frame() |> rownames_to_column()
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

data.Match = function(
    .mydata
    , ...
    , .vars4Matching = c("female", "income")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , caliper = NULL
    , Weight_covariates = c("InverseVariance", "MahalanobisDistance", "WeightMatrix")[1]
    , add_Table1_pre_post = T
    , RowNum_original_before_strata = NULL
    , apply.na.omit = F
    , print.process = F
    , load.dependent.library = T
    , propensity_score_matching = F
    , propensity_score_matching_weight = F
    , apply.function.dichotomous2logical = F
) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/R/data.stratfied.Match.dev.r")
    if (load.dependent.library == T) {
        .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
        .packagename = "Matching"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
        .packagename = "tableone"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
        # .packagename = "useful"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    }
    select = dplyr::select
    .mydata$RowNum_original = 1:nrow(.mydata)
    
    # if (exists(Weight)) {
    #     stop("Weight argument deprecated : use Weight_covariates = c(\"InverseVariance\", \"MahalanobisDistance\", \"WeightMatrix\")[1]")
    # }  # Error - .object 'Weight' not found -> argument Weight is matched to Weight_covariates if the argument is placed before ...
    Call <- match.call(expand.dots = TRUE)
    for (argname in c("Weight")) {
        if (!is.null(Call[[argname]])) {
            # warning(gettextf("attempt to set '%s' ignored", argname), domain = NA)
            # print(paste0( "warning) Weight argument deprecated : use Weight_covariates = ", deparse(c("InverseVariance", "MahalanobisDistance", "WeightMatrix"), width.cutoff=500), "[1]" ))
            cat(paste0( "* warning) Weight argument deprecated : use Weight_covariates = ", deparse(c("InverseVariance", "MahalanobisDistance", "WeightMatrix"), width.cutoff=500), "[1]", "\n" ))
        }
    }
    
    if (!Weight_covariates %in% c("InverseVariance", "MahalanobisDistance", "WeightMatrix")) {
        cat(paste0( "!Weight_covariates %in% ", deparse(c("InverseVariance", "MahalanobisDistance", "WeightMatrix")), "\n" ))
    }
    Weight = which(Weight_covariates == c("InverseVariance", "MahalanobisDistance", "WeightMatrix"))
    
    if (print.process == T & propensity_score_matching == F & propensity_score_matching_weight == F) { # distance based matching
        cat(paste0( "* Distance-based matching - Weight_covariates : ", Weight_covariates, "\n" ))
        # print(paste0("Weight : ", Weight))
    }
    
    function.dichotomous2logical = function(x, dichotomous2integer = F) {
        # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.dichotomous2logical.dev.r")
        # caution) as.numeric(CategoricalVariable_3MoreLevels)
        if (is.numeric(x)) {
            x = as.character(x)
        } 
        if (is.character(x)) {
            x = as.factor(x)
        }
        # if (length(levels(x)) == 1) {
        #     warning("length(levels(x)) == 1")
        # }
        if (length(unique(x)) == 1) {
            warning("length(unique(x)) == 1")
        }
        if (!is.null(levels(x))) {
            if (length(levels(x)) %in% 1:2) {
                if (dichotomous2integer == T) {
                    warning(paste0(ifelse(is.null(levels(x)[1]), "NULL", levels(x)[1]), " is coded to 0 & ", ifelse(is.null(levels(x)[2]), "NULL", levels(x)[2]), " is coded to 1"))
                } else {
                    warning(paste0(ifelse(is.null(levels(x)[1]), "NULL", levels(x)[1]), " is coded to FALSE & ", ifelse(is.null(levels(x)[2]), "NULL", levels(x)[2]), " is coded to TRUE"))
                }
                x = as.integer(x) - 1
            } else if (length(levels(x)) > 2) {
                stop("length(levels(x)) > 2")
            }
        }
        if (dichotomous2integer == T) {
            x = as.integer(x)
        } else {
            x = as.logical(x) 
        }
        x
    }
    
    if (apply.na.omit == T) {
        nrow1 = nrow(.mydata)
        # .mydata = .mydata %>% na.omit
        # nrow2 = nrow(.mydata)
        # print(paste0("apply.na.omit == T : removing ", nrow1 - nrow2, " rows - from ", nrow1, " rows to ", nrow2, " rows"))
        .mydata.exposure.vars4Matching.na.omit = .mydata[, c(.exposure, .vars4Matching, RowNum_original_before_strata, "RowNum_original")] %>% na.omit 
        .mydata.exposure.vars4Matching.na.omit$RowNum_after_na.omit = 1:nrow(.mydata.exposure.vars4Matching.na.omit)
        nrow2 = nrow(.mydata.exposure.vars4Matching.na.omit)
        print(paste0("apply.na.omit == T : removing ", nrow1 - nrow2, " rows - from ", nrow1, " rows to ", nrow2, " rows"))
    } else {
        .mydata.exposure.vars4Matching.na.omit = .mydata[, c(.exposure, .vars4Matching, RowNum_original_before_strata, "RowNum_original")]
        .mydata.exposure.vars4Matching.na.omit$RowNum_after_na.omit = 1:nrow(.mydata.exposure.vars4Matching.na.omit)
    }
    
    if (apply.function.dichotomous2logical == T) {
        .mydata.exposure.vars4Matching.na.omit.exposure.logical = function.dichotomous2logical(.mydata.exposure.vars4Matching.na.omit[[.exposure]])
    } else {
        .mydata.exposure.vars4Matching.na.omit.exposure.logical = .mydata.exposure.vars4Matching.na.omit[[.exposure]]
    }

    # if (!identical( unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical), c(F, T) )) {  # This set is a superset of (length(unique(.mydata[[.exposure]])) < 2)
    if (!identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )) {
        print("!identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )")
        out = list()
        attr(out, "error.message0") = "!identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )"  # attr() is shown with str(max.level = 1)
    }
    if (length(unique(.mydata[[.exposure]])) < 2) {  # This set is a subset of (!identical( as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical)), 0:1 ))
        print("length(unique(.mydata[[.exposure]]) < 2")
        # out = list()
        out$data = NA  # need this .object to avoid error "attempt to set an attribute on NULL"
        attr(out, "error.message") = "length(unique(.mydata[[.exposure]])) < 2"  # attr() is shown with str(max.level = 1)
        
        # if (add_Table1_pre_post == T) {
        #     out$Table1_pre = NA
        #     out$Table1_post_total = NA
        #     out$Table1_post_i = NA
        # }
    } else {
        out = list()
        if (add_Table1_pre_post == T) {
            out$Table1_pre = CreateTableOne(vars = .vars4Matching, strata = .exposure, data = .mydata, test=T, includeNA = T)
        }
        
        if (propensity_score_matching_weight == T) {
            
            psModel = glm(
                formula = as.formula(paste0(.exposure, " ~ ", paste(.vars4Matching, collapse = " + ")))
                , family = binomial
                , data = .mydata.exposure.vars4Matching.na.omit
            )
            psModel.predict_pExposure_is_T = psModel %>% predict(type = "response")  # predicted probability of being assigned to the exposure (treatment)
            
            .mydata.exposure.vars4Matching.na.omit$pExposure_as_observed_data = ifelse(as.integer(.mydata.exposure.vars4Matching.na.omit[[.exposure]]) == 1, psModel.predict_pExposure_is_T, 1 - psModel.predict_pExposure_is_T)
            .mydata.exposure.vars4Matching.na.omit$pMin = pmin(psModel.predict_pExposure_is_T, 1 - psModel.predict_pExposure_is_T)
            .mydata.exposure.vars4Matching.na.omit$matching_weight = .mydata.exposure.vars4Matching.na.omit$pMin / .mydata.exposure.vars4Matching.na.omit$pExposure_as_observed_data
            .packagename = "survey"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
            .mydata.exposure.vars4Matching.na.omit.svydesign = .mydata.exposure.vars4Matching.na.omit %>% svydesign(ids = ~ 1, data = ., weights = ~ matching_weight)
            
            out$data = .mydata.exposure.vars4Matching.na.omit.svydesign
            if (add_Table1_pre_post == T) {
                out$Table1_post_total = svyCreateTableOne(
                    vars = .vars4Matching, strata = .exposure
                    , data = .mydata.exposure.vars4Matching.na.omit.svydesign
                    , test=T
                    , includeNA = T)
            }
            
        } else {
            if (propensity_score_matching == T) {
                psModel = glm(
                    formula = as.formula(paste0(.exposure, " ~ ", paste(.vars4Matching, collapse = " + ")))
                    , family = binomial
                    , data = .mydata.exposure.vars4Matching.na.omit
                )
                psModel.predict_pExposure_is_T = psModel %>% predict(type = "response")  # predicted probability of being assigned to the exposure (treatment)
                
                .mydata.Match = Match(
                    Tr = .mydata.exposure.vars4Matching.na.omit.exposure.logical
                    , M = .MatchingRatio
                    , X = log( psModel.predict_pExposure_is_T / (1 - psModel.predict_pExposure_is_T) )
                    , replace = FALSE, caliper = caliper, Weight = Weight)
                
            } else {
                ## MahalanobisDistance-based nearest neighbor matching
                # .X = .mydata.exposure.vars4Matching.na.omit[, .vars4Matching]
                .X = model.matrix(~., .mydata.exposure.vars4Matching.na.omit[, .vars4Matching])
                # .X = build.x(~., .mydata.exposure.vars4Matching.na.omit)
                
                if (print.process == T) {
                    print(paste0("data.Match() - dim(.mydata) : ", dim(.mydata) |> deparse()))
                    # print(paste0("data.Match() - dim(.mydata.exposure.vars4Matching.na.omit) : ", dim(.mydata.exposure.vars4Matching.na.omit) |> deparse()))
                    print(paste0("data.Match() - dim(.X) : ", dim(.X) |> deparse()))
                }
                .mydata.Match = Match(
                    Tr = .mydata.exposure.vars4Matching.na.omit.exposure.logical
                    , M = .MatchingRatio
                    , X = .X
                    , replace = FALSE, caliper = caliper, Weight = Weight)
            }
            
            if (length(.mydata.Match$index.treated) == 0) {
                print("length(.mydata.Match$index.treated) == 0")
                # out = list()
                out$data = NA  # need this .object to avoid error "attempt to set an attribute on NULL"
                attr(out, "error.message") = "length(unique(.mydata[[.exposure]])) < 2"  # attr() is shown with str(max.level = 1)
            } else {
                
                
                tmpDf = .mydata.Match[c("index.treated","index.control")] |> as_tibble() %>% mutate(MatchingPairID = as.numeric(as.factor(index.treated)))
                tmpDf$MatchingCtrlNum = 1:.MatchingRatio
                # tmpDf
                
                tmpDf2ctrl = tmpDf[,c("index.control", "MatchingPairID", "MatchingCtrlNum")]
                # names(tmpDf2ctrl)[1] = "rowname"  # bug fix 170826 - rowname are altered when apply.na.omit == T
                names(tmpDf2ctrl)[1] = "RowNum_after_na.omit"
                # tmpDf2ctrl
                
                tmpDf2tx = tmpDf[,c("index.treated", "MatchingPairID", "MatchingCtrlNum")]
                tmpDf2tx$MatchingCtrlNum = 0
                # names(tmpDf2tx)[1] = "rowname"  # bug fix 170826 - rowname are altered when apply.na.omit == T
                names(tmpDf2tx)[1] = "RowNum_after_na.omit"
                tmpDf2tx = tmpDf2tx %>% distinct()
                # tmpDf2tx
                
                tmpDf3 = union(tmpDf2tx, tmpDf2ctrl)
                # tmpDf3rowname=tmpDf3rowname %>% as.character()  # bug fix 170826 - rowname are altered when apply.na.omit == T
                # tmpDf3 %>% arrange(MatchingPairID, MatchingCtrlNum)
                
                tmpDf4 = left_join(tmpDf3, .mydata.exposure.vars4Matching.na.omit[, c(RowNum_original_before_strata, "RowNum_original", "RowNum_after_na.omit")], by = "RowNum_after_na.omit")
                
                # .mydataMatching = .mydata %>% rownames_to_column() |> as_tibble()  # bug fix 170826 - rowname are altered when apply.na.omit == T
                # .mydataMatching = inner_join(.mydataMatching, tmpDf3, by = "rowname") %>% arrange(MatchingPairID, MatchingCtrlNum)  # bug fix 170826 - rowname are altered when apply.na.omit == T
                .mydataMatching = inner_join(.mydata, tmpDf4, by = c(RowNum_original_before_strata, "RowNum_original")) %>% arrange(MatchingPairID, MatchingCtrlNum)  # bug fix 170826 - rowname are altered when apply.na.omit == T
                
                # .mydataMatching$MatchingPairID = paste0()
                # .mydataMatching
                out$data = .mydataMatching |> as_tibble()
                if (add_Table1_pre_post == T) {
                    out$Table1_post_total = CreateTableOne(
                        vars = .vars4Matching, strata = .exposure
                        , data = .mydataMatching
                        , test=T
                        , includeNA = T)
                    out$Table1_post_i = lapply(1:.MatchingRatio, function(i) {
                        CreateTableOne(
                            vars = .vars4Matching, strata = .exposure
                            , data = .mydataMatching %>% dplyr::filter(MatchingCtrlNum %in% c(0,i))
                            , test=T
                            , includeNA = T)
                    })
                    names(out$Table1_post_i) = paste0("MatchingCtrlNum", "_0_", 1:.MatchingRatio)
                }
            }
        }
        
    }
    attr(out$data, ".vars4Matching") = .vars4Matching
    attr(out$data, ".exposure") = .exposure
    attr(out$data, ".MatchingRatio") = .MatchingRatio
    attr(out$data, "apply.na.omit") = apply.na.omit
    # attr(out, "function.input") = match.call(expand.dots = TRUE)   # list inside attr() is not shown with str(max.level = 1)
    attr(out, "function.input") = list(
        Call = match.call(expand.dots = TRUE)
        , data.Match = data.Match
        , .vars4Matching = .vars4Matching
        , .exposure = .exposure
        , .MatchingRatio = .MatchingRatio
        , apply.na.omit = apply.na.omit
        , caliper = caliper
        , Weight_covariates = Weight_covariates
        , propensity_score_matching = propensity_score_matching
        , propensity_score_matching_weight = propensity_score_matching_weight
        , apply.function.dichotomous2logical = apply.function.dichotomous2logical
    ) # list inside attr() is not shown with str(max.level = 1)
    if(is.data.frame(out$data)) {
        # outdataRowNum_original = NULL
        out$data$RowNum_after_na.omit = NULL
    }
    out
}

## @ test) data.Match() rhc_mydata.rda -----  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
load(url("https://raw.githubusercontent.com/mkim0710/tidystat/master/data/rhc_mydata.rda"))
rhc_mydata$age.cut = rhc_mydata$age %>% cut(breaks = c(0, 10 * 1:10, Inf), include.lowest = T, right = F)
rhc_mydata.Match = rhc_mydata %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = T
)
# > rhc_mydata.Match = rhc_mydata %>% data.Match(
# +     .vars4Matching = c("female","age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = T
# + )
# [1] "Weight_covariates : InverseVariance"
# [1] "data.Match() - dim(.mydata) : c(5735L, 15L)"
# [1] "data.Match() - dim(.X) : c(5735L, 4L)"

rhc_mydata.Match = rhc_mydata %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
)
rhc_mydata.Match |> str(max.level = 1)
rhc_mydata.Match %>% attr("function.input") |> str()  #----
# > rhc_mydata.Match |> str(max.level = 1)
# List of 4
#  $ Table1_pre       :List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ data               :Classes ??tbl_df??, ??tbl?? and 'data.frame':	4260 obs. of  17 variables:
#   ..- attr(*, ".vars4Matching")= chr [1:3] "female" "age" "meanbp1"
#   ..- attr(*, ".exposure")= chr "treatment"
#   ..- attr(*, ".MatchingRatio")= num 5
#   ..- attr(*, "apply.na.omit")= logi FALSE
#  $ Table1_post_total:List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ Table1_post_i    :List of 5
#  - attr(*, "function.input")=List of 11
# > rhc_mydata.Match %>% attr("function.input") |> str()  #----  
# List of 11
#  $ Call                              : language data.Match(.mydata = ., .vars4Matching = c("female", "age", "meanbp1"), .exposure = "treatment", .MatchingRatio = 5)
#  $ data.Match                        :function (.mydata, ..., .vars4Matching = c("female", "income"), .exposure = "treatment", .MatchingRatio = 5, 
#     caliper = NULL, Weight_covariates = c("InverseVariance", "MahalanobisDistance", "WeightMatrix")[1], 
#     add_Table1_pre_post = T, RowNum_original_before_strata = NULL, apply.na.omit = F, print.process = F, 
#     load.dependent.library = T, propensity_score_matching = F, propensity_score_matching_weight = F, 
#     apply.function.dichotomous2logical = F)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 14 251 1 14 1 1 251
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x0000000029f89c10> 
#  $ .vars4Matching                    : chr [1:3] "female" "age" "meanbp1"
#  $ .exposure                         : chr "treatment"
#  $ .MatchingRatio                    : num 5
#  $ apply.na.omit                     : logi FALSE
#  $ caliper                           : NULL
#  $ Weight_covariates                 : chr "InverseVariance"
#  $ propensity_score_matching         : logi FALSE
#  $ propensity_score_matching_weight  : logi FALSE
#  $ apply.function.dichotomous2logical: logi FALSE
rhc_mydata.Match$Table1_pre |> print(smd = T)
rhc_mydata.Match$Table1_post_total |> print(smd = T)  # ----
rhc_mydata.Match$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
rhc_mydata.Match$data
# > rhc_mydata.Match$Table1_pre |> print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3551          2184                           
#   female (mean (sd))   0.46 (0.50)   0.41 (0.49)   0.001       0.093
#   age (mean (sd))     61.76 (17.29) 60.75 (15.63)  0.026       0.061
#   meanbp1 (mean (sd)) 84.87 (38.87) 68.20 (34.24) <0.001       0.455
# > rhc_mydata.Match$Table1_post_total |> print(smd = T)  # ----  
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3550           710                           
#   female (mean (sd))   0.46 (0.50)   0.43 (0.49)   0.083       0.071
#   age (mean (sd))     61.77 (17.29) 60.72 (15.53)  0.133       0.064
#   meanbp1 (mean (sd)) 84.82 (38.79) 69.14 (33.79) <0.001       0.431
# > rhc_mydata.Match$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                     710           710                           
#   female (mean (sd))   0.46 (0.50)   0.43 (0.49)   0.200       0.068
#   age (mean (sd))     61.79 (17.17) 60.72 (15.53)  0.216       0.066
#   meanbp1 (mean (sd)) 84.94 (38.99) 69.14 (33.79) <0.001       0.433
# > rhc_mydata.Match$data
# # A tibble: 4,260 x 17
#      ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut RowNum_original MatchingPairID MatchingCtrlNum
#    <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>           <int>          <dbl>           <dbl>
#  1     0     0     0      0     0       0     0      1 78.17896      1      63         1     1 [70,80)               2              1               0
#  2     1     0     0      0     0       0     0      0 78.91895      1      62         0     1 [70,80)            1041              1               1
#  3     0     0     0      0     1       0     0      0 77.32495      1      63         0     0 [70,80)            1871              1               2
#  4     1     0     0      0     0       0     0      0 77.46698      1      61         0     1 [70,80)            2288              1               3
#  5     0     0     0      0     1       0     0      0 77.55499      1      62         0     1 [70,80)            3765              1               4
#  6     0     0     0      0     0       0     0      0 76.98798      1      63         0     0 [70,80)            4800              1               5
#  7     0     0     0      0     0       0     1      0 46.09198      1      57         1     0 [40,50)               3              2               0
#  8     0     0     0      0     0       0     0      1 45.43698      1      55         0     0 [40,50)            1993              2               1
#  9     0     0     0      0     0       0     0      1 45.02698      1      57         0     0 [40,50)            3043              2               2
# 10     1     0     0      0     0       0     0      0 47.93399      1      58         0     0 [40,50)            3887              2               3
# # ... with 4,250 more rows


rhc_mydata.Match_propensity_score = rhc_mydata %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , propensity_score_matching = T
)
rhc_mydata.Match_propensity_score |> str(max.level = 1)
# rhc_mydata.Match_propensity_score %>% attr("function.input") |> str()
# rhc_mydata.Match_propensity_score$Table1_pre |> print(smd = T)
rhc_mydata.Match_propensity_score$Table1_post_total |> print(smd = T)  # ----
# rhc_mydata.Match_propensity_score$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
rhc_mydata.Match_propensity_score$data
# > rhc_mydata.Match_propensity_score |> str(max.level = 1)
# List of 4
#  $ Table1_pre       :List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ data               :Classes ??tbl_df??, ??tbl?? and 'data.frame':	4260 obs. of  17 variables:
#   ..- attr(*, ".vars4Matching")= chr [1:3] "female" "age" "meanbp1"
#   ..- attr(*, ".exposure")= chr "treatment"
#   ..- attr(*, ".MatchingRatio")= num 5
#   ..- attr(*, "apply.na.omit")= logi FALSE
#  $ Table1_post_total:List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ Table1_post_i    :List of 5
#  - attr(*, "function.input")=List of 5
# > rhc_mydata.Match_propensity_score %>% attr("function.input") |> str()
# List of 5
#  $ data.Match    :function (.mydata, .vars4Matching = c("female", "income"), .exposure = "treatment", .MatchingRatio = 5, add_Table1_pre_post = T, RowNum_original_before_strata = NULL, 
#     apply.na.omit = F, print.process = F, load.dependent.library = T, propensity_score_matching = F, propensity_score_matching_weight = F)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 14 170 1 14 1 1 170
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x0000000026ffc568> 
#  $ .vars4Matching: chr [1:3] "female" "age" "meanbp1"
#  $ .exposure     : chr "treatment"
#  $ .MatchingRatio: num 5
#  $ apply.na.omit : logi FALSE
# > rhc_mydata.Match_propensity_score$Table1_post_total |> print(smd = T)  # ----  
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3550           710                           
#   female (mean (sd))   0.46 (0.50)   0.43 (0.49)   0.083       0.071
#   age (mean (sd))     61.77 (17.29) 60.72 (15.53)  0.133       0.064
#   meanbp1 (mean (sd)) 84.82 (38.79) 69.14 (33.79) <0.001       0.431
# > rhc_mydata.Match_propensity_score$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                     710           710                           
#   female (mean (sd))   0.47 (0.50)   0.43 (0.49)   0.109       0.085
#   age (mean (sd))     62.18 (17.00) 60.72 (15.53)  0.090       0.090
#   meanbp1 (mean (sd)) 84.64 (38.96) 69.14 (33.79) <0.001       0.425
# > rhc_mydata.Match_propensity_score$data
# # A tibble: 4,260 x 17
#      ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died  age.cut RowNum_original MatchingPairID MatchingCtrlNum
#    <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>   <fctr>           <int>          <dbl>           <dbl>
#  1     0     0     0      0     0       0     0      1 78.17896      1      63         1     1  [70,80)               2              1               0
#  2     1     0     0      0     0       0     0      0 87.86298      1      59         0     0  [80,90)            1042              1               1
#  3     0     0     0      0     0       0     0      0 80.73895      1      62         0     0  [80,90)            1204              1               2
#  4     0     0     0      0     1       0     0      0 75.12097      0      77         0     1  [70,80)            2893              1               3
#  5     1     0     0      0     0       0     0      0 85.34399      1      60         0     0  [80,90)            4107              1               4
#  6     1     0     0      0     0       0     0      0 83.24194      1      61         0     0  [80,90)            5201              1               5
#  7     0     0     0      0     0       0     1      0 46.09198      1      57         1     0  [40,50)               3              2               0
#  8     0     0     0      0     0       0     0      1 95.58099      0      49         0     1 [90,100)             469              2               1
#  9     0     0     0      0     0       0     1      0 69.81195      0      60         0     1  [60,70)             818              2               2
# 10     0     0     0      0     0       0     0      1 62.76797      1      50         0     0  [60,70)            2328              2               3
# # ... with 4,250 more rows



rhc_mydata.Match_propensity_score_matching_weight = rhc_mydata %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , propensity_score_matching_weight = T
)
rhc_mydata.Match_propensity_score_matching_weight |> str(max.level = 1)
# rhc_mydata.Match_propensity_score_matching_weight %>% attr("function.input") |> str()
# rhc_mydata.Match_propensity_score_matching_weight$Table1_pre |> print(smd = T)
rhc_mydata.Match_propensity_score_matching_weight$Table1_post_total |> print(smd = T)  # ----
rhc_mydata.Match_propensity_score_matching_weight$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
rhc_mydata.Match_propensity_score_matching_weight$data
# > rhc_mydata.Match_propensity_score_matching_weight |> str(max.level = 1)
# List of 3
#  $ Table1_pre       :List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ data               :List of 9
#   ..- attr(*, "class")= chr [1:2] "survey.design2" "survey.design"
#   ..- attr(*, ".vars4Matching")= chr [1:3] "female" "age" "meanbp1"
#   ..- attr(*, ".exposure")= chr "treatment"
#   ..- attr(*, ".MatchingRatio")= num 5
#   ..- attr(*, "apply.na.omit")= logi FALSE
#  $ Table1_post_total:List of 3
#   ..- attr(*, "class")= chr [1:2] "svyTable1" "tableone"
#  - attr(*, "function.input")=List of 5
# > rhc_mydata.Match_propensity_score_matching_weight %>% attr("function.input") |> str()
# List of 5
#  $ data.Match    :function (.mydata, .vars4Matching = c("female", "income"), .exposure = "treatment", .MatchingRatio = 5, add_Table1_pre_post = T, RowNum_original_before_strata = NULL, 
#     apply.na.omit = F, print.process = F, load.dependent.library = T, propensity_score_matching = F, propensity_score_matching_weight = F)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 14 170 1 14 1 1 170
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x0000000026ffc568> 
#  $ .vars4Matching: chr [1:3] "female" "age" "meanbp1"
#  $ .exposure     : chr "treatment"
#  $ .MatchingRatio: num 5
#  $ apply.na.omit : logi FALSE
# > rhc_mydata.Match_propensity_score_matching_weight$Table1_post_total |> print(smd = T)  # ----  
#                      Stratified by treatment
#                       0               1               p      test SMD   
#   n                   2142.75         2149.92                           
#   female (mean (sd))     0.42 (0.49)     0.42 (0.49)   0.930       0.002
#   age (mean (sd))       60.81 (17.65)   60.88 (15.56)  0.877       0.004
#   meanbp1 (mean (sd))   69.39 (32.73)   69.00 (33.81)  0.660       0.012
# > rhc_mydata.Match_propensity_score_matching_weight$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
# NULL
# > rhc_mydata.Match_propensity_score_matching_weight$data
# Independent Sampling design (with replacement)
# svydesign(ids = ~1, data = ., weights = ~matching_weight)


## @ caliper.2 -----  
rhc_mydata.Match_caliper.2 = rhc_mydata %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , caliper = 0.2
)
rhc_mydata.Match_caliper.2$Table1_post_total |> print(smd = T)
# > rhc_mydata.Match_caliper.2$Table1_post_total |> print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3070           614                           
#   female (mean (sd))   0.46 (0.50)   0.46 (0.50)   1.000      <0.001
#   age (mean (sd))     62.31 (16.14) 62.25 (16.05)  0.927       0.004
#   meanbp1 (mean (sd)) 81.62 (35.76) 81.40 (35.90)  0.891       0.006


rhc_mydata.Match_propensity_score_caliper.2 = rhc_mydata %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , caliper = 0.2
    , propensity_score_matching = T
)
rhc_mydata.Match_propensity_score_caliper.2 |> str(max.level = 1)
# rhc_mydata.Match_propensity_score_matching_weight %>% attr("function.input") |> str()
# rhc_mydata.Match_propensity_score_caliper.2$Table1_pre |> print(smd = T)
rhc_mydata.Match_propensity_score_caliper.2$Table1_post_total |> print(smd = T)  # ----
# rhc_mydata.Match_propensity_score_caliper.2$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
# rhc_mydata.Match_propensity_score_caliper.2$data
# > rhc_mydata.Match_propensity_score_caliper.2$Table1_post_total |> print(smd = T)  # ----  
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3525           705                           
#   female (mean (sd))   0.46 (0.50)   0.46 (0.50)   0.978       0.001
#   age (mean (sd))     61.73 (17.27) 60.81 (15.84)  0.192       0.055
#   meanbp1 (mean (sd)) 84.30 (38.16) 84.40 (38.57)  0.949       0.003

# rhc_mydata.Match_Mahal_caliper.2 = rhc_mydata %>% data.Match(
#     .vars4Matching = c("female","age","meanbp1")
#     , .exposure = "treatment"
#     , .MatchingRatio = 5
#     , caliper = 0.2
#     , Weight = 2
# )
# # > rhc_mydata.Match_Mahal_caliper.2 = rhc_mydata %>% data.Match(
# # +     .vars4Matching = c("female","age","meanbp1")
# # +     , .exposure = "treatment"
# # +     , .MatchingRatio = 5
# # +     , caliper = 0.2
# # +     , Weight = 2
# # + )
# # * warning) Weight argument deprecated : use Weight_covariates = c("InverseVariance", "MahalanobisDistance", "WeightMatrix")[1]
# # * Distance-based matching - Weight_covariates : InverseVariance

rhc_mydata.Match_Mahal_caliper.2 = rhc_mydata %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , caliper = 0.2
    , Weight_covariates = c("InverseVariance", "MahalanobisDistance", "WeightMatrix")[2]
)
rhc_mydata.Match_Mahal_caliper.2$Table1_post_total |> print(smd = T)
# > rhc_mydata.Match_Mahal_caliper.2$Table1_post_total |> print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3070           614                           
#   female (mean (sd))   0.46 (0.50)   0.46 (0.50)   1.000      <0.001
#   age (mean (sd))     62.31 (16.14) 62.25 (16.05)  0.928       0.004
#   meanbp1 (mean (sd)) 81.61 (35.76) 81.40 (35.90)  0.892       0.006



## @ test) data.Match() rhc_mydata.na ----  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
load(url("https://raw.githubusercontent.com/mkim0710/tidystat/master/data/rhc_mydata.rda"))
rhc_mydata$age.cut = rhc_mydata$age %>% cut(breaks = c(0, 10 * 1:10, Inf), include.lowest = T, right = F)
rhc_mydata.na = rhc_mydata
rhc_mydata.na$age[0:99 * 7 + 1] = NA
rhc_mydata.na$meanbp1[0:99 * 5 + 1] = NA
rhc_mydata.na |> str()
# > rhc_mydata.na |> str()
# 'data.frame':	5735 obs. of  14 variables:
#  $ ARF      : num  0 0 0 1 0 0 0 1 0 1 ...
#  $ CHF      : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ Cirr     : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ colcan   : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ Coma     : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ lungcan  : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ MOSF     : num  0 0 1 0 0 0 1 0 1 0 ...
#  $ sepsis   : num  0 1 0 0 1 0 0 0 0 0 ...
#  $ age      : num  NA 78.2 46.1 75.3 67.9 ...
#  $ female   : num  0 1 1 1 0 1 0 0 1 1 ...
#  $ meanbp1  : num  NA 63 57 55 65 NA 67 128 53 73 ...
#  $ treatment: num  0 1 1 0 1 0 0 0 0 1 ...
#  $ died     : num  0 1 0 1 1 0 0 1 0 0 ...
#  $ age.cut  : Factor w/ 11 levels "[0,10)","[10,20)",..: 8 8 5 8 7 9 6 5 2 5 ...

rhc_mydata.na.Match = rhc_mydata.na %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = T
)
# > rhc_mydata.na.Match = rhc_mydata.na %>% data.Match(
# +     .vars4Matching = c("female","age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = T
# + )
# [1] "data.Match() - dim(.mydata) : c(5735L, 15L)"
# [1] "data.Match() - dim(.X) : c(5550L, 4L)"
#  Show Traceback
#  
#  Rerun with Debug
#  Error in Match(Tr = .mydata.exposure.vars4Matching.na.omit[[.exposure]],  : 
#   length(Tr) != nrow(X) 
rhc_mydata.na.Match = rhc_mydata.na %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = T
    , apply.na.omit = T
)
# > rhc_mydata.na.Match = rhc_mydata.na %>% data.Match(
# +     .vars4Matching = c("female","age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = T
# +     , apply.na.omit = T
# + )
# [1] "apply.na.omit == T : removing 185 rows - from 5735 rows to 5550 rows"
# [1] "data.Match() - dim(.mydata) : c(5735L, 15L)"
# [1] "data.Match() - dim(.X) : c(5550L, 4L)"
rhc_mydata.na.Match = rhc_mydata.na %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = F
    , apply.na.omit = T
)
# > rhc_mydata.na.Match = rhc_mydata.na %>% data.Match(
# +     .vars4Matching = c("female","age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = F
# +     , apply.na.omit = T
# + )
# [1] "apply.na.omit == T : removing 185 rows - from 5735 rows to 5550 rows"

rhc_mydata.na.Match |> str(max.level = 1)
rhc_mydata.na.Match %>% attr("function.input") |> str()
# > rhc_mydata.na.Match |> str(max.level = 1)
# List of 4
#  $ Table1_pre       :List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ data               :Classes ??tbl_df??, ??tbl?? and 'data.frame':	4134 obs. of  18 variables:
#   ..- attr(*, ".vars4Matching")= chr [1:3] "female" "age" "meanbp1"
#   ..- attr(*, ".exposure")= chr "treatment"
#   ..- attr(*, ".MatchingRatio")= num 5
#   ..- attr(*, "apply.na.omit")= logi TRUE
#  $ Table1_post_total:List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ Table1_post_i    :List of 5
#  - attr(*, "function.input")=List of 5
# > rhc_mydata.na.Match %>% attr("function.input") |> str()
# List of 5
#  $ data.Match    :function (.mydata, .vars4Matching = c("female", "income"), .exposure = "treatment", .MatchingRatio = 5, add_Table1_pre_post = T, apply.na.omit = F, print.process = F, 
#     load.dependent.library = T)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 15 117 1 15 1 1 117
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000296bcf98> 
#  $ .vars4Matching: chr [1:3] "female" "age" "meanbp1"
#  $ .exposure     : chr "treatment"
#  $ .MatchingRatio: num 5
#  $ apply.na.omit : logi TRUE

rhc_mydata.Match$data |> dim()
rhc_mydata.na.Match$data |> dim()
# # > rhc_mydata.Match$data |> dim()
# # [1] 4260   18
# # > rhc_mydata.na.Match$data |> dim()
# # [1] 4134   18
# > rhc_mydata.Match$data |> dim()
# [1] 4260   17
# > rhc_mydata.na.Match$data |> dim()
# [1] 4134   17
4260 - 4134
# > 4260 - 4134
# [1] 126

rhc_mydata.na.Match$Table1_pre |> print(smd = T)
rhc_mydata.na.Match$Table1_post_total |> print(smd = T)  # ----
rhc_mydata.na.Match$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
rhc_mydata.na.Match$data
# > rhc_mydata.na.Match$Table1_pre |> print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3551          2184                           
#   female (mean (sd))   0.46 (0.50)   0.41 (0.49)   0.001       0.093
#   age (mean (sd))     61.68 (17.28) 60.71 (15.62)  0.034       0.059
#   meanbp1 (mean (sd)) 84.83 (38.87) 68.14 (34.22) <0.001       0.456
# > rhc_mydata.na.Match$Table1_post_total |> print(smd = T)  # ----  
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3445           689                           
#   female (mean (sd))   0.46 (0.50)   0.44 (0.50)   0.258       0.047
#   age (mean (sd))     61.70 (17.31) 60.53 (15.42)  0.099       0.071
#   meanbp1 (mean (sd)) 84.84 (38.84) 68.97 (34.53) <0.001       0.432
# > rhc_mydata.na.Match$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                     689           689                           
#   female (mean (sd))   0.46 (0.50)   0.44 (0.50)   0.449       0.041
#   age (mean (sd))     61.65 (17.20) 60.53 (15.42)  0.203       0.069
#   meanbp1 (mean (sd)) 84.90 (39.06) 68.97 (34.53) <0.001       0.432
# > rhc_mydata.na.Match$data
# # A tibble: 4,134 x 17
#      ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut RowNum_original MatchingPairID MatchingCtrlNum
#    <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>           <int>          <dbl>           <dbl>
#  1     0     0     0      0     0       0     0      1 78.17896      1      63         1     1 [70,80)               2              1               0
#  2     1     0     0      0     0       0     0      0 78.91895      1      62         0     1 [70,80)            1041              1               1
#  3     0     0     0      0     1       0     0      0 77.32495      1      63         0     0 [70,80)            1871              1               2
#  4     1     0     0      0     0       0     0      0 77.46698      1      61         0     1 [70,80)            2288              1               3
#  5     0     0     0      0     1       0     0      0 77.55499      1      62         0     1 [70,80)            3765              1               4
#  6     0     0     0      0     0       0     0      0 76.98798      1      63         0     0 [70,80)            4800              1               5
#  7     0     0     0      0     0       0     1      0 46.09198      1      57         1     0 [40,50)               3              2               0
#  8     0     0     0      0     0       0     0      1 45.43698      1      55         0     0 [40,50)            1993              2               1
#  9     0     0     0      0     0       0     0      1 45.02698      1      57         0     0 [40,50)            3043              2               2
# 10     1     0     0      0     0       0     0      0 47.93399      1      58         0     0 [40,50)            3887              2               3
# # ... with 4,124 more rows

rhc_mydata.na.Match$data$RowNum_original |> unique() |> length()
rhc_mydata.na.Match$data$RowNum_after_na.omit |> unique() |> length()
# > rhc_mydata.na.Match$data$RowNum_original |> unique() |> length()
# [1] 4134
# # > rhc_mydata.na.Match$data$RowNum_after_na.omit |> unique() |> length()
# # [1] 4134
# > rhc_mydata.na.Match$data$RowNum_after_na.omit |> unique() |> length()
# [1] 0
# Warning message:
# Unknown or uninitialised column: 'RowNum_after_na.omit'. 


rhc_mydata.na.Match_propensity_score = rhc_mydata.na %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = F
    , apply.na.omit = T
    , propensity_score_matching = T
)
rhc_mydata.na.Match_propensity_score |> str(max.level = 1)
# rhc_mydata.na.Match_propensity_score %>% attr("function.input") |> str()
rhc_mydata.na.Match_propensity_score$Table1_pre |> print(smd = T)
rhc_mydata.na.Match_propensity_score$Table1_post_total |> print(smd = T) # ----
# rhc_mydata.na.Match_propensity_score$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
rhc_mydata.na.Match_propensity_score$data
# # > rhc_mydata.na.Match_propensity_score = rhc_mydata.na %>% data.Match(
# # +     .vars4Matching = c("female","age","meanbp1")
# # +     , .exposure = "treatment"
# # +     , .MatchingRatio = 5
# # +     , print.process = F
# # +     , apply.na.omit = T
# # +     , propensity_score_matching = T
# # + )
# # [1] "apply.na.omit == T : removing 100 rows - from 5735 rows to 5635 rows"
# # > rhc_mydata.na.Match_propensity_score |> str(max.level = 1)
# # List of 4
# #  $ Table1_pre       :List of 3
# #   ..- attr(*, "class")= chr "tableone"
# #  $ data               :Classes ??tbl_df??, ??tbl?? and 'data.frame':	4188 obs. of  17 variables:
# #   ..- attr(*, ".vars4Matching")= chr [1:3] "female" "age" "meanbp1"
# #   ..- attr(*, ".exposure")= chr "treatment"
# #   ..- attr(*, ".MatchingRatio")= num 5
# #   ..- attr(*, "apply.na.omit")= logi TRUE
# #  $ Table1_post_total:List of 3
# #   ..- attr(*, "class")= chr "tableone"
# #  $ Table1_post_i    :List of 5
# #  - attr(*, "function.input")=List of 5
# # > rhc_mydata.na.Match_propensity_score %>% attr("function.input") |> str()
# # List of 5
# #  $ data.Match    :function (.mydata, .vars4Matching = c("female", "income"), .exposure = "treatment", .MatchingRatio = 5, add_Table1_pre_post = T, RowNum_original_before_strata = NULL, 
# #     apply.na.omit = F, print.process = F, load.dependent.library = T, propensity_score_matching = F, propensity_score_matching_weight = F)  
# #   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 14 170 1 14 1 1 170
# #   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x0000000026ffc568> 
# #  $ .vars4Matching: chr [1:3] "female" "age" "meanbp1"
# #  $ .exposure     : chr "treatment"
# #  $ .MatchingRatio: num 5
# #  $ apply.na.omit : logi TRUE
# # > rhc_mydata.na.Match_propensity_score$Table1_pre |> print(smd = T)
# #                      Stratified by treatment
# #                       0             1             p      test SMD   
# #   n                    3551          2184                           
# #   female (mean (sd))   0.46 (0.50)   0.41 (0.49)   0.001       0.093
# #   age (mean (sd))     61.76 (17.29) 60.75 (15.63)  0.026       0.061
# #   meanbp1 (mean (sd)) 84.83 (38.87) 68.14 (34.22) <0.001       0.456
# # > rhc_mydata.na.Match_propensity_score$Table1_post_total |> print(smd = T) # ----  
# #                      Stratified by treatment
# #                       0             1             p      test SMD   
# #   n                    3490           698                           
# #   female (mean (sd))   0.46 (0.50)   0.43 (0.50)   0.183       0.055
# #   age (mean (sd))     61.79 (17.31) 60.71 (15.48)  0.128       0.065
# #   meanbp1 (mean (sd)) 84.71 (38.69) 68.79 (33.72) <0.001       0.439
# # > rhc_mydata.na.Match_propensity_score$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
# #                      Stratified by treatment
# #                       0             1             p      test SMD   
# #   n                     698           698                           
# #   female (mean (sd))   0.45 (0.50)   0.43 (0.50)   0.554       0.032
# #   age (mean (sd))     62.33 (16.67) 60.71 (15.48)  0.060       0.101
# #   meanbp1 (mean (sd)) 84.69 (38.35) 68.79 (33.72) <0.001       0.440
# # > rhc_mydata.na.Match_propensity_score$data
# # # A tibble: 4,188 x 17
# #      ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut RowNum_original MatchingPairID MatchingCtrlNum
# #    <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>           <int>          <dbl>           <dbl>
# #  1     0     0     0      0     0       0     0      1 78.17896      1      63         1     1 [70,80)               2              1               0
# #  2     1     0     0      0     0       0     0      0 87.86298      1      59         0     0 [80,90)            1042              1               1
# #  3     0     0     0      0     0       0     0      0 80.73895      1      62         0     0 [80,90)            1204              1               2
# #  4     1     0     0      0     0       0     0      0 80.76898      1      62         0     1 [80,90)            3977              1               3
# #  5     1     0     0      0     0       0     0      0 85.34399      1      60         0     0 [80,90)            4107              1               4
# #  6     1     0     0      0     0       0     0      0 83.24194      1      61         0     0 [80,90)            5201              1               5
# #  7     0     0     0      0     0       0     1      0 46.09198      1      57         1     0 [40,50)               3              2               0
# #  8     0     0     0      0     0       0     0      1 62.76797      1      50         0     0 [60,70)            2328              2               1
# #  9     0     0     0      0     0       0     0      1 80.16394      0      56         0     1 [80,90)            2356              2               2
# # 10     0     0     0      0     0       0     1      0 82.14099      0      55         0     1 [80,90)            2963              2               3
# # # ... with 4,178 more rows
# > rhc_mydata.na.Match_propensity_score = rhc_mydata.na %>% data.Match(
# +     .vars4Matching = c("female","age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = F
# +     , apply.na.omit = T
# +     , propensity_score_matching = T
# + )
# [1] "apply.na.omit == T : removing 185 rows - from 5735 rows to 5550 rows"
# > rhc_mydata.na.Match_propensity_score |> str(max.level = 1)
# List of 4
#  $ Table1_pre       :List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ data               :Classes ??tbl_df??, ??tbl?? and 'data.frame':	4134 obs. of  17 variables:
#   ..- attr(*, ".vars4Matching")= chr [1:3] "female" "age" "meanbp1"
#   ..- attr(*, ".exposure")= chr "treatment"
#   ..- attr(*, ".MatchingRatio")= num 5
#   ..- attr(*, "apply.na.omit")= logi TRUE
#  $ Table1_post_total:List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ Table1_post_i    :List of 5
#  - attr(*, "function.input")=List of 5
# > rhc_mydata.na.Match_propensity_score$Table1_pre |> print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3551          2184                           
#   female (mean (sd))   0.46 (0.50)   0.41 (0.49)   0.001       0.093
#   age (mean (sd))     61.68 (17.28) 60.71 (15.62)  0.034       0.059
#   meanbp1 (mean (sd)) 84.83 (38.87) 68.14 (34.22) <0.001       0.456
# > rhc_mydata.na.Match_propensity_score$Table1_post_total |> print(smd = T) # ----  
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3445           689                           
#   female (mean (sd))   0.46 (0.50)   0.44 (0.50)   0.258       0.047
#   age (mean (sd))     61.70 (17.31) 60.53 (15.42)  0.099       0.071
#   meanbp1 (mean (sd)) 84.84 (38.84) 68.97 (34.53) <0.001       0.432
# > rhc_mydata.na.Match_propensity_score$data
# # A tibble: 4,134 x 17
#      ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut RowNum_original MatchingPairID MatchingCtrlNum
#    <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>           <int>          <dbl>           <dbl>
#  1     0     0     0      0     0       0     0      1 78.17896      1      63         1     1 [70,80)               2              1               0
#  2     1     0     0      0     0       0     0      0 87.86298      1      59         0     0 [80,90)            1042              1               1
#  3     0     0     0      0     0       0     0      0 80.73895      1      62         0     0 [80,90)            1204              1               2
#  4     1     0     0      0     0       0     0      0 80.76898      1      62         0     1 [80,90)            3977              1               3
#  5     1     0     0      0     0       0     0      0 85.34399      1      60         0     0 [80,90)            4107              1               4
#  6     1     0     0      0     0       0     0      0 83.24194      1      61         0     0 [80,90)            5201              1               5
#  7     0     0     0      0     0       0     1      0 46.09198      1      57         1     0 [40,50)               3              2               0
#  8     0     0     0      0     1       0     0      0 70.21997      1      47         0     1 [70,80)            1143              2               1
#  9     1     0     0      0     0       0     0      0 87.29095      1      40         0     1 [80,90)            2260              2               2
# 10     1     0     0      0     0       0     0      0 68.19397      0      61         0     1 [60,70)            2754              2               3
# # ... with 4,124 more rows


rhc_mydata.na.Match_propensity_score_matching_weight = rhc_mydata.na %>% data.Match(
    .vars4Matching = c("female","age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = F
    , apply.na.omit = T
    , propensity_score_matching_weight = T
)
rhc_mydata.na.Match_propensity_score_matching_weight |> str(max.level = 1)
# rhc_mydata.na.Match_propensity_score_matching_weight %>% attr("function.input") |> str()
rhc_mydata.na.Match_propensity_score_matching_weight$Table1_pre |> print(smd = T)
rhc_mydata.na.Match_propensity_score_matching_weight$Table1_post_total |> print(smd = T) # ----
# rhc_mydata.na.Match_propensity_score_matching_weight$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
rhc_mydata.na.Match_propensity_score_matching_weight$data
# > rhc_mydata.na.Match_propensity_score_matching_weight = rhc_mydata.na %>% data.Match(
# +     .vars4Matching = c("female","age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = F
# +     , apply.na.omit = T
# +     , propensity_score_matching_weight = T
# + )
# [1] "apply.na.omit == T : removing 185 rows - from 5735 rows to 5550 rows"
# > rhc_mydata.na.Match_propensity_score_matching_weight |> str(max.level = 1)
# List of 3
#  $ Table1_pre       :List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ data               :List of 9
#   ..- attr(*, "class")= chr [1:2] "survey.design2" "survey.design"
#   ..- attr(*, ".vars4Matching")= chr [1:3] "female" "age" "meanbp1"
#   ..- attr(*, ".exposure")= chr "treatment"
#   ..- attr(*, ".MatchingRatio")= num 5
#   ..- attr(*, "apply.na.omit")= logi TRUE
#  $ Table1_post_total:List of 3
#   ..- attr(*, "class")= chr [1:2] "svyTable1" "tableone"
#  - attr(*, "function.input")=List of 5
# > rhc_mydata.na.Match_propensity_score_matching_weight %>% attr("function.input") |> str()
# List of 5
#  $ data.Match    :function (.mydata, .vars4Matching = c("female", "income"), .exposure = "treatment", .MatchingRatio = 5, add_Table1_pre_post = T, RowNum_original_before_strata = NULL, 
#     apply.na.omit = F, print.process = F, load.dependent.library = T, propensity_score_matching = F, propensity_score_matching_weight = F)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 14 170 1 14 1 1 170
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x0000000019380e38> 
#  $ .vars4Matching: chr [1:3] "female" "age" "meanbp1"
#  $ .exposure     : chr "treatment"
#  $ .MatchingRatio: num 5
#  $ apply.na.omit : logi TRUE
# > rhc_mydata.na.Match_propensity_score_matching_weight$Table1_pre |> print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3551          2184                           
#   female (mean (sd))   0.46 (0.50)   0.41 (0.49)   0.001       0.093
#   age (mean (sd))     61.68 (17.28) 60.71 (15.62)  0.034       0.059
#   meanbp1 (mean (sd)) 84.83 (38.87) 68.14 (34.22) <0.001       0.456
# > rhc_mydata.na.Match_propensity_score_matching_weight$Table1_post_total |> print(smd = T) # ----  
#                      Stratified by treatment
#                       0               1               p      test SMD   
#   n                   2066.44         2072.77                           
#   female (mean (sd))     0.42 (0.49)     0.42 (0.49)   0.941       0.002
#   age (mean (sd))       60.79 (17.65)   60.85 (15.55)  0.894       0.004
#   meanbp1 (mean (sd))   69.35 (32.70)   68.97 (33.89)  0.664       0.012
# > rhc_mydata.na.Match_propensity_score_matching_weight$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
# NULL
# > rhc_mydata.na.Match_propensity_score_matching_weight$data
# Independent Sampling design (with replacement)
# svydesign(ids = ~1, data = ., weights = ~matching_weight)





# #@ test) data.Match() rhc_mydata.strata_list -----  
# rhc_mydata.strata_list.Match.old = rhc_mydata.strata_list %>% 
#     map(data.Match
#         , .vars4Matching = c("age","meanbp1")
#         , .exposure = "treatment"
#         , .MatchingRatio = 5
#     )
# # > rhc_mydata.strata_list.Match.old = rhc_mydata.strata_list %>% 
# # +     map(data.Match
# # +         , .vars4Matching = c("age","meanbp1")
# # +         , .exposure = "treatment"
# # +         , .MatchingRatio = 5
# # +     )
# # Warning messages:
# # 1: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# # 2: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# rhc_mydata.strata_list.Match.old |> str(max.level = 1)
# # > rhc_mydata.strata_list.Match.old |> str(max.level = 1)
# # List of 20
# #  $ 0_[10,20)  :List of 4
# #   ..- attr(*, "function.input")=List of 5
# #  $ 0_[100,Inf]:List of 1
# #   ..- attr(*, "error.message")= chr "length(unique(.mydata[[.exposure]]) < 2"
# #   ..- attr(*, "function.input")=List of 5
# #  $ 0_[20,30)  :List of 4
# #   ..- attr(*, "function.input")=List of 5
# #  $ 0_[30,40)  :List of 4
# #   ..- attr(*, "function.input")=List of 5
# #  $ 0_[40,50)  :List of 4
# #   ..- attr(*, "function.input")=List of 5
# #  $ 0_[50,60)  :List of 4
# #   ..- attr(*, "function.input")=List of 5
# #  $ 0_[60,70)  :List of 4
# #   ..- attr(*, "function.input")=List of 5
# #  $ 0_[70,80)  :List of 4
# #   ..- attr(*, "function.input")=List of 5
# #  $ 0_[80,90)  :List of 4
# #   ..- attr(*, "function.input")=List of 5
# #  $ 0_[90,100) :List of 4
# #   ..- attr(*, "function.input")=List of 5
# #  $ 1_[10,20)  :List of 4
# #   ..- attr(*, "function.input")=List of 5
# #  $ 1_[100,Inf]:List of 1
# #   ..- attr(*, "error.message")= chr "length(unique(.mydata[[.exposure]]) < 2"
# #   ..- attr(*, "function.input")=List of 5
# #  $ 1_[20,30)  :List of 4
# #   ..- attr(*, "function.input")=List of 5
# #  $ 1_[30,40)  :List of 4
# #   ..- attr(*, "function.input")=List of 5
# #  $ 1_[40,50)  :List of 4
# #   ..- attr(*, "function.input")=List of 5
# #  $ 1_[50,60)  :List of 4
# #   ..- attr(*, "function.input")=List of 5
# #  $ 1_[60,70)  :List of 4
# #   ..- attr(*, "function.input")=List of 5
# #  $ 1_[70,80)  :List of 4
# #   ..- attr(*, "function.input")=List of 5
# #  $ 1_[80,90)  :List of 4
# #   ..- attr(*, "function.input")=List of 5
# #  $ 1_[90,100) :List of 4
# #   ..- attr(*, "function.input")=List of 5
# rhc_mydata.strata_list.Match.old$`0_[60,70)`$Table1_pre |> print(smd = T)
# rhc_mydata.strata_list.Match.old$`0_[60,70)`$Table1_post_total |> print(smd = T)
# rhc_mydata.strata_list.Match.old$`0_[60,70)`$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
# rhc_mydata.strata_list.Match.old$`0_[60,70)`$data
# # > rhc_mydata.strata_list.Match.old$`0_[60,70)`$Table1_pre |> print(smd = T)
# #                      Stratified by treatment
# #                       0             1             p      test SMD   
# #   n                     459           343                           
# #   age (mean (sd))     65.16 (2.91)  64.97 (2.87)   0.346       0.067
# #   meanbp1 (mean (sd)) 85.39 (38.10) 68.43 (36.41) <0.001       0.455
# # > rhc_mydata.strata_list.Match.old$`0_[60,70)`$Table1_post_total |> print(smd = T)
# #                      Stratified by treatment
# #                       0             1             p      test SMD   
# #   n                     455            91                           
# #   age (mean (sd))     65.15 (2.90)  65.29 (2.73)   0.676       0.049
# #   meanbp1 (mean (sd)) 84.64 (37.36) 69.77 (33.90) <0.001       0.417
# # > rhc_mydata.strata_list.Match.old$`0_[60,70)`$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
# #                      Stratified by treatment
# #                       0             1             p      test SMD   
# #   n                      91            91                           
# #   age (mean (sd))     65.24 (2.88)  65.29 (2.73)   0.909       0.017
# #   meanbp1 (mean (sd)) 85.51 (37.50) 69.77 (33.90)  0.003       0.440
# # > rhc_mydata.strata_list.Match.old$`0_[60,70)`$data
# # # A tibble: 546 x 18
# #    rowname   ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut    strata MatchingPairID MatchingCtrlNum
# #      <chr> <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>    <fctr>          <dbl>           <dbl>
# #  1       1     0     0     0      0     0       0     0      1 67.90997      0      65         1     1 [60,70) 0_[60,70)              1               0
# #  2      36     0     1     0      0     0       0     0      0 67.89294      0      66         0     0 [60,70) 0_[60,70)              1               1
# #  3     517     1     0     0      0     0       0     0      0 67.89600      0      65         0     1 [60,70) 0_[60,70)              1               2
# #  4     538     1     0     0      0     0       0     0      0 67.96997      0      67         0     1 [60,70) 0_[60,70)              1               3
# #  5     676     0     0     0      0     0       0     0      0 68.02496      0      63         0     1 [60,70) 0_[60,70)              1               4
# #  6     731     0     0     0      0     0       0     1      0 67.79700      0      65         0     1 [60,70) 0_[60,70)              1               5
# #  7       2     1     0     0      0     0       0     0      0 68.34796      0      50         1     0 [60,70) 0_[60,70)              2               0
# #  8     166     0     0     1      0     0       0     0      0 68.07397      0      53         0     1 [60,70) 0_[60,70)              2               1
# #  9     220     0     0     0      0     0       0     0      1 68.51196      0      52         0     1 [60,70) 0_[60,70)              2               2
# # 10     227     0     0     0      0     0       0     1      0 68.23297      0      47         0     1 [60,70) 0_[60,70)              2               3
# # # ... with 536 more rows




f_df.stratified.Match = function(
    .mydata
    , .vars4strata = c("female", "age.cut")
    , ...
    , .vars4Matching = c("age", "income")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , caliper = NULL
    , Weight_covariates = c("InverseVariance", "MahalanobisDistance", "WeightMatrix")[1]
    , .paralletlsugar = F
    , apply.na.omit = F
    , print.process = F
    , print.map.process = T
    , load.dependent.library = T
    , propensity_score_matching = F
    , apply.function.dichotomous2logical = F
) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/R/data.stratfied.Match.dev.r")
    if (!is.data.frame(.mydata)) stop("!is.data.frame(.mydata)")
    if (load.dependent.library == T) {
        .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
        .packagename = "Matching"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
        .packagename = "tableone"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
        # .packagename = "useful"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    }
    select = dplyr::select
    .mydata$RowNum_original_before_strata = 1:nrow(.mydata)
    
    # if(.parallelsugar == T) {
    #     library(parallelsugar)
    #     map = parallelsugar::mclapply
    # }
    
    
    
    data.strata_list = function(
        .mydata
        , .vars4strata = c("female", "age.cut")
        , paste.collapse = "_"
    ) {
        # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/R/data.stratfied.Match.dev.r")
        if ("strata" %in% names(.mydata)) stop("\"strata\" %in% names(.mydata)")
        .mydata$strata = .mydata[, .vars4strata] %>% apply(MARGIN = 1, FUN = paste, collapse = paste.collapse)
        .mydata$strata = .mydata$strata |> as.factor()
        out = map(
            levels(.mydata$strata)
            , function(chr) {
                out2 = .mydata %>% dplyr::filter(strata == !!chr) |> as_tibble()
                # attr(out2, ".vars4strata") = .vars4strata
                out2
            }
        )
        names(out) = levels(.mydata$strata)
        attr(out, ".vars4strata") = .vars4strata
        attr(out, "function.input") = list(
            data.strata_list = data.strata_list
            , .vars4strata = .vars4strata
        ) # list inside attr() is not shown with str(max.level = 1)
        out
    }
    
    
    data.Match = function(
        .mydata
        , ...
        , .vars4Matching = c("female", "income")
        , .exposure = "treatment"
        , .MatchingRatio = 5
        , caliper = NULL
        , Weight_covariates = c("InverseVariance", "MahalanobisDistance", "WeightMatrix")[1]
        , add_Table1_pre_post = T
        , RowNum_original_before_strata = NULL
        , apply.na.omit = F
        , print.process = F
        , load.dependent.library = T
        , propensity_score_matching = F
        , propensity_score_matching_weight = F
        , apply.function.dichotomous2logical = F
    ) {
        # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/R/data.stratfied.Match.dev.r")
        if (load.dependent.library == T) {
            .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
            .packagename = "Matching"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
            .packagename = "tableone"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
            # .packagename = "useful"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
        }
        select = dplyr::select
        .mydata$RowNum_original = 1:nrow(.mydata)
        
        # if (exists(Weight)) {
        #     stop("Weight argument deprecated : use Weight_covariates = c(\"InverseVariance\", \"MahalanobisDistance\", \"WeightMatrix\")[1]")
        # }  # Error - .object 'Weight' not found -> argument Weight is matched to Weight_covariates if the argument is placed before ...
        Call <- match.call(expand.dots = TRUE)
        for (argname in c("Weight")) {
            if (!is.null(Call[[argname]])) {
                # warning(gettextf("attempt to set '%s' ignored", argname), domain = NA)
                # print(paste0( "warning) Weight argument deprecated : use Weight_covariates = ", deparse(c("InverseVariance", "MahalanobisDistance", "WeightMatrix"), width.cutoff=500), "[1]" ))
                cat(paste0( "* warning) Weight argument deprecated : use Weight_covariates = ", deparse(c("InverseVariance", "MahalanobisDistance", "WeightMatrix"), width.cutoff=500), "[1]", "\n" ))
            }
        }
        
        if (!Weight_covariates %in% c("InverseVariance", "MahalanobisDistance", "WeightMatrix")) {
            cat(paste0( "!Weight_covariates %in% ", deparse(c("InverseVariance", "MahalanobisDistance", "WeightMatrix")), "\n" ))
        }
        Weight = which(Weight_covariates == c("InverseVariance", "MahalanobisDistance", "WeightMatrix"))
        
        if (print.process == T & propensity_score_matching == F & propensity_score_matching_weight == F) { # distance based matching
            cat(paste0( "* Distance-based matching - Weight_covariates : ", Weight_covariates, "\n" ))
            # print(paste0("Weight : ", Weight))
        }
        
        function.dichotomous2logical = function(x, dichotomous2integer = F) {
            # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.dichotomous2logical.dev.r")
            # caution) as.numeric(CategoricalVariable_3MoreLevels)
            if (is.numeric(x)) {
                x = as.character(x)
            } 
            if (is.character(x)) {
                x = as.factor(x)
            }
            # if (length(levels(x)) == 1) {
            #     warning("length(levels(x)) == 1")
            # }
            if (length(unique(x)) == 1) {
                warning("length(unique(x)) == 1")
            }
            if (!is.null(levels(x))) {
                if (length(levels(x)) %in% 1:2) {
                    if (dichotomous2integer == T) {
                        warning(paste0(ifelse(is.null(levels(x)[1]), "NULL", levels(x)[1]), " is coded to 0 & ", ifelse(is.null(levels(x)[2]), "NULL", levels(x)[2]), " is coded to 1"))
                    } else {
                        warning(paste0(ifelse(is.null(levels(x)[1]), "NULL", levels(x)[1]), " is coded to FALSE & ", ifelse(is.null(levels(x)[2]), "NULL", levels(x)[2]), " is coded to TRUE"))
                    }
                    x = as.integer(x) - 1
                } else if (length(levels(x)) > 2) {
                    stop("length(levels(x)) > 2")
                }
            }
            if (dichotomous2integer == T) {
                x = as.integer(x)
            } else {
                x = as.logical(x) 
            }
            x
        }
        
        if (apply.na.omit == T) {
            nrow1 = nrow(.mydata)
            # .mydata = .mydata %>% na.omit
            # nrow2 = nrow(.mydata)
            # print(paste0("apply.na.omit == T : removing ", nrow1 - nrow2, " rows - from ", nrow1, " rows to ", nrow2, " rows"))
            .mydata.exposure.vars4Matching.na.omit = .mydata[, c(.exposure, .vars4Matching, RowNum_original_before_strata, "RowNum_original")] %>% na.omit 
            .mydata.exposure.vars4Matching.na.omit$RowNum_after_na.omit = 1:nrow(.mydata.exposure.vars4Matching.na.omit)
            nrow2 = nrow(.mydata.exposure.vars4Matching.na.omit)
            print(paste0("apply.na.omit == T : removing ", nrow1 - nrow2, " rows - from ", nrow1, " rows to ", nrow2, " rows"))
        } else {
            .mydata.exposure.vars4Matching.na.omit = .mydata[, c(.exposure, .vars4Matching, RowNum_original_before_strata, "RowNum_original")]
            .mydata.exposure.vars4Matching.na.omit$RowNum_after_na.omit = 1:nrow(.mydata.exposure.vars4Matching.na.omit)
        }
        
        if (apply.function.dichotomous2logical == T) {
            .mydata.exposure.vars4Matching.na.omit.exposure.logical = function.dichotomous2logical(.mydata.exposure.vars4Matching.na.omit[[.exposure]])
        } else {
            .mydata.exposure.vars4Matching.na.omit.exposure.logical = .mydata.exposure.vars4Matching.na.omit[[.exposure]]
        }
        
        # if (!identical( unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical), c(F, T) )) {  # This set is a superset of (length(unique(.mydata[[.exposure]])) < 2)
        if (!identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )) {
            print("!identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )")
            out = list()
            attr(out, "error.message0") = "!identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )"  # attr() is shown with str(max.level = 1)
        }
        if (length(unique(.mydata[[.exposure]])) < 2) {  # This set is a subset of (!identical( as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical)), 0:1 ))
            print("length(unique(.mydata[[.exposure]]) < 2")
            # out = list()
            out$data = NA  # need this .object to avoid error "attempt to set an attribute on NULL"
            attr(out, "error.message") = "length(unique(.mydata[[.exposure]])) < 2"  # attr() is shown with str(max.level = 1)
            
            # if (add_Table1_pre_post == T) {
            #     out$Table1_pre = NA
            #     out$Table1_post_total = NA
            #     out$Table1_post_i = NA
            # }
        } else {
            out = list()
            if (add_Table1_pre_post == T) {
                out$Table1_pre = CreateTableOne(vars = .vars4Matching, strata = .exposure, data = .mydata, test=T, includeNA = T)
            }
            
            if (propensity_score_matching_weight == T) {
                
                psModel = glm(
                    formula = as.formula(paste0(.exposure, " ~ ", paste(.vars4Matching, collapse = " + ")))
                    , family = binomial
                    , data = .mydata.exposure.vars4Matching.na.omit
                )
                psModel.predict_pExposure_is_T = psModel %>% predict(type = "response")  # predicted probability of being assigned to the exposure (treatment)
                
                .mydata.exposure.vars4Matching.na.omit$pExposure_as_observed_data = ifelse(as.integer(.mydata.exposure.vars4Matching.na.omit[[.exposure]]) == 1, psModel.predict_pExposure_is_T, 1 - psModel.predict_pExposure_is_T)
                .mydata.exposure.vars4Matching.na.omit$pMin = pmin(psModel.predict_pExposure_is_T, 1 - psModel.predict_pExposure_is_T)
                .mydata.exposure.vars4Matching.na.omit$matching_weight = .mydata.exposure.vars4Matching.na.omit$pMin / .mydata.exposure.vars4Matching.na.omit$pExposure_as_observed_data
                .packagename = "survey"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
                .mydata.exposure.vars4Matching.na.omit.svydesign = .mydata.exposure.vars4Matching.na.omit %>% svydesign(ids = ~ 1, data = ., weights = ~ matching_weight)
                
                out$data = .mydata.exposure.vars4Matching.na.omit.svydesign
                if (add_Table1_pre_post == T) {
                    out$Table1_post_total = svyCreateTableOne(
                        vars = .vars4Matching, strata = .exposure
                        , data = .mydata.exposure.vars4Matching.na.omit.svydesign
                        , test=T
                        , includeNA = T)
                }
                
            } else {
                if (propensity_score_matching == T) {
                    psModel = glm(
                        formula = as.formula(paste0(.exposure, " ~ ", paste(.vars4Matching, collapse = " + ")))
                        , family = binomial
                        , data = .mydata.exposure.vars4Matching.na.omit
                    )
                    psModel.predict_pExposure_is_T = psModel %>% predict(type = "response")  # predicted probability of being assigned to the exposure (treatment)
                    
                    .mydata.Match = Match(
                        Tr = .mydata.exposure.vars4Matching.na.omit.exposure.logical
                        , M = .MatchingRatio
                        , X = log( psModel.predict_pExposure_is_T / (1 - psModel.predict_pExposure_is_T) )
                        , replace = FALSE, caliper = caliper, Weight = Weight)
                    
                } else {
                    ## MahalanobisDistance-based nearest neighbor matching
                    # .X = .mydata.exposure.vars4Matching.na.omit[, .vars4Matching]
                    .X = model.matrix(~., .mydata.exposure.vars4Matching.na.omit[, .vars4Matching])
                    # .X = build.x(~., .mydata.exposure.vars4Matching.na.omit)
                    
                    if (print.process == T) {
                        print(paste0("data.Match() - dim(.mydata) : ", dim(.mydata) |> deparse()))
                        # print(paste0("data.Match() - dim(.mydata.exposure.vars4Matching.na.omit) : ", dim(.mydata.exposure.vars4Matching.na.omit) |> deparse()))
                        print(paste0("data.Match() - dim(.X) : ", dim(.X) |> deparse()))
                    }
                    .mydata.Match = Match(
                        Tr = .mydata.exposure.vars4Matching.na.omit.exposure.logical
                        , M = .MatchingRatio
                        , X = .X
                        , replace = FALSE, caliper = caliper, Weight = Weight)
                }
                
                if (length(.mydata.Match) == 1) {
                    # print("length(.mydata.Match$index.treated) == 0")
                    print(paste0("length(.mydata.Match) == 1 : .mydata.Match = ", .mydata.Match))
                    # out = list()
                    out$data = NA  # need this .object to avoid error "attempt to set an attribute on NULL"
                    attr(out, "error.message") = "length(unique(.mydata[[.exposure]])) < 2"  # attr() is shown with str(max.level = 1)
                } else {
                    
                    
                    tmpDf = .mydata.Match[c("index.treated","index.control")] |> as_tibble() %>% mutate(MatchingPairID = as.numeric(as.factor(index.treated)))
                    tmpDf$MatchingCtrlNum = 1:.MatchingRatio
                    # tmpDf
                    
                    tmpDf2ctrl = tmpDf[,c("index.control", "MatchingPairID", "MatchingCtrlNum")]
                    # names(tmpDf2ctrl)[1] = "rowname"  # bug fix 170826 - rowname are altered when apply.na.omit == T
                    names(tmpDf2ctrl)[1] = "RowNum_after_na.omit"
                    # tmpDf2ctrl
                    
                    tmpDf2tx = tmpDf[,c("index.treated", "MatchingPairID", "MatchingCtrlNum")]
                    tmpDf2tx$MatchingCtrlNum = 0
                    # names(tmpDf2tx)[1] = "rowname"  # bug fix 170826 - rowname are altered when apply.na.omit == T
                    names(tmpDf2tx)[1] = "RowNum_after_na.omit"
                    tmpDf2tx = tmpDf2tx %>% distinct()
                    # tmpDf2tx
                    
                    tmpDf3 = union(tmpDf2tx, tmpDf2ctrl)
                    # tmpDf3rowname=tmpDf3rowname %>% as.character()  # bug fix 170826 - rowname are altered when apply.na.omit == T
                    # tmpDf3 %>% arrange(MatchingPairID, MatchingCtrlNum)
                    
                    tmpDf4 = left_join(tmpDf3, .mydata.exposure.vars4Matching.na.omit[, c(RowNum_original_before_strata, "RowNum_original", "RowNum_after_na.omit")], by = "RowNum_after_na.omit")
                    
                    # .mydataMatching = .mydata %>% rownames_to_column() |> as_tibble()  # bug fix 170826 - rowname are altered when apply.na.omit == T
                    # .mydataMatching = inner_join(.mydataMatching, tmpDf3, by = "rowname") %>% arrange(MatchingPairID, MatchingCtrlNum)  # bug fix 170826 - rowname are altered when apply.na.omit == T
                    .mydataMatching = inner_join(.mydata, tmpDf4, by = c(RowNum_original_before_strata, "RowNum_original")) %>% arrange(MatchingPairID, MatchingCtrlNum)  # bug fix 170826 - rowname are altered when apply.na.omit == T
                    
                    # .mydataMatching$MatchingPairID = paste0()
                    # .mydataMatching
                    out$data = .mydataMatching |> as_tibble()
                    if (add_Table1_pre_post == T) {
                        out$Table1_post_total = CreateTableOne(
                            vars = .vars4Matching, strata = .exposure
                            , data = .mydataMatching
                            , test=T
                            , includeNA = T)
                        out$Table1_post_i = lapply(1:.MatchingRatio, function(i) {
                            CreateTableOne(
                                vars = .vars4Matching, strata = .exposure
                                , data = .mydataMatching %>% dplyr::filter(MatchingCtrlNum %in% c(0,i))
                                , test=T
                                , includeNA = T)
                        })
                        names(out$Table1_post_i) = paste0("MatchingCtrlNum", "_0_", 1:.MatchingRatio)
                    }
                }
            }
            
        }
        attr(out$data, ".vars4Matching") = .vars4Matching
        attr(out$data, ".exposure") = .exposure
        attr(out$data, ".MatchingRatio") = .MatchingRatio
        attr(out$data, "apply.na.omit") = apply.na.omit
        # attr(out, "function.input") = match.call(expand.dots = TRUE)   # list inside attr() is not shown with str(max.level = 1)
        attr(out, "function.input") = list(
            Call = match.call(expand.dots = TRUE)
            , data.Match = data.Match
            , .vars4Matching = .vars4Matching
            , .exposure = .exposure
            , .MatchingRatio = .MatchingRatio
            , apply.na.omit = apply.na.omit
            , caliper = caliper
            , Weight_covariates = Weight_covariates
            , propensity_score_matching = propensity_score_matching
            , propensity_score_matching_weight = propensity_score_matching_weight
            , apply.function.dichotomous2logical = apply.function.dichotomous2logical
        ) # list inside attr() is not shown with str(max.level = 1)
        if(is.data.frame(out$data)) {
            # outdataRowNum_original = NULL
            out$data$RowNum_after_na.omit = NULL
        }
        out
    }
    
    
    
    .mydata.strata_list = data.strata_list(.mydata = .mydata, .vars4strata = .vars4strata)
    
    if (print.map.process == T) {
        .mydata.strata_list.Match = .mydata.strata_list %>% seq_along %>% 
            map(function(i, ...) {
                print(paste0("map to data.Match() with .mydata.strata_list$", names(.mydata.strata_list)[i]))
                out = .mydata.strata_list[[i]] %>% data.Match(...)
                out
            }
            , .vars4Matching = .vars4Matching
            , .exposure = .exposure
            , .MatchingRatio = .MatchingRatio
            , add_Table1_pre_post = F
            , print.process = print.process
            , load.dependent.library = F
            , apply.na.omit = apply.na.omit
            , RowNum_original_before_strata = "RowNum_original_before_strata"
            , propensity_score_matching = propensity_score_matching
            , apply.function.dichotomous2logical = apply.function.dichotomous2logical
            , caliper = caliper
            , Weight_covariates = Weight_covariates
            )
        names(.mydata.strata_list.Match) = names(.mydata.strata_list)
    } else {
        .mydata.strata_list.Match = .mydata.strata_list %>%
            map(data.Match
                , .vars4Matching = .vars4Matching
                , .exposure = .exposure
                , .MatchingRatio = .MatchingRatio
                , add_Table1_pre_post = F
                , load.dependent.library = F
                , apply.na.omit = apply.na.omit
                , RowNum_original_before_strata = "RowNum_original_before_strata"
                , propensity_score_matching = propensity_score_matching
                , apply.function.dichotomous2logical = apply.function.dichotomous2logical
                , caliper = caliper
                , Weight_covariates = Weight_covariates
            )
    }
    # map = purrr::map
    out = list()
    out$Table1_pre = CreateTableOne(vars = c(.vars4strata, .vars4Matching), strata = .exposure, data = .mydata, test=T, includeNA = T)
    
    warning_lgl = .mydata.strata_list.Match %>% map_lgl(function(.object) {
        as.logical(sum(attr(.object, "error.message") == "length(unique(.mydata[[.exposure]])) < 2")) # sum() to avoid error "argument is of length zero" in if()
    })
    # print(paste0("warning_lgl : ", deparse(warning_lgl)))
    # print(paste0("names(.mydata.strata_list.Match) : ", deparse(names(.mydata.strata_list.Match))))
    # print(paste0("names(.mydata.strata_list.Match)[warning_lgl] : ", deparse(names(.mydata.strata_list.Match)[warning_lgl])))
    out$data = .mydata.strata_list.Match[!warning_lgl] %>% map(function(x) x$data) %>% reduce(rbind)
    out$data$MatchingPairID = paste0(out$data$strata, "_", out$data$MatchingPairID) |> as.factor()
    
    if (sum(warning_lgl) > 0) {
        # warning(paste0("length(unique(.mydata[[.exposure]]) < 2",": \n", paste0(warning_which, collapse = ", ")))
        # warning(paste0("length(unique(.mydata[[.exposure]]) < 2",": \n", dput(warning_which)))
        warning(paste0("length(unique(.mydata[[.exposure]]) < 2",": \n", deparse(names(.mydata.strata_list.Match)[warning_lgl])))
    }
    
    out$Table1_post_total = CreateTableOne(
        vars = c(.vars4strata, .vars4Matching), strata = .exposure
        , data = out$data
        , test=T
        , includeNA = T)
    out$Table1_post_i = lapply(1:.MatchingRatio, function(i) {
        CreateTableOne(
            vars = c(.vars4strata, .vars4Matching), strata = .exposure
            , data = out$data %>% dplyr::filter(MatchingCtrlNum %in% c(0,i))
            , test=T
            , includeNA = T)
    })
    names(out$Table1_post_i) = paste0("MatchingCtrlNum", "_0_", 1:.MatchingRatio)
    
    attr(out$data, ".vars4strata") = .vars4strata
    attr(out$data, ".vars4Matching") = .vars4Matching
    attr(out$data, ".exposure") = .exposure
    attr(out$data, ".MatchingRatio") = .MatchingRatio
    attr(out$data, "apply.na.omit") = apply.na.omit
    attr(out, "function.input") = list(
        f_df.stratified.Match = f_df.stratified.Match
        , data.strata_list = data.strata_list
        , data.Match = data.Match
        , .vars4strata = .vars4strata
        , .vars4Matching = .vars4Matching
        , .exposure = .exposure
        , .MatchingRatio = .MatchingRatio
        , apply.na.omit = apply.na.omit
    ) # list inside attr() is not shown with str(max.level = 1)
    out$data$RowNum_original = out$data$RowNum_original_before_strata  # these are not unique numbers d/t stratified map
    out$data$RowNum_original_before_strata  = NULL
    out$data$RowNum_after_na.omit = NULL  # these are not unique numbers d/t stratified map
    out
}

## @ test) f_df.stratified.Match() rhc_mydata.rda -----  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
load(url("https://raw.githubusercontent.com/mkim0710/tidystat/master/data/rhc_mydata.rda"))
rhc_mydata$age.cut = rhc_mydata$age %>% cut(breaks = c(0, 10 * 1:10, Inf), include.lowest = T, right = F)
rhc_myf_df.stratified.Match = rhc_mydata %>% f_df.stratified.Match(
    .vars4strata = c("female", "age.cut")
    , .vars4Matching = c("age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = T
)
# > rhc_myf_df.stratified.Match = rhc_mydata %>% f_df.stratified.Match(
# +     .vars4strata = c("female", "age.cut")
# +     , .vars4Matching = c("age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = T
# + )
# [1] "map to data.Match() with .mydata.strata_list$0_[10,20)"
# [1] "data.Match() - dim(.mydata) : c(22L, 15L)"
# [1] "data.Match() - dim(.X) : c(22L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[100,Inf]"
# [1] "map to data.Match() with .mydata.strata_list$0_[20,30)"
# [1] "data.Match() - dim(.mydata) : c(135L, 15L)"
# [1] "data.Match() - dim(.X) : c(135L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[30,40)"
# [1] "data.Match() - dim(.mydata) : c(242L, 15L)"
# [1] "data.Match() - dim(.X) : c(242L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[40,50)"
# [1] "data.Match() - dim(.mydata) : c(404L, 15L)"
# [1] "data.Match() - dim(.X) : c(404L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[50,60)"
# [1] "data.Match() - dim(.mydata) : c(527L, 15L)"
# [1] "data.Match() - dim(.X) : c(527L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[60,70)"
# [1] "data.Match() - dim(.mydata) : c(802L, 15L)"
# [1] "data.Match() - dim(.X) : c(802L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[70,80)"
# [1] "data.Match() - dim(.mydata) : c(757L, 15L)"
# [1] "data.Match() - dim(.X) : c(757L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[80,90)"
# [1] "data.Match() - dim(.mydata) : c(270L, 15L)"
# [1] "data.Match() - dim(.X) : c(270L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[90,100)"
# [1] "data.Match() - dim(.mydata) : c(32L, 15L)"
# [1] "data.Match() - dim(.X) : c(32L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[10,20)"
# [1] "data.Match() - dim(.mydata) : c(11L, 15L)"
# [1] "data.Match() - dim(.X) : c(11L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[100,Inf]"
# [1] "map to data.Match() with .mydata.strata_list$1_[20,30)"
# [1] "data.Match() - dim(.mydata) : c(117L, 15L)"
# [1] "data.Match() - dim(.X) : c(117L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[30,40)"
# [1] "data.Match() - dim(.mydata) : c(211L, 15L)"
# [1] "data.Match() - dim(.X) : c(211L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[40,50)"
# [1] "data.Match() - dim(.mydata) : c(282L, 15L)"
# [1] "data.Match() - dim(.X) : c(282L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[50,60)"
# [1] "data.Match() - dim(.mydata) : c(390L, 15L)"
# [1] "data.Match() - dim(.X) : c(390L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[60,70)"
# [1] "data.Match() - dim(.mydata) : c(587L, 15L)"
# [1] "data.Match() - dim(.X) : c(587L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[70,80)"
# [1] "data.Match() - dim(.mydata) : c(581L, 15L)"
# [1] "data.Match() - dim(.X) : c(581L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[80,90)"
# [1] "data.Match() - dim(.mydata) : c(305L, 15L)"
# [1] "data.Match() - dim(.X) : c(305L, 4L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[90,100)"
# [1] "data.Match() - dim(.mydata) : c(57L, 15L)"
# [1] "data.Match() - dim(.X) : c(57L, 4L)"
# Warning messages:
# 1: In data.Match(., ...) :
#   !identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )
# 2: In data.Match(., ...) : length(unique(.mydata[[.exposure]]) < 2
# 3: In data.Match(., ...) :
#   !identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )
# 4: In data.Match(., ...) : length(unique(.mydata[[.exposure]]) < 2
# 5: In f_df.stratified.Match(., .vars4strata = c("female", "age.cut"),  :
#   length(unique(.mydata[[.exposure]]) < 2: 
# c("0_[100,Inf]", "1_[100,Inf]")


rhc_myf_df.stratified.Match = rhc_mydata %>% f_df.stratified.Match(
    .vars4strata = c("female", "age.cut")
    , .vars4Matching = c("age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
)
# > rhc_myf_df.stratified.Match = rhc_mydata %>% f_df.stratified.Match(
# +     .vars4strata = c("female", "age.cut")
# +     , .vars4Matching = c("age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# + )
# Warning messages:
# 1: In .f(.x[[i]], ...) :
#   !identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )
# 2: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# 3: In .f(.x[[i]], ...) :
#   !identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )
# 4: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# 5: In f_df.stratified.Match(., .vars4strata = c("female", "age.cut"),  :
#   length(unique(.mydata[[.exposure]]) < 2: 
# c("0_[100,Inf]", "1_[100,Inf]")

# library(parallelsugar)
# system.time(
#     rhc_myf_df.stratified.Match <- rhc_mydata %>% f_df.stratified.Match(
#         .vars4strata = c("female", "age.cut")
#         , .vars4Matching = c("age","meanbp1")
#         , .exposure = "treatment"
#         , .MatchingRatio = 5
#         , .parallelsugar = F
#     )
# )
# system.time(
#     rhc_myf_df.stratified.Match1 <- rhc_mydata %>% f_df.stratified.Match(
#         .vars4strata = c("female", "age.cut")
#         , .vars4Matching = c("age","meanbp1")
#         , .exposure = "treatment"
#         , .MatchingRatio = 5
#         , .parallelsugar = T
#     )
# )
# # > system.time(
# # +     rhc_myf_df.stratified.Match <- rhc_mydata %>% f_df.stratified.Match(
# # +         .vars4strata = c("female", "age.cut")
# # +         , .vars4Matching = c("age","meanbp1")
# # +         , .exposure = "treatment"
# # +         , .MatchingRatio = 5
# # +         , .parallelsugar = F
# # +     )
# # + )
# #  ??????  ?ý??? elapsed 
# #    1.34    0.00    1.34 
# # Warning messages:
# # 1: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# # 2: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# # 3: In f_df.stratified.Match(., .vars4strata = c("female", "age.cut"),  :
# #   length(unique(.mydata[[.exposure]]) < 2: 
# # c("0_[100,Inf]", "1_[100,Inf]")
# # > system.time(
# # +     rhc_myf_df.stratified.Match1 <- rhc_mydata %>% f_df.stratified.Match(
# # +         .vars4strata = c("female", "age.cut")
# # +         , .vars4Matching = c("age","meanbp1")
# # +         , .exposure = "treatment"
# # +         , .MatchingRatio = 5
# # +         , .parallelsugar = T
# # +     )
# # + )
# #  ??????  ?ý??? elapsed 
# #    2.97    2.69   52.17 
# # Warning message:
# # In f_df.stratified.Match(., .vars4strata = c("female", "age.cut"),  :
# #   length(unique(.mydata[[.exposure]]) < 2: 
# # c("0_[100,Inf]", "1_[100,Inf]")

rhc_myf_df.stratified.Match |> str(max.level = 1)
rhc_myf_df.stratified.Match %>% attr("function.input") |> str()
# > rhc_myf_df.stratified.Match |> str(max.level = 1)
# List of 4
#  $ Table1_pre       :List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ data               :Classes ??tbl_df??, ??tbl?? and 'data.frame':	4212 obs. of  18 variables:
#   ..- attr(*, ".vars4Matching")= chr [1:2] "age" "meanbp1"
#   ..- attr(*, ".exposure")= chr "treatment"
#   ..- attr(*, ".MatchingRatio")= num 5
#   ..- attr(*, "apply.na.omit")= logi FALSE
#   ..- attr(*, ".vars4strata")= chr [1:2] "female" "age.cut"
#  $ Table1_post_total:List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ Table1_post_i    :List of 5
#  - attr(*, "function.input")=List of 8
# > rhc_myf_df.stratified.Match %>% attr("function.input") |> str()
# List of 8
#  $ f_df.stratified.Match:function (.mydata, .vars4strata = c("female", "age.cut"), .vars4Matching = c("age", "income"), .exposure = "treatment", .MatchingRatio = 5, .paralletlsugar = F, apply.na.omit = F, 
#     print.process = F, load.dependent.library = T, propensity_score_matching = F)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 25 361 1 25 1 1 361
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000288e66c0> 
#  $ data.strata_list     :function (.mydata, .vars4strata = c("female", "age.cut"))  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 29 24 52 5 24 5 29 52
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000288e66c0> 
#  $ data.Match           :function (.mydata, .vars4Matching = c("female", "income"), .exposure = "treatment", .MatchingRatio = 5, add_Table1_pre_post = T, RowNum_original_before_strata = NULL, 
#     apply.na.omit = F, print.process = F, load.dependent.library = T, propensity_score_matching = F, propensity_score_matching_weight = F, apply.function.dichotomous2logical = F)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 55 18 273 5 18 5 55 273
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000288e66c0> 
#  $ .vars4strata         : chr [1:2] "female" "age.cut"
#  $ .vars4Matching       : chr [1:2] "age" "meanbp1"
#  $ .exposure            : chr "treatment"
#  $ .MatchingRatio       : num 5
#  $ apply.na.omit        : logi FALSE

rhc_mydata.Match$data |> dim()
rhc_myf_df.stratified.Match$data |> dim()
# > rhc_mydata.Match$data |> dim()
# [1] 4260   17
# > rhc_myf_df.stratified.Match$data |> dim()
# [1] 4212   19
4260 - 4212
# > 4260 - 4212
# [1] 48

rhc_myf_df.stratified.Match$Table1_pre |> print(smd = T)
rhc_myf_df.stratified.Match$Table1_post_total |> print(smd = T)  # ----
rhc_myf_df.stratified.Match$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
rhc_myf_df.stratified.Match$data
# > rhc_myf_df.stratified.Match$Table1_pre |> print(smd = T)
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
# > rhc_myf_df.stratified.Match$Table1_post_total |> print(smd = T)  # ----  
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
# > rhc_myf_df.stratified.Match$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
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
# > rhc_myf_df.stratified.Match$data
# # A tibble: 4,212 x 18
#      ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut    strata RowNum_original MatchingPairID MatchingCtrlNum
#    <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>    <fctr>           <int>         <fctr>           <dbl>
#  1     0     0     0      0     0       0     0      1 19.67400      0     105         1     1 [10,20) 0_[10,20)             201    0_[10,20)_1               0
#  2     0     0     0      0     0       0     0      1 19.35100      0      70         0     0 [10,20) 0_[10,20)             491    0_[10,20)_1               1
#  3     1     0     0      0     0       0     0      0 19.79199      0      66         0     0 [10,20) 0_[10,20)             714    0_[10,20)_1               2
#  4     0     0     0      0     0       0     0      1 19.14899      0     103         0     0 [10,20) 0_[10,20)             722    0_[10,20)_1               3
#  5     1     0     0      0     0       0     0      0 19.21999      0     128         0     0 [10,20) 0_[10,20)            1944    0_[10,20)_1               4
#  6     0     0     0      0     0       0     1      0 18.94600      0     112         0     1 [10,20) 0_[10,20)            4091    0_[10,20)_1               5
#  7     0     0     0      0     0       0     0      1 19.85199      0      63         1     1 [10,20) 0_[10,20)            3746    0_[10,20)_2               0
#  8     1     0     0      0     0       0     0      0 19.92599      0      41         0     0 [10,20) 0_[10,20)             607    0_[10,20)_2               1
#  9     1     0     0      0     0       0     0      0 19.17599      0      62         0     0 [10,20) 0_[10,20)            2647    0_[10,20)_2               2
# 10     1     0     0      0     0       0     0      0 19.70999      0      55         0     1 [10,20) 0_[10,20)            3399    0_[10,20)_2               3
# # ... with 4,202 more rows


rhc_myf_df.stratified.Match_propensity_score = rhc_mydata %>% f_df.stratified.Match(
    .vars4strata = c("female", "age.cut")
    , .vars4Matching = c("age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , propensity_score_matching = T
)
rhc_myf_df.stratified.Match_propensity_score |> str(max.level = 1)
# rhc_myf_df.stratified.Match_propensity_score %>% attr("function.input") |> str()
rhc_myf_df.stratified.Match_propensity_score$Table1_pre |> print(smd = T)
rhc_myf_df.stratified.Match_propensity_score$Table1_post_total |> print(smd = T)  # ----
# rhc_myf_df.stratified.Match_propensity_score$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
rhc_myf_df.stratified.Match_propensity_score$data
# > rhc_myf_df.stratified.Match_propensity_score = rhc_mydata %>% f_df.stratified.Match(
# +     .vars4strata = c("female", "age.cut")
# +     , .vars4Matching = c("age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , propensity_score_matching = T
# + )
# Warning messages:
# 1: In .f(.x[[i]], ...) :
#   !identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )
# 2: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# 3: In .f(.x[[i]], ...) :
#   !identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )
# 4: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# 5: In f_df.stratified.Match(., .vars4strata = c("female", "age.cut"),  :
#   length(unique(.mydata[[.exposure]]) < 2: 
# c("0_[100,Inf]", "1_[100,Inf]")
# > rhc_myf_df.stratified.Match_propensity_score |> str(max.level = 1)
# List of 4
#  $ Table1_pre       :List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ data               :Classes ??tbl_df??, ??tbl?? and 'data.frame':	4212 obs. of  18 variables:
#   ..- attr(*, ".vars4Matching")= chr [1:2] "age" "meanbp1"
#   ..- attr(*, ".exposure")= chr "treatment"
#   ..- attr(*, ".MatchingRatio")= num 5
#   ..- attr(*, "apply.na.omit")= logi FALSE
#   ..- attr(*, ".vars4strata")= chr [1:2] "female" "age.cut"
#  $ Table1_post_total:List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ Table1_post_i    :List of 5
#  - attr(*, "function.input")=List of 8
# > # rhc_myf_df.stratified.Match_propensity_score %>% attr("function.input") |> str()
# > rhc_myf_df.stratified.Match_propensity_score$Table1_pre |> print(smd = T)
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
# > rhc_myf_df.stratified.Match_propensity_score$Table1_post_total |> print(smd = T)  # ----  
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
#   age (mean (sd))     61.70 (17.15) 61.79 (16.94)  0.900       0.005
#   meanbp1 (mean (sd)) 84.24 (38.28) 67.72 (33.91) <0.001       0.457
# > rhc_myf_df.stratified.Match_propensity_score$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
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
#   age (mean (sd))     61.76 (17.07) 61.79 (16.94)  0.978       0.002
#   meanbp1 (mean (sd)) 83.92 (39.04) 67.72 (33.91) <0.001       0.443
# > rhc_myf_df.stratified.Match_propensity_score$data
# # A tibble: 4,212 x 18
#      ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut    strata RowNum_original MatchingPairID MatchingCtrlNum
#    <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>    <fctr>           <int>         <fctr>           <dbl>
#  1     0     0     0      0     0       0     0      1 19.67400      0     105         1     1 [10,20) 0_[10,20)             201    0_[10,20)_1               0
#  2     1     0     0      0     0       0     0      0 19.92599      0      41         0     0 [10,20) 0_[10,20)             607    0_[10,20)_1               1
#  3     1     0     0      0     0       0     0      0 19.79199      0      66         0     0 [10,20) 0_[10,20)             714    0_[10,20)_1               2
#  4     1     0     0      0     0       0     0      0 19.70999      0      55         0     1 [10,20) 0_[10,20)            3399    0_[10,20)_1               3
#  5     1     0     0      0     0       0     0      0 19.75099      0      53         0     0 [10,20) 0_[10,20)            4066    0_[10,20)_1               4
#  6     1     0     0      0     0       0     0      0 19.82999      0      63         0     0 [10,20) 0_[10,20)            4568    0_[10,20)_1               5
#  7     0     0     0      0     0       0     0      1 19.85199      0      63         1     1 [10,20) 0_[10,20)            3746    0_[10,20)_2               0
#  8     0     0     0      0     0       0     0      1 19.35100      0      70         0     0 [10,20) 0_[10,20)             491    0_[10,20)_2               1
#  9     0     0     0      0     0       0     0      1 19.14899      0     103         0     0 [10,20) 0_[10,20)             722    0_[10,20)_2               2
# 10     1     0     0      0     0       0     0      0 19.21999      0     128         0     0 [10,20) 0_[10,20)            1944    0_[10,20)_2               3
# # ... with 4,202 more rows

## @ caliper.2 ----  
rhc_myf_df.stratified.Match_caplier.2 = rhc_mydata %>% f_df.stratified.Match(
    .vars4strata = c("female", "age.cut")
    , .vars4Matching = c("age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , caliper = 0.2
)
rhc_myf_df.stratified.Match_caplier.2$Table1_post_total |> print(smd = T)  # ----
# > rhc_myf_df.stratified.Match_caplier.2 = rhc_mydata %>% f_df.stratified.Match(
# +     .vars4strata = c("female", "age.cut")
# +     , .vars4Matching = c("age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , caliper = 0.2
# + )
# [1] "map to data.Match() with .mydata.strata_list$0_[10,20)"
# [1] "length(.mydata.Match) == 1 : .mydata.Match = NA"
# [1] "map to data.Match() with .mydata.strata_list$0_[100,Inf]"
# [1] "!identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )"
# [1] "length(unique(.mydata[[.exposure]]) < 2"
# [1] "map to data.Match() with .mydata.strata_list$0_[20,30)"
# [1] "map to data.Match() with .mydata.strata_list$0_[30,40)"
# [1] "map to data.Match() with .mydata.strata_list$0_[40,50)"
# [1] "map to data.Match() with .mydata.strata_list$0_[50,60)"
# [1] "map to data.Match() with .mydata.strata_list$0_[60,70)"
# [1] "map to data.Match() with .mydata.strata_list$0_[70,80)"
# [1] "map to data.Match() with .mydata.strata_list$0_[80,90)"
# [1] "map to data.Match() with .mydata.strata_list$0_[90,100)"
# [1] "length(.mydata.Match) == 1 : .mydata.Match = NA"
# [1] "map to data.Match() with .mydata.strata_list$1_[10,20)"
# [1] "length(.mydata.Match) == 1 : .mydata.Match = NA"
# [1] "map to data.Match() with .mydata.strata_list$1_[100,Inf]"
# [1] "!identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )"
# [1] "length(unique(.mydata[[.exposure]]) < 2"
# [1] "map to data.Match() with .mydata.strata_list$1_[20,30)"
# [1] "length(.mydata.Match) == 1 : .mydata.Match = NA"
# [1] "map to data.Match() with .mydata.strata_list$1_[30,40)"
# [1] "map to data.Match() with .mydata.strata_list$1_[40,50)"
# [1] "map to data.Match() with .mydata.strata_list$1_[50,60)"
# [1] "map to data.Match() with .mydata.strata_list$1_[60,70)"
# [1] "map to data.Match() with .mydata.strata_list$1_[70,80)"
# [1] "map to data.Match() with .mydata.strata_list$1_[80,90)"
# [1] "map to data.Match() with .mydata.strata_list$1_[90,100)"
# Warning messages:
# 1: In Match(Tr = .mydata.exposure.vars4Matching.na.omit.exposure.logical,  :
#   'Match' .object contains no valid matches (probably because of the caliper or the exact option).
# 2: In Match(Tr = .mydata.exposure.vars4Matching.na.omit.exposure.logical,  :
#   'Match' .object contains no valid matches (probably because of the caliper or the exact option).
# 3: In Match(Tr = .mydata.exposure.vars4Matching.na.omit.exposure.logical,  :
#   'Match' .object contains no valid matches (probably because of the caliper or the exact option).
# 4: In Match(Tr = .mydata.exposure.vars4Matching.na.omit.exposure.logical,  :
#   'Match' .object contains no valid matches (probably because of the caliper or the exact option).
# 5: In f_df.stratified.Match(., .vars4strata = c("female", "age.cut"),  :
#   length(unique(.mydata[[.exposure]]) < 2: 
# c("0_[10,20)", "0_[100,Inf]", "0_[90,100)", "1_[10,20)", "1_[100,Inf]", length(unique(.mydata[[.exposure]]) < 2: 
# "1_[20,30)")
# > rhc_myf_df.stratified.Match_caplier.2$Table1_post_total |> print(smd = T)  # ----  
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    1745           349                           
#   female (mean (sd))   0.42 (0.49)   0.42 (0.49)   1.000      <0.001
#   age.cut (%)                                      NaN        <0.001
#      [0,10)               0 ( 0.0)      0 ( 0.0)                    
#      [10,20)              0 ( 0.0)      0 ( 0.0)                    
#      [20,30)             10 ( 0.6)      2 ( 0.6)                    
#      [30,40)             60 ( 3.4)     12 ( 3.4)                    
#      [40,50)            160 ( 9.2)     32 ( 9.2)                    
#      [50,60)            290 (16.6)     58 (16.6)                    
#      [60,70)            555 (31.8)    111 (31.8)                    
#      [70,80)            515 (29.5)    103 (29.5)                    
#      [80,90)            145 ( 8.3)     29 ( 8.3)                    
#      [90,100)            10 ( 0.6)      2 ( 0.6)                    
#      [100,Inf]            0 ( 0.0)      0 ( 0.0)                    
#   age (mean (sd))     64.90 (12.47) 64.91 (12.49)  0.995      <0.001
#   meanbp1 (mean (sd)) 72.08 (30.68) 71.99 (30.89)  0.959       0.003


rhc_myf_df.stratified.Match_propensity_score_caplier.2 = rhc_mydata %>% f_df.stratified.Match(
    .vars4strata = c("female", "age.cut")
    , .vars4Matching = c("age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , propensity_score_matching = T
    , caliper = 0.2
)
rhc_myf_df.stratified.Match_propensity_score_caplier.2$Table1_post_total |> print(smd = T)  # ----
# > rhc_myf_df.stratified.Match_propensity_score_caplier.2 = rhc_mydata %>% f_df.stratified.Match(
# +     .vars4strata = c("female", "age.cut")
# +     , .vars4Matching = c("age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , propensity_score_matching = T
# +     , caliper = 0.2
# + )
# [1] "map to data.Match() with .mydata.strata_list$0_[10,20)"
# [1] "length(.mydata.Match) == 1 : .mydata.Match = NA"
# [1] "map to data.Match() with .mydata.strata_list$0_[100,Inf]"
# [1] "!identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )"
# [1] "length(unique(.mydata[[.exposure]]) < 2"
# [1] "map to data.Match() with .mydata.strata_list$0_[20,30)"
# [1] "map to data.Match() with .mydata.strata_list$0_[30,40)"
# [1] "map to data.Match() with .mydata.strata_list$0_[40,50)"
# [1] "map to data.Match() with .mydata.strata_list$0_[50,60)"
# [1] "map to data.Match() with .mydata.strata_list$0_[60,70)"
# [1] "map to data.Match() with .mydata.strata_list$0_[70,80)"
# [1] "map to data.Match() with .mydata.strata_list$0_[80,90)"
# [1] "map to data.Match() with .mydata.strata_list$0_[90,100)"
# [1] "map to data.Match() with .mydata.strata_list$1_[10,20)"
# [1] "length(.mydata.Match) == 1 : .mydata.Match = NA"
# [1] "map to data.Match() with .mydata.strata_list$1_[100,Inf]"
# [1] "!identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )"
# [1] "length(unique(.mydata[[.exposure]]) < 2"
# [1] "map to data.Match() with .mydata.strata_list$1_[20,30)"
# [1] "map to data.Match() with .mydata.strata_list$1_[30,40)"
# [1] "map to data.Match() with .mydata.strata_list$1_[40,50)"
# [1] "map to data.Match() with .mydata.strata_list$1_[50,60)"
# [1] "map to data.Match() with .mydata.strata_list$1_[60,70)"
# [1] "map to data.Match() with .mydata.strata_list$1_[70,80)"
# [1] "map to data.Match() with .mydata.strata_list$1_[80,90)"
# [1] "map to data.Match() with .mydata.strata_list$1_[90,100)"
# Warning messages:
# 1: In Match(Tr = .mydata.exposure.vars4Matching.na.omit.exposure.logical,  :
#   'Match' .object contains no valid matches (probably because of the caliper or the exact option).
# 2: In Match(Tr = .mydata.exposure.vars4Matching.na.omit.exposure.logical,  :
#   'Match' .object contains no valid matches (probably because of the caliper or the exact option).
# 3: In f_df.stratified.Match(., .vars4strata = c("female", "age.cut"),  :
#   length(unique(.mydata[[.exposure]]) < 2: 
# c("0_[10,20)", "0_[100,Inf]", "1_[10,20)", "1_[100,Inf]")
# > rhc_myf_df.stratified.Match_propensity_score_caplier.2$Table1_post_total |> print(smd = T)  # ----  
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3115           623                           
#   female (mean (sd))   0.45 (0.50)   0.45 (0.50)   1.000      <0.001
#   age.cut (%)                                      NaN        <0.001
#      [0,10)               0 ( 0.0)      0 ( 0.0)                    
#      [10,20)              0 ( 0.0)      0 ( 0.0)                    
#      [20,30)            120 ( 3.9)     24 ( 3.9)                    
#      [30,40)            240 ( 7.7)     48 ( 7.7)                    
#      [40,50)            365 (11.7)     73 (11.7)                    
#      [50,60)            500 (16.1)    100 (16.1)                    
#      [60,70)            780 (25.0)    156 (25.0)                    
#      [70,80)            760 (24.4)    152 (24.4)                    
#      [80,90)            335 (10.8)     67 (10.8)                    
#      [90,100)            15 ( 0.5)      3 ( 0.5)                    
#      [100,Inf]            0 ( 0.0)      0 ( 0.0)                    
#   age (mean (sd))     61.84 (15.98) 61.91 (15.99)  0.925       0.004
#   meanbp1 (mean (sd)) 82.63 (36.24) 82.62 (36.78)  0.995      <0.001


## @ test) f_df.stratified.Match() rhc_mydata.na ----  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
load(url("https://raw.githubusercontent.com/mkim0710/tidystat/master/data/rhc_mydata.rda"))
rhc_mydata$age.cut = rhc_mydata$age %>% cut(breaks = c(0, 10 * 1:10, Inf), include.lowest = T, right = F)
rhc_mydata.na = rhc_mydata
rhc_mydata.na$age[0:99 * 7 + 1] = NA
rhc_mydata.na$meanbp1[0:99 * 5 + 1] = NA
rhc_mydata.na |> str()
# > rhc_mydata.na |> str()
# 'data.frame':	5735 obs. of  14 variables:
#  $ ARF      : num  0 0 0 1 0 0 0 1 0 1 ...
#  $ CHF      : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ Cirr     : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ colcan   : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ Coma     : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ lungcan  : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ MOSF     : num  0 0 1 0 0 0 1 0 1 0 ...
#  $ sepsis   : num  0 1 0 0 1 0 0 0 0 0 ...
#  $ age      : num  NA 78.2 46.1 75.3 67.9 ...
#  $ female   : num  0 1 1 1 0 1 0 0 1 1 ...
#  $ meanbp1  : num  NA 63 57 55 65 NA 67 128 53 73 ...
#  $ treatment: num  0 1 1 0 1 0 0 0 0 1 ...
#  $ died     : num  0 1 0 1 1 0 0 1 0 0 ...
#  $ age.cut  : Factor w/ 11 levels "[0,10)","[10,20)",..: 8 8 5 8 7 9 6 5 2 5 ...
rhc_mydata.na.stratified.Match = rhc_mydata.na %>% f_df.stratified.Match(
    .vars4strata = c("female", "age.cut")
    , .vars4Matching = c("age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = T
)
# > rhc_mydata.na.stratified.Match = rhc_mydata.na %>% f_df.stratified.Match(
# +     .vars4strata = c("female", "age.cut")
# +     , .vars4Matching = c("age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = T
# + )
# [1] "map to data.Match() with .mydata.strata_list$0_[10,20)"
# [1] "data.Match() - dim(.mydata) : c(22L, 16L)"
# [1] "data.Match() - dim(.X) : c(20L, 3L)"
#  Show Traceback
#  
#  Rerun with Debug
#  Error in Match(Tr = .mydata.exposure.vars4Matching.na.omit[[.exposure]],  : 
#   length(Tr) != nrow(X) 
rhc_mydata.na.stratified.Match = rhc_mydata.na %>% f_df.stratified.Match(
    .vars4strata = c("female", "age.cut")
    , .vars4Matching = c("age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = T
    , apply.na.omit = T
)
# > rhc_mydata.na.stratified.Match = rhc_mydata.na %>% f_df.stratified.Match(
# +     .vars4strata = c("female", "age.cut")
# +     , .vars4Matching = c("age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = T
# +     , apply.na.omit = T
# + )
# [1] "map to data.Match() with .mydata.strata_list$0_[10,20)"
# [1] "apply.na.omit == T : removing 2 rows - from 22 rows to 20 rows"
# [1] "data.Match() - dim(.mydata) : c(22L, 16L)"
# [1] "data.Match() - dim(.X) : c(20L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[100,Inf]"
# [1] "map to data.Match() with .mydata.strata_list$0_[20,30)"
# [1] "apply.na.omit == T : removing 0 rows - from 135 rows to 135 rows"
# [1] "data.Match() - dim(.mydata) : c(135L, 16L)"
# [1] "data.Match() - dim(.X) : c(135L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[30,40)"
# [1] "apply.na.omit == T : removing 7 rows - from 242 rows to 235 rows"
# [1] "data.Match() - dim(.mydata) : c(242L, 16L)"
# [1] "data.Match() - dim(.X) : c(235L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[40,50)"
# [1] "apply.na.omit == T : removing 13 rows - from 404 rows to 391 rows"
# [1] "data.Match() - dim(.mydata) : c(404L, 16L)"
# [1] "data.Match() - dim(.X) : c(391L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[50,60)"
# [1] "apply.na.omit == T : removing 17 rows - from 527 rows to 510 rows"
# [1] "data.Match() - dim(.mydata) : c(527L, 16L)"
# [1] "data.Match() - dim(.X) : c(510L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[60,70)"
# [1] "apply.na.omit == T : removing 29 rows - from 802 rows to 773 rows"
# [1] "data.Match() - dim(.mydata) : c(802L, 16L)"
# [1] "data.Match() - dim(.X) : c(773L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[70,80)"
# [1] "apply.na.omit == T : removing 28 rows - from 757 rows to 729 rows"
# [1] "data.Match() - dim(.mydata) : c(757L, 16L)"
# [1] "data.Match() - dim(.X) : c(729L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[80,90)"
# [1] "apply.na.omit == T : removing 9 rows - from 270 rows to 261 rows"
# [1] "data.Match() - dim(.mydata) : c(270L, 16L)"
# [1] "data.Match() - dim(.X) : c(261L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$0_[90,100)"
# [1] "apply.na.omit == T : removing 1 rows - from 32 rows to 31 rows"
# [1] "data.Match() - dim(.mydata) : c(32L, 16L)"
# [1] "data.Match() - dim(.X) : c(31L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[10,20)"
# [1] "apply.na.omit == T : removing 0 rows - from 11 rows to 11 rows"
# [1] "data.Match() - dim(.mydata) : c(11L, 16L)"
# [1] "data.Match() - dim(.X) : c(11L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[100,Inf]"
# [1] "map to data.Match() with .mydata.strata_list$1_[20,30)"
# [1] "apply.na.omit == T : removing 3 rows - from 117 rows to 114 rows"
# [1] "data.Match() - dim(.mydata) : c(117L, 16L)"
# [1] "data.Match() - dim(.X) : c(114L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[30,40)"
# [1] "apply.na.omit == T : removing 9 rows - from 211 rows to 202 rows"
# [1] "data.Match() - dim(.mydata) : c(211L, 16L)"
# [1] "data.Match() - dim(.X) : c(202L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[40,50)"
# [1] "apply.na.omit == T : removing 12 rows - from 282 rows to 270 rows"
# [1] "data.Match() - dim(.mydata) : c(282L, 16L)"
# [1] "data.Match() - dim(.X) : c(270L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[50,60)"
# [1] "apply.na.omit == T : removing 7 rows - from 390 rows to 383 rows"
# [1] "data.Match() - dim(.mydata) : c(390L, 16L)"
# [1] "data.Match() - dim(.X) : c(383L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[60,70)"
# [1] "apply.na.omit == T : removing 16 rows - from 587 rows to 571 rows"
# [1] "data.Match() - dim(.mydata) : c(587L, 16L)"
# [1] "data.Match() - dim(.X) : c(571L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[70,80)"
# [1] "apply.na.omit == T : removing 19 rows - from 581 rows to 562 rows"
# [1] "data.Match() - dim(.mydata) : c(581L, 16L)"
# [1] "data.Match() - dim(.X) : c(562L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[80,90)"
# [1] "apply.na.omit == T : removing 9 rows - from 305 rows to 296 rows"
# [1] "data.Match() - dim(.mydata) : c(305L, 16L)"
# [1] "data.Match() - dim(.X) : c(296L, 3L)"
# [1] "map to data.Match() with .mydata.strata_list$1_[90,100)"
# [1] "apply.na.omit == T : removing 4 rows - from 57 rows to 53 rows"
# [1] "data.Match() - dim(.mydata) : c(57L, 16L)"
# [1] "data.Match() - dim(.X) : c(53L, 3L)"
# Warning messages:
# 1: In data.Match(., ...) :
#   !identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )
# 2: In data.Match(., ...) : length(unique(.mydata[[.exposure]]) < 2
# 3: In data.Match(., ...) :
#   !identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )
# 4: In data.Match(., ...) : length(unique(.mydata[[.exposure]]) < 2
# 5: In f_df.stratified.Match(., .vars4strata = c("female", "age.cut"),  :
#   length(unique(.mydata[[.exposure]]) < 2: 
# c("0_[100,Inf]", "1_[100,Inf]")

rhc_mydata.na.stratified.Match = rhc_mydata.na %>% f_df.stratified.Match(
    .vars4strata = c("female", "age.cut")
    , .vars4Matching = c("age","meanbp1")
    , .exposure = "treatment"
    , .MatchingRatio = 5
    , print.process = F
    , apply.na.omit = T
)
# > rhc_mydata.na.stratified.Match = rhc_mydata.na %>% f_df.stratified.Match(
# +     .vars4strata = c("female", "age.cut")
# +     , .vars4Matching = c("age","meanbp1")
# +     , .exposure = "treatment"
# +     , .MatchingRatio = 5
# +     , print.process = F
# +     , apply.na.omit = T
# + )
# [1] "apply.na.omit == T : removing 2 rows - from 22 rows to 20 rows"
# [1] "apply.na.omit == T : removing 0 rows - from 135 rows to 135 rows"
# [1] "apply.na.omit == T : removing 7 rows - from 242 rows to 235 rows"
# [1] "apply.na.omit == T : removing 13 rows - from 404 rows to 391 rows"
# [1] "apply.na.omit == T : removing 17 rows - from 527 rows to 510 rows"
# [1] "apply.na.omit == T : removing 29 rows - from 802 rows to 773 rows"
# [1] "apply.na.omit == T : removing 28 rows - from 757 rows to 729 rows"
# [1] "apply.na.omit == T : removing 9 rows - from 270 rows to 261 rows"
# [1] "apply.na.omit == T : removing 1 rows - from 32 rows to 31 rows"
# [1] "apply.na.omit == T : removing 0 rows - from 11 rows to 11 rows"
# [1] "apply.na.omit == T : removing 3 rows - from 117 rows to 114 rows"
# [1] "apply.na.omit == T : removing 9 rows - from 211 rows to 202 rows"
# [1] "apply.na.omit == T : removing 12 rows - from 282 rows to 270 rows"
# [1] "apply.na.omit == T : removing 7 rows - from 390 rows to 383 rows"
# [1] "apply.na.omit == T : removing 16 rows - from 587 rows to 571 rows"
# [1] "apply.na.omit == T : removing 19 rows - from 581 rows to 562 rows"
# [1] "apply.na.omit == T : removing 9 rows - from 305 rows to 296 rows"
# [1] "apply.na.omit == T : removing 4 rows - from 57 rows to 53 rows"
# Warning messages:
# 1: In .f(.x[[i]], ...) :
#   !identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )
# 2: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# 3: In .f(.x[[i]], ...) :
#   !identical( sort(as.integer(unique(.mydata.exposure.vars4Matching.na.omit.exposure.logical))), 0:1 )
# 4: In .f(.x[[i]], ...) : length(unique(.mydata[[.exposure]]) < 2
# 5: In f_df.stratified.Match(., .vars4strata = c("female", "age.cut"),  :
#   length(unique(.mydata[[.exposure]]) < 2: 
# c("0_[100,Inf]", "1_[100,Inf]")




rhc_mydata.na.stratified.Match |> str(max.level = 1)
rhc_mydata.na.stratified.Match %>% attr("function.input") |> str()
# > rhc_mydata.na.stratified.Match |> str(max.level = 1)
# List of 4
#  $ Table1_pre       :List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ data               :Classes ??tbl_df??, ??tbl?? and 'data.frame':	4086 obs. of  18 variables:
#   ..- attr(*, ".vars4Matching")= chr [1:2] "age" "meanbp1"
#   ..- attr(*, ".exposure")= chr "treatment"
#   ..- attr(*, ".MatchingRatio")= num 5
#   ..- attr(*, "apply.na.omit")= logi TRUE
#   ..- attr(*, ".vars4strata")= chr [1:2] "female" "age.cut"
#  $ Table1_post_total:List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ Table1_post_i    :List of 5
#  - attr(*, "function.input")=List of 8
# > rhc_mydata.na.stratified.Match %>% attr("function.input") |> str()
# List of 8
#  $ f_df.stratified.Match:function (.mydata, .vars4strata = c("female", "age.cut"), .vars4Matching = c("age", "income"), .exposure = "treatment", .MatchingRatio = 5, .paralletlsugar = F, apply.na.omit = F, 
#     print.process = F, load.dependent.library = T, propensity_score_matching = F)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 25 361 1 25 1 1 361
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000288e66c0> 
#  $ data.strata_list     :function (.mydata, .vars4strata = c("female", "age.cut"))  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 29 24 52 5 24 5 29 52
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000288e66c0> 
#  $ data.Match           :function (.mydata, .vars4Matching = c("female", "income"), .exposure = "treatment", .MatchingRatio = 5, add_Table1_pre_post = T, RowNum_original_before_strata = NULL, 
#     apply.na.omit = F, print.process = F, load.dependent.library = T, propensity_score_matching = F, propensity_score_matching_weight = F, apply.function.dichotomous2logical = F)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 55 18 273 5 18 5 55 273
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000288e66c0> 
#  $ .vars4strata         : chr [1:2] "female" "age.cut"
#  $ .vars4Matching       : chr [1:2] "age" "meanbp1"
#  $ .exposure            : chr "treatment"
#  $ .MatchingRatio       : num 5
#  $ apply.na.omit        : logi TRUE

rhc_mydata.Match$data |> dim()
rhc_myf_df.stratified.Match$data |> dim()
rhc_mydata.na.stratified.Match$data |> dim()
# > rhc_mydata.Match$data |> dim()
# [1] 4260   17
# > rhc_myf_df.stratified.Match$data |> dim()
# [1] 4212   19
# > rhc_mydata.na.stratified.Match$data |> dim()
# [1] 4086   19
4260 - 4086
# > 4260 - 4086
# [1] 174


rhc_mydata.na.stratified.Match$Table1_pre |> print(smd = T)
rhc_mydata.na.stratified.Match$Table1_post_total |> print(smd = T)
rhc_mydata.na.stratified.Match$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
rhc_mydata.na.stratified.Match$data
# > rhc_mydata.na.stratified.Match$Table1_pre |> print(smd = T)
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
#   age (mean (sd))     61.68 (17.28) 60.71 (15.62)  0.034       0.059
#   meanbp1 (mean (sd)) 84.83 (38.87) 68.14 (34.22) <0.001       0.456
# > rhc_mydata.na.stratified.Match$Table1_post_total |> print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                    3405           681                           
#   female (mean (sd))   0.46 (0.50)   0.46 (0.50)   1.000      <0.001
#   age.cut (%)                                      NaN        <0.001
#      [0,10)               0 ( 0.0)      0 ( 0.0)                    
#      [10,20)             20 ( 0.6)      4 ( 0.6)                    
#      [20,30)            150 ( 4.4)     30 ( 4.4)                    
#      [30,40)            290 ( 8.5)     58 ( 8.5)                    
#      [40,50)            385 (11.3)     77 (11.3)                    
#      [50,60)            525 (15.4)    105 (15.4)                    
#      [60,70)            780 (22.9)    156 (22.9)                    
#      [70,80)            785 (23.1)    157 (23.1)                    
#      [80,90)            405 (11.9)     81 (11.9)                    
#      [90,100)            65 ( 1.9)     13 ( 1.9)                    
#      [100,Inf]            0 ( 0.0)      0 ( 0.0)                    
#   age (mean (sd))     61.72 (17.17) 61.77 (16.88)  0.941       0.003
#   meanbp1 (mean (sd)) 84.27 (38.26) 68.20 (34.25) <0.001       0.443
# > rhc_mydata.na.stratified.Match$Table1_post_i$MatchingCtrlNum_0_5 |> print(smd = T)
#                      Stratified by treatment
#                       0             1             p      test SMD   
#   n                     681           681                           
#   female (mean (sd))   0.46 (0.50)   0.46 (0.50)   1.000      <0.001
#   age.cut (%)                                      NaN        <0.001
#      [0,10)               0 ( 0.0)      0 ( 0.0)                    
#      [10,20)              4 ( 0.6)      4 ( 0.6)                    
#      [20,30)             30 ( 4.4)     30 ( 4.4)                    
#      [30,40)             58 ( 8.5)     58 ( 8.5)                    
#      [40,50)             77 (11.3)     77 (11.3)                    
#      [50,60)            105 (15.4)    105 (15.4)                    
#      [60,70)            156 (22.9)    156 (22.9)                    
#      [70,80)            157 (23.1)    157 (23.1)                    
#      [80,90)             81 (11.9)     81 (11.9)                    
#      [90,100)            13 ( 1.9)     13 ( 1.9)                    
#      [100,Inf]            0 ( 0.0)      0 ( 0.0)                    
#   age (mean (sd))     61.73 (17.12) 61.77 (16.88)  0.965       0.002
#   meanbp1 (mean (sd)) 84.87 (38.44) 68.20 (34.25) <0.001       0.458
# > rhc_mydata.na.stratified.Match$data
# # A tibble: 4,086 x 18
#      ARF   CHF  Cirr colcan  Coma lungcan  MOSF sepsis      age female meanbp1 treatment  died age.cut    strata RowNum_original MatchingPairID MatchingCtrlNum
#    <dbl> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>  <dbl>    <dbl>  <dbl>   <dbl>     <dbl> <dbl>  <fctr>    <fctr>           <int>         <fctr>           <dbl>
#  1     0     0     0      0     0       0     0      1 19.85199      0      63         1     1 [10,20) 0_[10,20)            3746    0_[10,20)_1               0
#  2     1     0     0      0     0       0     0      0 19.92599      0      41         0     0 [10,20) 0_[10,20)             607    0_[10,20)_1               1
#  3     1     0     0      0     0       0     0      0 19.79199      0      66         0     0 [10,20) 0_[10,20)             714    0_[10,20)_1               2
#  4     1     0     0      0     0       0     0      0 19.70999      0      55         0     1 [10,20) 0_[10,20)            3399    0_[10,20)_1               3
#  5     1     0     0      0     0       0     0      0 19.75099      0      53         0     0 [10,20) 0_[10,20)            4066    0_[10,20)_1               4
#  6     1     0     0      0     0       0     0      0 19.82999      0      63         0     0 [10,20) 0_[10,20)            4568    0_[10,20)_1               5
#  7     1     0     0      0     0       0     0      0 19.81899      0      17         1     0 [10,20) 0_[10,20)            4020    0_[10,20)_2               0
#  8     0     0     0      0     0       0     0      1 18.84999      0      63         0     0 [10,20) 0_[10,20)            1949    0_[10,20)_2               1
#  9     0     0     0      0     0       0     0      1 18.41499      0      53         0     0 [10,20) 0_[10,20)            2553    0_[10,20)_2               2
# 10     1     0     0      0     0       0     0      0 19.17599      0      62         0     0 [10,20) 0_[10,20)            2647    0_[10,20)_2               3
# # ... with 4,076 more rows


rhc_mydata.na.stratified.Match$data |> summary()
# rhc_mydata.na.stratified.Match$data$RowNum_original_before_strata |> unique() |> length()
# rhc_mydata.na.stratified.Match$data$RowNum_original |> unique() |> length()
# rhc_mydata.na.stratified.Match$data$RowNum_after_na.omit |> unique() |> length()
# # > rhc_mydata.na.stratified.Match$data$RowNum_original_before_strata |> unique() |> length()
# # [1] 4086
# # > rhc_mydata.na.stratified.Match$data$RowNum_original |> unique() |> length()
# # [1] 741
# # > rhc_mydata.na.stratified.Match$data$RowNum_after_na.omit |> unique() |> length()
# # [1] 719
rhc_mydata.na.stratified.Match$data$RowNum_original |> unique() |> length()
# > rhc_mydata.na.stratified.Match$data$RowNum_original |> unique() |> length()
# [1] 4086
  
  
# __________|------  
# @@ END-----  
