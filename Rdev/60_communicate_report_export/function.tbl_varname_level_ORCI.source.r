# function.tbl_varname_level_ORCI.dev.r
# modified from function.tbl_varname_level_HRCI.dev.r & function.lm_object.summary.coefCI.dev.r

function.tbl_varname_level_ORCI = function (object.glm, focus.variable = ".*", digits = 2, coef.exp = T, use.confint.default = F) {
    library(tidyverse)
    
    if(use.confint.default) {
        function.confint = confint.default
    } else {
        function.confint = confint
    }
    
    list_levels = object.glm$xlevels  # debug181027 for logical variables appended with "TRUE" in the dataseet.
    list_levels = c(list_levels, which(object.glm$terms %>% attr(., "dataClasses") == "logical") |> names() %>% {set_names(map(., function(x) c("FALSE", "TRUE")), .)})  # debug181027 for logical variables appended with "TRUE" in the dataseet.
          
    # debug 200222) as_tibble() removes the rownames -_- -----                                                                            
    # debug 200222) right_join() instead of full_join() to remove something like strata(MatchingPairID) -_- -----                                                                            
    #@ tbl_varname_level_coefficients ====
    if (length(list_levels) == 0) { # debug 181115 ----
        tbl_varname_level_coefficients = tibble(varname = character(0), level = character(0), varnamelevel = character(0)) %>% right_join(
                tibble(varnamelevel = names(object.glm$coefficients), coefficients = object.glm$coefficients), by = "varnamelevel"
            ) #----
    } else {
        tbl_varname_level_coefficients = 
            list_levels %>% enframe(name = "varname", value = "level") %>% unnest(cols = c(level)) %>% mutate(varnamelevel = paste0(varname, level)) %>% right_join(
                tibble(varnamelevel = names(object.glm$coefficients), coefficients = object.glm$coefficients), by = "varnamelevel"
            ) #----
    }
    
    tbl_varname_level_coefficients$coefficients[is.na(tbl_varname_level_coefficients$coefficients) & !is.na(tbl_varname_level_coefficients$level)] = 0
    tbl_varname_level_coefficients$varname[is.na(tbl_varname_level_coefficients$varname)] = 
        tbl_varname_level_coefficients$varnamelevel[is.na(tbl_varname_level_coefficients$varname)] 
    
    #@ function.extractOR.focus.incl.reference() ----
    # res1 = summary(object.glm)[c("coefficients", "conf.int")] %>% 
    #     map(as.data.frame) %>% map(rownames_to_column) %>% reduce(full_join, by = c("rowname", "exp(coef)")) %>% 
    #     {.[c("rowname", "exp(coef)", "lower .95", "upper .95", "Pr(>|z|)")]}
    
    object.glm.confint.df = as.data.frame(function.confint(object.glm)) |> rownames_to_column()
    object.glm.summary.coef.df = as.data.frame(coef(summary(object.glm))) |> rownames_to_column()
    if (coef.exp == T) {
        object.glm.confint.df$`2.5 %` = exp(object.glm.confint.df$`2.5 %`)
        object.glm.confint.df$`97.5 %` = exp(object.glm.confint.df$`97.5 %`)
        object.glm.summary.coef.df$Estimate = exp(object.glm.summary.coef.df$Estimate)
    }
    
    # object.glm.summary.coef.df %>% full_join(object.glm.confint.df) |> names() |> dput()
    # # Joining, by = "rowname"
    # # c("rowname", "Estimate", "Std. Error", "z value", "Pr(>|z|)", "2.5 %", "97.5 %")
    res1 = object.glm.summary.coef.df %>% full_join(object.glm.confint.df) %>% 
        {.[c("rowname", "Estimate", "2.5 %", "97.5 %", "Pr(>|z|)")]}


    sprintf_but_ceiling5 = function(fmt='%#.2f', x, ...) {
        sprintf(fmt = fmt, x + 10^(-9), ...)
    }



    # debug 200222 ----
    res2 = tibble(
        rowname = res1$rowname
        , ORCI = res1[c("Estimate", "2.5 %", "97.5 %")] %>% {.[. > 99.99 & . < Inf] = 99.99; .} %>% 
            map_df(sprintf_but_ceiling5,  fmt = paste0("%.", digits, "f")) %>% 
            transmute(ORCI = paste0(Estimate, " (", `2.5 %`, ", ", `97.5 %`, ")") %>% gsub("99.99", ">100", .)) |> unlist()
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
    tbl_varname_level_coefficients_res$Estimate[is.na(tbl_varname_level_coefficients_res$Estimate) & !is.na(tbl_varname_level_coefficients_res$level)] = 1
    tbl_varname_level_coefficients_res$ORCI[is.na(tbl_varname_level_coefficients_res$ORCI) & !is.na(tbl_varname_level_coefficients_res$level)] = "(reference)"
    
    # tbl_varname_level_coefficients_res |> names() |> dput() 
    # c("varname", "level", "varnamelevel", "coefficients", "ORCI", "p_value", "star", "Estimate", "2.5 %", "97.5 %", "Pr(>|z|)")
    out = tbl_varname_level_coefficients_res %>% select(varname, level, ORCI, p_value, star, everything())
}


