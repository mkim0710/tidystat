# f_df.recode.factor.dev.r
# analyticDF_C24.drop_pmhx_negativetime.list.cut from analyticDF_C24.drop_pmhx_negativetime.list .r



# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/15_cleaning_time/function.time_since_t0.dev.r
#@ -----  
data %>% mutate_if(lubridate::is.Date, function(vec) if_else(is.na(vec), as.Date("9999-12-31"), vec))
data %>% mutate_if(lubridate::is.Date, function(vec) replace(vec, is.na(vec), as.Date("9999-12-31")))
data %>% mutate_if(lubridate::is.Date, function(vec) replace_na(vec, as.Date("9999-12-31")))



#@ mutate_if(function(x) lubridate::is.Date(x), function(x) {as.numeric(x - .$lmp)}) =====  
ID_Eligible_Exposure.TargetTrial2v38.2.113vs200.Outcome.Covariates.DDD.A1c %>% select(matches("Window4Exposure"))
ID_Eligible_Exposure.TargetTrial2v38.2.113vs200.Outcome.Covariates.DDD.A1c %>% select(lmp, matches("Window4Exposure")) %>% 
     mutate_if(function(x) lubridate::is.Date(x), function(x) {as.numeric(x - .$lmp)})  #----
# > ID_Eligible_Exposure.TargetTrial2v38.2.113vs200.Outcome.Covariates.DDD.A1c %>% select(matches("Window4Exposure"))
# # A tibble: 313 x 9
#    Window4Exposure.R~ Window4Exposure.Rx~ Window4Exposure.R~ Window4Exposure.R~ Window4Exposure.R~ Window4Exposure.R~ Window4Exposure.R~ Window4Exposure.R~ Window4Exposure.R~
#                 <int> <date>              <date>                          <int> <date>             <date>                          <int> <date>             <date>            
#  1                  4 2013-05-01          2013-08-01                          2 2013-05-01         2013-08-02                         NA NA                 NA                
#  2                  5 2015-01-23          2015-04-13                          2 2015-01-23         2015-04-23                         NA NA                 NA                
#  3                  2 2012-03-12          2012-03-30                          2 2012-03-12         2012-03-29                         NA NA                 NA                
#  4                  2 2012-10-04          2012-12-07                          1 2012-12-10         2012-12-10                         NA NA                 NA                
#  5                  4 2012-12-23          2013-02-14                          1 2013-04-02         2013-04-02                         NA NA                 NA                
#  6                  4 2014-02-24          2014-05-05                          1 2014-04-24         2014-04-24                         NA NA                 NA                
#  7                  8 2013-05-14          2013-09-03                          1 2013-05-30         2013-05-30                         NA NA                 NA                
#  8                  8 2011-12-09          2012-03-04                          4 2011-12-02         2012-03-02                         NA NA                 NA                
#  9                  1 2014-01-15          2014-01-15                          4 2013-10-28         2014-02-13                         NA NA                 NA                
# 10                  6 2012-05-26          2012-08-21                          3 2012-05-26         2012-08-20                         NA NA                 NA                
# # ... with 303 more rows
# > ID_Eligible_Exposure.TargetTrial2v38.2.113vs200.Outcome.Covariates.DDD.A1c %>% select(lmp, matches("Window4Exposure")) %>% 
# +      mutate_if(function(x) lubridate::is.Date(x), function(x) {as.numeric(x - .$lmp)})  #----  
# # A tibble: 313 x 10
#      lmp Window4Exposure.R~ Window4Exposure.R~ Window4Exposure.R~ Window4Exposure.R~ Window4Exposure.~ Window4Exposure.~ Window4Exposure.~ Window4Exposure.~ Window4Exposure.~
#    <dbl>              <int>              <dbl>              <dbl>              <int>             <dbl>             <dbl>             <int>             <dbl>             <dbl>
#  1     0                  4                 85                177                  2                85               178                NA                NA                NA
#  2     0                  5                 69                149                  2                69               159                NA                NA                NA
#  3     0                  2                 84                102                  2                84               101                NA                NA                NA
#  4     0                  2                 87                151                  1               154               154                NA                NA                NA
#  5     0                  4                 65                118                  1               165               165                NA                NA                NA
#  6     0                  4                 62                132                  1               121               121                NA                NA                NA
#  7     0                  8                 66                178                  1                82                82                NA                NA                NA
#  8     0                  8                 80                166                  4                73               164                NA                NA                NA
#  9     0                  1                145                145                  4                66               174                NA                NA                NA
# 10     0                  6                 65                152                  3                65               151                NA                NA                NA
# # ... with 303 more rows



#@ mutate_if(is.character, as.factor) =====  
tblGADM_kor_level2.join_level1.SIDO_SGG_CD = tblGADM_kor_level2.join_level1.SIDO_SGG_CD %>% 
    mutate_if(is.character, as.factor)

tblGADM_kor_level2.join_level1.SIDO_SGG_CD |> str() #----
# > tblGADM_kor_level2.join_level1.SIDO_SGG_CD |> str() #----  
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	229 obs. of  37 variables:
#  $ OBJECTID_level2: num  1 2 3 4 5 6 7 8 9 10 ...
#  $ ID_0           : num  213 213 213 213 213 213 213 213 213 213 ...
#  $ ISO            : Factor w/ 1 level "KOR": 1 1 1 1 1 1 1 1 1 1 ...
#  $ NAME_0         : Factor w/ 1 level "South Korea": 1 1 1 1 1 1 1 1 1 1 ...
#  $ ID_1           : num  1 1 1 1 1 1 1 1 1 1 ...
#  $ NAME_1         : Factor w/ 17 levels "Busan","Chungcheongbuk-do",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ ID_2           : num  1 2 3 4 5 6 7 8 9 10 ...
#  $ NAME_2         : Factor w/ 209 levels "Andong","Ansan",..: 12 14 35 40 49 54 56 89 130 146 ...
#  $ HASC_2         : logi  NA NA NA NA NA NA ...
#  $ CCN_2          : logi  NA NA NA NA NA NA ...
#  $ CCA_2          : logi  NA NA NA NA NA NA ...
#  $ TYPE_2         : Factor w/ 3 levels "Gu","Gun","Si": 1 1 1 1 1 1 2 1 1 1 ...
#  $ ENGTYPE_2      : Factor w/ 3 levels "City","County",..: 3 3 3 3 3 3 2 3 3 3 ...
#  $ NL_NAME_2      : Factor w/ 215 levels "가평군| 加平郡",..: 87 81 63 67 6 39 41 209 48 91 ...
#  $ VARNAME_2      : Factor w/ 1 level "Ulleung-gun": NA NA NA NA NA NA NA NA NA NA ...
#  $ OBJECTID_level1: num  1 1 1 1 1 1 1 1 1 1 ...
#  $ HASC_1         : Factor w/ 17 levels "KR.CB","KR.CJ",..: 12 12 12 12 12 12 12 12 12 12 ...
#  $ CCN_1          : logi  NA NA NA NA NA NA ...
#  $ CCA_1          : logi  NA NA NA NA NA NA ...
#  $ TYPE_1         : Factor w/ 4 levels "Do","Gwangyeoksi",..: 2 2 2 2 2 2 2 2 2 2 ...
#  $ ENGTYPE_1      : Factor w/ 4 levels "Capital Metropolitan City",..: 3 3 3 3 3 3 3 3 3 3 ...
#  $ NL_NAME_1      : Factor w/ 16 levels "강원도 | 江原道",..: 7 7 7 7 7 7 7 7 7 7 ...
#  $ VARNAME_1      : Factor w/ 17 levels "Chollabuk-Do|Cholla-bukto|Jeonrabugdo|North Cholla|Zenra Hoku-do",..: 14 14 14 14 14 14 14 14 14 14 ...
#  $ NL_NAME_1Korean: Factor w/ 16 levels "강원도","경기도",..: 7 7 7 7 7 7 7 7 7 7 ...
#  $ SIDO_full      : Factor w/ 17 levels "강원도","경기도",..: 8 8 8 8 8 8 8 8 8 8 ...
#  $ SIDO_simple    : Factor w/ 17 levels "강원","경기",..: 8 8 8 8 8 8 8 8 8 8 ...
#  $ NL_NAME_2Korean: Factor w/ 208 levels "가평군","강남구",..: 82 77 60 63 6 38 40 202 46 85 ...
#  $ SGG            : Factor w/ 208 levels "가평군","강남구",..: 82 77 60 63 6 38 40 202 46 85 ...
#  $ SIDO_NM        : Factor w/ 17 levels "강원도","경기도",..: 8 8 8 8 8 8 8 8 8 8 ...
#  $ SGG_NM         : Factor w/ 208 levels "가평군","강남구",..: 82 77 60 63 6 38 40 202 46 85 ...
#  $ SIDO_CD        : Factor w/ 16 levels "11","21","22",..: 2 2 2 2 2 2 2 2 2 2 ...
#  $ SGG_CD         : Factor w/ 227 levels "11010","11020",..: 32 29 27 30 36 35 40 33 31 34 ...
#  $ SGG_Population : Factor w/ 214 levels "100786","10264",..: 86 116 211 71 201 60 21 130 74 102 ...
#  $ SGG_nEMD       : Factor w/ 29 levels "10","11","12",..: 4 15 5 4 26 8 24 9 8 7 ...
#  $ SIDO_Population: num  3519401 3519401 3519401 3519401 3519401 ...
#  $ SIDO_nSGG      : num  16 16 16 16 16 16 16 16 16 16 ...
#  $ SIDO_nEMD      : num  210 210 210 210 210 210 210 210 210 210 ...




#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  

letters[c(1:4, 2:6, 4:1)] |> as.factor()
# letters[c(1:4, 2:6, 4:1)] %>% {factor(., levels = rev(.))}
letters[c(1:4, 2:6, 4:1)] %>% {factor(., levels = rev(sort(unique(.))))}
letters[c(1:4, 2:6, 4:1)] %>% {factor(., labels = rev(sort(unique(.))))}
set.seed(1)
letters[c(1:4, 2:6, 4:1)]%>% {factor(., levels = sample(unique(.)))}
letters[c(1:4, 2:6, 4:1)]%>% {factor(., levels = sample(unique(.)))}
# > letters[c(1:4, 2:6, 4:1)] |> as.factor()
#  [1] a b c d b c d e f d c b a
# Levels: a b c d e f
# > # letters[c(1:4, 2:6, 4:1)] %>% {factor(., levels = rev(.))}
# > letters[c(1:4, 2:6, 4:1)] %>% {factor(., levels = rev(sort(unique(.))))}
#  [1] a b c d b c d e f d c b a
# Levels: f e d c b a
# > letters[c(1:4, 2:6, 4:1)] %>% {factor(., labels = rev(sort(unique(.))))}
#  [1] f e d c e d c b a c d e f
# Levels: f e d c b a
# > set.seed(1)
# > letters[c(1:4, 2:6, 4:1)]%>% {factor(., levels = sample(unique(.)))}
#  [1] a b c d b c d e f d c b a
# Levels: b f c d a e
# > letters[c(1:4, 2:6, 4:1)]%>% {factor(., levels = sample(unique(.)))}
#  [1] a b c d b c d e f d c b a
# Levels: f d c a e b



set.seed(1); sample(24) |> as.numeric() |> dput()
set.seed(1); sample(12) |> as.numeric() |> dput()
set.seed(1); sample(9) |> as.numeric() |> dput()
set.seed(1); sample(6) |> as.numeric() |> dput()
c(7, 9, 13, 20, 5, 18, 19, 12, 11, 1, 3, 14, 23, 21, 8, 16, 6, 24, 22, 4, 17, 15, 2, 10)
c(4, 5, 6, 9, 2, 7, 10, 12, 3, 1, 11, 8)
c(3, 9, 5, 6, 2, 4, 8, 7, 1)
c(2, 6, 3, 4, 1, 5)

letters[c(1:4, 7:1, 4:1)] |> as.factor()
letters[c(1:4, 7:1, 4:1)] %>% {factor(., labels = rep(c("a", "b", "c"), length(.)/2)[1:length(unique(.))] )}
# > letters[c(1:4, 7:1, 4:1)] |> as.factor()
#  [1] a b c d g f e d c b a d c b a
# Levels: a b c d e f g
# > letters[c(1:4, 7:1, 4:1)] %>% {factor(., labels = rep(c("a", "b", "c"), length(.)/2)[1:length(unique(.))] )}
#  [1] a b c a a c b a c b a a c b a
# Levels: a b c



letters[c(1:4, 7:1, 4:1)] |> as.factor() |> as.integer()
letters[c(1:4, 7:1, 4:1)] |> as.factor() |> as.integer() %% 3
letters[c(1:4, 7:1, 4:1)] |> as.factor() |> as.integer() %>% {(. - 1) %% 3 + 1}
# > letters[c(1:4, 7:1, 4:1)] |> as.factor() |> as.integer()
#  [1] 1 2 3 4 7 6 5 4 3 2 1 4 3 2 1
# > letters[c(1:4, 7:1, 4:1)] |> as.factor() |> as.integer() %% 3
#  [1] 1 2 0 1 1 0 2 1 0 2 1 1 0 2 1
# > letters[c(1:4, 7:1, 4:1)] |> as.factor() |> as.integer() %>% {(. - 1) %% 3 + 1}
#  [1] 1 2 3 1 1 3 2 1 3 2 1 1 3 2 1









analyticDF_C24.drop_pmhx_negativetime.list$`_5yr` |> str(give.attr = F)
# > analyticDF_C24.drop_pmhx_negativetime.list$`_5yr` |> str(give.attr = F)
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
((0:20)/10000) %>% cut(breaks, include.lowest = T, right = F) |> dput()
((0:20)/10000) %>% cut(breaks, include.lowest = T, right = F) |> summary()
((0:20)/10000 >= 0.001) |> summary() 
# > ((0:20)/10000) %>% cut(breaks, include.lowest = T, right = F) |> dput()
# structure(c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 
# 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L), .Label = c("[0,0.001)", "[0.001,30)", 
# "[30,Inf]"), class = "factor")
# > ((0:20)/10000) %>% cut(breaks, include.lowest = T, right = F) |> summary()
#  [0,0.001) [0.001,30)   [30,Inf] 
#         10         11          0 
# > ((0:20)/10000 >= 0.001) |> summary()
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
# ?as.factor

# ?dplyr::recode
analyticDF_C24.drop_pmhx_negativetime.list.cut$`_5yr`$BMI_Q_yr |> summary()
# > analyticDF_C24.drop_pmhx_negativetime.list.cut$`_5yr`$BMI_Q_yr |> summary()
#     0-  18.5-    23-    25-    30-   NA's 
#   9872 162466 127857 148005  13155    134


analyticDF_C24.drop_pmhx_negativetime.list.cut$`_5yr`$BMI_Q_yr |> levels() |> dput()
# > analyticDF_C24.drop_pmhx_negativetime.list.cut$`_5yr`$BMI_Q_yr |> levels() |> dput()
# c("0-", "18.5-", "23-", "25-", "30-")

txt = "BMI_lt23, BMI_ge23lt25, BMI_cut2325"
txt |> str_extract_all("[A-z0-9_]+") |> paste() |> cat("  \n", sep="")
txt |> str_extract_all("[A-z0-9_]+") |> unlist() |> paste0(collapse = '", "') %>% {cat('c("',.,'")', "  \n", sep="")}
# > txt = "BMI_lt23, BMI_ge23lt25, BMI_cut2325"
# > txt |> str_extract_all("[A-z0-9_]+") |> paste0(collapse = '", "') |> cat("  \n", sep="")
# c("BMI_lt23", "BMI_ge23lt25", "BMI_cut2325")



#@@@ LETTERS |> list() |> paste() |> cat("  \n", sep="") ----  
LETTERS |> dput()
LETTERS |> deparse() |> cat("  \n", sep="")
# > LETTERS |> dput()
# c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", 
# "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", 
# "Z")
# > LETTERS |> deparse() |> cat("  \n", sep="")
# c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L",  "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y",  "Z")

LETTERS |> paste0(collapse = '", "') %>% {paste0('c("',.,'")')}
LETTERS |> paste0(collapse = '", "') %>% {cat('c("',.,'")', "  \n", sep="")}
# > LETTERS |> paste0(collapse = '", "') %>% {paste0('c("',.,'")')}
# [1] "c(\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\", \"K\", \"L\", \"M\", \"N\", \"O\", \"P\", \"Q\", \"R\", \"S\", \"T\", \"U\", \"V\", \"W\", \"X\", \"Y\", \"Z\")"
# > LETTERS |> paste0(collapse = '", "') %>% {cat('c("',.,'")', "  \n", sep="")}
# c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z") 

LETTERS |> list()
LETTERS |> list() |> paste0() 
LETTERS |> list() |> paste0() |> cat("  \n", sep="")
# > LETTERS |> list()
# [[1]]
#  [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"
# 
# > LETTERS |> list() |> paste0() 
# [1] "c(\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\", \"K\", \"L\", \"M\", \"N\", \"O\", \"P\", \"Q\", \"R\", \"S\", \"T\", \"U\", \"V\", \"W\", \"X\", \"Y\", \"Z\")"
# > LETTERS |> list() |> paste0() |> cat("  \n", sep="")
# c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z") 

LETTERS |> list()
LETTERS |> list() |> paste() 
LETTERS |> list() |> paste() |> cat("  \n", sep="")
# > LETTERS |> list()
# [[1]]
#  [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"
# 
# > LETTERS |> list() |> paste() 
# [1] "c(\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\", \"K\", \"L\", \"M\", \"N\", \"O\", \"P\", \"Q\", \"R\", \"S\", \"T\", \"U\", \"V\", \"W\", \"X\", \"Y\", \"Z\")"
# > LETTERS |> list() |> paste() |> cat("  \n", sep="")
# c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z") 

list(LETTERS, letters)
list(LETTERS, letters) |> paste("1")
list(LETTERS, letters) |> paste("1", collapse = "|")
list(LETTERS, letters) |> paste("1", collapse = "|") |> cat("  \n", sep="")
# > list(LETTERS, letters)
# [[1]]
#  [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"
# 
# [[2]]
#  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
# 
# > list(LETTERS, letters) |> paste("1")
# [1] "c(\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\", \"K\", \"L\", \"M\", \"N\", \"O\", \"P\", \"Q\", \"R\", \"S\", \"T\", \"U\", \"V\", \"W\", \"X\", \"Y\", \"Z\") 1"
# [2] "c(\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", \"s\", \"t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\") 1"
# > list(LETTERS, letters) |> paste("1", collapse = "|")
# [1] "c(\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\", \"I\", \"J\", \"K\", \"L\", \"M\", \"N\", \"O\", \"P\", \"Q\", \"R\", \"S\", \"T\", \"U\", \"V\", \"W\", \"X\", \"Y\", \"Z\") 1|c(\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\", \"k\", \"l\", \"m\", \"n\", \"o\", \"p\", \"q\", \"r\", \"s\", \"t\", \"u\", \"v\", \"w\", \"x\", \"y\", \"z\") 1"
# > list(LETTERS, letters) |> paste("1", collapse = "|") |> cat("  \n", sep="")
# c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z") 1|c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z") 1 




               

analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
    map(function(df) {
        df = df %>% mutate(
            BMI_lt23 = BMI_Q_yr %in% c("0-", "18.5-")
            , BMI_ge23lt25 = BMI_Q_yr %in% c("23-")
            , BMI_ge25 = BMI_Q_yr %in% c("25-", "30-")
            , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100)
        )
    }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) |> summary()
# > analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
# +     map(function(df) {
# +         df = df %>% mutate(
# +             BMI_lt23 = BMI_Q_yr %in% c("0-", "18.5-")
# +             , BMI_ge23lt25 = BMI_Q_yr %in% c("23-")
# +             , BMI_ge25 = BMI_Q_yr %in% c("25-", "30-")
# +             , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100)
# +         )
# +     }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) |> summary()
#   BMI_Q_yr       BMI_lt23       BMI_ge23lt25     BMI_ge25        BMI_cut2325  
#  0-   :  9872   Mode :logical   Mode :logical   Mode :logical   Min.   :-Inf  
#  18.5-:162466   FALSE:289151    FALSE:333632    FALSE:300329    1st Qu.:   0  
#  23-  :127857   TRUE :172338    TRUE :127857    TRUE :161160    Median :   1  
#  25-  :148005                                                   Mean   :-Inf  
#  30-  : 13155                                                   3rd Qu.:   2  
#  NA's :   134                                                   Max.   :   2  

# ?`%in%`
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
    }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) |> summary()
# > analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
# +     map(function(df) {
# +         df = df %>% mutate(
# +             BMI_lt23 = BMI_Q_yr %>% match(c("0-", "18.5-"))
# +             , BMI_ge23lt25 = BMI_Q_yr %>% match(c("23-"))
# +             , BMI_ge25 = BMI_Q_yr %>% match(c("25-", "30-"))
# +             , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100)
# +         )
# +     }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) |> summary()
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
    }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) |> summary()
# > analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
# +     map(function(df) {
# +         df = df %>% mutate(
# +             BMI_lt23 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("0-", "18.5-"))}
# +             , BMI_ge23lt25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("23-"))}
# +             , BMI_ge25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("25-", "30-"))}
# +             , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100)
# +         )
# +     }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) |> summary()
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
    }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) |> summary()
analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
    map(function(df) {
        df = df %>% mutate(
            BMI_lt23 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("0-", "18.5-"))}
            , BMI_ge23lt25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("23-"))}
            , BMI_ge25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("25-", "30-"))}
            , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100) %>% ordered(label = c("BMI_lt23", "BMI_ge23lt25", "BMI_cut2325"))
        )
    }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) |> summary()
# > analyticDF_C24.drop_pmhx_negativetime.list.cut %>% 
# +     map(function(df) {
# +         df = df %>% mutate(
# +             BMI_lt23 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("0-", "18.5-"))}
# +             , BMI_ge23lt25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("23-"))}
# +             , BMI_ge25 = BMI_Q_yr %>% {ifelse(is.na(.), ., . %in% c("25-", "30-"))}
# +             , BMI_cut2325 = log10(BMI_lt23 + BMI_ge23lt25*10 + BMI_ge25*100) %>% as.ordered
# +         )
# +     }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) |> summary()
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
# +     }) %>% {.[["_5yr"]]} %>% select(matches("BMI")) |> summary()
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



analyticDF_C24.drop_pmhx_negativetime.list.cut |> str(max.level = 1) #----
analyticDF_C24.drop_pmhx_negativetime.list.cut$`_5yr` |> str(give.attr = F) #----
# > analyticDF_C24.drop_pmhx_negativetime.list.cut |> str(max.level = 1)
# List of 5
#  $ _3yr:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	481536 obs. of  44 variables:
#  $ _4yr:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	471223 obs. of  44 variables:
#  $ _5yr:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	461489 obs. of  44 variables:
#  $ _6yr:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	451428 obs. of  44 variables:
#  $ _7yr:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	440469 obs. of  44 variables:
# > analyticDF_C24.drop_pmhx_negativetime.list.cut$`_5yr` |> str(give.attr = F) #----  
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
analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, as.characther.as.factor) %>% {.$BMI_cut2325} |> str()
factor.unordered = function(vec) factor(vec, ordered = F)
analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, factor.unordered) %>% {.$BMI_cut2325} %>% is.ordered
analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, factor.unordered) %>% {.$BMI_cut2325} |> str()
# > analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr`$BMI_cut2325 %>% is.ordered
# [1] TRUE
# > analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, as.factor) %>% {.$BMI_cut2325} %>% is.ordered
# [1] TRUE
# > analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, factor) %>% {.$BMI_cut2325} %>% is.ordered
# [1] TRUE
# > as.characther.as.factor = function(vec) as.factor(as.character(vec))
# > analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, as.characther.as.factor) %>% {.$BMI_cut2325} %>% is.ordered
# [1] FALSE
# > analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, as.characther.as.factor) %>% {.$BMI_cut2325} |> str()
#  Factor w/ 3 levels "BMI_ge23lt25",..: 1 1 3 3 1 3 3 2 1 2 ...
# > factor.unordered = function(vec) factor(vec, ordered = F)
# > analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, factor.unordered) %>% {.$BMI_cut2325} %>% is.ordered
# [1] FALSE
# > analyticDF_C25.drop_pmhx_negativetime.list.recode$`_5yr` %>% mutate_if(is.ordered, factor.unordered) %>% {.$BMI_cut2325} |> str()
#  Factor w/ 3 levels "BMI_lt23","BMI_ge23lt25",..: 2 2 1 1 2 1 1 3 2 3 ...







#@ levels order -----  
# https://chatgpt.com/c/3f0e7ff4-096e-49f0-be8e-e278be34053a
vec_chr = c("a", "B", "1", "@", "z", "A", "#", "{", "}")
vec_chr %>% map_int(utf8ToInt)
vec_chr %>% factor() %>% levels() %>% dput()
# > vec_chr = c("a", "B", "1", "@", "z", "A", "#", "{", "}")
# > vec_chr %>% map_int(utf8ToInt)
# [1]  97  66  49  64 122  65  35 123 125
# > vec_chr %>% factor() %>% levels() %>% dput()
# c("{", "}", "@", "#", "1", "a", "A", "B", "z")

?factor
?utf8ToInt()
?sort


Sys.getlocale()
# > Sys.getlocale()
# [1] "LC_CTYPE=en_US.UTF-8;LC_NUMERIC=C;LC_TIME=en_US.UTF-8;LC_COLLATE=en_US.UTF-8;LC_MONETARY=en_US.UTF-8;LC_MESSAGES=en_US.UTF-8;LC_PAPER=en_US.UTF-8;LC_NAME=C;LC_ADDRESS=C;LC_TELEPHONE=C;LC_MEASUREMENT=en_US.UTF-8;LC_IDENTIFICATION=C"
# Define a character vector with special characters
special_chars <- c("!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^", "_", "{", "|", "}", "~")
special_chars %>% sort %>% dput()
# > special_chars %>% sort %>% dput()
# c("_", "-", ",", ";", ":", "!", "?", ".", "'", "\"", "(", ")", 
# "[", "]", "{", "}", "@", "*", "/", "\\", "&", "#", "%", "^", 
# "+", "<", "=", ">", "|", "~", "$")


# # Set the locale to "C" for consistent ASCII sorting
# Sys.setlocale("LC_COLLATE", "C")
# special_chars <- c("!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^", "_", "{", "|", "}", "~")
# special_chars %>% sort %>% dput()
# # > special_chars %>% sort %>% dput()
# # c("!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", 
# # "-", ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "\\", 
# # "]", "^", "_", "{", "|", "}", "~")


# Underscore (_): It appears first. In some collation rules, underscore is treated as a space or given high precedence.
# Hyphen (-): Often sorted early in the order as it is a common delimiter.
# Comma (,), Semicolon (;), Colon (:): These punctuation marks come early in the order.
# Exclamation (!), Question (?), Period (.): Common punctuation marks often used in texts.
# Apostrophe ('), Quotation ("): These are common text delimiters.
# Parentheses ((, )), Square Brackets ([, ]), Curly Braces ({, }): These are grouped together, reflecting their use as paired symbols.
# At symbol (@): Often appears in email addresses and user handles.
# Asterisk (*), Slash (/), Backslash (\\): These symbols are used in various contexts including file paths and wildcard expressions.
# Ampersand (&), Number (#), Percent (%), Caret (^): Common symbols used in programming and texts.
# Plus (+), Less than (<), Equals (=), Greater than (>): Symbols commonly used in mathematical and logical expressions.
# Pipe (|), Tilde (~), Dollar ($): These symbols often have specific uses in programming and text processing.




#@ end ----  
save(analyticDF_C24.drop_pmhx_negativetime.list.cut, file = "analyticDF_C24.drop_pmhx_negativetime.list.cut.rda")

