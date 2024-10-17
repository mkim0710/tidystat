# function.polr_object.summary.exp.dev.r




## @ ==============  
function.polr_object.summary.exp.old = function(polr_object, sprintf_fmt_decimal = 2, coef.exp = T, p.adjust_method = c("fdr", "bonferroni"), allow_multple_spaces = T) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.polr_object.summary.exp.dev.r")
    if(!"polr" %in% class(polr_object)) {
        stop("!\"polr\" %in% class(polr_object)")
    }
    # browser()
    .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    polr_object.confint.df = as.data.frame(confint(polr_object))
    # Browse[2]> polr_object.confint.df
    #                                               2.5 %    97.5 %
    # PM25.tn1m.floor_month.cut[16,36)         -0.1870221 0.2732142
    # PM25.tn1m.floor_month.cut[36,76)         -0.2799603 0.6413914
    # PM25.tn1m_tn12m.mean.quartile[22.1,23.7) -0.3200673 0.2428590
    # PM25.tn1m_tn12m.mean.quartile[23.7,25.5) -0.1620685 0.4009898
    # PM25.tn1m_tn12m.mean.quartile[25.5,35.6] -0.1122733 0.4679151
    
    polr_object.summary.coef.df = as.data.frame(coef(summary(polr_object))) |> rownames_to_column()
    # Browse[2]> polr_object.summary.coef.df
    #                                    rowname       Value Std. Error    t value
    # 1         PM25.tn1m.floor_month.cut[16,36)  0.04292861  0.1173646  0.3657713
    # 2         PM25.tn1m.floor_month.cut[36,76)  0.18014250  0.2347003  0.7675426
    # 3 PM25.tn1m_tn12m.mean.quartile[22.1,23.7) -0.03856559  0.1435554 -0.2686460
    # 4 PM25.tn1m_tn12m.mean.quartile[23.7,25.5)  0.11931343  0.1435889  0.8309378
    # 5 PM25.tn1m_tn12m.mean.quartile[25.5,35.6]  0.17762783  0.1479558  1.2005462
    # 6                                      1|2 -0.39438021  0.1228659 -3.2098426
    # 7                                      2|3  0.10122662  0.1226745  0.8251641
    # 8                                      3|4  0.83481796  0.1246271  6.6985286
    
    if (coef.exp == T) {
        polr_object.confint.df = exp(polr_object.confint.df)
        polr_object.summary.coef.df$Value = exp(polr_object.summary.coef.df$Value)
    }
    
    # # https://stackoverflow.com/questions/3443687/formatting-decimal-places-in-r
    # tmp.df = data.frame(coefCI = paste0(
    #     format(round(polr_object.summary.coef.df$Value, round_digits), nsmall = round_digits)
    #     , " ("
    #     , format(round(polr_object.confint.df$`2.5 %`, round_digits), nsmall = round_digits)
    #     , " ~ "
    #     , format(round(polr_object.confint.df$`97.5 %`, round_digits), nsmall = round_digits)
    #     , ")"
    # ), stringsAsFactors = F)
    # # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
    # tmp.df = data.frame(coefCI = paste0(
    #     format(polr_object.summary.coef.df$Value, digits = format_digits, nsmall = format_digits)
    #     , " ("
    #     , format(polr_object.confint.df$`2.5 %`, digits = format_digits, nsmall = format_digits)
    #     , " ~ "
    #     , format(polr_object.confint.df$`97.5 %`, digits = format_digits, nsmall = format_digits)
    #     , ")"
    # ), stringsAsFactors = F)
    # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
    # digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(c(polr_object.summary.coef.dfEstimate,glmobject.confint.df`2.5 %`, polr_object.confint.df$`97.5 %`), na.rm = T) %>% log10 %>% trunc) + 1


    # browser()
    # tmp.vec = c(polr_object.summary.coef.df$Value, polr_object.confint.df$`2.5 %`, polr_object.confint.df$`97.5 %`)
    # tmp.vec[is.infinite(tmp.vec)] = NA
    tmp.mat = polr_object.summary.coef.df %>% select(rowname, Value) %>% 
        left_join(polr_object.confint.df %>% rownames_to_column) %>% 
        column_to_rownames |> as.matrix()
    # Browse[2]> tmp.mat
    #                                              Value     2.5 %   97.5 %
    # PM25.tn1m.floor_month.cut[16,36)         1.0438634 0.8294254 1.314182
    # PM25.tn1m.floor_month.cut[36,76)         1.1973880 0.7558138 1.899121
    # PM25.tn1m_tn12m.mean.quartile[22.1,23.7) 0.9621686 0.7261002 1.274889
    # PM25.tn1m_tn12m.mean.quartile[23.7,25.5) 1.1267230 0.8503830 1.493302
    # PM25.tn1m_tn12m.mean.quartile[25.5,35.6] 1.1943807 0.8937999 1.596662
    # 1|2                                      0.6740977        NA       NA
    # 2|3                                      1.1065274        NA       NA
    # 3|4                                      2.3043945        NA       NA
    
    tmp.vec = tmp.mat |> as.vector()
    tmp.vec[is.infinite(tmp.vec)] = NA
    if (allow_multple_spaces == T) {  # 180816
        digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(tmp.vec, na.rm = T) %>% log10 %>% trunc) + 1
        if (any(c(polr_object.summary.coef.df$Value, polr_object.confint.df$`2.5 %`, polr_object.confint.df$`97.5 %`) < 0, na.rm = T) ) {
            digits_total_incl_decimal = digits_total_incl_decimal + 1
        }
    } else {
        digits_total_incl_decimal = 0
    }

    # tmp.df = data.frame(coefCI = paste0(
    #     sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), polr_object.summary.coef.df$Value)
    #     , " ("
    #     , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), polr_object.confint.df$`2.5 %`)
    #     , " ~ "
    #     , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), polr_object.confint.df$`97.5 %`)
    #     , ")"
    # ), stringsAsFactors = F)
    tmp.df = 
        polr_object.summary.coef.df %>% select(rowname, Value) %>% 
        left_join(polr_object.confint.df %>% rownames_to_column) %>% 
        transmute(
            # rowname = rowname
            # , 
            coefCI = paste0(
                sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), Value)
                , " ("
                , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), `2.5 %`)
                , " ~ "
                , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), `97.5 %`)
                , ")"
            )
        )


    # browser()
    
    # tmp.dfpvalue=glmobject.summary.coef.df`Pr(>|z|)` %>% round(3) |> as.character()
    # varname4Pr = colnames(polr_object.summary.coef.df) %>% grep("^Pr", ., value = T)  # debug 180806) in polr() `Pr(>|z|)`, in svypolr() `Pr(>|t|)`
    # tmp.df$p_value = sprintf("%.3f", p_value.vector)
    
    # https://stats.idre.ucla.edu/r/dae/ordinal-logistic-regression/
    p_value.vector = pnorm(abs(polr_object.summary.coef.df[, "t value"]), lower.tail = FALSE) * 2
    
    tmp.df$`p_value(raw)` = p_value.vector
    
    tmp.df$p_value = sprintf("%.3f", p_value.vector)
    tmp.df$p_value[p_value.vector <= 0.001] = "<0.001"

    tmp.df$star = "   "
    tmp.df$star[p_value.vector <= 0.1] = ".  "
    tmp.df$star[p_value.vector <= 0.05] = "*  "
    tmp.df$star[p_value.vector <= 0.01] = "** "
    tmp.df$star[p_value.vector <= 0.001] = "***"
    
    for (i in 1:length(p.adjust_method)) {
        tmp.df[[paste0("p.adjust.", i)]] = p_value.vector %>% p.adjust(method = p.adjust_method[i])
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
    
    # browser()
    # Browse[2]> tmp.df
    #               coefCI             p_value star  p.fdr *fdr  p.bon *bon
    # 1 1.04 (0.83 ~ 1.31)   0.714535711194999       0.788       1.000     
    # 2 1.20 (0.76 ~ 1.90)    0.44275895241191       0.590       1.000     
    # 3 0.96 (0.73 ~ 1.27)   0.788202117295699       0.788       1.000     
    # 4 1.13 (0.85 ~ 1.49)   0.406008773903626       0.590       1.000     
    # 5 1.19 (0.89 ~ 1.60)   0.229927284606375       0.590       1.000     
    # 6 0.67 (0.83 ~ 1.31) 0.00132807697361657  **   0.005  **   0.011  *  
    # 7 1.11 (0.76 ~ 1.90)   0.409278412534491       0.590       1.000     
    # 8 2.30 (0.73 ~ 1.27)              <0.001  *** <0.001  *** <0.001  ***


    # out = cbind(
    #     polr_object.summary.coef.df$rowname
    #     , tmp.df
    #     , polr_object.summary.coef.df[ , 1:2]
    #     , polr_object.confint.df
    #     , polr_object.summary.coef.df[ , -1:(-2)]
    #     , stringsAsFactors = F
    # )
    out = cbind(
        polr_object.summary.coef.df %>% select(rowname)
        , tmp.df
        , polr_object.summary.coef.df %>% select(-rowname)
        , stringsAsFactors = F
    )
    out = out %>% 
        full_join(polr_object.confint.df %>% rownames_to_column)
    
    if (coef.exp == T) {
        names(out) [2] = "ORCI"
        # names(out) [names(out) == "Estimate"] = "exp(Estimate)"
        names(out) [names(out) == "Value"] = "exp(Estimate)"
        names(out) [names(out) == "2.5 %"] = "exp(2.5 %)"
        names(out) [names(out) == "97.5 %"] = "exp(97.5 %)"
    }
    # out = out |> as_tibble()
    row.names(out) = NULL
    out
}







## @ ==============  
function.polr_object.summary.exp.approx = function(polr_object, sprintf_fmt_decimal = 2, coef.exp = T, p.adjust_method = c("fdr", "bonferroni"), allow_multple_spaces = T) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.polr_object.summary.exp.dev.r")
    if(!"polr" %in% class(polr_object)) {
        stop("!\"polr\" %in% class(polr_object)")
    }
    # browser()
    .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    # polr_object.confint.df = as.data.frame(confint(polr_object))
    # # Browse[2]> polr_object.confint.df
    # #                                               2.5 %    97.5 %
    # # PM25.tn1m.floor_month.cut[16,36)         -0.1870221 0.2732142
    # # PM25.tn1m.floor_month.cut[36,76)         -0.2799603 0.6413914
    # # PM25.tn1m_tn12m.mean.quartile[22.1,23.7) -0.3200673 0.2428590
    # # PM25.tn1m_tn12m.mean.quartile[23.7,25.5) -0.1620685 0.4009898
    # # PM25.tn1m_tn12m.mean.quartile[25.5,35.6] -0.1122733 0.4679151
    
    polr_object.summary.coef.df = polr_object |> 
        summary() |> 
        coef() |> 
        as.data.frame() |> rownames_to_column() %>% 
        mutate(LowerLimit = Value - 2 * `Std. Error`, UpperLimit = Value + 2 * `Std. Error`) %>% 
        mutate(PValue = pnorm(abs(`t value`), lower.tail = FALSE) * 2)     
    # https://stats.idre.ucla.edu/r/dae/ordinal-logistic-regression/

    
    if (coef.exp == T) {
        polr_object.summary.coef.df =
            polr_object.summary.coef.df %>% 
            mutate(
                Value = Value |> exp()
                , LowerLimit = LowerLimit |> exp()
                , UpperLimit = UpperLimit |> exp()
            )
    }
    
    # # https://stackoverflow.com/questions/3443687/formatting-decimal-places-in-r
    # tmp.df = data.frame(coefCI = paste0(
    #     format(round(polr_object.summary.coef.df$Value, round_digits), nsmall = round_digits)
    #     , " ("
    #     , format(round(polr_object.confint.df$LowerLimit, round_digits), nsmall = round_digits)
    #     , " ~ "
    #     , format(round(polr_object.confint.df$UpperLimit, round_digits), nsmall = round_digits)
    #     , ")"
    # ), stringsAsFactors = F)
    # # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
    # tmp.df = data.frame(coefCI = paste0(
    #     format(polr_object.summary.coef.df$Value, digits = format_digits, nsmall = format_digits)
    #     , " ("
    #     , format(polr_object.confint.df$LowerLimit, digits = format_digits, nsmall = format_digits)
    #     , " ~ "
    #     , format(polr_object.confint.df$UpperLimit, digits = format_digits, nsmall = format_digits)
    #     , ")"
    # ), stringsAsFactors = F)
    # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
    # digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(c(polr_object.summary.coef.dfEstimate,glmobject.confint.dfLowerLimit, polr_object.confint.df$UpperLimit), na.rm = T) %>% log10 %>% trunc) + 1


    # browser()
    # tmp.vec = c(polr_object.summary.coef.df$Value, polr_object.confint.df$LowerLimit, polr_object.confint.df$UpperLimit)
    # tmp.vec[is.infinite(tmp.vec)] = NA
    tmp.mat = polr_object.summary.coef.df %>% select(rowname, Value, LowerLimit, UpperLimit) %>% 
        column_to_rownames |> as.matrix()
    # Browse[2]> tmp.mat
    #                                              Value     2.5 %   97.5 %
    # PM25.tn1m.floor_month.cut[16,36)         1.0438634 0.8294254 1.314182
    # PM25.tn1m.floor_month.cut[36,76)         1.1973880 0.7558138 1.899121
    # PM25.tn1m_tn12m.mean.quartile[22.1,23.7) 0.9621686 0.7261002 1.274889
    # PM25.tn1m_tn12m.mean.quartile[23.7,25.5) 1.1267230 0.8503830 1.493302
    # PM25.tn1m_tn12m.mean.quartile[25.5,35.6] 1.1943807 0.8937999 1.596662
    # 1|2                                      0.6740977        NA       NA
    # 2|3                                      1.1065274        NA       NA
    # 3|4                                      2.3043945        NA       NA
    
    tmp.vec = tmp.mat |> as.vector()
    tmp.vec[is.infinite(tmp.vec)] = NA
    if (allow_multple_spaces == T) {  # 180816
        digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(tmp.vec, na.rm = T) %>% log10 %>% trunc) + 1
        if (any(c(polr_object.summary.coef.df$Value, polr_object.summary.coef.df$LowerLimit, polr_object.summary.coef.df$UpperLimit) < 0, na.rm = T) ) {
            digits_total_incl_decimal = digits_total_incl_decimal + 1
        }
    } else {
        digits_total_incl_decimal = 0
    }

    # tmp.df = data.frame(coefCI = paste0(
    #     sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), polr_object.summary.coef.df$Value)
    #     , " ("
    #     , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), polr_object.confint.df$LowerLimit)
    #     , " ~ "
    #     , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), polr_object.confint.df$UpperLimit)
    #     , ")"
    # ), stringsAsFactors = F)
    tmp.df = 
        polr_object.summary.coef.df %>% 
        transmute(
            coefCI = paste0(
                sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), Value)
                , " ("
                , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), LowerLimit)
                , " ~ "
                , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), UpperLimit)
                , ")"
            )
        )

    
    # tmp.dfpvalue=glmobject.summary.coef.df`Pr(>|z|)` %>% round(3) |> as.character()
    # varname4Pr = colnames(polr_object.summary.coef.df) %>% grep("^Pr", ., value = T)  # debug 180806) in polr() `Pr(>|z|)`, in svypolr() `Pr(>|t|)`
    # tmp.df$p_value = sprintf("%.3f", polr_object.summary.coef.df$PValue)
    
    tmp.df$p_value = sprintf("%.3f", polr_object.summary.coef.df$PValue)
    tmp.df$p_value[polr_object.summary.coef.df$PValue <= 0.001] = "<0.001"

    tmp.df$star = "   "
    tmp.df$star[polr_object.summary.coef.df$PValue <= 0.1] = ".  "
    tmp.df$star[polr_object.summary.coef.df$PValue <= 0.05] = "*  "
    tmp.df$star[polr_object.summary.coef.df$PValue <= 0.01] = "** "
    tmp.df$star[polr_object.summary.coef.df$PValue <= 0.001] = "***"
    
    for (i in 1:length(p.adjust_method)) {
        tmp.df[[paste0("p.adjust.", i)]] = polr_object.summary.coef.df$PValue %>% p.adjust(method = p.adjust_method[i])
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
    
    # browser()
    # Browse[2]> tmp.df
    #               coefCI             p_value star  p.fdr *fdr  p.bon *bon
    # 1 1.04 (0.83 ~ 1.31)   0.714535711194999       0.788       1.000     
    # 2 1.20 (0.76 ~ 1.90)    0.44275895241191       0.590       1.000     
    # 3 0.96 (0.73 ~ 1.27)   0.788202117295699       0.788       1.000     
    # 4 1.13 (0.85 ~ 1.49)   0.406008773903626       0.590       1.000     
    # 5 1.19 (0.89 ~ 1.60)   0.229927284606375       0.590       1.000     
    # 6 0.67 (0.83 ~ 1.31) 0.00132807697361657  **   0.005  **   0.011  *  
    # 7 1.11 (0.76 ~ 1.90)   0.409278412534491       0.590       1.000     
    # 8 2.30 (0.73 ~ 1.27)              <0.001  *** <0.001  *** <0.001  ***


    # out = cbind(
    #     polr_object.summary.coef.df$rowname
    #     , tmp.df
    #     , polr_object.summary.coef.df[ , 1:2]
    #     , polr_object.confint.df
    #     , polr_object.summary.coef.df[ , -1:(-2)]
    #     , stringsAsFactors = F
    # )
    out = cbind(
        polr_object.summary.coef.df %>% select(rowname)
        , tmp.df
        , polr_object.summary.coef.df %>% select(-rowname)
        , stringsAsFactors = F
    )

    
    if (coef.exp == T) {
        names(out) [2] = "ORCI"
        # names(out) [names(out) == "Estimate"] = "exp(Estimate)"
        names(out) [names(out) == "Value"] = "exp(Estimate)"
        names(out) [names(out) == "2.5 %"] = "exp(2.5 %)"
        names(out) [names(out) == "97.5 %"] = "exp(97.5 %)"
    }
    # out = out |> as_tibble()
    row.names(out) = NULL
    out
}






## @ ==============  
function.polr_object.summary.exp.clean = function(polr_object, sprintf_fmt_decimal = 2, coef.exp = T, p.adjust_method = c("fdr", "bonferroni"), allow_multple_spaces = T) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.polr_object.summary.exp.dev.r")
    if(!"polr" %in% class(polr_object)) {
        stop("!\"polr\" %in% class(polr_object)")
    }
    # browser()
    .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    polr_object.confint.df = as.data.frame(confint(polr_object))
    # Browse[2]> polr_object.confint.df
    #                                               2.5 %    97.5 %
    # PM25.tn1m.floor_month.cut[16,36)         -0.1870221 0.2732142
    # PM25.tn1m.floor_month.cut[36,76)         -0.2799603 0.6413914
    # PM25.tn1m_tn12m.mean.quartile[22.1,23.7) -0.3200673 0.2428590
    # PM25.tn1m_tn12m.mean.quartile[23.7,25.5) -0.1620685 0.4009898
    # PM25.tn1m_tn12m.mean.quartile[25.5,35.6] -0.1122733 0.4679151
    
    
    polr_object.summary.coef.df = polr_object |> 
        summary() |> 
        coef() |> 
        as.data.frame() |> rownames_to_column() %>% 
        mutate(LowerLimit.approx = Value - 2 * `Std. Error`, UpperLimit.approx = Value + 2 * `Std. Error`) %>% 
        mutate(PValue.approx = pnorm(abs(`t value`), lower.tail = FALSE) * 2)     
    # https://stats.idre.ucla.edu/r/dae/ordinal-logistic-regression/

    if (coef.exp == T) {
        polr_object.confint.df = exp(polr_object.confint.df)
        polr_object.summary.coef.df =
            polr_object.summary.coef.df %>% 
            mutate(
                Value = Value |> exp()
                , LowerLimit.approx = LowerLimit.approx |> exp()
                , UpperLimit.approx = UpperLimit.approx |> exp()
            )
    }
    
    # # https://stackoverflow.com/questions/3443687/formatting-decimal-places-in-r
    # tmp.df = data.frame(coefCI = paste0(
    #     format(round(polr_object.summary.coef.df$Value, round_digits), nsmall = round_digits)
    #     , " ("
    #     , format(round(polr_object.confint.df$`2.5 %`, round_digits), nsmall = round_digits)
    #     , " ~ "
    #     , format(round(polr_object.confint.df$`97.5 %`, round_digits), nsmall = round_digits)
    #     , ")"
    # ), stringsAsFactors = F)
    # # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
    # tmp.df = data.frame(coefCI = paste0(
    #     format(polr_object.summary.coef.df$Value, digits = format_digits, nsmall = format_digits)
    #     , " ("
    #     , format(polr_object.confint.df$`2.5 %`, digits = format_digits, nsmall = format_digits)
    #     , " ~ "
    #     , format(polr_object.confint.df$`97.5 %`, digits = format_digits, nsmall = format_digits)
    #     , ")"
    # ), stringsAsFactors = F)
    # http://www.dummies.com/programming/r/how-to-format-numbers-in-r/
    # digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(c(polr_object.summary.coef.dfEstimate,glmobject.confint.df`2.5 %`, polr_object.confint.df$`97.5 %`), na.rm = T) %>% log10 %>% trunc) + 1


    # browser()
    # tmp.vec = c(polr_object.summary.coef.df$Value, polr_object.confint.df$`2.5 %`, polr_object.confint.df$`97.5 %`)
    # tmp.vec[is.infinite(tmp.vec)] = NA
    # tmp.mat = polr_object.summary.coef.df %>% select(rowname, Value) %>% 
    #     left_join(polr_object.confint.df %>% rownames_to_column) %>% 
    #     column_to_rownames |> as.matrix()
    tmp.mat = polr_object.summary.coef.df %>% select(rowname, Value) %>% 
        inner_join(polr_object.confint.df %>% rownames_to_column) %>% 
        column_to_rownames |> as.matrix()
    # Browse[2]> tmp.mat
    #                                              Value     2.5 %   97.5 %
    # PM25.tn1m.floor_month.cut[16,36)         1.0438634 0.8294254 1.314182
    # PM25.tn1m.floor_month.cut[36,76)         1.1973880 0.7558138 1.899121
    # PM25.tn1m_tn12m.mean.quartile[22.1,23.7) 0.9621686 0.7261002 1.274889
    # PM25.tn1m_tn12m.mean.quartile[23.7,25.5) 1.1267230 0.8503830 1.493302
    # PM25.tn1m_tn12m.mean.quartile[25.5,35.6] 1.1943807 0.8937999 1.596662
    # 1|2                                      0.6740977        NA       NA
    # 2|3                                      1.1065274        NA       NA
    # 3|4                                      2.3043945        NA       NA
    
    tmp.vec = tmp.mat |> as.vector()
    tmp.vec[is.infinite(tmp.vec)] = NA
    if (allow_multple_spaces == T) {  # 180816
        digits_total_incl_decimal = sprintf_fmt_decimal + 1 + (max(tmp.vec, na.rm = T) %>% log10 %>% trunc) + 1
        if (any(c(polr_object.summary.coef.df$Value, polr_object.confint.df$`2.5 %`, polr_object.confint.df$`97.5 %`) < 0, na.rm = T) ) {
            digits_total_incl_decimal = digits_total_incl_decimal + 1
        }
    } else {
        digits_total_incl_decimal = 0
    }

    # tmp.df = data.frame(coefCI = paste0(
    #     sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), polr_object.summary.coef.df$Value)
    #     , " ("
    #     , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), polr_object.confint.df$`2.5 %`)
    #     , " ~ "
    #     , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), polr_object.confint.df$`97.5 %`)
    #     , ")"
    # ), stringsAsFactors = F)
    tmp.df = 
        polr_object.summary.coef.df %>% 
        # left_join(polr_object.confint.df %>% rownames_to_column) %>% 
        inner_join(polr_object.confint.df %>% rownames_to_column) %>% 
        mutate(
            coefCI = paste0(
                sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), Value)
                , " ("
                , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), `2.5 %`)
                , " ~ "
                , sprintf(paste0("%", digits_total_incl_decimal, ".", sprintf_fmt_decimal, "f"), `97.5 %`)
                , ")"
            )
        ) %>% 
        select(rowname, coefCI, PValue.approx)


    # browser()
    
    # tmp.dfPValue.approx=glmobject.summary.coef.df`Pr(>|z|)` %>% round(3) |> as.character()
    # varname4Pr = colnames(polr_object.summary.coef.df) %>% grep("^Pr", ., value = T)  # debug 180806) in polr() `Pr(>|z|)`, in svypolr() `Pr(>|t|)`
    # tmp.df$PValue.clean = sprintf("%.3f", PValue.clean.vector)
    
    
    # browser()
    # Browse[2]> tmp.df
    #               coefCI
    # 1 1.04 (0.83 ~ 1.31)
    # 2 1.20 (0.76 ~ 1.90)
    # 3 0.96 (0.73 ~ 1.27)
    # 4 1.13 (0.85 ~ 1.49)
    # 5 1.19 (0.89 ~ 1.60)
    # Browse[2]> polr_object.summary.coef.df
    #                                    rowname     Value Std. Error    t value LowerLimit.approx UpperLimit.approx PValue.approx
    # 1         PM25.tn1m.floor_month.cut[16,36) 1.0438634  0.1173646  0.3657713         0.8254714         1.3200345  7.145357e-01
    # 2         PM25.tn1m.floor_month.cut[36,76) 1.1973880  0.2347003  0.7675426         0.7488189         1.9146659  4.427590e-01
    # 3 PM25.tn1m_tn12m.mean.quartile[22.1,23.7) 0.9621686  0.1435554 -0.2686460         0.7220387         1.2821589  7.882021e-01
    # 4 PM25.tn1m_tn12m.mean.quartile[23.7,25.5) 1.1267230  0.1435889  0.8309378         0.8454685         1.5015399  4.060088e-01
    # 5 PM25.tn1m_tn12m.mean.quartile[25.5,35.6] 1.1943807  0.1479558  1.2005462         0.8884438         1.6056675  2.299273e-01
    # 6                                      1|2 0.6740977  0.1228659 -3.2098426         0.5272334         0.8618721  1.328077e-03
    # 7                                      2|3 1.1065274  0.1226745  0.8251641         0.8657817         1.4142165  4.092784e-01
    # 8                                      3|4 2.3043945  0.1246271  6.6985286         1.7960033         2.9566950  2.105285e-11
    
    tmp.df$PValue.clean = sprintf("%.3f", tmp.df$PValue.approx)
    tmp.df$PValue.clean[tmp.df$PValue.approx <= 0.001] = "<0.001"

    tmp.df$star = "   "
    tmp.df$star[tmp.df$PValue.approx <= 0.1] = ".  "
    tmp.df$star[tmp.df$PValue.approx <= 0.05] = "*  "
    tmp.df$star[tmp.df$PValue.approx <= 0.01] = "** "
    tmp.df$star[tmp.df$PValue.approx <= 0.001] = "***"
    
    for (i in 1:length(p.adjust_method)) {
        tmp.df[[paste0("p.adjust.", i)]] = tmp.df$PValue.approx %>% p.adjust(method = p.adjust_method[i])
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
    
    # browser()
    # Browse[2]> tmp.df
    #               coefCI             PValue.clean star  p.fdr *fdr  p.bon *bon
    # 1 1.04 (0.83 ~ 1.31)   0.714535711194999       0.788       1.000     
    # 2 1.20 (0.76 ~ 1.90)    0.44275895241191       0.590       1.000     
    # 3 0.96 (0.73 ~ 1.27)   0.788202117295699       0.788       1.000     
    # 4 1.13 (0.85 ~ 1.49)   0.406008773903626       0.590       1.000     
    # 5 1.19 (0.89 ~ 1.60)   0.229927284606375       0.590       1.000     
    # 6 0.67 (0.83 ~ 1.31) 0.00132807697361657  **   0.005  **   0.011  *  
    # 7 1.11 (0.76 ~ 1.90)   0.409278412534491       0.590       1.000     
    # 8 2.30 (0.73 ~ 1.27)              <0.001  *** <0.001  *** <0.001  ***


    # out = cbind(
    #     polr_object.summary.coef.df$rowname
    #     , tmp.df
    #     , polr_object.summary.coef.df[ , 1:2]
    #     , polr_object.confint.df
    #     , polr_object.summary.coef.df[ , -1:(-2)]
    #     , stringsAsFactors = F
    # )
    out = tmp.df %>% 
        inner_join(polr_object.summary.coef.df) %>% 
        inner_join(polr_object.confint.df %>% rownames_to_column)
    
    if (coef.exp == T) {
        names(out) [2] = "ORCI"
        # names(out) [names(out) == "Estimate"] = "exp(Estimate)"
        names(out) [names(out) == "Value"] = "exp(Estimate)"
        names(out) [names(out) == "2.5 %"] = "exp(2.5 %)"
        names(out) [names(out) == "97.5 %"] = "exp(97.5 %)"
    }
    # out = out |> as_tibble()
    row.names(out) = NULL
    out
}






AnalyticDataset200621.polr_LC_Stage.recode.ordered_list$polr_LC_Stage.recode.ordered_1var %>% function.polr_object.summary.exp.old #-----
AnalyticDataset200621.polr_LC_Stage.recode.ordered_list$polr_LC_Stage.recode.ordered_1var %>% function.polr_object.summary.exp.approx #-----
# > AnalyticDataset200621.polr_LC_Stage.recode.ordered_list$polr_LC_Stage.recode.ordered_1var %>% function.polr_object.summary.exp.old #-----  
# Waiting for profiling to be done...
# 
# Re-fitting to get Hessian
# 
# 
# Re-fitting to get Hessian
# 
# Joining, by = "rowname"
# Joining, by = "rowname"
# Joining, by = "rowname"
#                                    rowname               ORCI p_value(raw) p_value star  p.fdr *fdr  p.bon *bon exp(Estimate) Std. Error    t value exp(2.5 %) exp(97.5 %)
# 1         PM25.tn1m.floor_month.cut[16,36) 1.04 (0.83 ~ 1.31) 7.145357e-01   0.715       0.788       1.000          1.0438634  0.1173646  0.3657713  0.8294254    1.314182
# 2         PM25.tn1m.floor_month.cut[36,76) 1.20 (0.76 ~ 1.90) 4.427590e-01   0.443       0.590       1.000          1.1973880  0.2347003  0.7675426  0.7558138    1.899121
# 3 PM25.tn1m_tn12m.mean.quartile[22.1,23.7) 0.96 (0.73 ~ 1.27) 7.882021e-01   0.788       0.788       1.000          0.9621686  0.1435554 -0.2686460  0.7261002    1.274889
# 4 PM25.tn1m_tn12m.mean.quartile[23.7,25.5) 1.13 (0.85 ~ 1.49) 4.060088e-01   0.406       0.590       1.000          1.1267230  0.1435889  0.8309378  0.8503830    1.493302
# 5 PM25.tn1m_tn12m.mean.quartile[25.5,35.6] 1.19 (0.89 ~ 1.60) 2.299273e-01   0.230       0.590       1.000          1.1943807  0.1479558  1.2005462  0.8937999    1.596662
# 6                                      1|2 0.67 (  NA ~   NA) 1.328077e-03   0.001  **   0.005  **   0.011  *       0.6740977  0.1228659 -3.2098426         NA          NA
# 7                                      2|3 1.11 (  NA ~   NA) 4.092784e-01   0.409       0.590       1.000          1.1065274  0.1226745  0.8251641         NA          NA
# 8                                      3|4 2.30 (  NA ~   NA) 2.105285e-11  <0.001  *** <0.001  *** <0.001  ***     2.3043945  0.1246271  6.6985286         NA          NA
# > AnalyticDataset200621.polr_LC_Stage.recode.ordered_list$polr_LC_Stage.recode.ordered_1var %>% function.polr_object.summary.exp.approx #-----  
# 
# Re-fitting to get Hessian
# 
#                                    rowname               ORCI p_value star  p.fdr *fdr  p.bon *bon exp(Estimate) Std. Error    t value LowerLimit UpperLimit       PValue
# 1         PM25.tn1m.floor_month.cut[16,36) 1.04 (0.83 ~ 1.32)   0.715       0.788       1.000          1.0438634  0.1173646  0.3657713  0.8254714  1.3200345 7.145357e-01
# 2         PM25.tn1m.floor_month.cut[36,76) 1.20 (0.75 ~ 1.91)   0.443       0.590       1.000          1.1973880  0.2347003  0.7675426  0.7488189  1.9146659 4.427590e-01
# 3 PM25.tn1m_tn12m.mean.quartile[22.1,23.7) 0.96 (0.72 ~ 1.28)   0.788       0.788       1.000          0.9621686  0.1435554 -0.2686460  0.7220387  1.2821589 7.882021e-01
# 4 PM25.tn1m_tn12m.mean.quartile[23.7,25.5) 1.13 (0.85 ~ 1.50)   0.406       0.590       1.000          1.1267230  0.1435889  0.8309378  0.8454685  1.5015399 4.060088e-01
# 5 PM25.tn1m_tn12m.mean.quartile[25.5,35.6] 1.19 (0.89 ~ 1.61)   0.230       0.590       1.000          1.1943807  0.1479558  1.2005462  0.8884438  1.6056675 2.299273e-01
# 6                                      1|2 0.67 (0.53 ~ 0.86)   0.001  **   0.005  **   0.011  *       0.6740977  0.1228659 -3.2098426  0.5272334  0.8618721 1.328077e-03
# 7                                      2|3 1.11 (0.87 ~ 1.41)   0.409       0.590       1.000          1.1065274  0.1226745  0.8251641  0.8657817  1.4142165 4.092784e-01
# 8                                      3|4 2.30 (1.80 ~ 2.96)  <0.001  *** <0.001  *** <0.001  ***     2.3043945  0.1246271  6.6985286  1.7960033  2.9566950 2.105285e-11


# > AnalyticDataset200621.polr_LC_Stage.recode.ordered_list$polr_LC_Stage.recode.ordered_1var %>% function.polr_object.summary.exp.clean #-----  
# Waiting for profiling to be done...
# 
# Re-fitting to get Hessian
# 
# 
# Re-fitting to get Hessian
# 
# Joining, by = "rowname"
# Joining, by = "rowname"
# Joining, by = c("rowname", "PValue.approx")
# Joining, by = "rowname"
#                                    rowname               ORCI PValue.approx PValue.clean star p.fdr *fdr p.bon *bon exp(Estimate) Std. Error    t value
# 1         PM25.tn1m.floor_month.cut[16,36) 1.04 (0.83 ~ 1.31)     0.7145357        0.715      0.788      1.000          1.0438634  0.1173646  0.3657713
# 2         PM25.tn1m.floor_month.cut[36,76) 1.20 (0.76 ~ 1.90)     0.4427590        0.443      0.738      1.000          1.1973880  0.2347003  0.7675426
# 3 PM25.tn1m_tn12m.mean.quartile[22.1,23.7) 0.96 (0.73 ~ 1.27)     0.7882021        0.788      0.788      1.000          0.9621686  0.1435554 -0.2686460
# 4 PM25.tn1m_tn12m.mean.quartile[23.7,25.5) 1.13 (0.85 ~ 1.49)     0.4060088        0.406      0.738      1.000          1.1267230  0.1435889  0.8309378
# 5 PM25.tn1m_tn12m.mean.quartile[25.5,35.6] 1.19 (0.89 ~ 1.60)     0.2299273        0.230      0.738      1.000          1.1943807  0.1479558  1.2005462
#   LowerLimit.approx UpperLimit.approx exp(2.5 %) exp(97.5 %)
# 1         0.8254714          1.320034  0.8294254    1.314182
# 2         0.7488189          1.914666  0.7558138    1.899121
# 3         0.7220387          1.282159  0.7261002    1.274889
# 4         0.8454685          1.501540  0.8503830    1.493302
# 5         0.8884438          1.605667  0.8937999    1.596662



# @@ END-----  
