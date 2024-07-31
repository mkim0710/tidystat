# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.lm_object.summary.coefCI.dev.r")


# #@ analyticDF2797.PersonTime7.glmOutcome_Exposure_k_Covariates ====
# data = analyticDF2797.PersonTime7 %>% mutate(Exposure = Exposure=="metformin_after_insulin") %>% mutate_if(is.logical, as.numeric) %>% 
#     select(
#         Dk_plus1, Exposure, k
#         , Age_at_lmp, `year(lmp)`
#         , t_N180_42.ICD9_CKD_exceptARF, t_N180_42.ICD9_HTN.Superset, t_N180_42.ICD9_Asthma, t_N180_42.ICD9_Thyroid.Superset, t_N180_42.ICD9_Depression.Superset, t_N180_42.ICD9_SubstanceAbuse, t_N180_42.ICD9_Bipolar, t_N180_42.ICD9_Anxiety, t_N180_42.ICD9_Acne, t_N180_42.ICD9_CPT_PregnancyTest.Superset 
#     )
# analyticDF2797.PersonTime7.glmOutcome_Exposure_k_Covariates = glm(formula = Dk_plus1 ~ Exposure * (k + I(k^2)) + . , data = data, family = binomial)
# analyticDF2797.PersonTime7.glmOutcome_Exposure_k_Covariates %>% {cbind( `exp(coef(.))` = exp(coef(.)), exp(confint.default(.)), `Pr(>|z|)` = summary(.)$coefficients[,"Pr(>|z|)"] )} %>% round(2) |> as.data.frame() %>% rownames_to_column |> as_tibble() #----
# # > analyticDF2797.PersonTime7.glmOutcome_Exposure_k_Covariates %>% {cbind( `exp(coef(.))` = exp(coef(.)), exp(confint.default(.)), `Pr(>|z|)` = summary(.)$coefficients[,"Pr(>|z|)"] )} %>% round(2) |> as.data.frame() %>% rownames_to_column |> as_tibble() #----
# # # A tibble: 18 x 5
# #    rowname                                   `exp(coef(.))` `2.5 %` `97.5 %` `Pr(>|z|)`
# #    <chr>                                              <dbl>   <dbl>    <dbl>      <dbl>
# #  1 (Intercept)                                         0       0    2.35e+10      0.12 
# #  2 Exposure                                            0.34    0.17 6.90e- 1      0    
# #  3 k                                                   0.89    0.87 9.20e- 1      0    
# #  4 I(k^2)                                              1       1    1.00e+ 0      0    
# #  5 Age_at_lmp                                          1.02    1    1.03e+ 0      0.01 
# #  6 `year(lmp)`                                         1.04    0.99 1.10e+ 0      0.15 
# #  7 t_N180_42.ICD9_CKD_exceptARF                        0.76    0.24 2.42e+ 0      0.65 
# #  8 t_N180_42.ICD9_HTN.Superset                         1.46    1.25 1.69e+ 0      0    
# #  9 t_N180_42.ICD9_Asthma                               0.7     0.47 1.04e+ 0      0.08 
# # 10 t_N180_42.ICD9_Thyroid.Superset                     1.05    0.86 1.29e+ 0      0.62 
# # 11 t_N180_42.ICD9_Depression.Superset                  0.99    0.7  1.39e+ 0      0.94 
# # 12 t_N180_42.ICD9_SubstanceAbuse                       1.14    0.75 1.73e+ 0      0.53 
# # 13 t_N180_42.ICD9_Bipolar                              0.94    0.59 1.50e+ 0      0.8  
# # 14 t_N180_42.ICD9_Anxiety                              1.24    0.91 1.69e+ 0      0.18 
# # 15 t_N180_42.ICD9_Acne                                 0.44    0.18 1.06e+ 0      0.07 
# # 16 t_N180_42.ICD9_CPT_PregnancyTest.Superset           1.7     1.48 1.94e+ 0      0    
# # 17 Exposure:k                                          1.04    0.96 1.12e+ 0      0.32 
# # 18 Exposure:I(k^2)                                     1       1    1.00e+ 0      0.580










#@ ==============  
function.lm_object.summary.coefCI = function(lm_object, sprintf_fmt_decimal = 2, p.adjust_method = c("fdr", "bonferroni")) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.lm_object.summary.coefCI.dev.r")
    if(class(lm_object) != "lm") {
        stop("class(lm_object) != \"lm\"")
    }
    library(tidyverse)
    lm_object.confint.df = as.data.frame(confint(lm_object))
    lm_object.summary.coef.df = as.data.frame(coef(summary(lm_object))) %>% rownames_to_column
    
    # # https://stackoverflow.com/questions/3443687/formatting-decimal-places-in-r
    # tmp.df = data.frame(coefCI = paste0(
    #     format(round(lm_object.summary.coef.df$Estimate, round_digits), nsmall = round_digits)
    #     , " ("
    #     , format(round(lm_object.confint.df$`2.5 %`, round_digits), nsmall = round_digits)
    #     , " ~ "
    #     , format(round(lm_object.confint.df$`97.5 %`, round_digits), nsmall = round_digits)
    #     , ")"
    # ), stringsAsFactors = F)
    # # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
    # tmp.df = data.frame(coefCI = paste0(
    #     format(lm_object.summary.coef.df$Estimate, digits = format_digits, nsmall = format_digits)
    #     , " ("
    #     , format(lm_object.confint.df$`2.5 %`, digits = format_digits, nsmall = format_digits)
    #     , " ~ "
    #     , format(lm_object.confint.df$`97.5 %`, digits = format_digits, nsmall = format_digits)
    #     , ")"
    # ), stringsAsFactors = F)
    # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
    # digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(c(lm_object.summary.coef.df$Estimate, lm_object.confint.df$`2.5 %`, lm_object.confint.df$`97.5 %`), na.rm = T) %>% log10 %>% trunc) + 1
    tmp.vec = c(lm_object.summary.coef.df$Estimate, lm_object.confint.df$`2.5 %`, lm_object.confint.df$`97.5 %`)
    tmp.vec[is.infinite(tmp.vec)] = NA
    digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(tmp.vec, na.rm = T) %>% log10 %>% trunc) + 1
    if (any(c(lm_object.summary.coef.df$Estimate, lm_object.confint.df$`2.5 %`, lm_object.confint.df$`97.5 %`) < 0, na.rm = T) ) {
        digits_total_incl_decimal = digits_total_incl_decimal + 1
    }
    tmp.df = data.frame(coefCI = paste0(
        sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), lm_object.summary.coef.df$Estimate)
        , " ("
        , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), lm_object.confint.df$`2.5 %`)
        , " ~ "
        , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), lm_object.confint.df$`97.5 %`)
        , ")"
    ), stringsAsFactors = F)
    # tmp.df$p_value = lm_object.summary.coef.df$`Pr(>|t|)` %>% round(3) |> as.character()
    tmp.df$p_value = sprintf("%.3f", lm_object.summary.coef.df$`Pr(>|t|)`)
    tmp.df$p_value[lm_object.summary.coef.df$`Pr(>|t|)` <= 0.001] = "<0.001"
    
    tmp.df$star = "   "
    tmp.df$star[lm_object.summary.coef.df$`Pr(>|t|)` <= 0.1] = ".  "
    tmp.df$star[lm_object.summary.coef.df$`Pr(>|t|)` <= 0.05] = "*  "
    tmp.df$star[lm_object.summary.coef.df$`Pr(>|t|)` <= 0.01] = "** "
    tmp.df$star[lm_object.summary.coef.df$`Pr(>|t|)` <= 0.001] = "***"
    
    for (i in 1:length(p.adjust_method)) {
        tmp.df[[paste0("p.adjust.", i)]] = lm_object.summary.coef.df$`Pr(>|t|)` %>% p.adjust(method = p.adjust_method[i])
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
        lm_object.summary.coef.df$rowname
        , tmp.df
        , lm_object.summary.coef.df[ , 1:2]
        , lm_object.confint.df
        , lm_object.summary.coef.df[ , -1:(-2)]
        , stringsAsFactors = F
    )
    out$rowname = NULL
    names(out) [1] = "rowname"
    # out = out |> as_tibble()
    row.names(out) = NULL
    out
}

#@ test) function.lm_object.summary.coefCI() ----------  
lm_object = lm(medv ~ ., data = MASS::Boston)
function.lm_object.summary.coefCI(lm_object)
# > function.lm_object.summary.coefCI(lm_object)
#        rowname                   coefCI p_value star  p.fdr *fdr  p.bon *bon      Estimate         2.5 %        97.5 %  Std. Error      t value     Pr(>|t|)
# 1  (Intercept)  36.46 ( 26.43 ~  46.49)  <0.001  *** <0.001  *** <0.001  ***  3.645949e+01  26.432226009  46.486750761 5.103458811   7.14407419 3.283438e-12
# 2         crim  -0.11 ( -0.17 ~  -0.04)   0.001  **   0.001  **   0.015  *   -1.080114e-01  -0.172584412  -0.043438304 0.032864994  -3.28651687 1.086810e-03
# 3           zn   0.05 (  0.02 ~   0.07)  <0.001  ***  0.001  **   0.011  *    4.642046e-02   0.019448778   0.073392139 0.013727462   3.38157628 7.781097e-04
# 4        indus   0.02 ( -0.10 ~   0.14)   0.738       0.795       1.000       2.055863e-02  -0.100267941   0.141385193 0.061495689   0.33431004 7.382881e-01
# 5         chas   2.69 (  0.99 ~   4.38)   0.002  **   0.002  **   0.027  *    2.686734e+00   0.993904193   4.379563446 0.861579756   3.11838086 1.925030e-03
# 6          nox -17.77 (-25.27 ~ -10.26)  <0.001  *** <0.001  *** <0.001  *** -1.776661e+01 -25.271633564 -10.261588893 3.819743707  -4.65125741 4.245644e-06
# 7           rm   3.81 (  2.99 ~   4.63)  <0.001  *** <0.001  *** <0.001  ***  3.809865e+00   2.988726773   4.631003640 0.417925254   9.11614020 1.979441e-18
# 8          age   0.00 ( -0.03 ~   0.03)   0.958       0.958       1.000       6.922246e-04  -0.025262320   0.026646769 0.013209782   0.05240243 9.582293e-01
# 9          dis  -1.48 ( -1.87 ~  -1.08)  <0.001  *** <0.001  *** <0.001  *** -1.475567e+00  -1.867454981  -1.083678710 0.199454735  -7.39800360 6.013491e-13
# 10         rad   0.31 (  0.18 ~   0.44)  <0.001  *** <0.001  *** <0.001  ***  3.060495e-01   0.175692169   0.436406789 0.066346440   4.61289977 5.070529e-06
# 11         tax  -0.01 ( -0.02 ~  -0.00)   0.001  **   0.001  **   0.016  *   -1.233459e-02  -0.019723286  -0.004945902 0.003760536  -3.28000914 1.111637e-03
# 12     ptratio  -0.95 ( -1.21 ~  -0.70)  <0.001  *** <0.001  *** <0.001  *** -9.527472e-01  -1.209795296  -0.695699168 0.130826756  -7.28251056 1.308835e-12
# 13       black   0.01 (  0.00 ~   0.01)  <0.001  ***  0.001  **   0.008  **   9.311683e-03   0.004034306   0.014589060 0.002685965   3.46679256 5.728592e-04
# 14       lstat  -0.52 ( -0.62 ~  -0.43)  <0.001  *** <0.001  *** <0.001  *** -5.247584e-01  -0.624403622  -0.425113133 0.050715278 -10.34714580 7.776912e-23





function.glm_object.summary.exp = function(glm_object, sprintf_fmt_decimal = 2, coef.exp = T, p.adjust_method = c("fdr", "bonferroni"), allow_multple_spaces = T) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.lm_object.summary.coefCI.dev.r")
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
    if (allow_multple_spaces == T) {  # 180816
        digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(tmp.vec, na.rm = T) %>% log10 %>% trunc) + 1
        if (any(c(glm_object.summary.coef.df$Estimate, glm_object.confint.df$`2.5 %`, glm_object.confint.df$`97.5 %`) < 0, na.rm = T) ) {
            digits_total_incl_decimal = digits_total_incl_decimal + 1
        }
    } else {
        digits_total_incl_decimal = 0
    }

    tmp.df = data.frame(coefCI = paste0(
        sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), glm_object.summary.coef.df$Estimate)
        , " ("
        , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), glm_object.confint.df$`2.5 %`)
        , " ~ "
        , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), glm_object.confint.df$`97.5 %`)
        , ")"
    ), stringsAsFactors = F)

    # tmp.dfpvalue=glmobject.summary.coef.df`Pr(>|z|)` %>% round(3) |> as.character()
    varname4Pr = colnames(glm_object.summary.coef.df) %>% grep("^Pr", ., value = T)  # debug 180806) in glm() `Pr(>|z|)`, in svyglm() `Pr(>|t|)`
    tmp.df$p_value = sprintf("%.3f", glm_object.summary.coef.df[[varname4Pr]])
    tmp.df$p_value[glm_object.summary.coef.df[[varname4Pr]] <= 0.001] = "<0.001"

    tmp.df$star = "   "
    tmp.df$star[glm_object.summary.coef.df[[varname4Pr]] <= 0.1] = ".  "
    tmp.df$star[glm_object.summary.coef.df[[varname4Pr]] <= 0.05] = "*  "
    tmp.df$star[glm_object.summary.coef.df[[varname4Pr]] <= 0.01] = "** "
    tmp.df$star[glm_object.summary.coef.df[[varname4Pr]] <= 0.001] = "***"
    
    for (i in 1:length(p.adjust_method)) {
        tmp.df[[paste0("p.adjust.", i)]] = glm_object.summary.coef.df[[varname4Pr]] %>% p.adjust(method = p.adjust_method[i])
        p.adjust_method.i = substr(p.adjust_method[i], 1, 3)
        tmp.df[[paste0("p.", p.adjust_method.i)]] = sprintf("%.3f", tmp.df[[paste0("p.adjust.", i)]])
        tmp.df[[paste0("p.", p.adjust_method.i)]] [tmp.df[[paste0("p.adjust.", i)]] <= 0.001] = "<0.001"
        
        tmp.df[[paste0("*", p.adjust_method.i)]] = "   "
        tmp.df[[paste0("*", p.adjust_method.i)]] [tmp.df[[paste0("p.adjust.", i)]] <= 0.1] = ".  "  # 180816
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



#@ test) function.glm_object.summary.exp() ----  
glm_object = glm(admit ~ gre + gpa + rank, data = read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv"), family = binomial)
glm_object %>% function.glm_object.summary.exp
# > glm_object %>% function.glm_object.summary.exp
# Waiting for profiling to be done...
#       rowname               ORCI p_value star  p.fdr *fdr  p.bon *bon exp(Estimate)  exp(2.5 %) exp(97.5 %)  Std. Error   z value     Pr(>|z|)
# 1 (Intercept) 0.03 (0.00 ~ 0.28)   0.002  **   0.005  **   0.009  **     0.03175998 0.003309497   0.2835650 1.132846009 -3.045029 2.326583e-03
# 2         gre 1.00 (1.00 ~ 1.00)   0.036  *    0.036  *    0.143         1.00229659 1.000171559   1.0044714 0.001091839  2.101005 3.564052e-02
# 3         gpa 2.17 (1.15 ~ 4.17)   0.018  *    0.024  *    0.071         2.17496718 1.152082367   4.1717746 0.327483878  2.372677 1.765968e-02
# 4        rank 0.57 (0.44 ~ 0.73)  <0.001  *** <0.001  *** <0.001  ***    0.57119114 0.442656492   0.7294389 0.127136989 -4.404945 1.058109e-05


# function.clogit_object.summary.exp = function(clogit_object, sprintf_fmt_decimal = 2, coef.exp = T) {
#     # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.lm_object.summary.coefCI.dev.r")
#     if(!"clogit" %in% class(clogit_object)) {
#         stop("!\"clogit\" %in% class(clogit_object)")
#     }
#     library(tidyverse)
#     library(survival)
#     clogit_object.confint.df = as.data.frame(confint(clogit_object))
#     clogit_object.summary.coef.df = as.data.frame(coef(summary(clogit_object))) %>% rownames_to_column
#     if (coef.exp == T) {
#         clogit_object.confint.df = exp(clogit_object.confint.df)
#         clogit_object.summary.coef.df$coef = exp(clogit_object.summary.coef.df$coef)
#     }
# 
#     # # https://stackoverflow.com/questions/3443687/formatting-decimal-places-in-r
#     # tmp.df = data.frame(coefCI = paste0(
#     #     format(round(clogit_object.summary.coef.df$coef, round_digits), nsmall = round_digits)
#     #     , " ("
#     #     , format(round(clogit_object.confint.df$`2.5 %`, round_digits), nsmall = round_digits)
#     #     , " ~ "
#     #     , format(round(clogit_object.confint.df$`97.5 %`, round_digits), nsmall = round_digits)
#     #     , ")"
#     # ), stringsAsFactors = F)
#     # # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
#     # tmp.df = data.frame(coefCI = paste0(
#     #     format(clogit_object.summary.coef.df$coef, digits = format_digits, nsmall = format_digits)
#     #     , " ("
#     #     , format(clogit_object.confint.df$`2.5 %`, digits = format_digits, nsmall = format_digits)
#     #     , " ~ "
#     #     , format(clogit_object.confint.df$`97.5 %`, digits = format_digits, nsmall = format_digits)
#     #     , ")"
#     # ), stringsAsFactors = F)
#     # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
#     # digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(c(clogit_object.summary.coef.df$coef, clogit_object.confint.df$`2.5 %`, clogit_object.confint.df$`97.5 %`), na.rm = T) %>% log10 %>% trunc) + 1
#     tmp.vec = c(clogit_object.summary.coef.df$coef, clogit_object.confint.df$`2.5 %`, clogit_object.confint.df$`97.5 %`)
#     tmp.vec[is.infinite(tmp.vec)] = NA
#     digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(tmp.vec, na.rm = T) %>% log10 %>% trunc) + 1
#     if (any(c(clogit_object.summary.coef.df$coef, clogit_object.confint.df$`2.5 %`, clogit_object.confint.df$`97.5 %`) < 0, na.rm = T) ) {
#         digits_total_incl_decimal = digits_total_incl_decimal + 1
#     }
# 
#     tmp.df = data.frame(coefCI = paste0(
#         sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), clogit_object.summary.coef.df$coef)
#         , " ("
#         , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), clogit_object.confint.df$`2.5 %`)
#         , " ~ "
#         , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), clogit_object.confint.df$`97.5 %`)
#         , ")"
#     ), stringsAsFactors = F)
#     # tmp.df$p_value = clogit_object.summary.coef.df$`Pr(>|z|)` %>% round(3) |> as.character()
#     tmp.df$p_value = sprintf("%.3f", clogit_object.summary.coef.df$`Pr(>|z|)`)
#     tmp.df$p_value[clogit_object.summary.coef.df$`Pr(>|z|)` <= 0.001] = "<0.001"
# 
#     tmp.df$star = "   "
#     tmp.df$star[clogit_object.summary.coef.df$`Pr(>|z|)` <= 0.05] = "*  "
#     tmp.df$star[clogit_object.summary.coef.df$`Pr(>|z|)` <= 0.01] = "** "
#     tmp.df$star[clogit_object.summary.coef.df$`Pr(>|z|)` <= 0.001] = "***"
# 
#     out = cbind(
#         clogit_object.summary.coef.df$rowname
#         , tmp.df
#         , clogit_object.summary.coef.df[ , 1:2]
#         , clogit_object.confint.df
#         , clogit_object.summary.coef.df[ , -1:(-2)]
#         , stringsAsFactors = F
#     )
#     out$rowname = NULL
#     names(out) [1] = "rowname"
#     if (coef.exp == T) {
#         out$`exp(coef)` = NULL
#         names(out) [2] = "ORCI"
#         names(out) [5] = "exp(coef)"
#         names(out) [6] = "exp(2.5 %)"
#         names(out) [7] = "exp(97.5 %)"
#     }
#     # out = out |> as_tibble()
#     row.names(out) = NULL
#     out
# }
# 
# 
# 
# #@ test) function.clogit_object.summary.exp() ----
# library(survival)
# logan2 = data.frame(
#     survival::logan[rep(1:nrow(survival::logan), length(levels(survival::logan$occupation))), ]
#     , id = rep(1:nrow(survival::logan), length(levels(survival::logan$occupation)))
#     , tocc = factor(rep(levels(survival::logan$occupation), each = nrow(survival::logan)))
# )
# logan2$case = (logan2$occupation == logan2$tocc)
# logan2 = logan2[order(logan2$id), ]
# logan2 |> as_tibble()
# # > logan2 |> as_tibble()
# # # A tibble: 4,190 x 7
# #    occupation         focc education      race    id         tocc  case
# #  *     <fctr>       <fctr>     <int>    <fctr> <int>       <fctr> <lgl>
# #  1      sales professional        14 non-black     1         farm FALSE
# #  2      sales professional        14 non-black     1   operatives FALSE
# #  3      sales professional        14 non-black     1    craftsmen FALSE
# #  4      sales professional        14 non-black     1        sales  TRUE
# #  5      sales professional        14 non-black     1 professional FALSE
# #  6  craftsmen        sales        13 non-black     2         farm FALSE
# #  7  craftsmen        sales        13 non-black     2   operatives FALSE
# #  8  craftsmen        sales        13 non-black     2    craftsmen  TRUE
# #  9  craftsmen        sales        13 non-black     2        sales FALSE
# # 10  craftsmen        sales        13 non-black     2 professional FALSE
# # # ... with 4,180 more rows
# clogit_object = clogit(case ~ tocc + tocc:education + strata(id), logan2)
# clogit_object %>% function.clogit_object.summary.exp
# # > clogit_object = clogit(case ~ tocc + tocc:education + strata(id), logan2)
# # Warning message:
# # In coxph(formula = Surv(rep(1, 4190L), case) ~ tocc + tocc:education +  :
# #   X matrix deemed to be singular; variable 9
# # > clogit_object %>% function.clogit_object.summary.exp
# #                      rowname               ORCI p_value star    exp(coef)   exp(2.5 %) exp(97.5 %)   se(coef)          z     Pr(>|z|)
# # 1                   toccfarm 0.15 (0.01 ~ 2.25)   0.170      0.1500985887 1.002427e-02  2.24750455 1.38078224  -1.373470 1.696063e-01
# # 2             toccoperatives 3.21 (1.06 ~ 9.73)   0.039  *   3.2115387998 1.059825e+00  9.73178121 0.56564649   2.062684 3.914262e-02
# # 3           toccprofessional 0.00 (0.00 ~ 0.00)  <0.001  *** 0.0003033725 7.712957e-05  0.00119325 0.69872442 -11.593339 0.000000e+00
# # 4                  toccsales 0.01 (0.00 ~ 0.03)  <0.001  *** 0.0065438496 1.446554e-03  0.02960274 0.77008623  -6.530736 6.544743e-11
# # 5    tocccraftsmen:education 0.72 (0.64 ~ 0.80)  <0.001  *** 0.7172834608 6.416297e-01  0.80185742 0.05686824  -5.843053 5.125262e-09
# # 6         toccfarm:education 0.69 (0.55 ~ 0.87)   0.001  **  0.6905369692 5.496656e-01  0.86751158 0.11640997  -3.180877 1.468301e-03
# # 7   toccoperatives:education 0.66 (0.58 ~ 0.74)  <0.001  *** 0.6555905786 5.846481e-01  0.73514131 0.05843284  -7.225710 4.984901e-13
# # 8 toccprofessional:education 1.32 (1.20 ~ 1.46)  <0.001  *** 1.3208122354 1.195121e+00  1.45972295 0.05102123   5.453550 4.937392e-08
# # 9        toccsales:education   NA (  NA ~   NA)      NA                NA           NA          NA 0.00000000         NA           NA


function.coxph_object.summary.exp = function(coxph_object, sprintf_fmt_decimal = 2, coef.exp = T, is.clogit = "unknown", p.adjust_method = c("fdr", "bonferroni")) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.lm_object.summary.coefCI.dev.r")
    if (!"coxph" %in% class(coxph_object)) {
        stop("!\"coxph\" %in% class(coxph_object)")
    }
    if (is.clogit == "unknown") {
        if ("clogit" %in% class(coxph_object)) {
            warning("\"clogit\" %in% class(coxph_object)")
            is.clogit = T
        }
    } else if (is.clogit == T) {
        if (!"clogit" %in% class(coxph_object)) {
            stop("!\"clogit\" %in% class(coxph_object)")
        }
    } 
    library(tidyverse)
    library(survival)
    coxph_object.confint.df = as.data.frame(confint(coxph_object))
    coxph_object.summary.coef.df = as.data.frame(coef(summary(coxph_object))) %>% rownames_to_column
    if (coef.exp == T) {
        coxph_object.confint.df = exp(coxph_object.confint.df)
        coxph_object.summary.coef.df$coef = exp(coxph_object.summary.coef.df$coef)
    }

    # # https://stackoverflow.com/questions/3443687/formatting-decimal-places-in-r
    # tmp.df = data.frame(coefCI = paste0(
    #     format(round(coxph_object.summary.coef.df$coef, round_digits), nsmall = round_digits)
    #     , " ("
    #     , format(round(coxph_object.confint.df$`2.5 %`, round_digits), nsmall = round_digits)
    #     , " ~ "
    #     , format(round(coxph_object.confint.df$`97.5 %`, round_digits), nsmall = round_digits)
    #     , ")"
    # ), stringsAsFactors = F)
    # # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
    # tmp.df = data.frame(coefCI = paste0(
    #     format(coxph_object.summary.coef.df$coef, digits = format_digits, nsmall = format_digits)
    #     , " ("
    #     , format(coxph_object.confint.df$`2.5 %`, digits = format_digits, nsmall = format_digits)
    #     , " ~ "
    #     , format(coxph_object.confint.df$`97.5 %`, digits = format_digits, nsmall = format_digits)
    #     , ")"
    # ), stringsAsFactors = F)
    # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
    # digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(c(coxph_object.summary.coef.dfcoef,coxphobject.confint.df`2.5 %`, coxph_object.confint.df$`97.5 %`), na.rm = T) %>% log10 %>% trunc) + 1
    tmp.vec = c(coxph_object.summary.coef.df$coef, coxph_object.confint.df$`2.5 %`, coxph_object.confint.df$`97.5 %`)
    tmp.vec[is.infinite(tmp.vec)] = NA
    digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(tmp.vec, na.rm = T) %>% log10 %>% trunc) + 1
    if (any(c(coxph_object.summary.coef.df$coef, coxph_object.confint.df$`2.5 %`, coxph_object.confint.df$`97.5 %`) < 0, na.rm = T) ) {
        digits_total_incl_decimal = digits_total_incl_decimal + 1
    }

    tmp.df = data.frame(coefCI = paste0(
        sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), coxph_object.summary.coef.df$coef)
        , " ("
        , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), coxph_object.confint.df$`2.5 %`)
        , " ~ "
        , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), coxph_object.confint.df$`97.5 %`)
        , ")"
    ), stringsAsFactors = F)
    # tmp.dfpvalue=coxphobject.summary.coef.df`Pr(>|z|)` %>% round(3) |> as.character()
    tmp.df$p_value = sprintf("%.3f", coxph_object.summary.coef.df$`Pr(>|z|)`)
    tmp.df$p_value[coxph_object.summary.coef.df$`Pr(>|z|)` <= 0.001] = "<0.001"

    tmp.df$star = "   "
    tmp.df$star[coxph_object.summary.coef.df$`Pr(>|z|)` <= 0.1] = ".  "
    tmp.df$star[coxph_object.summary.coef.df$`Pr(>|z|)` <= 0.05] = "*  "
    tmp.df$star[coxph_object.summary.coef.df$`Pr(>|z|)` <= 0.01] = "** "
    tmp.df$star[coxph_object.summary.coef.df$`Pr(>|z|)` <= 0.001] = "***"
    ?p.adjust
    for (i in 1:length(p.adjust_method)) {
        tmp.df[[paste0("p.adjust.", i)]] = coxph_object.summary.coef.df$`Pr(>|z|)` %>% p.adjust(method = p.adjust_method[i])
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
        coxph_object.summary.coef.df$rowname
        , tmp.df
        , coxph_object.summary.coef.df[ , 1:2]
        , coxph_object.confint.df
        , coxph_object.summary.coef.df[ , -1:(-2)]
        , stringsAsFactors = F
    )
    out$rowname = NULL
    names(out) [1] = "rowname"
    if (coef.exp == T) {
        out$`exp(coef)` = NULL
        if (is.clogit == T) {
            names(out) [2] = "ORCI"
        } else {
            names(out) [2] = "HRCI"
        }
        names(out) [names(out) == "coef"] = "exp(coef)"
        names(out) [names(out) == "2.5 %"] = "exp(2.5 %)"
        names(out) [names(out) == "97.5 %"] = "exp(97.5 %)"
    }
    # out = out |> as_tibble()
    row.names(out) = NULL
    out
}



#@ test) function.clogit_object.summary.exp() - clogit object ----  
library(tidyverse)
library(survival)
logan2 = data.frame(
    survival::logan[rep(1:nrow(survival::logan), length(levels(survival::logan$occupation))), ]
    , id = rep(1:nrow(survival::logan), length(levels(survival::logan$occupation)))
    , tocc = factor(rep(levels(survival::logan$occupation), each = nrow(survival::logan)))
)
logan2$case = (logan2$occupation == logan2$tocc)
logan2 = logan2[order(logan2$id), ]
logan2 |> as_tibble()
# > logan2 |> as_tibble()
# # A tibble: 4,190 x 7
#    occupation         focc education      race    id         tocc  case
#  *     <fctr>       <fctr>     <int>    <fctr> <int>       <fctr> <lgl>
#  1      sales professional        14 non-black     1         farm FALSE
#  2      sales professional        14 non-black     1   operatives FALSE
#  3      sales professional        14 non-black     1    craftsmen FALSE
#  4      sales professional        14 non-black     1        sales  TRUE
#  5      sales professional        14 non-black     1 professional FALSE
#  6  craftsmen        sales        13 non-black     2         farm FALSE
#  7  craftsmen        sales        13 non-black     2   operatives FALSE
#  8  craftsmen        sales        13 non-black     2    craftsmen  TRUE
#  9  craftsmen        sales        13 non-black     2        sales FALSE
# 10  craftsmen        sales        13 non-black     2 professional FALSE
# # ... with 4,180 more rows
clogit_object = clogit(case ~ tocc + tocc:education + strata(id), logan2)
clogit_object %>% function.coxph_object.summary.exp
# > clogit_object = clogit(case ~ tocc + tocc:education + strata(id), logan2)
# Warning message:
# In coxph(formula = Surv(rep(1, 4190L), case) ~ tocc + tocc:education +  :
#   X matrix deemed to be singular; variable 9
# > clogit_object %>% function.coxph_object.summary.exp
#                      rowname               ORCI p_value star  p.fdr *fdr  p.bon *bon    exp(coef)   exp(2.5 %) exp(97.5 %)   se(coef)          z     Pr(>|z|)
# 1                   toccfarm 0.15 (0.01 ~ 2.25)   0.170       0.170       1.000      0.1500985887 1.002427e-02  2.24750455 1.38078224  -1.373470 1.696063e-01
# 2             toccoperatives 3.21 (1.06 ~ 9.73)   0.039  *    0.045  *    0.313      3.2115387998 1.059825e+00  9.73178121 0.56564649   2.062684 3.914262e-02
# 3           toccprofessional 0.00 (0.00 ~ 0.00)  <0.001  *** <0.001  *** <0.001  *** 0.0003033725 7.712957e-05  0.00119325 0.69872442 -11.593339 0.000000e+00
# 4                  toccsales 0.01 (0.00 ~ 0.03)  <0.001  *** <0.001  *** <0.001  *** 0.0065438496 1.446554e-03  0.02960274 0.77008623  -6.530736 6.544743e-11
# 5    tocccraftsmen:education 0.72 (0.64 ~ 0.80)  <0.001  *** <0.001  *** <0.001  *** 0.7172834608 6.416297e-01  0.80185742 0.05686824  -5.843053 5.125262e-09
# 6         toccfarm:education 0.69 (0.55 ~ 0.87)   0.001  **   0.002  **   0.012  *   0.6905369692 5.496656e-01  0.86751158 0.11640997  -3.180877 1.468301e-03
# 7   toccoperatives:education 0.66 (0.58 ~ 0.74)  <0.001  *** <0.001  *** <0.001  *** 0.6555905786 5.846481e-01  0.73514131 0.05843284  -7.225710 4.984901e-13
# 8 toccprofessional:education 1.32 (1.20 ~ 1.46)  <0.001  *** <0.001  *** <0.001  *** 1.3208122354 1.195121e+00  1.45972295 0.05102123   5.453550 4.937392e-08
# 9        toccsales:education   NA (  NA ~   NA)      NA          NA          NA                NA           NA          NA 0.00000000         NA           NA
# Warning message:
# In function.coxph_object.summary.exp(.) : "clogit" %in% class(coxph_object)


function.cv.glmnet_object.coef.exp = function(cv.glmnet_object, nonzero = F, print_any_expB_gt.2 = F) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.lm_object.summary.coefCI.dev.r")
    library(glmnet)
    library(tidyverse)
    out = c("lambda.min", "lambda.1se") %>% map(function(chr) {
        coef(cv.glmnet_object, s = chr)
    }) %>% map(as.matrix) %>% map(as.data.frame) %>% map(rownames_to_column) %>% reduce(full_join, by = "rowname")
    names(out)[2:3] = c("coef.min", "coef.1se")
    # names(out)[2:3] = names(out)[2:3] %>% format(nsmall = 3)
    out$rownum = 1:nrow(out)
    
    out.NA = out
    out.NA [out.NA == 0] = NA
    
    # out.NA[["exp(coef.min)"]] = out.NA$coef.min %>% exp %>% sprintf("%.2f", .)
    # out.NA[["exp(coef.1se)"]] = out.NA$coef.1se %>% exp %>% sprintf("%.2f", .)
    # out.NA = out.NA %>% select(rownum, rowname, matches("exp\\(coef"), matches("coef\\."))
    out.NA[["expB.min"]] = out.NA$coef.min %>% exp %>% sprintf("%.2f", .)
    out.NA[["expB.1se"]] = out.NA$coef.1se %>% exp %>% sprintf("%.2f", .)
    out.NA = out.NA %>% select(rownum, rowname, matches("expB\\."), matches("coef\\."))
    
    if (nonzero == T) {
        out.NA = out.NA %>% dplyr::filter(is.na(coef.min) * is.na(coef.1se) == 0)  # logical * logical == 0 : TRUE when any of the logicals is FALSE : ?? operator
        # out.NA = out.NA %>% dplyr::filter(is.na(coef.min) * is.na(coef.1se) == 0)  # logical + logical == 0 : TRUE when both of the logicals is FALSE : ?? operator
        # out.NA = out.NA %>% dplyr::filter(!is.na(coef.min) * !is.na(coef.1se) == 0)  # !logical * !logical == 0 : TRUE when any of the logicals is TRUE : OR operator
        # out.NA = out.NA %>% dplyr::filter(!is.na(coef.min) * !is.na(coef.1se) == 0)  # !logical + !logical == 0 : TRUE when both of the logicals is TRUE : AND operator
    }
    if (print_any_expB_gt.2 == T) {
        suppressWarnings((
            out.NA = out.NA %>% dplyr::filter(abs(as.numeric(expB.min)-1) > 0.2 | abs(as.numeric(expB.1se)-1) > 0.2)
        ))
        rownames(out.NA) = NULL
    }
    out.NA
}

#@ test) function.cv.glmnet_object.coef.exp() -----  
library(tidyverse)
library(glmnet)
x = matrix(rnorm(1e3 * 100), 1e3, 100)
y = rnorm(1e3)
cv.glmnet_object = cv.glmnet(x,y)
cv.glmnet_object %>% function.cv.glmnet_object.coef.exp
cv.glmnet_object %>% function.cv.glmnet_object.coef.exp(print_any_expB_gt.2 = T)
# > cv.glmnet_object %>% function.cv.glmnet_object.coef.exp(print_any_expB_gt.2 = T)
# [1] rownum   rowname  expB.min expB.1se coef.min coef.1se
# <0 ??> <?Ǵ? row.names?? ???̰? 0?Դϴ?>

set.seed(1010)
n=1000;p=100
nzc=trunc(p/10)
x=matrix(rnorm(n*p),n,p)
beta=rnorm(nzc)
fx= x[,seq(nzc)] %*% beta
eps=rnorm(n)*5
y=drop(fx+eps)
px=exp(fx)
px=px/(1+px)
ly=rbinom(n=length(px),prob=px,size=1)
set.seed(1011)
cvob1=cv.glmnet(x,y)
cvob1 %>% function.cv.glmnet_object.coef.exp %>% head(15)
cvob1 %>% function.cv.glmnet_object.coef.exp(print_any_expB_gt.2 = T)
# > cvob1 %>% function.cv.glmnet_object.coef.exp %>% head(15)
#    rownum     rowname expB.min expB.1se    coef.min   coef.1se
# 1       1 (Intercept)     0.89     0.89 -0.11291017 -0.1144990
# 2       2          V1     0.66     0.78 -0.41095526 -0.2496825
# 3       3          V2     1.65     1.43  0.50127803  0.3546561
# 4       4          V3       NA       NA          NA         NA
# 5       5          V4     0.67     0.78 -0.40319404 -0.2505954
# 6       6          V5     0.65     0.80 -0.42518885 -0.2208821
# 7       7          V6     1.53     1.33  0.42609526  0.2819755
# 8       8          V7     1.52     1.25  0.41845873  0.2264551
# 9       9          V8     0.21     0.25 -1.54881117 -1.3898424
# 10     10          V9     3.43     2.87  1.23284876  1.0554409
# 11     11         V10     1.37     1.20  0.31187777  0.1851447
# 12     12         V11       NA       NA          NA         NA
# 13     13         V12       NA       NA          NA         NA
# 14     14         V13       NA       NA          NA         NA
# 15     15         V14     0.97       NA -0.03085618         NA
# > cvob1 %>% function.cv.glmnet_object.coef.exp(print_any_expB_gt.2 = T)
#    rownum rowname expB.min expB.1se   coef.min    coef.1se
# 1       2      V1     0.66     0.78 -0.4109553 -0.24968246
# 2       3      V2     1.65     1.43  0.5012780  0.35465610
# 3       5      V4     0.67     0.78 -0.4031940 -0.25059537
# 4       6      V5     0.65     0.80 -0.4251888 -0.22088214
# 5       7      V6     1.53     1.33  0.4260953  0.28197554
# 6       8      V7     1.52     1.25  0.4184587  0.22645514
# 7       9      V8     0.21     0.25 -1.5488112 -1.38984240
# 8      10      V9     3.43     2.87  1.2328488  1.05544092
# 9      11     V10     1.37     1.20  0.3118778  0.18514468
# 10     27     V26     1.22     1.03  0.1970404  0.02947248
# 11     76     V75     0.70     0.84 -0.3579856 -0.17717557


function.cv.glmnet_alphas_list_object.coef.exp = function(cv.glmnet_alphas_list_object, i_names = NULL, print_any_expB.min_gt.2 = F) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.lm_object.summary.coefCI.dev.r")
    
    function.cv.glmnet_object.coef.exp = function(cv.glmnet_object, nonzero = F, print_any_expB_gt.2 = F) {
        # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.lm_object.summary.coefCI.dev.r")
        library(glmnet)
        library(tidyverse)
        out = c("lambda.min", "lambda.1se") %>% map(function(chr) {
            coef(cv.glmnet_object, s = chr)
        }) %>% map(as.matrix) %>% map(as.data.frame) %>% map(rownames_to_column) %>% reduce(full_join, by = "rowname")
        names(out)[2:3] = c("coef.min", "coef.1se")
        # names(out)[2:3] = names(out)[2:3] %>% format(nsmall = 3)
        out$rownum = 1:nrow(out)
        
        out.NA = out
        out.NA [out.NA == 0] = NA
        
        # out.NA[["exp(coef.min)"]] = out.NA$coef.min %>% exp %>% sprintf("%.2f", .)
        # out.NA[["exp(coef.1se)"]] = out.NA$coef.1se %>% exp %>% sprintf("%.2f", .)
        # out.NA = out.NA %>% select(rownum, rowname, matches("exp\\(coef"), matches("coef\\."))
        out.NA[["expB.min"]] = out.NA$coef.min %>% exp %>% sprintf("%.2f", .)
        out.NA[["expB.1se"]] = out.NA$coef.1se %>% exp %>% sprintf("%.2f", .)
        out.NA = out.NA %>% select(rownum, rowname, matches("expB\\."), matches("coef\\."))
        
        if (nonzero == T) {
            out.NA = out.NA %>% dplyr::filter(is.na(coef.min) * is.na(coef.1se) == 0)  # logical * logical == 0 : TRUE when any of the logicals is FALSE : ?? operator
            # out.NA = out.NA %>% dplyr::filter(is.na(coef.min) * is.na(coef.1se) == 0)  # logical + logical == 0 : TRUE when both of the logicals is FALSE : ?? operator
            # out.NA = out.NA %>% dplyr::filter(!is.na(coef.min) * !is.na(coef.1se) == 0)  # !logical * !logical == 0 : TRUE when any of the logicals is TRUE : OR operator
            # out.NA = out.NA %>% dplyr::filter(!is.na(coef.min) * !is.na(coef.1se) == 0)  # !logical + !logical == 0 : TRUE when both of the logicals is TRUE : AND operator
        }
        if (print_any_expB_gt.2 == T) {
            suppressWarnings((
                out.NA = out.NA %>% dplyr::filter(abs(as.numeric(expB.min)-1) > 0.2 | abs(as.numeric(expB.1se)-1) > 0.2)
            ))
            rownames(out.NA) = NULL
        }
        out.NA
    }

    library(glmnet)
    library(tidyverse)
    out2 = cv.glmnet_alphas_list_object %>% map(function.cv.glmnet_object.coef.exp)
    if (is.null(i_names)) {
        # names(cv.glmnet_alphas_list_object) %>% grep("\\.a1$|\\.a0\\.[1-9]$", ., value = T)
        i_names = names(cv.glmnet_alphas_list_object) |> str()ingr::str_extract("\\.a1$|\\.a0\\.[1-9]$")
        i_names = i_names %>% gsub("\\.a0\\.", ".a.", .)
        i_names = i_names %>% gsub("^\\.", "", .)
        if (any(is.na(i_names))) {
            stop("any(is.na(i_names))")
        }
    }
    out3 = out2 %>% seq_along %>% map(function(i) {
        df = out2[[i]]
        names(df) [!names(df) %in% c("rownum", "rowname")] = 
            paste0(
                i_names[i]
                , names(df) [!names(df) %in% c("rownum", "rowname")]
            )
        df
    })

    out4 = out3 %>% reduce(full_join, by = c("rownum", "rowname"))
    # out4 = out4 %>% select(rownum, rowname, matches("exp\\(coef"), matches("coef\\."))
    out4 = out4 %>% select(rownum, rowname, matches("expB\\."), matches("coef\\."))
    
    if (print_any_expB.min_gt.2 == T) {
        # suppressWarnings((
        #     out4 = out4 %>% dplyr::filter(abs(as.numeric(a1expB.min)-1) > 0.2 | abs(as.numeric(a.5expB.min)-1) > 0.2)
        # ))
        suppressWarnings((
            out4 = out4[which( ( ( abs( (out4[paste0(i_names, "expB.min")] %>% map_df(as.numeric)) - 1 ) > 0.2 ) %>% rowSums(na.rm = T) ) > 0 ), ]
        ))
        rownames(out4) = NULL
    }
    out4
}
#@ test) function.cv.glmnet_alphas_list_object.coef.exp() -----  















#@ end -----  
