# object.coxph from analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample.r


library(tidyverse)
## @ object.coxph = coxph(formula = Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ . , data = df, method = "breslow") ====  
analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample %>% str
df = analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample
vec = c("evnttrth_C24_r", "fuduration_yr"
        , "AGE"
        , "SEX"
        , "CigaretteCurrentSmoker", "BMI_Q_yr"
        , "CCI_yr"
        , "pmhx_DM_OR_glucose_ge126", "total_ddd_yr_METFORMIN.ge30"
)
# df[, vec] %>% mutate_if(is.logical, as.factor)  # appending "TRUE" after each variable names, because "TRUE becomes a factor level.
df = df[, vec] # in logical, appending "TRUE" after each variable names.
object.coxph = coxph(formula = Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ . , data = df, method = "breslow")
# > object.coxph = coxph(formula = Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ . , data = df, method = "breslow")
# Warning message:
# In fitter(X, Y, strats, offset, init, control, weights = weights,  :
#   Loglik converged before variable  4,6,10 ; beta may be infinite. 



## @ object.coxph %>% str #----  
object.coxph %>% str(max.level = 1) #----
object.coxph %>% str #----
# > object.coxph %>% str(max.level = 1) #----  
# List of 21
#  $ coefficients     : Named num [1:10] 0.227 -1.221 1.16 18.752 1.113 ...
#   ..- attr(*, "names")= chr [1:10] "AGE" "SEXFemale" "CigaretteCurrentSmokerTRUE" "BMI_Q_yr18.5-" ...
#  $ var              : num [1:10, 1:10] 0.005531 -0.006577 0.0396 0.000523 0.016625 ...
#  $ loglik           : num [1:2] -33.5 -22.9
#  $ score            : num 21.3
#  $ iter             : int 18
#  $ linear.predictors: num [1:4563] -12.16 7.76 -13.79 -11.69 -9.77 ...
#  $ residuals        : Named num [1:4563] -4.15e-13 -1.87e-04 -8.10e-14 -6.62e-13 -4.51e-12 ...
#   ..- attr(*, "names")= chr [1:4563] "1" "2" "3" "4" ...
#  $ means            : Named num [1:10] 51.839 0.448 0.205 0.351 0.279 ...
#   ..- attr(*, "names")= chr [1:10] "AGE" "SEXFemale" "CigaretteCurrentSmokerTRUE" "BMI_Q_yr18.5-" ...
#  $ method           : chr "breslow"
#  $ concordance      : Named num [1:5] 16599 737 0 0 5008
#   ..- attr(*, "names")= chr [1:5] "concordant" "discordant" "tied.risk" "tied.time" ...
#  $ n                : int 4563
#  $ nevent           : num 4
#  $ terms            :Classes 'terms', 'formula'  language Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ AGE + SEX + CigaretteCurrentSmoker + BMI_Q_yr + CCI_yr + pmh| __truncated__
#   .. ..- attr(*, "variables")= language list(Surv(time = fuduration_yr, event = evnttrth_C24_r), AGE, SEX, CigaretteCurrentSmoker, BMI_Q_yr, CCI_yr, pmhx| __truncated__
#   .. ..- attr(*, "factors")= int [1:8, 1:7] 0 1 0 0 0 0 0 0 0 0 ...
#   .. .. ..- attr(*, "dimnames")=List of 2
#   .. ..- attr(*, "term.labels")= chr [1:7] "AGE" "SEX" "CigaretteCurrentSmoker" "BMI_Q_yr" ...
#   .. ..- attr(*, "specials")=Dotted pair list of 3
#   .. ..- attr(*, "order")= int [1:7] 1 1 1 1 1 1 1
#   .. ..- attr(*, "intercept")= num 1
#   .. ..- attr(*, "response")= int 1
#   .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
#   .. ..- attr(*, "predvars")= language list(Surv(time = fuduration_yr, event = evnttrth_C24_r), AGE, SEX, CigaretteCurrentSmoker, BMI_Q_yr, CCI_yr, pmhx| __truncated__
#   .. ..- attr(*, "dataClasses")= Named chr [1:8] "nmatrix.2" "numeric" "factor" "logical" ...
#   .. .. ..- attr(*, "names")= chr [1:8] "Surv(time = fuduration_yr, event = evnttrth_C24_r)" "AGE" "SEX" "CigaretteCurrentSmoker" ...
#  $ assign           :List of 7
#  $ wald.test        : num 4.42
#  $ na.action        : 'omit' Named int [1:52] 62 76 116 553 624 679 807 810 995 1050 ...
#   ..- attr(*, "names")= chr [1:52] "62" "76" "116" "553" ...
#  $ y                : 'Surv' num [1:4563, 1:2] 2556+ 2556+ 2556+ 2556+ 2556+ 1906+  441+ 2368+ 2556+ 2556+ ...
#   ..- attr(*, "dimnames")=List of 2
#   ..- attr(*, "type")= chr "right"
#  $ formula          :Class 'formula'  language Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ AGE + SEX + CigaretteCurrentSmoker + BMI_Q_yr + CCI_yr + pmh| __truncated__
#   .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
#  $ xlevels          :List of 3
#  $ contrasts        :List of 5
#  $ call             : language coxph(formula = Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ ., data = df, method = "breslow")
#  - attr(*, "class")= chr "coxph"
# > object.coxph %>% str #----  
# List of 21
#  $ coefficients     : Named num [1:10] 0.227 -1.221 1.16 18.752 1.113 ...
#   ..- attr(*, "names")= chr [1:10] "AGE" "SEXFemale" "CigaretteCurrentSmokerTRUE" "BMI_Q_yr18.5-" ...
#  $ var              : num [1:10, 1:10] 0.005531 -0.006577 0.0396 0.000523 0.016625 ...
#  $ loglik           : num [1:2] -33.5 -22.9
#  $ score            : num 21.3
#  $ iter             : int 18
#  $ linear.predictors: num [1:4563] -12.16 7.76 -13.79 -11.69 -9.77 ...
#  $ residuals        : Named num [1:4563] -4.15e-13 -1.87e-04 -8.10e-14 -6.62e-13 -4.51e-12 ...
#   ..- attr(*, "names")= chr [1:4563] "1" "2" "3" "4" ...
#  $ means            : Named num [1:10] 51.839 0.448 0.205 0.351 0.279 ...
#   ..- attr(*, "names")= chr [1:10] "AGE" "SEXFemale" "CigaretteCurrentSmokerTRUE" "BMI_Q_yr18.5-" ...
#  $ method           : chr "breslow"
#  $ concordance      : Named num [1:5] 16599 737 0 0 5008
#   ..- attr(*, "names")= chr [1:5] "concordant" "discordant" "tied.risk" "tied.time" ...
#  $ n                : int 4563
#  $ nevent           : num 4
#  $ terms            :Classes 'terms', 'formula'  language Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ AGE + SEX + CigaretteCurrentSmoker + BMI_Q_yr + CCI_yr + pmh| __truncated__
#   .. ..- attr(*, "variables")= language list(Surv(time = fuduration_yr, event = evnttrth_C24_r), AGE, SEX, CigaretteCurrentSmoker, BMI_Q_yr, CCI_yr, pmhx| __truncated__
#   .. ..- attr(*, "factors")= int [1:8, 1:7] 0 1 0 0 0 0 0 0 0 0 ...
#   .. .. ..- attr(*, "dimnames")=List of 2
#   .. .. .. ..$ : chr [1:8] "Surv(time = fuduration_yr, event = evnttrth_C24_r)" "AGE" "SEX" "CigaretteCurrentSmoker" ...
#   .. .. .. ..$ : chr [1:7] "AGE" "SEX" "CigaretteCurrentSmoker" "BMI_Q_yr" ...
#   .. ..- attr(*, "term.labels")= chr [1:7] "AGE" "SEX" "CigaretteCurrentSmoker" "BMI_Q_yr" ...
#   .. ..- attr(*, "specials")=Dotted pair list of 3
#   .. .. ..$ strata : NULL
#   .. .. ..$ cluster: NULL
#   .. .. ..$ tt     : NULL
#   .. ..- attr(*, "order")= int [1:7] 1 1 1 1 1 1 1
#   .. ..- attr(*, "intercept")= num 1
#   .. ..- attr(*, "response")= int 1
#   .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
#   .. ..- attr(*, "predvars")= language list(Surv(time = fuduration_yr, event = evnttrth_C24_r), AGE, SEX, CigaretteCurrentSmoker, BMI_Q_yr, CCI_yr, pmhx| __truncated__
#   .. ..- attr(*, "dataClasses")= Named chr [1:8] "nmatrix.2" "numeric" "factor" "logical" ...
#   .. .. ..- attr(*, "names")= chr [1:8] "Surv(time = fuduration_yr, event = evnttrth_C24_r)" "AGE" "SEX" "CigaretteCurrentSmoker" ...
#  $ assign           :List of 7
#   ..$ AGE                        : int 1
#   ..$ SEX                        : int 2
#   ..$ CigaretteCurrentSmoker     : int 3
#   ..$ BMI_Q_yr                   : int [1:4] 4 5 6 7
#   ..$ CCI_yr                     : int 8
#   ..$ pmhx_DM_OR_glucose_ge126   : int 9
#   ..$ total_ddd_yr_METFORMIN.ge30: int 10
#  $ wald.test        : num 4.42
#  $ na.action        : 'omit' Named int [1:52] 62 76 116 553 624 679 807 810 995 1050 ...
#   ..- attr(*, "names")= chr [1:52] "62" "76" "116" "553" ...
#  $ y                : 'Surv' num [1:4563, 1:2] 2556+ 2556+ 2556+ 2556+ 2556+ 1906+  441+ 2368+ 2556+ 2556+ ...
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : chr [1:4563] "1" "2" "3" "4" ...
#   .. ..$ : chr [1:2] "time" "status"
#   ..- attr(*, "type")= chr "right"
#  $ formula          :Class 'formula'  language Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ AGE + SEX + CigaretteCurrentSmoker + BMI_Q_yr + CCI_yr + pmh| __truncated__
#   .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
#  $ xlevels          :List of 3
#   ..$ SEX                        : chr [1:2] "Male" "Female"
#   ..$ BMI_Q_yr                   : chr [1:5] "0-" "18.5-" "23-" "25-" ...
#   ..$ total_ddd_yr_METFORMIN.ge30: chr [1:2] "[0,30)" "[30,Inf]"
#  $ contrasts        :List of 5
#   ..$ SEX                        : chr "contr.treatment"
#   ..$ CigaretteCurrentSmoker     : chr "contr.treatment"
#   ..$ BMI_Q_yr                   : chr "contr.treatment"
#   ..$ pmhx_DM_OR_glucose_ge126   : chr "contr.treatment"
#   ..$ total_ddd_yr_METFORMIN.ge30: chr "contr.treatment"
#  $ call             : language coxph(formula = Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ ., data = df, method = "breslow")
#  - attr(*, "class")= chr "coxph"



## @ object.coxph$coefficients |> names() |> dput() ----  
object.coxph$coefficients |> names() |> dput()
# > object.coxph$coefficients |> names() |> dput()
# c("AGE", "SEXFemale", "CigaretteCurrentSmokerTRUE", "BMI_Q_yr18.5-", 
# "BMI_Q_yr23-", "BMI_Q_yr25-", "BMI_Q_yr30-", "CCI_yr", "pmhx_DM_OR_glucose_ge126TRUE", 
# "total_ddd_yr_METFORMIN.ge30[30,Inf]")


## @ object.coxph$formula %>% str ----  
object.coxph$formula %>% str
object.coxph$formula |> as.list() %>% str
# > object.coxph$formula %>% str
# Class 'formula'  language Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ AGE + SEX + CigaretteCurrentSmoker + BMI_Q_yr + CCI_yr + pmh| __truncated__
#   ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
# > object.coxph$formula |> as.list() %>% str
# List of 3
#  $ : symbol ~
#  $ : language Surv(time = fuduration_yr, event = evnttrth_C24_r)
#  $ : language AGE + SEX + CigaretteCurrentSmoker + BMI_Q_yr + CCI_yr + pmhx_DM_OR_glucose_ge126 + total_ddd_yr_METFORMIN.ge30
#  - attr(*, "class")= chr "formula"
#  - attr(*, ".Environment")=<environment: R_GlobalEnv> 

## @ object.coxph$terms %>% str ----  
object.coxph$terms %>% str
object.coxph$terms %>% attr(., "dataClasses") %>% str
which(object.coxph$terms %>% attr(., "dataClasses") == "logical")
which(object.coxph$terms %>% attr(., "dataClasses") == "logical") |> names() |> dput()
(which(object.coxph$terms %>% attr(., "dataClasses") == "logical") |> names()) %*% c(F, T)
which(object.coxph$terms %>% attr(., "dataClasses") == "logical") |> names() %>% {set_names(map(., function(x) c(F, T)), .)} %>% str
which(object.coxph$terms %>% attr(., "dataClasses") == "logical") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)} %>% str
which(object.coxph$terms %>% attr(., "dataClasses") == "exception") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)}
which(object.coxph$terms %>% attr(., "dataClasses") == "exception") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)} |> dput()
# > object.coxph$terms %>% str
# Classes 'terms', 'formula'  language Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ AGE + SEX + CigaretteCurrentSmoker + BMI_Q_yr + CCI_yr + pmh| __truncated__
#   ..- attr(*, "variables")= language list(Surv(time = fuduration_yr, event = evnttrth_C24_r), AGE, SEX, CigaretteCurrentSmoker, BMI_Q_yr, CCI_yr, pmhx| __truncated__
#   ..- attr(*, "factors")= int [1:8, 1:7] 0 1 0 0 0 0 0 0 0 0 ...
#   .. ..- attr(*, "dimnames")=List of 2
#   .. .. ..$ : chr [1:8] "Surv(time = fuduration_yr, event = evnttrth_C24_r)" "AGE" "SEX" "CigaretteCurrentSmoker" ...
#   .. .. ..$ : chr [1:7] "AGE" "SEX" "CigaretteCurrentSmoker" "BMI_Q_yr" ...
#   ..- attr(*, "term.labels")= chr [1:7] "AGE" "SEX" "CigaretteCurrentSmoker" "BMI_Q_yr" ...
#   ..- attr(*, "specials")=Dotted pair list of 3
#   .. ..$ strata : NULL
#   .. ..$ cluster: NULL
#   .. ..$ tt     : NULL
#   ..- attr(*, "order")= int [1:7] 1 1 1 1 1 1 1
#   ..- attr(*, "intercept")= num 1
#   ..- attr(*, "response")= int 1
#   ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
#   ..- attr(*, "predvars")= language list(Surv(time = fuduration_yr, event = evnttrth_C24_r), AGE, SEX, CigaretteCurrentSmoker, BMI_Q_yr, CCI_yr, pmhx| __truncated__
#   ..- attr(*, "dataClasses")= Named chr [1:8] "nmatrix.2" "numeric" "factor" "logical" ...
#   .. ..- attr(*, "names")= chr [1:8] "Surv(time = fuduration_yr, event = evnttrth_C24_r)" "AGE" "SEX" "CigaretteCurrentSmoker" ...
# > object.coxph$terms %>% attr(., "dataClasses") %>% str
#  Named chr [1:8] "nmatrix.2" "numeric" "factor" "logical" "factor" "numeric" "logical" "factor"
#  - attr(*, "names")= chr [1:8] "Surv(time = fuduration_yr, event = evnttrth_C24_r)" "AGE" "SEX" "CigaretteCurrentSmoker" ...
# > which(object.coxph$terms %>% attr(., "dataClasses") == "logical")
#   CigaretteCurrentSmoker pmhx_DM_OR_glucose_ge126 
#                        4                        7 
# > which(object.coxph$terms %>% attr(., "dataClasses") == "logical") |> names() |> dput()
# c("CigaretteCurrentSmoker", "pmhx_DM_OR_glucose_ge126")
# > (which(object.coxph$terms %>% attr(., "dataClasses") == "logical") |> names()) %*% c(F, T)
# Error in (which(object.coxph$terms %>% attr(., "dataClasses") == "logical") %>%  : 
#   requires numeric/complex matrix/vector arguments
# > which(object.coxph$terms %>% attr(., "dataClasses") == "logical") |> names() %>% {set_names(map(., function(x) c(F, T)), .)} %>% str
# List of 2
#  $ CigaretteCurrentSmoker  : logi [1:2] FALSE TRUE
#  $ pmhx_DM_OR_glucose_ge126: logi [1:2] FALSE TRUE
# > which(object.coxph$terms %>% attr(., "dataClasses") == "logical") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)} %>% str
# List of 2
#  $ CigaretteCurrentSmoker  : chr [1:2] "FALSE" "TRUE"
#  $ pmhx_DM_OR_glucose_ge126: chr [1:2] "FALSE" "TRUE"
# > which(object.coxph$terms %>% attr(., "dataClasses") == "exception") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)}
# named list()
# > which(object.coxph$terms %>% attr(., "dataClasses") == "exception") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)} |> dput()
# structure(list(), .Names = character(0))




## @ object.coxph$xlevels %>% str(max.level = 1) ----  
object.coxph$xlevels %>% str(max.level = 1)
# > object.coxph$xlevels %>% str(max.level = 1)
# List of 3
#  $ SEX                        : chr [1:2] "Male" "Female"
#  $ BMI_Q_yr                   : chr [1:5] "0-" "18.5-" "23-" "25-" ...
#  $ total_ddd_yr_METFORMIN.ge30: chr [1:2] "[0,30)" "[30,Inf]"


## @ # data_main.cut.coxph_list from analyticDF_C24.drop_pmhx_negativetime.list.cut.coxph_list .r  
## @ tbl_varname_level_coefficients ====  
## @ function.tbl_varname_level_coefHR = function (object.coxph, focus.variable = ".*", digits = 3) { =====  
tbl_varname_level_coefficients = 
    object.coxph$xlevels %>% enframe(name = "varname", value = "level") %>% unnest %>% mutate(varnamelevel = paste0(varname, level)) %>% full_join(
        object.coxph$coefficients %>% as_tibble %>% rownames_to_column("varnamelevel") |> rename(coefficients = value), by = "varnamelevel"
    ) #----

tbl_varname_level_coefficients$coefficients[is.na(tbl_varname_level_coefficients$coefficients) & !is.na(tbl_varname_level_coefficients$level)] = 0
tbl_varname_level_coefficients$varname[is.na(tbl_varname_level_coefficients$varname)] = 
    tbl_varname_level_coefficients$varnamelevel[is.na(tbl_varname_level_coefficients$varname)]
tbl_varname_level_coefficients
# > tbl_varname_level_coefficients
# # A tibble: 13 x 4
#    varname                      level    varnamelevel                        coefficients
#    <chr>                        <chr>    <chr>                                      <dbl>
#  1 SEX                          Male     SEXMale                                    0    
#  2 SEX                          Female   SEXFemale                                 -1.22 
#  3 BMI_Q_yr                     0-       BMI_Q_yr0-                                 0    
#  4 BMI_Q_yr                     18.5-    BMI_Q_yr18.5-                             18.8  
#  5 BMI_Q_yr                     23-      BMI_Q_yr23-                                1.11 
#  6 BMI_Q_yr                     25-      BMI_Q_yr25-                               20.6  
#  7 BMI_Q_yr                     30-      BMI_Q_yr30-                                1.21 
#  8 total_ddd_yr_METFORMIN.ge30  [0,30)   total_ddd_yr_METFORMIN.ge30[0,30)          0    
#  9 total_ddd_yr_METFORMIN.ge30  [30,Inf] total_ddd_yr_METFORMIN.ge30[30,Inf]      -19.9  
# 10 AGE                          NA       AGE                                        0.227
# 11 CigaretteCurrentSmokerTRUE   NA       CigaretteCurrentSmokerTRUE                 1.16 
# 12 CCI_yr                       NA       CCI_yr                                     0.138
# 13 pmhx_DM_OR_glucose_ge126TRUE NA       pmhx_DM_OR_glucose_ge126TRUE               0.832




## @ function.tbl_varname_level_coefHR = function (object.coxph, focus.variable = ".*", digits = 3) { =====  
list_levels = object.coxph$xlevels  # debug181027 for logical variables appended with "TRUE" in the dataseet.
list_levels = c(list_levels, which(object.coxph$terms %>% attr(., "dataClasses") == "logical") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)})  # debug181027 for logical variables appended with "TRUE" in the dataseet.
list_levels %>% str
# > list_levels %>% str
# List of 5
#  $ SEX                        : chr [1:2] "Male" "Female"
#  $ BMI_Q_yr                   : chr [1:5] "0-" "18.5-" "23-" "25-" ...
#  $ total_ddd_yr_METFORMIN.ge30: chr [1:2] "[0,30)" "[30,Inf]"
#  $ CigaretteCurrentSmoker     : chr [1:2] "FALSE" "TRUE"
#  $ pmhx_DM_OR_glucose_ge126   : chr [1:2] "FALSE" "TRUE"



## @ tbl_varname_level_coefficients ====  
tbl_varname_level_coefficients = 
    list_levels %>% enframe(name = "varname", value = "level") %>% unnest %>% mutate(varnamelevel = paste0(varname, level)) %>% full_join(
        object.coxph$coefficients %>% as_tibble %>% rownames_to_column("varnamelevel") |> rename(coefficients = value), by = "varnamelevel"
    ) #----

tbl_varname_level_coefficients$coefficients[is.na(tbl_varname_level_coefficients$coefficients) & !is.na(tbl_varname_level_coefficients$level)] = 0
tbl_varname_level_coefficients$varname[is.na(tbl_varname_level_coefficients$varname)] = 
    tbl_varname_level_coefficients$varnamelevel[is.na(tbl_varname_level_coefficients$varname)]

tbl_varname_level_coefficients %>% print(n=99) #----
# > tbl_varname_level_coefficients %>% print(n=99) #----  
# # A tibble: 15 x 4
#    varname                     level    varnamelevel                        coefficients
#    <chr>                       <chr>    <chr>                                      <dbl>
#  1 SEX                         Male     SEXMale                                    0    
#  2 SEX                         Female   SEXFemale                                 -1.22 
#  3 BMI_Q_yr                    0-       BMI_Q_yr0-                                 0    
#  4 BMI_Q_yr                    18.5-    BMI_Q_yr18.5-                             18.8  
#  5 BMI_Q_yr                    23-      BMI_Q_yr23-                                1.11 
#  6 BMI_Q_yr                    25-      BMI_Q_yr25-                               20.6  
#  7 BMI_Q_yr                    30-      BMI_Q_yr30-                                1.21 
#  8 total_ddd_yr_METFORMIN.ge30 [0,30)   total_ddd_yr_METFORMIN.ge30[0,30)          0    
#  9 total_ddd_yr_METFORMIN.ge30 [30,Inf] total_ddd_yr_METFORMIN.ge30[30,Inf]      -19.9  
# 10 CigaretteCurrentSmoker      FALSE    CigaretteCurrentSmokerFALSE                0    
# 11 CigaretteCurrentSmoker      TRUE     CigaretteCurrentSmokerTRUE                 1.16 
# 12 pmhx_DM_OR_glucose_ge126    FALSE    pmhx_DM_OR_glucose_ge126FALSE              0    
# 13 pmhx_DM_OR_glucose_ge126    TRUE     pmhx_DM_OR_glucose_ge126TRUE               0.832
# 14 AGE                         NA       AGE                                        0.227
# 15 CCI_yr                      NA       CCI_yr                                     0.138



## @ object.coxph$coefficients %>% str ----  
object.coxph$coefficients %>% str
object.coxph$means %>% str
object.coxph$residuals %>% str
# > object.coxph$coefficients %>% str ----  
#  Named num [1:10] 0.227 -1.221 1.16 18.752 1.113 ...
#  - attr(*, "names")= chr [1:10] "AGE" "SEXFemale" "CigaretteCurrentSmokerTRUE" "BMI_Q_yr18.5-" ...
# > object.coxph$means %>% str ----  
#  Named num [1:10] 51.839 0.448 0.205 0.351 0.279 ...
#  - attr(*, "names")= chr [1:10] "AGE" "SEXFemale" "CigaretteCurrentSmokerTRUE" "BMI_Q_yr18.5-" ...
# > object.coxph$residuals %>% str ----  
#  Named num [1:4563] -4.15e-13 -1.87e-04 -8.10e-14 -6.62e-13 -4.51e-12 ...
#  - attr(*, "names")= chr [1:4563] "1" "2" "3" "4" ...


## @ object.coxph |> coef() %>% str -----  
object.coxph |> coef() %>% str
object.coxph %>% confint %>% str
# > object.coxph |> coef() %>% str ----  
#  Named num [1:10] 0.227 -1.221 1.16 18.752 1.113 ...
#  - attr(*, "names")= chr [1:10] "AGE" "SEXFemale" "CigaretteCurrentSmokerTRUE" "BMI_Q_yr18.5-" ...
# > object.coxph %>% confint %>% str ----  
#  num [1:10, 1:2] 8.14e-02 -3.58 -1.44 -8.23e+04 -8.45e+04 ...
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:10] "AGE" "SEXFemale" "CigaretteCurrentSmokerTRUE" "BMI_Q_yr18.5-" ...
#   ..$ : chr [1:2] "2.5 %" "97.5 %"

## @ object.coxph.summary = summary(object.coxph) -----  
object.coxph.summary = summary(object.coxph)
object.coxph.summary %>% str
# > object.coxph.summary %>% str
# List of 14
#  $ call        : language coxph(formula = Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ ., data = df, method = "breslow")
#  $ fail        : NULL
#  $ na.action   : 'omit' Named int [1:52] 62 76 116 553 624 679 807 810 995 1050 ...
#   ..- attr(*, "names")= chr [1:52] "62" "76" "116" "553" ...
#  $ n           : int 4563
#  $ loglik      : num [1:2] -33.5 -22.9
#  $ nevent      : num 4
#  $ coefficients: num [1:10, 1:5] 0.227 -1.221 1.16 18.752 1.113 ...
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : chr [1:10] "AGE" "SEXFemale" "CigaretteCurrentSmokerTRUE" "BMI_Q_yr18.5-" ...
#   .. ..$ : chr [1:5] "coef" "exp(coef)" "se(coef)" "z" ...
#  $ conf.int    : num [1:10, 1:4] 1.26 2.95e-01 3.19 1.39e+08 3.04 ...
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : chr [1:10] "AGE" "SEXFemale" "CigaretteCurrentSmokerTRUE" "BMI_Q_yr18.5-" ...
#   .. ..$ : chr [1:4] "exp(coef)" "exp(-coef)" "lower .95" "upper .95"
#  $ logtest     : Named num [1:3] 21.2572 10 0.0194
#   ..- attr(*, "names")= chr [1:3] "test" "df" "pvalue"
#  $ sctest      : Named num [1:3] 21.2767 10 0.0192
#   ..- attr(*, "names")= chr [1:3] "test" "df" "pvalue"
#  $ rsq         : Named num [1:2] 0.00465 0.01457
#   ..- attr(*, "names")= chr [1:2] "rsq" "maxrsq"
#  $ waldtest    : Named num [1:3] 4.42 10 0.927
#   ..- attr(*, "names")= chr [1:3] "test" "df" "pvalue"
#  $ used.robust : logi FALSE
#  $ concordance : Named num [1:2] 0.957 0.144
#   ..- attr(*, "names")= chr [1:2] "C" "se(C)"
#  - attr(*, "class")= chr "summary.coxph"

object.coxph.summary$coef %>% str
object.coxph.summary$conf.int %>% str
# > object.coxph.summary$coef %>% str ----  
#  num [1:10, 1:5] 0.227 -1.221 1.16 18.752 1.113 ...
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:10] "AGE" "SEXFemale" "CigaretteCurrentSmokerTRUE" "BMI_Q_yr18.5-" ...
#   ..$ : chr [1:5] "coef" "exp(coef)" "se(coef)" "z" ...
# > object.coxph.summary$conf.int %>% str ----  
#  num [1:10, 1:4] 1.26 2.95e-01 3.19 1.39e+08 3.04 ...
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:10] "AGE" "SEXFemale" "CigaretteCurrentSmokerTRUE" "BMI_Q_yr18.5-" ...
#   ..$ : chr [1:4] "exp(coef)" "exp(-coef)" "lower .95" "upper .95"


## @ object.coxph.summary[c("coefficients", "conf.int")] %>% map(as.data.frame) %>% map(rownames_to_column) %>% reduce(full_join) -----  
object.coxph.summary[c("coefficients", "conf.int")] %>% map(as.data.frame) %>% map(rownames_to_column) %>% reduce(full_join)
object.coxph.summary[c("coefficients", "conf.int")] %>% map(round, max(2, digits)) %>% map(as.data.frame) %>% map(rownames_to_column) %>% reduce(full_join)
# > object.coxph.summary[c("coefficients", "conf.int")] %>% map(as.data.frame) %>% map(rownames_to_column) %>% reduce(full_join)
# Joining, by = c("rowname", "exp(coef)")
#                                rowname        coef    exp(coef)     se(coef)             z    Pr(>|z|)   exp(-coef)  lower .95 upper .95
# 1                                  AGE   0.2271828 1.255059e+00 7.436941e-02  3.054788e+00 0.002252199 7.967752e-01 1.08482794  1.452003
# 2                            SEXFemale  -1.2214301 2.948083e-01 1.204887e+00 -1.013730e+00 0.310711556 3.392035e+00 0.02779317  3.127096
# 3           CigaretteCurrentSmokerTRUE   1.1604576 3.191393e+00 1.329222e+00  8.730355e-01 0.382643717 3.133428e-01 0.23580061 43.193235
# 4                        BMI_Q_yr18.5-  18.7517498 1.392456e+08 4.200681e+04  4.463979e-04 0.999643826 7.181556e-09 0.00000000       Inf
# 5                          BMI_Q_yr23-   1.1131098 3.043809e+00 4.311990e+04  2.581430e-05 0.999979403 3.285357e-01 0.00000000       Inf
# 6                          BMI_Q_yr25-  20.6475723 9.271003e+08 4.200681e+04  4.915292e-04 0.999607816 1.078632e-09 0.00000000       Inf
# 7                          BMI_Q_yr30-   1.2102356 3.354275e+00 6.182656e+04  1.957469e-05 0.999984382 2.981270e-01 0.00000000       Inf
# 8                               CCI_yr   0.1376601 1.147585e+00 2.768475e-01  4.972416e-01 0.619018672 8.713948e-01 0.66700949  1.974413
# 9         pmhx_DM_OR_glucose_ge126TRUE   0.8322742 2.298540e+00 1.170886e+00  7.108071e-01 0.477203777 4.350588e-01 0.23162851 22.809310
# 10 total_ddd_yr_METFORMIN.ge30[30,Inf] -19.9053442 2.265786e-09 2.767259e+04 -7.193164e-04 0.999426069 4.413480e+08 0.00000000       Inf
# > object.coxph.summary[c("coefficients", "conf.int")] %>% map(round, max(2, digits)) %>% map(as.data.frame) %>% map(rownames_to_column) %>% reduce(full_join)
# Joining, by = c("rowname", "exp(coef)")
#                                rowname    coef    exp(coef)  se(coef)      z Pr(>|z|)  exp(-coef) lower .95 upper .95
# 1                                  AGE   0.227 1.255000e+00     0.074  3.055    0.002 7.97000e-01     1.085     1.452
# 2                            SEXFemale  -1.221 2.950000e-01     1.205 -1.014    0.311 3.39200e+00     0.028     3.127
# 3           CigaretteCurrentSmokerTRUE   1.160 3.191000e+00     1.329  0.873    0.383 3.13000e-01     0.236    43.193
# 4                        BMI_Q_yr18.5-  18.752 1.392456e+08 42006.808  0.000    1.000 0.00000e+00     0.000       Inf
# 5                          BMI_Q_yr23-   1.113 3.044000e+00 43119.897  0.000    1.000 3.29000e-01     0.000       Inf
# 6                          BMI_Q_yr25-  20.648 9.271003e+08 42006.808  0.000    1.000 0.00000e+00     0.000       Inf
# 7                          BMI_Q_yr30-   1.210 3.354000e+00 61826.557  0.000    1.000 2.98000e-01     0.000       Inf
# 8                               CCI_yr   0.138 1.148000e+00     0.277  0.497    0.619 8.71000e-01     0.667     1.974
# 9         pmhx_DM_OR_glucose_ge126TRUE   0.832 2.299000e+00     1.171  0.711    0.477 4.35000e-01     0.232    22.809
# 10 total_ddd_yr_METFORMIN.ge30[30,Inf] -19.905 0.000000e+00 27672.586 -0.001    0.999 4.41348e+08     0.000       Inf

object.coxph.summary[c("coefficients", "conf.int")] %>% map(as.data.frame) %>% map(rownames_to_column) %>% reduce(full_join) |> names() |> dput()
# > object.coxph.summary[c("coefficients", "conf.int")] %>% map(as.data.frame) %>% map(rownames_to_column) %>% reduce(full_join) |> names() |> dput()
# Joining, by = c("rowname", "exp(coef)")
# c("rowname", "coef", "exp(coef)", "se(coef)", "z", "Pr(>|z|)", 
# "exp(-coef)", "lower .95", "upper .95")


## @ out = summary(object.coxph) ----  
focus.variable = ".*"
digits = 3

# out = summary(object.coxph)
# res = data.frame(round(out$conf.int[, -2], digits))
# res = cbind(res, round(out$coef[, 5], max(2, digits)))
# colnames(res) = c("exp(coef)", "lower .95", "upper .95", "Pr(>|z|)")
# 
# for (i in 1:4){
#     res[[i]] <- as.character(format(res[[i]], digits = digits))
# }
# res$HR <- paste0( res[[1]]
#                   , "(", res[[2]]
#                   , "-", res[[3]]
#                   , "),p=", res[[4]]
# )
# if(any(res[[4]] < 0.001)){
#     i = which(res[[4]] < 0.001)
#     res[i, ]$HR <- paste0( res[i,1]
#                            , "(", res[i,2]
#                            , "-", res[i,3]
#                            , "),p<", 0.1 ^ max(2, digits))
# }
# res
# 
# 0.1 ^ max(2, digits)
# # > 0.1 ^ max(2, digits)
# # [1] 0.001

    
    #@ function.extractHR.focus.incl.reference() ----
    res1 = summary(object.coxph)[c("coefficients", "conf.int")] %>% 
        map(as.data.frame) %>% map(rownames_to_column) %>% reduce(full_join, by = c("rowname", "exp(coef)")) %>% 
        {.[c("rowname", "exp(coef)", "lower .95", "upper .95", "Pr(>|z|)")]}
    # res1 %>% as_tibble
    # # > res1 %>% as_tibble
    # # # A tibble: 10 x 5
    # #    rowname                             `exp(coef)` `lower .95` `upper .95` `Pr(>|z|)`
    # #    <chr>                                     <dbl>       <dbl>       <dbl>      <dbl>
    # #  1 AGE                                     1.26e+0      1.08          1.45    0.00225
    # #  2 SEXFemale                               2.95e-1      0.0278        3.13    0.311  
    # #  3 CigaretteCurrentSmokerTRUE              3.19e+0      0.236        43.2     0.383  
    # #  4 BMI_Q_yr18.5-                           1.39e+8      0           Inf       1.000  
    # #  5 BMI_Q_yr23-                             3.04e+0      0           Inf       1.000  
    # #  6 BMI_Q_yr25-                             9.27e+8      0           Inf       1.000  
    # #  7 BMI_Q_yr30-                             3.35e+0      0           Inf       1.000  
    # #  8 CCI_yr                                  1.15e+0      0.667         1.97    0.619  
    # #  9 pmhx_DM_OR_glucose_ge126TRUE            2.30e+0      0.232        22.8     0.477  
    # # 10 total_ddd_yr_METFORMIN.ge30[30,Inf]     2.27e-9      0           Inf       0.999  
    
    
    res2 = tibble(
        rowname = res1$rowname
        , HRCI = res1[c("exp(coef)", "lower .95", "upper .95")] %>% 
            map(round, max(2, digits)) %>% map_df(format,  digits = digits, scientific = F) %>% 
            add_column(" (", .after = "exp(coef)") %>%
            add_column(", ", .after = "lower .95") %>%
            add_column(")", .after = "upper .95") %>%
            unite(sep = "") |> unlist()
        , p_value = paste0("p=", res$`Pr(>|z|)` %>% sprintf("%.3f", .)) %>% gsub("p=0.000", "p<0.001", .)
        , star = res$`Pr(>|z|)` %>% 
            cut(breaks = c(0, 0.001, 0.005, 0.01, 0.05, 0.1, 1)
                , labels = c("***", "***", "** ", "*  ", ".  ", "   ") 
                , include.lowest = T, right = T
            )
    )
    res2
    # > res2
    # # A tibble: 10 x 4
    # rowname                             HRCI                           p_value star 
    # <chr>                               <chr>                          <chr>   <fct>
    # 1 AGE                                 "        1.255 (1.085,  1.45)" p=0.002 ***
    # 2 SEXFemale                           "        0.295 (0.028,  3.13)" p=0.311 "   "
    # 3 CigaretteCurrentSmokerTRUE          "        3.191 (0.236, 43.19)" p=0.383 "   "
    # 4 BMI_Q_yr18.5-                       139245599.097 (0.000,   Inf)   p=1.000 "   "
    # 5 BMI_Q_yr23-                         "        3.044 (0.000,   Inf)" p=1.000 "   "
    # 6 BMI_Q_yr25-                         927100265.413 (0.000,   Inf)   p=1.000 "   "
    # 7 BMI_Q_yr30-                         "        3.354 (0.000,   Inf)" p=1.000 "   "
    # 8 CCI_yr                              "        1.148 (0.667,  1.97)" p=0.619 "   "
    # 9 pmhx_DM_OR_glucose_ge126TRUE        "        2.299 (0.232, 22.81)" p=0.477 "   "
    # 10 total_ddd_yr_METFORMIN.ge30[30,Inf] "        0.000 (0.000,   Inf)" p=0.999 "   "
    
    res = res2 %>% full_join(res1, by = "rowname") |> rename(varnamelevel = rowname)
    
    tbl_varname_level_coefficients_res = tbl_varname_level_coefficients %>% full_join(res, by = "varnamelevel")
    tbl_varname_level_coefficients_res$`exp(coef)`[is.na(tbl_varname_level_coefficients_res$`exp(coef)`) & !is.na(tbl_varname_level_coefficients_res$level)] = 1
    tbl_varname_level_coefficients_res$HRCI[is.na(tbl_varname_level_coefficients_res$HRCI) & !is.na(tbl_varname_level_coefficients_res$level)] = "(reference)"
    tbl_varname_level_coefficients_res %>% print(n=99)
    tbl_varname_level_coefficients_res |> names() |> dput()
    # > tbl_varname_level_coefficients_res %>% print(n=99)
    # # A tibble: 15 x 11
    # varname                     level    varnamelevel                        coefficients HRCI                           p_value star  `exp(coef)` `lower .95` `upper .95` `Pr(>|z|)`
    # <chr>                       <chr>    <chr>                                      <dbl> <chr>                          <chr>   <fct>       <dbl>       <dbl>       <dbl>      <dbl>
    # 1 SEX                         Male     SEXMale                                    0     (reference)                    NA      NA        1.00e+0     NA            NA      NA      
    # 2 SEX                         Female   SEXFemale                                 -1.22  "        0.295 (0.028,  3.13)" p=0.311 "   "     2.95e-1      0.0278        3.13    0.311  
    # 3 BMI_Q_yr                    0-       BMI_Q_yr0-                                 0     (reference)                    NA      NA        1.00e+0     NA            NA      NA      
    # 4 BMI_Q_yr                    18.5-    BMI_Q_yr18.5-                             18.8   139245599.097 (0.000,   Inf)   p=1.000 "   "     1.39e+8      0           Inf       1.000  
    # 5 BMI_Q_yr                    23-      BMI_Q_yr23-                                1.11  "        3.044 (0.000,   Inf)" p=1.000 "   "     3.04e+0      0           Inf       1.000  
    # 6 BMI_Q_yr                    25-      BMI_Q_yr25-                               20.6   927100265.413 (0.000,   Inf)   p=1.000 "   "     9.27e+8      0           Inf       1.000  
    # 7 BMI_Q_yr                    30-      BMI_Q_yr30-                                1.21  "        3.354 (0.000,   Inf)" p=1.000 "   "     3.35e+0      0           Inf       1.000  
    # 8 total_ddd_yr_METFORMIN.ge30 [0,30)   total_ddd_yr_METFORMIN.ge30[0,30)          0     (reference)                    NA      NA        1.00e+0     NA            NA      NA      
    # 9 total_ddd_yr_METFORMIN.ge30 [30,Inf] total_ddd_yr_METFORMIN.ge30[30,Inf]      -19.9   "        0.000 (0.000,   Inf)" p=0.999 "   "     2.27e-9      0           Inf       0.999  
    # 10 CigaretteCurrentSmoker      FALSE    CigaretteCurrentSmokerFALSE                0     (reference)                    NA      NA        1.00e+0     NA            NA      NA      
    # 11 CigaretteCurrentSmoker      TRUE     CigaretteCurrentSmokerTRUE                 1.16  "        3.191 (0.236, 43.19)" p=0.383 "   "     3.19e+0      0.236        43.2     0.383  
    # 12 pmhx_DM_OR_glucose_ge126    FALSE    pmhx_DM_OR_glucose_ge126FALSE              0     (reference)                    NA      NA        1.00e+0     NA            NA      NA      
    # 13 pmhx_DM_OR_glucose_ge126    TRUE     pmhx_DM_OR_glucose_ge126TRUE               0.832 "        2.299 (0.232, 22.81)" p=0.477 "   "     2.30e+0      0.232        22.8     0.477  
    # 14 AGE                         NA       AGE                                        0.227 "        1.255 (1.085,  1.45)" p=0.002 ***       1.26e+0      1.08          1.45    0.00225
    # 15 CCI_yr                      NA       CCI_yr                                     0.138 "        1.148 (0.667,  1.97)" p=0.619 "   "     1.15e+0      0.667         1.97    0.619  
    # > tbl_varname_level_coefficients_res |> names() |> dput()
    # c("varname", "level", "varnamelevel", "coefficients", "HRCI", "p_value", "star", "exp(coef)", "lower .95", "upper .95", "Pr(>|z|)")
    # txt = '"varname", "level", "varnamelevel", "coefficients", "HRCI", "p_value", "star", "exp(coef)", "lower .95", "upper .95", "Pr(>|z|)"'
    # txt %>% str_extract_all("[A-Za-z0-9_]+") %>% str
    # txt %>% str_extract_all("[A-Za-z0-9_]+") |> unlist() |> paste0(collapse = ', ') %>% {paste0('select(', ., ')')} |> cat("  \n", sep="")
    # select(varname, level, varnamelevel, coefficients, HRCI, p_value, star, exp, coef, lower, 95, upper, 95, Pr, z)
    
    out = tbl_varname_level_coefficients_res %>% select(varname, level, HRCI, p_value, star, everything())

