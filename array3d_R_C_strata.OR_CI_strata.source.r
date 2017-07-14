# OR_CI_strata.source
# array3d_R_C_strata.OR_CI_strata.source
# 170630 170704 170713

matrix2x2.OR_CI = function(matrix2x2) {
  # source("https://github.com/mkim0710/tidystat/raw/master/array3d_R_C_strata.OR_CI_strata.source.r")
  # version 170630
  library(tidyverse)
  out = list()
  if(length(matrix2x2) == 4) {
    OR = matrix2x2[1,1] * matrix2x2[2,2] / matrix2x2[1,2] / matrix2x2[2,1]
    SE_ln_OR = sqrt(1/matrix2x2[1,1] + 1/matrix2x2[1,2] + 1/matrix2x2[2,1] + 1/matrix2x2[2,2])
    out$OR = OR
    out$OR_LowerLimit = exp( log(OR) - 1.96 * SE_ln_OR )
    out$OR_UpperLimit = exp( log(OR) + 1.96 * SE_ln_OR )
  } else {
    print("error: not matrix2x2")
  }
  out %>% as.tibble
}

array3d_R_C_strata.OR_CI_strata = function(array3d_R_C_strata) {
  # source("https://github.com/mkim0710/tidystat/raw/master/array3d_R_C_strata.OR_CI_strata.source.r")
  # version 170713
  library(tidyverse)
  # if(is.null(array3d_R_C_strata)) array3d_R_C_strata = table(df_x1_x2_z)
  if( length(dim(array3d_R_C_strata)) == 3 & dim(array3d_R_C_strata)[1] == 2 & dim(array3d_R_C_strata)[2] == 2 ) {
    out = list()
    OR_CI_crude = matrix2x2.OR_CI(apply(array3d_R_C_strata, 1:2, sum)) %>% as.tibble %>% rownames_to_column()

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

    out = reduce(list(OR_CI_crude = OR_CI_crude, OR_CI_MH = OR_CI_MH, OR_CI_strata= OR_CI_strata), function(x, y) full_join(x, y, by = c("rowname", "OR", "OR_LowerLimit", "OR_UpperLimit")))
    out$MHWeight =
      c(NA, NA
        , array3d_R_C_strata[1,2,] * array3d_R_C_strata[2,1,] / apply(array3d_R_C_strata, 3, sum)
        )

    #@ ------
    array3d_R_C_strata.rename = array3d_R_C_strata
    dimnames(array3d_R_C_strata.rename) = list(
      Row = paste0("Row", 1:2)
      , Col = paste0("Col", 1:2)
      , Strata = paste0("Strata", 1:(dim(array3d_R_C_strata.rename)[3]))
    )
    N_spread = full_join(
      apply(array3d_R_C_strata.rename, 1:2, sum) %>% as.table %>% as.tibble() %>%
        unite(Row, Col, col = "Row_Col", sep = "_") %>%
        spread(key = Row_Col, value = n) %>%
        add_column(Strata = "", .before = 1)
      ,
      array3d_R_C_strata.rename %>% as.table %>% as.tibble() %>%
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
      , Strata = paste0("Strata", 1:(dim(array3d_R_C_strata)[3]))
    )
  } else if( is.null( dimnames(array3d_R_C_strata) [[3]] ) ) {
    dimnames(array3d_R_C_strata) [[3]] = paste0("Strata", 1:(dim(array3d_R_C_strata)[3]))
  }

  out$rowname = c("OR_crude", "OR_MH", dimnames(array3d_R_C_strata)[[3]])
  out = bind_cols(out, out2)
  out
}


#@ test -------
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
                 
# > array3d_R_C_strata.OR_CI_strata( array(1:12, dim = c(2, 2, 3)) )
# # A tibble: 5 x 10
#    rowname        OR OR_LowerLimit OR_UpperLimit MHWeight  R1C1  R1C2  R2C1  R2C2  Ntot
#      <chr>     <dbl>         <dbl>         <dbl>    <dbl> <int> <int> <int> <int> <int>
# 1 OR_crude 0.9523810    0.38666600      2.345770       NA    15    21    18    24    78
# 2    OR_MH 0.9328686    0.37651087      2.311338       NA    15    21    18    24    78
# 3  Strata1 0.6666667    0.03938062     11.285867 0.600000     1     3     2     4    10
# 4  Strata2 0.9523810    0.19987414      4.538003 1.615385     5     7     6     8    26
# 5  Strata3 0.9818182    0.29081865      3.314667 2.619048     9    11    10    12    42

                 
#@ test2 ------
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
                 
# > array3d_R_C_strata.OR_CI_strata(
# +   array(
# +     c( 2, 90, 2, 660
# +        , 16,360,13,1250
# +        , 41,557, 7, 774
# +        ,35,449, 5, 173)
# +     , dim = c(2,2,4)
# +     , dimnames = map2(
# +       list(Row = "R", Col = "C", Strata = "S")
# +       , c(2,2,4)
# +       , function(x, y) paste0(x,1:y)
# +     )
# +   )
# + )
# # A tibble: 6 x 10
#    rowname       OR OR_LowerLimit OR_UpperLimit  MHWeight  R1C1  R1C2  R2C1  R2C2  Ntot
#      <chr>    <dbl>         <dbl>         <dbl>     <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
# 1 OR_crude 6.831451      4.432434     10.528916        NA    94    27  1456  2857  4434
# 2    OR_MH 4.951486      3.086112      7.944369        NA    94    27  1456  2857  4434
# 3       S1 7.333333      1.020299     52.707886 0.2387268     2     2    90   660   754
# 4       S2 4.273504      2.036538      8.967591 2.8553996    16    13   360  1250  1639
# 5       S3 8.139010      3.624603     18.276067 2.8274112    41     7   557   774  1379
# 6       S4 2.697105      1.039611      6.997205 3.3912387    35     5   449   173   662


