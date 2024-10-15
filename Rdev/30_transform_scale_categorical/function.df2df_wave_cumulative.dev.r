



library(dplyr)
library(purrr)

# https://github.com/mkim0710/tidystat/blob/master/Rdev/30_transform_scale_categorical/function.df2df_wave.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/30_transform_scale_categorical/function.df2df_wave_cumulative.dev.r
function.df2df_wave_cumulative <- function(df, vector_wave, vector_colname_at_wave = NULL, VERBOSE = FALSE) {
    if(!is.numeric(vector_wave)) {
        warning("vector_wave is not numeric"); cat("  \n", sep="")
        vector_wave = vector_wave |> as.numeric()
    }
    if(is.null(vector_colname_at_wave)) {
        vector_colname_at_wave = names(df)
    }
    if(length(vector_wave) != length(vector_colname_at_wave)) {
        stop("vector_wave and vector_colname_at_wave must have the same length")
    }
    # if(any(vector_colname_at_wave) %in% names(df)) {
    #     stop("vector_colname_at_wave must included in names(df)")
    # }

    # Creating an empty matrix
    # df_wave <- matrix(nrow = nrow(df), ncol = max(vector_wave))
    df_wave = as_tibble(array(dim = c(nrow(df), max(vector_wave))))

    for (i in seq_along(vector_wave)) {
        if(VERBOSE) {
            cat("Column name for time = ", vector_wave[i], " : ", vector_colname_at_wave[i], "\n")
        }

        # Check if the column name exists in the dataframe
        if(!(vector_colname_at_wave[i] %in% names(df))) {
            warning("Column ", vector_colname_at_wave[i], " does not exist in the dataframe"); cat("  \n", sep="")
            next
        }
        
        df_wave[, vector_wave[i]] <- df[[vector_colname_at_wave[i]]]
    }
    colnames(df_wave)[vector_wave] = vector_colname_at_wave
    # return(df_wave)
    
    df_wave_cumulative = as_tibble(array(dim = c(nrow(df), max(vector_wave))))
    names(df_wave_cumulative) = paste0(names(df_wave), "_cumulative")
    for (i in seq_along(df_wave_cumulative)) {
        # df_wave_cumulative[,i] = df_wave[,1:i] %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} |> unname()
        if (i == 1) {
            df_wave_cumulative[[i]] = df_wave[[1]] |> as.integer()
        } else {
            df_wave_cumulative[[i]] = if_else(is.na(df_wave[[i]]), df_wave_cumulative[[i-1]], df_wave[[i]]+df_wave_cumulative[[i-1]] )
        }
    }
    # return(df_wave_cumulative)
    # bind_cols(df_wave, df_wave_cumulative)
    list(df_wave = df_wave, df_wave_cumulative = df_wave_cumulative)
}

# Example usage with vectors
tmp.df = list_df_defDM.indicators %>% map(function(df) {df %>% select_if(is.logical)}) %>% {.$GLU60_TR} 
tmp.df |> str()
# tmp.df |> as.matrix() |> str()
# tmp.df |> head()
# > tmp.df |> str()
# tibble [10,030 × 3] (S3: tbl_df/tbl/data.frame)
#  $ A01_GLU60_TR_ge200: Named logi [1:10030] FALSE FALSE FALSE NA FALSE FALSE ...
#   ..- attr(*, "names")= chr [1:10030] "99 >=200" "139 >=200" "176 >=200" "NA >=200" ...
#  $ A06_GLU60_TR_ge200: Named logi [1:10030] FALSE NA FALSE NA FALSE FALSE ...
#   ..- attr(*, "names")= chr [1:10030] "92 >=200" "NA >=200" "148 >=200" "NA >=200" ...
#  $ A07_GLU60_TR_ge200: Named logi [1:10030] NA NA FALSE NA FALSE NA ...
#   ..- attr(*, "names")= chr [1:10030] "NA >=200" "NA >=200" "148 >=200" "NA >=200" ...
# > tmp.df |> as.matrix() |> str()
#  logi [1:10030, 1:3] FALSE FALSE FALSE NA FALSE FALSE ...
#  - attr(*, "dimnames")=List of 2
#   ..$ : NULL
#   ..$ : chr [1:3] "A01_GLU60_TR_ge200" "A06_GLU60_TR_ge200" "A07_GLU60_TR_ge200"
# > tmp.df |> head()
# # A tibble: 6 × 3
#   A01_GLU60_TR_ge200 A06_GLU60_TR_ge200 A07_GLU60_TR_ge200
#   <lgl>              <lgl>              <lgl>             
# 1 FALSE              FALSE              NA                
# 2 FALSE              NA                 NA                
# 3 FALSE              FALSE              FALSE             
# 4 NA                 NA                 NA                
# 5 FALSE              FALSE              FALSE             
# 6 FALSE              FALSE              NA                

tmp_df_wave_cumulative <- tmp.df %>% function.df2df_wave_cumulative(as.numeric(sub("A0(\\d+)_.*", "\\1", colnames(.))), VERBOSE = TRUE)
tmp_df_wave_cumulative |> str()
# tmp_df_wave_cumulative |> head()
tmp_df_wave_cumulative$df_wave_cumulative %>% map(function(vec) addmargins(table(vec, useNA = "always")))
# > tmp_df_wave_cumulative |> str()
# List of 2
#  $ df_wave           : tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#   ..$ A01_GLU60_TR_ge200: Named logi [1:10030] FALSE FALSE FALSE NA FALSE FALSE ...
#   .. ..- attr(*, "names")= chr [1:10030] "99 >=200" "139 >=200" "176 >=200" "NA >=200" ...
#   ..$ V2                : logi [1:10030] NA NA NA NA NA NA ...
#   ..$ V3                : logi [1:10030] NA NA NA NA NA NA ...
#   ..$ V4                : logi [1:10030] NA NA NA NA NA NA ...
#   ..$ V5                : logi [1:10030] NA NA NA NA NA NA ...
#   ..$ A06_GLU60_TR_ge200: Named logi [1:10030] FALSE NA FALSE NA FALSE FALSE ...
#   .. ..- attr(*, "names")= chr [1:10030] "92 >=200" "NA >=200" "148 >=200" "NA >=200" ...
#   ..$ A07_GLU60_TR_ge200: Named logi [1:10030] NA NA FALSE NA FALSE NA ...
#   .. ..- attr(*, "names")= chr [1:10030] "NA >=200" "NA >=200" "148 >=200" "NA >=200" ...
#  $ df_wave_cumulative: tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#   ..$ A01_GLU60_TR_ge200_ever: Named num [1:10030] 0 0 0 NA 0 0 1 0 0 0 ...
#   .. ..- attr(*, "names")= chr [1:10030] "99 >=200" "139 >=200" "176 >=200" "NA >=200" ...
#   ..$ V2_ever                : Named num [1:10030] 0 0 0 NA 0 0 1 0 0 0 ...
#   .. ..- attr(*, "names")= chr [1:10030] "99 >=200" "139 >=200" "176 >=200" "NA >=200" ...
#   ..$ V3_ever                : Named num [1:10030] 0 0 0 NA 0 0 1 0 0 0 ...
#   .. ..- attr(*, "names")= chr [1:10030] "99 >=200" "139 >=200" "176 >=200" "NA >=200" ...
#   ..$ V4_ever                : Named num [1:10030] 0 0 0 NA 0 0 1 0 0 0 ...
#   .. ..- attr(*, "names")= chr [1:10030] "99 >=200" "139 >=200" "176 >=200" "NA >=200" ...
#   ..$ V5_ever                : Named num [1:10030] 0 0 0 NA 0 0 1 0 0 0 ...
#   .. ..- attr(*, "names")= chr [1:10030] "99 >=200" "139 >=200" "176 >=200" "NA >=200" ...
#   ..$ A06_GLU60_TR_ge200_ever: Named num [1:10030] 0 0 0 NA 0 0 1 0 0 0 ...
#   .. ..- attr(*, "names")= chr [1:10030] "99 >=200" "139 >=200" "176 >=200" "NA >=200" ...
#   ..$ A07_GLU60_TR_ge200_ever: Named num [1:10030] 0 0 0 NA 0 0 1 0 0 0 ...
#   .. ..- attr(*, "names")= chr [1:10030] "99 >=200" "139 >=200" "176 >=200" "NA >=200" ...
# > # tmp_df_wave_cumulative |> head()
# > tmp_df_wave_cumulative$df_wave_cumulative %>% map(function(vec) addmargins(table(vec, useNA = "always")))
# $A01_GLU60_TR_ge200_ever
# vec
#     0     1  <NA>   Sum 
#  8077  1438   515 10030 
# 
# $V2_ever
# vec
#     0     1  <NA>   Sum 
#  8077  1438   515 10030 
# 
# $V3_ever
# vec
#     0     1  <NA>   Sum 
#  8077  1438   515 10030 
# 
# $V4_ever
# vec
#     0     1  <NA>   Sum 
#  8077  1438   515 10030 
# 
# $V5_ever
# vec
#     0     1  <NA>   Sum 
#  8077  1438   515 10030 
# 
# $A06_GLU60_TR_ge200_ever
# vec
#     0     1     2  <NA>   Sum 
#  7257  2009   283   481 10030 
# 
# $A07_GLU60_TR_ge200_ever
# vec
#     0     1     2     3  <NA>   Sum 
#  6801  2001   604   150   474 10030 


# Applying the function to each dataframe in the list
list_df_wave_cumulative <- list_df_defDM.indicators %>% map(function(df) {df %>% select_if(is.logical)}) %>%
    map(function(dfi) {dfi %>% function.df2df_wave_cumulative(vector_wave = as.numeric(sub("A0(\\d+)_.*", "\\1", names(.))), VERBOSE = F)})

list_df_wave_cumulative |> str(max.level = 2)
list_df_wave_cumulative$DM_C |> str()
list_df_wave_cumulative$GLU60_TR |> str()
# > list_df_wave_cumulative |> str(max.level = 2)
# List of 7
#  $ DM_C     :List of 2
#   ..$ df_wave           : tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#   ..$ df_wave_cumulative: tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#  $ GLU0_TR  :List of 2
#   ..$ df_wave           : tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#   ..$ df_wave_cumulative: tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#  $ GLU60_TR :List of 2
#   ..$ df_wave           : tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#   ..$ df_wave_cumulative: tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#  $ GLU120_TR:List of 2
#   ..$ df_wave           : tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#   ..$ df_wave_cumulative: tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#  $ HBA1C    :List of 2
#   ..$ df_wave           : tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#   ..$ df_wave_cumulative: tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#  $ DRUGDM   :List of 2
#   ..$ df_wave           : tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#   ..$ df_wave_cumulative: tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#  $ DRUGINS  :List of 2
#   ..$ df_wave           : tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#   ..$ df_wave_cumulative: tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
# > list_df_wave_cumulative$DM_C |> str()
# List of 2
#  $ df_wave           : tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#   ..$ A01_DM_C_eq2: Named logi [1:10030] FALSE FALSE FALSE TRUE FALSE FALSE ...
#   .. ..- attr(*, "names")= chr [1:10030] "1 ==2" "1 ==2" "1 ==2" "2 ==2" ...
#   ..$ A02_DM_C_eq2: Named logi [1:10030] FALSE FALSE FALSE TRUE NA FALSE ...
#   .. ..- attr(*, "names")= chr [1:10030] "1 ==2" "1 ==2" "1 ==2" "2 ==2" ...
#   ..$ A03_DM_C_eq2: Named logi [1:10030] FALSE FALSE FALSE TRUE FALSE FALSE ...
#   .. ..- attr(*, "names")= chr [1:10030] "1 ==2" "1 ==2" "1 ==2" "2 ==2" ...
#   ..$ A04_DM_C_eq2: Named logi [1:10030] NA FALSE FALSE TRUE NA FALSE ...
#   .. ..- attr(*, "names")= chr [1:10030] "NA ==2" "1 ==2" "1 ==2" "2 ==2" ...
#   ..$ A05_DM_C_eq2: Named logi [1:10030] FALSE FALSE FALSE TRUE NA FALSE ...
#   .. ..- attr(*, "names")= chr [1:10030] "1 ==2" "1 ==2" "1 ==2" "2 ==2" ...
#   ..$ A06_DM_C_eq2: Named logi [1:10030] FALSE NA FALSE TRUE FALSE FALSE ...
#   .. ..- attr(*, "names")= chr [1:10030] "1 ==2" "NA ==2" "1 ==2" "2 ==2" ...
#   ..$ A07_DM_C_eq2: Named logi [1:10030] NA NA FALSE TRUE FALSE NA ...
#   .. ..- attr(*, "names")= chr [1:10030] "NA ==2" "NA ==2" "1 ==2" "2 ==2" ...
#  $ df_wave_cumulative: tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#   ..$ A01_DM_C_eq2_cumulative: int [1:10030] 0 0 0 1 0 0 0 0 0 0 ...
#   ..$ A02_DM_C_eq2_cumulative: Named int [1:10030] 0 0 0 2 0 0 0 0 0 0 ...
#   .. ..- attr(*, "names")= chr [1:10030] "1 ==2" "1 ==2" "1 ==2" "2 ==2" ...
#   ..$ A03_DM_C_eq2_cumulative: Named int [1:10030] 0 0 0 3 0 0 0 0 0 0 ...
#   .. ..- attr(*, "names")= chr [1:10030] "1 ==2" "1 ==2" "1 ==2" "2 ==2" ...
#   ..$ A04_DM_C_eq2_cumulative: Named int [1:10030] 0 0 0 4 0 0 0 0 1 0 ...
#   .. ..- attr(*, "names")= chr [1:10030] "1 ==2" "1 ==2" "1 ==2" "2 ==2" ...
#   ..$ A05_DM_C_eq2_cumulative: Named int [1:10030] 0 0 0 5 0 0 0 0 2 0 ...
#   .. ..- attr(*, "names")= chr [1:10030] "1 ==2" "1 ==2" "1 ==2" "2 ==2" ...
#   ..$ A06_DM_C_eq2_cumulative: Named int [1:10030] 0 0 0 6 0 0 0 0 3 0 ...
#   .. ..- attr(*, "names")= chr [1:10030] "1 ==2" "1 ==2" "1 ==2" "2 ==2" ...
#   ..$ A07_DM_C_eq2_cumulative: Named int [1:10030] 0 0 0 7 0 0 0 0 4 0 ...
#   .. ..- attr(*, "names")= chr [1:10030] "1 ==2" "1 ==2" "1 ==2" "2 ==2" ...
# > list_df_wave_cumulative$GLU60_TR |> str()
# List of 2
#  $ df_wave           : tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#   ..$ A01_GLU60_TR_ge200: Named logi [1:10030] FALSE FALSE FALSE NA FALSE FALSE ...
#   .. ..- attr(*, "names")= chr [1:10030] "99 >=200" "139 >=200" "176 >=200" "NA >=200" ...
#   ..$ V2                : logi [1:10030] NA NA NA NA NA NA ...
#   ..$ V3                : logi [1:10030] NA NA NA NA NA NA ...
#   ..$ V4                : logi [1:10030] NA NA NA NA NA NA ...
#   ..$ V5                : logi [1:10030] NA NA NA NA NA NA ...
#   ..$ A06_GLU60_TR_ge200: Named logi [1:10030] FALSE NA FALSE NA FALSE FALSE ...
#   .. ..- attr(*, "names")= chr [1:10030] "92 >=200" "NA >=200" "148 >=200" "NA >=200" ...
#   ..$ A07_GLU60_TR_ge200: Named logi [1:10030] NA NA FALSE NA FALSE NA ...
#   .. ..- attr(*, "names")= chr [1:10030] "NA >=200" "NA >=200" "148 >=200" "NA >=200" ...
#  $ df_wave_cumulative: tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#   ..$ A01_GLU60_TR_ge200_cumulative: int [1:10030] 0 0 0 NA 0 0 1 0 0 0 ...
#   ..$ V2_cumulative                : int [1:10030] 0 0 0 NA 0 0 1 0 0 0 ...
#   ..$ V3_cumulative                : int [1:10030] 0 0 0 NA 0 0 1 0 0 0 ...
#   ..$ V4_cumulative                : int [1:10030] 0 0 0 NA 0 0 1 0 0 0 ...
#   ..$ V5_cumulative                : int [1:10030] 0 0 0 NA 0 0 1 0 0 0 ...
#   ..$ A06_GLU60_TR_ge200_cumulative: Named int [1:10030] 0 0 0 NA 0 0 1 0 0 0 ...
#   .. ..- attr(*, "names")= chr [1:10030] "92 >=200" "" "148 >=200" "" ...
#   ..$ A07_GLU60_TR_ge200_cumulative: Named int [1:10030] 0 0 0 NA 0 0 1 0 0 0 ...
#   .. ..- attr(*, "names")= chr [1:10030] "92 >=200" "" "148 >=200" "" ...













## @ debugged - NA if all NAs ----------  
# as1_7.na.Date.fct.select971 %>% select(A01_GLU60_TR) |> summary()
# # > as1_7.na.Date.fct.select971 %>% select(A01_GLU60_TR) |> summary()
# #   A01_GLU60_TR  
# #  Min.   : 14.0  
# #  1st Qu.:115.0  
# #  Median :144.0  
# #  Mean   :151.7  
# #  3rd Qu.:179.0  
# #  Max.   :637.0  
# #  NA's   :515    

tmp.df_wave = list_df_wave$GLU60_TR
# tmp.df_wave
# # # A tibble: 10,030 × 7
# #    A01_GLU60_TR_ge200 V2    V3    V4    V5    A06_GLU60_TR_ge200 A07_GLU60_TR_ge200
# #    <lgl>              <lgl> <lgl> <lgl> <lgl> <lgl>              <lgl>             
# #  1 FALSE              NA    NA    NA    NA    FALSE              NA                
# #  2 FALSE              NA    NA    NA    NA    NA                 NA                
# #  3 FALSE              NA    NA    NA    NA    FALSE              FALSE             
# #  4 NA                 NA    NA    NA    NA    NA                 NA                
# #  5 FALSE              NA    NA    NA    NA    FALSE              FALSE             
# #  6 FALSE              NA    NA    NA    NA    FALSE              NA                
# #  7 TRUE               NA    NA    NA    NA    NA                 NA                
# #  8 FALSE              NA    NA    NA    NA    FALSE              FALSE             
# #  9 FALSE              NA    NA    NA    NA    NA                 NA                
# # 10 FALSE              NA    NA    NA    NA    NA                 NA                
# # # ℹ 10,020 more rows
# # # ℹ Use `print(n = ...)` to see more rows
tmp.df_wave[,1] %>% table(useNA = "always") |> addmargins()
tmp.df_wave[,1] %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") |> addmargins()
tmp.df_wave[,1:5] %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") |> addmargins()
tmp.df_wave[,1:6] %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") |> addmargins()
tmp.df_wave[,1:7] %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") |> addmargins()
tmp.df_wave %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") |> addmargins() 
tmp.df_wave %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} |> str()
# > tmp.df_wave[,1] %>% table(useNA = "always") |> addmargins()
# A01_GLU60_TR_ge200
# FALSE  TRUE  <NA>   Sum 
#  8077  1438   515 10030 
# > tmp.df_wave[,1] %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") |> addmargins()
# .
#     0     1  <NA>   Sum 
#  8077  1438   515 10030 
# > tmp.df_wave[,1:5] %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") |> addmargins()
# .
#     0     1  <NA>   Sum 
#  8077  1438   515 10030 
# > tmp.df_wave[,1:6] %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") |> addmargins()
# .
#     0     1     2  <NA>   Sum 
#  7257  2009   283   481 10030 
# > tmp.df_wave[,1:7] %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") |> addmargins()
# .
#     0     1     2     3  <NA>   Sum 
#  6801  2001   604   150   474 10030 
# > tmp.df_wave %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") |> addmargins() 
# .
#     0     1     2     3  <NA>   Sum 
#  6801  2001   604   150   474 10030 
# > tmp.df_wave %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} |> str()
#  Named num [1:10030] 0 0 0 NA 0 0 1 0 0 0 ...
#  - attr(*, "names")= chr [1:10030] "99 >=200" "139 >=200" "176 >=200" "NA >=200" ...




## @ void2) ----------  
sum(c(NA,NA), na.rm = T)
# [1] 0
tmp.df_wave[,1] %>% rowwise %>% mutate(colSums = sum(c_across(everything()), na.rm=TRUE)) %>% table(useNA = "always") |> addmargins()
# > tmp.df_wave[,1] %>% rowwise %>% mutate(colSums = sum(c_across(everything()), na.rm=TRUE)) %>% table(useNA = "always") |> addmargins()
#                   colSums
# A01_GLU60_TR_ge200     0     1  <NA>   Sum
#              FALSE  8077     0     0  8077
#              TRUE      0  1438     0  1438
#              <NA>    515     0     0   515
#              Sum    8592  1438     0 10030





## @ void) should make NA if all NAs ---------------  
# https://stackoverflow.com/questions/33672059/rowsums-with-all-na

# as1_7.na.Date.fct.select971 %>% select(A01_GLU60_TR) |> summary()
# # > as1_7.na.Date.fct.select971 %>% select(A01_GLU60_TR) |> summary()
# #   A01_GLU60_TR  
# #  Min.   : 14.0  
# #  1st Qu.:115.0  
# #  Median :144.0  
# #  Mean   :151.7  
# #  3rd Qu.:179.0  
# #  Max.   :637.0  
# #  NA's   :515    

tmp.df_wave = list_df_wave$GLU60_TR
# tmp.df_wave
# # # A tibble: 10,030 × 7
# #    A01_GLU60_TR_ge200 V2    V3    V4    V5    A06_GLU60_TR_ge200 A07_GLU60_TR_ge200
# #    <lgl>              <lgl> <lgl> <lgl> <lgl> <lgl>              <lgl>             
# #  1 FALSE              NA    NA    NA    NA    FALSE              NA                
# #  2 FALSE              NA    NA    NA    NA    NA                 NA                
# #  3 FALSE              NA    NA    NA    NA    FALSE              FALSE             
# #  4 NA                 NA    NA    NA    NA    NA                 NA                
# #  5 FALSE              NA    NA    NA    NA    FALSE              FALSE             
# #  6 FALSE              NA    NA    NA    NA    FALSE              NA                
# #  7 TRUE               NA    NA    NA    NA    NA                 NA                
# #  8 FALSE              NA    NA    NA    NA    FALSE              FALSE             
# #  9 FALSE              NA    NA    NA    NA    NA                 NA                
# # 10 FALSE              NA    NA    NA    NA    NA                 NA                
# # # ℹ 10,020 more rows
# # # ℹ Use `print(n = ...)` to see more rows
tmp.df_wave[,1] %>% table(useNA = "always") |> addmargins()
tmp.df_wave[,1] %>% rowSums(na.rm = T) %>% table(useNA = "always") |> addmargins()
tmp.df_wave[,1:5] %>% rowSums(na.rm = T) %>% table(useNA = "always") |> addmargins()
tmp.df_wave[,1:6] %>% rowSums(na.rm = T) %>% table(useNA = "always") |> addmargins()
tmp.df_wave[,1:7] %>% rowSums(na.rm = T) %>% table(useNA = "always") |> addmargins()
tmp.df_wave %>% rowSums(na.rm = T) %>% table(useNA = "always") |> addmargins()
tmp.df_wave %>% rowSums(na.rm = T) |> str()
# > tmp.df_wave[,1] %>% table(useNA = "always") |> addmargins()
# A01_GLU60_TR_ge200
# FALSE  TRUE  <NA>   Sum 
#  8077  1438   515 10030 
# > tmp.df_wave[,1] %>% rowSums(na.rm = T) %>% table(useNA = "always") |> addmargins()
# .
#     0     1  <NA>   Sum 
#  8592  1438     0 10030 
# > tmp.df_wave[,1:5] %>% rowSums(na.rm = T) %>% table(useNA = "always") |> addmargins()
# .
#     0     1  <NA>   Sum 
#  8592  1438     0 10030 
# > tmp.df_wave[,1:6] %>% rowSums(na.rm = T) %>% table(useNA = "always") |> addmargins()
# .
#     0     1     2  <NA>   Sum 
#  7738  2009   283     0 10030 
# > tmp.df_wave[,1:7] %>% rowSums(na.rm = T) %>% table(useNA = "always") |> addmargins()
# .
#     0     1     2     3  <NA>   Sum 
#  7275  2001   604   150     0 10030 
# > tmp.df_wave %>% rowSums(na.rm = T) %>% table(useNA = "always") |> addmargins()
# .
#     0     1     2     3  <NA>   Sum 
#  7275  2001   604   150     0 10030 
# > tmp.df_wave %>% rowSums(na.rm = T) |> str()
#  num [1:10030] 0 0 0 0 0 0 1 0 0 0 ...

