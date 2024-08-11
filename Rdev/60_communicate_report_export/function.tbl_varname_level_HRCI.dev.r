
# @@@@ Cf) A quick & dirty way below~!!! ................................................................................  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/60_communicate_report_export/function.HazardRatios.spread.dev.r




function.tbl_varname_level_HRCI = function (object.coxph, focus.variable = ".*", digits = 2) {
    library(survival)
    library(tidyverse)
    
    list_levels = object.coxph$xlevels  # debug181027 for logical variables appended with "TRUE" in the dataseet.
    list_levels = c(list_levels, which(object.coxph$terms %>% attr(., "dataClasses") == "logical") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)})  # debug181027 for logical variables appended with "TRUE" in the dataseet.
                                                            
    #@ tbl_varname_level_coefficients ====
    if (length(list_levels) == 0) { # debug 181115 ----
        tbl_varname_level_coefficients = tibble(varname = character(0), level = character(0), varnamelevel = character(0)) %>% right_join(
                tibble(varnamelevel = names(object.coxph$coefficients), coefficients = object.coxph$coefficients), by = "varnamelevel"
            ) #----
    } else {
        tbl_varname_level_coefficients = 
            list_levels %>% enframe(name = "varname", value = "level") %>% unnest %>% mutate(varnamelevel = paste0(varname, level)) %>% right_join(
                tibble(varnamelevel = names(object.coxph$coefficients), coefficients = object.coxph$coefficients), by = "varnamelevel"
            ) #----
    }
    
    tbl_varname_level_coefficients$coefficients[is.na(tbl_varname_level_coefficients$coefficients) & !is.na(tbl_varname_level_coefficients$level)] = 0
    tbl_varname_level_coefficients$varname[is.na(tbl_varname_level_coefficients$varname)] = 
        tbl_varname_level_coefficients$varnamelevel[is.na(tbl_varname_level_coefficients$varname)]
        
    #@ function.extractHR.focus.incl.reference() ----
    res1 = summary(object.coxph)[c("coefficients", "conf.int")] %>% 
        map(as.data.frame) %>% map(rownames_to_column) %>% reduce(full_join, by = c("rowname", "exp(coef)")) %>% 
        {.[c("rowname", "exp(coef)", "lower .95", "upper .95", "Pr(>|z|)")]}
  
    sprintf_but_ceiling5 = function(fmt='%#.2f', x, ...) {
        sprintf(fmt = fmt, x + 10^(-9), ...)
    }
    
    res2 = tibble(
        rowname = res1$rowname
        , HRCI = res1[c("exp(coef)", "lower .95", "upper .95")] %>% {.[. > 99.99 & . < Inf] = 99.99; .} %>% 
            map_df(sprintf_but_ceiling5,  fmt = paste0("%.", digits, "f")) %>% 
            transmute(HRCI = paste0(`exp(coef)`, " (", `lower .95`, ", ", `upper .95`, ")") %>% gsub("99.99", ">100", .)) |> unlist()
        , p_value = paste0("p=", res1$`Pr(>|z|)` %>% sprintf("%.3f", .)) %>% gsub("p=0.000", "p<0.001", .)
        , star = res1$`Pr(>|z|)` %>% 
            cut(breaks = c(0, 0.001, 0.005, 0.01, 0.05, 0.1, 1)
                , labels = c("***", "***", "** ", "*  ", ".  ", "   ") 
                , include.lowest = T, right = T
            )
    )
    res2    
    res = res2 %>% full_join(res1, by = "rowname") |> rename(varnamelevel = rowname)
    
    tbl_varname_level_coefficients_res = tbl_varname_level_coefficients %>% full_join(res, by = "varnamelevel")
    tbl_varname_level_coefficients_res$`exp(coef)`[is.na(tbl_varname_level_coefficients_res$`exp(coef)`) & !is.na(tbl_varname_level_coefficients_res$level)] = 1
    tbl_varname_level_coefficients_res$HRCI[is.na(tbl_varname_level_coefficients_res$HRCI) & !is.na(tbl_varname_level_coefficients_res$level)] = "(reference)"
    
    out = tbl_varname_level_coefficients_res %>% select(varname, level, HRCI, p_value, star, everything())
}

                                                                                                                        
data.coxph.tbl_varname_level_HRCI <- function(dataset, varname4time, varname4event, covars) {
  # Create the coxph model
  cox_formula <- as.formula(paste("Surv(", varname4time, ",", varname4event, ") ~", paste(covars, collapse = " + ")))
  coxph_object <- coxph(cox_formula, data = dataset)
  
  # Assuming you already have the function.tbl_varname_level_HRCI function defined earlier
  tbl_varname_level_HRCI <- function.tbl_varname_level_HRCI(coxph_object)
  
  list(coxph_object = coxph_object, tbl_varname_level_HRCI = tbl_varname_level_HRCI)
}

# Mapping over the list of variable sets
results <- map(list(
  c("fsg_var_g", "AGE"),
  c("fsg_var_g", "AGE", "SEX", "BP_HIGH", "BP_LWST", "TOT_CHOLE", "income", "smk", "ac", "cci_g"),
  c("fsg_var_g", "AGE", "SEX", "BP_HIGH", "BP_LWST", "TOT_CHOLE", "income", "smk", "ac", "cci_g", "blds1"),
  c("fsg_var_g", "AGE", "SEX", "BP_HIGH", "BP_LWST", "TOT_CHOLE", "income", "smk", "ac", "cci_g", "blds1", "blds2", "blds3")
), ~data.coxph.tbl_varname_level_HRCI(dataset = temp11.sas7bdat, varname4time = "dem_fu", varname4event = "dem_true", covars = .x))

                                                                                                                            














# @ annotated version -------  
function.tbl_varname_level_HRCI = function (object.coxph, focus.variable = ".*", digits = 2) {
    library(survival)
    library(tidyverse)
    
    # df = analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample
    # vec = c("evnttrth_C24_r", "fuduration_yr"
    #         , "AGE"
    #         , "SEX"
    #         , "CigaretteCurrentSmoker", "BMI_Q_yr"
    #         , "CCI_yr"
    #         , "pmhx_DM_OR_glucose_ge126", "total_ddd_yr_METFORMIN.ge30"
    # )
    # # df[, vec] %>% mutate_if(is.logical, as.factor)  # appending "TRUE" after each variable names, because "TRUE becomes a factor level.
    # df = df[, vec] # in logical, appending "TRUE" after each variable names.
    # object.coxph = coxph(formula = Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ . , data = df, method = "breslow")
    # # > object.coxph = coxph(formula = Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ . , data = df, method = "breslow")
    # # Warning message:
    # # In fitter(X, Y, strats, offset, init, control, weights = weights,  :
    # #   Loglik converged before variable  4,6,10 ; beta may be infinite. 
    # 
    # 
    # #@ object.coxph$coefficients |> names() |> dput() ----
    # object.coxph$coefficients |> names() |> dput()
    # # > object.coxph$coefficients |> names() |> dput()
    # # c("AGE", "SEXFemale", "CigaretteCurrentSmokerTRUE", "BMI_Q_yr18.5-", 
    # # "BMI_Q_yr23-", "BMI_Q_yr25-", "BMI_Q_yr30-", "CCI_yr", "pmhx_DM_OR_glucose_ge126TRUE", 
    # # "total_ddd_yr_METFORMIN.ge30[30,Inf]")
    # 
    # 
    # #@ object.coxph$formula |> str() ----
    # object.coxph$formula |> str()
    # object.coxph$formula |> as.list() |> str()
    # # > object.coxph$formula |> str()
    # # Class 'formula'  language Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ AGE + SEX + CigaretteCurrentSmoker + BMI_Q_yr + CCI_yr + pmh| __truncated__
    # #   ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
    # # > object.coxph$formula |> as.list() |> str()
    # # List of 3
    # #  $ : symbol ~
    # #  $ : language Surv(time = fuduration_yr, event = evnttrth_C24_r)
    # #  $ : language AGE + SEX + CigaretteCurrentSmoker + BMI_Q_yr + CCI_yr + pmhx_DM_OR_glucose_ge126 + total_ddd_yr_METFORMIN.ge30
    # #  - attr(*, "class")= chr "formula"
    # #  - attr(*, ".Environment")=<environment: R_GlobalEnv> 
    # 
    # #@ object.coxph$terms |> str() ----
    # object.coxph$terms |> str()
    # which(object.coxph$terms %>% attr(., "dataClasses") == "logical") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)} |> str()
    # which(object.coxph$terms %>% attr(., "dataClasses") == "exception") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)}
    # which(object.coxph$terms %>% attr(., "dataClasses") == "exception") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)} |> dput()
    # # > object.coxph$terms |> str()
    # # Classes 'terms', 'formula'  language Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ AGE + SEX + CigaretteCurrentSmoker + BMI_Q_yr + CCI_yr + pmh| __truncated__
    # #   ..- attr(*, "variables")= language list(Surv(time = fuduration_yr, event = evnttrth_C24_r), AGE, SEX, CigaretteCurrentSmoker, BMI_Q_yr, CCI_yr, pmhx| __truncated__
    # #   ..- attr(*, "factors")= int [1:8, 1:7] 0 1 0 0 0 0 0 0 0 0 ...
    # #   .. ..- attr(*, "dimnames")=List of 2
    # #   .. .. ..$ : chr [1:8] "Surv(time = fuduration_yr, event = evnttrth_C24_r)" "AGE" "SEX" "CigaretteCurrentSmoker" ...
    # #   .. .. ..$ : chr [1:7] "AGE" "SEX" "CigaretteCurrentSmoker" "BMI_Q_yr" ...
    # #   ..- attr(*, "term.labels")= chr [1:7] "AGE" "SEX" "CigaretteCurrentSmoker" "BMI_Q_yr" ...
    # #   ..- attr(*, "specials")=Dotted pair list of 3
    # #   .. ..$ strata : NULL
    # #   .. ..$ cluster: NULL
    # #   .. ..$ tt     : NULL
    # #   ..- attr(*, "order")= int [1:7] 1 1 1 1 1 1 1
    # #   ..- attr(*, "intercept")= num 1
    # #   ..- attr(*, "response")= int 1
    # #   ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
    # #   ..- attr(*, "predvars")= language list(Surv(time = fuduration_yr, event = evnttrth_C24_r), AGE, SEX, CigaretteCurrentSmoker, BMI_Q_yr, CCI_yr, pmhx| __truncated__
    # #   ..- attr(*, "dataClasses")= Named chr [1:8] "nmatrix.2" "numeric" "factor" "logical" ...
    # #   .. ..- attr(*, "names")= chr [1:8] "Surv(time = fuduration_yr, event = evnttrth_C24_r)" "AGE" "SEX" "CigaretteCurrentSmoker" ...
    # # > which(object.coxph$terms %>% attr(., "dataClasses") == "logical") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)} |> str()
    # # List of 2
    # #  $ CigaretteCurrentSmoker  : chr [1:2] "FALSE" "TRUE"
    # #  $ pmhx_DM_OR_glucose_ge126: chr [1:2] "FALSE" "TRUE"
    # # > which(object.coxph$terms %>% attr(., "dataClasses") == "exception") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)}
    # # named list()
    # # > which(object.coxph$terms %>% attr(., "dataClasses") == "exception") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)} |> dput()
    # # structure(list(), .Names = character(0))
    # 
    # 
    # 
    # #@ object.coxph$xlevels |> str(max.level = 1) ----
    # object.coxph$xlevels |> str(max.level = 1)
    # # > object.coxph$xlevels |> str(max.level = 1)
    # # List of 3
    # #  $ SEX                        : chr [1:2] "Male" "Female"
    # #  $ BMI_Q_yr                   : chr [1:5] "0-" "18.5-" "23-" "25-" ...
    # #  $ total_ddd_yr_METFORMIN.ge30: chr [1:2] "[0,30)" "[30,Inf]"
    # 
    # 
    # 
    # # which(object.coxph$terms %>% attr(., "dataClasses") == "logical") |> names() %>% {set_names(map(., function(x) c(F, T)), .)} |> str()
    # # # > which(object.coxph$terms %>% attr(., "dataClasses") == "logical") |> names() %>% {set_names(map(., function(x) c(F, T)), .)} |> str()
    # # # List of 5
    # # #  $ SEcoQ4                : logi [1:2] FALSE TRUE
    # # #  $ Disability_Any        : logi [1:2] FALSE TRUE
    # # #  $ CigaretteCurrentSmoker: logi [1:2] FALSE TRUE
    # # #  $ Drink_ge3pwk          : logi [1:2] FALSE TRUE
    # # #  $ Excercise_ge3pwk      : logi [1:2] FALSE TRUE
    # which(object.coxph$terms %>% attr(., "dataClasses") == "logical") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)} |> str()
    # # > which(object.coxph$terms %>% attr(., "dataClasses") == "logical") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)} |> str()
    # # List of 5
    # #  $ SEcoQ4                : chr [1:2] "FALSE" "TRUE"
    # #  $ Disability_Any        : chr [1:2] "FALSE" "TRUE"
    # #  $ CigaretteCurrentSmoker: chr [1:2] "FALSE" "TRUE"
    # #  $ Drink_ge3pwk          : chr [1:2] "FALSE" "TRUE"
    # #  $ Excercise_ge3pwk      : chr [1:2] "FALSE" "TRUE"
    # 
    # which(object.coxph$terms %>% attr(., "dataClasses") == "exception") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)}
    # which(object.coxph$terms %>% attr(., "dataClasses") == "exception") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)} |> dput()
    # # > which(object.coxph$terms %>% attr(., "dataClasses") == "exception") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)}
    # # named list()
    # # > which(object.coxph$terms %>% attr(., "dataClasses") == "exception") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)} |> dput()
    # # structure(list(), .Names = character(0))
    
    # degub 200222 for strata(MatchingPairID) -----
#     Browse[2]> object.coxph$xlevels |> str()
# List of 2
#  $ MatchingPairID        : chr [1:683] "Female|40-|SEcoQ1|Level 1-2_NA" "Female|40-|SEcoQ1|Level 3-6_NA" "Female|40-|SEcoQ1|None_1" "Female|40-|SEcoQ1|None_2" ...
#  $ strata(MatchingPairID): chr [1:587] "Female|40-|SEcoQ1|None_1" "Female|40-|SEcoQ1|None_2" "Female|40-|SEcoQ1|None_3" "Female|40-|SEcoQ1|None_4" ...
    list_levels = object.coxph$xlevels  # debug181027 for logical variables appended with "TRUE" in the dataseet.
    list_levels = c(list_levels, which(object.coxph$terms %>% attr(., "dataClasses") == "logical") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)})  # debug181027 for logical variables appended with "TRUE" in the dataseet.
    
    
    #@ tbl_varname_level_coefficients ====
    # browser()
                                                                                                                                # $`AGE_group`
    # [1] "40-" "50-" "60-" "70-"
    # Browse[1]> list_levels %>% enframe(name = "varname", value = "level")
    # # A tibble: 1 x 2
    #   varname   level    
    #   <chr>     <list>   
    # 1 AGE_group <chr [4]>
    # Browse[1]> list_levels %>% enframe(name = "varname", value = "level") %>% unnest
    # # A tibble: 4 x 2
    #   varname   level
    #   <chr>     <chr>
    # 1 AGE_group 40-  
    # 2 AGE_group 50-  
    # 3 AGE_group 60-  
    # 4 AGE_group 70-  
    # Browse[1]> list_levels |> length()
    # [1] 0
    # Browse[1]> list_levels %>% enframe(name = "varname", value = "level") %>% unnest %>% mutate(varnamelevel = paste0(varname, level))
    # # A tibble: 4 x 3
    #   varname   level varnamelevel
    #   <chr>     <chr> <chr>       
    # 1 AGE_group 40-   AGE_group40-
    # 2 AGE_group 50-   AGE_group50-
    # 3 AGE_group 60-   AGE_group60-
    # 4 AGE_group 70-   AGE_group70-
    # Browse[2]> list_levels %>% enframe(name = "varname", value = "level") %>% unnest %>% mutate(varnamelevel = paste0(varname, level)) |> dput()
    # structure(list(varname = c("AGE_group", "AGE_group", "AGE_group", 
    # "AGE_group"), level = c("40-", "50-", "60-", "70-"), varnamelevel = c("AGE_group40-", 
    # "AGE_group50-", "AGE_group60-", "AGE_group70-")), class = c("tbl_df", 
    # "tbl", "data.frame"), row.names = c(NA, -4L))
    # Browse[2]> list_levels %>% enframe(name = "varname", value = "level") %>% unnest %>% mutate(varnamelevel = paste0(varname, level)) %>% dplyr::filter(varname == "varname")
    # # A tibble: 0 x 3
    # # ... with 3 variables: varname <chr>, level <chr>, varnamelevel <chr>
    # Browse[2]> list_levels %>% enframe(name = "varname", value = "level") %>% unnest %>% mutate(varnamelevel = paste0(varname, level)) %>% dplyr::filter(varname == "varname") |> dput()
    # structure(list(varname = character(0), level = character(0), 
    #     varnamelevel = character(0)), class = c("tbl_df", "tbl", 
    # "data.frame"), row.names = c(NA, 0L))
    # Browse[2]> tibble(varname = character(0), level = character(0), varnamelevel = character(0))
    # # A tibble: 0 x 3
    # # ... with 3 variables: varname <chr>, level <chr>, varnamelevel <chr>
    # Browse[1]> list_levels %>% enframe(name = "varname", value = "level") %>% unnest %>% mutate(varnamelevel = paste0(varname, level)) %>% full_join(
    # +             object.coxph$coefficients |> as_tibble() %>% rownames_to_column("varnamelevel") |> rename(coefficients = value), by = "varnamelevel"
    # +         ) #----
    # # A tibble: 6 x 4
    #   varname   level varnamelevel             coefficients
    #   <chr>     <chr> <chr>                           <dbl>
    # 1 AGE_group 40-   AGE_group40-                  NA     
    # 2 AGE_group 50-   AGE_group50-                   0.686 
    # 3 AGE_group 60-   AGE_group60-                   1.36  
    # 4 AGE_group 70-   AGE_group70-                   1.91  
    # 5 NA        NA    total_ddd_yr_ASPIRIN.dyd       0.0176
    # 6 NA        NA    total_ddd_yr_NSAID.dyd         0.0245
    # Browse[2]> tbl_varname_level_coefficients |> dput()
    # structure(list(varname = c("AGE_group", "AGE_group", "AGE_group", 
    # "AGE_group", NA, NA), level = c("40-", "50-", "60-", "70-", NA, 
    # NA), varnamelevel = c("AGE_group40-", "AGE_group50-", "AGE_group60-", 
    # "AGE_group70-", "total_ddd_yr_ASPIRIN.dyd", "total_ddd_yr_NSAID.dyd"
    # ), coefficients = c(NA, 0.685509497816688, 1.36352938332315, 
    # 1.9073750200637, 0.0176023831525104, 0.024505492049069)), row.names = c(NA, 
    # -6L), class = c("tbl_df", "tbl", "data.frame"))
    # 
    # Browse[2]> tbl_varname_level_coefficients
    # # A tibble: 6 x 4
    #   varname                  level varnamelevel             coefficients
    #   <chr>                    <chr> <chr>                           <dbl>
    # 1 AGE_group                40-   AGE_group40-                   0     
    # 2 AGE_group                50-   AGE_group50-                   0.686 
    # 3 AGE_group                60-   AGE_group60-                   1.36  
    # 4 AGE_group                70-   AGE_group70-                   1.91  
    # 5 total_ddd_yr_ASPIRIN.dyd NA    total_ddd_yr_ASPIRIN.dyd       0.0176
    # 6 total_ddd_yr_NSAID.dyd   NA    total_ddd_yr_NSAID.dyd         0.0245
    # 
    # 
    # Browse[1]> list_levels |> str()
    #  list()
    # Browse[1]> list_levels |> dput()
    # list()
    # Browse[1]> list_levels |> length()
    # [1] 0
    # Browse[1]> list_levels %>% enframe(name = "varname", value = "level") %>% unnest %>% mutate(varnamelevel = paste0(varname, level)) %>% full_join(
    # +             object.coxph$coefficients |> as_tibble() %>% rownames_to_column("varnamelevel") |> rename(coefficients = value), by = "varnamelevel"
    # +         ) #----
    # Error in mutate_impl(.data, dots) : 
    #   Evaluation error: object 'level' not found.
    # 
    # 
    #   
    # if (length(list_levels) == 0) {
    # 	tibble(varname = character(0), level = character(0), varnamelevel = character(0))
    # }
    # 
               
    # debug 200222) as_tibble() removes the rownames -_- -----                                                                            
    # debug 200222) right_join() instead of full_join() to remove something like strata(MatchingPairID) -_- -----                                                                            
    #@ tbl_varname_level_coefficients ====
    if (length(list_levels) == 0) { # debug 181115 ----
        tbl_varname_level_coefficients = tibble(varname = character(0), level = character(0), varnamelevel = character(0)) %>% right_join(
                tibble(varnamelevel = names(object.coxph$coefficients), coefficients = object.coxph$coefficients), by = "varnamelevel"
            ) #----
    } else {
        tbl_varname_level_coefficients = 
            list_levels %>% enframe(name = "varname", value = "level") %>% unnest %>% mutate(varnamelevel = paste0(varname, level)) %>% right_join(
                tibble(varnamelevel = names(object.coxph$coefficients), coefficients = object.coxph$coefficients), by = "varnamelevel"
            ) #----
    }
    
    tbl_varname_level_coefficients$coefficients[is.na(tbl_varname_level_coefficients$coefficients) & !is.na(tbl_varname_level_coefficients$level)] = 0
    tbl_varname_level_coefficients$varname[is.na(tbl_varname_level_coefficients$varname)] = 
        tbl_varname_level_coefficients$varnamelevel[is.na(tbl_varname_level_coefficients$varname)]
    
    # tbl_varname_level_coefficients |> print(n=99) #----
    # # > tbl_varname_level_coefficients |> print(n=99) #----
    # # # A tibble: 15 x 4
    # # varname                     level    varnamelevel                        coefficients
    # # <chr>                       <chr>    <chr>                                      <dbl>
    # #     1 SEX                         Male     SEXMale                                    0
    # # 2 SEX                         Female   SEXFemale                                 -1.22
    # # 3 BMI_Q_yr                    0-       BMI_Q_yr0-                                 0
    # # 4 BMI_Q_yr                    18.5-    BMI_Q_yr18.5-                             18.8
    # # 5 BMI_Q_yr                    23-      BMI_Q_yr23-                                1.11
    # # 6 BMI_Q_yr                    25-      BMI_Q_yr25-                               20.6
    # # 7 BMI_Q_yr                    30-      BMI_Q_yr30-                                1.21
    # # 8 total_ddd_yr_METFORMIN.ge30 [0,30)   total_ddd_yr_METFORMIN.ge30[0,30)          0
    # # 9 total_ddd_yr_METFORMIN.ge30 [30,Inf] total_ddd_yr_METFORMIN.ge30[30,Inf]      -19.9
    # # 10 CigaretteCurrentSmoker      FALSE    CigaretteCurrentSmokerFALSE                0
    # # 11 CigaretteCurrentSmoker      TRUE     CigaretteCurrentSmokerTRUE                 1.16
    # # 12 pmhx_DM_OR_glucose_ge126    FALSE    pmhx_DM_OR_glucose_ge126FALSE              0
    # # 13 pmhx_DM_OR_glucose_ge126    TRUE     pmhx_DM_OR_glucose_ge126TRUE               0.832
    # # 14 AGE                         NA       AGE                                        0.227
    # # 15 CCI_yr                      NA       CCI_yr                                     0.138
    
    
    
    #@ function.extractHR.focus.incl.reference() ----
    res1 = summary(object.coxph)[c("coefficients", "conf.int")] %>% 
        map(as.data.frame) %>% map(rownames_to_column) %>% reduce(full_join, by = c("rowname", "exp(coef)")) %>% 
        {.[c("rowname", "exp(coef)", "lower .95", "upper .95", "Pr(>|z|)")]}
    # res1 |> as_tibble()
    # # > res1 |> as_tibble()
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
    
    # res2 = tibble(
    #     rowname = res$rowname
    #     , HR = res %>% 
    #         column_to_rownames %>% map(round, max(2, digits)) %>% map_df(format,  digits = digits, scientific = F) %>% 
    #         add_column(" (", .after = "exp(coef)") %>%
    #         add_column(", ", .after = "lower .95") %>%
    #         add_column("), p = ", .after = "upper .95") %>%
    #         unite(sep="") |> unlist() %>% gsub("p = 0.000", "p < 0.001", .)
    # )
  
    sprintf_but_ceiling5 = function(fmt='%#.2f', x, ...) {
        sprintf(fmt = fmt, x + 10^(-9), ...)
        # > 5.5550 %>% sprintf(fmt='%#.2f')
        # [1] "5.55"
        # > 5.5550 %>% sprintf_but_ceiling5(fmt='%#.2f')
        # [1] "5.56"
    }
    # res1[c("exp(coef)", "lower .95", "upper .95")] %>%
    #     map_df(sprintf_but_ceiling5,  fmt = "%.2f")
    # res1[c("exp(coef)", "lower .95", "upper .95")] %>%
    #     signif(digits = digits + 1) %>% map_df(sprintf_but_ceiling5,  fmt = "%.2f")
    # res1[c("exp(coef)", "lower .95", "upper .95")] |> str()
    # res1[c("exp(coef)", "lower .95", "upper .95")] %>% {.[. > 99.99 & . < Inf] = 99.99; .} %>% 
    #     map_df(sprintf_but_ceiling5,  fmt = "%.2f")
    # # > res10[c("exp(coef)", "lower .95", "upper .95")] %>%
    # # +     map_df(sprintf_but_ceiling5,  fmt = "%.2f")
    # # # A tibble: 10 x 3
    # #    `exp(coef)`      `lower .95` `upper .95`
    # #    <chr>            <chr>       <chr>      
    # #  1 0.00             0.00        Inf        
    # #  2 0.00             0.00        Inf        
    # #  3 0.00             0.00        Inf        
    # #  4 4.56             0.34        60.57      
    # #  5 0.00             0.00        Inf        
    # #  6 0.00             0.00        Inf        
    # #  7 111699493356.72  0.00        Inf        
    # #  8 5.23             5.23        5.23       
    # #  9 4486328565244.22 0.00        Inf        
    # # 10 1.03             0.07        15.76      
    # # > res10[c("exp(coef)", "lower .95", "upper .95")] %>%
    # # +     signif(digits = digits + 1) %>% map_df(sprintf_but_ceiling5,  fmt = "%.2f")
    # # # A tibble: 10 x 3
    # #    `exp(coef)`      `lower .95` `upper .95`
    # #    <chr>            <chr>       <chr>      
    # #  1 0.00             0.00        Inf        
    # #  2 0.00             0.00        Inf        
    # #  3 0.00             0.00        Inf        
    # #  4 4.56             0.34        60.60      
    # #  5 0.00             0.00        Inf        
    # #  6 0.00             0.00        Inf        
    # #  7 112000000000.00  0.00        Inf        
    # #  8 5.23             5.23        5.23       
    # #  9 4490000000000.00 0.00        Inf        
    # # 10 1.03             0.07        15.80   
    # # > res1[c("exp(coef)", "lower .95", "upper .95")] %>% {.[. > 99.99 & . < Inf] = 99.99; .} %>% 
    # # +         map_df(sprintf_but_ceiling5,  fmt = "%.2f")
    # # # A tibble: 28 x 3
    # # `exp(coef)` `lower .95` `upper .95`
    # # <chr>       <chr>       <chr>      
    # #     1 0.00        0.00        Inf        
    # # 2 0.00        0.00        Inf        
    # # 3 0.00        0.00        Inf        
    # # 4 4.56        0.34        60.57      
    # # 5 0.00        0.00        Inf        
    # # 6 0.00        0.00        Inf        
    # # 7 99.99       0.00        Inf        
    # # 8 5.23        5.23        5.23       
    # # 9 99.99       0.00        Inf        
    # # 10 1.03        0.07        15.76      
    # # # ... with 18 more rows
    
    # debug 200222 ----
    # # Browse[2]> res1 |> dput()
    # res1 = structure(list(rowname = "total_ddd_yr_ASPIRIN.dyd", `exp(coef)` = 0.978099509806593,
    # `lower .95` = 0.891900198786099, `upper .95` = 1.07262970945176,
    # `Pr(>|z|)` = 0.638042892543426), row.names = c(NA, -1L), class = "data.frame")
    
    res2 = tibble(
        rowname = res1$rowname
        , HRCI = res1[c("exp(coef)", "lower .95", "upper .95")] %>% {.[. > 99.99 & . < Inf] = 99.99; .} %>% 
            map_df(sprintf_but_ceiling5,  fmt = paste0("%.", digits, "f")) %>% 
            transmute(HRCI = paste0(`exp(coef)`, " (", `lower .95`, ", ", `upper .95`, ")") %>% gsub("99.99", ">100", .)) |> unlist()
        , p_value = paste0("p=", res1$`Pr(>|z|)` %>% sprintf("%.3f", .)) %>% gsub("p=0.000", "p<0.001", .)
        , star = res1$`Pr(>|z|)` %>% 
            cut(breaks = c(0, 0.001, 0.005, 0.01, 0.05, 0.1, 1)
                , labels = c("***", "***", "** ", "*  ", ".  ", "   ") 
                , include.lowest = T, right = T
            )
    )
    res2
    # > res2
    # # A tibble: 28 x 4
    # rowname                                    HRCI               p_value star 
    # <chr>                                      <chr>              <chr>   <fct>
    # 1 total_ddd_yr_ASPIRIN.cut[0.001,30)         0.00 (0.00, Inf)   p=0.995 "   "
    # 2 total_ddd_yr_ASPIRIN.cut[30,365)           0.00 (0.00, Inf)   p=0.993 "   "
    # 3 total_ddd_yr_ASPIRIN.cut[365,730)          0.00 (0.00, Inf)   p=0.997 "   "
    # 4 total_ddd_yr_ASPIRIN.cut[730,1.1e+03)      4.56 (0.34, 60.57) p=0.250 "   "
    # 5 total_ddd_yr_ASPIRIN.cut[1.1e+03,1.46e+03) 0.00 (0.00, Inf)   p=0.999 "   "
    # 6 total_ddd_yr_ASPIRIN.cut[1.46e+03,Inf]     0.00 (0.00, Inf)   p=0.999 "   "
    # 7 AGE_group50-                               >100 (0.00, Inf)   p=1.000 "   "
    # 8 AGE_group60-                               5.23 (5.23, 5.23)  p<0.001 ***  
    #     9 AGE_group70-                               >100 (0.00, Inf)   p=1.000 "   "
    # 10 total_ddd_yr_NSAID.cut[0.001,30)           1.03 (0.07, 15.76) p=0.986 "   "
    # # ... with 18 more rows
    
    res = res2 %>% full_join(res1, by = "rowname") |> rename(varnamelevel = rowname)
    
    tbl_varname_level_coefficients_res = tbl_varname_level_coefficients %>% full_join(res, by = "varnamelevel")
    tbl_varname_level_coefficients_res$`exp(coef)`[is.na(tbl_varname_level_coefficients_res$`exp(coef)`) & !is.na(tbl_varname_level_coefficients_res$level)] = 1
    tbl_varname_level_coefficients_res$HRCI[is.na(tbl_varname_level_coefficients_res$HRCI) & !is.na(tbl_varname_level_coefficients_res$level)] = "(reference)"
    # tbl_varname_level_coefficients_res |> print(n=99)
    # tbl_varname_level_coefficients_res |> names() |> dput()
    # # > tbl_varname_level_coefficients_res |> print(n=99)
    # # # A tibble: 15 x 11
    # # varname                     level    varnamelevel                        coefficients HRCI                           p_value star  `exp(coef)` `lower .95` `upper .95` `Pr(>|z|)`
    # # <chr>                       <chr>    <chr>                                      <dbl> <chr>                          <chr>   <fct>       <dbl>       <dbl>       <dbl>      <dbl>
    # # 1 SEX                         Male     SEXMale                                    0     (reference)                    NA      NA        1.00e+0     NA            NA      NA      
    # # 2 SEX                         Female   SEXFemale                                 -1.22  "        0.295 (0.028,  3.13)" p=0.311 "   "     2.95e-1      0.0278        3.13    0.311  
    # # 3 BMI_Q_yr                    0-       BMI_Q_yr0-                                 0     (reference)                    NA      NA        1.00e+0     NA            NA      NA      
    # # 4 BMI_Q_yr                    18.5-    BMI_Q_yr18.5-                             18.8   139245599.097 (0.000,   Inf)   p=1.000 "   "     1.39e+8      0           Inf       1.000  
    # # 5 BMI_Q_yr                    23-      BMI_Q_yr23-                                1.11  "        3.044 (0.000,   Inf)" p=1.000 "   "     3.04e+0      0           Inf       1.000  
    # # 6 BMI_Q_yr                    25-      BMI_Q_yr25-                               20.6   927100265.413 (0.000,   Inf)   p=1.000 "   "     9.27e+8      0           Inf       1.000  
    # # 7 BMI_Q_yr                    30-      BMI_Q_yr30-                                1.21  "        3.354 (0.000,   Inf)" p=1.000 "   "     3.35e+0      0           Inf       1.000  
    # # 8 total_ddd_yr_METFORMIN.ge30 [0,30)   total_ddd_yr_METFORMIN.ge30[0,30)          0     (reference)                    NA      NA        1.00e+0     NA            NA      NA      
    # # 9 total_ddd_yr_METFORMIN.ge30 [30,Inf] total_ddd_yr_METFORMIN.ge30[30,Inf]      -19.9   "        0.000 (0.000,   Inf)" p=0.999 "   "     2.27e-9      0           Inf       0.999  
    # # 10 CigaretteCurrentSmoker      FALSE    CigaretteCurrentSmokerFALSE                0     (reference)                    NA      NA        1.00e+0     NA            NA      NA      
    # # 11 CigaretteCurrentSmoker      TRUE     CigaretteCurrentSmokerTRUE                 1.16  "        3.191 (0.236, 43.19)" p=0.383 "   "     3.19e+0      0.236        43.2     0.383  
    # # 12 pmhx_DM_OR_glucose_ge126    FALSE    pmhx_DM_OR_glucose_ge126FALSE              0     (reference)                    NA      NA        1.00e+0     NA            NA      NA      
    # # 13 pmhx_DM_OR_glucose_ge126    TRUE     pmhx_DM_OR_glucose_ge126TRUE               0.832 "        2.299 (0.232, 22.81)" p=0.477 "   "     2.30e+0      0.232        22.8     0.477  
    # # 14 AGE                         NA       AGE                                        0.227 "        1.255 (1.085,  1.45)" p=0.002 ***       1.26e+0      1.08          1.45    0.00225
    # # 15 CCI_yr                      NA       CCI_yr                                     0.138 "        1.148 (0.667,  1.97)" p=0.619 "   "     1.15e+0      0.667         1.97    0.619  
    # # > tbl_varname_level_coefficients_res |> names() |> dput()
    # # c("varname", "level", "varnamelevel", "coefficients", "HRCI", "p_value", "star", "exp(coef)", "lower .95", "upper .95", "Pr(>|z|)")
    # # txt = '"varname", "level", "varnamelevel", "coefficients", "HRCI", "p_value", "star", "exp(coef)", "lower .95", "upper .95", "Pr(>|z|)"'
    # # txt |> str_extract_all("[A-Za-z0-9_]+") |> str()
    # # txt |> str_extract_all("[A-Za-z0-9_]+") |> unlist() |> paste0(collapse = ', ') %>% {paste0('select(', ., ')')} |> cat("  \n", sep="")
    # # select(varname, level, varnamelevel, coefficients, HRCI, p_value, star, exp, coef, lower, 95, upper, 95, Pr, z)
    
    out = tbl_varname_level_coefficients_res %>% select(varname, level, HRCI, p_value, star, everything())
}




# @@ data_list.cut.coxph_list.HRCI from analyticDF_C24.drop_pmhx_negativetime.list.cut.coxph_list ====  
# @ name4MainData, name4MainTransformation, name4FullModel ====  
name4MainData = "_5yr"
# name4MainTransformation = "cut"
name4FullModel = "cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM_Med"

analyticDF_C24.drop_pmhx_negativetime.list.cut.coxph_list |> str(max.level = 1)
# > analyticDF_C24.drop_pmhx_negativetime.list.cut.coxph_list |> str(max.level = 1)
# List of 7
#  $ cut_model2_ASPIRIN_AGE_group                                     :List of 5
#  $ cut_model3_ASPIRIN_AGE_group_NSAID                               :List of 5
#  $ cut_model4_ASPIRIN_AGE_group_NSAID_SEX                           :List of 5
#  $ cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM    :List of 5
#  $ cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_Med   :List of 5
#  $ cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM_Med:List of 5
#  $ function.tbl_varname_level_coefHR                                :function (object.coxph, focus.variable = ".*", digits = 3)  
#   ..- attr(*, "srcref")= 'srcref' int [1:8] 2 37 300 1 37 1 2 300
#   .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x0000000029f91bf0> 

is.list(analyticDF_C24.drop_pmhx_negativetime.list.cut.coxph_list)
# > is.list(analyticDF_C24.drop_pmhx_negativetime.list.cut.coxph_list)
# [1] TRUE

analyticDF_C24.drop_pmhx_negativetime.list.cut.coxph_list$cut_model2_ASPIRIN_AGE_group$`_5yr` %>% inherits("coxph")
# > analyticDF_C24.drop_pmhx_negativetime.list.cut.coxph_list$cut_model2_ASPIRIN_AGE_group$`_5yr` %>% inherits("coxph")
# [1] TRUE

# @@ data_list.cut.coxph_list.HRCI from analyticDF_C24.drop_pmhx_negativetime.list.cut.coxph_list ====  
data_list.cut.coxph_list.HRCI =
    analyticDF_C24.drop_pmhx_negativetime.list.cut.coxph_list %>% 
    map(function(list_object.coxph) {
        if(is.list(list_object.coxph)) {
            list_object.coxph %>% map(function(ob) {
                if (ob %>% inherits("coxph")) {
                    ob %>% function.tbl_varname_level_HRCI
                } else {
                    '!inherits(ob, "coxph")'
                }
            })
        } else {
            '!is.list(list_object.coxph)'
        }
    })
data_list.cut.coxph_list.HRCI |> str(max.level = 1)
data_list.cut.coxph_list.HRCI$cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM_Med |> str(max.level = 1)
data_list.cut.coxph_list.HRCI$cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM_Med$`_5yr` |> str(max.level = 1)
# > data_list.cut.coxph_list.HRCI |> str(max.level = 1)
# List of 7
#  $ cut_model2_ASPIRIN_AGE_group                                     :List of 5
#  $ cut_model3_ASPIRIN_AGE_group_NSAID                               :List of 5
#  $ cut_model4_ASPIRIN_AGE_group_NSAID_SEX                           :List of 5
#  $ cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM    :List of 5
#  $ cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_Med   :List of 5
#  $ cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM_Med:List of 5
#  $ function.tbl_varname_level_coefHR                                : chr "!is.list(list_object.coxph)"
# > data_list.cut.coxph_list.HRCI$cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM_Med |> str(max.level = 1)
# List of 5
#  $ _3yr:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	36 obs. of  11 variables:
#  $ _4yr:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	38 obs. of  11 variables:
#  $ _5yr:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	40 obs. of  11 variables:
#  $ _6yr:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	42 obs. of  11 variables:
#  $ _7yr:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	44 obs. of  11 variables:
# > data_list.cut.coxph_list.HRCI$cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM_Med$`_5yr` |> str(max.level = 1)
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	40 obs. of  11 variables:
#  $ varname     : chr  "total_ddd_yr_ASPIRIN.cut" "total_ddd_yr_ASPIRIN.cut" "total_ddd_yr_ASPIRIN.cut" "total_ddd_yr_ASPIRIN.cut" ...
#  $ level       : chr  "[0,0.001)" "[0.001,30)" "[30,365)" "[365,730)" ...
#  $ HRCI        : chr  "(reference)" " 0.839 ( 0.571,  1.234)" " 0.901 ( 0.672,  1.208)" " 0.986 ( 0.667,  1.459)" ...
#  $ p_value     : chr  NA "p=0.374" "p=0.485" "p=0.945" ...
#  $ star        : Factor w/ 5 levels "***","** ","*  ",..: NA 5 5 5 5 4 5 NA 1 1 ...
#  $ varnamelevel: chr  "total_ddd_yr_ASPIRIN.cut[0,0.001)" "total_ddd_yr_ASPIRIN.cut[0.001,30)" "total_ddd_yr_ASPIRIN.cut[30,365)" "total_ddd_yr_ASPIRIN.cut[365,730)" ...
#  $ coefficients: num  0 -0.175 -0.1044 -0.0139 0.1362 ...
#  $ exp(coef)   : num  1 0.839 0.901 0.986 1.146 ...
#  $ lower .95   : num  NA 0.571 0.672 0.667 0.747 ...
#  $ upper .95   : num  NA 1.23 1.21 1.46 1.76 ...
#  $ Pr(>|z|)    : num  NA 0.374 0.485 0.945 0.533 ...



                                                                                                                            
                                                                                                                            
                                                                                                                            
                                                                                                                            
                                                                                                                            
                                                                                                                            
                                                                                                                            
                                                                                                                            
                                                                                                                            
                                                                                                                            
                                                                                                                            
                                                                                                                            
                                                                                                                            
                                                                                                                            
                                     

# @@ data_main.cut.coxph_list.HRCI from data_list.cut.coxph_list.HRCI ----  
# @ name4MainData, name4MainTransformation, name4FullModel ====  
name4MainData = "_5yr"
# name4MainTransformation = "cut"
name4FullModel = "cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM_Med"

data_list.cut.coxph_list.HRCI |> str(max.level = 1)
data_list.cut.coxph_list.HRCI %>% map(function(ls) if(is.list(ls)) ls[[name4MainData]] else NULL) |> str(max.level = 1)
data_list.cut.coxph_list.HRCI %>% map(function(ls) if(is.list(ls)) ls[[name4MainData]] else NULL) %>% compact |> str(max.level = 1)
# > data_list.cut.coxph_list.HRCI %>% map(function(ls) if(is.list(ls)) ls[[name4MainData]] else NA) |> str(max.level = 1)
# List of 7
#  $ cut_model2_ASPIRIN_AGE_group                                     :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	11 obs. of  11 variables:
#  $ cut_model3_ASPIRIN_AGE_group_NSAID                               :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	18 obs. of  11 variables:
#  $ cut_model4_ASPIRIN_AGE_group_NSAID_SEX                           :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	20 obs. of  11 variables:
#  $ cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM    :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	38 obs. of  11 variables:
#  $ cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_Med   :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	40 obs. of  11 variables:
#  $ cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM_Med:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	40 obs. of  11 variables:
#  $ function.tbl_varname_level_coefHR                                : logi NA
# > data_list.cut.coxph_list.HRCI %>% map(function(ls) if(is.list(ls)) ls[[name4MainData]] else NULL) %>% compact |> str(max.level = 1)
# List of 6
#  $ cut_model2_ASPIRIN_AGE_group                                     :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	11 obs. of  11 variables:
#  $ cut_model3_ASPIRIN_AGE_group_NSAID                               :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	18 obs. of  11 variables:
#  $ cut_model4_ASPIRIN_AGE_group_NSAID_SEX                           :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	20 obs. of  11 variables:
#  $ cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM    :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	38 obs. of  11 variables:
#  $ cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_Med   :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	40 obs. of  11 variables:
#  $ cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM_Med:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	40 obs. of  11 variables:

# @@ data_main.cut.coxph_list.HRCI from data_list.cut.coxph_list.HRCI ----  
data_main.cut.coxph_list.HRCI =
    data_list.cut.coxph_list.HRCI %>% map(function(ls) if(is.list(ls)) ls[[name4MainData]] else NULL) %>% compact
                                     
                                     
                                     
                                     
# data_main.cut.coxph_list.HRCI %>% map() select(varname, level, HRCI, p_value, star) |> as.data.frame() |> print() #----  
data_main.cut.coxph_list.HRCI %>% map(function(ob) {
    # Codes to insert inside in the beginning annonymous function for map
    parent.x = get(".x", envir = parent.frame())
    i = which(map_lgl(parent.x, function(children_from_parent.x) { identical(children_from_parent.x, ob) } ))

    # print(Sys.time())
    # print(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #----" ))
    cat(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #---- \n" ))

    ob %>% select(varname, level, HRCI, p_value, star) |> as.data.frame() |> print()
    "ok"
})
# > data_main.cut.coxph_list.HRCI %>% map(function(ob) {
# +     # Codes to insert inside in the beginning annonymous function for map
# +     parent.x = get(".x", envir = parent.frame())
# +     i = which(map_lgl(parent.x, function(children_from_parent.x) { identical(children_from_parent.x, ob) } ))
# + 
# +     # print(Sys.time())
# +     # print(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #----" ))
# +     cat(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #---- \n" ))
# + 
# +     ob %>% select(varname, level, HRCI, p_value, star) |> as.data.frame() |> print()
# +     "ok"
# + })
# Beginning .f() map from list element [[1]] named: cut_model2_ASPIRIN_AGE_group  #----  
#                     varname              level                 HRCI p_value star
# 1  total_ddd_yr_ASPIRIN.cut          [0,0.001)          (reference)    <NA> <NA>
# 2  total_ddd_yr_ASPIRIN.cut         [0.001,30)    0.91 (0.63, 1.32) p=0.618     
# 3  total_ddd_yr_ASPIRIN.cut           [30,365)    0.95 (0.71, 1.26) p=0.717     
# 4  total_ddd_yr_ASPIRIN.cut          [365,730)    1.06 (0.72, 1.56) p=0.766     
# 5  total_ddd_yr_ASPIRIN.cut      [730,1.1e+03)    1.28 (0.85, 1.93) p=0.245     
# 6  total_ddd_yr_ASPIRIN.cut [1.1e+03,1.46e+03)    0.54 (0.25, 1.13) p=0.101     
# 7  total_ddd_yr_ASPIRIN.cut     [1.46e+03,Inf]    1.03 (0.55, 1.93) p=0.924     
# 8                 AGE_group                40-          (reference)    <NA> <NA>
# 9                 AGE_group                50-    3.47 (2.66, 4.52) p<0.001  ***
# 10                AGE_group                60-   7.83 (6.07, 10.11) p<0.001  ***
# 11                AGE_group                70- 16.75 (12.61, 22.25) p<0.001  ***
# Beginning .f() map from list element [[2]] named: cut_model3_ASPIRIN_AGE_group_NSAID  #----  
#                     varname              level                 HRCI p_value star
# 1  total_ddd_yr_ASPIRIN.cut          [0,0.001)          (reference)    <NA> <NA>
# 2  total_ddd_yr_ASPIRIN.cut         [0.001,30)    0.91 (0.63, 1.32) p=0.621     
# 3  total_ddd_yr_ASPIRIN.cut           [30,365)    0.95 (0.71, 1.26) p=0.716     
# 4  total_ddd_yr_ASPIRIN.cut          [365,730)    1.06 (0.72, 1.56) p=0.766     
# 5  total_ddd_yr_ASPIRIN.cut      [730,1.1e+03)    1.28 (0.85, 1.94) p=0.242     
# 6  total_ddd_yr_ASPIRIN.cut [1.1e+03,1.46e+03)    0.54 (0.25, 1.14) p=0.104     
# 7  total_ddd_yr_ASPIRIN.cut     [1.46e+03,Inf]    1.04 (0.55, 1.94) p=0.912     
# 8                 AGE_group                40-          (reference)    <NA> <NA>
# 9                 AGE_group                50-    3.45 (2.65, 4.51) p<0.001  ***
# 10                AGE_group                60-   7.76 (5.99, 10.05) p<0.001  ***
# 11                AGE_group                70- 16.52 (12.38, 22.04) p<0.001  ***
# 12   total_ddd_yr_NSAID.cut          [0,0.001)          (reference)    <NA> <NA>
# 13   total_ddd_yr_NSAID.cut         [0.001,30)    0.86 (0.68, 1.09) p=0.206     
# 14   total_ddd_yr_NSAID.cut           [30,365)    0.94 (0.73, 1.21) p=0.615     
# 15   total_ddd_yr_NSAID.cut          [365,730)    0.99 (0.54, 1.80) p=0.961     
# 16   total_ddd_yr_NSAID.cut      [730,1.1e+03)    0.96 (0.30, 3.04) p=0.947     
# 17   total_ddd_yr_NSAID.cut [1.1e+03,1.46e+03)     0.00 (0.00, Inf) p=0.985     
# 18   total_ddd_yr_NSAID.cut     [1.46e+03,Inf]   3.19 (0.78, 12.95) p=0.105     
# Beginning .f() map from list element [[3]] named: cut_model4_ASPIRIN_AGE_group_NSAID_SEX  #----  
#                     varname              level                 HRCI p_value star
# 1  total_ddd_yr_ASPIRIN.cut          [0,0.001)          (reference)    <NA> <NA>
# 2  total_ddd_yr_ASPIRIN.cut         [0.001,30)    0.92 (0.64, 1.34) p=0.671     
# 3  total_ddd_yr_ASPIRIN.cut           [30,365)    0.96 (0.72, 1.27) p=0.767     
# 4  total_ddd_yr_ASPIRIN.cut          [365,730)    1.06 (0.72, 1.55) p=0.782     
# 5  total_ddd_yr_ASPIRIN.cut      [730,1.1e+03)    1.28 (0.84, 1.93) p=0.248     
# 6  total_ddd_yr_ASPIRIN.cut [1.1e+03,1.46e+03)    0.53 (0.25, 1.12) p=0.097  .  
# 7  total_ddd_yr_ASPIRIN.cut     [1.46e+03,Inf]    0.99 (0.53, 1.86) p=0.974     
# 8                 AGE_group                40-          (reference)    <NA> <NA>
# 9                 AGE_group                50-    3.51 (2.69, 4.58) p<0.001  ***
# 10                AGE_group                60-   8.06 (6.22, 10.44) p<0.001  ***
# 11                AGE_group                70- 17.75 (13.29, 23.71) p<0.001  ***
# 12   total_ddd_yr_NSAID.cut          [0,0.001)          (reference)    <NA> <NA>
# 13   total_ddd_yr_NSAID.cut         [0.001,30)    0.92 (0.73, 1.17) p=0.505     
# 14   total_ddd_yr_NSAID.cut           [30,365)    1.10 (0.85, 1.43) p=0.455     
# 15   total_ddd_yr_NSAID.cut          [365,730)    1.22 (0.66, 2.25) p=0.521     
# 16   total_ddd_yr_NSAID.cut      [730,1.1e+03)    1.20 (0.38, 3.81) p=0.755     
# 17   total_ddd_yr_NSAID.cut [1.1e+03,1.46e+03)     0.00 (0.00, Inf) p=0.983     
# 18   total_ddd_yr_NSAID.cut     [1.46e+03,Inf]   3.86 (0.95, 15.68) p=0.059  .  
# 19                      SEX               Male          (reference)    <NA> <NA>
# 20                      SEX             Female    0.60 (0.51, 0.71) p<0.001  ***
# Beginning .f() map from list element [[4]] named: cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM  #----  
#                     varname              level                 HRCI p_value star
# 1  total_ddd_yr_ASPIRIN.cut          [0,0.001)          (reference)    <NA> <NA>
# 2  total_ddd_yr_ASPIRIN.cut         [0.001,30)    0.84 (0.57, 1.23) p=0.374     
# 3  total_ddd_yr_ASPIRIN.cut           [30,365)    0.90 (0.67, 1.21) p=0.482     
# 4  total_ddd_yr_ASPIRIN.cut          [365,730)    0.99 (0.67, 1.46) p=0.941     
# 5  total_ddd_yr_ASPIRIN.cut      [730,1.1e+03)    1.15 (0.75, 1.76) p=0.535     
# 6  total_ddd_yr_ASPIRIN.cut [1.1e+03,1.46e+03)    0.50 (0.23, 1.06) p=0.069  .  
# 7  total_ddd_yr_ASPIRIN.cut     [1.46e+03,Inf]    0.91 (0.48, 1.71) p=0.766     
# 8                 AGE_group                40-          (reference)    <NA> <NA>
# 9                 AGE_group                50-    3.39 (2.60, 4.44) p<0.001  ***
# 10                AGE_group                60-    7.55 (5.80, 9.82) p<0.001  ***
# 11                AGE_group                70- 16.08 (11.93, 21.67) p<0.001  ***
# 12   total_ddd_yr_NSAID.cut          [0,0.001)          (reference)    <NA> <NA>
# 13   total_ddd_yr_NSAID.cut         [0.001,30)    0.94 (0.74, 1.19) p=0.598     
# 14   total_ddd_yr_NSAID.cut           [30,365)    1.08 (0.82, 1.42) p=0.574     
# 15   total_ddd_yr_NSAID.cut          [365,730)    1.17 (0.63, 2.17) p=0.616     
# 16   total_ddd_yr_NSAID.cut      [730,1.1e+03)    1.14 (0.36, 3.64) p=0.821     
# 17   total_ddd_yr_NSAID.cut [1.1e+03,1.46e+03)     0.00 (0.00, Inf) p=0.983     
# 18   total_ddd_yr_NSAID.cut     [1.46e+03,Inf]   3.50 (0.86, 14.32) p=0.081  .  
# 19                      SEX               Male          (reference)    <NA> <NA>
# 20                      SEX             Female    0.64 (0.53, 0.78) p<0.001  ***
# 21                 BMI_Q_yr                 0-          (reference)    <NA> <NA>
# 22                 BMI_Q_yr              18.5-    0.81 (0.52, 1.27) p=0.366     
# 23                 BMI_Q_yr                23-    0.74 (0.47, 1.17) p=0.200     
# 24                 BMI_Q_yr                25-    0.77 (0.49, 1.22) p=0.260     
# 25                 BMI_Q_yr                30-    1.12 (0.61, 2.04) p=0.717     
# 26                   SEcoQ4              FALSE          (reference)    <NA> <NA>
# 27                   SEcoQ4               TRUE    1.20 (0.98, 1.48) p=0.084  .  
# 28           Disability_Any              FALSE          (reference)    <NA> <NA>
# 29           Disability_Any               TRUE    1.35 (0.67, 2.72) p=0.408     
# 30   CigaretteCurrentSmoker              FALSE          (reference)    <NA> <NA>
# 31   CigaretteCurrentSmoker               TRUE    1.13 (0.91, 1.40) p=0.285     
# 32             Drink_ge3pwk              FALSE          (reference)    <NA> <NA>
# 33             Drink_ge3pwk               TRUE    1.18 (0.92, 1.52) p=0.187     
# 34         Excercise_ge3pwk              FALSE          (reference)    <NA> <NA>
# 35         Excercise_ge3pwk               TRUE    0.93 (0.76, 1.14) p=0.511     
# 36 pmhx_DM_OR_glucose_ge126              FALSE          (reference)    <NA> <NA>
# 37 pmhx_DM_OR_glucose_ge126               TRUE    1.23 (0.98, 1.54) p=0.068  .  
# 38                   CCI_yr               <NA>    1.06 (1.01, 1.12) p=0.031  *  
# Beginning .f() map from list element [[5]] named: cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_Med  #----  
#                        varname              level                 HRCI p_value star
# 1     total_ddd_yr_ASPIRIN.cut          [0,0.001)          (reference)    <NA> <NA>
# 2     total_ddd_yr_ASPIRIN.cut         [0.001,30)    0.84 (0.57, 1.23) p=0.373     
# 3     total_ddd_yr_ASPIRIN.cut           [30,365)    0.92 (0.69, 1.24) p=0.580     
# 4     total_ddd_yr_ASPIRIN.cut          [365,730)    1.02 (0.69, 1.52) p=0.920     
# 5     total_ddd_yr_ASPIRIN.cut      [730,1.1e+03)    1.19 (0.77, 1.84) p=0.425     
# 6     total_ddd_yr_ASPIRIN.cut [1.1e+03,1.46e+03)    0.52 (0.24, 1.11) p=0.089  .  
# 7     total_ddd_yr_ASPIRIN.cut     [1.46e+03,Inf]    0.96 (0.51, 1.82) p=0.901     
# 8                    AGE_group                40-          (reference)    <NA> <NA>
# 9                    AGE_group                50-    3.42 (2.62, 4.47) p<0.001  ***
# 10                   AGE_group                60-    7.61 (5.85, 9.90) p<0.001  ***
# 11                   AGE_group                70- 16.18 (12.00, 21.81) p<0.001  ***
# 12      total_ddd_yr_NSAID.cut          [0,0.001)          (reference)    <NA> <NA>
# 13      total_ddd_yr_NSAID.cut         [0.001,30)    0.93 (0.73, 1.18) p=0.565     
# 14      total_ddd_yr_NSAID.cut           [30,365)    1.07 (0.82, 1.40) p=0.625     
# 15      total_ddd_yr_NSAID.cut          [365,730)    1.16 (0.63, 2.16) p=0.635     
# 16      total_ddd_yr_NSAID.cut      [730,1.1e+03)    1.13 (0.36, 3.62) p=0.830     
# 17      total_ddd_yr_NSAID.cut [1.1e+03,1.46e+03)     0.00 (0.00, Inf) p=0.983     
# 18      total_ddd_yr_NSAID.cut     [1.46e+03,Inf]   3.48 (0.85, 14.23) p=0.083  .  
# 19                         SEX               Male          (reference)    <NA> <NA>
# 20                         SEX             Female    0.64 (0.53, 0.78) p<0.001  ***
# 21                    BMI_Q_yr                 0-          (reference)    <NA> <NA>
# 22                    BMI_Q_yr              18.5-    0.82 (0.52, 1.29) p=0.384     
# 23                    BMI_Q_yr                23-    0.75 (0.47, 1.19) p=0.224     
# 24                    BMI_Q_yr                25-    0.78 (0.50, 1.24) p=0.301     
# 25                    BMI_Q_yr                30-    1.15 (0.63, 2.10) p=0.649     
# 26 total_ddd_yr_METFORMIN.ge30             [0,30)          (reference)    <NA> <NA>
# 27 total_ddd_yr_METFORMIN.ge30           [30,Inf]    1.17 (0.85, 1.60) p=0.328     
# 28    total_ddd_yr_STATIN.ge30             [0,30)          (reference)    <NA> <NA>
# 29    total_ddd_yr_STATIN.ge30           [30,Inf]    0.85 (0.63, 1.13) p=0.258     
# 30                      SEcoQ4              FALSE          (reference)    <NA> <NA>
# 31                      SEcoQ4               TRUE    1.20 (0.98, 1.48) p=0.079  .  
# 32              Disability_Any              FALSE          (reference)    <NA> <NA>
# 33              Disability_Any               TRUE    1.35 (0.67, 2.72) p=0.404     
# 34      CigaretteCurrentSmoker              FALSE          (reference)    <NA> <NA>
# 35      CigaretteCurrentSmoker               TRUE    1.13 (0.91, 1.41) p=0.273     
# 36                Drink_ge3pwk              FALSE          (reference)    <NA> <NA>
# 37                Drink_ge3pwk               TRUE    1.18 (0.92, 1.52) p=0.185     
# 38            Excercise_ge3pwk              FALSE          (reference)    <NA> <NA>
# 39            Excercise_ge3pwk               TRUE    0.94 (0.77, 1.15) p=0.547     
# 40                      CCI_yr               <NA>    1.07 (1.01, 1.14) p=0.014  *  
# Beginning .f() map from list element [[6]] named: cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM_Med  #----  
#                        varname              level                 HRCI p_value star
# 1     total_ddd_yr_ASPIRIN.cut          [0,0.001)          (reference)    <NA> <NA>
# 2     total_ddd_yr_ASPIRIN.cut         [0.001,30)    0.84 (0.57, 1.23) p=0.374     
# 3     total_ddd_yr_ASPIRIN.cut           [30,365)    0.90 (0.67, 1.21) p=0.485     
# 4     total_ddd_yr_ASPIRIN.cut          [365,730)    0.99 (0.67, 1.46) p=0.945     
# 5     total_ddd_yr_ASPIRIN.cut      [730,1.1e+03)    1.15 (0.75, 1.76) p=0.533     
# 6     total_ddd_yr_ASPIRIN.cut [1.1e+03,1.46e+03)    0.50 (0.23, 1.06) p=0.069  .  
# 7     total_ddd_yr_ASPIRIN.cut     [1.46e+03,Inf]    0.91 (0.48, 1.72) p=0.768     
# 8                    AGE_group                40-          (reference)    <NA> <NA>
# 9                    AGE_group                50-    3.39 (2.60, 4.44) p<0.001  ***
# 10                   AGE_group                60-    7.55 (5.80, 9.82) p<0.001  ***
# 11                   AGE_group                70- 16.07 (11.92, 21.67) p<0.001  ***
# 12      total_ddd_yr_NSAID.cut          [0,0.001)          (reference)    <NA> <NA>
# 13      total_ddd_yr_NSAID.cut         [0.001,30)    0.94 (0.74, 1.19) p=0.598     
# 14      total_ddd_yr_NSAID.cut           [30,365)    1.08 (0.82, 1.42) p=0.575     
# 15      total_ddd_yr_NSAID.cut          [365,730)    1.17 (0.63, 2.17) p=0.617     
# 16      total_ddd_yr_NSAID.cut      [730,1.1e+03)    1.14 (0.36, 3.64) p=0.821     
# 17      total_ddd_yr_NSAID.cut [1.1e+03,1.46e+03)     0.00 (0.00, Inf) p=0.983     
# 18      total_ddd_yr_NSAID.cut     [1.46e+03,Inf]   3.50 (0.86, 14.32) p=0.081  .  
# 19                         SEX               Male          (reference)    <NA> <NA>
# 20                         SEX             Female    0.64 (0.53, 0.78) p<0.001  ***
# 21                    BMI_Q_yr                 0-          (reference)    <NA> <NA>
# 22                    BMI_Q_yr              18.5-    0.81 (0.52, 1.28) p=0.366     
# 23                    BMI_Q_yr                23-    0.74 (0.47, 1.17) p=0.200     
# 24                    BMI_Q_yr                25-    0.77 (0.49, 1.22) p=0.260     
# 25                    BMI_Q_yr                30-    1.12 (0.61, 2.04) p=0.716     
# 26 total_ddd_yr_METFORMIN.ge30             [0,30)          (reference)    <NA> <NA>
# 27 total_ddd_yr_METFORMIN.ge30           [30,Inf]    0.99 (0.68, 1.42) p=0.942     
# 28                      SEcoQ4              FALSE          (reference)    <NA> <NA>
# 29                      SEcoQ4               TRUE    1.20 (0.98, 1.48) p=0.084  .  
# 30              Disability_Any              FALSE          (reference)    <NA> <NA>
# 31              Disability_Any               TRUE    1.35 (0.67, 2.72) p=0.408     
# 32      CigaretteCurrentSmoker              FALSE          (reference)    <NA> <NA>
# 33      CigaretteCurrentSmoker               TRUE    1.13 (0.91, 1.40) p=0.285     
# 34                Drink_ge3pwk              FALSE          (reference)    <NA> <NA>
# 35                Drink_ge3pwk               TRUE    1.18 (0.92, 1.52) p=0.187     
# 36            Excercise_ge3pwk              FALSE          (reference)    <NA> <NA>
# 37            Excercise_ge3pwk               TRUE    0.93 (0.76, 1.15) p=0.512     
# 38    pmhx_DM_OR_glucose_ge126              FALSE          (reference)    <NA> <NA>
# 39    pmhx_DM_OR_glucose_ge126               TRUE    1.24 (0.95, 1.61) p=0.110     
# 40                      CCI_yr               <NA>    1.06 (1.01, 1.13) p=0.031  *  
# $`cut_model2_ASPIRIN_AGE_group`
# [1] "ok"
# 
# $cut_model3_ASPIRIN_AGE_group_NSAID
# [1] "ok"
# 
# $cut_model4_ASPIRIN_AGE_group_NSAID_SEX
# [1] "ok"
# 
# $cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM
# [1] "ok"
# 
# $cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_Med
# [1] "ok"
# 
# $cut_model13_ASPIRIN_AGE_group_NSAID_SEX_Social_Behavior_Hx_DM_Med
# [1] "ok"


                                          
# @ end -----  
getwd()
.path4write = getwd()
objectname = ""
# system.time(write_rds( get(objectname), file.path(.path4write, paste0(objectname,".rds","")), compress="gz", compression=9 ))
system.time(write_rds( get(objectname), file.path(.path4write, paste0(objectname,".rds","")), compress="xz", compression=9 ))
# system.time(openxlsx::write.xlsx(get(objectname), file=paste0(objectname,".xlsx"), asTable=TRUE, withFilter=TRUE))
openxlsx::write.xlsx(get(objectname), file=paste0(objectname,".xlsx"), asTable = F, withFilter = F)
if (.Platform$OS.type == "windows") openxlsx::openXL(paste0(objectname,".xlsx"))



