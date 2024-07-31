# library(dplyr) nest().r




# ?nest
as_tibble(chickwts) %>% nest(weight) %>% {.[1:2,]} |> dput()
# > as_tibble(chickwts) %>% nest(weight) %>% {.[1:2,]} |> dput()
# structure(list(feed = structure(2:3, .Label = c("casein", "horsebean", 
# "linseed", "meatmeal", "soybean", "sunflower"), class = "factor"), 
#     data = list(structure(list(weight = c(179, 160, 136, 227, 
#     217, 168, 108, 124, 143, 140)), row.names = c(NA, -10L), class = c("tbl_df", 
#     "tbl", "data.frame")), structure(list(weight = c(309, 229, 
#     181, 141, 260, 203, 148, 169, 213, 257, 244, 271)), row.names = c(NA, 
#     -12L), class = c("tbl_df", "tbl", "data.frame")))), row.names = c(NA, 
# -2L), class = c("tbl_df", "tbl", "data.frame"))
structure(list(
    feed = structure(
        2:3
        , .Label = c("casein", "horsebean", "linseed", "meatmeal", "soybean", "sunflower")
        , class = "factor"
    )
    , data = list(
        structure(list(
            weight = c(179, 160, 136, 227, 217, 168, 108, 124, 143, 140)
        )
        , row.names = c(NA, -10L)
        , class = c("tbl_df", "tbl", "data.frame")
        )
        , structure(list(
            weight = c(309, 229, 181, 141, 260, 203, 148, 169, 213, 257, 244, 271)
        )
        , row.names = c(NA, -12L)
        , class = c("tbl_df", "tbl", "data.frame")
        )
    )
)
, row.names = c(NA, -2L)
, class = c("tbl_df", "tbl", "data.frame")
)


tibble(
    feed = structure(
        2:3
        , .Label = c("casein", "horsebean", "linseed", "meatmeal", "soybean", "sunflower")
        , class = "factor"
    )
    , data = list(
        tibble(
            weight = c(179, 160, 136, 227, 217, 168, 108, 124, 143, 140)
        )
        , tibble(
            weight = c(309, 229, 181, 141, 260, 203, 148, 169, 213, 257, 244, 271)
        )
    )
)






#@ ======  


tibble(
    code_type = "ICD"
    , code_vec = list(
        c(250)
        , c(250, 6480, 6488)
    )
) %>% mutate(
    filter_name = map2_chr(code_type, code_vec, function(code_type, code_vec) paste0(code_type, paste(code_vec, collapse = "_")) )
    , filter_regex = map2_chr(code_type, code_vec, function(code_type, code_vec) paste0("^(", paste(code_vec, collapse = "|"), ")") )
)
tibble(
    code_type = "ICD"
    , code_vec = list(
        c(250)
        , c(250, 6480, 6488)
    )
) %>% mutate(
    filter_name = map2_chr(code_type, code_vec, function(code_type, code_vec) paste0(code_type, paste(code_vec, collapse = "_")) )
    , filter_regex = map2_chr(code_type, code_vec, function(code_type, code_vec) paste0("^(", paste(code_vec, collapse = "|"), ")") )
) %>% unnest
# > tibble(
# +     code_type = "ICD"
# +     , code_vec = list(
# +         c(250)
# +         , c(250, 6480, 6488)
# +     )
# + ) %>% mutate(
# +     filter_name = map2_chr(code_type, code_vec, function(code_type, code_vec) paste0(code_type, paste(code_vec, collapse = "_")) )
# +     , filter_regex = map2_chr(code_type, code_vec, function(code_type, code_vec) paste0("^(", paste(code_vec, collapse = "|"), ")") )
# + )
# # A tibble: 2 x 4
#   code_type code_vec  filter_name      filter_regex    
#   <chr>     <list>    <chr>            <chr>           
# 1 ICD       <dbl [1]> ICD250           ^(250)          
# 2 ICD       <dbl [3]> ICD250_6480_6488 ^(250|6480|6488)
# > tibble(
# +     code_type = "ICD"
# +     , code_vec = list(
# +         c(250)
# +         , c(250, 6480, 6488)
# +     )
# + ) %>% mutate(
# +     filter_name = map2_chr(code_type, code_vec, function(code_type, code_vec) paste0(code_type, paste(code_vec, collapse = "_")) )
# +     , filter_regex = map2_chr(code_type, code_vec, function(code_type, code_vec) paste0("^(", paste(code_vec, collapse = "|"), ")") )
# + ) %>% unnest
# # A tibble: 4 x 4
#   code_type filter_name      filter_regex     code_vec
#   <chr>     <chr>            <chr>               <dbl>
# 1 ICD       ICD250           ^(250)                250
# 2 ICD       ICD250_6480_6488 ^(250|6480|6488)      250
# 3 ICD       ICD250_6480_6488 ^(250|6480|6488)     6480
# 4 ICD       ICD250_6480_6488 ^(250|6480|6488)     6488





#@ end -----  
