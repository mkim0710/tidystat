# function.ConfusionMatrix.asSquareMatrix.dev.r

library(tidyverse)
InputMatrix.tbl = 
    structure(list(
        Actual = c("1a", "1b", "2a", "2b", "3a", "3b", "4")
        , `1` = c(45, 17, 3, 3, 3, 0, 1)
        , `2` = c(2, 3, 6, 2, 5, 0, 3)
        , `3` = c(1, 1, 1, 1, 7, 0, 1)
        , `4` = c(0, 0, 0, 1, 4, 5, 39)
    ), class = c("tbl_df", "tbl", "data.frame"), row.names = c(NA,-7L))



InputMatrix.tbl %>% gather(key = "Predicted", value = "value", -Actual) %>%
    mutate(
        Actual.old = Actual
        , Actual = Actual |> str_extract(paste0("[", Predicted |> unique() |> paste0(collapse = "|"), "]"))
    ) %>% 
    select(Actual, Predicted, value) %>% 
    group_by(Actual, Predicted) %>% summarise(value = sum(value)) %>% 
    spread(key = "Predicted", value = "value")
# > InputMatrix.tbl %>% gather(key = "Predicted", value = "value", -Actual) %>%
# +     mutate(
# +         Actual.old = Actual
# +         , Actual = Actual |> str_extract(paste0("[", Predicted |> unique() |> paste0(collapse = "|"), "]"))
# +     ) %>% 
# +     select(Actual, Predicted, value) %>% 
# +     group_by(Actual, Predicted) %>% summarise(value = sum(value)) %>% 
# +     spread(key = "Predicted", value = "value")
# # A tibble: 4 x 5
# # Groups:   Actual [4]
#   Actual   `1`   `2`   `3`   `4`
#   <chr>  <dbl> <dbl> <dbl> <dbl>
# 1 1         62     5     2     0
# 2 2          6     8     2     1
# 3 3          3     5     7     9
# 4 4          1     3     1    39



InputMatrix.tbl %>% {
    mutate(., 
        Actual.old = Actual
        , Actual = str_extract(Actual, paste0("[", paste0(colnames(.), collapse = "|"), "]"))
    )
} %>%
    select(-matches(".old$")) %>% 
    group_by(Actual) %>% summarise_all(sum) %>% 
    as_tibble
# > InputMatrix.tbl %>% {
# +     mutate(., 
# +         Actual.old = Actual
# +         , Actual = str_extract(Actual, paste0("[", paste0(colnames(.), collapse = "|"), "]"))
# +     )
# + } %>%
# +     select(-matches(".old$")) %>% 
# +     group_by(Actual) %>% summarise_all(sum) %>% 
# +     as_tibble
# # A tibble: 4 x 5
#   Actual   `1`   `2`   `3`   `4`
#   <chr>  <dbl> <dbl> <dbl> <dbl>
# 1 1         62     5     2     0
# 2 2          6     8     2     1
# 3 3          3     5     7     9
# 4 4          1     3     1    39


## @ function.ConfusionMatrix.asSquareMatrix =====  

function.ConfusionMatrix.asSquareMatrix = function(InputMatrix.tbl) {
    # https://github.com/mkim0710/tidystat/edit/master/Rdev/50_model_formula_evaluation/59_model_evaluation/function.ConfusionMatrix.asSquareMatrix.dev.r
    InputMatrix.tbl %>% {
        mutate(., 
               Actual.old = Actual
               , Actual = str_extract(Actual, paste0("[", paste0(colnames(.), collapse = "|"), "]"))
        )
    } %>%
        select(-matches(".old$")) %>% 
        group_by(Actual) %>% summarise_all(sum) %>% 
        as_tibble
}


InputSquareMatrix = InputMatrix.tbl %>% function.ConfusionMatrix.asSquareMatrix
InputSquareMatrix |> dput() #----
# > InputSquareMatrix |> dput()
InputSquareMatrix = structure(list(
    Actual = c("1", "2", "3", "4")
    , `1` = c(62, 6, 3, 1)
    , `2` = c(5, 8, 5, 3)
    , `3` = c(2, 2, 7, 1)
    , `4` = c(0, 1, 9, 39))
    , class = c("tbl_df", "tbl", "data.frame"), row.names = c(NA, -4L))
InputSquareMatrix
# > InputSquareMatrix
# # A tibble: 4 x 5
#   Actual   `1`   `2`   `3`   `4`
#   <chr>  <dbl> <dbl> <dbl> <dbl>
# 1 1         62     5     2     0
# 2 2          6     8     2     1
# 3 3          3     5     7     9
# 4 4          1     3     1    39



# @@ END-----  
