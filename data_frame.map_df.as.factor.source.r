# data_frame.map_df.as.factor.source.r


data_frame.map_df.as.factor = function(df, colnames_numeric.as.factor = c("PersonID", "PERSON_ID"), colnames_character.as.numeric.as.factor = "rowname") {
    # source("https://github.com/mkim0710/tidystat/raw/master/data_frame.map_df.as.factor.source.r")
    # df[, colnames(df) %in% colnames_character.as.numeric.as.factor] = 
    #     df[, colnames(df) %in% colnames_character.as.numeric.as.factor] %>%
    #     map_df(function (x) as.factor(as.numeric(x)))
    df[, colnames(df) %in% colnames_character.as.numeric.as.factor] = 
        df[, colnames(df) %in% colnames_character.as.numeric.as.factor] %>%
        map_df(function (x) {
            x.numeric = as.numeric(x)
            if(any(is.na(x.numeric))) {
                warning("any(is.na(as.numeric(x))) -> Check colnames_character.as.numeric.as.factor")
            } else {
                x = as.factor(x.numeric)
            }
            x
        })
    df[, colnames(df) %in% colnames_numeric.as.factor] = 
        df[, colnames(df) %in% colnames_numeric.as.factor] %>%
        map_df(as.factor)
    df = map_df(df, function(x) {
        if (is.character(x)) {
            x = as.factor(x)
        }
        x
    })
    df
}


# #@ test) data_frame.map_df.as.factor() -----
# library(tidyverse)
# df = data_frame(LETTERS = LETTERS, letters = letters, numbers = 1:26 * 2, PersonID = 1:26, PERSON_ID = 1:26 + 100) %>% rownames_to_column()
# df
# # > df = data_frame(LETTERS = LETTERS, letters = letters, numbers = 1:26 * 2, PersonID = 1:26, PERSON_ID = 1:26 + 100) %>% rownames_to_column()
# # > df
# # # A tibble: 26 x 6
# #    rowname LETTERS letters numbers PersonID PERSON_ID
# #      <chr>   <chr>   <chr>   <dbl>    <int>     <dbl>
# #  1       1       A       a       2        1       101
# #  2       2       B       b       4        2       102
# #  3       3       C       c       6        3       103
# #  4       4       D       d       8        4       104
# #  5       5       E       e      10        5       105
# #  6       6       F       f      12        6       106
# #  7       7       G       g      14        7       107
# #  8       8       H       h      16        8       108
# #  9       9       I       i      18        9       109
# # 10      10       J       j      20       10       110
# # # ... with 16 more rows
# 
# 
# 
# 
# 
# 
# df %>% str
# data_frame.map_df.as.factor(df) %>% str
# data_frame.map_df.as.factor(df, colnames_numeric.as.factor = NULL) %>% str
# data_frame.map_df.as.factor(df, colnames_character.as.numeric.as.factor = NULL) %>% str
# data_frame.map_df.as.factor(df, colnames_character.as.numeric.as.factor = "aaa") %>% str
# data_frame.map_df.as.factor(df, colnames_character.as.numeric.as.factor = "letters") %>% str
# # > df %>% str
# # Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	26 obs. of  6 variables:
# #  $ rowname  : chr  "1" "2" "3" "4" ...
# #  $ LETTERS  : chr  "A" "B" "C" "D" ...
# #  $ letters  : chr  "a" "b" "c" "d" ...
# #  $ numbers  : num  2 4 6 8 10 12 14 16 18 20 ...
# #  $ PersonID : int  1 2 3 4 5 6 7 8 9 10 ...
# #  $ PERSON_ID: num  101 102 103 104 105 106 107 108 109 110 ...
# # > data_frame.map_df.as.factor(df) %>% str
# # Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	26 obs. of  6 variables:
# #  $ rowname  : Factor w/ 26 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
# #  $ LETTERS  : Factor w/ 26 levels "A","B","C","D",..: 1 2 3 4 5 6 7 8 9 10 ...
# #  $ letters  : Factor w/ 26 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10 ...
# #  $ numbers  : num  2 4 6 8 10 12 14 16 18 20 ...
# #  $ PersonID : Factor w/ 26 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
# #  $ PERSON_ID: Factor w/ 26 levels "101","102","103",..: 1 2 3 4 5 6 7 8 9 10 ...
# # > data_frame.map_df.as.factor(df, colnames_numeric.as.factor = NULL) %>% str
# # Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	26 obs. of  6 variables:
# #  $ rowname  : Factor w/ 26 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
# #  $ LETTERS  : Factor w/ 26 levels "A","B","C","D",..: 1 2 3 4 5 6 7 8 9 10 ...
# #  $ letters  : Factor w/ 26 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10 ...
# #  $ numbers  : num  2 4 6 8 10 12 14 16 18 20 ...
# #  $ PersonID : int  1 2 3 4 5 6 7 8 9 10 ...
# #  $ PERSON_ID: num  101 102 103 104 105 106 107 108 109 110 ...
# # > data_frame.map_df.as.factor(df, colnames_character.as.numeric.as.factor = NULL) %>% str
# # Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	26 obs. of  6 variables:
# #  $ rowname  : Factor w/ 26 levels "1","10","11",..: 1 12 20 21 22 23 24 25 26 2 ...
# #  $ LETTERS  : Factor w/ 26 levels "A","B","C","D",..: 1 2 3 4 5 6 7 8 9 10 ...
# #  $ letters  : Factor w/ 26 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10 ...
# #  $ numbers  : num  2 4 6 8 10 12 14 16 18 20 ...
# #  $ PersonID : Factor w/ 26 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
# #  $ PERSON_ID: Factor w/ 26 levels "101","102","103",..: 1 2 3 4 5 6 7 8 9 10 ...
# # > data_frame.map_df.as.factor(df, colnames_character.as.numeric.as.factor = "aaa") %>% str
# # Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	26 obs. of  6 variables:
# #  $ rowname  : Factor w/ 26 levels "1","10","11",..: 1 12 20 21 22 23 24 25 26 2 ...
# #  $ LETTERS  : Factor w/ 26 levels "A","B","C","D",..: 1 2 3 4 5 6 7 8 9 10 ...
# #  $ letters  : Factor w/ 26 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10 ...
# #  $ numbers  : num  2 4 6 8 10 12 14 16 18 20 ...
# #  $ PersonID : Factor w/ 26 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
# #  $ PERSON_ID: Factor w/ 26 levels "101","102","103",..: 1 2 3 4 5 6 7 8 9 10 ...
# # > data_frame.map_df.as.factor(df, colnames_character.as.numeric.as.factor = "letters") %>% str
# # Classes ¡®tbl_df¡¯, ¡®tbl¡¯ and 'data.frame':	26 obs. of  6 variables:
# #  $ rowname  : Factor w/ 26 levels "1","10","11",..: 1 12 20 21 22 23 24 25 26 2 ...
# #  $ LETTERS  : Factor w/ 26 levels "A","B","C","D",..: 1 2 3 4 5 6 7 8 9 10 ...
# #  $ letters  : Factor w/ 26 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10 ...
# #  $ numbers  : num  2 4 6 8 10 12 14 16 18 20 ...
# #  $ PersonID : Factor w/ 26 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
# #  $ PERSON_ID: Factor w/ 26 levels "101","102","103",..: 1 2 3 4 5 6 7 8 9 10 ...
# # Warning messages:
# # 1: In .f(.x[[i]], ...) : NAs introduced by coercion
# # 2: In .f(.x[[i]], ...) :
# #   any(is.na(as.numeric(x))) -> Check colnames_character.as.numeric.as.factor



#@ end -----
