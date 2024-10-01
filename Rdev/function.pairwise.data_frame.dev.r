
# function.cross_join.dev.r

# https://github.com/mkim0710/tidystat/blob/master/Rdev/function.cross_join.dev.r
# https://stackoverflow.com/questions/35406535/cross-join-in-dplyr-in-r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/function.pairwise.data_frame.dev.r


expand.grid(c("A","B"), 1:3)
# > expand.grid(c("A","B"), 1:3)
#   Var1 Var2
# 1    A    1
# 2    B    1
# 3    A    2
# 4    B    2
# 5    A    3
# 6    B    3


x = data.frame(Var1 = c("A","B"))
y = data.frame(Var2 = 1:3)

merge(x, y, by = NULL)
# > merge(x, y, by = NULL)
#   Var1 Var2
# 1    A    1
# 2    B    1
# 3    A    2
# 4    B    2
# 5    A    3
# 6    B    3

x %>% mutate(tmp = 1) %>% 
    full_join(y %>% mutate(tmp = 1)) %>% 
    select(-tmp)
# > x %>% mutate(tmp = 1) %>% 
# +     full_join(y %>% mutate(tmp = 1)) %>% 
# +     select(-tmp)
# Joining, by = "tmp"
#   Var1 Var2
# 1    A    1
# 2    A    2
# 3    A    3
# 4    B    1
# 5    B    2
# 6    B    3




# cf) https://github.com/mkim0710/tidystat/blob/master/R/function.pairwise.data_frame.dev.r
# cf) https://github.com/mkim0710/tidystat/blob/master/R/list_list.to.data_frame.dev.r


## @ outer(i, j, function(i, j) {}) ============  
library(tidyverse)
outer(c("A","B"), 1:3, paste0)
outer(c("A","B"), 1:3, paste0) |> as.vector()
# > outer(c("A","B"), 1:3, paste0)
#      [,1] [,2] [,3]
# [1,] "A1" "A2" "A3"
# [2,] "B1" "B2" "B3"
# > outer(c("A","B"), 1:3, paste0) |> as.vector()
# [1] "A1" "B1" "A2" "B2" "A3" "B3"


expand.grid(c("A","B"), 1:3) 
# > expand.grid(c("A","B"), 1:3) 
#   Var1 Var2
# 1    A    1
# 2    B    1
# 3    A    2
# 4    B    2
# 5    A    3
# 6    B    3

expand.grid(rowname = c("A","B"), colname = 1:3) %>% mutate(value = paste0(rowname, colname))
# > expand.grid(rowname = c("A","B"), colname = 1:3) %>% mutate(value = paste0(rowname, colname))
#   rowname colname value
# 1       A       1    A1
# 2       B       1    B1
# 3       A       2    A2
# 4       B       2    B2
# 5       A       3    A3
# 6       B       3    B3

expand.grid(rowname = c("A","B"), colname = 1:3) %>% mutate(value = paste0(rowname, colname)) %>% 
    spread(key = colname, value = value) %>% column_to_rownames
# > expand.grid(rowname = c("A","B"), colname = 1:3) %>% mutate(value = paste0(rowname, colname)) %>% 
# +     spread(key = colname, value = value) %>% column_to_rownames
#    1  2  3
# A A1 A2 A3
# B B1 B2 B3






outer(1:2, 1:3, function(i, j) {paste0("R", i, "C", j)})
outer(1:2, 1:3, function(i, j) {paste0("R", i, "C", j)}) |> as.vector()
# > outer(1:2, 1:3, function(i, j) {
# +     paste0("R", i, "C", j)
# + })
#      [,1]   [,2]   [,3]
# [1,] "R1C1" "R1C2" "R1C3"
# [2,] "R2C1" "R2C2" "R2C3"
# > outer(1:2, 1:3, function(i, j) {paste0("R", i, "C", j)}) |> as.vector()
# [1] "R1C1" "R2C1" "R1C2" "R2C2" "R1C3" "R2C3"


c("A", "B", "C") %>% {set_names(., .)} %>% {outer(., ., paste, sep = ":")} #----
# > c("A", "B", "C") %>% {set_names(., .)} %>% {outer(., ., paste, sep = ":")} #----  
#   A     B     C    
# A "A:A" "A:B" "A:C"
# B "B:A" "B:B" "B:C"
# C "C:A" "C:B" "C:C"





# outer(letters[1:3], letters[1:3], paste)
# outer(letters[1:3], letters[1:3], paste) |> as.vector()
# outer(letters[1:3], letters[1:3], paste) |> as.vector() |> as_tibble()
# outer(letters[1:3], letters[1:3], paste) |> as.vector() |> as_tibble() %>% separate(value, into = c("var_i", "var_j"))
# outer(letters[1:3], letters[1:3], paste) |> as.vector() |> as_tibble() %>% separate(value, into = c("var_i", "var_j"), sep = " ")
# # > outer(letters[1:3], letters[1:3], paste)
# #      [,1]  [,2]  [,3] 
# # [1,] "a a" "a b" "a c"
# # [2,] "b a" "b b" "b c"
# # [3,] "c a" "c b" "c c"
# # > outer(letters[1:3], letters[1:3], paste) |> as.vector()
# # [1] "a a" "b a" "c a" "a b" "b b" "c b" "a c" "b c" "c c"
# # > outer(letters[1:3], letters[1:3], paste) |> as.vector() |> as_tibble()
# # # A tibble: 9 x 1
# #   value
# #   <chr>
# # 1   a a
# # 2   b a
# # 3   c a
# # 4   a b
# # 5   b b
# # 6   c b
# # 7   a c
# # 8   b c
# # 9   c c
# # > outer(letters[1:3], letters[1:3], paste) |> as.vector() |> as_tibble() %>% separate(value, into = c("var_i", "var_j"))
# # # A tibble: 9 x 2
# #   var_i var_j
# # * <chr> <chr>
# # 1     a     a
# # 2     b     a
# # 3     c     a
# # 4     a     b
# # 5     b     b
# # 6     c     b
# # 7     a     c
# # 8     b     c
# # 9     c     c


outer(letters[1:3], letters[1:3], paste, sep = "|")
outer(letters[1:3], letters[1:3], paste, sep = "|") |> as.vector()
outer(letters[1:3], letters[1:3], paste, sep = "|") |> as.vector() |> as_tibble()
outer(letters[1:3], letters[1:3], paste, sep = "|") |> as.vector() |> as_tibble() %>% separate(value, into = c("var_i", "var_j"), sep = "\\|")
# > outer(letters[1:3], letters[1:3], paste, sep = "|")
#      [,1]  [,2]  [,3] 
# [1,] "a|a" "a|b" "a|c"
# [2,] "b|a" "b|b" "b|c"
# [3,] "c|a" "c|b" "c|c"
# > outer(letters[1:3], letters[1:3], paste, sep = "|") |> as.vector()
# [1] "a|a" "b|a" "c|a" "a|b" "b|b" "c|b" "a|c" "b|c" "c|c"
# > outer(letters[1:3], letters[1:3], paste, sep = "|") |> as.vector() |> as_tibble()
# # A tibble: 9 x 1
#   value
#   <chr>
# 1   a|a
# 2   b|a
# 3   c|a
# 4   a|b
# 5   b|b
# 6   c|b
# 7   a|c
# 8   b|c
# 9   c|c
# > outer(letters[1:3], letters[1:3], paste, sep = "|") |> as.vector() |> as_tibble() %>% separate(value, into = c("var_i", "var_j"), sep = "\\|")
# # A tibble: 9 x 2
#   var_i var_j
# * <chr> <chr>
# 1     a     a
# 2     b     a
# 3     c     a
# 4     a     b
# 5     b     b
# 6     c     b
# 7     a     c
# 8     b     c
# 9     c     c


c(F, T) |> as.character() |> as.logical() |> str()
c(F, T) |> as.character() |> as.factor() |> str()
c(F, T) |> as.character() |> as.factor() |> as.logical() |> str()
c(F, T) |> as.character() |> as.factor() |> as.numeric() |> as.logical() |> str()
# > c(F, T) |> as.character() |> as.logical() |> str()
#  logi [1:2] FALSE TRUE
# > c(F, T) |> as.character() |> as.factor() |> str()
#  Factor w/ 2 levels "FALSE","TRUE": 1 2
# > c(F, T) |> as.character() |> as.factor() |> as.logical() |> str()
#  logi [1:2] FALSE TRUE
# > c(F, T) |> as.character() |> as.factor() |> as.numeric() |> as.logical() |> str()
#  logi [1:2] TRUE TRUE



RACE = c("1: Non-Hispanic White", "2: Non-Hispanic Black", "3: Hispanic", "4: Asian", "5: Other")
isFemale = c(F, T)

outer(RACE, c(F, T), paste, sep = "|")
outer(RACE, c(F, T), paste, sep = "|") |> as.vector()
outer(RACE, c(F, T), paste, sep = "|") |> as.vector() |> as_tibble()
outer(RACE, c(F, T), paste, sep = "|") |> as.vector() |> as_tibble() %>% separate(value, into = c("RACE", "isFemale"), sep = "\\|") %>% map_df(as.factor)
outer(RACE, c(F, T), paste, sep = "|") |> as.vector() |> as_tibble() %>% separate(value, into = c("RACE", "isFemale"), sep = "\\|") %>% map_df(as.factor) |> str()
outer(RACE, c(F, T), paste, sep = "|") |> as.vector() |> as_tibble() %>% separate(value, into = c("RACE", "isFemale"), sep = "\\|") %>% map_df(as.factor) %>% map_df(as.logical) |> str()
# > outer(RACE, c(F, T), paste, sep = "|")
#      [,1]                          [,2]                        
# [1,] "1: Non-Hispanic White|FALSE" "1: Non-Hispanic White|TRUE"
# [2,] "2: Non-Hispanic Black|FALSE" "2: Non-Hispanic Black|TRUE"
# [3,] "3: Hispanic|FALSE"           "3: Hispanic|TRUE"          
# [4,] "4: Asian|FALSE"              "4: Asian|TRUE"             
# [5,] "5: Other|FALSE"              "5: Other|TRUE"             
# > outer(RACE, c(F, T), paste, sep = "|") |> as.vector()
#  [1] "1: Non-Hispanic White|FALSE" "2: Non-Hispanic Black|FALSE" "3: Hispanic|FALSE"          
#  [4] "4: Asian|FALSE"              "5: Other|FALSE"              "1: Non-Hispanic White|TRUE" 
#  [7] "2: Non-Hispanic Black|TRUE"  "3: Hispanic|TRUE"            "4: Asian|TRUE"              
# [10] "5: Other|TRUE"              
# > outer(RACE, c(F, T), paste, sep = "|") |> as.vector() |> as_tibble()
# # A tibble: 10 x 1
#                          value
#                          <chr>
#  1 1: Non-Hispanic White|FALSE
#  2 2: Non-Hispanic Black|FALSE
#  3           3: Hispanic|FALSE
#  4              4: Asian|FALSE
#  5              5: Other|FALSE
#  6  1: Non-Hispanic White|TRUE
#  7  2: Non-Hispanic Black|TRUE
#  8            3: Hispanic|TRUE
#  9               4: Asian|TRUE
# 10               5: Other|TRUE
# > outer(RACE, c(F, T), paste, sep = "|") |> as.vector() |> as_tibble() %>% separate(value, into = c("RACE", "isFemale"), sep = "\\|") %>% map_df(as.factor)
# # A tibble: 10 x 2
#                     RACE isFemale
#                   <fctr>   <fctr>
#  1 1: Non-Hispanic White    FALSE
#  2 2: Non-Hispanic Black    FALSE
#  3           3: Hispanic    FALSE
#  4              4: Asian    FALSE
#  5              5: Other    FALSE
#  6 1: Non-Hispanic White     TRUE
#  7 2: Non-Hispanic Black     TRUE
#  8           3: Hispanic     TRUE
#  9              4: Asian     TRUE
# 10              5: Other     TRUE
# > outer(RACE, c(F, T), paste, sep = "|") |> as.vector() |> as_tibble() %>% separate(value, into = c("RACE", "isFemale"), sep = "\\|") %>% map_df(as.factor) |> str()
# Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	10 obs. of  2 variables:
#  $ RACE    : Factor w/ 5 levels "1: Non-Hispanic White",..: 1 2 3 4 5 1 2 3 4 5
#  $ isFemale: Factor w/ 2 levels "FALSE","TRUE": 1 1 1 1 1 2 2 2 2 2
# > outer(RACE, c(F, T), paste, sep = "|") |> as.vector() |> as_tibble() %>% separate(value, into = c("RACE", "isFemale"), sep = "\\|") %>% map_df(as.factor) %>% map_df(as.logical) |> str()
# Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	10 obs. of  2 variables:
#  $ RACE    : logi  NA NA NA NA NA NA ...
#  $ isFemale: logi  FALSE FALSE FALSE FALSE FALSE TRUE ...


## @ public_v2_112917.levels123 ======  
public_v2_112917.levels123 %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# > public_v2_112917.levels123 %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# # A tibble: 12 x 4
# # Groups:   RACE [?]
#                     RACE isCollege_MS_PhD     N CAPI_WT.sum
#                   <fctr>            <lgl> <int>       <dbl>
#  1 1: Non-Hispanic White            FALSE   171  913173.661
#  2 1: Non-Hispanic White             TRUE   341 1284678.187
#  3 1: Non-Hispanic White               NA     1    3815.433
#  4 2: Non-Hispanic Black            FALSE   271 1125421.441
#  5 2: Non-Hispanic Black             TRUE    69  211164.247
#  6           3: Hispanic            FALSE   313 1459116.225
#  7           3: Hispanic             TRUE    76  241975.873
#  8           3: Hispanic               NA     1    2872.296
#  9              4: Asian            FALSE    98  488004.581
# 10              4: Asian             TRUE   106  391562.356
# 11              5: Other            FALSE    44  102144.581
# 12              5: Other             TRUE    36   61819.938
# > public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# # A tibble: 10 x 4
# # Groups:   RACE [?]
#                     RACE isCollege_MS_PhD     N CAPI_WT.sum
#                   <fctr>            <lgl> <int>       <dbl>
#  1 1: Non-Hispanic White            FALSE   171   913173.66
#  2 1: Non-Hispanic White             TRUE   341  1284678.19
#  3 2: Non-Hispanic Black            FALSE   271  1125421.44
#  4 2: Non-Hispanic Black             TRUE    69   211164.25
#  5           3: Hispanic            FALSE   313  1459116.23
#  6           3: Hispanic             TRUE    76   241975.87
#  7              4: Asian            FALSE    98   488004.58
#  8              4: Asian             TRUE   106   391562.36
#  9              5: Other            FALSE    44   102144.58
# 10              5: Other             TRUE    36    61819.94

## @ -----  
df_RACE_isCollege_MS_PhD = outer(levels(public_v2_112917.levels123$RACE), c(F, T), paste, sep = "|") |> as.vector() |> as_tibble() %>% separate(value, into = c("RACE", "isCollege_MS_PhD"), sep = "\\|") %>% map_df(as.factor) %>% 
    mutate(isCollege_MS_PhD = as.logical(isCollege_MS_PhD))
df_RACE_isCollege_MS_PhD
# > df_RACE_isCollege_MS_PhD
# # A tibble: 10 x 2
#                     RACE isCollege_MS_PhD
#                   <fctr>            <lgl>
#  1 1: Non-Hispanic White            FALSE
#  2 2: Non-Hispanic Black            FALSE
#  3           3: Hispanic            FALSE
#  4              4: Asian            FALSE
#  5              5: Other            FALSE
#  6 1: Non-Hispanic White             TRUE
#  7 2: Non-Hispanic Black             TRUE
#  8           3: Hispanic             TRUE
#  9              4: Asian             TRUE
# 10              5: Other             TRUE


for (i in 1:nrow(df_RACE_isCollege_MS_PhD)) {
    public_v2_112917.levels123 %>% dplyr::filter(
        RACE == df_RACE_isCollege_MS_PhD$RACE[i]
        , isCollege_MS_PhD == df_RACE_isCollege_MS_PhD$isCollege_MS_PhD[i]
    ) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
}
1:nrow(df_RACE_isCollege_MS_PhD) %>% map(function(i) {
    public_v2_112917.levels123 %>% dplyr::filter(
        RACE == df_RACE_isCollege_MS_PhD$RACE[i]
        , isCollege_MS_PhD == df_RACE_isCollege_MS_PhD$isCollege_MS_PhD[i]
    ) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
}) %>% bind_rows
1:nrow(df_RACE_isCollege_MS_PhD) %>% map_df(function(i) {
    public_v2_112917.levels123 %>% dplyr::filter(
        RACE == df_RACE_isCollege_MS_PhD$RACE[i]
        , isCollege_MS_PhD == df_RACE_isCollege_MS_PhD$isCollege_MS_PhD[i]
    ) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
})
bind_cols(
    df_RACE_isCollege_MS_PhD
    , 1:nrow(df_RACE_isCollege_MS_PhD) %>% map_df(function(i) {
        public_v2_112917.levels123 %>% dplyr::filter(
            RACE == df_RACE_isCollege_MS_PhD$RACE[i]
            , isCollege_MS_PhD == df_RACE_isCollege_MS_PhD$isCollege_MS_PhD[i]
        ) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
    })
)
# > for (i in 1:nrow(df_RACE_isCollege_MS_PhD)) {
# +     public_v2_112917.levels123 %>% dplyr::filter(
# +         RACE == df_RACE_isCollege_MS_PhD$RACE[i]
# +         , isCollege_MS_PhD == df_RACE_isCollege_MS_PhD$isCollege_MS_PhD[i]
# +     ) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# + }
# > 1:nrow(df_RACE_isCollege_MS_PhD) %>% map(function(i) {
# +     public_v2_112917.levels123 %>% dplyr::filter(
# +         RACE == df_RACE_isCollege_MS_PhD$RACE[i]
# +         , isCollege_MS_PhD == df_RACE_isCollege_MS_PhD$isCollege_MS_PhD[i]
# +     ) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# + }) %>% bind_rows
#      N CAPI_WT.sum
# 1  171   913173.66
# 2  271  1125421.44
# 3  313  1459116.23
# 4   98   488004.58
# 5   44   102144.58
# 6  341  1284678.19
# 7   69   211164.25
# 8   76   241975.87
# 9  106   391562.36
# 10  36    61819.94
# > 1:nrow(df_RACE_isCollege_MS_PhD) %>% map_df(function(i) {
# +     public_v2_112917.levels123 %>% dplyr::filter(
# +         RACE == df_RACE_isCollege_MS_PhD$RACE[i]
# +         , isCollege_MS_PhD == df_RACE_isCollege_MS_PhD$isCollege_MS_PhD[i]
# +     ) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# + })
#      N CAPI_WT.sum
# 1  171   913173.66
# 2  271  1125421.44
# 3  313  1459116.23
# 4   98   488004.58
# 5   44   102144.58
# 6  341  1284678.19
# 7   69   211164.25
# 8   76   241975.87
# 9  106   391562.36
# 10  36    61819.94
# > bind_cols(
# +     df_RACE_isCollege_MS_PhD
# +     , 1:nrow(df_RACE_isCollege_MS_PhD) %>% map_df(function(i) {
# +         public_v2_112917.levels123 %>% dplyr::filter(
# +             RACE == df_RACE_isCollege_MS_PhD$RACE[i]
# +             , isCollege_MS_PhD == df_RACE_isCollege_MS_PhD$isCollege_MS_PhD[i]
# +         ) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# +     })
# + )
# # A tibble: 10 x 4
#                     RACE isCollege_MS_PhD     N CAPI_WT.sum
#                   <fctr>            <lgl> <int>       <dbl>
#  1 1: Non-Hispanic White            FALSE   171   913173.66
#  2 2: Non-Hispanic Black            FALSE   271  1125421.44
#  3           3: Hispanic            FALSE   313  1459116.23
#  4              4: Asian            FALSE    98   488004.58
#  5              5: Other            FALSE    44   102144.58
#  6 1: Non-Hispanic White             TRUE   341  1284678.19
#  7 2: Non-Hispanic Black             TRUE    69   211164.25
#  8           3: Hispanic             TRUE    76   241975.87
#  9              4: Asian             TRUE   106   391562.36
# 10              5: Other             TRUE    36    61819.94

public_v2_112917.levels123 %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# > public_v2_112917.levels123 %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# # A tibble: 12 x 4
# # Groups:   RACE [?]
#                     RACE isCollege_MS_PhD     N CAPI_WT.sum
#                   <fctr>            <lgl> <int>       <dbl>
#  1 1: Non-Hispanic White            FALSE   171  913173.661
#  2 1: Non-Hispanic White             TRUE   341 1284678.187
#  3 1: Non-Hispanic White               NA     1    3815.433
#  4 2: Non-Hispanic Black            FALSE   271 1125421.441
#  5 2: Non-Hispanic Black             TRUE    69  211164.247
#  6           3: Hispanic            FALSE   313 1459116.225
#  7           3: Hispanic             TRUE    76  241975.873
#  8           3: Hispanic               NA     1    2872.296
#  9              4: Asian            FALSE    98  488004.581
# 10              4: Asian             TRUE   106  391562.356
# 11              5: Other            FALSE    44  102144.581
# 12              5: Other             TRUE    36   61819.938
# > public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# # A tibble: 10 x 4
# # Groups:   RACE [?]
#                     RACE isCollege_MS_PhD     N CAPI_WT.sum
#                   <fctr>            <lgl> <int>       <dbl>
#  1 1: Non-Hispanic White            FALSE   171   913173.66
#  2 1: Non-Hispanic White             TRUE   341  1284678.19
#  3 2: Non-Hispanic Black            FALSE   271  1125421.44
#  4 2: Non-Hispanic Black             TRUE    69   211164.25
#  5           3: Hispanic            FALSE   313  1459116.23
#  6           3: Hispanic             TRUE    76   241975.87
#  7              4: Asian            FALSE    98   488004.58
#  8              4: Asian             TRUE   106   391562.36
#  9              5: Other            FALSE    44   102144.58
# 10              5: Other             TRUE    36    61819.94
# > public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT))
# # A tibble: 10 x 4
# # Groups:   RACE [?]
#                     RACE isCollege_MS_PhD     N CAPI_WT.sum
#                   <fctr>            <lgl> <int>       <dbl>
#  1 1: Non-Hispanic White            FALSE   172   916989.09
#  2 1: Non-Hispanic White             TRUE   341  1284678.19
#  3 2: Non-Hispanic Black            FALSE   271  1125421.44
#  4 2: Non-Hispanic Black             TRUE    69   211164.25
#  5           3: Hispanic            FALSE   314  1461988.52
#  6           3: Hispanic             TRUE    76   241975.87
#  7              4: Asian            FALSE    98   488004.58
#  8              4: Asian             TRUE   106   391562.36
#  9              5: Other            FALSE    44   102144.58
# 10              5: Other             TRUE    36    61819.94



public_v2_112917.levels123 %>% nrow
public_v2_112917.levels123$CAPI_WT %>% sum
public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% nrow
public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% select(CAPI_WT) %>% sum
public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT)) %>% ungroup %>% select(N, CAPI_WT.sum) %>% colSums
public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% nrow
public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% select(CAPI_WT) %>% sum
public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT)) %>% ungroup %>% select(N, CAPI_WT.sum) %>% colSums
# > public_v2_112917.levels123 %>% nrow
# [1] 1527
# > public_v2_112917.levels123$CAPI_WT %>% sum
# [1] 6285749
# > public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% nrow
# [1] 1525
# > public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% select(CAPI_WT) %>% sum
# [1] 6279061
# > public_v2_112917.levels123 %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% na.omit %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT)) %>% ungroup %>% select(N, CAPI_WT.sum) %>% colSums
#           N CAPI_WT.sum 
#        1525     6279061 
# > public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% nrow
# [1] 1527
# > public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% select(CAPI_WT) %>% sum
# [1] 6285749
# > public_v2_112917.levels123 %>% mutate(isCollege_MS_PhD = ifelse(is.na(isCollege_MS_PhD), F, isCollege_MS_PhD)) %>% select(RACE, isCollege_MS_PhD, CAPI_WT) %>% group_by(RACE, isCollege_MS_PhD) %>% summarize(N = n(), CAPI_WT.sum = sum(CAPI_WT)) %>% ungroup %>% select(N, CAPI_WT.sum) %>% colSums
#           N CAPI_WT.sum 
#        1527     6285749 








# https://github.com/mkim0710/tidystat/blob/master/Rdev/function.pairwise.data_frame.dev.r

## @ function.pairwise.data_frame = function(vars) { ======  
function.pairwise.data_frame.old = function(vars, only.lower.tri = T) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.pairwise.data_frame.dev.r")
    # library(tidyverse)
    vars.outer = outer(vars, vars, function(x, y) paste(x, y, sep = "&"))
    if (only.lower.tri == T) {
        tmp = data_frame(vars = vars.outer[lower.tri(vars.outer)])
    } else {
        tmp = data_frame(vars = vars.outer %>% as.vector)
    }
    out = tmp %>% separate(col = "vars", into = c("var_j", "var_i"), sep = "&")
    out = out[c("var_i", "var_j")]
    out
}

# ?rep
## @ function.pairwise.data_frame = function(vars) { ======  
function.pairwise.data_frame = function(vars, only.lower.tri = T) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.pairwise.data_frame.dev.r")
    # library(tidyverse)
    vars.factor.unique.sort = sort(unique(as.factor(vars)))
    out = data.frame(
        var_i = rep(vars.factor.unique.sort, each = length(vars.factor.unique.sort))
        , var_j = rep(vars.factor.unique.sort, times = length(vars.factor.unique.sort))
    )
    if (only.lower.tri == T) {
        out = out[as.numeric(out$var_i) < as.numeric(out$var_j), ]
    }
    out |> as_tibble()
}


letters |> str()
letters %>% function.pairwise.data_frame
26 * 25 / 2
# > letters |> str()
#  chr [1:26] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
# > letters %>% function.pairwise.data_frame
# # A tibble: 325 x 2
#    var_i var_j
#  * <fct> <fct>
#  1 a     b    
#  2 a     c    
#  3 a     d    
#  4 a     e    
#  5 a     f    
#  6 a     g    
#  7 a     h    
#  8 a     i    
#  9 a     j    
# 10 a     k    
# # ... with 315 more rows
# > 26 * 25 / 2
# [1] 325

letters %>% function.pairwise.data_frame(only.lower.tri = F)
26 ^ 2
# > letters %>% function.pairwise.data_frame(only.lower.tri = F)
# # A tibble: 676 x 2
#    var_i var_j
#    <fct> <fct>
#  1 a     a    
#  2 a     b    
#  3 a     c    
#  4 a     d    
#  5 a     e    
#  6 a     f    
#  7 a     g    
#  8 a     h    
#  9 a     i    
# 10 a     j    
# # ... with 666 more rows
# > 26 ^ 2
# [1] 676

                       
expand.grid(var_i = letters, var_j = letters) |> as_tibble()
# > expand.grid(var_i = letters, var_j = letters) |> as_tibble()
# # A tibble: 676 x 2
#    var_i var_j
#    <fct> <fct>
#  1 a     a    
#  2 b     a    
#  3 c     a    
#  4 d     a    
#  5 e     a    
#  6 f     a    
#  7 g     a    
#  8 h     a    
#  9 i     a    
# 10 j     a    
# # ... with 666 more rows

                       
system.time(join2014f3od.codeset.valid.7digit %>% function.pairwise.data_frame.old(only.lower.tri = F)) #----
system.time(join2014f3od.codeset.valid.7digit %>% function.pairwise.data_frame(only.lower.tri = F)) #----
# > system.time(join2014f3od.codeset.valid.7digit %>% function.pairwise.data_frame.old(only.lower.tri = F)) #----  
#    user  system elapsed 
#   35.35    0.22   35.68 
# > system.time(join2014f3od.codeset.valid.7digit %>% function.pairwise.data_frame(only.lower.tri = F)) #----  
#    user  system elapsed 
#    0.36    0.01    0.41 




# @@ END-----  
