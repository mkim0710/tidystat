

library(dplyr)
library(purrr)

# https://github.com/mkim0710/tidystat/blob/master/Rdev/30_transform_scale_categorical/function.df2matrix_wave.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/30_transform_scale_categorical/function.df2df_wave.dev.r
# function to make a dataframe with columns for each wave
function.df2df_wave <- function(df, vector_wave, vector_colname_at_wave = NULL, VERBOSE = isTRUE(options()$verbose)) {
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
    df_wave
}

# Example usage with vectors
tmp.df = list_df_defDM.indicators %>% map(function(df) {df %>% select_if(is.logical)}) %>% {.$GLU60_TR} 
tmp.df |> str(max.level = 2, give.attr = TRUE)
# tmp.df |> as.matrix() |> str(max.level = 2, give.attr = TRUE)
# tmp.df |> head()
# > tmp.df |> str(max.level = 2, give.attr = TRUE)
# tibble [10,030 × 3] (S3: tbl_df/tbl/data.frame)
#  $ A01_GLU60_TR_ge200: Named logi [1:10030] FALSE FALSE FALSE NA FALSE FALSE ...
#   ..- attr(*, "names")= chr [1:10030] "99 >=200" "139 >=200" "176 >=200" "NA >=200" ...
#  $ A06_GLU60_TR_ge200: Named logi [1:10030] FALSE NA FALSE NA FALSE FALSE ...
#   ..- attr(*, "names")= chr [1:10030] "92 >=200" "NA >=200" "148 >=200" "NA >=200" ...
#  $ A07_GLU60_TR_ge200: Named logi [1:10030] NA NA FALSE NA FALSE NA ...
#   ..- attr(*, "names")= chr [1:10030] "NA >=200" "NA >=200" "148 >=200" "NA >=200" ...
# > tmp.df |> as.matrix() |> str(max.level = 2, give.attr = TRUE)
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

# tmp.vector_colname_at_wave <- names(tmp.df)
# tmp.vector_colname_at_wave
# tmp.vector_wave <- tmp.vector_colname_at_wave %>% {as.numeric(sub("A0(\\d+)_.*", "\\1", .))} |> as.numeric()
# tmp.vector_wave

# Applying the function to a dataframe
# tmp_df_wave <- function.df2df_wave(tmp.df, vector_wave, vector_colname_at_wave, VERBOSE = TRUE)
# tmp_df_wave <- function.df2df_wave(tmp.df, tmp.vector_wave, VERBOSE = TRUE)
# tmp_df_wave <- function.df2df_wave(tmp.df, as.numeric(sub("A0(\\d+)_.*", "\\1", colnames(tmp.df))), VERBOSE = TRUE)
# tmp_df_wave <- tmp.df %>% {function.df2df_wave(., as.numeric(sub("A0(\\d+)_.*", "\\1", colnames(.))), VERBOSE = TRUE)}
tmp_df_wave <- tmp.df %>% function.df2df_wave(as.numeric(sub("A0(\\d+)_.*", "\\1", colnames(.))), VERBOSE = TRUE)
tmp_df_wave |> str(max.level = 2, give.attr = TRUE)
tmp_df_wave |> head()
# > tmp_df_wave |> str(max.level = 2, give.attr = TRUE)
# tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#  $ A01_GLU60_TR_ge200: Named logi [1:10030] FALSE FALSE FALSE NA FALSE FALSE ...
#   ..- attr(*, "names")= chr [1:10030] "99 >=200" "139 >=200" "176 >=200" "NA >=200" ...
#  $ V2                : logi [1:10030] NA NA NA NA NA NA ...
#  $ V3                : logi [1:10030] NA NA NA NA NA NA ...
#  $ V4                : logi [1:10030] NA NA NA NA NA NA ...
#  $ V5                : logi [1:10030] NA NA NA NA NA NA ...
#  $ A06_GLU60_TR_ge200: Named logi [1:10030] FALSE NA FALSE NA FALSE FALSE ...
#   ..- attr(*, "names")= chr [1:10030] "92 >=200" "NA >=200" "148 >=200" "NA >=200" ...
#  $ A07_GLU60_TR_ge200: Named logi [1:10030] NA NA FALSE NA FALSE NA ...
#   ..- attr(*, "names")= chr [1:10030] "NA >=200" "NA >=200" "148 >=200" "NA >=200" ...
# > tmp_df_wave |> head()
# # A tibble: 6 × 7
#   A01_GLU60_TR_ge200 V2    V3    V4    V5    A06_GLU60_TR_ge200 A07_GLU60_TR_ge200
#   <lgl>              <lgl> <lgl> <lgl> <lgl> <lgl>              <lgl>             
# 1 FALSE              NA    NA    NA    NA    FALSE              NA                
# 2 FALSE              NA    NA    NA    NA    NA                 NA                
# 3 FALSE              NA    NA    NA    NA    FALSE              FALSE             
# 4 NA                 NA    NA    NA    NA    NA                 NA                
# 5 FALSE              NA    NA    NA    NA    FALSE              FALSE             
# 6 FALSE              NA    NA    NA    NA    FALSE              NA   


# Applying the function to each dataframe in the list
list_df_wave <- list_df_defDM.indicators %>% map(function(df) {df %>% select_if(is.logical)}) %>%
    map(function(dfi) {dfi %>% function.df2df_wave(vector_wave = as.numeric(sub("A0(\\d+)_.*", "\\1", names(.))), VERBOSE = F)})

list_df_wave |> str(max.level = 1, give.attr = TRUE)
list_df_wave$DM_C |> str(max.level = 2, give.attr = TRUE)
list_df_wave$GLU0_TR |> str(max.level = 2, give.attr = TRUE)
# > list_df_wave |> str(max.level = 1, give.attr = TRUE)
# List of 7
#  $ DM_C     : tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#  $ GLU0_TR  : tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#  $ GLU60_TR : tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#  $ GLU120_TR: tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#  $ HBA1C    : tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#  $ DRUGDM   : tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#  $ DRUGINS  : tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
# > list_df_wave$DM_C |> str(max.level = 2, give.attr = TRUE)
# tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#  $ A01_DM_C_eq2: Named logi [1:10030] FALSE FALSE FALSE TRUE FALSE FALSE ...
#   ..- attr(*, "names")= chr [1:10030] "1 ==2" "1 ==2" "1 ==2" "2 ==2" ...
#  $ A02_DM_C_eq2: Named logi [1:10030] FALSE FALSE FALSE TRUE NA FALSE ...
#   ..- attr(*, "names")= chr [1:10030] "1 ==2" "1 ==2" "1 ==2" "2 ==2" ...
#  $ A03_DM_C_eq2: Named logi [1:10030] FALSE FALSE FALSE TRUE FALSE FALSE ...
#   ..- attr(*, "names")= chr [1:10030] "1 ==2" "1 ==2" "1 ==2" "2 ==2" ...
#  $ A04_DM_C_eq2: Named logi [1:10030] NA FALSE FALSE TRUE NA FALSE ...
#   ..- attr(*, "names")= chr [1:10030] "NA ==2" "1 ==2" "1 ==2" "2 ==2" ...
#  $ A05_DM_C_eq2: Named logi [1:10030] FALSE FALSE FALSE TRUE NA FALSE ...
#   ..- attr(*, "names")= chr [1:10030] "1 ==2" "1 ==2" "1 ==2" "2 ==2" ...
#  $ A06_DM_C_eq2: Named logi [1:10030] FALSE NA FALSE TRUE FALSE FALSE ...
#   ..- attr(*, "names")= chr [1:10030] "1 ==2" "NA ==2" "1 ==2" "2 ==2" ...
#  $ A07_DM_C_eq2: Named logi [1:10030] NA NA FALSE TRUE FALSE NA ...
#   ..- attr(*, "names")= chr [1:10030] "NA ==2" "NA ==2" "1 ==2" "2 ==2" ...
# > list_df_wave$GLU0_TR |> str(max.level = 2, give.attr = TRUE)
# tibble [10,030 × 7] (S3: tbl_df/tbl/data.frame)
#  $ A01_GLU0_TR_ge126: Named logi [1:10030] FALSE FALSE FALSE NA FALSE FALSE ...
#   ..- attr(*, "names")= chr [1:10030] "80 >=126" "77 >=126" "84 >=126" "NA >=126" ...
#  $ V2               : logi [1:10030] NA NA NA NA NA NA ...
#  $ V3               : logi [1:10030] NA NA NA NA NA NA ...
#  $ V4               : logi [1:10030] NA NA NA NA NA NA ...
#  $ V5               : logi [1:10030] NA NA NA NA NA NA ...
#  $ A06_GLU0_TR_ge126: Named logi [1:10030] FALSE NA FALSE NA FALSE FALSE ...
#   ..- attr(*, "names")= chr [1:10030] "96 >=126" "NA >=126" "88 >=126" "NA >=126" ...
#  $ A07_GLU0_TR_ge126: Named logi [1:10030] NA NA FALSE NA FALSE NA ...
#   ..- attr(*, "names")= chr [1:10030] "NA >=126" "NA >=126" "86 >=126" "NA >=126" ...

