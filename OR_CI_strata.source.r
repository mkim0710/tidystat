# OR_CI_strata.source
# 170630



OR_CI = function(matrix2x2) {
  # source("https://github.com/mkim0710/tidystat/raw/master/OR_CI_strata.source.r")
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



OR_CI_strata = function(array3d_R_C_strata) {
  # source("https://github.com/mkim0710/tidystat/raw/master/OR_CI_strata.source.r")
  # version 170704
  library(tidyverse)
  if( length(dim(array3d_R_C_strata)) == 3 & dim(array3d_R_C_strata)[1] == 2 & dim(array3d_R_C_strata)[2] == 2 ) {
    out = list()
    OR_CI_crude = OR_CI(apply(array3d_R_C_strata, 1:2, sum)) %>% as.tibble %>% rownames_to_column()

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

    OR_CI_strata = map_df(1:dim(array3d_R_C_strata)[3], function(i) {OR_CI(array3d_R_C_strata[,,i])}) %>% rownames_to_column()

    out = reduce(list(OR_CI_crude = OR_CI_crude, OR_CI_MH = OR_CI_MH, OR_CI_strata= OR_CI_strata), function(x, y) full_join(x, y, by = c("rowname", "OR", "OR_LowerLimit", "OR_UpperLimit")))
    out$MHWeight =
      c(NA, NA
        , array3d_R_C_strata[1,2,] * array3d_R_C_strata[2,1,] / apply(array3d_R_C_strata, 3, sum)
        )

    #@ ------
    array3d_R_C_strata.rename = array3d_R_C_strata
    names(dimnames(array3d_R_C_strata.rename)) = c("Row", "Col", "Strata")
    dimnames(array3d_R_C_strata.rename)$Row = paste0("Row", 1:2)
    dimnames(array3d_R_C_strata.rename)$Col = paste0("Col", 1:2)
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

  out$rowname = c("OR_crude", "OR_MH", dimnames(array3d_R_C_strata)[[3]])
  out = bind_cols(out, out2)
  out
}

