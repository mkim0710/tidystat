# data.recode.factor.source.r
# analyticDF_C24.drop_pmhx_negativetime.list.cut from analyticDF_C24.drop_pmhx_negativetime.list .r

analyticDF_C24.drop_pmhx_negativetime.list$`_5yr` %>% str(give.attr = F)
# > analyticDF_C24.drop_pmhx_negativetime.list$`_5yr` %>% str(give.attr = F)
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	461489 obs. of  22 variables:
#  $ AGE                   : num  70 52 42 44 56 54 43 58 45 55 ...
#  $ AGE_group             : Factor w/ 4 levels "40-","50-","60-",..: 4 2 1 1 2 2 1 2 1 2 ...
#  $ SEX                   : Factor w/ 2 levels "Male","Female": 1 1 1 1 1 1 1 1 1 1 ...
#  $ Socioeconomic         : Factor w/ 4 levels "SEcoQ1","SEcoQ2",..: 1 4 2 4 2 1 3 1 3 1 ...
#  $ Disability            : Factor w/ 3 levels "None","Level 1-2",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ CigaretteSmoking_yr   : Factor w/ 3 levels "Non-Smoker","PastSmoker",..: 1 2 1 3 NA 3 1 3 3 1 ...
#  $ DrinkHabit_yr         : Factor w/ 3 levels "No consumption or <3times/month",..: 1 1 1 1 NA 1 2 3 2 1 ...
#  $ ExcerciseFreq_yr      : Factor w/ 3 levels "No Exercise",..: 1 1 2 2 NA 1 1 3 1 1 ...
#  $ CCI_yr                : num  1 5 6 1 1 0 0 2 0 2 ...
#  $ total_ddd_yr_ASPIRIN  : num  0 924 0 0 0 ...
#  $ total_ddd_yr_NSAID    : num  18.5 4.5 89.5 12.6 3 ...
#  $ total_ddd_yr_H2B      : num  22 7.5 3.75 3.75 0 ...
#  $ total_ddd_yr_PPI      : num  0 0 0 0 0 0 31 0 0 0 ...
#  $ BMI_Q_yr              : Factor w/ 5 levels "0-","18.5-","23-",..: 3 3 1 2 3 2 2 4 3 4 ...
#  $ bloodglucose_yr       : Factor w/ 3 levels "Normal<100","100-126",..: 1 2 3 1 2 1 1 1 1 1 ...
#  $ total_ddd_yr_METFORMIN: num  0 790 240 0 0 ...
#  $ pmhx_DM_yr            : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ Tcholesterol_yr       : Factor w/ 3 levels "Normal<200","200-240",..: 1 3 1 2 2 2 1 1 1 1 ...
#  $ total_ddd_yr_STATIN   : num  0 0 40 0 0 0 0 0 0 0 ...
#  $ BPressure_yr          : Factor w/ 3 levels "<120/80",">=120/80",..: 3 3 1 1 2 3 1 3 2 2 ...
#  $ fuduration_yr         : num  92 2556 970 2556 2556 ...
#  $ evnttrth_C24_r        : num  0 0 0 0 0 0 0 0 0 0 ...



# > i = 3
# > c(0, .001, 30, 365 * 1:(i-1), Inf)
# [1]   0.000   0.001  30.000 365.000 730.000     Inf
# > i = 7
# > c(0, .001, 30, 365 * 1:(i-1), Inf)
#  [1]    0.000    0.001   30.000  365.000  730.000 1095.000 1460.000 1825.000 2190.000      Inf


breaks = c(0, .001, 30, Inf)
((0:20)/10000) %>% cut(breaks, include.lowest = T, right = F) %>% dput
((0:20)/10000) %>% cut(breaks, include.lowest = T, right = F) %>% summary
((0:20)/10000 >= 0.001) %>% summary 
# > ((0:20)/10000) %>% cut(breaks, include.lowest = T, right = F) %>% dput
# structure(c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 
# 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L), .Label = c("[0,0.001)", "[0.001,30)", 
# "[30,Inf]"), class = "factor")
# > ((0:20)/10000) %>% cut(breaks, include.lowest = T, right = F) %>% summary
#  [0,0.001) [0.001,30)   [30,Inf] 
#         10         11          0 
# > ((0:20)/10000 >= 0.001) %>% summary
#    Mode   FALSE    TRUE 
# logical      10      11 






#@ analyticDF_C24.drop_pmhx_negativetime.list.cut ====
analyticDF_C24.drop_pmhx_negativetime.list.cut <- analyticDF_C24.drop_pmhx_negativetime.list
for (i in 3:7) {
    iname <- paste0("_",i,"yr")

    for (j in c("total_ddd_yr_ASPIRIN", "total_ddd_yr_NSAID")) {
        analyticDF_C24.drop_pmhx_negativetime.list.cut[[iname]][[paste0(j,".dyd")]] = analyticDF_C24.drop_pmhx_negativetime.list.cut[[iname]][[j]] / 365
        breaks = c(0, .001, 30, 365 * 1:(i-1), Inf)
        analyticDF_C24.drop_pmhx_negativetime.list.cut[[iname]][[paste0(j,".cut")]] = analyticDF_C24.drop_pmhx_negativetime.list.cut[[iname]][[j]] %>% 
            cut(breaks, include.lowest = T, right = F)
        breaks = c(0, 365 * 1:(i-1), Inf)
        analyticDF_C24.drop_pmhx_negativetime.list.cut[[iname]][[paste0(j,".cut.yr")]] = analyticDF_C24.drop_pmhx_negativetime.list.cut[[iname]][[j]] %>% 
            cut(breaks, include.lowest = T, right = F)
        breaks = c(0, 30, Inf)
        analyticDF_C24.drop_pmhx_negativetime.list.cut[[iname]][[paste0(j,".ge30")]] = analyticDF_C24.drop_pmhx_negativetime.list.cut[[iname]][[j]] %>% 
            cut(breaks, include.lowest = T, right = F)
        breaks = c(0, .001, Inf)
        analyticDF_C24.drop_pmhx_negativetime.list.cut[[iname]][[paste0(j,".ge001")]] = analyticDF_C24.drop_pmhx_negativetime.list.cut[[iname]][[j]] %>% 
            cut(breaks, include.lowest = T, right = F)
    }
    # for (j in c("total_ddd_yr_H2B", "total_ddd_yr_PPI")) {
    #     # [0.001,30) > [30,Inf]
    #     # could be included with common cold medication: total_ddd_yr_H2B  total_ddd_yr_NSAID   total_ddd_yr_PPI  
    #     # merge [0.001,30) with [0,0.001)
    #     breaks = c(0, 30, Inf)
    #     analyticDF_C24.drop_pmhx_negativetime.list.cut[[iname]][[j]] = analyticDF_C24.drop_pmhx_negativetime.list.cut[[iname]][[j]] %>% 
    #         cut(breaks, include.lowest = T, right = F)
    # }
    # for (j in c("total_ddd_yr_BIS", "total_ddd_yr_METFORMIN", "total_ddd_yr_STATIN")) {
    #     # [0.001,30) < [30,Inf]
    #     # cannot be prescribed without indication: total_ddd_yr_BIS    total_ddd_yr_METFORMIN total_ddd_yr_STATIN
    #     # merge [0.001,30) with [30,Inf]
    for (j in c("total_ddd_yr_H2B", "total_ddd_yr_PPI", "total_ddd_yr_METFORMIN", "total_ddd_yr_STATIN")) {
        # [0.001,30) < [30,Inf]
        # cannot be prescribed without indication: total_ddd_yr_BIS    total_ddd_yr_METFORMIN total_ddd_yr_STATIN
        # merge [0.001,30) with [30,Inf]
        breaks = c(0, 30, Inf)
        analyticDF_C24.drop_pmhx_negativetime.list.cut[[iname]][[paste0(j,".ge30")]] = analyticDF_C24.drop_pmhx_negativetime.list.cut[[iname]][[j]] %>% 
            cut(breaks, include.lowest = T, right = F)
        breaks = c(0, .001, Inf)
        analyticDF_C24.drop_pmhx_negativetime.list.cut[[iname]][[paste0(j,".ge001")]] = analyticDF_C24.drop_pmhx_negativetime.list.cut[[iname]][[j]] %>% 
            cut(breaks, include.lowest = T, right = F)
    }
    analyticDF_C24.drop_pmhx_negativetime.list.cut[[iname]]$total_ddd_yr_BIS <- NULL

}
?as.factor

?dplyr::recode
analyticDF_C24.drop_pmhx_negativetime.list.cut$`_5yr`$BMI_Q_yr %>% summary
# > analyticDF_C24.drop_pmhx_negativetime.list.cut$`_5yr`$BMI_Q_yr %>% summary
#     0-  18.5-    23-    25-    30-   NA's 
#   9872 162466 127857 148005  13155    134


analyticDF_C24.drop_pmhx_negativetime.list.cut$`_5yr`$BMI_Q_yr %>% levels %>% dput
# > analyticDF_C24.drop_pmhx_negativetime.list.cut$`_5yr`$BMI_Q_yr %>% levels %>% dput
# c("0-", "18.5-", "23-", "25-", "30-")

txt = "BMI_lt23, BMI_ge23lt25, BMI_cut2325"
txt %>% str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') %>% cat
# > txt = "BMI_lt23, BMI_ge23lt25, BMI_cut2325"
# > txt %>% str_extract_all("[A-z0-9_]+") %>% paste0(collapse = '", "') %>% cat
# c("BMI_lt23", "BMI_ge23lt25", "BMI_cut2325")




analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
    map(function(df) {
        df = df %>% mutate(
            BMI_lt23 = BMI_Q_yr %in% c("0-", "18.5-")
            , BMI_ge23lt25 = BMI_Q_yr %in% c("23-")
            , BMI_ge25 = BMI_Q_yr %in% c("25-", "30-")
            , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100)
        )
    }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) %>% summary
# > analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
# +     map(function(df) {
# +         df = df %>% mutate(
# +             BMI_lt23 = BMI_Q_yr %in% c("0-", "18.5-")
# +             , BMI_ge23lt25 = BMI_Q_yr %in% c("23-")
# +             , BMI_ge25 = BMI_Q_yr %in% c("25-", "30-")
# +             , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100)
# +         )
# +     }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) %>% summary
#   BMI_Q_yr       BMI_lt23       BMI_ge23lt25     BMI_ge25        BMI_cut2325  
#  0-   :  9872   Mode :logical   Mode :logical   Mode :logical   Min.   :-Inf  
#  18.5-:162466   FALSE:289151    FALSE:333632    FALSE:300329    1st Qu.:   0  
#  23-  :127857   TRUE :172338    TRUE :127857    TRUE :161160    Median :   1  
#  25-  :148005                                                   Mean   :-Inf  
#  30-  : 13155                                                   3rd Qu.:   2  
#  NA's :   134                                                   Max.   :   2  

?`%in%`
# Usage
# 
# match(x, table, nomatch = NA_integer_, incomparables = NULL)
# 
# x %in% table
# 
# %in% is currently defined as 
# "%in%" <- function(x, table) match(x, table, nomatch = 0) > 0


analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
    map(function(df) {
        df = df %>% mutate(
            BMI_lt23 = BMI_Q_yr %>% match(c("0-", "18.5-"))
            , BMI_ge23lt25 = BMI_Q_yr %>% match(c("23-"))
            , BMI_ge25 = BMI_Q_yr %>% match(c("25-", "30-"))
            , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100)
        )
    }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) %>% summary
# > analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
# +     map(function(df) {
# +         df = df %>% mutate(
# +             BMI_lt23 = BMI_Q_yr %>% match(c("0-", "18.5-"))
# +             , BMI_ge23lt25 = BMI_Q_yr %>% match(c("23-"))
# +             , BMI_ge25 = BMI_Q_yr %>% match(c("25-", "30-"))
# +             , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100)
# +         )
# +     }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) %>% summary
#   BMI_Q_yr         BMI_lt23       BMI_ge23lt25       BMI_ge25       BMI_cut2325    
#  0-   :  9872   Min.   :1.00     Min.   :1        Min.   :1.00     Min.   : NA     
#  18.5-:162466   1st Qu.:2.00     1st Qu.:1        1st Qu.:1.00     1st Qu.: NA     
#  23-  :127857   Median :2.00     Median :1        Median :1.00     Median : NA     
#  25-  :148005   Mean   :1.94     Mean   :1        Mean   :1.08     Mean   :NaN     
#  30-  : 13155   3rd Qu.:2.00     3rd Qu.:1        3rd Qu.:1.00     3rd Qu.: NA     
#  NA's :   134   Max.   :2.00     Max.   :1        Max.   :2.00     Max.   : NA     
#                 NA's   :289151   NA's   :333632   NA's   :300329   NA's   :461489  


analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
    map(function(df) {
        df = df %>% mutate(
            BMI_lt23 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("0-", "18.5-"))}
            , BMI_ge23lt25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("23-"))}
            , BMI_ge25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("25-", "30-"))}
            , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100)
        )
    }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) %>% summary
# > analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
# +     map(function(df) {
# +         df = df %>% mutate(
# +             BMI_lt23 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("0-", "18.5-"))}
# +             , BMI_ge23lt25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("23-"))}
# +             , BMI_ge25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("25-", "30-"))}
# +             , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100)
# +         )
# +     }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) %>% summary
#   BMI_Q_yr         BMI_lt23       BMI_ge23lt25       BMI_ge25       BMI_cut2325    
#  0-   :  9872   Min.   :0.0000   Min.   :0.0000   Min.   :0.0000   Min.   :0.0000  
#  18.5-:162466   1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.0000  
#  23-  :127857   Median :0.0000   Median :0.0000   Median :0.0000   Median :1.0000  
#  25-  :148005   Mean   :0.3735   Mean   :0.2771   Mean   :0.3493   Mean   :0.9758  
#  30-  : 13155   3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:2.0000  
#  NA's :   134   Max.   :1.0000   Max.   :1.0000   Max.   :1.0000   Max.   :2.0000  
#                 NA's   :134      NA's   :134      NA's   :134      NA's   :134    

analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
    map(function(df) {
        df = df %>% mutate(
            BMI_lt23 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("0-", "18.5-"))}
            , BMI_ge23lt25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("23-"))}
            , BMI_ge25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("25-", "30-"))}
            , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100)
        )
    }) %>% {.[["_5yr"]]} %>% select(matches("BMI"))
# > analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
# +     map(function(df) {
# +         df = df %>% mutate(
# +             BMI_lt23 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("0-", "18.5-"))}
# +             , BMI_ge23lt25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("23-"))}
# +             , BMI_ge25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("25-", "30-"))}
# +             , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100)
# +         )
# +     }) %>% {.[["_5yr"]]} %>% select(matches("BMI"))
# # A tibble: 461,489 x 5
#    BMI_Q_yr BMI_lt23 BMI_ge23lt25 BMI_ge25 BMI_cut2325
#    <fct>       <int>        <int>    <int>       <dbl>
#  1 23-             0            1        0           1
#  2 23-             0            1        0           1
#  3 0-              1            0        0           0
#  4 18.5-           1            0        0           0
#  5 23-             0            1        0           1
#  6 18.5-           1            0        0           0
#  7 18.5-           1            0        0           0
#  8 25-             0            0        1           2
#  9 23-             0            1        0           1
# 10 25-             0            0        1           2
# # ... with 461,479 more rows


analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
    map(function(df) {
        df = df %>% mutate(
            BMI_lt23 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("0-", "18.5-"))}
            , BMI_ge23lt25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("23-"))}
            , BMI_ge25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("25-", "30-"))}
            , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100) %>% as.ordered
        )
    }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) %>% summary
analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
    map(function(df) {
        df = df %>% mutate(
            BMI_lt23 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("0-", "18.5-"))}
            , BMI_ge23lt25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("23-"))}
            , BMI_ge25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("25-", "30-"))}
            , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100) %>% ordered(label = c("BMI_lt23", "BMI_ge23lt25", "BMI_cut2325"))
        )
    }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) %>% summary
# > analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
# +     map(function(df) {
# +         df = df %>% mutate(
# +             BMI_lt23 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("0-", "18.5-"))}
# +             , BMI_ge23lt25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("23-"))}
# +             , BMI_ge25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("25-", "30-"))}
# +             , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100) %>% as.ordered
# +         )
# +     }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) %>% summary
#   BMI_Q_yr         BMI_lt23       BMI_ge23lt25       BMI_ge25      BMI_cut2325  
#  0-   :  9872   Min.   :0.0000   Min.   :0.0000   Min.   :0.0000   0   :172338  
#  18.5-:162466   1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.0000   1   :127857  
#  23-  :127857   Median :0.0000   Median :0.0000   Median :0.0000   2   :161160  
#  25-  :148005   Mean   :0.3735   Mean   :0.2771   Mean   :0.3493   NA's:   134  
#  30-  : 13155   3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:1.0000                
#  NA's :   134   Max.   :1.0000   Max.   :1.0000   Max.   :1.0000                
#                 NA's   :134      NA's   :134      NA's   :134                   
# > analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
# +     map(function(df) {
# +         df = df %>% mutate(
# +             BMI_lt23 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("0-", "18.5-"))}
# +             , BMI_ge23lt25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("23-"))}
# +             , BMI_ge25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("25-", "30-"))}
# +             , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100) %>% ordered(label = c("BMI_lt23", "BMI_ge23lt25", "BMI_cut2325"))
# +         )
# +     }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) %>% summary
#   BMI_Q_yr         BMI_lt23       BMI_ge23lt25       BMI_ge25            BMI_cut2325    
#  0-   :  9872   Min.   :0.0000   Min.   :0.0000   Min.   :0.0000   BMI_lt23    :172338  
#  18.5-:162466   1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.0000   BMI_ge23lt25:127857  
#  23-  :127857   Median :0.0000   Median :0.0000   Median :0.0000   BMI_cut2325 :161160  
#  25-  :148005   Mean   :0.3735   Mean   :0.2771   Mean   :0.3493   NA's        :   134  
#  30-  : 13155   3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:1.0000                        
#  NA's :   134   Max.   :1.0000   Max.   :1.0000   Max.   :1.0000                        
#                 NA's   :134      NA's   :134      NA's   :134  




analyticDF_C24.drop_pmhx_negativetime.list.cut = 
    analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
    map(function(df) {
        df = df %>% mutate(
            BMI_lt23 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("0-", "18.5-"))}
            , BMI_ge23lt25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("23-"))}
            , BMI_ge25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("25-", "30-"))}
            , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100) %>% ordered(label = c("BMI_lt23", "BMI_ge23lt25", "BMI_cut2325"))
        )
    })



analyticDF_C24.drop_pmhx_negativetime.list.cut %>% str(max.level = 1) #----
analyticDF_C24.drop_pmhx_negativetime.list.cut$`_5yr` %>% str(give.attr = F) #----
# > analyticDF_C24.drop_pmhx_negativetime.list.cut %>% str(max.level = 1)
# List of 5
#  $ _3yr:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	481536 obs. of  44 variables:
#  $ _4yr:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	471223 obs. of  44 variables:
#  $ _5yr:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	461489 obs. of  44 variables:
#  $ _6yr:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	451428 obs. of  44 variables:
#  $ _7yr:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	440469 obs. of  44 variables:
# > analyticDF_C24.drop_pmhx_negativetime.list.cut$`_5yr` %>% str(give.attr = F) #----
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	461489 obs. of  44 variables:
#  $ AGE                         : num  70 52 42 44 56 54 43 58 45 55 ...
#  $ AGE_group                   : Factor w/ 4 levels "40-","50-","60-",..: 4 2 1 1 2 2 1 2 1 2 ...
#  $ SEX                         : Factor w/ 2 levels "Male","Female": 1 1 1 1 1 1 1 1 1 1 ...
#  $ Socioeconomic               : Factor w/ 4 levels "SEcoQ1","SEcoQ2",..: 1 4 2 4 2 1 3 1 3 1 ...
#  $ Disability                  : Factor w/ 3 levels "None","Level 1-2",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ CigaretteSmoking_yr         : Factor w/ 3 levels "Non-Smoker","PastSmoker",..: 1 2 1 3 NA 3 1 3 3 1 ...
#  $ DrinkHabit_yr               : Factor w/ 3 levels "No consumption or <3times/month",..: 1 1 1 1 NA 1 2 3 2 1 ...
#  $ ExcerciseFreq_yr            : Factor w/ 3 levels "No Exercise",..: 1 1 2 2 NA 1 1 3 1 1 ...
#  $ CCI_yr                      : num  1 5 6 1 1 0 0 2 0 2 ...
#  $ total_ddd_yr_ASPIRIN        : num  0 924 0 0 0 ...
#  $ total_ddd_yr_NSAID          : num  18.5 4.5 89.5 12.6 3 ...
#  $ total_ddd_yr_H2B            : num  22 7.5 3.75 3.75 0 ...
#  $ total_ddd_yr_PPI            : num  0 0 0 0 0 0 31 0 0 0 ...
#  $ BMI_Q_yr                    : Factor w/ 5 levels "0-","18.5-","23-",..: 3 3 1 2 3 2 2 4 3 4 ...
#  $ bloodglucose_yr             : Factor w/ 3 levels "Normal<100","100-126",..: 1 2 3 1 2 1 1 1 1 1 ...
#  $ total_ddd_yr_METFORMIN      : num  0 790 240 0 0 ...
#  $ pmhx_DM_yr                  : num  0 1 0 0 0 0 0 0 0 0 ...
#  $ Tcholesterol_yr             : Factor w/ 3 levels "Normal<200","200-240",..: 1 3 1 2 2 2 1 1 1 1 ...
#  $ total_ddd_yr_STATIN         : num  0 0 40 0 0 0 0 0 0 0 ...
#  $ BPressure_yr                : Factor w/ 3 levels "<120/80",">=120/80",..: 3 3 1 1 2 3 1 3 2 2 ...
#  $ fuduration_yr               : num  92 2556 970 2556 2556 ...
#  $ evnttrth_C24_r              : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ total_ddd_yr_ASPIRIN.dyd    : num  0 2.53 0 0 0 ...
#  $ total_ddd_yr_ASPIRIN.cut    : Factor w/ 7 levels "[0,0.001)","[0.001,30)",..: 1 5 1 1 1 1 1 1 2 3 ...
#  $ total_ddd_yr_ASPIRIN.cut.yr : Factor w/ 5 levels "[0,365)","[365,730)",..: 1 3 1 1 1 1 1 1 1 1 ...
#  $ total_ddd_yr_ASPIRIN.ge30   : Factor w/ 2 levels "[0,30)","[30,Inf]": 1 2 1 1 1 1 1 1 1 2 ...
#  $ total_ddd_yr_ASPIRIN.ge001  : Factor w/ 2 levels "[0,0.001)","[0.001,Inf]": 1 2 1 1 1 1 1 1 2 2 ...
#  $ total_ddd_yr_NSAID.dyd      : num  0.05068 0.01233 0.24521 0.03459 0.00822 ...
#  $ total_ddd_yr_NSAID.cut      : Factor w/ 7 levels "[0,0.001)","[0.001,30)",..: 2 2 3 2 2 3 3 2 2 3 ...
#  $ total_ddd_yr_NSAID.cut.yr   : Factor w/ 5 levels "[0,365)","[365,730)",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ total_ddd_yr_NSAID.ge30     : Factor w/ 2 levels "[0,30)","[30,Inf]": 1 1 2 1 1 2 2 1 1 2 ...
#  $ total_ddd_yr_NSAID.ge001    : Factor w/ 2 levels "[0,0.001)","[0.001,Inf]": 2 2 2 2 2 2 2 2 2 2 ...
#  $ total_ddd_yr_H2B.ge30       : Factor w/ 2 levels "[0,30)","[30,Inf]": 1 1 1 1 1 2 1 1 1 1 ...
#  $ total_ddd_yr_H2B.ge001      : Factor w/ 2 levels "[0,0.001)","[0.001,Inf]": 2 2 2 2 1 2 2 2 1 1 ...
#  $ total_ddd_yr_PPI.ge30       : Factor w/ 2 levels "[0,30)","[30,Inf]": 1 1 1 1 1 1 2 1 1 1 ...
#  $ total_ddd_yr_PPI.ge001      : Factor w/ 2 levels "[0,0.001)","[0.001,Inf]": 1 1 1 1 1 1 2 1 1 1 ...
#  $ total_ddd_yr_METFORMIN.ge30 : Factor w/ 2 levels "[0,30)","[30,Inf]": 1 2 2 1 1 1 1 1 1 1 ...
#  $ total_ddd_yr_METFORMIN.ge001: Factor w/ 2 levels "[0,0.001)","[0.001,Inf]": 1 2 2 1 1 1 1 1 1 1 ...
#  $ total_ddd_yr_STATIN.ge30    : Factor w/ 2 levels "[0,30)","[30,Inf]": 1 1 2 1 1 1 1 1 1 1 ...
#  $ total_ddd_yr_STATIN.ge001   : Factor w/ 2 levels "[0,0.001)","[0.001,Inf]": 1 1 2 1 1 1 1 1 1 1 ...
#  $ BMI_lt23                    : int  0 0 1 1 0 1 1 0 0 0 ...
#  $ BMI_ge23lt25                : int  1 1 0 0 1 0 0 0 1 0 ...
#  $ BMI_ge25                    : int  0 0 0 0 0 0 0 1 0 1 ...
#  $ BMI_cut2325                 : Ord.factor w/ 3 levels "BMI_lt23"<"BMI_ge23lt25"<..: 2 2 1 1 2 1 1 3 2 3 ...



# debug 181114 unordered - to avoid .L & .Q =====
analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr`$BMI_cut2325 %>% is.ordered
analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, as.factor) %>% {.$BMI_cut2325} %>% is.ordered
analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, factor) %>% {.$BMI_cut2325} %>% is.ordered
as.characther.as.factor = function(vec) as.factor(as.character(vec))
analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, as.characther.as.factor) %>% {.$BMI_cut2325} %>% is.ordered
analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, as.characther.as.factor) %>% {.$BMI_cut2325} %>% str
factor.unordered = function(vec) factor(vec, ordered = F)
analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, factor.unordered) %>% {.$BMI_cut2325} %>% is.ordered
analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, factor.unordered) %>% {.$BMI_cut2325} %>% str
# > analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr`$BMI_cut2325 %>% is.ordered
# [1] TRUE
# > analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, as.factor) %>% {.$BMI_cut2325} %>% is.ordered
# [1] TRUE
# > analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, factor) %>% {.$BMI_cut2325} %>% is.ordered
# [1] TRUE
# > as.characther.as.factor = function(vec) as.factor(as.character(vec))
# > analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, as.characther.as.factor) %>% {.$BMI_cut2325} %>% is.ordered
# [1] FALSE
# > analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, as.characther.as.factor) %>% {.$BMI_cut2325} %>% str
#  Factor w/ 3 levels "BMI_ge23lt25",..: 1 1 3 3 1 3 3 2 1 2 ...
# > factor.unordered = function(vec) factor(vec, ordered = F)
# > analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, factor.unordered) %>% {.$BMI_cut2325} %>% is.ordered
# [1] FALSE
# > analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, factor.unordered) %>% {.$BMI_cut2325} %>% str
#  Factor w/ 3 levels "BMI_lt23","BMI_ge23lt25",..: 2 2 1 1 2 1 1 3 2 3 ...


#@ end ----
save(analyticDF_C24.drop_pmhx_negativetime.list.cut, file = "analyticDF_C24.drop_pmhx_negativetime.list.cut.rda")

