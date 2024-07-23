
library(dplyr)
library(purrr)

# https://github.com/mkim0710/tidystat/blob/master/Rdev/30_transform_scale_categorical/function.df2df_wave.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/30_transform_scale_categorical/function.df2matrix_wave.dev.r
# function to convert a dataframe to a matrix
function.df2matrix_wave <- function(df, vector_wave, vector_colname_at_wave = NULL, print.intermediate = FALSE) {
    if(!is.numeric(vector_wave)) {
        warning("vector_wave is not numeric"); cat("  \n", sep="")
        vector_wave = vector_wave %>% as.numeric
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
    # matrix_data <- matrix(nrow = nrow(df), ncol = max(vector_wave))
    matrix_data = array(dim = c(nrow(df), max(vector_wave)))

    for (i in seq_along(vector_wave)) {
        if(print.intermediate) {
            cat("Column name for time = ", vector_wave[i], " : ", vector_colname_at_wave[i], "\n")
        }

        # Check if the column name exists in the dataframe
        if(!(vector_colname_at_wave[i] %in% names(df))) {
            warning("Column ", vector_colname_at_wave[i], " does not exist in the dataframe"); cat("  \n", sep="")
            next
        }
        
        matrix_data[, vector_wave[i]] <- df[[vector_colname_at_wave[i]]]
    }
    colnames(matrix_data)[vector_wave] = vector_colname_at_wave
    matrix_data
}

# Example usage with vectors
tmp.df = list_df_defDM.indicators %>% map(function(df) {df %>% select_if(is.logical)}) %>% {.$GLU60_TR} 
tmp.df |> str()
# tmp.df %>% as.matrix |> str()
# tmp.df %>% head
# > tmp.df |> str()
# tibble [10,030 × 3] (S3: tbl_df/tbl/data.frame)
#  $ A01_GLU60_TR_ge200: Named logi [1:10030] FALSE FALSE FALSE NA FALSE FALSE ...
#   ..- attr(*, "names")= chr [1:10030] "99 >=200" "139 >=200" "176 >=200" "NA >=200" ...
#  $ A06_GLU60_TR_ge200: Named logi [1:10030] FALSE NA FALSE NA FALSE FALSE ...
#   ..- attr(*, "names")= chr [1:10030] "92 >=200" "NA >=200" "148 >=200" "NA >=200" ...
#  $ A07_GLU60_TR_ge200: Named logi [1:10030] NA NA FALSE NA FALSE NA ...
#   ..- attr(*, "names")= chr [1:10030] "NA >=200" "NA >=200" "148 >=200" "NA >=200" ...
# > tmp.df %>% as.matrix |> str()
#  logi [1:10030, 1:3] FALSE FALSE FALSE NA FALSE FALSE ...
#  - attr(*, "dimnames")=List of 2
#   ..$ : NULL
#   ..$ : chr [1:3] "A01_GLU60_TR_ge200" "A06_GLU60_TR_ge200" "A07_GLU60_TR_ge200"
# > tmp.df %>% head
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
# tmp.vector_wave <- tmp.vector_colname_at_wave %>% {as.numeric(sub("A0(\\d+)_.*", "\\1", .))} %>% as.numeric
# tmp.vector_wave

# Applying the function to a dataframe
# tmp_matrix_wave <- function.df2matrix_wave(tmp.df, vector_wave, vector_colname_at_wave, print.intermediate = TRUE)
# tmp_matrix_wave <- function.df2matrix_wave(tmp.df, tmp.vector_wave, print.intermediate = TRUE)
# tmp_matrix_wave <- function.df2matrix_wave(tmp.df, as.numeric(sub("A0(\\d+)_.*", "\\1", colnames(tmp.df))), print.intermediate = TRUE)
# tmp_matrix_wave <- tmp.df %>% {function.df2matrix_wave(., as.numeric(sub("A0(\\d+)_.*", "\\1", colnames(.))), print.intermediate = TRUE)}
tmp_matrix_wave <- tmp.df %>% function.df2matrix_wave(as.numeric(sub("A0(\\d+)_.*", "\\1", colnames(.))), print.intermediate = TRUE)
tmp_matrix_wave |> str()
tmp_matrix_wave %>% head
# > tmp_matrix_wave |> str()
#  logi [1:10030, 1:7] FALSE FALSE FALSE NA FALSE FALSE ...
#  - attr(*, "dimnames")=List of 2
#   ..$ : NULL
#   ..$ : chr [1:7] "A01_GLU60_TR_ge200" NA NA NA ...
# > tmp_matrix_wave %>% head
#      A01_GLU60_TR_ge200 <NA> <NA> <NA> <NA> A06_GLU60_TR_ge200 A07_GLU60_TR_ge200
# [1,]              FALSE   NA   NA   NA   NA              FALSE                 NA
# [2,]              FALSE   NA   NA   NA   NA                 NA                 NA
# [3,]              FALSE   NA   NA   NA   NA              FALSE              FALSE
# [4,]                 NA   NA   NA   NA   NA                 NA                 NA
# [5,]              FALSE   NA   NA   NA   NA              FALSE              FALSE
# [6,]              FALSE   NA   NA   NA   NA              FALSE                 NA

# Applying the function to each dataframe in the list
list_matrix_wave <- list_df_defDM.indicators %>% map(function(df) {df %>% select_if(is.logical)}) %>%
    map(function(dfi) {dfi %>% function.df2matrix_wave(vector_wave = as.numeric(sub("A0(\\d+)_.*", "\\1", names(.))), print.intermediate = F)})

list_matrix_wave |> str()
list_matrix_wave$DM_C %>% head
list_matrix_wave$GLU0_TR %>% head
# > list_matrix_wave |> str()
# List of 7
#  $ DM_C     : logi [1:10030, 1:7] FALSE FALSE FALSE TRUE FALSE FALSE ...
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : NULL
#   .. ..$ : chr [1:7] "A01_DM_C_eq2" "A02_DM_C_eq2" "A03_DM_C_eq2" "A04_DM_C_eq2" ...
#  $ GLU0_TR  : logi [1:10030, 1:7] FALSE FALSE FALSE NA FALSE FALSE ...
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : NULL
#   .. ..$ : chr [1:7] "A01_GLU0_TR_ge126" NA NA NA ...
#  $ GLU60_TR : logi [1:10030, 1:7] FALSE FALSE FALSE NA FALSE FALSE ...
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : NULL
#   .. ..$ : chr [1:7] "A01_GLU60_TR_ge200" NA NA NA ...
#  $ GLU120_TR: logi [1:10030, 1:7] FALSE FALSE FALSE NA FALSE FALSE ...
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : NULL
#   .. ..$ : chr [1:7] "A01_GLU120_TR_ge200" NA NA NA ...
#  $ HBA1C    : logi [1:10030, 1:7] FALSE FALSE FALSE TRUE FALSE FALSE ...
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : NULL
#   .. ..$ : chr [1:7] "A01_HBA1C_ge6_5" "A02_HBA1C_ge6_5" "A03_HBA1C_ge6_5" "A04_HBA1C_ge6_5" ...
#  $ DRUGDM   : logi [1:10030, 1:7] FALSE FALSE FALSE TRUE FALSE FALSE ...
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : NULL
#   .. ..$ : chr [1:7] "A01_DRUGDM_eq2" "A02_DRUGDM_eq2" "A03_DRUGDM_eq2" "A04_DRUGDM_eq2" ...
#  $ DRUGINS  : logi [1:10030, 1:7] FALSE FALSE FALSE FALSE FALSE FALSE ...
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : NULL
#   .. ..$ : chr [1:7] "A01_DRUGINS_eq2" "A02_DRUGINS_eq2" "A03_DRUGINS_eq2" "A04_DRUGINS_eq2" ...
# > list_matrix_wave$DM_C %>% head
#      A01_DM_C_eq2 A02_DM_C_eq2 A03_DM_C_eq2 A04_DM_C_eq2 A05_DM_C_eq2 A06_DM_C_eq2 A07_DM_C_eq2
# [1,]        FALSE        FALSE        FALSE           NA        FALSE        FALSE           NA
# [2,]        FALSE        FALSE        FALSE        FALSE        FALSE           NA           NA
# [3,]        FALSE        FALSE        FALSE        FALSE        FALSE        FALSE        FALSE
# [4,]         TRUE         TRUE         TRUE         TRUE         TRUE         TRUE         TRUE
# [5,]        FALSE           NA        FALSE           NA           NA        FALSE        FALSE
# [6,]        FALSE        FALSE        FALSE        FALSE        FALSE        FALSE           NA
# > list_matrix_wave$GLU0_TR %>% head
#      A01_GLU0_TR_ge126 <NA> <NA> <NA> <NA> A06_GLU0_TR_ge126 A07_GLU0_TR_ge126
# [1,]             FALSE   NA   NA   NA   NA             FALSE                NA
# [2,]             FALSE   NA   NA   NA   NA                NA                NA
# [3,]             FALSE   NA   NA   NA   NA             FALSE             FALSE
# [4,]                NA   NA   NA   NA   NA                NA                NA
# [5,]             FALSE   NA   NA   NA   NA             FALSE             FALSE
# [6,]             FALSE   NA   NA   NA   NA             FALSE                NA

