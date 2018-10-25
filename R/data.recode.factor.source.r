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
    }) %>% {.[["_5yr"]]} %>% select(matches("BMI"))
analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
    map(function(df) {
        df = df %>% mutate(
            BMI_lt23 = BMI_Q_yr %in% c("0-", "18.5-")
            , BMI_ge23lt25 = BMI_Q_yr %in% c("23-")
            , BMI_ge25 = BMI_Q_yr %in% c("25-", "30-")
            , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100) %>% as.ordered(label = c("BMI_lt23", "BMI_ge23lt25", "BMI_cut2325"))
        )
    }) %>% {.[["_5yr"]]} %>% select(matches("BMI"))



analyticDF_C24.drop_pmhx_negativetime.list.cut = analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
    map(function(df) {
        df = df %>% mutate(
            BMI_lt23 = BMI_Q_yr %in% c("0-", "18.5-")
            , BMI_ge23lt25 = BMI_Q_yr %in% c("23-")
            , BMI_ge25 = BMI_Q_yr %in% c("25-", "30-")
            , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100) %>% as.ordered(label = c("BMI_lt23", "BMI_ge23lt25", "BMI_cut2325"))
        )
    })



analyticDF_C24.drop_pmhx_negativetime.list.cut %>% str(max.level = 1)
analyticDF_C24.drop_pmhx_negativetime.list.cut$`_5yr` %>% str(give.attr = F)


#@ end ----


