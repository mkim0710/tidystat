# source("https://github.com/mkim0710/tidystat/raw/master/function.lm_object.summary.coefCI.source.r")


function.lm_object.summary.coefCI = function(lm_object, sprintf_fmt_decimal = 2, p.adjust_method = c("fdr", "bonferroni")) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.lm_object.summary.coefCI.source.r")
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
    # tmp.df$p_value = lm_object.summary.coef.df$`Pr(>|t|)` %>% round(3) %>% as.character
    tmp.df$p_value = sprintf("%.3f", lm_object.summary.coef.df$`Pr(>|t|)`)
    tmp.df$p_value[lm_object.summary.coef.df$`Pr(>|t|)` <= 0.001] = "<0.001"
    
    tmp.df$star = "   "
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
    # out = out %>% as.tibble
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



function.glm_object.summary.OR = function(glm_object, sprintf_fmt_decimal = 2, coef.exp = T, p.adjust_method = c("fdr", "bonferroni")) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.lm_object.summary.coefCI.source.r")
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
    # digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(c(glm_object.summary.coef.df$Estimate, glm_object.confint.df$`2.5 %`, glm_object.confint.df$`97.5 %`), na.rm = T) %>% log10 %>% trunc) + 1
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
    # tmp.df$p_value = glm_object.summary.coef.df$`Pr(>|z|)` %>% round(3) %>% as.character
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
    # out = out %>% as.tibble
    row.names(out) = NULL
    out
}

#@ test) function.glm_object.summary.OR() ----
glm_object = glm(admit ~ gre + gpa + rank, data = read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv"), family = binomial)
glm_object %>% function.glm_object.summary.OR
# > glm_object %>% function.glm_object.summary.OR
# Waiting for profiling to be done...
#       rowname               ORCI p_value star  p.fdr *fdr  p.bon *bon exp(Estimate)  exp(2.5 %) exp(97.5 %)  Std. Error   z value     Pr(>|z|)
# 1 (Intercept) 0.03 (0.00 ~ 0.28)   0.002  **   0.005  **   0.009  **     0.03175998 0.003309497   0.2835650 1.132846009 -3.045029 2.326583e-03
# 2         gre 1.00 (1.00 ~ 1.00)   0.036  *    0.036  *    0.143         1.00229659 1.000171559   1.0044714 0.001091839  2.101005 3.564052e-02
# 3         gpa 2.17 (1.15 ~ 4.17)   0.018  *    0.024  *    0.071         2.17496718 1.152082367   4.1717746 0.327483878  2.372677 1.765968e-02
# 4        rank 0.57 (0.44 ~ 0.73)  <0.001  *** <0.001  *** <0.001  ***    0.57119114 0.442656492   0.7294389 0.127136989 -4.404945 1.058109e-05


# function.clogit_object.summary.OR = function(clogit_object, sprintf_fmt_decimal = 2, coef.exp = T) {
#     # source("https://github.com/mkim0710/tidystat/raw/master/function.lm_object.summary.coefCI.source.r")
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
#     # tmp.df$p_value = clogit_object.summary.coef.df$`Pr(>|z|)` %>% round(3) %>% as.character
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
#     # out = out %>% as.tibble
#     row.names(out) = NULL
#     out
# }
# 
# 
# 
# #@ test) function.clogit_object.summary.OR() ----
# library(survival)
# logan2 = data.frame(
#     survival::logan[rep(1:nrow(survival::logan), length(levels(survival::logan$occupation))), ]
#     , id = rep(1:nrow(survival::logan), length(levels(survival::logan$occupation)))
#     , tocc = factor(rep(levels(survival::logan$occupation), each = nrow(survival::logan)))
# )
# logan2$case = (logan2$occupation == logan2$tocc)
# logan2 = logan2[order(logan2$id), ]
# logan2 %>% as.tibble
# # > logan2 %>% as.tibble
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
# clogit_object %>% function.clogit_object.summary.OR
# # > clogit_object = clogit(case ~ tocc + tocc:education + strata(id), logan2)
# # Warning message:
# # In coxph(formula = Surv(rep(1, 4190L), case) ~ tocc + tocc:education +  :
# #   X matrix deemed to be singular; variable 9
# # > clogit_object %>% function.clogit_object.summary.OR
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


function.coxph_object.summary.OR = function(coxph_object, sprintf_fmt_decimal = 2, coef.exp = T, is.clogit = "unknown", p.adjust_method = c("fdr", "bonferroni")) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.lm_object.summary.coefCI.source.r")
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
    # tmp.dfpvalue=coxphobject.summary.coef.df`Pr(>|z|)` %>% round(3) %>% as.character
    tmp.df$p_value = sprintf("%.3f", coxph_object.summary.coef.df$`Pr(>|z|)`)
    tmp.df$p_value[coxph_object.summary.coef.df$`Pr(>|z|)` <= 0.001] = "<0.001"

    tmp.df$star = "   "
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
    # out = out %>% as.tibble
    row.names(out) = NULL
    out
}



#@ test) function.clogit_object.summary.OR() - clogit object ----
library(tidyverse)
library(survival)
logan2 = data.frame(
    survival::logan[rep(1:nrow(survival::logan), length(levels(survival::logan$occupation))), ]
    , id = rep(1:nrow(survival::logan), length(levels(survival::logan$occupation)))
    , tocc = factor(rep(levels(survival::logan$occupation), each = nrow(survival::logan)))
)
logan2$case = (logan2$occupation == logan2$tocc)
logan2 = logan2[order(logan2$id), ]
logan2 %>% as.tibble
# > logan2 %>% as.tibble
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
clogit_object %>% function.coxph_object.summary.OR
# > clogit_object = clogit(case ~ tocc + tocc:education + strata(id), logan2)
# Warning message:
# In coxph(formula = Surv(rep(1, 4190L), case) ~ tocc + tocc:education +  :
#   X matrix deemed to be singular; variable 9
# > clogit_object %>% function.coxph_object.summary.OR
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
# In function.coxph_object.summary.OR(.) : "clogit" %in% class(coxph_object)



#@ end -----
