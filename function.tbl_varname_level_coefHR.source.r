

function.tbl_varname_level_coefHR = function (object.coxph, focus.variable = ".*", digits = 3) {
    library(survival)
    library(tidyverse)
    
    
    
    # object.coxph %>% str(max.level = 1)
    # # > object.coxph %>% str(max.level = 1) -----
    # # List of 21
    # #  $ coefficients     : Named num [1:29] -0.1745 -0.0835 0.0249 0.186 -0.6292 ...
    # #   ..- attr(*, "names")= chr [1:29] "total_ddd_yr_ASPIRIN.cut[0.001,30)" "total_ddd_yr_ASPIRIN.cut[30,365)" "total_ddd_yr_ASPIRIN.cut[365,730)" "total_ddd_yr_ASPIRIN.cut[730,1.1e+03)" ...
    # #  $ var              : num [1:29, 1:29] 0.03869 0.00324 0.00327 0.00323 0.00319 ...
    # #  $ loglik           : num [1:2] -7517 -7235
    # #  $ score            : num 719
    # #  $ iter             : int 8
    # #  $ linear.predictors: num [1:453605] 1.987 1.421 -0.132 -0.566 0.537 ...
    # #  $ residuals        : Named num [1:453605] -0.000107 -0.003745 -0.000256 -0.000514 -0.001548 ...
    # #   ..- attr(*, "names")= chr [1:453605] "1" "2" "3" "4" ...
    # #  $ means            : Named num [1:29] 0.0467 0.0676 0.0298 0.0197 0.0133 ...
    # #   ..- attr(*, "names")= chr [1:29] "total_ddd_yr_ASPIRIN.cut[0.001,30)" "total_ddd_yr_ASPIRIN.cut[30,365)" "total_ddd_yr_ASPIRIN.cut[365,730)" "total_ddd_yr_ASPIRIN.cut[730,1.1e+03)" ...
    # #  $ method           : chr "breslow"
    # #  $ concordance      : Named num [1:5] 1.86e+08 5.59e+07 1.73e+03 6.90e+01 5.80e+06
    # #   ..- attr(*, "names")= chr [1:5] "concordant" "discordant" "tied.risk" "tied.time" ...
    # #  $ n                : int 453605
    # #  $ nevent           : num 581
    # #  $ terms            :Classes 'terms', 'formula'  language Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ total_ddd_yr_ASPIRIN.cut + AGE_group + total_ddd_yr_NSAID.dy| __truncated__
    # #   .. ..- attr(*, "variables")= language list(Surv(time = fuduration_yr, event = evnttrth_C24_r), total_ddd_yr_ASPIRIN.cut, AGE_group, total_ddd_yr_NSAID.| __truncated__
    # #   .. ..- attr(*, "factors")= int [1:14, 1:13] 0 1 0 0 0 0 0 0 0 0 ...
    # #   .. .. ..- attr(*, "dimnames")=List of 2
    # #   .. ..- attr(*, "term.labels")= chr [1:13] "total_ddd_yr_ASPIRIN.cut" "AGE_group" "total_ddd_yr_NSAID.dyd" "SEX" ...
    # #   .. ..- attr(*, "specials")=Dotted pair list of 3
    # #   .. ..- attr(*, "order")= int [1:13] 1 1 1 1 1 1 1 1 1 1 ...
    # #   .. ..- attr(*, "intercept")= num 1
    # #   .. ..- attr(*, "response")= int 1
    # #   .. ..- attr(*, ".Environment")=<environment: 0x0000000038c96d30> 
    # #   .. ..- attr(*, "predvars")= language list(Surv(time = fuduration_yr, event = evnttrth_C24_r), total_ddd_yr_ASPIRIN.cut, AGE_group, total_ddd_yr_NSAID.| __truncated__
    # #   .. ..- attr(*, "dataClasses")= Named chr [1:14] "nmatrix.2" "factor" "factor" "numeric" ...
    # #   .. .. ..- attr(*, "names")= chr [1:14] "Surv(time = fuduration_yr, event = evnttrth_C24_r)" "total_ddd_yr_ASPIRIN.cut" "AGE_group" "total_ddd_yr_NSAID.dyd" ...
    # #  $ assign           :List of 13
    # #  $ wald.test        : num 521
    # #  $ na.action        : 'omit' Named int [1:7884] 5 53 125 160 162 174 326 380 402 465 ...
    # #   ..- attr(*, "names")= chr [1:7884] "5" "53" "125" "160" ...
    # #  $ y                : 'Surv' num [1:453605, 1:2]   92+ 2556+  970+ 2556+ 2556+ 2556+ 2556+ 2556+ 2556+ 2556+ ...
    # #   ..- attr(*, "dimnames")=List of 2
    # #   ..- attr(*, "type")= chr "right"
    # #   ..- attr(*, "inputAttributes")=List of 2
    # #  $ formula          :Class 'formula'  language Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ total_ddd_yr_ASPIRIN.cut + AGE_group + total_ddd_yr_NSAID.dy| __truncated__
    # #   .. ..- attr(*, ".Environment")=<environment: 0x0000000038c96d30> 
    # #  $ xlevels          :List of 9
    # #  $ contrasts        :List of 9
    # #  $ call             : language coxph(formula = Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ ., data = df, method = "breslow")
    # #  - attr(*, "class")= chr "coxph"
    
    
    
    # object.coxph$xlevels %>% str(max.level = 1)
    # # > object.coxph$xlevels %>% str(max.level = 1) ----
    # # List of 9
    # #  $ total_ddd_yr_ASPIRIN.cut: chr [1:7] "[0,0.001)" "[0.001,30)" "[30,365)" "[365,730)" ...
    # #  $ AGE_group               : chr [1:4] "40-" "50-" "60-" "70-"
    # #  $ SEX                     : chr [1:2] "Male" "Female"
    # #  $ Socioeconomic           : chr [1:4] "SEcoQ1" "SEcoQ2" "SEcoQ3" "SEcoQ4"
    # #  $ Disability              : chr [1:3] "None" "Level 1-2" "Level 3-6"
    # #  $ CigaretteSmoking_yr     : chr [1:3] "Non-Smoker" "PastSmoker" "CurrentSmoker"
    # #  $ DrinkHabit_yr           : chr [1:3] "No consumption or <3times/month" "1-2times/week" ">=3times/week"
    # #  $ ExcerciseFreq_yr        : chr [1:3] "No Exercise" "1-2" ">3"
    # #  $ BMI_Q_yr                : chr [1:5] "0-" "18.5-" "23-" "25-" ...
    
    
    #@ tbl_varname_level_coefficients ====
    tbl_varname_level_coefficients = 
        object.coxph$xlevels %>% enframe(name = "varname", value = "level") %>% unnest %>% mutate(varnamelevel = paste0(varname, level)) %>% full_join(
            object.coxph$coefficients %>% as.tibble %>% rownames_to_column("varnamelevel") %>% rename(coefficients = value), by = "varnamelevel"
        ) #----
    
    tbl_varname_level_coefficients$coefficients[is.na(tbl_varname_level_coefficients$coefficients) & !is.na(tbl_varname_level_coefficients$level)] = 0
    tbl_varname_level_coefficients$varname[is.na(tbl_varname_level_coefficients$varname)] = 
        tbl_varname_level_coefficients$varnamelevel[is.na(tbl_varname_level_coefficients$varname)]
    
    
    # tbl_varname_level_coefficients %>% print(n=99)
    # # > tbl_varname_level_coefficients %>% print(n=99)
    # # # A tibble: 38 x 4
    # #    varname                  level                           varnamelevel                                 coefficients
    # #    <chr>                    <chr>                           <chr>                                               <dbl>
    # #  1 total_ddd_yr_ASPIRIN.cut [0,0.001)                       total_ddd_yr_ASPIRIN.cut[0,0.001)                0       
    # #  2 total_ddd_yr_ASPIRIN.cut [0.001,30)                      total_ddd_yr_ASPIRIN.cut[0.001,30)              -0.174   
    # #  3 total_ddd_yr_ASPIRIN.cut [30,365)                        total_ddd_yr_ASPIRIN.cut[30,365)                -0.0835  
    # #  4 total_ddd_yr_ASPIRIN.cut [365,730)                       total_ddd_yr_ASPIRIN.cut[365,730)                0.0249  
    # #  5 total_ddd_yr_ASPIRIN.cut [730,1.1e+03)                   total_ddd_yr_ASPIRIN.cut[730,1.1e+03)            0.186   
    # #  6 total_ddd_yr_ASPIRIN.cut [1.1e+03,1.46e+03)              total_ddd_yr_ASPIRIN.cut[1.1e+03,1.46e+03)      -0.629   
    # #  7 total_ddd_yr_ASPIRIN.cut [1.46e+03,Inf]                  total_ddd_yr_ASPIRIN.cut[1.46e+03,Inf]           0.00985 
    # #  8 AGE_group                40-                             AGE_group40-                                     0       
    # #  9 AGE_group                50-                             AGE_group50-                                     1.23    
    # # 10 AGE_group                60-                             AGE_group60-                                     2.03    
    # # 11 AGE_group                70-                             AGE_group70-                                     2.79    
    # # 12 SEX                      Male                            SEXMale                                          0       
    # # 13 SEX                      Female                          SEXFemale                                       -0.412   
    # # 14 Socioeconomic            SEcoQ1                          SocioeconomicSEcoQ1                              0       
    # # 15 Socioeconomic            SEcoQ2                          SocioeconomicSEcoQ2                              0.109   
    # # 16 Socioeconomic            SEcoQ3                          SocioeconomicSEcoQ3                             -0.0729  
    # # 17 Socioeconomic            SEcoQ4                          SocioeconomicSEcoQ4                              0.208   
    # # 18 Disability               None                            DisabilityNone                                   0       
    # # 19 Disability               Level 1-2                       DisabilityLevel 1-2                             -0.716   
    # # 20 Disability               Level 3-6                       DisabilityLevel 3-6                              0.580   
    # # 21 CigaretteSmoking_yr      Non-Smoker                      CigaretteSmoking_yrNon-Smoker                    0       
    # # 22 CigaretteSmoking_yr      PastSmoker                      CigaretteSmoking_yrPastSmoker                    0.0234  
    # # 23 CigaretteSmoking_yr      CurrentSmoker                   CigaretteSmoking_yrCurrentSmoker                 0.104   
    # # 24 DrinkHabit_yr            No consumption or <3times/month DrinkHabit_yrNo consumption or <3times/month     0       
    # # 25 DrinkHabit_yr            1-2times/week                   DrinkHabit_yr1-2times/week                       0.157   
    # # 26 DrinkHabit_yr            >=3times/week                   DrinkHabit_yr>=3times/week                       0.200   
    # # 27 ExcerciseFreq_yr         No Exercise                     ExcerciseFreq_yrNo Exercise                      0       
    # # 28 ExcerciseFreq_yr         1-2                             ExcerciseFreq_yr1-2                             -0.155   
    # # 29 ExcerciseFreq_yr         >3                              ExcerciseFreq_yr>3                              -0.110   
    # # 30 BMI_Q_yr                 0-                              BMI_Q_yr0-                                       0       
    # # 31 BMI_Q_yr                 18.5-                           BMI_Q_yr18.5-                                   -0.198   
    # # 32 BMI_Q_yr                 23-                             BMI_Q_yr23-                                     -0.281   
    # # 33 BMI_Q_yr                 25-                             BMI_Q_yr25-                                     -0.232   
    # # 34 BMI_Q_yr                 30-                             BMI_Q_yr30-                                      0.149   
    # # 35 total_ddd_yr_NSAID.dyd   NA                              total_ddd_yr_NSAID.dyd                           0.0365  
    # # 36 CCI_yr                   NA                              CCI_yr                                           0.0768  
    # # 37 total_ddd_yr_METFORMIN   NA                              total_ddd_yr_METFORMIN                           0.000347
    # # 38 total_ddd_yr_STATIN      NA                              total_ddd_yr_STATIN                             -0.000899
    
    
    
    #@ function.extractHR.focus.incl.reference() ----
    library(survival)
    library(tidyverse)
    # digits = 2
    
    
    # summary(object.coxph) %>% str(max.level = 1)
    # # > summary(object.coxph) %>% str(max.level = 1) ----
    # # List of 14
    # #  $ call        : language coxph(formula = Surv(time = fuduration_yr, event = evnttrth_C24_r) ~ ., data = df, method = "breslow")
    # #  $ fail        : NULL
    # #  $ na.action   : 'omit' Named int [1:7884] 5 53 125 160 162 174 326 380 402 465 ...
    # #   ..- attr(*, "names")= chr [1:7884] "5" "53" "125" "160" ...
    # #  $ n           : int 453605
    # #  $ loglik      : num [1:2] -7517 -7235
    # #  $ nevent      : num 581
    # #  $ coefficients: num [1:29, 1:5] -0.1745 -0.0835 0.0249 0.186 -0.6292 ...
    # #   ..- attr(*, "dimnames")=List of 2
    # #  $ conf.int    : num [1:29, 1:4] 0.84 0.92 1.025 1.204 0.533 ...
    # #   ..- attr(*, "dimnames")=List of 2
    # #  $ logtest     : Named num [1:3] 5.63e+02 2.90e+01 2.51e-100
    # #   ..- attr(*, "names")= chr [1:3] "test" "df" "pvalue"
    # #  $ sctest      : Named num [1:3] 7.19e+02 2.90e+01 1.09e-132
    # #   ..- attr(*, "names")= chr [1:3] "test" "df" "pvalue"
    # #  $ rsq         : Named num [1:2] 0.00124 0.0326
    # #   ..- attr(*, "names")= chr [1:2] "rsq" "maxrsq"
    # #  $ waldtest    : Named num [1:3] 5.21e+02 2.90e+01 1.53e-91
    # #   ..- attr(*, "names")= chr [1:3] "test" "df" "pvalue"
    # #  $ used.robust : logi FALSE
    # #  $ concordance : Named num [1:2] 0.769 0.012
    # #   ..- attr(*, "names")= chr [1:2] "C" "se(C)"
    # #  - attr(*, "class")= chr "summary.coxph"
    
    out = summary(object.coxph)
    res = data.frame(round(out$conf.int[, -2], digits))
    res = cbind(res, round(out$coef[, 5], max(2, digits)))
    colnames(res) = c("exp(coef)", "lower .95", "upper .95", "Pr(>|z|)")
    
    for (i in 1:4){
        res[[i]] <- as.character(format(res[[i]], digits = digits))
    }
    res$HR <- paste0( res[[1]]
                      , "(", res[[2]]
                      , "-", res[[3]]
                      , "),p=", res[[4]]
    )
    if(any(res[[4]] < 0.001)){
        i = which(res[[4]] < 0.001)
        res[i, ]$HR <- paste0( res[i,1]
                               , "(", res[i,2]
                               , "-", res[i,3]
                               , "),p<", 0.1 ^ max(2, digits))
    }
    res
    #  > res
    #                                            exp(coef) lower .95 upper .95 Pr(>|z|)                            HR
    # total_ddd_yr_ASPIRIN.cut[0.001,30)             0.840     0.571     1.235    0.375  0.840( 0.571- 1.235),p=0.375
    # total_ddd_yr_ASPIRIN.cut[30,365)               0.920     0.686     1.233    0.577  0.920( 0.686- 1.233),p=0.577
    # total_ddd_yr_ASPIRIN.cut[365,730)              1.025     0.692     1.519    0.901  1.025( 0.692- 1.519),p=0.901
    # total_ddd_yr_ASPIRIN.cut[730,1.1e+03)          1.204     0.782     1.855    0.399  1.204( 0.782- 1.855),p=0.399
    # total_ddd_yr_ASPIRIN.cut[1.1e+03,1.46e+03)     0.533     0.250     1.135    0.103  0.533( 0.250- 1.135),p=0.103
    # total_ddd_yr_ASPIRIN.cut[1.46e+03,Inf]         1.010     0.529     1.927    0.976  1.010( 0.529- 1.927),p=0.976
    # AGE_group50-                                   3.414     2.611     4.465    0.000  3.414( 2.611- 4.465),p<0.001
    # AGE_group60-                                   7.631     5.854     9.947    0.000  7.631( 5.854- 9.947),p<0.001
    # AGE_group70-                                  16.317    12.073    22.053    0.000 16.317(12.073-22.053),p<0.001
    # total_ddd_yr_NSAID.dyd                         1.037     0.972     1.107    0.273  1.037( 0.972- 1.107),p=0.273
    # SEXFemale                                      0.662     0.541     0.811    0.000  0.662( 0.541- 0.811),p<0.001
    # SocioeconomicSEcoQ2                            1.115     0.901     1.381    0.316  1.115( 0.901- 1.381),p=0.316
    # SocioeconomicSEcoQ3                            0.930     0.740     1.169    0.532  0.930( 0.740- 1.169),p=0.532
    # SocioeconomicSEcoQ4                            1.232     0.971     1.562    0.085  1.232( 0.971- 1.562),p=0.085
    # DisabilityLevel 1-2                            0.489     0.069     3.480    0.474  0.489( 0.069- 3.480),p=0.474
    # DisabilityLevel 3-6                            1.785     0.843     3.779    0.130  1.785( 0.843- 3.779),p=0.130
    # CigaretteSmoking_yrPastSmoker                  1.024     0.752     1.393    0.881  1.024( 0.752- 1.393),p=0.881
    # CigaretteSmoking_yrCurrentSmoker               1.109     0.881     1.396    0.378  1.109( 0.881- 1.396),p=0.378
    # DrinkHabit_yr1-2times/week                     1.170     0.908     1.506    0.225  1.170( 0.908- 1.506),p=0.225
    # DrinkHabit_yr>=3times/week                     1.222     0.941     1.587    0.133  1.222( 0.941- 1.587),p=0.133
    # ExcerciseFreq_yr1-2                            0.856     0.685     1.070    0.172  0.856( 0.685- 1.070),p=0.172
    # ExcerciseFreq_yr>3                             0.896     0.724     1.108    0.311  0.896( 0.724- 1.108),p=0.311
    # BMI_Q_yr18.5-                                  0.821     0.523     1.289    0.391  0.821( 0.523- 1.289),p=0.391
    # BMI_Q_yr23-                                    0.755     0.475     1.200    0.234  0.755( 0.475- 1.200),p=0.234
    # BMI_Q_yr25-                                    0.793     0.501     1.255    0.322  0.793( 0.501- 1.255),p=0.322
    # BMI_Q_yr30-                                    1.161     0.637     2.116    0.626  1.161( 0.637- 2.116),p=0.626
    # CCI_yr                                         1.080     1.023     1.139    0.005  1.080( 1.023- 1.139),p=0.005
    # total_ddd_yr_METFORMIN                         1.000     1.000     1.001    0.012  1.000( 1.000- 1.001),p=0.012
    # total_ddd_yr_STATIN                            0.999     0.998     1.000    0.069  0.999( 0.998- 1.000),p=0.069
    
    
    tbl_varname_level_coefficients_res = tbl_varname_level_coefficients %>% full_join(
        res %>% rownames_to_column("varnamelevel"), by = "varnamelevel"
    )
    tbl_varname_level_coefficients_res    
    tbl_varname_level_coefficients_res$`exp(coef)`[is.na(tbl_varname_level_coefficients_res$`exp(coef)`) & !is.na(tbl_varname_level_coefficients_res$level)] = 1
    tbl_varname_level_coefficients_res$HR[is.na(tbl_varname_level_coefficients_res$HR) & !is.na(tbl_varname_level_coefficients_res$level)] = "(reference)"
    # tbl_varname_level_coefficients_res %>% print(n=99)
    # # > tbl_varname_level_coefficients_res %>% print(n=99)
    # # # A tibble: 38 x 9
    # #    varname                level                       varnamelevel                            coefficients `exp(coef)` `lower .95` `upper .95` `Pr(>|z|)` HR                        
    # #    <chr>                  <chr>                       <chr>                                          <dbl> <chr>       <chr>       <chr>       <chr>      <chr>                     
    # #  1 total_ddd_yr_ASPIRIN.~ [0,0.001)                   total_ddd_yr_ASPIRIN.cut[0,0.001)           0        1           NA          NA          NA         (reference)               
    # #  2 total_ddd_yr_ASPIRIN.~ [0.001,30)                  total_ddd_yr_ASPIRIN.cut[0.001,30)         -0.174    " 0.840"    " 0.571"    " 1.235"    0.375      " 0.840( 0.571- 1.235),p=~
    # #  3 total_ddd_yr_ASPIRIN.~ [30,365)                    total_ddd_yr_ASPIRIN.cut[30,365)           -0.0835   " 0.920"    " 0.686"    " 1.233"    0.577      " 0.920( 0.686- 1.233),p=~
    # #  4 total_ddd_yr_ASPIRIN.~ [365,730)                   total_ddd_yr_ASPIRIN.cut[365,730)           0.0249   " 1.025"    " 0.692"    " 1.519"    0.901      " 1.025( 0.692- 1.519),p=~
    # #  5 total_ddd_yr_ASPIRIN.~ [730,1.1e+03)               total_ddd_yr_ASPIRIN.cut[730,1.1e+03)       0.186    " 1.204"    " 0.782"    " 1.855"    0.399      " 1.204( 0.782- 1.855),p=~
    # #  6 total_ddd_yr_ASPIRIN.~ [1.1e+03,1.46e+03)          total_ddd_yr_ASPIRIN.cut[1.1e+03,1.46e~    -0.629    " 0.533"    " 0.250"    " 1.135"    0.103      " 0.533( 0.250- 1.135),p=~
    # #  7 total_ddd_yr_ASPIRIN.~ [1.46e+03,Inf]              total_ddd_yr_ASPIRIN.cut[1.46e+03,Inf]      0.00985  " 1.010"    " 0.529"    " 1.927"    0.976      " 1.010( 0.529- 1.927),p=~
    # #  8 AGE_group              40-                         AGE_group40-                                0        1           NA          NA          NA         (reference)               
    # #  9 AGE_group              50-                         AGE_group50-                                1.23     " 3.414"    " 2.611"    " 4.465"    0.000      " 3.414( 2.611- 4.465),p<~
    # # 10 AGE_group              60-                         AGE_group60-                                2.03     " 7.631"    " 5.854"    " 9.947"    0.000      " 7.631( 5.854- 9.947),p<~
    # # 11 AGE_group              70-                         AGE_group70-                                2.79     16.317      12.073      22.053      0.000      16.317(12.073-22.053),p<0~
    # # 12 SEX                    Male                        SEXMale                                     0        1           NA          NA          NA         (reference)               
    # # 13 SEX                    Female                      SEXFemale                                  -0.412    " 0.662"    " 0.541"    " 0.811"    0.000      " 0.662( 0.541- 0.811),p<~
    # # 14 Socioeconomic          SEcoQ1                      SocioeconomicSEcoQ1                         0        1           NA          NA          NA         (reference)               
    # # 15 Socioeconomic          SEcoQ2                      SocioeconomicSEcoQ2                         0.109    " 1.115"    " 0.901"    " 1.381"    0.316      " 1.115( 0.901- 1.381),p=~
    # # 16 Socioeconomic          SEcoQ3                      SocioeconomicSEcoQ3                        -0.0729   " 0.930"    " 0.740"    " 1.169"    0.532      " 0.930( 0.740- 1.169),p=~
    # # 17 Socioeconomic          SEcoQ4                      SocioeconomicSEcoQ4                         0.208    " 1.232"    " 0.971"    " 1.562"    0.085      " 1.232( 0.971- 1.562),p=~
    # # 18 Disability             None                        DisabilityNone                              0        1           NA          NA          NA         (reference)               
    # # 19 Disability             Level 1-2                   DisabilityLevel 1-2                        -0.716    " 0.489"    " 0.069"    " 3.480"    0.474      " 0.489( 0.069- 3.480),p=~
    # # 20 Disability             Level 3-6                   DisabilityLevel 3-6                         0.580    " 1.785"    " 0.843"    " 3.779"    0.130      " 1.785( 0.843- 3.779),p=~
    # # 21 CigaretteSmoking_yr    Non-Smoker                  CigaretteSmoking_yrNon-Smoker               0        1           NA          NA          NA         (reference)               
    # # 22 CigaretteSmoking_yr    PastSmoker                  CigaretteSmoking_yrPastSmoker               0.0234   " 1.024"    " 0.752"    " 1.393"    0.881      " 1.024( 0.752- 1.393),p=~
    # # 23 CigaretteSmoking_yr    CurrentSmoker               CigaretteSmoking_yrCurrentSmoker            0.104    " 1.109"    " 0.881"    " 1.396"    0.378      " 1.109( 0.881- 1.396),p=~
    # # 24 DrinkHabit_yr          No consumption or <3times/~ DrinkHabit_yrNo consumption or <3times~     0        1           NA          NA          NA         (reference)               
    # # 25 DrinkHabit_yr          1-2times/week               DrinkHabit_yr1-2times/week                  0.157    " 1.170"    " 0.908"    " 1.506"    0.225      " 1.170( 0.908- 1.506),p=~
    # # 26 DrinkHabit_yr          >=3times/week               DrinkHabit_yr>=3times/week                  0.200    " 1.222"    " 0.941"    " 1.587"    0.133      " 1.222( 0.941- 1.587),p=~
    # # 27 ExcerciseFreq_yr       No Exercise                 ExcerciseFreq_yrNo Exercise                 0        1           NA          NA          NA         (reference)               
    # # 28 ExcerciseFreq_yr       1-2                         ExcerciseFreq_yr1-2                        -0.155    " 0.856"    " 0.685"    " 1.070"    0.172      " 0.856( 0.685- 1.070),p=~
    # # 29 ExcerciseFreq_yr       >3                          ExcerciseFreq_yr>3                         -0.110    " 0.896"    " 0.724"    " 1.108"    0.311      " 0.896( 0.724- 1.108),p=~
    # # 30 BMI_Q_yr               0-                          BMI_Q_yr0-                                  0        1           NA          NA          NA         (reference)               
    # # 31 BMI_Q_yr               18.5-                       BMI_Q_yr18.5-                              -0.198    " 0.821"    " 0.523"    " 1.289"    0.391      " 0.821( 0.523- 1.289),p=~
    # # 32 BMI_Q_yr               23-                         BMI_Q_yr23-                                -0.281    " 0.755"    " 0.475"    " 1.200"    0.234      " 0.755( 0.475- 1.200),p=~
    # # 33 BMI_Q_yr               25-                         BMI_Q_yr25-                                -0.232    " 0.793"    " 0.501"    " 1.255"    0.322      " 0.793( 0.501- 1.255),p=~
    # # 34 BMI_Q_yr               30-                         BMI_Q_yr30-                                 0.149    " 1.161"    " 0.637"    " 2.116"    0.626      " 1.161( 0.637- 2.116),p=~
    # # 35 total_ddd_yr_NSAID.dyd NA                          total_ddd_yr_NSAID.dyd                      0.0365   " 1.037"    " 0.972"    " 1.107"    0.273      " 1.037( 0.972- 1.107),p=~
    # # 36 CCI_yr                 NA                          CCI_yr                                      0.0768   " 1.080"    " 1.023"    " 1.139"    0.005      " 1.080( 1.023- 1.139),p=~
    # # 37 total_ddd_yr_METFORMIN NA                          total_ddd_yr_METFORMIN                      0.000347 " 1.000"    " 1.000"    " 1.001"    0.012      " 1.000( 1.000- 1.001),p=~
    # # 38 total_ddd_yr_STATIN    NA                          total_ddd_yr_STATIN                        -0.000899 " 0.999"    " 0.998"    " 1.000"    0.069      " 0.999( 0.998- 1.000),p=~    

    tbl_varname_level_coefficients_res
    
}




#@ tbl_varname_level_HR.FullModel_5yr ====
tbl_varname_level_HR.FullModel_5yr = function.tbl_varname_level_coefHR(
  object.coxph = analyticDF_C24.drop_pmhx_negativetime.list.cut.coxph_list[[name4FullModel]]$`_5yr`)
tbl_varname_level_HR.FullModel_5yr
# > tbl_varname_level_HR.FullModel_5yr
# # A tibble: 38 x 9
#    varname                  level              varnamelevel                               coefficients `exp(coef)` `lower .95` `upper .95` `Pr(>|z|)` HR                             
#    <chr>                    <chr>              <chr>                                             <dbl> <chr>       <chr>       <chr>       <chr>      <chr>                          
#  1 total_ddd_yr_ASPIRIN.cut [0,0.001)          total_ddd_yr_ASPIRIN.cut[0,0.001)               0       1           NA          NA          NA         (reference)                    
#  2 total_ddd_yr_ASPIRIN.cut [0.001,30)         total_ddd_yr_ASPIRIN.cut[0.001,30)             -0.174   " 0.840"    " 0.571"    " 1.235"    0.375      " 0.840( 0.571- 1.235),p=0.375"
#  3 total_ddd_yr_ASPIRIN.cut [30,365)           total_ddd_yr_ASPIRIN.cut[30,365)               -0.0835  " 0.920"    " 0.686"    " 1.233"    0.577      " 0.920( 0.686- 1.233),p=0.577"
#  4 total_ddd_yr_ASPIRIN.cut [365,730)          total_ddd_yr_ASPIRIN.cut[365,730)               0.0249  " 1.025"    " 0.692"    " 1.519"    0.901      " 1.025( 0.692- 1.519),p=0.901"
#  5 total_ddd_yr_ASPIRIN.cut [730,1.1e+03)      total_ddd_yr_ASPIRIN.cut[730,1.1e+03)           0.186   " 1.204"    " 0.782"    " 1.855"    0.399      " 1.204( 0.782- 1.855),p=0.399"
#  6 total_ddd_yr_ASPIRIN.cut [1.1e+03,1.46e+03) total_ddd_yr_ASPIRIN.cut[1.1e+03,1.46e+03)     -0.629   " 0.533"    " 0.250"    " 1.135"    0.103      " 0.533( 0.250- 1.135),p=0.103"
#  7 total_ddd_yr_ASPIRIN.cut [1.46e+03,Inf]     total_ddd_yr_ASPIRIN.cut[1.46e+03,Inf]          0.00985 " 1.010"    " 0.529"    " 1.927"    0.976      " 1.010( 0.529- 1.927),p=0.976"
#  8 AGE_group                40-                AGE_group40-                                    0       1           NA          NA          NA         (reference)                    
#  9 AGE_group                50-                AGE_group50-                                    1.23    " 3.414"    " 2.611"    " 4.465"    0.000      " 3.414( 2.611- 4.465),p<0.001"
# 10 AGE_group                60-                AGE_group60-                                    2.03    " 7.631"    " 5.854"    " 9.947"    0.000      " 7.631( 5.854- 9.947),p<0.001"
# # ... with 28 more rows

