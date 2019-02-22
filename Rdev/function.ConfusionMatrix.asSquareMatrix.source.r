# function.ConfusionMatrix.asSquareMatrix.source.r

InputMatrix = 
    structure(list(
        X1 = c("1a", "1b", "2a", "2b", "3a", "3b", "4")
        , `1` = c(45, 17, 3, 3, 3, 0, 1)
        , `2` = c(2, 3, 6, 2, 5, 0, 3)
        , `3` = c(1, 1, 1, 1, 7, 0, 1)
        , `4` = c(0, 0, 0, 1, 4, 5, 39)
    ), class = c("tbl_df", "tbl", "data.frame"), row.names = c(NA,-7L))



InputMatrix %>% gather(key = "X2", value = "value", -X1) %>%
    mutate(
        X1.old = X1
        , X1 = X1 %>% str_extract(paste0("[", X2 %>% unique %>% paste0(collapse = "|"), "]"))
    ) %>% 
    select(X1, X2, value) %>% 
    group_by(X1, X2) %>% summarise(value = sum(value)) %>% 
    spread(key = "X2", value = "value")
# > InputMatrix %>% gather(key = "X2", value = "value", -X1) %>%
# +     mutate(
# +         X1.old = X1
# +         , X1 = X1 %>% str_extract(paste0("[", X2 %>% unique %>% paste0(collapse = "|"), "]"))
# +     ) %>% 
# +     select(X1, X2, value) %>% 
# +     group_by(X1, X2) %>% summarise(value = sum(value)) %>% 
# +     spread(key = "X2", value = "value")
# # A tibble: 4 x 5
# # Groups:   X1 [4]
#   X1      `1`   `2`   `3`   `4`
#   <chr> <dbl> <dbl> <dbl> <dbl>
# 1 1        62     5     2     0
# 2 2         6     8     2     1
# 3 3         3     5     7     9
# 4 4         1     3     1    39



InputMatrix %>% {
    mutate(., 
        X1.old = X1
        , X1 = str_extract(X1, paste0("[", paste0(colnames(.), collapse = "|"), "]"))
    )
} %>%
    select(-matches(".old$")) %>% 
    group_by(X1) %>% summarise_all(sum) %>% 
    as.tibble
# > InputMatrix %>% {
# +     mutate(., 
# +         X1.old = X1
# +         , X1 = str_extract(X1, paste0("[", paste0(colnames(.), collapse = "|"), "]"))
# +     )
# + } %>%
# +     select(-matches(".old$")) %>% 
# +     group_by(X1) %>% summarise_all(sum) %>% 
# +     as.tibble
# # A tibble: 4 x 5
#   X1      `1`   `2`   `3`   `4`
#   <chr> <dbl> <dbl> <dbl> <dbl>
# 1 1        62     5     2     0
# 2 2         6     8     2     1
# 3 3         3     5     7     9
# 4 4         1     3     1    39



#@ function.ConfusionMatrix.asSquareMatrix ===== 

function.ConfusionMatrix.asSquareMatrix = function(InputMatrix) {
    # https://github.com/mkim0710/tidystat/blob/master/Rdev/function.ConfusionMatrix.Metrics.source.r
    InputMatrix %>% {
        mutate(., 
               X1.old = X1
               , X1 = str_extract(X1, paste0("[", paste0(colnames(.), collapse = "|"), "]"))
        )
    } %>%
        select(-matches(".old$")) %>% 
        group_by(X1) %>% summarise_all(sum) %>% 
        as.tibble
}

InputMatrix %>% function.ConfusionMatrix.asSquareMatrix
# > InputMatrix %>% function.ConfusionMatrix.asSquareMatrix
# # A tibble: 4 x 5
#   X1      `1`   `2`   `3`   `4`
#   <chr> <dbl> <dbl> <dbl> <dbl>
# 1 1        62     5     2     0
# 2 2         6     8     2     1
# 3 3         3     5     7     9
# 4 4         1     3     1    39




#@ end -----
