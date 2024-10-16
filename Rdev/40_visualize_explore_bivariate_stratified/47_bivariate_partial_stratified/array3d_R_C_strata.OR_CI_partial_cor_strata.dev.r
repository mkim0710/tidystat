# OR_CI_strata.source
# array3d_R_C_strata.OR_CI_strata.source
# array3d_R_C_strata.OR_CI_partial_cor_strata.source
# 170630 170704 170713 170717
# debug 170717 function.sequence_with_leading_zeros()


function.binary2numeric = function(x) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.binary2numeric.dev.r")
    # caution) as.numeric(CategoricalVariable_3MoreLevels)
    if (is.character(x)) {
        x = as.factor(x)
    }
    if (length(levels(x)) == 2) {
        x = as.numeric(x)
    }
    if (is.logical(x)) {
        x = as.numeric(x)
    } 
    x
}

array3d_R_C_strata2df = function(array3d_R_C_strata) {
    # .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    x1x2z.df = array3d_R_C_strata |> as.table() |> as.data.frame()
    
    index = map(1:nrow(x1x2z.df), function(i) rep(i, x1x2z.df[i,4])) |> unlist()
    out = x1x2z.df[index, ]
    # out = out %>% map_df(as.numeric)
    out
}
## @ test) array3d_R_C_strata2df() --------  
# > array3d_R_C_strata2df(array(1:12, dim = c(2, 2, 3))) |> as_tibble()
# # A tibble: 78 x 4
#      Var1   Var2   Var3  Freq
#  * <fctr> <fctr> <fctr> <int>
#  1      A      A      A     1
#  2      B      A      A     2
#  3      B      A      A     2
#  4      A      B      A     3
#  5      A      B      A     3
#  6      A      B      A     3
#  7      B      B      A     4
#  8      B      B      A     4
#  9      B      B      A     4
# 10      B      B      A     4
# # ... with 68 more rows        


matrix2x2.OR_CI = function(matrix2x2) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/matrix2x2.OR_CI_phi.dev.r")
    # version 170630
    # .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    out = list()
    if(length(matrix2x2) == 4) {
        OR = matrix2x2[1,1] * matrix2x2[2,2] / matrix2x2[1,2] / matrix2x2[2,1]
        SE_ln_OR = sqrt(1/matrix2x2[1,1] + 1/matrix2x2[1,2] + 1/matrix2x2[2,1] + 1/matrix2x2[2,2])
        out$OR = OR
        out$OR_LowerLimit = exp( log(OR) - 1.96 * SE_ln_OR )
        out$OR_UpperLimit = exp( log(OR) + 1.96 * SE_ln_OR )
        
        # out$phi = matrix2x2.phi(matrix2x2)
        
    } else {
        print("error: not matrix2x2")
    }
    out |> as_tibble()
}


x1x2z.partial_correlation = function(x1, x2, z, cor_method = c("pearson", "spearman", "kendall")) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/x1x2z.patial_correlation.dev.r")
    # .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    
    # caution) as.numeric(CategoricalVariable_3MoreLevels)
    x1.binary2numeric = function.binary2numeric(x1)
    x2.binary2numeric = function.binary2numeric(x2)
    
    resid1 = lm(x1.binary2numeric ~ z)$residuals
    resid2 = lm(x2.binary2numeric ~ z)$residuals
    
    out = map(
        seq_along(cor_method)
        , function(i) {
            unadjusted_cor = cor(x1.binary2numeric, x2.binary2numeric, method = cor_method[i])
            partial_cor = cor(resid1, resid2, method = cor_method[i])
            list(unadjusted_cor = unadjusted_cor, partial_cor = partial_cor)
        }
    )
    names(out) = cor_method
    out = out %>% map(unlist)
    out = out |> as.data.frame() 
    out = out %>% t |> as.data.frame()
    out
}
## @ test) x1x2z.partial_correlation() ------  
# > tmp.df = array3d_R_C_strata2df(array(1:12, dim = c(2, 2, 3)))
# > x1x2z.partial_correlation(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]])
#          unadjusted_cor partial_cor
# pearson      -0.0120125 -0.01699817
# spearman     -0.0120125  0.16198062
# kendall      -0.0120125  0.14541024



function.sequence_with_leading_zeros = function(num) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.sequence_with_leading_zeros.dev.r")
    digits_with_leading_zeros = trunc(log10(num)) + 1
    sprintf(paste0("%0",digits_with_leading_zeros,"d"), 1:num)
}


# array3d_R_C_strata.OR_CI_partial_cor_strata = function(array3d_R_C_strata, .cor_method = c("pearson", "spearman", "kendall")) {
array3d_R_C_strata.OR_CI_partial_cor_strata = function(array3d_R_C_strata, .cor_method = "pearson") {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/array3d_R_C_strata.OR_CI_partial_cor_strata.dev.r")
    # version 170717
    # .packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
    # if(is.null(array3d_R_C_strata)) array3d_R_C_strata = table(df_x1_x2_z)
    if( length(dim(array3d_R_C_strata)) == 3 & dim(array3d_R_C_strata)[1] == 2 & dim(array3d_R_C_strata)[2] == 2 ) {
        out = list()
        OR_CI_crude = matrix2x2.OR_CI(apply(array3d_R_C_strata, 1:2, sum)) |> as_tibble() %>% rownames_to_column()
        
        Ri = array3d_R_C_strata[1,1,] * array3d_R_C_strata[2,2,] / apply(array3d_R_C_strata, 3, sum)
        Si = array3d_R_C_strata[1,2,] * array3d_R_C_strata[2,1,] / apply(array3d_R_C_strata, 3, sum)
        OR_MH = sum(Ri) / sum(Si)
        
        Pi = (array3d_R_C_strata[1,1,] + array3d_R_C_strata[2,2,]) / apply(array3d_R_C_strata, 3, sum)
        Qi = (array3d_R_C_strata[1,2,] + array3d_R_C_strata[2,1,]) / apply(array3d_R_C_strata, 3, sum)
        Vus = (sum(Pi * Ri) / sum(Ri)^2
               + sum(Pi * Si + Qi * Ri) / sum(Ri) / sum(Si)
               + sum(Qi * Si) / sum(Si)^2
        ) / 2
        OR_MH_LowerLimit = exp(log(OR_MH) - 1.96 * sqrt(Vus))
        OR_MH_UpperLimit = exp(log(OR_MH) + 1.96 * sqrt(Vus))
        
        OR_CI_MH = data_frame(OR = OR_MH, OR_LowerLimit = OR_MH_LowerLimit, OR_UpperLimit = OR_MH_UpperLimit) %>% rownames_to_column()
        
        OR_CI_strata = map_df(1:dim(array3d_R_C_strata)[3], function(i) {matrix2x2.OR_CI(array3d_R_C_strata[,,i])}) %>% rownames_to_column()
        # out = reduce(list(OR_CI_crude = OR_CI_crude, OR_CI_MH = OR_CI_MH, OR_CI_strata= OR_CI_strata), function(x, y) full_join(x, y, by = c("rowname", "OR", "OR_LowerLimit", "OR_UpperLimit")))
        # debug 170717
        out = bind_rows(OR_CI_crude, OR_CI_MH, OR_CI_strata)
        out$MHWeight =
            c(NA, NA
              , array3d_R_C_strata[1,2,] * array3d_R_C_strata[2,1,] / apply(array3d_R_C_strata, 3, sum)
            )
        
        #@ partial_correlation ------
        # tmp.df.numeric = array3d_R_C_strata2df(array3d_R_C_strata) %>% map_df(as.numeric)
        # caution) as.numeric(CategoricalVariable)
        tmp.df = array3d_R_C_strata2df(array3d_R_C_strata)
        out.x1x2z.partial_correlation = x1x2z.partial_correlation(x1 = tmp.df[[1]], x2 = tmp.df[[2]], z = tmp.df[[3]], cor_method = .cor_method)
        for (i in .cor_method) {
            # out[[i]] = NA
            # out[1, i] = out.x1x2z.partial_correlation[i, "unadjusted_cor"]
            # out[2, i] = out.x1x2z.partial_correlation[i, "partial_cor"]
            tmp.df.by_Var3 = map(unique(tmp.df[[3]]), function(byVar) tmp.df[tmp.df[[3]] == byVar, ])
            out[[i]] = c(
                out.x1x2z.partial_correlation[i, "unadjusted_cor"]
                , out.x1x2z.partial_correlation[i, "partial_cor"]
                , map_dbl( tmp.df.by_Var3, function(df) cor(function.binary2numeric(df[[1]]), function.binary2numeric(df[[2]]), method = i) )
            )
            
        }
        
        #@ names(out2) = c("R1C1", "R1C2", "R2C1", "R2C2", "Ntot") ------
        array3d_R_C_strata.rename = array3d_R_C_strata
        dimnames(array3d_R_C_strata.rename) = list(
            Row = paste0("Row", 1:2)
            , Col = paste0("Col", 1:2)
            , Strata = paste0("Strata", function.sequence_with_leading_zeros(dim(array3d_R_C_strata.rename)[3]))
        )
        N_spread = full_join(
            apply(array3d_R_C_strata.rename, 1:2, sum) |> as.table() |> as_tibble() %>%
                unite(Row, Col, col = "Row_Col", sep = "_") %>%
                spread(key = Row_Col, value = n) %>%
                add_column(Strata = "", .before = 1)
            ,
            array3d_R_C_strata.rename |> as.table() |> as_tibble() %>%
                unite(Row, Col, col = "Row_Col", sep = "_") %>%
                spread(key = Row_Col, value = n)
            , by = c("Strata", "Row1_Col1", "Row1_Col2", "Row2_Col1", "Row2_Col2")
        ) %>% mutate(N_total = Row1_Col1 + Row1_Col2 + Row2_Col1 + Row2_Col2)
        out2 = bind_rows(N_spread[1,], N_spread) %>% select(-Strata)
        names(out2) = c("R1C1", "R1C2", "R2C1", "R2C2", "Ntot")
    } else {
        print("error: not array3d_R_C_strata")
    }
    bind_rows(N_spread[1,], N_spread)
    
    if(is.null(dimnames(array3d_R_C_strata))) {
        dimnames(array3d_R_C_strata) = list(
            Row = paste0("Row", 1:2)
            , Col = paste0("Col", 1:2)
            , Strata = paste0("Strata", function.sequence_with_leading_zeros(dim(array3d_R_C_strata)[3]))
        )
    } else if( is.null( dimnames(array3d_R_C_strata) [[3]] ) ) {
        dimnames(array3d_R_C_strata) [[3]] = paste0("Strata", function.sequence_with_leading_zeros(dim(array3d_R_C_strata)[3]))
    }
    
    out$rowname = c("Crude Estimate", "Adjusted Estimate", dimnames(array3d_R_C_strata)[[3]])
    out = bind_cols(out, out2)
    out
}

## @ test) array3d_R_C_strata.OR_CI_partial_cor_strata() -------  
# > array(1:12, dim = c(2, 2, 3))
# , , 1
# 
#      [,1] [,2]
# [1,]    1    3
# [2,]    2    4
# 
# , , 2
# 
#      [,1] [,2]
# [1,]    5    7
# [2,]    6    8
# 
# , , 3
# 
#      [,1] [,2]
# [1,]    9   11
# [2,]   10   12

# > array3d_R_C_strata2df(array(1:12, dim = c(2, 2, 3))) |> as_tibble()
# # A tibble: 78 x 4
#      Var1   Var2   Var3  Freq
#  * <fctr> <fctr> <fctr> <int>
#  1      A      A      A     1
#  2      B      A      A     2
#  3      B      A      A     2
#  4      A      B      A     3
#  5      A      B      A     3
#  6      A      B      A     3
#  7      B      B      A     4
#  8      B      B      A     4
#  9      B      B      A     4
# 10      B      B      A     4
# # ... with 68 more rows

# > array3d_R_C_strata.OR_CI_partial_cor_strata( array(1:12, dim = c(2, 2, 3)), .cor_method = c("pearson", "spearman", "kendall"))
# # A tibble: 5 x 13
#             rowname        OR OR_LowerLimit OR_UpperLimit MHWeight     pearson    spearman     kendall  R1C1  R1C2  R2C1  R2C2  Ntot
#               <chr>     <dbl>         <dbl>         <dbl>    <dbl>       <dbl>       <dbl>       <dbl> <int> <int> <int> <int> <int>
# 1    Crude Estimate 0.9523810    0.38666600      2.345770       NA -0.01201250 -0.01201250 -0.01201250    15    21    18    24    78
# 2 Adjusted Estimate 0.9328686    0.37651087      2.311338       NA -0.01699817  0.16198062  0.14541024    15    21    18    24    78
# 3           Strata1 0.6666667    0.03938062     11.285867 0.600000 -0.08908708 -0.08908708 -0.08908708     1     3     2     4    10
# 4           Strata2 0.9523810    0.19987414      4.538003 1.615385 -0.01201250 -0.01201250 -0.01201250     5     7     6     8    26
# 5           Strata3 0.9818182    0.29081865      3.314667 2.619048 -0.00456103 -0.00456103 -0.00456103     9    11    10    12    42


## @ test2) array3d_R_C_strata.OR_CI_partial_cor_strata() ------  
# > array(
# +   c( 2, 90, 2, 660
# +      , 16,360,13,1250
# +      , 41,557, 7, 774
# +      ,35,449, 5, 173)
# +   , dim = c(2,2,4)
# +   , dimnames = map2(
# +     list(Row = "R", Col = "C", Strata = "S")
# +     , c(2,2,4)
# +     , function(x, y) paste0(x,1:y)
# +   )
# + )
# , , Strata = S1
# 
#     Col
# Row  C1  C2
#   R1  2   2
#   R2 90 660
# 
# , , Strata = S2
# 
#     Col
# Row   C1   C2
#   R1  16   13
#   R2 360 1250
# 
# , , Strata = S3
# 
#     Col
# Row   C1  C2
#   R1  41   7
#   R2 557 774
# 
# , , Strata = S4
# 
#     Col
# Row   C1  C2
#   R1  35   5
#   R2 449 173

# > array3d_R_C_strata.OR_CI_partial_cor_strata(array(c(2, 90, 2, 660, 16, 360, 13, 1250, 41,557, 7, 774, 35, 449, 5, 173), dim = c(2,2,4), dimnames = map2(list(Row = "R", Col = "C", Strata = "S"), c(2,2,4), function(x, y) paste0(x,1:y))), .cor_method = c("pearson", "spearman", "kendall"))
# # A tibble: 6 x 13
#             rowname       OR OR_LowerLimit OR_UpperLimit  MHWeight    pearson   spearman    kendall  R1C1  R1C2  R2C1  R2C2  Ntot
#               <chr>    <dbl>         <dbl>         <dbl>     <dbl>      <dbl>      <dbl>      <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
# 1    Crude Estimate 6.831451      4.432434     10.528916        NA 0.15009142 0.15009142 0.15009142    94    27  1456  2857  4434
# 2 Adjusted Estimate 4.951486      3.086112      7.944369        NA 0.11774341 0.18154665 0.23937835    94    27  1456  2857  4434
# 3                S1 7.333333      1.020299     52.707886 0.2387268 0.08433762 0.08433762 0.08433762     2     2    90   660   754
# 4                S2 4.273504      2.036538      8.967591 2.8553996 0.10288480 0.10288480 0.10288480    16    13   360  1250  1639
# 5                S3 8.139010      3.624603     18.276067 2.8274112 0.16114078 0.16114078 0.16114078    41     7   557   774  1379
# 6                S4 2.697105      1.039611      6.997205 3.3912387 0.08229380 0.08229380 0.08229380    35     5   449   173   662
