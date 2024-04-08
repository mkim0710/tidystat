#@ function.svyglm.MainModel.byEffectModifier.dev.r


function.glm_object.summary.exp = function(glm_object, sprintf_fmt_decimal = 2, coef.exp = T, p.adjust_method = c("fdr", "bonferroni"), allow_multple_spaces = T) {
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
    # out = out %>% as.tibble
    row.names(out) = NULL
    out
}





#@@@@ data.SSQ_5_6 =====
library(tidyverse)
load(url("https://github.com/mkim0710/tidystat/raw/master/data/data.SSQ_5_6.rda"))
library(survey)
data.svydesign = data.SSQ_5_6 %>% svydesign(id = ~PSUNEST+HHNEST, strata = ~BOROSTRATUM, weights = ~CAPI_WT, nest = TRUE, data = . , pps="brewer")
data.US_BORN_T.svydesign = data.SSQ_5_6 %>% filter(US_BORN == "1: US-Born, 50 States, DC, PR and Territories") %>% select(-US_BORN) %>% svydesign(id = ~PSUNEST+HHNEST, strata = ~BOROSTRATUM, weights = ~CAPI_WT, nest = TRUE, data = . , pps="brewer")
data.US_BORN_F.svydesign = data.SSQ_5_6 %>% filter(US_BORN == "2: Other") %>% select(-US_BORN) %>% svydesign(id = ~PSUNEST+HHNEST, strata = ~BOROSTRATUM, weights = ~CAPI_WT, nest = TRUE, data = . , pps="brewer")
data.Depressed.svydesign = data.SSQ_5_6 %>% filter(DXDEPRESSION %in% c("1: Depressed and previously diagnosed", "2: Depressed and no diagnosis")) %>% svydesign(id = ~PSUNEST+HHNEST, strata = ~BOROSTRATUM, weights = ~CAPI_WT, nest = TRUE, data = . , pps="brewer")


#@ tables for manuscript - main effects model () ====

svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGRP5C + RACE + MARITAL_Married + INC25K + POVGROUP6_0812CT + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
    rename_all(toupper)

svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGRP5C + RACE + MARITAL_Married + INC25K + POVGROUP6_0812CT + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
    rename_if(is.character, toupper)

svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGRP5C + RACE + MARITAL_Married + INC25K + POVGROUP6_0812CT + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
    rename_if(.predicate = function(v) {(v == "rowname")}, toupper)
# > svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGRP5C + RACE + MARITAL_Married + INC25K + POVGROUP6_0812CT + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
# +     rename_if(.predicate = function(v) {(v == "rowname")}, toupper)
# Error in selected[[i]] <- .p(.tbl[[tibble_vars[[i]]]], ...) : 
#   more elements supplied than there are to replace

svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGRP5C + RACE + MARITAL_Married + INC25K + POVGROUP6_0812CT + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
    rename_if(.predicate = function(x) {(names(x) == "rowname")}, toupper)
# > svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGRP5C + RACE + MARITAL_Married + INC25K + POVGROUP6_0812CT + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
# +     rename_if(.predicate = function(x) {(names(x) == "rowname")}, toupper)
# Error in selected[[i]] <- .p(.tbl[[tibble_vars[[i]]]], ...) : 
#   replacement has length zero


svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGRP5C + RACE + MARITAL_Married + INC25K + POVGROUP6_0812CT + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
    rename_if(.predicate = function(x) {print(names(x)); (names(x) == "rowname")}, toupper)
# > svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGRP5C + RACE + MARITAL_Married + INC25K + POVGROUP6_0812CT + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
# +     rename_if(.predicate = function(x) {print(names(x)); (names(x) == "rowname")}, toupper)
# NULL
# Error in selected[[i]] <- .p(.tbl[[tibble_vars[[i]]]], ...) : 
#   replacement has length zero


(
    svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGRP5C + RACE + MARITAL_Married + INC25K + POVGROUP6_0812CT + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% rename_if(
        .predicate = function(x) {
            # print(names(x))
            # parent.x = get("selected", envir = parent.frame())
            # i = which(map_lgl(parent.x, function(children_from_parent.x) { identical(children_from_parent.x, x) } ))
            # print(i)
            # (i == "rowname")
            # browser()
            # # Browse[1]> ls()
            # # [1] "x"
            # # Browse[1]> x
            # # [1] "(Intercept)"                                              "SSQ_5_62: partially adequate"                            
            # # [3] "SSQ_5_63: adequate"                                       "US_BORN2: Other"                                         
            # # [5] "GENDER2: Female"                                          "AGEGRP5C2: 30-39"                                        
            # # [7] "AGEGRP5C3: 40-49"                                         "AGEGRP5C4: 50-59"                                        
            # # [9] "AGEGRP5C5: 60 and over"                                   "RACE2: Non-Hispanic Black"                               
            # # [11] "RACE3: Hispanic"                                          "RACE4: Asian"                                            
            # # [13] "RACE5: Other"                                             "MARITAL_MarriedTRUE"                                     
            # # [15] "INC25K2: $25,000 - $49,999"                               "INC25K3: $50,000 - $74,999"                              
            # # [17] "INC25K4: $75,000 - $99,999"                               "INC25K5: $100,000  or more"                              
            # # [19] "POVGROUP6_0812CT2: 5 to <10%"                             "POVGROUP6_0812CT3: 10 to <20%"                           
            # # [21] "POVGROUP6_0812CT4: 20 to <30%"                            "POVGROUP6_0812CT5: 30 to <40%"                           
            # # [23] "POVGROUP6_0812CT6: 40% to 100% (very high poverty areas)" "EDU4CAT_collegeTRUE"                                     
            # # [25] "HIQ_62: No"                                               "HUQ_3_lt_1yearTRUE"                                      
            # # Browse[1]> ls(envir = parent.frame())
            # # [1] "i"           "n"           "selected"    "tibble_vars"
            # # Browse[1]> get("i", envir = parent.frame())
            # # [1] 1
            # # Browse[1]> get("n", envir = parent.frame())
            # # [1] 4
            # # Browse[1]> get("selected", envir = parent.frame())
            # # [1] NA NA NA NA
            # # Browse[1]> get("tibble_vars", envir = parent.frame())
            # # [1] "rowname" "ORCI"    "p_value" "star"   
            get("tibble_vars", envir = parent.frame())[get("i", envir = parent.frame())] != "rowname"
        }
        , function(chr) paste0(chr, ".11var")
    )
)
#                                                     rowname         ORCI.11var p_value.11var star.11var
# 1                                               (Intercept) 0.95 (0.18 ~ 4.95)         0.949           
# 2                              SSQ_5_62: partially adequate 1.02 (0.51 ~ 2.04)         0.954           
# 3                                        SSQ_5_63: adequate 0.32 (0.15 ~ 0.70)         0.005        ** 
# 4                                           US_BORN2: Other 0.72 (0.42 ~ 1.25)         0.251           
# 5                                           GENDER2: Female 2.36 (1.47 ~ 3.79)        <0.001        ***
# 6                                          AGEGRP5C2: 30-39 0.87 (0.36 ~ 2.11)         0.756           
# 7                                          AGEGRP5C3: 40-49 0.69 (0.31 ~ 1.55)         0.377           
# 8                                          AGEGRP5C4: 50-59 0.90 (0.39 ~ 2.07)         0.797           
# 9                                    AGEGRP5C5: 60 and over 0.43 (0.17 ~ 1.06)         0.070           
# 10                                RACE2: Non-Hispanic Black 0.48 (0.23 ~ 1.01)         0.055           
# 11                                          RACE3: Hispanic 0.66 (0.32 ~ 1.35)         0.260           
# 12                                             RACE4: Asian 0.33 (0.09 ~ 1.16)         0.087           
# 13                                             RACE5: Other 0.97 (0.37 ~ 2.52)         0.944           
# 14                                      MARITAL_MarriedTRUE 1.23 (0.70 ~ 2.18)         0.475           
# 15                               INC25K2: $25,000 - $49,999 0.65 (0.35 ~ 1.19)         0.163           
# 16                               INC25K3: $50,000 - $74,999 0.68 (0.30 ~ 1.53)         0.350           
# 17                               INC25K4: $75,000 - $99,999 0.11 (0.02 ~ 0.54)         0.008        ** 
# 18                               INC25K5: $100,000  or more 0.15 (0.04 ~ 0.58)         0.007        ** 
# 19                             POVGROUP6_0812CT2: 5 to <10% 0.41 (0.15 ~ 1.08)         0.075           
# 20                            POVGROUP6_0812CT3: 10 to <20% 0.46 (0.16 ~ 1.35)         0.160           
# 21                            POVGROUP6_0812CT4: 20 to <30% 0.96 (0.33 ~ 2.78)         0.933           
# 22                            POVGROUP6_0812CT5: 30 to <40% 0.81 (0.27 ~ 2.41)         0.699           
# 23 POVGROUP6_0812CT6: 40% to 100% (very high poverty areas) 0.61 (0.19 ~ 2.00)         0.418           
# 24                                      EDU4CAT_collegeTRUE 0.73 (0.38 ~ 1.40)         0.340           
# 25                                               HIQ_62: No 0.65 (0.32 ~ 1.29)         0.218           
# 26                                       HUQ_3_lt_1yearTRUE 0.93 (0.43 ~ 1.97)         0.841 



(
    svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGRP5C + RACE + MARITAL_Married + INC25K + POVGROUP6_0812CT + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
        rename_if(
            function(x) {get("tibble_vars", envir = parent.frame())[get("i", envir = parent.frame())] != "rowname"}
            , function(chr) paste0(chr, ".11var")
        ) 
) %>% full_join(
    svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGROUP + RACE_White + MARITAL_Married + INC25KMOD_gt75k + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
        rename_if(
            function(x) {get("tibble_vars", envir = parent.frame())[get("i", envir = parent.frame())] != "rowname"}
            , function(chr) paste0(chr, ".10var")
        ) 
)
# > (
# +     svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGRP5C + RACE + MARITAL_Married + INC25K + POVGROUP6_0812CT + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
# +         rename_if(
# +             function(x) {get("tibble_vars", envir = parent.frame())[get("i", envir = parent.frame())] != "rowname"}
# +             , function(chr) paste0(chr, ".11var")
# +         ) 
# + ) %>% full_join(
# +     svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGROUP + RACE_White + MARITAL_Married + INC25KMOD_gt75k + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
# +         rename_if(
# +             function(x) {get("tibble_vars", envir = parent.frame())[get("i", envir = parent.frame())] != "rowname"}
# +             , function(chr) paste0(chr, ".10var")
# +         ) 
# + )
# Joining, by = "rowname"
#                                                     rowname         ORCI.11var p_value.11var star.11var         ORCI.10var p_value.10var star.10var
# 1                                               (Intercept) 0.95 (0.18 ~ 4.95)         0.949            0.33 (0.11 ~ 0.97)         0.046        *  
# 2                              SSQ_5_62: partially adequate 1.02 (0.51 ~ 2.04)         0.954            1.01 (0.54 ~ 1.89)         0.975           
# 3                                        SSQ_5_63: adequate 0.32 (0.15 ~ 0.70)         0.005        **  0.28 (0.15 ~ 0.53)        <0.001        ***
# 4                                           US_BORN2: Other 0.72 (0.42 ~ 1.25)         0.251            0.62 (0.39 ~ 0.99)         0.049        *  
# 5                                           GENDER2: Female 2.36 (1.47 ~ 3.79)        <0.001        *** 2.33 (1.43 ~ 3.81)        <0.001        ***
# 6                                          AGEGRP5C2: 30-39 0.87 (0.36 ~ 2.11)         0.756                          <NA>          <NA>       <NA>
# 7                                          AGEGRP5C3: 40-49 0.69 (0.31 ~ 1.55)         0.377                          <NA>          <NA>       <NA>
# 8                                          AGEGRP5C4: 50-59 0.90 (0.39 ~ 2.07)         0.797                          <NA>          <NA>       <NA>
# 9                                    AGEGRP5C5: 60 and over 0.43 (0.17 ~ 1.06)         0.070                          <NA>          <NA>       <NA>
# 10                                RACE2: Non-Hispanic Black 0.48 (0.23 ~ 1.01)         0.055                          <NA>          <NA>       <NA>
# 11                                          RACE3: Hispanic 0.66 (0.32 ~ 1.35)         0.260                          <NA>          <NA>       <NA>
# 12                                             RACE4: Asian 0.33 (0.09 ~ 1.16)         0.087                          <NA>          <NA>       <NA>
# 13                                             RACE5: Other 0.97 (0.37 ~ 2.52)         0.944                          <NA>          <NA>       <NA>
# 14                                      MARITAL_MarriedTRUE 1.23 (0.70 ~ 2.18)         0.475            1.06 (0.65 ~ 1.73)         0.828           
# 15                               INC25K2: $25,000 - $49,999 0.65 (0.35 ~ 1.19)         0.163                          <NA>          <NA>       <NA>
# 16                               INC25K3: $50,000 - $74,999 0.68 (0.30 ~ 1.53)         0.350                          <NA>          <NA>       <NA>
# 17                               INC25K4: $75,000 - $99,999 0.11 (0.02 ~ 0.54)         0.008        **                <NA>          <NA>       <NA>
# 18                               INC25K5: $100,000  or more 0.15 (0.04 ~ 0.58)         0.007        **                <NA>          <NA>       <NA>
# 19                             POVGROUP6_0812CT2: 5 to <10% 0.41 (0.15 ~ 1.08)         0.075                          <NA>          <NA>       <NA>
# 20                            POVGROUP6_0812CT3: 10 to <20% 0.46 (0.16 ~ 1.35)         0.160                          <NA>          <NA>       <NA>
# 21                            POVGROUP6_0812CT4: 20 to <30% 0.96 (0.33 ~ 2.78)         0.933                          <NA>          <NA>       <NA>
# 22                            POVGROUP6_0812CT5: 30 to <40% 0.81 (0.27 ~ 2.41)         0.699                          <NA>          <NA>       <NA>
# 23 POVGROUP6_0812CT6: 40% to 100% (very high poverty areas) 0.61 (0.19 ~ 2.00)         0.418                          <NA>          <NA>       <NA>
# 24                                      EDU4CAT_collegeTRUE 0.73 (0.38 ~ 1.40)         0.340            0.58 (0.32 ~ 1.08)         0.087           
# 25                                               HIQ_62: No 0.65 (0.32 ~ 1.29)         0.218            0.69 (0.36 ~ 1.29)         0.244           
# 26                                       HUQ_3_lt_1yearTRUE 0.93 (0.43 ~ 1.97)         0.841            0.88 (0.42 ~ 1.85)         0.731           
# 27                                         AGEGROUP2: 40-59               <NA>          <NA>       <NA> 0.84 (0.49 ~ 1.43)         0.511           
# 28                                           AGEGROUP3: 60+               <NA>          <NA>       <NA> 0.55 (0.28 ~ 1.07)         0.079           
# 29                                           RACE_WhiteTRUE               <NA>          <NA>       <NA> 1.29 (0.77 ~ 2.16)         0.335           
# 30                                      INC25KMOD_gt75kTRUE               <NA>          <NA>       <NA> 0.21 (0.09 ~ 0.52)        <0.001        ***



(
    svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGRP5C + RACE + MARITAL_Married + INC25K + POVGROUP6_0812CT + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
        set_names(if_else(names(.) %in% "rowname", names(.), paste0('prefix.', names(.))))
)



(
    svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGRP5C + RACE + MARITAL_Married + INC25K + POVGROUP6_0812CT + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
        set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".11var")))
) %>% full_join(
    svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGROUP + RACE_White + MARITAL_Married + INC25KMOD_gt75k + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
        set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".10var")))
) %>% 
    as.data.frame
# > (
# +     svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGRP5C + RACE + MARITAL_Married + INC25K + POVGROUP6_0812CT + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
# +         set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".11var")))
# + ) %>% full_join(
# +     svyglm(Depressed ~ SSQ_5_6 + US_BORN + GENDER + AGEGROUP + RACE_White + MARITAL_Married + INC25KMOD_gt75k + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
# +         set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".10var")))
# + ) %>% 
# +     as.data.frame
# Joining, by = "rowname"
#                                                     rowname         ORCI.11var p_value.11var star.11var         ORCI.10var p_value.10var star.10var
# 1                                               (Intercept) 0.95 (0.18 ~ 4.95)         0.949            0.33 (0.11 ~ 0.97)         0.046        *  
# 2                              SSQ_5_62: partially adequate 1.02 (0.51 ~ 2.04)         0.954            1.01 (0.54 ~ 1.89)         0.975           
# 3                                        SSQ_5_63: adequate 0.32 (0.15 ~ 0.70)         0.005        **  0.28 (0.15 ~ 0.53)        <0.001        ***
# 4                                           US_BORN2: Other 0.72 (0.42 ~ 1.25)         0.251            0.62 (0.39 ~ 0.99)         0.049        *  
# 5                                           GENDER2: Female 2.36 (1.47 ~ 3.79)        <0.001        *** 2.33 (1.43 ~ 3.81)        <0.001        ***
# 6                                          AGEGRP5C2: 30-39 0.87 (0.36 ~ 2.11)         0.756                          <NA>          <NA>       <NA>
# 7                                          AGEGRP5C3: 40-49 0.69 (0.31 ~ 1.55)         0.377                          <NA>          <NA>       <NA>
# 8                                          AGEGRP5C4: 50-59 0.90 (0.39 ~ 2.07)         0.797                          <NA>          <NA>       <NA>
# 9                                    AGEGRP5C5: 60 and over 0.43 (0.17 ~ 1.06)         0.070                          <NA>          <NA>       <NA>
# 10                                RACE2: Non-Hispanic Black 0.48 (0.23 ~ 1.01)         0.055                          <NA>          <NA>       <NA>
# 11                                          RACE3: Hispanic 0.66 (0.32 ~ 1.35)         0.260                          <NA>          <NA>       <NA>
# 12                                             RACE4: Asian 0.33 (0.09 ~ 1.16)         0.087                          <NA>          <NA>       <NA>
# 13                                             RACE5: Other 0.97 (0.37 ~ 2.52)         0.944                          <NA>          <NA>       <NA>
# 14                                      MARITAL_MarriedTRUE 1.23 (0.70 ~ 2.18)         0.475            1.06 (0.65 ~ 1.73)         0.828           
# 15                               INC25K2: $25,000 - $49,999 0.65 (0.35 ~ 1.19)         0.163                          <NA>          <NA>       <NA>
# 16                               INC25K3: $50,000 - $74,999 0.68 (0.30 ~ 1.53)         0.350                          <NA>          <NA>       <NA>
# 17                               INC25K4: $75,000 - $99,999 0.11 (0.02 ~ 0.54)         0.008        **                <NA>          <NA>       <NA>
# 18                               INC25K5: $100,000  or more 0.15 (0.04 ~ 0.58)         0.007        **                <NA>          <NA>       <NA>
# 19                             POVGROUP6_0812CT2: 5 to <10% 0.41 (0.15 ~ 1.08)         0.075                          <NA>          <NA>       <NA>
# 20                            POVGROUP6_0812CT3: 10 to <20% 0.46 (0.16 ~ 1.35)         0.160                          <NA>          <NA>       <NA>
# 21                            POVGROUP6_0812CT4: 20 to <30% 0.96 (0.33 ~ 2.78)         0.933                          <NA>          <NA>       <NA>
# 22                            POVGROUP6_0812CT5: 30 to <40% 0.81 (0.27 ~ 2.41)         0.699                          <NA>          <NA>       <NA>
# 23 POVGROUP6_0812CT6: 40% to 100% (very high poverty areas) 0.61 (0.19 ~ 2.00)         0.418                          <NA>          <NA>       <NA>
# 24                                      EDU4CAT_collegeTRUE 0.73 (0.38 ~ 1.40)         0.340            0.58 (0.32 ~ 1.08)         0.087           
# 25                                               HIQ_62: No 0.65 (0.32 ~ 1.29)         0.218            0.69 (0.36 ~ 1.29)         0.244           
# 26                                       HUQ_3_lt_1yearTRUE 0.93 (0.43 ~ 1.97)         0.841            0.88 (0.42 ~ 1.85)         0.731           
# 27                                         AGEGROUP2: 40-59               <NA>          <NA>       <NA> 0.84 (0.49 ~ 1.43)         0.511           
# 28                                           AGEGROUP3: 60+               <NA>          <NA>       <NA> 0.55 (0.28 ~ 1.07)         0.079           
# 29                                           RACE_WhiteTRUE               <NA>          <NA>       <NA> 1.29 (0.77 ~ 2.16)         0.335           
# 30                                      INC25KMOD_gt75kTRUE               <NA>          <NA>       <NA> 0.21 (0.09 ~ 0.52)        <0.001        ***






(
    svyglm(Depressed ~ SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
        set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".10var")))
) %>% full_join(
    svyglm(Depressed ~ SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
        set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".6var")))
) %>% full_join(
    svyglm(Depressed ~ SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
        set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".4var")))
) %>% 
    as.data.frame
# > (
# +     svyglm(Depressed ~ SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
# +         set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".10var")))
# + ) %>% full_join(
# +     svyglm(Depressed ~ SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
# +         set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".6var")))
# + ) %>% full_join(
# +     svyglm(Depressed ~ SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
# +         set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".4var")))
# + ) %>% 
# +     as.data.frame
# Joining, by = "rowname"
# Joining, by = "rowname"
#                 rowname         ORCI.10var p_value.10var star.10var          ORCI.6var p_value.6var star.6var          ORCI.4var p_value.4var star.4var
# 1           (Intercept) 0.43 (0.15 ~ 1.27)         0.130            0.33 (0.18 ~ 0.59)       <0.001       *** 0.27 (0.17 ~ 0.44)       <0.001       ***
# 2  SSQ_5_6_adequateTRUE 0.29 (0.18 ~ 0.47)        <0.001        *** 0.34 (0.21 ~ 0.54)       <0.001       *** 0.36 (0.22 ~ 0.57)       <0.001       ***
# 3       US_BORN2: Other 0.61 (0.38 ~ 0.98)         0.044        *   0.63 (0.40 ~ 1.01)        0.055           0.61 (0.38 ~ 0.97)        0.038       *  
# 4       GENDER2: Female 2.42 (1.46 ~ 4.00)        <0.001        *** 2.01 (1.28 ~ 3.18)        0.003       **  2.00 (1.27 ~ 3.16)        0.003       ** 
# 5        INC10K_integer 0.85 (0.76 ~ 0.95)         0.004        **  0.85 (0.78 ~ 0.93)       <0.001       *** 0.87 (0.80 ~ 0.94)       <0.001       ***
# 6      AGEGROUP2: 40-59 0.99 (0.57 ~ 1.70)         0.965            0.89 (0.54 ~ 1.45)        0.629                         <NA>         <NA>      <NA>
# 7        AGEGROUP3: 60+ 0.48 (0.23 ~ 1.04)         0.064            0.52 (0.27 ~ 1.00)        0.053                         <NA>         <NA>      <NA>
# 8        RACE_WhiteTRUE 1.66 (0.98 ~ 2.83)         0.064            1.18 (0.70 ~ 1.98)        0.533                         <NA>         <NA>      <NA>
# 9   MARITAL_MarriedTRUE 1.18 (0.69 ~ 2.02)         0.542                          <NA>         <NA>      <NA>               <NA>         <NA>      <NA>
# 10  EDU4CAT_collegeTRUE 0.59 (0.32 ~ 1.08)         0.091                          <NA>         <NA>      <NA>               <NA>         <NA>      <NA>
# 11           HIQ_62: No 0.69 (0.34 ~ 1.37)         0.285                          <NA>         <NA>      <NA>               <NA>         <NA>      <NA>
# 12   HUQ_3_lt_1yearTRUE 0.96 (0.43 ~ 2.14)         0.928                          <NA>         <NA>      <NA>               <NA>         <NA>      <NA>




#@@ main effect vs. interaction ======

(
    svyglm(Depressed ~ SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
        set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".10var")))
) %>% full_join(
    svyglm(Depressed ~ SSQ_5_6_adequate * US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
        set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".10var.inter")))
) %>% 
    as.data.frame
# > (
# +     svyglm(Depressed ~ SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
# +         set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".10var")))
# + ) %>% full_join(
# +     svyglm(Depressed ~ SSQ_5_6_adequate * US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
# +         set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".10var.inter")))
# + ) %>% 
# +     as.data.frame
# Joining, by = "rowname"
#                                 rowname         ORCI.10var p_value.10var star.10var   ORCI.10var.inter p_value.10var.inter star.10var.inter
# 1                           (Intercept) 0.43 (0.15 ~ 1.27)         0.130            0.53 (0.18 ~ 1.56)               0.255                 
# 2                  SSQ_5_6_adequateTRUE 0.29 (0.18 ~ 0.47)        <0.001        *** 0.18 (0.10 ~ 0.33)              <0.001              ***
# 3                       US_BORN2: Other 0.61 (0.38 ~ 0.98)         0.044        *   0.34 (0.16 ~ 0.69)               0.003              ** 
# 4                       GENDER2: Female 2.42 (1.46 ~ 4.00)        <0.001        *** 2.42 (1.44 ~ 4.05)               0.001              ** 
# 5                        INC10K_integer 0.85 (0.76 ~ 0.95)         0.004        **  0.85 (0.76 ~ 0.95)               0.004              ** 
# 6                      AGEGROUP2: 40-59 0.99 (0.57 ~ 1.70)         0.965            0.99 (0.57 ~ 1.72)               0.980                 
# 7                        AGEGROUP3: 60+ 0.48 (0.23 ~ 1.04)         0.064            0.48 (0.22 ~ 1.03)               0.061                 
# 8                        RACE_WhiteTRUE 1.66 (0.98 ~ 2.83)         0.064            1.71 (1.00 ~ 2.93)               0.052                 
# 9                   MARITAL_MarriedTRUE 1.18 (0.69 ~ 2.02)         0.542            1.20 (0.69 ~ 2.08)               0.529                 
# 10                  EDU4CAT_collegeTRUE 0.59 (0.32 ~ 1.08)         0.091            0.60 (0.33 ~ 1.09)               0.098                 
# 11                           HIQ_62: No 0.69 (0.34 ~ 1.37)         0.285            0.66 (0.33 ~ 1.34)               0.256                 
# 12                   HUQ_3_lt_1yearTRUE 0.96 (0.43 ~ 2.14)         0.928            1.00 (0.43 ~ 2.34)               0.999                 
# 13 SSQ_5_6_adequateTRUE:US_BORN2: Other               <NA>          <NA>       <NA> 3.23 (1.17 ~ 8.93)               0.025              *  

# (
#     svyglm(Depressed ~ SSQ_5_6_adequate + US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
#         set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".10var")))
# ) %>% full_join(
#     svyglm(Depressed ~ SSQ_5_6_adequate * US_BORN + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
#         set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".10var.inter")))
# ) %>% 
#     openxlsx::write.xlsx("svyglm 10var vs 10var.inter.xlsx")
# openxlsx::openXL("svyglm 10var vs 10var.inter.xlsx")





#@@ US_BORN_T vs US_BORN_F -----------

(
    svyglm(Depressed ~ SSQ_5_6_adequate + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.US_BORN_T.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
        set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), "US_BORN_T.10var")))
) %>% full_join(
    svyglm(Depressed ~ SSQ_5_6_adequate + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.US_BORN_F.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
        set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), "US_BORN_F.10var")))
) %>% 
    as.data.frame
# > (
# +     svyglm(Depressed ~ SSQ_5_6_adequate + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.US_BORN_T.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
# +         set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), "US_BORN_T.10var")))
# + ) %>% full_join(
# +     svyglm(Depressed ~ SSQ_5_6_adequate + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.US_BORN_F.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
# +         set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), "US_BORN_F.10var")))
# + ) %>% 
# +     as.data.frame
# Joining, by = "rowname"
#                 rowname ORCIUS_BORN_T.10var p_valueUS_BORN_T.10var starUS_BORN_T.10var ORCIUS_BORN_F.10var p_valueUS_BORN_F.10var starUS_BORN_F.10var
# 1           (Intercept)  0.40 (0.14 ~ 1.16)                  0.093                      0.24 (0.03 ~ 2.20)                  0.209                    
# 2  SSQ_5_6_adequateTRUE  0.16 (0.09 ~ 0.30)                 <0.001                 ***  0.64 (0.28 ~ 1.47)                  0.295                    
# 3       GENDER2: Female  2.74 (1.51 ~ 5.00)                  0.001                 **   2.70 (1.00 ~ 7.33)                  0.053                    
# 4        INC10K_integer  0.82 (0.72 ~ 0.94)                  0.005                 **   0.92 (0.77 ~ 1.09)                  0.315                    
# 5      AGEGROUP2: 40-59  0.82 (0.41 ~ 1.64)                  0.581                      1.12 (0.44 ~ 2.86)                  0.811                    
# 6        AGEGROUP3: 60+  0.19 (0.05 ~ 0.79)                  0.024                 *    1.53 (0.44 ~ 5.30)                  0.501                    
# 7        RACE_WhiteTRUE  2.48 (1.18 ~ 5.21)                  0.018                 *    1.04 (0.34 ~ 3.17)                  0.944                    
# 8   MARITAL_MarriedTRUE  0.91 (0.40 ~ 2.07)                  0.826                      1.90 (0.83 ~ 4.32)                  0.130                    
# 9   EDU4CAT_collegeTRUE  0.64 (0.29 ~ 1.43)                  0.281                      0.48 (0.16 ~ 1.50)                  0.212                    
# 10           HIQ_62: No  0.83 (0.31 ~ 2.24)                  0.711                      0.35 (0.12 ~ 1.05)                  0.063                    
# 11   HUQ_3_lt_1yearTRUE  1.56 (0.58 ~ 4.19)                  0.375                      0.47 (0.13 ~ 1.72)                  0.259       

# (
#     svyglm(Depressed ~ SSQ_5_6_adequate + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.US_BORN_T.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
#         set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), "US_BORN_T.10var")))
# ) %>% full_join(
#     svyglm(Depressed ~ SSQ_5_6_adequate + GENDER + INC10K_integer + AGEGROUP + RACE_White + MARITAL_Married + EDU4CAT_college + HIQ_6 + HUQ_3_lt_1year, design = data.US_BORN_F.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
#         set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), "US_BORN_F.10var")))
# ) %>% 
#     openxlsx::write.xlsx("svyglm US_BORN_T.10var vs US_BORN_F.10var.xlsx")
# openxlsx::openXL("svyglm US_BORN_T.10var vs US_BORN_F.10var.xlsx")





#@@@ manuscript table, by(EffectModifier) =====

function.formula2text = function(formula) {
    formula %>% as.character %>% {paste(.[2], .[1], .[3])}
}



function.svyglm.MainModel.interaction = function(
    data.svydesign
    , formula4MainModel
    , subscript4MainModel = "MainModel"
    , varname4ExposureOfInterest = "SSQ_5_6_adequate"
    , varname4EffectModifier = "US_BORN"
    , varname4PrimaryKey = "rowname"
) {
    formula4EffectModifier = formula4MainModel %>%  as.character %>% {paste(.[2], .[1], .[3])} %>% paste0(" + ", varname4ExposureOfInterest, ":", varname4EffectModifier) %>% as.formula
    (
        svyglm(formula4MainModel, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
            set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".", subscript4MainModel)))
    ) %>% full_join(
        svyglm(formula4EffectModifier, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>%
            set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".", subscript4MainModel, ".inter")))
    , by = varname4PrimaryKey) %>% 
        as.data.frame
}
function.svyglm.MainModel.interaction(formula4MainModel = formula4MainModel, data.svydesign = data.svydesign, subscript4MainModel = "10var")  
# > function.svyglm.MainModel.interaction(formula4MainModel = formula4MainModel, data.svydesign = data.svydesign, subscript4MainModel = "10var")
#                                 rowname         ORCI.10var p_value.10var star.10var   ORCI.10var.inter p_value.10var.inter star.10var.inter
# 1                           (Intercept) 0.43 (0.15 ~ 1.27)         0.130            0.53 (0.18 ~ 1.56)               0.255                 
# 2                  SSQ_5_6_adequateTRUE 0.29 (0.18 ~ 0.47)        <0.001        *** 0.18 (0.10 ~ 0.33)              <0.001              ***
# 3                       US_BORN2: Other 0.61 (0.38 ~ 0.98)         0.044        *   0.34 (0.16 ~ 0.69)               0.003              ** 
# 4                       GENDER2: Female 2.42 (1.46 ~ 4.00)        <0.001        *** 2.42 (1.44 ~ 4.05)               0.001              ** 
# 5                        INC10K_integer 0.85 (0.76 ~ 0.95)         0.004        **  0.85 (0.76 ~ 0.95)               0.004              ** 
# 6                      AGEGROUP2: 40-59 0.99 (0.57 ~ 1.70)         0.965            0.99 (0.57 ~ 1.72)               0.980                 
# 7                        AGEGROUP3: 60+ 0.48 (0.23 ~ 1.04)         0.064            0.48 (0.22 ~ 1.03)               0.061                 
# 8                        RACE_WhiteTRUE 1.66 (0.98 ~ 2.83)         0.064            1.71 (1.00 ~ 2.93)               0.052                 
# 9                   MARITAL_MarriedTRUE 1.18 (0.69 ~ 2.02)         0.542            1.20 (0.69 ~ 2.08)               0.529                 
# 10                  EDU4CAT_collegeTRUE 0.59 (0.32 ~ 1.08)         0.091            0.60 (0.33 ~ 1.09)               0.098                 
# 11                           HIQ_62: No 0.69 (0.34 ~ 1.37)         0.285            0.66 (0.33 ~ 1.34)               0.256                 
# 12                   HUQ_3_lt_1yearTRUE 0.96 (0.43 ~ 2.14)         0.928            1.00 (0.43 ~ 2.34)               0.999                 
# 13 SSQ_5_6_adequateTRUE:US_BORN2: Other               <NA>          <NA>       <NA> 3.23 (1.17 ~ 8.93)               0.025              *  


function.svyglm.MainModel.byEffectModifier = function(
    data
    , formula4MainModel
    , subscript4MainModel = "MainModel"
    , varname4Ybin = "Depressed"
    , varname4ExposureOfInterest = "SSQ_5_6_adequate"
    , varname4EffectModifier = "US_BORN"
    , varname4PrimaryKey = "rowname"
    , svydesign.id = ~PSUNEST+HHNEST
    , svydesign.strata = ~BOROSTRATUM
    , svydesign.weights = ~CAPI_WT
    , svydesign.nest = TRUE
    , svydesign.pps="brewer"
    , function.glm_object.summary.exp.allow_multple_spaces = F
) {
    library(survey)
    out.list = list()
    
    data.svydesign = data %>% svydesign(id = svydesign.id, strata = svydesign.strata, weights = svydesign.weights, nest = svydesign.nest, data = . , pps = svydesign.pps)
    # data.svydesign = data.svydesign %>% update(one = 1)

    out.list$MainModel = svyglm(formula4MainModel, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp(allow_multple_spaces = function.glm_object.summary.exp.allow_multple_spaces)
    out.list$MainModel = out.list$MainModel %>% add_column(
        .before = 1
        , nrow = nrow(data)
        # , nYbin = sum(data[[varname4Ybin]] > 0)
        , nYbin = sum(data[[varname4Ybin]] == T)
        , pYbin = nYbin / nrow
        , nrow.wt = data.svydesign %>% update(one = 1) %>% svytotal(~one, .)
        , nYbin.wt = data.svydesign %>% update(tmp = as.numeric(!!rlang::sym(varname4Ybin) == T)) %>% svytotal(~tmp, .)
        , pYbin.wt = data.svydesign %>% update(tmp = as.numeric(!!rlang::sym(varname4Ybin) == T)) %>% svymean(~tmp, .)
    )

    formula4EffectModifier = formula4MainModel %>% as.character %>% {paste(.[2], .[1], .[3])} %>% paste0(" + ", varname4ExposureOfInterest, ":", varname4EffectModifier) %>% as.formula
    out.list$MainModel_and_interaction = svyglm(formula4EffectModifier, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp(allow_multple_spaces = function.glm_object.summary.exp.allow_multple_spaces)
    out.list$MainModel_and_interaction = out.list$MainModel_and_interaction %>% add_column(
        .before = 1
        , nrow = nrow(data)
        # , nYbin = sum(data[[varname4Ybin]] > 0)
        , nYbin = sum(data[[varname4Ybin]] == T)
        , pYbin = nYbin / nrow
        , nrow.wt = data.svydesign %>% update(one = 1) %>% svytotal(~one, .)
        , nYbin.wt = data.svydesign %>% update(tmp = as.numeric(!!rlang::sym(varname4Ybin) == T)) %>% svytotal(~tmp, .)
        , pYbin.wt = data.svydesign %>% update(tmp = as.numeric(!!rlang::sym(varname4Ybin) == T)) %>% svymean(~tmp, .)
    )
    if (is.logical(data[[varname4EffectModifier]])) data[[varname4EffectModifier]] = data[[varname4EffectModifier]] %>% as.factor
    if (is.numeric(data[[varname4EffectModifier]]) & n_distinct(data[[varname4EffectModifier]]) <= 10) data[[varname4EffectModifier]] = data[[varname4EffectModifier]] %>% as.factor
    # if (is.numeric(data[[varname4EffectModifier]]) & n_distinct(data[[varname4EffectModifier]]) <= 12) data[[varname4EffectModifier]] = data[[varname4EffectModifier]] %>% as.factor
    # #  Error in onestrat(x[index, , drop = FALSE], clusters[index], nPSU[index][1],  : 
    # #   Stratum (5) has only one PSU at stage 1 
    # # 29.
    # # stop("Stratum (", stratum, ") has only one PSU at stage ", stage) 
    # # 28.
    # # onestrat(x[index, , drop = FALSE], clusters[index], nPSU[index][1], 
    # #     fpc[index], lonely.psu = lonely.psu, stratum = strata[index][1], 
    # #     stage = stage, cal = cal) 
    # # 27.
    # # FUN(X[[i]], ...) 
    # # 26.
    # # lapply(X = ans[index], FUN = FUN, ...) 
    # # 25.
    # # tapply(1:NROW(x), list(factor(strata)), function(index) {
    # #     onestrat(x[index, , drop = FALSE], clusters[index], nPSU[index][1], 
    # #         fpc[index], lonely.psu = lonely.psu, stratum = strata[index][1], 
    # #         stage = stage, cal = cal) ... 
    # # 24.
    # # onestage(x, stratas[, 1], clusters[, 1], nPSUs[, 1], fpcs[, 1], 
    # #     lonely.psu = lonely.psu, stage = stage, cal = cal) 
    # # 23.
    # # multistage(x, clusters, stratas, fpcs$sampsize, fpcs$popsize, 
    # #     lonely.psu = getOption("survey.lonely.psu"), one.stage = one.stage, 
    # #     stage = 1, cal = cal) 
    # # 22.
    # # svyrecvar(estfun %*% Ainv, design$cluster, design$strata, design$fpc, 
    # #     postStrata = design$postStrata) 
    # # 21.
    # # svy.varcoef(g, design) 
    # # 20.
    # # svyglm.survey.design(formula4MainModel.exc_EffectModifier, design = data.svydesign, 
    # #     family = stats::quasibinomial()) 
    # # 19.
    # # svyglm(formula4MainModel.exc_EffectModifier, design = data.svydesign, 
    # #     family = stats::quasibinomial()) 
    for (i in levels(data[[varname4EffectModifier]])) {
        data.subset = data %>% filter(!!rlang::sym(varname4EffectModifier) == i)
        data.subset.svydesign = data.subset %>% svydesign(id = svydesign.id, strata = svydesign.strata, weights = svydesign.weights, nest = svydesign.nest, data = . , pps = svydesign.pps)
        formula4MainModel.exc_EffectModifier = formula4MainModel %>% as.character %>% {paste(.[2], .[1], .[3])} %>% gsub("\\ ", "", .) %>% gsub(varname4EffectModifier, "", .) %>% gsub("\\~\\+", "~", .) %>% gsub("\\+{2}", "+", .) %>% gsub("\\~", " ~ ", .) %>% gsub("\\+", " + ", .) %>% gsub("\\*", " * ", .) %>% as.formula
        out.list[[i]] = svyglm(formula4MainModel.exc_EffectModifier, design = data.subset.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp(allow_multple_spaces = function.glm_object.summary.exp.allow_multple_spaces)
        out.list[[i]] = out.list[[i]] %>% add_column(
            .before = 1
            , nrow = nrow(data.subset)
            # , nYbin = sum(data.subset[[varname4Ybin]] > 0)
            , nYbin = sum(data.subset[[varname4Ybin]] == T)
            , pYbin = nYbin / nrow
            , nrow.wt = data.subset.svydesign %>% update(one = 1) %>% svytotal(~one, .)
            , nYbin.wt = data.subset.svydesign %>% update(tmp = as.numeric(!!rlang::sym(varname4Ybin) == T)) %>% svytotal(~tmp, .)
            , pYbin.wt = data.subset.svydesign %>% update(tmp = as.numeric(!!rlang::sym(varname4Ybin) == T)) %>% svymean(~tmp, .)
        )
    }

    # formula4EffectModifier = formula4MainModel %>%  as.character %>% {paste(.[2], .[1], .[3])} %>% paste0(" + ", varname4ExposureOfInterest, ":", varname4EffectModifier) %>% as.formula
    # (
    #     svyglm(formula4MainModel, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>% 
    #         set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".", subscript4MainModel)))
    # ) %>% full_join(
    #     svyglm(formula4EffectModifier, design = data.svydesign, family=stats::quasibinomial()) %>% function.glm_object.summary.exp %>% {.[1:4]} %>%
    #         set_names(if_else(names(.) %in% "rowname", names(.), paste0(names(.), ".", subscript4MainModel, ".inter")))
    # , by = varname4PrimaryKey) %>% 
    #     as.data.frame
    out.list$table4manuscript = out.list %>% map(function(df) {
        df[grep(varname4ExposureOfInterest, df[[varname4PrimaryKey]]), c("nrow", "nYbin", "pYbin", "nrow.wt", "nYbin.wt", "pYbin.wt", "rowname", "ORCI", "p_value", "star")]
    }) %>% bind_rows(.id = ".id")
    out.list
}
function.svyglm.MainModel.byEffectModifier(data = data, formula4MainModel = formula4MainModel, subscript4MainModel = "10var")
# > function.svyglm.MainModel.byEffectModifier(data = data, formula4MainModel = formula4MainModel, subscript4MainModel = "10var")
# $`MainModel`
#    nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt              rowname               ORCI p_value star  p.fdr *fdr  p.bon *bon exp(Estimate) exp(2.5 %) exp(97.5 %) Std. Error     t value     Pr(>|t|)
# 1  1527   126 0.08251473 6285749 495869.8 0.07888795          (Intercept) 0.43 (0.15 ~ 1.27)   0.130       0.194       1.000          0.4329902  0.1477463   1.2689353 0.54859086 -1.52580039 1.295267e-01
# 2  1527   126 0.08251473 6285749 495869.8 0.07888795 SSQ_5_6_adequateTRUE 0.29 (0.18 ~ 0.47)  <0.001  *** <0.001  *** <0.001  ***     0.2903023  0.1786736   0.4716723 0.24763812 -4.99451626 1.890931e-06
# 3  1527   126 0.08251473 6285749 495869.8 0.07888795      US_BORN2: Other 0.61 (0.38 ~ 0.98)   0.044  *    0.127       0.529          0.6083437  0.3768176   0.9821252 0.24438142 -2.03376867 4.404168e-02
# 4  1527   126 0.08251473 6285749 495869.8 0.07888795      GENDER2: Female 2.42 (1.46 ~ 4.00)  <0.001  ***  0.005  **   0.010  **      2.4161875  1.4609597   3.9959774 0.25668703  3.43683453 7.943114e-04
# 5  1527   126 0.08251473 6285749 495869.8 0.07888795       INC10K_integer 0.85 (0.76 ~ 0.95)   0.004  **   0.017  *    0.050  .       0.8511238  0.7636852   0.9485739 0.05530817 -2.91453550 4.206060e-03
# 6  1527   126 0.08251473 6285749 495869.8 0.07888795     AGEGROUP2: 40-59 0.99 (0.57 ~ 1.70)   0.965       0.965       1.000          0.9880856  0.5748453   1.6983927 0.27636644 -0.04336982 9.654743e-01
# 7  1527   126 0.08251473 6285749 495869.8 0.07888795       AGEGROUP3: 60+ 0.48 (0.23 ~ 1.04)   0.064       0.127       0.765          0.4838589  0.2261060   1.0354411 0.38816499 -1.87024051 6.373445e-02
# 8  1527   126 0.08251473 6285749 495869.8 0.07888795       RACE_WhiteTRUE 1.66 (0.98 ~ 2.83)   0.064       0.127       0.763          1.6607067  0.9761966   2.8251960 0.27109402  1.87109714 6.361468e-02
# 9  1527   126 0.08251473 6285749 495869.8 0.07888795  MARITAL_MarriedTRUE 1.18 (0.69 ~ 2.02)   0.542       0.651       1.000          1.1815015  0.6919178   2.0175025 0.27300208  0.61093351 5.423270e-01
# 10 1527   126 0.08251473 6285749 495869.8 0.07888795  EDU4CAT_collegeTRUE 0.59 (0.32 ~ 1.08)   0.091       0.156       1.000          0.5924083  0.3241232   1.0827598 0.30769565 -1.70154896 9.126777e-02
# 11 1527   126 0.08251473 6285749 495869.8 0.07888795           HIQ_62: No 0.69 (0.34 ~ 1.37)   0.285       0.381       1.000          0.6851704  0.3433745   1.3671910 0.35247891 -1.07265330 2.854449e-01
# 12 1527   126 0.08251473 6285749 495869.8 0.07888795   HUQ_3_lt_1yearTRUE 0.96 (0.43 ~ 2.14)   0.928       0.965       1.000          0.9637787  0.4342761   2.1388910 0.40673252 -0.09070732 9.278669e-01
# 
# $MainModel_and_interaction
#    nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt                              rowname               ORCI p_value star  p.fdr *fdr  p.bon *bon exp(Estimate) exp(2.5 %) exp(97.5 %) Std. Error      t value     Pr(>|t|)
# 1  1527   126 0.08251473 6285749 495869.8 0.07888795                          (Intercept) 0.53 (0.18 ~ 1.56)   0.255       0.333       1.000          0.5346022  0.1826513   1.5647277 0.54794081 -1.142883319 2.552370e-01
# 2  1527   126 0.08251473 6285749 495869.8 0.07888795                 SSQ_5_6_adequateTRUE 0.18 (0.10 ~ 0.33)  <0.001  *** <0.001  *** <0.001  ***     0.1849169  0.1046152   0.3268573 0.29062637 -5.807624892 4.797257e-08
# 3  1527   126 0.08251473 6285749 495869.8 0.07888795                      US_BORN2: Other 0.34 (0.16 ~ 0.69)   0.003  **   0.012  *    0.044  *       0.3366017  0.1648466   0.6873101 0.36423384 -2.989439130 3.356857e-03
# 4  1527   126 0.08251473 6285749 495869.8 0.07888795                      GENDER2: Female 2.42 (1.44 ~ 4.05)   0.001  **   0.007  **   0.014  *       2.4179468  1.4438482   4.0492253 0.26306954  3.356218117 1.042646e-03
# 5  1527   126 0.08251473 6285749 495869.8 0.07888795                       INC10K_integer 0.85 (0.76 ~ 0.95)   0.004  **   0.012  *    0.047  *       0.8498172  0.7631964   0.9462693 0.05485093 -2.966840568 3.596134e-03
# 6  1527   126 0.08251473 6285749 495869.8 0.07888795                     AGEGROUP2: 40-59 0.99 (0.57 ~ 1.72)   0.980       0.999       1.000          0.9928780  0.5734006   1.7192286 0.28011903 -0.025515896 9.796835e-01
# 7  1527   126 0.08251473 6285749 495869.8 0.07888795                       AGEGROUP3: 60+ 0.48 (0.22 ~ 1.03)   0.061       0.113       0.789          0.4789101  0.2234375   1.0264835 0.38897714 -1.892764976 6.066502e-02
# 8  1527   126 0.08251473 6285749 495869.8 0.07888795                       RACE_WhiteTRUE 1.71 (1.00 ~ 2.93)   0.052       0.113       0.677          1.7125989  1.0003233   2.9320470 0.27433605  1.961142382 5.205062e-02
# 9  1527   126 0.08251473 6285749 495869.8 0.07888795                  MARITAL_MarriedTRUE 1.20 (0.69 ~ 2.08)   0.529       0.625       1.000          1.1960695  0.6863900   2.0842119 0.28334706  0.631877897 5.286025e-01
# 10 1527   126 0.08251473 6285749 495869.8 0.07888795                  EDU4CAT_collegeTRUE 0.60 (0.33 ~ 1.09)   0.098       0.159       1.000          0.6002380  0.3294816   1.0934926 0.30602899 -1.667910688 9.779733e-02
# 11 1527   126 0.08251473 6285749 495869.8 0.07888795                           HIQ_62: No 0.66 (0.33 ~ 1.34)   0.256       0.333       1.000          0.6622993  0.3262320   1.3445658 0.36128666 -1.140473078 2.562354e-01
# 12 1527   126 0.08251473 6285749 495869.8 0.07888795                   HUQ_3_lt_1yearTRUE 1.00 (0.43 ~ 2.34)   0.999       0.999       1.000          0.9993821  0.4266674   2.3408503 0.43425918 -0.001423329 9.988666e-01
# 13 1527   126 0.08251473 6285749 495869.8 0.07888795 SSQ_5_6_adequateTRUE:US_BORN2: Other 3.23 (1.17 ~ 8.93)   0.025  *    0.066  .    0.329          3.2325591  1.1706173   8.9264340 0.51824569  2.263934147 2.527425e-02
# 
# $`1: US-Born, 50 States, DC, PR and Territories`
#    nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt              rowname               ORCI p_value star  p.fdr *fdr  p.bon *bon exp(Estimate) exp(2.5 %) exp(97.5 %) Std. Error    t value     Pr(>|t|)
# 1   851    80 0.09400705 3366499 291459.3 0.08657637          (Intercept) 0.40 (0.14 ~ 1.16)   0.093       0.171       1.000          0.3975311 0.13655272   1.1572889 0.54519487 -1.6920229 9.315306e-02
# 2   851    80 0.09400705 3366499 291459.3 0.08657637 SSQ_5_6_adequateTRUE 0.16 (0.09 ~ 0.30)  <0.001  *** <0.001  *** <0.001  ***     0.1590962 0.08534611   0.2965759 0.31775796 -5.7850520 5.560383e-08
# 3   851    80 0.09400705 3366499 291459.3 0.08657637      GENDER2: Female 2.74 (1.51 ~ 5.00)   0.001  **   0.007  **   0.014  *       2.7449123 1.50568593   5.0040605 0.30638347  3.2957037 1.280502e-03
# 4   851    80 0.09400705 3366499 291459.3 0.08657637       INC10K_integer 0.82 (0.72 ~ 0.94)   0.005  **   0.018  *    0.053  .       0.8194219 0.71514529   0.9389033 0.06944687 -2.8677487 4.859808e-03
# 5   851    80 0.09400705 3366499 291459.3 0.08657637     AGEGROUP2: 40-59 0.82 (0.41 ~ 1.64)   0.581       0.710       1.000          0.8228316 0.41274856   1.6403495 0.35200290 -0.5539832 5.805880e-01
# 6   851    80 0.09400705 3366499 291459.3 0.08657637       AGEGROUP3: 60+ 0.19 (0.05 ~ 0.79)   0.024  *    0.052  .    0.259          0.1933395 0.04745744   0.7876567 0.71665322 -2.2930301 2.353045e-02
# 7   851    80 0.09400705 3366499 291459.3 0.08657637       RACE_WhiteTRUE 2.48 (1.18 ~ 5.21)   0.018  *    0.051  .    0.203          2.4753673 1.17619865   5.2095311 0.37965037  2.3874303 1.847685e-02
# 8   851    80 0.09400705 3366499 291459.3 0.08657637  MARITAL_MarriedTRUE 0.91 (0.40 ~ 2.07)   0.826       0.826       1.000          0.9120618 0.40181878   2.0702284 0.41822529 -0.2200909 8.261623e-01
# 9   851    80 0.09400705 3366499 291459.3 0.08657637  EDU4CAT_collegeTRUE 0.64 (0.29 ~ 1.43)   0.281       0.442       1.000          0.6429960 0.28899420   1.4306303 0.40803396 -1.0823040 2.812177e-01
# 10  851    80 0.09400705 3366499 291459.3 0.08657637           HIQ_62: No 0.83 (0.31 ~ 2.24)   0.711       0.782       1.000          0.8285731 0.30709414   2.2355797 0.50641275 -0.3713378 7.110197e-01
# 11  851    80 0.09400705 3366499 291459.3 0.08657637   HUQ_3_lt_1yearTRUE 1.56 (0.58 ~ 4.19)   0.375       0.515       1.000          1.5644740 0.58445768   4.1877778 0.50236666  0.8908825 3.747175e-01
# 
# $`2: Other`
#    nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt              rowname               ORCI p_value star p.fdr *fdr p.bon *bon exp(Estimate) exp(2.5 %) exp(97.5 %) Std. Error     t value   Pr(>|t|)
# 1   668    44 0.06586826 2879276   194006 0.06738013          (Intercept) 0.24 (0.03 ~ 2.20)   0.209      0.433      1.000          0.2399448 0.02620163    2.197325 1.12991225 -1.26323658 0.20917512
# 2   668    44 0.06586826 2879276   194006 0.06738013 SSQ_5_6_adequateTRUE 0.64 (0.28 ~ 1.47)   0.295      0.433      1.000          0.6403283 0.27931288    1.467961 0.42329777 -1.05309866 0.29460356
# 3   668    44 0.06586826 2879276   194006 0.06738013      GENDER2: Female 2.70 (1.00 ~ 7.33)   0.053      0.348      0.588          2.7022015 0.99587451    7.332142 0.50929550  1.95184684 0.05349839
# 4   668    44 0.06586826 2879276   194006 0.06738013       INC10K_integer 0.92 (0.77 ~ 1.09)   0.315      0.433      1.000          0.9160211 0.77252389    1.086173 0.08692839 -1.00905868 0.31516098
# 5   668    44 0.06586826 2879276   194006 0.06738013     AGEGROUP2: 40-59 1.12 (0.44 ~ 2.86)   0.811      0.893      1.000          1.1209514 0.43973503    2.857475 0.47743772  0.23914698 0.81143662
# 6   668    44 0.06586826 2879276   194006 0.06738013       AGEGROUP3: 60+ 1.53 (0.44 ~ 5.30)   0.501      0.613      1.000          1.5328208 0.44302180    5.303440 0.63330042  0.67441879 0.50146002
# 7   668    44 0.06586826 2879276   194006 0.06738013       RACE_WhiteTRUE 1.04 (0.34 ~ 3.17)   0.944      0.944      1.000          1.0405905 0.34141942    3.171550 0.56859818  0.06997626 0.94433961
# 8   668    44 0.06586826 2879276   194006 0.06738013  MARITAL_MarriedTRUE 1.90 (0.83 ~ 4.32)   0.130      0.433      1.000          1.8974798 0.83375058    4.318354 0.41957281  1.52661610 0.12972679
# 9   668    44 0.06586826 2879276   194006 0.06738013  EDU4CAT_collegeTRUE 0.48 (0.16 ~ 1.50)   0.212      0.433      1.000          0.4832179 0.15542786    1.502302 0.57872801 -1.25670011 0.21152434
# 10  668    44 0.06586826 2879276   194006 0.06738013           HIQ_62: No 0.35 (0.12 ~ 1.05)   0.063      0.348      0.695          0.3531083 0.11906036    1.047246 0.55467557 -1.87673762 0.06320397
# 11  668    44 0.06586826 2879276   194006 0.06738013   HUQ_3_lt_1yearTRUE 0.47 (0.13 ~ 1.72)   0.259      0.433      1.000          0.4742291 0.13083809    1.718867 0.65701711 -1.13553326 0.25862006
# 
# $table4manuscript
#                                             .id nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt                              rowname               ORCI p_value star
# 1                                     MainModel 1527   126 0.08251473 6285749 495869.8 0.07888795                 SSQ_5_6_adequateTRUE 0.29 (0.18 ~ 0.47)  <0.001  ***
# 2                     MainModel_and_interaction 1527   126 0.08251473 6285749 495869.8 0.07888795                 SSQ_5_6_adequateTRUE 0.18 (0.10 ~ 0.33)  <0.001  ***
# 3                     MainModel_and_interaction 1527   126 0.08251473 6285749 495869.8 0.07888795 SSQ_5_6_adequateTRUE:US_BORN2: Other 3.23 (1.17 ~ 8.93)   0.025  *  
# 4 1: US-Born, 50 States, DC, PR and Territories  851    80 0.09400705 3366499 291459.3 0.08657637                 SSQ_5_6_adequateTRUE 0.16 (0.09 ~ 0.30)  <0.001  ***
# 5                                      2: Other  668    44 0.06586826 2879276 194006.0 0.06738013                 SSQ_5_6_adequateTRUE 0.64 (0.28 ~ 1.47)   0.295     


#@ c("AGEGROUP", "GENDER", "US_BORN") %>% {set_names(map(., function(chr) { =====
c("AGEGROUP", "GENDER", "US_BORN") %>% {set_names(map(., function(chr) {
    function.svyglm.MainModel.byEffectModifier(data = data, formula4MainModel = formula4MainModel, subscript4MainModel = "10var", varname4EffectModifier = chr)
}), .)}
# > c("AGEGROUP", "GENDER", "US_BORN") %>% {set_names(map(., function(chr) {
# +     function.svyglm.MainModel.byEffectModifier(data = data, formula4MainModel = formula4MainModel, subscript4MainModel = "10var", varname4EffectModifier = chr)
# + }), .)}
# $`AGEGROUP`
# $`AGEGROUP`$`MainModel`
#    nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt              rowname               ORCI p_value star  p.fdr *fdr  p.bon *bon exp(Estimate) exp(2.5 %) exp(97.5 %) Std. Error     t value     Pr(>|t|)
# 1  1527   126 0.08251473 6285749 495869.8 0.07888795          (Intercept) 0.43 (0.15 ~ 1.27)   0.130       0.194       1.000          0.4329902  0.1477463   1.2689353 0.54859086 -1.52580039 1.295267e-01
# 2  1527   126 0.08251473 6285749 495869.8 0.07888795 SSQ_5_6_adequateTRUE 0.29 (0.18 ~ 0.47)  <0.001  *** <0.001  *** <0.001  ***     0.2903023  0.1786736   0.4716723 0.24763812 -4.99451626 1.890931e-06
# 3  1527   126 0.08251473 6285749 495869.8 0.07888795      US_BORN2: Other 0.61 (0.38 ~ 0.98)   0.044  *    0.127       0.529          0.6083437  0.3768176   0.9821252 0.24438142 -2.03376867 4.404168e-02
# 4  1527   126 0.08251473 6285749 495869.8 0.07888795      GENDER2: Female 2.42 (1.46 ~ 4.00)  <0.001  ***  0.005  **   0.010  **      2.4161875  1.4609597   3.9959774 0.25668703  3.43683453 7.943114e-04
# 5  1527   126 0.08251473 6285749 495869.8 0.07888795       INC10K_integer 0.85 (0.76 ~ 0.95)   0.004  **   0.017  *    0.050  .       0.8511238  0.7636852   0.9485739 0.05530817 -2.91453550 4.206060e-03
# 6  1527   126 0.08251473 6285749 495869.8 0.07888795     AGEGROUP2: 40-59 0.99 (0.57 ~ 1.70)   0.965       0.965       1.000          0.9880856  0.5748453   1.6983927 0.27636644 -0.04336982 9.654743e-01
# 7  1527   126 0.08251473 6285749 495869.8 0.07888795       AGEGROUP3: 60+ 0.48 (0.23 ~ 1.04)   0.064       0.127       0.765          0.4838589  0.2261060   1.0354411 0.38816499 -1.87024051 6.373445e-02
# 8  1527   126 0.08251473 6285749 495869.8 0.07888795       RACE_WhiteTRUE 1.66 (0.98 ~ 2.83)   0.064       0.127       0.763          1.6607067  0.9761966   2.8251960 0.27109402  1.87109714 6.361468e-02
# 9  1527   126 0.08251473 6285749 495869.8 0.07888795  MARITAL_MarriedTRUE 1.18 (0.69 ~ 2.02)   0.542       0.651       1.000          1.1815015  0.6919178   2.0175025 0.27300208  0.61093351 5.423270e-01
# 10 1527   126 0.08251473 6285749 495869.8 0.07888795  EDU4CAT_collegeTRUE 0.59 (0.32 ~ 1.08)   0.091       0.156       1.000          0.5924083  0.3241232   1.0827598 0.30769565 -1.70154896 9.126777e-02
# 11 1527   126 0.08251473 6285749 495869.8 0.07888795           HIQ_62: No 0.69 (0.34 ~ 1.37)   0.285       0.381       1.000          0.6851704  0.3433745   1.3671910 0.35247891 -1.07265330 2.854449e-01
# 12 1527   126 0.08251473 6285749 495869.8 0.07888795   HUQ_3_lt_1yearTRUE 0.96 (0.43 ~ 2.14)   0.928       0.965       1.000          0.9637787  0.4342761   2.1388910 0.40673252 -0.09070732 9.278669e-01
# 
# $`AGEGROUP`$MainModel_and_interaction
#    nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt                               rowname               ORCI p_value star p.fdr *fdr p.bon *bon exp(Estimate) exp(2.5 %) exp(97.5 %) Std. Error     t value     Pr(>|t|)
# 1  1527   126 0.08251473 6285749 495869.8 0.07888795                           (Intercept) 0.43 (0.14 ~ 1.29)   0.135      0.236      1.000          0.4321977  0.1448271   1.2897784 0.55783816 -1.50379146 0.1351374973
# 2  1527   126 0.08251473 6285749 495869.8 0.07888795                  SSQ_5_6_adequateTRUE 0.29 (0.14 ~ 0.57)  <0.001  *** 0.004  **  0.007  **      0.2872816  0.1444164   0.5714776 0.35090556 -3.55449581 0.0005339833
# 3  1527   126 0.08251473 6285749 495869.8 0.07888795                       US_BORN2: Other 0.61 (0.38 ~ 0.98)   0.044  *   0.153      0.612          0.6069162  0.3754224   0.9811543 0.24507540 -2.03759554 0.0436842124
# 4  1527   126 0.08251473 6285749 495869.8 0.07888795                       GENDER2: Female 2.45 (1.49 ~ 4.00)  <0.001  *** 0.004  **  0.007  **      2.4457978  1.4942273   4.0033582 0.25141389  3.55736666 0.0005287138
# 5  1527   126 0.08251473 6285749 495869.8 0.07888795                        INC10K_integer 0.85 (0.76 ~ 0.95)   0.004  **  0.019  *   0.056  .       0.8509177  0.7639402   0.9477980 0.05501426 -2.93450853 0.0039710127
# 6  1527   126 0.08251473 6285749 495869.8 0.07888795                      AGEGROUP2: 40-59 1.03 (0.47 ~ 2.23)   0.948      0.948      1.000          1.0263718  0.4727820   2.2281709 0.39549244  0.06581686 0.9476279497
# 7  1527   126 0.08251473 6285749 495869.8 0.07888795                        AGEGROUP3: 60+ 0.44 (0.18 ~ 1.07)   0.073      0.170      1.000          0.4414491  0.1821021   1.0701540 0.45179156 -1.80988909 0.0726964277
# 8  1527   126 0.08251473 6285749 495869.8 0.07888795                        RACE_WhiteTRUE 1.66 (0.98 ~ 2.82)   0.063      0.170      0.889          1.6596109  0.9765485   2.8204523 0.27057337  1.87225814 0.0634889283
# 9  1527   126 0.08251473 6285749 495869.8 0.07888795                   MARITAL_MarriedTRUE 1.18 (0.69 ~ 2.02)   0.544      0.762      1.000          1.1805055  0.6914136   2.0155711 0.27294370  0.60797431 0.5442988138
# 10 1527   126 0.08251473 6285749 495869.8 0.07888795                   EDU4CAT_collegeTRUE 0.59 (0.33 ~ 1.08)   0.089      0.178      1.000          0.5919682  0.3250899   1.0779369 0.30579710 -1.71454324 0.0888876158
# 11 1527   126 0.08251473 6285749 495869.8 0.07888795                            HIQ_62: No 0.69 (0.34 ~ 1.37)   0.288      0.449      1.000          0.6855493  0.3424718   1.3723111 0.35410398 -1.06616937 0.2883857742
# 12 1527   126 0.08251473 6285749 495869.8 0.07888795                    HUQ_3_lt_1yearTRUE 0.97 (0.43 ~ 2.16)   0.931      0.948      1.000          0.9651291  0.4312516   2.1599319 0.41101273 -0.08635606 0.9313204564
# 13 1527   126 0.08251473 6285749 495869.8 0.07888795 SSQ_5_6_adequateTRUE:AGEGROUP2: 40-59 0.92 (0.29 ~ 2.94)   0.891      0.948      1.000          0.9215675  0.2883988   2.9448338 0.59273111 -0.13780153 0.8906172469
# 14 1527   126 0.08251473 6285749 495869.8 0.07888795   SSQ_5_6_adequateTRUE:AGEGROUP3: 60+ 1.25 (0.35 ~ 4.49)   0.736      0.937      1.000          1.2467556  0.3463192   4.4883433 0.65355229  0.33745531 0.7363352045
# 
# $`AGEGROUP`$`1: 20-39`
#    nrow nYbin      pYbin nrow.wt nYbin.wt  pYbin.wt              rowname               ORCI p_value star p.fdr *fdr p.bon *bon exp(Estimate) exp(2.5 %) exp(97.5 %) Std. Error     t value     Pr(>|t|)
# 1   697    65 0.09325681 2635536 236928.9 0.0898978          (Intercept) 0.45 (0.14 ~ 1.48)   0.190      0.390      1.000          0.4500567  0.1372474   1.4758092 0.60592348 -1.31762795 0.1901593512
# 2   697    65 0.09325681 2635536 236928.9 0.0898978 SSQ_5_6_adequateTRUE 0.28 (0.14 ~ 0.56)  <0.001  *** 0.005  **  0.005  **      0.2777668  0.1377309   0.5601820 0.35790446 -3.57909291 0.0005000009
# 3   697    65 0.09325681 2635536 236928.9 0.0898978      US_BORN2: Other 0.36 (0.15 ~ 0.85)   0.021  *   0.071  .   0.212          0.3570666  0.1504710   0.8473163 0.44090183 -2.33574191 0.0211785122
# 4   697    65 0.09325681 2635536 236928.9 0.0898978      GENDER2: Female 1.78 (0.75 ~ 4.23)   0.195      0.390      1.000          1.7785765  0.7478107   4.2301268 0.44205847  1.30257272 0.1952358868
# 5   697    65 0.09325681 2635536 236928.9 0.0898978       INC10K_integer 0.78 (0.65 ~ 0.92)   0.005  **  0.027  *   0.054  .       0.7759677  0.6512474   0.9245731 0.08940023 -2.83717801 0.0053518534
# 6   697    65 0.09325681 2635536 236928.9 0.0898978       RACE_WhiteTRUE 1.37 (0.52 ~ 3.61)   0.528      0.754      1.000          1.3682404  0.5187044   3.6091496 0.49487982  0.63353874 0.5275976688
# 7   697    65 0.09325681 2635536 236928.9 0.0898978  MARITAL_MarriedTRUE 1.03 (0.41 ~ 2.62)   0.948      0.948      1.000          1.0318362  0.4058366   2.6234349 0.47610294  0.06582587 0.9476269203
# 8   697    65 0.09325681 2635536 236928.9 0.0898978  EDU4CAT_collegeTRUE 1.06 (0.38 ~ 2.94)   0.918      0.948      1.000          1.0550217  0.3792377   2.9350214 0.52202666  0.10260262 0.9184510627
# 9   697    65 0.09325681 2635536 236928.9 0.0898978           HIQ_62: No 1.06 (0.46 ~ 2.44)   0.898      0.948      1.000          1.0566831  0.4566814   2.4449849 0.42802016  0.12881368 0.8977225405
# 10  697    65 0.09325681 2635536 236928.9 0.0898978   HUQ_3_lt_1yearTRUE 1.35 (0.56 ~ 3.24)   0.503      0.754      1.000          1.3501551  0.5618418   3.2445413 0.44733196  0.67113353 0.5034360979
# 
# $`AGEGROUP`$`2: 40-59`
#    nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt              rowname               ORCI p_value star p.fdr *fdr p.bon *bon exp(Estimate) exp(2.5 %) exp(97.5 %) Std. Error     t value    Pr(>|t|)
# 1   516    41 0.07945736 2197062 170643.8 0.07766908          (Intercept) 0.93 (0.10 ~ 8.33)   0.946      0.946      1.000          0.9271203 0.10315523   8.3326078 1.12035140 -0.06754302 0.946264704
# 2   516    41 0.07945736 2197062 170643.8 0.07766908 SSQ_5_6_adequateTRUE 0.23 (0.09 ~ 0.61)   0.004  **  0.019  *   0.038  *       0.2340236 0.08931491   0.6131905 0.49146496 -2.95511044 0.003780301
# 3   516    41 0.07945736 2197062 170643.8 0.07766908      US_BORN2: Other 0.49 (0.21 ~ 1.12)   0.093      0.187      0.935          0.4888750 0.21329982   1.1204825 0.42317511 -1.69114043 0.093472139
# 4   516    41 0.07945736 2197062 170643.8 0.07766908      GENDER2: Female 4.06 (1.78 ~ 9.24)   0.001  **  0.011  *   0.011  *       4.0578688 1.78208737   9.2398944 0.41984065  3.33616555 0.001138878
# 5   516    41 0.07945736 2197062 170643.8 0.07766908       INC10K_integer 0.85 (0.73 ~ 0.99)   0.043  *   0.143      0.428          0.8531534 0.73287652   0.9931697 0.07753314 -2.04836155 0.042762253
# 6   516    41 0.07945736 2197062 170643.8 0.07766908       RACE_WhiteTRUE 1.84 (0.72 ~ 4.74)   0.208      0.297      1.000          1.8421610 0.71520445   4.7448771 0.48272631  1.26560192 0.208170128
# 7   516    41 0.07945736 2197062 170643.8 0.07766908  MARITAL_MarriedTRUE 1.24 (0.53 ~ 2.87)   0.618      0.686      1.000          1.2393751 0.53488698   2.8717292 0.42873598  0.50055811 0.617622451
# 8   516    41 0.07945736 2197062 170643.8 0.07766908  EDU4CAT_collegeTRUE 0.36 (0.12 ~ 1.05)   0.064      0.160      0.640          0.3590927 0.12275641   1.0504346 0.54765222 -1.87011870 0.063966590
# 9   516    41 0.07945736 2197062 170643.8 0.07766908           HIQ_62: No 0.43 (0.14 ~ 1.27)   0.129      0.215      1.000          0.4259951 0.14254068   1.2731231 0.55858191 -1.52766752 0.129294088
# 10  516    41 0.07945736 2197062 170643.8 0.07766908   HUQ_3_lt_1yearTRUE 0.52 (0.14 ~ 1.98)   0.341      0.426      1.000          0.5210812 0.13687691   1.9837212 0.68206552 -0.95569909 0.341194786
# 
# $`AGEGROUP`$`3: 60+`
#    nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt              rowname                                 ORCI p_value star  p.fdr *fdr  p.bon *bon exp(Estimate)   exp(2.5 %)  exp(97.5 %) Std. Error     t value     Pr(>|t|)
# 1   314    20 0.06369427 1453150 88297.12 0.06076255          (Intercept)                   0.00 (0.00 ~ 0.00)  <0.001  *** <0.001  *** <0.001  ***  3.043662e-08 4.815761e-09 1.923658e-07  0.9407073 -18.3985181 3.075301e-33
# 2   314    20 0.06369427 1453150 88297.12 0.06076255 SSQ_5_6_adequateTRUE                   0.35 (0.10 ~ 1.18)   0.093       0.233       0.930       3.512772e-01 1.048894e-01 1.176436e+00  0.6166792  -1.6964730 9.303674e-02
# 3   314    20 0.06369427 1453150 88297.12 0.06076255      US_BORN2: Other                   2.28 (0.76 ~ 6.82)   0.145       0.233       1.000       2.276955e+00 7.602796e-01 6.819236e+00  0.5596573   1.4702555 1.447626e-01
# 4   314    20 0.06369427 1453150 88297.12 0.06076255      GENDER2: Female                   2.17 (0.70 ~ 6.76)   0.184       0.233       1.000       2.171687e+00 6.972883e-01 6.763667e+00  0.5796335   1.3379220 1.840826e-01
# 5   314    20 0.06369427 1453150 88297.12 0.06076255       INC10K_integer                   1.03 (0.78 ~ 1.36)   0.845       0.845       1.000       1.028493e+00 7.767718e-01 1.361788e+00  0.1432187   0.1961672 8.448940e-01
# 6   314    20 0.06369427 1453150 88297.12 0.06076255       RACE_WhiteTRUE                   2.05 (0.77 ~ 5.51)   0.156       0.233       1.000       2.053461e+00 7.652226e-01 5.510423e+00  0.5036393   1.4286542 1.563493e-01
# 7   314    20 0.06369427 1453150 88297.12 0.06076255  MARITAL_MarriedTRUE                   1.30 (0.29 ~ 5.95)   0.734       0.815       1.000       1.302933e+00 2.851199e-01 5.954111e+00  0.7752508   0.3413323 7.335994e-01
# 8   314    20 0.06369427 1453150 88297.12 0.06076255  EDU4CAT_collegeTRUE                   0.21 (0.03 ~ 1.40)   0.110       0.233       1.000       2.123447e-01 3.223263e-02 1.398901e+00  0.9618705  -1.6109698 1.104695e-01
# 9   314    20 0.06369427 1453150 88297.12 0.06076255           HIQ_62: No                   0.16 (0.01 ~ 2.34)   0.186       0.233       1.000       1.648842e-01 1.161866e-02 2.339925e+00  1.3534080  -1.3318319 1.860689e-01
# 10  314    20 0.06369427 1453150 88297.12 0.06076255   HUQ_3_lt_1yearTRUE 6644888.15 (680412.99 ~ 64893732.52)  <0.001  *** <0.001  *** <0.001  ***  6.644888e+06 6.804130e+05 6.489373e+07  1.1627271  13.5107875 6.215118e-24
# 
# $`AGEGROUP`$table4manuscript
#                         .id nrow nYbin      pYbin nrow.wt  nYbin.wt   pYbin.wt                               rowname               ORCI p_value star
# 1                 MainModel 1527   126 0.08251473 6285749 495869.83 0.07888795                  SSQ_5_6_adequateTRUE 0.29 (0.18 ~ 0.47)  <0.001  ***
# 2 MainModel_and_interaction 1527   126 0.08251473 6285749 495869.83 0.07888795                  SSQ_5_6_adequateTRUE 0.29 (0.14 ~ 0.57)  <0.001  ***
# 3 MainModel_and_interaction 1527   126 0.08251473 6285749 495869.83 0.07888795 SSQ_5_6_adequateTRUE:AGEGROUP2: 40-59 0.92 (0.29 ~ 2.94)   0.891     
# 4 MainModel_and_interaction 1527   126 0.08251473 6285749 495869.83 0.07888795   SSQ_5_6_adequateTRUE:AGEGROUP3: 60+ 1.25 (0.35 ~ 4.49)   0.736     
# 5                  1: 20-39  697    65 0.09325681 2635536 236928.90 0.08989780                  SSQ_5_6_adequateTRUE 0.28 (0.14 ~ 0.56)  <0.001  ***
# 6                  2: 40-59  516    41 0.07945736 2197062 170643.81 0.07766908                  SSQ_5_6_adequateTRUE 0.23 (0.09 ~ 0.61)   0.004  ** 
# 7                    3: 60+  314    20 0.06369427 1453150  88297.12 0.06076255                  SSQ_5_6_adequateTRUE 0.35 (0.10 ~ 1.18)   0.093     
# 
# 
# $GENDER
# $GENDER$`MainModel`
#    nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt              rowname               ORCI p_value star  p.fdr *fdr  p.bon *bon exp(Estimate) exp(2.5 %) exp(97.5 %) Std. Error     t value     Pr(>|t|)
# 1  1527   126 0.08251473 6285749 495869.8 0.07888795          (Intercept) 0.43 (0.15 ~ 1.27)   0.130       0.194       1.000          0.4329902  0.1477463   1.2689353 0.54859086 -1.52580039 1.295267e-01
# 2  1527   126 0.08251473 6285749 495869.8 0.07888795 SSQ_5_6_adequateTRUE 0.29 (0.18 ~ 0.47)  <0.001  *** <0.001  *** <0.001  ***     0.2903023  0.1786736   0.4716723 0.24763812 -4.99451626 1.890931e-06
# 3  1527   126 0.08251473 6285749 495869.8 0.07888795      US_BORN2: Other 0.61 (0.38 ~ 0.98)   0.044  *    0.127       0.529          0.6083437  0.3768176   0.9821252 0.24438142 -2.03376867 4.404168e-02
# 4  1527   126 0.08251473 6285749 495869.8 0.07888795      GENDER2: Female 2.42 (1.46 ~ 4.00)  <0.001  ***  0.005  **   0.010  **      2.4161875  1.4609597   3.9959774 0.25668703  3.43683453 7.943114e-04
# 5  1527   126 0.08251473 6285749 495869.8 0.07888795       INC10K_integer 0.85 (0.76 ~ 0.95)   0.004  **   0.017  *    0.050  .       0.8511238  0.7636852   0.9485739 0.05530817 -2.91453550 4.206060e-03
# 6  1527   126 0.08251473 6285749 495869.8 0.07888795     AGEGROUP2: 40-59 0.99 (0.57 ~ 1.70)   0.965       0.965       1.000          0.9880856  0.5748453   1.6983927 0.27636644 -0.04336982 9.654743e-01
# 7  1527   126 0.08251473 6285749 495869.8 0.07888795       AGEGROUP3: 60+ 0.48 (0.23 ~ 1.04)   0.064       0.127       0.765          0.4838589  0.2261060   1.0354411 0.38816499 -1.87024051 6.373445e-02
# 8  1527   126 0.08251473 6285749 495869.8 0.07888795       RACE_WhiteTRUE 1.66 (0.98 ~ 2.83)   0.064       0.127       0.763          1.6607067  0.9761966   2.8251960 0.27109402  1.87109714 6.361468e-02
# 9  1527   126 0.08251473 6285749 495869.8 0.07888795  MARITAL_MarriedTRUE 1.18 (0.69 ~ 2.02)   0.542       0.651       1.000          1.1815015  0.6919178   2.0175025 0.27300208  0.61093351 5.423270e-01
# 10 1527   126 0.08251473 6285749 495869.8 0.07888795  EDU4CAT_collegeTRUE 0.59 (0.32 ~ 1.08)   0.091       0.156       1.000          0.5924083  0.3241232   1.0827598 0.30769565 -1.70154896 9.126777e-02
# 11 1527   126 0.08251473 6285749 495869.8 0.07888795           HIQ_62: No 0.69 (0.34 ~ 1.37)   0.285       0.381       1.000          0.6851704  0.3433745   1.3671910 0.35247891 -1.07265330 2.854449e-01
# 12 1527   126 0.08251473 6285749 495869.8 0.07888795   HUQ_3_lt_1yearTRUE 0.96 (0.43 ~ 2.14)   0.928       0.965       1.000          0.9637787  0.4342761   2.1388910 0.40673252 -0.09070732 9.278669e-01
# 
# $GENDER$MainModel_and_interaction
#    nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt                              rowname               ORCI p_value star p.fdr *fdr p.bon *bon exp(Estimate) exp(2.5 %) exp(97.5 %) Std. Error     t value    Pr(>|t|)
# 1  1527   126 0.08251473 6285749 495869.8 0.07888795                          (Intercept) 0.43 (0.13 ~ 1.42)   0.169      0.275      1.000          0.4299221  0.1298930   1.4229640 0.61067107 -1.38233386 0.169295432
# 2  1527   126 0.08251473 6285749 495869.8 0.07888795                 SSQ_5_6_adequateTRUE 0.29 (0.12 ~ 0.74)   0.010  *   0.043  *   0.130          0.2948189  0.1180001   0.7365940 0.46719003 -2.61434115 0.010020968
# 3  1527   126 0.08251473 6285749 495869.8 0.07888795                      US_BORN2: Other 0.61 (0.38 ~ 0.98)   0.044  *   0.143      0.574          0.6084085  0.3767958   0.9823912 0.24446524 -2.03263574 0.044174154
# 4  1527   126 0.08251473 6285749 495869.8 0.07888795                      GENDER2: Female 2.44 (1.26 ~ 4.74)   0.009  **  0.043  *   0.123          2.4397532  1.2566886   4.7365719 0.33848415  2.63497385 0.009461876
# 5  1527   126 0.08251473 6285749 495869.8 0.07888795                       INC10K_integer 0.85 (0.76 ~ 0.95)   0.004  **  0.043  *   0.056  .       0.8510981  0.7634552   0.9488023 0.05544644 -2.90781264 0.004297068
# 6  1527   126 0.08251473 6285749 495869.8 0.07888795                     AGEGROUP2: 40-59 0.99 (0.58 ~ 1.68)   0.967      0.970      1.000          0.9890003  0.5816099   1.6817485 0.27086961 -0.04083383 0.967492492
# 7  1527   126 0.08251473 6285749 495869.8 0.07888795                       AGEGROUP3: 60+ 0.48 (0.22 ~ 1.04)   0.066      0.143      0.859          0.4835484  0.2242886   1.0424919 0.39195500 -1.85379384 0.066088857
# 8  1527   126 0.08251473 6285749 495869.8 0.07888795                       RACE_WhiteTRUE 1.66 (0.98 ~ 2.83)   0.064      0.143      0.828          1.6607367  0.9761288   2.8254941 0.27113865  1.87085564 0.063666431
# 9  1527   126 0.08251473 6285749 495869.8 0.07888795                  MARITAL_MarriedTRUE 1.18 (0.69 ~ 2.02)   0.544      0.707      1.000          1.1809828  0.6910776   2.0181817 0.27339790  0.60844265 0.543980606
# 10 1527   126 0.08251473 6285749 495869.8 0.07888795                  EDU4CAT_collegeTRUE 0.59 (0.32 ~ 1.09)   0.093      0.173      1.000          0.5925814  0.3230998   1.0868242 0.30945820 -1.69091340 0.093306090
# 11 1527   126 0.08251473 6285749 495869.8 0.07888795                           HIQ_62: No 0.68 (0.35 ~ 1.36)   0.281      0.405      1.000          0.6849398  0.3453994   1.3582610 0.34930723 -1.08335686 0.280702567
# 12 1527   126 0.08251473 6285749 495869.8 0.07888795                   HUQ_3_lt_1yearTRUE 0.96 (0.43 ~ 2.18)   0.932      0.970      1.000          0.9648860  0.4275254   2.1776598 0.41531179 -0.08606871 0.931547341
# 13 1527   126 0.08251473 6285749 495869.8 0.07888795 SSQ_5_6_adequateTRUE:GENDER2: Female 0.98 (0.31 ~ 3.04)   0.970      0.970      1.000          0.9784837  0.3148621   3.0407927 0.57851544 -0.03759830 0.970066996
# 
# $GENDER$`1: Male`
#    nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt              rowname               ORCI p_value star p.fdr *fdr p.bon *bon exp(Estimate) exp(2.5 %) exp(97.5 %) Std. Error      t value    Pr(>|t|)
# 1   642    38 0.05919003 2931913 160841.7 0.05485896          (Intercept) 1.00 (0.20 ~ 5.08)   0.999      0.999      1.000          1.0014976 0.19749537   5.0785872 0.82835023  0.001806589 0.998561478
# 2   642    38 0.05919003 2931913 160841.7 0.05485896 SSQ_5_6_adequateTRUE 0.26 (0.09 ~ 0.75)   0.014  *   0.078  .   0.156          0.2621952 0.09138216   0.7522946 0.53778483 -2.489222547 0.014138344
# 3   642    38 0.05919003 2931913 160841.7 0.05485896      US_BORN2: Other 0.59 (0.24 ~ 1.49)   0.270      0.593      1.000          0.5926464 0.23507373   1.4941258 0.47179371 -1.108869004 0.269650124
# 4   642    38 0.05919003 2931913 160841.7 0.05485896       INC10K_integer 0.75 (0.62 ~ 0.91)   0.004  **  0.045  *   0.045  *       0.7499128 0.61841891   0.9093660 0.09836446 -2.925837096 0.004092342
# 5   642    38 0.05919003 2931913 160841.7 0.05485896     AGEGROUP2: 40-59 0.58 (0.17 ~ 1.99)   0.389      0.618      1.000          0.5811935 0.16991328   1.9879902 0.62745828 -0.864872605 0.388792353
# 6   642    38 0.05919003 2931913 160841.7 0.05485896       AGEGROUP3: 60+ 0.49 (0.09 ~ 2.52)   0.393      0.618      1.000          0.4880431 0.09455225   2.5190943 0.83738836 -0.856653422 0.393302358
# 7   642    38 0.05919003 2931913 160841.7 0.05485896       RACE_WhiteTRUE 1.49 (0.44 ~ 5.00)   0.524      0.720      1.000          1.4861433 0.44150776   5.0024535 0.61926856  0.639761847 0.523517275
# 8   642    38 0.05919003 2931913 160841.7 0.05485896  MARITAL_MarriedTRUE 1.86 (0.72 ~ 4.78)   0.200      0.550      1.000          1.8606962 0.72376180   4.7836044 0.48176581  1.288905693 0.199849728
# 9   642    38 0.05919003 2931913 160841.7 0.05485896  EDU4CAT_collegeTRUE 1.09 (0.41 ~ 2.89)   0.865      0.952      1.000          1.0884335 0.41010896   2.8887139 0.49800502  0.170157925 0.865165504
# 10  642    38 0.05919003 2931913 160841.7 0.05485896           HIQ_62: No 0.46 (0.14 ~ 1.49)   0.198      0.550      1.000          0.4600404 0.14211879   1.4891570 0.59932281 -1.295530386 0.197563412
# 11  642    38 0.05919003 2931913 160841.7 0.05485896   HUQ_3_lt_1yearTRUE 0.82 (0.19 ~ 3.47)   0.790      0.952      1.000          0.8222216 0.19492294   3.4682853 0.73440413 -0.266536241 0.790272567
# 
# $GENDER$`2: Female`
#    nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt              rowname               ORCI p_value star  p.fdr *fdr  p.bon *bon exp(Estimate) exp(2.5 %) exp(97.5 %) Std. Error     t value     Pr(>|t|)
# 1   885    88 0.09943503 3353836 335028.1 0.09989402          (Intercept) 0.75 (0.23 ~ 2.41)   0.627       0.943       1.000          0.7470776  0.2314437   2.4114929 0.59788459 -0.48769654 6.265926e-01
# 2   885    88 0.09943503 3353836 335028.1 0.09989402 SSQ_5_6_adequateTRUE 0.28 (0.16 ~ 0.51)  <0.001  *** <0.001  *** <0.001  ***     0.2811688  0.1563728   0.5055601 0.29934828 -4.23854199 4.252695e-05
# 3   885    88 0.09943503 3353836 335028.1 0.09989402      US_BORN2: Other 0.61 (0.33 ~ 1.12)   0.114       0.210       1.000          0.6067368  0.3276366   1.1235911 0.31438848 -1.58930815 1.144387e-01
# 4   885    88 0.09943503 3353836 335028.1 0.09989402       INC10K_integer 0.89 (0.79 ~ 1.00)   0.060       0.164       0.657          0.8908130  0.7906462   1.0036699 0.06086028 -1.89977339 5.969511e-02
# 5   885    88 0.09943503 3353836 335028.1 0.09989402     AGEGROUP2: 40-59 1.09 (0.57 ~ 2.08)   0.800       0.976       1.000          1.0875898  0.5693158   2.0776721 0.33025302  0.25424160 7.997137e-01
# 6   885    88 0.09943503 3353836 335028.1 0.09989402       AGEGROUP3: 60+ 0.46 (0.21 ~ 1.00)   0.053       0.164       0.588          0.4566094  0.2076074   1.0042618 0.40213987 -1.94938880 5.341887e-02
# 7   885    88 0.09943503 3353836 335028.1 0.09989402       RACE_WhiteTRUE 1.75 (0.90 ~ 3.39)   0.100       0.210       1.000          1.7492038  0.9024350   3.3905091 0.33766915  1.65594253 1.001641e-01
# 8   885    88 0.09943503 3353836 335028.1 0.09989402  MARITAL_MarriedTRUE 0.99 (0.48 ~ 2.04)   0.979       0.979       1.000          0.9903612  0.4798620   2.0439529 0.36968596 -0.02619928 9.791389e-01
# 9   885    88 0.09943503 3353836 335028.1 0.09989402  EDU4CAT_collegeTRUE 0.44 (0.20 ~ 0.99)   0.049  *    0.164       0.539          0.4426947  0.1981685   0.9889495 0.41009061 -1.98706056 4.903421e-02
# 10  885    88 0.09943503 3353836 335028.1 0.09989402           HIQ_62: No 0.83 (0.34 ~ 2.01)   0.686       0.943       1.000          0.8331159  0.3445633   2.0143817 0.45046483 -0.40532031 6.859135e-01
# 11  885    88 0.09943503 3353836 335028.1 0.09989402   HUQ_3_lt_1yearTRUE 1.07 (0.43 ~ 2.67)   0.888       0.976       1.000          1.0684672  0.4275414   2.6702025 0.46731943  0.14171263 8.875281e-01
# 
# $GENDER$table4manuscript
#                         .id nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt                              rowname               ORCI p_value star
# 1                 MainModel 1527   126 0.08251473 6285749 495869.8 0.07888795                 SSQ_5_6_adequateTRUE 0.29 (0.18 ~ 0.47)  <0.001  ***
# 2 MainModel_and_interaction 1527   126 0.08251473 6285749 495869.8 0.07888795                 SSQ_5_6_adequateTRUE 0.29 (0.12 ~ 0.74)   0.010  *  
# 3 MainModel_and_interaction 1527   126 0.08251473 6285749 495869.8 0.07888795 SSQ_5_6_adequateTRUE:GENDER2: Female 0.98 (0.31 ~ 3.04)   0.970     
# 4                   1: Male  642    38 0.05919003 2931913 160841.7 0.05485896                 SSQ_5_6_adequateTRUE 0.26 (0.09 ~ 0.75)   0.014  *  
# 5                 2: Female  885    88 0.09943503 3353836 335028.1 0.09989402                 SSQ_5_6_adequateTRUE 0.28 (0.16 ~ 0.51)  <0.001  ***
# 
# 
# $US_BORN
# $US_BORN$`MainModel`
#    nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt              rowname               ORCI p_value star  p.fdr *fdr  p.bon *bon exp(Estimate) exp(2.5 %) exp(97.5 %) Std. Error     t value     Pr(>|t|)
# 1  1527   126 0.08251473 6285749 495869.8 0.07888795          (Intercept) 0.43 (0.15 ~ 1.27)   0.130       0.194       1.000          0.4329902  0.1477463   1.2689353 0.54859086 -1.52580039 1.295267e-01
# 2  1527   126 0.08251473 6285749 495869.8 0.07888795 SSQ_5_6_adequateTRUE 0.29 (0.18 ~ 0.47)  <0.001  *** <0.001  *** <0.001  ***     0.2903023  0.1786736   0.4716723 0.24763812 -4.99451626 1.890931e-06
# 3  1527   126 0.08251473 6285749 495869.8 0.07888795      US_BORN2: Other 0.61 (0.38 ~ 0.98)   0.044  *    0.127       0.529          0.6083437  0.3768176   0.9821252 0.24438142 -2.03376867 4.404168e-02
# 4  1527   126 0.08251473 6285749 495869.8 0.07888795      GENDER2: Female 2.42 (1.46 ~ 4.00)  <0.001  ***  0.005  **   0.010  **      2.4161875  1.4609597   3.9959774 0.25668703  3.43683453 7.943114e-04
# 5  1527   126 0.08251473 6285749 495869.8 0.07888795       INC10K_integer 0.85 (0.76 ~ 0.95)   0.004  **   0.017  *    0.050  .       0.8511238  0.7636852   0.9485739 0.05530817 -2.91453550 4.206060e-03
# 6  1527   126 0.08251473 6285749 495869.8 0.07888795     AGEGROUP2: 40-59 0.99 (0.57 ~ 1.70)   0.965       0.965       1.000          0.9880856  0.5748453   1.6983927 0.27636644 -0.04336982 9.654743e-01
# 7  1527   126 0.08251473 6285749 495869.8 0.07888795       AGEGROUP3: 60+ 0.48 (0.23 ~ 1.04)   0.064       0.127       0.765          0.4838589  0.2261060   1.0354411 0.38816499 -1.87024051 6.373445e-02
# 8  1527   126 0.08251473 6285749 495869.8 0.07888795       RACE_WhiteTRUE 1.66 (0.98 ~ 2.83)   0.064       0.127       0.763          1.6607067  0.9761966   2.8251960 0.27109402  1.87109714 6.361468e-02
# 9  1527   126 0.08251473 6285749 495869.8 0.07888795  MARITAL_MarriedTRUE 1.18 (0.69 ~ 2.02)   0.542       0.651       1.000          1.1815015  0.6919178   2.0175025 0.27300208  0.61093351 5.423270e-01
# 10 1527   126 0.08251473 6285749 495869.8 0.07888795  EDU4CAT_collegeTRUE 0.59 (0.32 ~ 1.08)   0.091       0.156       1.000          0.5924083  0.3241232   1.0827598 0.30769565 -1.70154896 9.126777e-02
# 11 1527   126 0.08251473 6285749 495869.8 0.07888795           HIQ_62: No 0.69 (0.34 ~ 1.37)   0.285       0.381       1.000          0.6851704  0.3433745   1.3671910 0.35247891 -1.07265330 2.854449e-01
# 12 1527   126 0.08251473 6285749 495869.8 0.07888795   HUQ_3_lt_1yearTRUE 0.96 (0.43 ~ 2.14)   0.928       0.965       1.000          0.9637787  0.4342761   2.1388910 0.40673252 -0.09070732 9.278669e-01
# 
# $US_BORN$MainModel_and_interaction
#    nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt                              rowname               ORCI p_value star  p.fdr *fdr  p.bon *bon exp(Estimate) exp(2.5 %) exp(97.5 %) Std. Error      t value     Pr(>|t|)
# 1  1527   126 0.08251473 6285749 495869.8 0.07888795                          (Intercept) 0.53 (0.18 ~ 1.56)   0.255       0.333       1.000          0.5346022  0.1826513   1.5647277 0.54794081 -1.142883319 2.552370e-01
# 2  1527   126 0.08251473 6285749 495869.8 0.07888795                 SSQ_5_6_adequateTRUE 0.18 (0.10 ~ 0.33)  <0.001  *** <0.001  *** <0.001  ***     0.1849169  0.1046152   0.3268573 0.29062637 -5.807624892 4.797257e-08
# 3  1527   126 0.08251473 6285749 495869.8 0.07888795                      US_BORN2: Other 0.34 (0.16 ~ 0.69)   0.003  **   0.012  *    0.044  *       0.3366017  0.1648466   0.6873101 0.36423384 -2.989439130 3.356857e-03
# 4  1527   126 0.08251473 6285749 495869.8 0.07888795                      GENDER2: Female 2.42 (1.44 ~ 4.05)   0.001  **   0.007  **   0.014  *       2.4179468  1.4438482   4.0492253 0.26306954  3.356218117 1.042646e-03
# 5  1527   126 0.08251473 6285749 495869.8 0.07888795                       INC10K_integer 0.85 (0.76 ~ 0.95)   0.004  **   0.012  *    0.047  *       0.8498172  0.7631964   0.9462693 0.05485093 -2.966840568 3.596134e-03
# 6  1527   126 0.08251473 6285749 495869.8 0.07888795                     AGEGROUP2: 40-59 0.99 (0.57 ~ 1.72)   0.980       0.999       1.000          0.9928780  0.5734006   1.7192286 0.28011903 -0.025515896 9.796835e-01
# 7  1527   126 0.08251473 6285749 495869.8 0.07888795                       AGEGROUP3: 60+ 0.48 (0.22 ~ 1.03)   0.061       0.113       0.789          0.4789101  0.2234375   1.0264835 0.38897714 -1.892764976 6.066502e-02
# 8  1527   126 0.08251473 6285749 495869.8 0.07888795                       RACE_WhiteTRUE 1.71 (1.00 ~ 2.93)   0.052       0.113       0.677          1.7125989  1.0003233   2.9320470 0.27433605  1.961142382 5.205062e-02
# 9  1527   126 0.08251473 6285749 495869.8 0.07888795                  MARITAL_MarriedTRUE 1.20 (0.69 ~ 2.08)   0.529       0.625       1.000          1.1960695  0.6863900   2.0842119 0.28334706  0.631877897 5.286025e-01
# 10 1527   126 0.08251473 6285749 495869.8 0.07888795                  EDU4CAT_collegeTRUE 0.60 (0.33 ~ 1.09)   0.098       0.159       1.000          0.6002380  0.3294816   1.0934926 0.30602899 -1.667910688 9.779733e-02
# 11 1527   126 0.08251473 6285749 495869.8 0.07888795                           HIQ_62: No 0.66 (0.33 ~ 1.34)   0.256       0.333       1.000          0.6622993  0.3262320   1.3445658 0.36128666 -1.140473078 2.562354e-01
# 12 1527   126 0.08251473 6285749 495869.8 0.07888795                   HUQ_3_lt_1yearTRUE 1.00 (0.43 ~ 2.34)   0.999       0.999       1.000          0.9993821  0.4266674   2.3408503 0.43425918 -0.001423329 9.988666e-01
# 13 1527   126 0.08251473 6285749 495869.8 0.07888795 SSQ_5_6_adequateTRUE:US_BORN2: Other 3.23 (1.17 ~ 8.93)   0.025  *    0.066  .    0.329          3.2325591  1.1706173   8.9264340 0.51824569  2.263934147 2.527425e-02
# 
# $US_BORN$`1: US-Born, 50 States, DC, PR and Territories`
#    nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt              rowname               ORCI p_value star  p.fdr *fdr  p.bon *bon exp(Estimate) exp(2.5 %) exp(97.5 %) Std. Error    t value     Pr(>|t|)
# 1   851    80 0.09400705 3366499 291459.3 0.08657637          (Intercept) 0.40 (0.14 ~ 1.16)   0.093       0.171       1.000          0.3975311 0.13655272   1.1572889 0.54519487 -1.6920229 9.315306e-02
# 2   851    80 0.09400705 3366499 291459.3 0.08657637 SSQ_5_6_adequateTRUE 0.16 (0.09 ~ 0.30)  <0.001  *** <0.001  *** <0.001  ***     0.1590962 0.08534611   0.2965759 0.31775796 -5.7850520 5.560383e-08
# 3   851    80 0.09400705 3366499 291459.3 0.08657637      GENDER2: Female 2.74 (1.51 ~ 5.00)   0.001  **   0.007  **   0.014  *       2.7449123 1.50568593   5.0040605 0.30638347  3.2957037 1.280502e-03
# 4   851    80 0.09400705 3366499 291459.3 0.08657637       INC10K_integer 0.82 (0.72 ~ 0.94)   0.005  **   0.018  *    0.053  .       0.8194219 0.71514529   0.9389033 0.06944687 -2.8677487 4.859808e-03
# 5   851    80 0.09400705 3366499 291459.3 0.08657637     AGEGROUP2: 40-59 0.82 (0.41 ~ 1.64)   0.581       0.710       1.000          0.8228316 0.41274856   1.6403495 0.35200290 -0.5539832 5.805880e-01
# 6   851    80 0.09400705 3366499 291459.3 0.08657637       AGEGROUP3: 60+ 0.19 (0.05 ~ 0.79)   0.024  *    0.052  .    0.259          0.1933395 0.04745744   0.7876567 0.71665322 -2.2930301 2.353045e-02
# 7   851    80 0.09400705 3366499 291459.3 0.08657637       RACE_WhiteTRUE 2.48 (1.18 ~ 5.21)   0.018  *    0.051  .    0.203          2.4753673 1.17619865   5.2095311 0.37965037  2.3874303 1.847685e-02
# 8   851    80 0.09400705 3366499 291459.3 0.08657637  MARITAL_MarriedTRUE 0.91 (0.40 ~ 2.07)   0.826       0.826       1.000          0.9120618 0.40181878   2.0702284 0.41822529 -0.2200909 8.261623e-01
# 9   851    80 0.09400705 3366499 291459.3 0.08657637  EDU4CAT_collegeTRUE 0.64 (0.29 ~ 1.43)   0.281       0.442       1.000          0.6429960 0.28899420   1.4306303 0.40803396 -1.0823040 2.812177e-01
# 10  851    80 0.09400705 3366499 291459.3 0.08657637           HIQ_62: No 0.83 (0.31 ~ 2.24)   0.711       0.782       1.000          0.8285731 0.30709414   2.2355797 0.50641275 -0.3713378 7.110197e-01
# 11  851    80 0.09400705 3366499 291459.3 0.08657637   HUQ_3_lt_1yearTRUE 1.56 (0.58 ~ 4.19)   0.375       0.515       1.000          1.5644740 0.58445768   4.1877778 0.50236666  0.8908825 3.747175e-01
# 
# $US_BORN$`2: Other`
#    nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt              rowname               ORCI p_value star p.fdr *fdr p.bon *bon exp(Estimate) exp(2.5 %) exp(97.5 %) Std. Error     t value   Pr(>|t|)
# 1   668    44 0.06586826 2879276   194006 0.06738013          (Intercept) 0.24 (0.03 ~ 2.20)   0.209      0.433      1.000          0.2399448 0.02620163    2.197325 1.12991225 -1.26323658 0.20917512
# 2   668    44 0.06586826 2879276   194006 0.06738013 SSQ_5_6_adequateTRUE 0.64 (0.28 ~ 1.47)   0.295      0.433      1.000          0.6403283 0.27931288    1.467961 0.42329777 -1.05309866 0.29460356
# 3   668    44 0.06586826 2879276   194006 0.06738013      GENDER2: Female 2.70 (1.00 ~ 7.33)   0.053      0.348      0.588          2.7022015 0.99587451    7.332142 0.50929550  1.95184684 0.05349839
# 4   668    44 0.06586826 2879276   194006 0.06738013       INC10K_integer 0.92 (0.77 ~ 1.09)   0.315      0.433      1.000          0.9160211 0.77252389    1.086173 0.08692839 -1.00905868 0.31516098
# 5   668    44 0.06586826 2879276   194006 0.06738013     AGEGROUP2: 40-59 1.12 (0.44 ~ 2.86)   0.811      0.893      1.000          1.1209514 0.43973503    2.857475 0.47743772  0.23914698 0.81143662
# 6   668    44 0.06586826 2879276   194006 0.06738013       AGEGROUP3: 60+ 1.53 (0.44 ~ 5.30)   0.501      0.613      1.000          1.5328208 0.44302180    5.303440 0.63330042  0.67441879 0.50146002
# 7   668    44 0.06586826 2879276   194006 0.06738013       RACE_WhiteTRUE 1.04 (0.34 ~ 3.17)   0.944      0.944      1.000          1.0405905 0.34141942    3.171550 0.56859818  0.06997626 0.94433961
# 8   668    44 0.06586826 2879276   194006 0.06738013  MARITAL_MarriedTRUE 1.90 (0.83 ~ 4.32)   0.130      0.433      1.000          1.8974798 0.83375058    4.318354 0.41957281  1.52661610 0.12972679
# 9   668    44 0.06586826 2879276   194006 0.06738013  EDU4CAT_collegeTRUE 0.48 (0.16 ~ 1.50)   0.212      0.433      1.000          0.4832179 0.15542786    1.502302 0.57872801 -1.25670011 0.21152434
# 10  668    44 0.06586826 2879276   194006 0.06738013           HIQ_62: No 0.35 (0.12 ~ 1.05)   0.063      0.348      0.695          0.3531083 0.11906036    1.047246 0.55467557 -1.87673762 0.06320397
# 11  668    44 0.06586826 2879276   194006 0.06738013   HUQ_3_lt_1yearTRUE 0.47 (0.13 ~ 1.72)   0.259      0.433      1.000          0.4742291 0.13083809    1.718867 0.65701711 -1.13553326 0.25862006
# 
# $US_BORN$table4manuscript
#                                             .id nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt                              rowname               ORCI p_value star
# 1                                     MainModel 1527   126 0.08251473 6285749 495869.8 0.07888795                 SSQ_5_6_adequateTRUE 0.29 (0.18 ~ 0.47)  <0.001  ***
# 2                     MainModel_and_interaction 1527   126 0.08251473 6285749 495869.8 0.07888795                 SSQ_5_6_adequateTRUE 0.18 (0.10 ~ 0.33)  <0.001  ***
# 3                     MainModel_and_interaction 1527   126 0.08251473 6285749 495869.8 0.07888795 SSQ_5_6_adequateTRUE:US_BORN2: Other 3.23 (1.17 ~ 8.93)   0.025  *  
# 4 1: US-Born, 50 States, DC, PR and Territories  851    80 0.09400705 3366499 291459.3 0.08657637                 SSQ_5_6_adequateTRUE 0.16 (0.09 ~ 0.30)  <0.001  ***
# 5                                      2: Other  668    44 0.06586826 2879276 194006.0 0.06738013                 SSQ_5_6_adequateTRUE 0.64 (0.28 ~ 1.47)   0.295     




#@ c("AGEGROUP", "GENDER", "US_BORN") %>% {set_names(map(., function(chr) { ======
c("AGEGROUP", "GENDER", "US_BORN") %>% {set_names(map(., function(chr) {
    function.svyglm.MainModel.byEffectModifier(data = data, formula4MainModel = formula4MainModel, subscript4MainModel = "10var", varname4EffectModifier = chr)
}), .)} %>% map(function(ls) ls$table4manuscript)
# > c("AGEGROUP", "GENDER", "US_BORN") %>% {set_names(map(., function(chr) {
# +     function.svyglm.MainModel.byEffectModifier(data = data, formula4MainModel = formula4MainModel, subscript4MainModel = "10var", varname4EffectModifier = chr)
# + }), .)} %>% map(function(ls) ls$table4manuscript)
# $`AGEGROUP`
#                         .id nrow nYbin      pYbin nrow.wt  nYbin.wt   pYbin.wt                               rowname               ORCI p_value star
# 1                 MainModel 1527   126 0.08251473 6285749 495869.83 0.07888795                  SSQ_5_6_adequateTRUE 0.29 (0.18 ~ 0.47)  <0.001  ***
# 2 MainModel_and_interaction 1527   126 0.08251473 6285749 495869.83 0.07888795                  SSQ_5_6_adequateTRUE 0.29 (0.14 ~ 0.57)  <0.001  ***
# 3 MainModel_and_interaction 1527   126 0.08251473 6285749 495869.83 0.07888795 SSQ_5_6_adequateTRUE:AGEGROUP2: 40-59 0.92 (0.29 ~ 2.94)   0.891     
# 4 MainModel_and_interaction 1527   126 0.08251473 6285749 495869.83 0.07888795   SSQ_5_6_adequateTRUE:AGEGROUP3: 60+ 1.25 (0.35 ~ 4.49)   0.736     
# 5                  1: 20-39  697    65 0.09325681 2635536 236928.90 0.08989780                  SSQ_5_6_adequateTRUE 0.28 (0.14 ~ 0.56)  <0.001  ***
# 6                  2: 40-59  516    41 0.07945736 2197062 170643.81 0.07766908                  SSQ_5_6_adequateTRUE 0.23 (0.09 ~ 0.61)   0.004  ** 
# 7                    3: 60+  314    20 0.06369427 1453150  88297.12 0.06076255                  SSQ_5_6_adequateTRUE 0.35 (0.10 ~ 1.18)   0.093     
# 
# $GENDER
#                         .id nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt                              rowname               ORCI p_value star
# 1                 MainModel 1527   126 0.08251473 6285749 495869.8 0.07888795                 SSQ_5_6_adequateTRUE 0.29 (0.18 ~ 0.47)  <0.001  ***
# 2 MainModel_and_interaction 1527   126 0.08251473 6285749 495869.8 0.07888795                 SSQ_5_6_adequateTRUE 0.29 (0.12 ~ 0.74)   0.010  *  
# 3 MainModel_and_interaction 1527   126 0.08251473 6285749 495869.8 0.07888795 SSQ_5_6_adequateTRUE:GENDER2: Female 0.98 (0.31 ~ 3.04)   0.970     
# 4                   1: Male  642    38 0.05919003 2931913 160841.7 0.05485896                 SSQ_5_6_adequateTRUE 0.26 (0.09 ~ 0.75)   0.014  *  
# 5                 2: Female  885    88 0.09943503 3353836 335028.1 0.09989402                 SSQ_5_6_adequateTRUE 0.28 (0.16 ~ 0.51)  <0.001  ***
# 
# $US_BORN
#                                             .id nrow nYbin      pYbin nrow.wt nYbin.wt   pYbin.wt                              rowname               ORCI p_value star
# 1                                     MainModel 1527   126 0.08251473 6285749 495869.8 0.07888795                 SSQ_5_6_adequateTRUE 0.29 (0.18 ~ 0.47)  <0.001  ***
# 2                     MainModel_and_interaction 1527   126 0.08251473 6285749 495869.8 0.07888795                 SSQ_5_6_adequateTRUE 0.18 (0.10 ~ 0.33)  <0.001  ***
# 3                     MainModel_and_interaction 1527   126 0.08251473 6285749 495869.8 0.07888795 SSQ_5_6_adequateTRUE:US_BORN2: Other 3.23 (1.17 ~ 8.93)   0.025  *  
# 4 1: US-Born, 50 States, DC, PR and Territories  851    80 0.09400705 3366499 291459.3 0.08657637                 SSQ_5_6_adequateTRUE 0.16 (0.09 ~ 0.30)  <0.001  ***
# 5                                      2: Other  668    44 0.06586826 2879276 194006.0 0.06738013                 SSQ_5_6_adequateTRUE 0.64 (0.28 ~ 1.47)   0.295     


#@ c("AGEGROUP", "GENDER", "US_BORN") %>% {set_names(map(., function(chr) { =====
c("AGEGROUP", "GENDER", "US_BORN") %>% {set_names(map(., function(chr) {
    function.svyglm.MainModel.byEffectModifier(data = data, formula4MainModel = formula4MainModel, subscript4MainModel = "10var", varname4EffectModifier = chr)
}), .)} %>% map(function(ls) ls$table4manuscript) %>% bind_rows(.id = "varname4EffectModifier")
# > c("AGEGROUP", "GENDER", "US_BORN") %>% {set_names(map(., function(chr) {
# +     function.svyglm.MainModel.byEffectModifier(data = data, formula4MainModel = formula4MainModel, subscript4MainModel = "10var", varname4EffectModifier = chr)
# + }), .)} %>% map(function(ls) ls$table4manuscript) %>% bind_rows(.id = "varname4EffectModifier")
#    varname4EffectModifier                                           .id nrow nYbin      pYbin nrow.wt  nYbin.wt   pYbin.wt                               rowname               ORCI p_value star
# 1                AGEGROUP                                     MainModel 1527   126 0.08251473 6285749 495869.83 0.07888795                  SSQ_5_6_adequateTRUE 0.29 (0.18 ~ 0.47)  <0.001  ***
# 2                AGEGROUP                     MainModel_and_interaction 1527   126 0.08251473 6285749 495869.83 0.07888795                  SSQ_5_6_adequateTRUE 0.29 (0.14 ~ 0.57)  <0.001  ***
# 3                AGEGROUP                     MainModel_and_interaction 1527   126 0.08251473 6285749 495869.83 0.07888795 SSQ_5_6_adequateTRUE:AGEGROUP2: 40-59 0.92 (0.29 ~ 2.94)   0.891     
# 4                AGEGROUP                     MainModel_and_interaction 1527   126 0.08251473 6285749 495869.83 0.07888795   SSQ_5_6_adequateTRUE:AGEGROUP3: 60+ 1.25 (0.35 ~ 4.49)   0.736     
# 5                AGEGROUP                                      1: 20-39  697    65 0.09325681 2635536 236928.90 0.08989780                  SSQ_5_6_adequateTRUE 0.28 (0.14 ~ 0.56)  <0.001  ***
# 6                AGEGROUP                                      2: 40-59  516    41 0.07945736 2197062 170643.81 0.07766908                  SSQ_5_6_adequateTRUE 0.23 (0.09 ~ 0.61)   0.004  ** 
# 7                AGEGROUP                                        3: 60+  314    20 0.06369427 1453150  88297.12 0.06076255                  SSQ_5_6_adequateTRUE 0.35 (0.10 ~ 1.18)   0.093     
# 8                  GENDER                                     MainModel 1527   126 0.08251473 6285749 495869.83 0.07888795                  SSQ_5_6_adequateTRUE 0.29 (0.18 ~ 0.47)  <0.001  ***
# 9                  GENDER                     MainModel_and_interaction 1527   126 0.08251473 6285749 495869.83 0.07888795                  SSQ_5_6_adequateTRUE 0.29 (0.12 ~ 0.74)   0.010  *  
# 10                 GENDER                     MainModel_and_interaction 1527   126 0.08251473 6285749 495869.83 0.07888795  SSQ_5_6_adequateTRUE:GENDER2: Female 0.98 (0.31 ~ 3.04)   0.970     
# 11                 GENDER                                       1: Male  642    38 0.05919003 2931913 160841.70 0.05485896                  SSQ_5_6_adequateTRUE 0.26 (0.09 ~ 0.75)   0.014  *  
# 12                 GENDER                                     2: Female  885    88 0.09943503 3353836 335028.13 0.09989402                  SSQ_5_6_adequateTRUE 0.28 (0.16 ~ 0.51)  <0.001  ***
# 13                US_BORN                                     MainModel 1527   126 0.08251473 6285749 495869.83 0.07888795                  SSQ_5_6_adequateTRUE 0.29 (0.18 ~ 0.47)  <0.001  ***
# 14                US_BORN                     MainModel_and_interaction 1527   126 0.08251473 6285749 495869.83 0.07888795                  SSQ_5_6_adequateTRUE 0.18 (0.10 ~ 0.33)  <0.001  ***
# 15                US_BORN                     MainModel_and_interaction 1527   126 0.08251473 6285749 495869.83 0.07888795  SSQ_5_6_adequateTRUE:US_BORN2: Other 3.23 (1.17 ~ 8.93)   0.025  *  
# 16                US_BORN 1: US-Born, 50 States, DC, PR and Territories  851    80 0.09400705 3366499 291459.27 0.08657637                  SSQ_5_6_adequateTRUE 0.16 (0.09 ~ 0.30)  <0.001  ***
# 17                US_BORN                                      2: Other  668    44 0.06586826 2879276 194005.99 0.06738013                  SSQ_5_6_adequateTRUE 0.64 (0.28 ~ 1.47)   0.295     





# > c("AGEGROUP", "GENDER", "US_BORN", "INC10K_integer", "INC25K", "INC25KMOD_ge50k", "INC25KMOD_ge75k") %>% {set_names(map(., function(chr) {
# +     function.svyglm.MainModel.byEffectModifier(data = data, formula4MainModel = formula4MainModel, subscript4MainModel = "10var", varname4EffectModifier = chr)
# + }), .)} %>% map(function(ls) ls$table4manuscript) %>% bind_rows(.id = "varname4EffectModifier")
# Error in onestrat(x[index, , drop = FALSE], clusters[index], nPSU[index][1],  : 
#   Stratum (5) has only one PSU at stage 1
# In addition: Warning message:
#  Hide Traceback
#  
#  Rerun with Debug
#  Error in onestrat(x[index, , drop = FALSE], clusters[index], nPSU[index][1],  : 
#   Stratum (5) has only one PSU at stage 1 
# 29.
# stop("Stratum (", stratum, ") has only one PSU at stage ", stage) 
# 28.
# onestrat(x[index, , drop = FALSE], clusters[index], nPSU[index][1], 
#     fpc[index], lonely.psu = lonely.psu, stratum = strata[index][1], 
#     stage = stage, cal = cal) 
# 27.
# FUN(X[[i]], ...) 
# 26.
# lapply(X = ans[index], FUN = FUN, ...) 
# 25.
# tapply(1:NROW(x), list(factor(strata)), function(index) {
#     onestrat(x[index, , drop = FALSE], clusters[index], nPSU[index][1], 
#         fpc[index], lonely.psu = lonely.psu, stratum = strata[index][1], 
#         stage = stage, cal = cal) ... 
# 24.
# onestage(x, stratas[, 1], clusters[, 1], nPSUs[, 1], fpcs[, 1], 
#     lonely.psu = lonely.psu, stage = stage, cal = cal) 
# 23.
# multistage(x, clusters, stratas, fpcs$sampsize, fpcs$popsize, 
#     lonely.psu = getOption("survey.lonely.psu"), one.stage = one.stage, 
#     stage = 1, cal = cal) 
# 22.
# svyrecvar(estfun %*% Ainv, design$cluster, design$strata, design$fpc, 
#     postStrata = design$postStrata) 
# 21.
# svy.varcoef(g, design) 
# 20.
# svyglm.survey.design(formula4MainModel.exc_EffectModifier, design = data.svydesign, 
#     family = stats::quasibinomial()) 
# 19.
# svyglm(formula4MainModel.exc_EffectModifier, design = data.svydesign, 
#     family = stats::quasibinomial()) 
# 18.
# eval(lhs, parent, parent) 
# 17.
# eval(lhs, parent, parent) 
# 16.
# svyglm(formula4MainModel.exc_EffectModifier, design = data.svydesign, 
#     family = stats::quasibinomial()) %>% function.glm_object.summary.exp(allow_multple_spaces = function.glm_object.summary.exp.allow_multple_spaces) 
# 15.
# function.svyglm.MainModel.byEffectModifier(data = data, formula4MainModel = formula4MainModel, 
#     subscript4MainModel = "10var", varname4EffectModifier = chr) 
# 14.
# .f(.x[[i]], ...) 
# 13.
# map(., function(chr) {
#     function.svyglm.MainModel.byEffectModifier(data = data, formula4MainModel = formula4MainModel, 
#         subscript4MainModel = "10var", varname4EffectModifier = chr)
# }) 
# 12.
# typeof(x) %in% atomic_types 
# 11.
# is_atomic(x, n) 
# 10.
# is_vector(x) 
# 9.
# set_names_impl(x, x, nm, ...) 
# 8.
# set_names(map(., function(chr) {
#     function.svyglm.MainModel.byEffectModifier(data = data, formula4MainModel = formula4MainModel, 
#         subscript4MainModel = "10var", varname4EffectModifier = chr)
# }), .) 
# 7.
# function_list[[i]](value) 
# 6.
# freduce(value, `_function_list`) 
# 5.
# `_fseq`(`_lhs`) 
# 4.
# eval(quote(`_fseq`(`_lhs`)), env, env) 
# 3.
# eval(quote(`_fseq`(`_lhs`)), env, env) 
# 2.
# withVisible(eval(quote(`_fseq`(`_lhs`)), env, env)) 
# 1.
# c("AGEGROUP", "GENDER", "US_BORN", "INC10K_integer", "INC25K", 
#     "INC25KMOD_ge50k", "INC25KMOD_ge75k") %>% {
#     set_names(map(., function(chr) {
#         function.svyglm.MainModel.byEffectModifier(data = data,  ... 


c("AGEGROUP", "GENDER", "US_BORN", "INC10K_integer", "INC25K", "INC25KMOD_ge50k", "INC25KMOD_ge75k") %>% {set_names(map(., function(chr) {
    function.svyglm.MainModel.byEffectModifier(data = data, formula4MainModel = formula4MainModel, subscript4MainModel = "10var", varname4EffectModifier = chr)
}), .)} %>% map(function(ls) ls$table4manuscript) %>% bind_rows(.id = "varname4EffectModifier") 
# > c("AGEGROUP", "GENDER", "US_BORN", "INC10K_integer", "INC25K", "INC25KMOD_ge50k", "INC25KMOD_ge75k") %>% {set_names(map(., function(chr) {
# +     function.svyglm.MainModel.byEffectModifier(data = data, formula4MainModel = formula4MainModel, subscript4MainModel = "10var", varname4EffectModifier = chr)
# + }), .)} %>% map(function(ls) ls$table4manuscript) %>% bind_rows(.id = "varname4EffectModifier")
#    varname4EffectModifier                                           .id nrow nYbin      pYbin   nrow.wt  nYbin.wt   pYbin.wt                                          rowname                ORCI p_value star
# 1                AGEGROUP                                     MainModel 1527   126 0.08251473 6285748.8 495869.83 0.07888795                             SSQ_5_6_adequateTRUE  0.29 (0.18 ~ 0.47)  <0.001  ***
# 2                AGEGROUP                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795                             SSQ_5_6_adequateTRUE  0.29 (0.14 ~ 0.57)  <0.001  ***
# 3                AGEGROUP                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795            SSQ_5_6_adequateTRUE:AGEGROUP2: 40-59  0.92 (0.29 ~ 2.94)   0.891     
# 4                AGEGROUP                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795              SSQ_5_6_adequateTRUE:AGEGROUP3: 60+  1.25 (0.35 ~ 4.49)   0.736     
# 5                AGEGROUP                                      1: 20-39  697    65 0.09325681 2635536.2 236928.90 0.08989780                             SSQ_5_6_adequateTRUE  0.28 (0.14 ~ 0.56)  <0.001  ***
# 6                AGEGROUP                                      2: 40-59  516    41 0.07945736 2197062.2 170643.81 0.07766908                             SSQ_5_6_adequateTRUE  0.23 (0.09 ~ 0.61)   0.004  ** 
# 7                AGEGROUP                                        3: 60+  314    20 0.06369427 1453150.3  88297.12 0.06076255                             SSQ_5_6_adequateTRUE  0.35 (0.10 ~ 1.18)   0.093     
# 8                  GENDER                                     MainModel 1527   126 0.08251473 6285748.8 495869.83 0.07888795                             SSQ_5_6_adequateTRUE  0.29 (0.18 ~ 0.47)  <0.001  ***
# 9                  GENDER                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795                             SSQ_5_6_adequateTRUE  0.29 (0.12 ~ 0.74)   0.010  *  
# 10                 GENDER                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795             SSQ_5_6_adequateTRUE:GENDER2: Female  0.98 (0.31 ~ 3.04)   0.970     
# 11                 GENDER                                       1: Male  642    38 0.05919003 2931913.3 160841.70 0.05485896                             SSQ_5_6_adequateTRUE  0.26 (0.09 ~ 0.75)   0.014  *  
# 12                 GENDER                                     2: Female  885    88 0.09943503 3353835.6 335028.13 0.09989402                             SSQ_5_6_adequateTRUE  0.28 (0.16 ~ 0.51)  <0.001  ***
# 13                US_BORN                                     MainModel 1527   126 0.08251473 6285748.8 495869.83 0.07888795                             SSQ_5_6_adequateTRUE  0.29 (0.18 ~ 0.47)  <0.001  ***
# 14                US_BORN                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795                             SSQ_5_6_adequateTRUE  0.18 (0.10 ~ 0.33)  <0.001  ***
# 15                US_BORN                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795             SSQ_5_6_adequateTRUE:US_BORN2: Other  3.23 (1.17 ~ 8.93)   0.025  *  
# 16                US_BORN 1: US-Born, 50 States, DC, PR and Territories  851    80 0.09400705 3366499.2 291459.27 0.08657637                             SSQ_5_6_adequateTRUE  0.16 (0.09 ~ 0.30)  <0.001  ***
# 17                US_BORN                                      2: Other  668    44 0.06586826 2879275.9 194005.99 0.06738013                             SSQ_5_6_adequateTRUE  0.64 (0.28 ~ 1.47)   0.295     
# 18         INC10K_integer                                     MainModel 1527   126 0.08251473 6285748.8 495869.83 0.07888795                             SSQ_5_6_adequateTRUE  0.29 (0.18 ~ 0.47)  <0.001  ***
# 19         INC10K_integer                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795                             SSQ_5_6_adequateTRUE  0.43 (0.19 ~ 0.99)   0.049  *  
# 20         INC10K_integer                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795              SSQ_5_6_adequateTRUE:INC10K_integer  0.90 (0.76 ~ 1.08)   0.257     
# 21                 INC25K                                     MainModel 1527   126 0.08251473 6285748.8 495869.83 0.07888795                             SSQ_5_6_adequateTRUE  0.29 (0.18 ~ 0.47)  <0.001  ***
# 22                 INC25K                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795                             SSQ_5_6_adequateTRUE  0.36 (0.18 ~ 0.70)   0.003  ** 
# 23                 INC25K                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795 SSQ_5_6_adequateFALSE:INC25K2: $25,000 - $49,999  0.81 (0.26 ~ 2.51)   0.714     
# 24                 INC25K                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795  SSQ_5_6_adequateTRUE:INC25K2: $25,000 - $49,999  0.66 (0.19 ~ 2.38)   0.532     
# 25                 INC25K                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795 SSQ_5_6_adequateFALSE:INC25K3: $50,000 - $74,999  0.85 (0.10 ~ 7.23)   0.881     
# 26                 INC25K                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795  SSQ_5_6_adequateTRUE:INC25K3: $50,000 - $74,999  0.77 (0.11 ~ 5.23)   0.792     
# 27                 INC25K                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795 SSQ_5_6_adequateFALSE:INC25K4: $75,000 - $99,999 0.33 (0.01 ~ 11.75)   0.541     
# 28                 INC25K                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795  SSQ_5_6_adequateTRUE:INC25K4: $75,000 - $99,999  0.09 (0.00 ~ 4.00)   0.213     
# 29                 INC25K                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795 SSQ_5_6_adequateFALSE:INC25K5: $100,000  or more 0.57 (0.01 ~ 27.93)   0.780     
# 30                 INC25K                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795  SSQ_5_6_adequateTRUE:INC25K5: $100,000  or more  0.21 (0.00 ~ 8.83)   0.414     
# 31                 INC25K                          1: Less than $25,000  461    68 0.14750542 1877752.6 247922.47 0.13203149                             SSQ_5_6_adequateTRUE  0.31 (0.15 ~ 0.65)   0.002  ** 
# 32                 INC25K                          2: $25,000 - $49,999  290    19 0.06551724 1170457.2  78998.67 0.06749386                             SSQ_5_6_adequateTRUE  0.32 (0.10 ~ 1.03)   0.060     
# 33                 INC25K                          3: $50,000 - $74,999  169    15 0.08875740  671752.1  64974.34 0.09672368                             SSQ_5_6_adequateTRUE  0.27 (0.06 ~ 1.30)   0.106     
# 34                 INC25K                          4: $75,000 - $99,999  142     4 0.02816901  551401.0  15190.32 0.02754859                             SSQ_5_6_adequateTRUE  0.00 (0.00 ~ 0.00)  <0.001  ***
# 35                 INC25K                          5: $100,000  or more  252     6 0.02380952 1031816.1  28739.24 0.02785307                             SSQ_5_6_adequateTRUE  0.02 (0.00 ~ 0.51)   0.021  *  
# 36        INC25KMOD_ge50k                                     MainModel 1527   126 0.08251473 6285748.8 495869.83 0.07888795                             SSQ_5_6_adequateTRUE  0.29 (0.18 ~ 0.47)  <0.001  ***
# 37        INC25KMOD_ge50k                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795                             SSQ_5_6_adequateTRUE  0.34 (0.19 ~ 0.60)  <0.001  ***
# 38        INC25KMOD_ge50k                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795        SSQ_5_6_adequateFALSE:INC25KMOD_ge50kTRUE  1.83 (0.45 ~ 7.51)   0.402     
# 39        INC25KMOD_ge50k                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795         SSQ_5_6_adequateTRUE:INC25KMOD_ge50kTRUE  1.03 (0.25 ~ 4.23)   0.972     
# 40        INC25KMOD_ge50k                                         FALSE  964   101 0.10477178 4030779.6 386965.93 0.09600275                             SSQ_5_6_adequateTRUE  0.33 (0.18 ~ 0.58)  <0.001  ***
# 41        INC25KMOD_ge50k                                          TRUE  563    25 0.04440497 2254969.2 108903.90 0.04829507                             SSQ_5_6_adequateTRUE  0.22 (0.07 ~ 0.70)   0.011  *  
# 42        INC25KMOD_ge75k                                     MainModel 1527   126 0.08251473 6285748.8 495869.83 0.07888795                             SSQ_5_6_adequateTRUE  0.29 (0.18 ~ 0.47)  <0.001  ***
# 43        INC25KMOD_ge75k                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795                             SSQ_5_6_adequateTRUE  0.33 (0.20 ~ 0.55)  <0.001  ***
# 44        INC25KMOD_ge75k                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795        SSQ_5_6_adequateFALSE:INC25KMOD_ge75kTRUE  0.71 (0.12 ~ 4.00)   0.694     
# 45        INC25KMOD_ge75k                     MainModel_and_interaction 1527   126 0.08251473 6285748.8 495869.83 0.07888795         SSQ_5_6_adequateTRUE:INC25KMOD_ge75kTRUE  0.26 (0.06 ~ 1.08)   0.066     
# 46        INC25KMOD_ge75k                                         FALSE 1133   116 0.10238305 4702531.7 451940.27 0.09610574                             SSQ_5_6_adequateTRUE  0.32 (0.19 ~ 0.55)  <0.001  ***
# 47        INC25KMOD_ge75k                                          TRUE  394    10 0.02538071 1583217.1  43929.56 0.02774702                             SSQ_5_6_adequateTRUE  0.10 (0.01 ~ 0.76)   0.028  *  
# Warning message:
# glm.fit: algorithm did not converge 



c("AGEGROUP", "GENDER", "US_BORN", "INC10K_integer", "INC25K", "INC25KMOD_ge50k", "INC25KMOD_ge75k") %>% {set_names(map(., function(chr) {
    function.svyglm.MainModel.byEffectModifier(data = data, formula4MainModel = formula4MainModel, subscript4MainModel = "10var", varname4EffectModifier = chr)
}), .)} %>% map(function(ls) ls$table4manuscript) %>% bind_rows(.id = "varname4EffectModifier") %>% openxlsx::write.xlsx("svyglm.MainModel.byEffectModifier.xlsx")
openxlsx::openXL("svyglm.MainModel.byEffectModifier.xlsx")




#@ end -----
