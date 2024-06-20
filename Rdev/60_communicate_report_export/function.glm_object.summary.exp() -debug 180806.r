# function.glm_object.summary.exp() -debug 180806.r

#@ data.svydesign.svyglm_binomial_Depressed =====








function.glm_object.summary.exp = function(glm_object, sprintf_fmt_decimal = 2, coef.exp = T, p.adjust_method = c("fdr", "bonferroni")) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.lm_object.summary.coefCI.dev.r")
    if(!"glm" %in% class(glm_object)) {
        stop("!\"glm\" %in% class(glm_object)")
    }
    library(tidyverse)
    glm_object.confint.df = as.data.frame(confint(glm_object))
    glm_object.summary.coef.df = as.data.frame(coef(summary(glm_object))) %>% rownames_to_column
    if (coef.exp == T) {
        glm_object.confint.df = exp(glm_object.confint.df)
        glm_object.summary.coef.df$Estimate = exp(glm_object.summary.coef.df$Estimate)
    }
    
    # # https://stackoverflow.com/questions/3443687/formatting-decimal-places-in-r
    # tmp.df = data.frame(coefCI = paste0(
    #     format(round(glm_object.summary.coef.df$Estimate, round_digits), nsmall = round_digits)
    #     , " ("
    #     , format(round(glm_object.confint.df$`2.5 %`, round_digits), nsmall = round_digits)
    #     , " ~ "
    #     , format(round(glm_object.confint.df$`97.5 %`, round_digits), nsmall = round_digits)
    #     , ")"
    # ), stringsAsFactors = F)
    # # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
    # tmp.df = data.frame(coefCI = paste0(
    #     format(glm_object.summary.coef.df$Estimate, digits = format_digits, nsmall = format_digits)
    #     , " ("
    #     , format(glm_object.confint.df$`2.5 %`, digits = format_digits, nsmall = format_digits)
    #     , " ~ "
    #     , format(glm_object.confint.df$`97.5 %`, digits = format_digits, nsmall = format_digits)
    #     , ")"
    # ), stringsAsFactors = F)
    # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
    # digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(c(glm_object.summary.coef.dfEstimate,glmobject.confint.df`2.5 %`, glm_object.confint.df$`97.5 %`), na.rm = T) %>% log10 %>% trunc) + 1
    tmp.vec = c(glm_object.summary.coef.df$Estimate, glm_object.confint.df$`2.5 %`, glm_object.confint.df$`97.5 %`)
    tmp.vec[is.infinite(tmp.vec)] = NA
    digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(tmp.vec, na.rm = T) %>% log10 %>% trunc) + 1
    if (any(c(glm_object.summary.coef.df$Estimate, glm_object.confint.df$`2.5 %`, glm_object.confint.df$`97.5 %`) < 0, na.rm = T) ) {
        digits_total_incl_decimal = digits_total_incl_decimal + 1
    }

    tmp.df = data.frame(coefCI = paste0(
        sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), glm_object.summary.coef.df$Estimate)
        , " ("
        , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), glm_object.confint.df$`2.5 %`)
        , " ~ "
        , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), glm_object.confint.df$`97.5 %`)
        , ")"
    ), stringsAsFactors = F)
    # tmp.dfpvalue=glmobject.summary.coef.df`Pr(>|z|)` %>% round(3) %>% as.character
    tmp.df$p_value = sprintf("%.3f", glm_object.summary.coef.df$`Pr(>|z|)`)
    tmp.df$p_value[glm_object.summary.coef.df$`Pr(>|z|)` <= 0.001] = "<0.001"

    tmp.df$star = "   "
    tmp.df$star[glm_object.summary.coef.df$`Pr(>|z|)` <= 0.05] = "*  "
    tmp.df$star[glm_object.summary.coef.df$`Pr(>|z|)` <= 0.01] = "** "
    tmp.df$star[glm_object.summary.coef.df$`Pr(>|z|)` <= 0.001] = "***"
    
    for (i in 1:length(p.adjust_method)) {
        tmp.df[[paste0("p.adjust.", i)]] = glm_object.summary.coef.df$`Pr(>|z|)` %>% p.adjust(method = p.adjust_method[i])
        p.adjust_method.i = substr(p.adjust_method[i], 1, 3)
        tmp.df[[paste0("p.", p.adjust_method.i)]] = sprintf("%.3f", tmp.df[[paste0("p.adjust.", i)]])
        tmp.df[[paste0("p.", p.adjust_method.i)]] [tmp.df[[paste0("p.adjust.", i)]] <= 0.001] = "<0.001"
        
        tmp.df[[paste0("*", p.adjust_method.i)]] = "   "
        tmp.df[[paste0("*", p.adjust_method.i)]] [tmp.df[[paste0("p.adjust.", i)]] <= 0.05] = "*  "
        tmp.df[[paste0("*", p.adjust_method.i)]] [tmp.df[[paste0("p.adjust.", i)]] <= 0.01] = "** "
        tmp.df[[paste0("*", p.adjust_method.i)]] [tmp.df[[paste0("p.adjust.", i)]] <= 0.001] = "***"
        tmp.df[[paste0("p.adjust.", i)]] = NULL
    }

    out = cbind(
        glm_object.summary.coef.df$rowname
        , tmp.df
        , glm_object.summary.coef.df[ , 1:2]
        , glm_object.confint.df
        , glm_object.summary.coef.df[ , -1:(-2)]
        , stringsAsFactors = F
    )
    out$rowname = NULL
    names(out) [1] = "rowname"
    if (coef.exp == T) {
        names(out) [2] = "ORCI"
        names(out) [names(out) == "Estimate"] = "exp(Estimate)"
        names(out) [names(out) == "2.5 %"] = "exp(2.5 %)"
        names(out) [names(out) == "97.5 %"] = "exp(97.5 %)"
    }
    # out = out |> as_tibble()
    row.names(out) = NULL
    out
}






data.svydesign.svyglm_binomial_Depressed = svyglm(Depressed ~ SSQ_5_6_adequate * US_BORN + GENDER + AGEGRP5C + RACE + INC25KMOD + MARITAL + HUQ_14, design = data.svydesign, family=stats::binomial())



data.svydesign.svyglm_binomial_Depressed |> str(max.level = 1)
# > data.svydesign.svyglm_binomial_Depressed |> str(max.level = 1)
# List of 34
#  $ coefficients     : Named num [1:20] -0.33 -1.399 -0.71 0.7 -0.238 ...
#   ..- attr(*, "names")= chr [1:20] "(Intercept)" "SSQ_5_6_adequateTRUE" "US_BORN2: Other" "GENDER2: Female" ...
#  $ residuals        : Named num [1:1358] 3.7 -1.03 -1.06 -1.05 -1.14 ...
#   ..- attr(*, "names")= chr [1:1358] "1" "2" "3" "4" ...
#  $ fitted.values    : Named num [1:1358] 0.2702 0.0337 0.0593 0.0519 0.1237 ...
#   ..- attr(*, "names")= chr [1:1358] "1" "2" "3" "4" ...
#  $ effects          : Named num [1:1358] 19.6616 5.3986 -1.5873 3.2539 -0.0329 ...
#   ..- attr(*, "names")= chr [1:1358] "(Intercept)" "SSQ_5_6_adequateTRUE" "US_BORN2: Other" "GENDER2: Female" ...
#  $ R                : num [1:20, 1:20] -9.5 0 0 0 0 ...
#   ..- attr(*, "dimnames")=List of 2
#  $ rank             : int 20
#  $ qr               :List of 5
#   ..- attr(*, "class")= chr "qr"
#  $ family           :List of 12
#   ..- attr(*, "class")= chr "family"
#  $ linear.predictors: Named num [1:1358] -0.993 -3.356 -2.764 -2.905 -1.958 ...
#   ..- attr(*, "names")= chr [1:1358] "1" "2" "3" "4" ...
#  $ deviance         : num 656
#  $ aic              : num 730
#  $ null.deviance    : num 753
#  $ iter             : int 6
#  $ weights          : Named num [1:1358] 0.2555 0.1006 0.0275 0.0511 0.1044 ...
#   ..- attr(*, "names")= chr [1:1358] "1" "2" "3" "4" ...
#  $ prior.weights    : Named num [1:1358] 1.296 3.088 0.493 1.039 0.963 ...
#   ..- attr(*, "names")= chr [1:1358] "1" "2" "3" "4" ...
#  $ df.residual      : num 120
#  $ df.null          : int 1357
#  $ y                : Named num [1:1358] 1 0 0 0 0 0 0 0 0 1 ...
#   ..- attr(*, "names")= chr [1:1358] "1" "2" "3" "4" ...
#  $ converged        : logi TRUE
#  $ boundary         : logi FALSE
#  $ model            :'data.frame':	1358 obs. of  10 variables:
#   ..- attr(*, "terms")=Classes 'terms', 'formula'  language Depressed ~ SSQ_5_6_adequate * US_BORN + GENDER + AGEGRP5C + RACE + INC25KMOD + MARITAL + HUQ_14
#   .. .. ..- attr(*, "variables")= language list(Depressed, SSQ_5_6_adequate, US_BORN, GENDER, AGEGRP5C, RACE, INC25KMOD, MARITAL, HUQ_14)
#   .. .. ..- attr(*, "factors")= int [1:9, 1:9] 0 1 0 0 0 0 0 0 0 0 ...
#   .. .. .. ..- attr(*, "dimnames")=List of 2
#   .. .. ..- attr(*, "term.labels")= chr [1:9] "SSQ_5_6_adequate" "US_BORN" "GENDER" "AGEGRP5C" ...
#   .. .. ..- attr(*, "order")= int [1:9] 1 1 1 1 1 1 1 1 2
#   .. .. ..- attr(*, "intercept")= int 1
#   .. .. ..- attr(*, "response")= int 1
#   .. .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
#   .. .. ..- attr(*, "predvars")= language list(Depressed, SSQ_5_6_adequate, US_BORN, GENDER, AGEGRP5C, RACE, INC25KMOD, MARITAL, HUQ_14)
#   .. .. ..- attr(*, "dataClasses")= Named chr [1:10] "logical" "logical" "factor" "factor" ...
#   .. .. .. ..- attr(*, "names")= chr [1:10] "Depressed" "SSQ_5_6_adequate" "US_BORN" "GENDER" ...
#   ..- attr(*, "na.action")= 'omit' Named int [1:169] 6 7 8 36 85 89 140 149 155 156 ...
#   .. ..- attr(*, "names")= chr [1:169] "6" "7" "8" "36" ...
#  $ na.action        : 'omit' Named int [1:169] 6 7 8 36 85 89 140 149 155 156 ...
#   ..- attr(*, "names")= chr [1:169] "6" "7" "8" "36" ...
#  $ call             : language svyglm(formula = Depressed ~ SSQ_5_6_adequate * US_BORN + GENDER + AGEGRP5C + RACE + INC25KMOD + MARITAL + HUQ_14| __truncated__
#  $ formula          :Class 'formula'  language Depressed ~ SSQ_5_6_adequate * US_BORN + GENDER + AGEGRP5C + RACE + INC25KMOD + MARITAL + HUQ_14
#   .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
#  $ terms            :Classes 'terms', 'formula'  language Depressed ~ SSQ_5_6_adequate * US_BORN + GENDER + AGEGRP5C + RACE + INC25KMOD + MARITAL + HUQ_14
#   .. ..- attr(*, "variables")= language list(Depressed, SSQ_5_6_adequate, US_BORN, GENDER, AGEGRP5C, RACE, INC25KMOD, MARITAL, HUQ_14)
#   .. ..- attr(*, "factors")= int [1:9, 1:9] 0 1 0 0 0 0 0 0 0 0 ...
#   .. .. ..- attr(*, "dimnames")=List of 2
#   .. ..- attr(*, "term.labels")= chr [1:9] "SSQ_5_6_adequate" "US_BORN" "GENDER" "AGEGRP5C" ...
#   .. ..- attr(*, "order")= int [1:9] 1 1 1 1 1 1 1 1 2
#   .. ..- attr(*, "intercept")= int 1
#   .. ..- attr(*, "response")= int 1
#   .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
#   .. ..- attr(*, "predvars")= language list(Depressed, SSQ_5_6_adequate, US_BORN, GENDER, AGEGRP5C, RACE, INC25KMOD, MARITAL, HUQ_14)
#   .. ..- attr(*, "dataClasses")= Named chr [1:10] "logical" "logical" "factor" "factor" ...
#   .. .. ..- attr(*, "names")= chr [1:10] "Depressed" "SSQ_5_6_adequate" "US_BORN" "GENDER" ...
#  $ data             :'data.frame':	1527 obs. of  48 variables:
#  $ offset           : NULL
#  $ control          :List of 3
#  $ method           : chr "glm.fit"
#  $ contrasts        :List of 8
#  $ xlevels          :List of 7
#  $ naive.cov        : num [1:20, 1:20] 0.1791 -0.0381 -0.0178 -0.0322 -0.0393 ...
#   ..- attr(*, "dimnames")=List of 2
#  $ cov.unscaled     : num [1:20, 1:20] 0.19534 -0.0285 -0.00671 -0.03414 -0.0149 ...
#   ..- attr(*, "dimnames")=List of 2
#  $ survey.design    :List of 9
#   ..- attr(*, "class")= chr [1:2] "survey.design2" "survey.design"
#  - attr(*, "class")= chr [1:3] "svyglm" "glm" "lm"





data.svydesign.svyglm_binomial_Depressed |> summary() %>% coef
data.svydesign.svyglm_binomial_Depressed %>% confint
# > data.svydesign.svyglm_binomial_Depressed |> summary() %>% coef
#                                             Estimate Std. Error    t value     Pr(>|t|)
# (Intercept)                              -0.33034196  0.4419749 -0.7474224 4.562707e-01
# SSQ_5_6_adequateTRUE                     -1.39922615  0.2742975 -5.1011265 1.278615e-06
# US_BORN2: Other                          -0.70981406  0.3284155 -2.1613290 3.265608e-02
# GENDER2: Female                           0.69981787  0.2253171  3.1059238 2.367481e-03
# AGEGRP5C2: 30-39                         -0.23846991  0.3608203 -0.6609105 5.099366e-01
# AGEGRP5C3: 40-49                         -0.46223656  0.4283975 -1.0789900 2.827562e-01
# AGEGRP5C4: 50-59                         -0.16387545  0.3741740 -0.4379659 6.621984e-01
# AGEGRP5C5: 60 and over                   -0.66055916  0.3847635 -1.7167925 8.859713e-02
# RACE2: Non-Hispanic Black                -0.19197658  0.3361039 -0.5711823 5.689443e-01
# RACE3: Hispanic                           0.15891353  0.2942345  0.5400914 5.901349e-01
# RACE4: Asian                             -0.62955622  0.4067300 -1.5478479 1.242922e-01
# RACE5: Other                             -0.05135943  0.4438931 -0.1157022 9.080819e-01
# INC25KMOD2: $20,000 - $49,999            -0.47172230  0.2526278 -1.8672620 6.430507e-02
# INC25KMOD3: $50,000 - $74,999            -0.39445115  0.3863105 -1.0210728 3.092741e-01
# INC25KMOD4: $75,000 - $99,999            -1.37351901  0.5945433 -2.3102086 2.258491e-02
# INC25KMOD5: $100,000  or more            -1.52727635  0.5720817 -2.6696823 8.644082e-03
# MARITAL2: Married or living with partner  0.27301216  0.2733611  0.9987236 3.199383e-01
# MARITAL3: Widowed, divorced, separated   -0.05430211  0.3980664 -0.1364147 8.917221e-01
# HUQ_142: No                              -0.97220180  0.2826359 -3.4397678 8.014605e-04
# SSQ_5_6_adequateTRUE:US_BORN2: Other      0.71345965  0.4394368  1.6235776 1.070901e-01
# > data.svydesign.svyglm_binomial_Depressed %>% confint
#                                               2.5 %      97.5 %
# (Intercept)                              -1.1965969  0.53591297
# SSQ_5_6_adequateTRUE                     -1.9368393 -0.86161297
# US_BORN2: Other                          -1.3534967 -0.06613141
# GENDER2: Female                           0.2582044  1.14143135
# AGEGRP5C2: 30-39                         -0.9456646  0.46872483
# AGEGRP5C3: 40-49                         -1.3018802  0.37740704
# AGEGRP5C4: 50-59                         -0.8972431  0.56949215
# AGEGRP5C5: 60 and over                   -1.4146818  0.09356351
# RACE2: Non-Hispanic Black                -0.8507280  0.46677489
# RACE3: Hispanic                          -0.4177755  0.73560257
# RACE4: Asian                             -1.4267324  0.16761998
# RACE5: Other                             -0.9213739  0.81865507
# INC25KMOD2: $20,000 - $49,999            -0.9668637  0.02341909
# INC25KMOD3: $50,000 - $74,999            -1.1516059  0.36270356
# INC25KMOD4: $75,000 - $99,999            -2.5388024 -0.20823559
# INC25KMOD5: $100,000  or more            -2.6485358 -0.40601685
# MARITAL2: Married or living with partner -0.2627657  0.80879006
# MARITAL3: Widowed, divorced, separated   -0.8344980  0.72589379
# HUQ_142: No                              -1.5261580 -0.41824565
# SSQ_5_6_adequateTRUE:US_BORN2: Other     -0.1478206  1.57473986







data.svydesign.svyglm_binomial_Depressed %>% function.glm_object.summary.exp()
# > data.svydesign.svyglm_binomial_Depressed %>% function.glm_object.summary.exp()
# Error in `$<-.data.frame`(`*tmp*`, "p_value", value = character(0)) : 
#   replacement has 0 rows, data has 20
# Called from: `$<-.data.frame`(`*tmp*`, "p_value", value = character(0))
# Browse[1]> 

debugonce(function.glm_object.summary.exp)
data.svydesign.svyglm_binomial_Depressed %>% function.glm_object.summary.exp()


# Browse[2]> n
# debug at #41: tmp.df = data.frame(coefCI = paste0(sprintf(paste0("%", 
#     digits_total_incl_decimal, ".", sprintf_fmt_decimal, 
#     "f"), glm_object.summary.coef.df$Estimate), " (", 
#     sprintf(paste0("%", digits_total_incl_decimal, ".", 
#         sprintf_fmt_decimal, "f"), glm_object.confint.df$`2.5 %`), 
#     " ~ ", sprintf(paste0("%", digits_total_incl_decimal, 
#         ".", sprintf_fmt_decimal, "f"), glm_object.confint.df$`97.5 %`), 
#     ")"), stringsAsFactors = F)
# Browse[2]> n
# debug at #50: tmp.df$p_value = sprintf("%.3f", glm_object.summary.coef.df$`Pr(>|z|)`)
# Browse[2]> n
# Error in `$<-.data.frame`(`*tmp*`, p_value, value = character(0)) : 
#   replacement has 0 rows, data has 20




glm_object
sprintf_fmt_decimal = 2
coef.exp = T
p.adjust_method = c("fdr", "bonferroni")



function.glm_object.summary.exp = function(glm_object, sprintf_fmt_decimal = 2, coef.exp = T, p.adjust_method = c("fdr", "bonferroni")) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.lm_object.summary.coefCI.dev.r")
    if(!"glm" %in% class(glm_object)) {
        stop("!\"glm\" %in% class(glm_object)")
    }
    library(tidyverse)
    glm_object.confint.df = as.data.frame(confint(glm_object))
    glm_object.summary.coef.df = as.data.frame(coef(summary(glm_object))) %>% rownames_to_column
    if (coef.exp == T) {
        glm_object.confint.df = exp(glm_object.confint.df)
        glm_object.summary.coef.df$Estimate = exp(glm_object.summary.coef.df$Estimate)
    }
    
    # # https://stackoverflow.com/questions/3443687/formatting-decimal-places-in-r
    # tmp.df = data.frame(coefCI = paste0(
    #     format(round(glm_object.summary.coef.df$Estimate, round_digits), nsmall = round_digits)
    #     , " ("
    #     , format(round(glm_object.confint.df$`2.5 %`, round_digits), nsmall = round_digits)
    #     , " ~ "
    #     , format(round(glm_object.confint.df$`97.5 %`, round_digits), nsmall = round_digits)
    #     , ")"
    # ), stringsAsFactors = F)
    # # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
    # tmp.df = data.frame(coefCI = paste0(
    #     format(glm_object.summary.coef.df$Estimate, digits = format_digits, nsmall = format_digits)
    #     , " ("
    #     , format(glm_object.confint.df$`2.5 %`, digits = format_digits, nsmall = format_digits)
    #     , " ~ "
    #     , format(glm_object.confint.df$`97.5 %`, digits = format_digits, nsmall = format_digits)
    #     , ")"
    # ), stringsAsFactors = F)
    # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
    # digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(c(glm_object.summary.coef.dfEstimate,glmobject.confint.df`2.5 %`, glm_object.confint.df$`97.5 %`), na.rm = T) %>% log10 %>% trunc) + 1
    tmp.vec = c(glm_object.summary.coef.df$Estimate, glm_object.confint.df$`2.5 %`, glm_object.confint.df$`97.5 %`)
    tmp.vec[is.infinite(tmp.vec)] = NA
    digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(tmp.vec, na.rm = T) %>% log10 %>% trunc) + 1
    if (any(c(glm_object.summary.coef.df$Estimate, glm_object.confint.df$`2.5 %`, glm_object.confint.df$`97.5 %`) < 0, na.rm = T) ) {
        digits_total_incl_decimal = digits_total_incl_decimal + 1
    }

    tmp.df = data.frame(coefCI = paste0(
        sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), glm_object.summary.coef.df$Estimate)
        , " ("
        , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), glm_object.confint.df$`2.5 %`)
        , " ~ "
        , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), glm_object.confint.df$`97.5 %`)
        , ")"
    ), stringsAsFactors = F)
    # tmp.dfpvalue=glmobject.summary.coef.df`Pr(>|z|)` %>% round(3) %>% as.character
    varname4Pr = colnames(glm_object.summary.coef.df) %>% grep("^Pr", ., value = T)  # debug 180806) in glm() `Pr(>|z|)`, in svyglm() `Pr(>|t|)`
    tmp.df$p_value = sprintf("%.3f", glm_object.summary.coef.df[[varname4Pr]])
    tmp.df$p_value[glm_object.summary.coef.df[[varname4Pr]] <= 0.001] = "<0.001"

    tmp.df$star = "   "
    tmp.df$star[glm_object.summary.coef.df[[varname4Pr]] <= 0.05] = "*  "
    tmp.df$star[glm_object.summary.coef.df[[varname4Pr]] <= 0.01] = "** "
    tmp.df$star[glm_object.summary.coef.df[[varname4Pr]] <= 0.001] = "***"
    
    for (i in 1:length(p.adjust_method)) {
        tmp.df[[paste0("p.adjust.", i)]] = glm_object.summary.coef.df[[varname4Pr]] %>% p.adjust(method = p.adjust_method[i])
        p.adjust_method.i = substr(p.adjust_method[i], 1, 3)
        tmp.df[[paste0("p.", p.adjust_method.i)]] = sprintf("%.3f", tmp.df[[paste0("p.adjust.", i)]])
        tmp.df[[paste0("p.", p.adjust_method.i)]] [tmp.df[[paste0("p.adjust.", i)]] <= 0.001] = "<0.001"
        
        tmp.df[[paste0("*", p.adjust_method.i)]] = "   "
        tmp.df[[paste0("*", p.adjust_method.i)]] [tmp.df[[paste0("p.adjust.", i)]] <= 0.05] = "*  "
        tmp.df[[paste0("*", p.adjust_method.i)]] [tmp.df[[paste0("p.adjust.", i)]] <= 0.01] = "** "
        tmp.df[[paste0("*", p.adjust_method.i)]] [tmp.df[[paste0("p.adjust.", i)]] <= 0.001] = "***"
        tmp.df[[paste0("p.adjust.", i)]] = NULL
    }

    out = cbind(
        glm_object.summary.coef.df$rowname
        , tmp.df
        , glm_object.summary.coef.df[ , 1:2]
        , glm_object.confint.df
        , glm_object.summary.coef.df[ , -1:(-2)]
        , stringsAsFactors = F
    )
    out$rowname = NULL
    names(out) [1] = "rowname"
    if (coef.exp == T) {
        names(out) [2] = "ORCI"
        names(out) [names(out) == "Estimate"] = "exp(Estimate)"
        names(out) [names(out) == "2.5 %"] = "exp(2.5 %)"
        names(out) [names(out) == "97.5 %"] = "exp(97.5 %)"
    }
    # out = out |> as_tibble()
    row.names(out) = NULL
    out
}





data.svydesign.svyglm_binomial_Depressed %>% function.glm_object.summary.exp()
# > data.svydesign.svyglm_binomial_Depressed %>% function.glm_object.summary.exp() ----
#                                     rowname               ORCI p_value star  p.fdr *fdr  p.bon *bon exp(Estimate) exp(2.5 %) exp(97.5 %) Std. Error    t value     Pr(>|t|)
# 1                               (Intercept) 0.72 (0.30 ~ 1.71)   0.456       0.652       1.000          0.7186779 0.30222096   1.7090078  0.4419749 -0.7474224 4.562707e-01
# 2                      SSQ_5_6_adequateTRUE 0.25 (0.14 ~ 0.42)  <0.001  *** <0.001  *** <0.001  ***     0.2467879 0.14415887   0.4224801  0.2742975 -5.1011265 1.278615e-06
# 3                           US_BORN2: Other 0.49 (0.26 ~ 0.94)   0.033  *    0.109       0.653          0.4917356 0.25833536   0.9360079  0.3284155 -2.1613290 3.265608e-02
# 4                           GENDER2: Female 2.01 (1.29 ~ 3.13)   0.002  **   0.016  *    0.047  *       2.0133860 1.29460340   3.1312471  0.2253171  3.1059238 2.367481e-03
# 5                          AGEGRP5C2: 30-39 0.79 (0.39 ~ 1.60)   0.510       0.680       1.000          0.7878324 0.38842133   1.5979552  0.3608203 -0.6609105 5.099366e-01
# 6                          AGEGRP5C3: 40-49 0.63 (0.27 ~ 1.46)   0.283       0.492       1.000          0.6298733 0.27201987   1.4584979  0.4283975 -1.0789900 2.827562e-01
# 7                          AGEGRP5C4: 50-59 0.85 (0.41 ~ 1.77)   0.662       0.736       1.000          0.8488477 0.40769210   1.7673693  0.3741740 -0.4379659 6.621984e-01
# 8                    AGEGRP5C5: 60 and over 0.52 (0.24 ~ 1.10)   0.089       0.221       1.000          0.5165624 0.24300292   1.0980803  0.3847635 -1.7167925 8.859713e-02
# 9                 RACE2: Non-Hispanic Black 0.83 (0.43 ~ 1.59)   0.569       0.694       1.000          0.8253262 0.42710387   1.5948423  0.3361039 -0.5711823 5.689443e-01
# 10                          RACE3: Hispanic 1.17 (0.66 ~ 2.09)   0.590       0.694       1.000          1.1722366 0.65851005   2.0867390  0.2942345  0.5400914 5.901349e-01
# 11                             RACE4: Asian 0.53 (0.24 ~ 1.18)   0.124       0.249       1.000          0.5328282 0.24009216   1.1824872  0.4067300 -1.5478479 1.242922e-01
# 12                             RACE5: Other 0.95 (0.40 ~ 2.27)   0.908       0.908       1.000          0.9499372 0.39797188   2.2674482  0.4438931 -0.1157022 9.080819e-01
# 13            INC25KMOD2: $20,000 - $49,999 0.62 (0.38 ~ 1.02)   0.064       0.184       1.000          0.6239268 0.38027382   1.0236955  0.2526278 -1.8672620 6.430507e-02
# 14            INC25KMOD3: $50,000 - $74,999 0.67 (0.32 ~ 1.44)   0.309       0.492       1.000          0.6740499 0.31612870   1.4372097  0.3863105 -1.0210728 3.092741e-01
# 15            INC25KMOD4: $75,000 - $99,999 0.25 (0.08 ~ 0.81)   0.023  *    0.090       0.452          0.2532143 0.07896090   0.8120157  0.5945433 -2.3102086 2.258491e-02
# 16            INC25KMOD5: $100,000  or more 0.22 (0.07 ~ 0.67)   0.009  **   0.043  *    0.173          0.2171262 0.07075473   0.6662989  0.5720817 -2.6696823 8.644082e-03
# 17 MARITAL2: Married or living with partner 1.31 (0.77 ~ 2.25)   0.320       0.492       1.000          1.3139162 0.76892201   2.2451898  0.2733611  0.9987236 3.199383e-01
# 18   MARITAL3: Widowed, divorced, separated 0.95 (0.43 ~ 2.07)   0.892       0.908       1.000          0.9471459 0.43409234   2.0665774  0.3980664 -0.1364147 8.917221e-01
# 19                              HUQ_142: No 0.38 (0.22 ~ 0.66)  <0.001  ***  0.008  **   0.016  *       0.3782493 0.21736921   0.6582005  0.2826359 -3.4397678 8.014605e-04
# 20     SSQ_5_6_adequateTRUE:US_BORN2: Other 2.04 (0.86 ~ 4.83)   0.107       0.238       1.000          2.0410403 0.86258588   4.8294851  0.4394368  1.6235776 1.070901e-01




#@ end -----
