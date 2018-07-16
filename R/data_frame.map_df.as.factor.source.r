# data_frame.map_df.as.factor.source.r


data_frame.map_df.as.factor = function (
    df
    , colnames_character.as.numeric.as.factor = c("rowname")
    , colnames.as.factor = c("PersonID", "PERSON_ID")
    , colnames.not.as.factor = NULL
    , column.is.character.as.factor = T
) 
{
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
    df[, colnames(df) %in% colnames.as.factor] = 
        df[, colnames(df) %in% colnames.as.factor] %>%
        map_df(as.factor)
    if (column.is.character.as.factor == T) {
        df[ ,!names(df) %in% colnames.not.as.factor] = df[ ,!names(df) %in% colnames.not.as.factor] %>% 
            map_df(function(x) {
            if (is.character(x)) {
                x = as.factor(x)
            }
            x
        })
    }
    df
}


#@ test) data_frame.map_df.as.factor() -----
library(tidyverse)
df = data_frame(LETTERS = LETTERS, letters = letters, numbers = 1:26 * 2, PersonID = 1:26, PERSON_ID = 1:26 + 100, KEY = 1:26 + 10^8, KEY_SEQ = as.character((1:26 + 10^2) * 10^5)) %>% rownames_to_column()
df
# > df = data_frame(LETTERS = LETTERS, letters = letters, numbers = 1:26 * 2, PersonID = 1:26, PERSON_ID = 1:26 + 100, KEY = 1:26 + 10^8, KEY_SEQ = as.character((1:26 + 10^2) * 10^5)) %>% rownames_to_column()
# > df
# # A tibble: 26 x 8
#    rowname LETTERS letters numbers PersonID PERSON_ID   KEY  KEY_SEQ
#      <chr>   <chr>   <chr>   <dbl>    <int>     <dbl> <dbl>    <chr>
#  1       1       A       a       2        1       101 1e+08 10100000
#  2       2       B       b       4        2       102 1e+08 10200000
#  3       3       C       c       6        3       103 1e+08 10300000
#  4       4       D       d       8        4       104 1e+08 10400000
#  5       5       E       e      10        5       105 1e+08 10500000
#  6       6       F       f      12        6       106 1e+08 10600000
#  7       7       G       g      14        7       107 1e+08 10700000
#  8       8       H       h      16        8       108 1e+08 10800000
#  9       9       I       i      18        9       109 1e+08 10900000
# 10      10       J       j      20       10       110 1e+08  1.1e+07
# # ... with 16 more rows

df %>% str
data_frame.map_df.as.factor(df) %>% str
data_frame.map_df.as.factor(df, colnames.as.factor = NULL) %>% str
data_frame.map_df.as.factor(df, colnames_character.as.numeric.as.factor = NULL) %>% str
data_frame.map_df.as.factor(df, colnames_character.as.numeric.as.factor = "aaa") %>% str
data_frame.map_df.as.factor(df, colnames_character.as.numeric.as.factor = "letters") %>% str
data_frame.map_df.as.factor(df, colnames.not.as.factor = "KEY_SEQ") %>% str
# > df %>% str
# Classes ??tbl_df??, ??tbl?? and 'data.frame':	26 obs. of  8 variables:
#  $ rowname  : chr  "1" "2" "3" "4" ...
#  $ LETTERS  : chr  "A" "B" "C" "D" ...
#  $ letters  : chr  "a" "b" "c" "d" ...
#  $ numbers  : num  2 4 6 8 10 12 14 16 18 20 ...
#  $ PersonID : int  1 2 3 4 5 6 7 8 9 10 ...
#  $ PERSON_ID: num  101 102 103 104 105 106 107 108 109 110 ...
#  $ KEY      : num  1e+08 1e+08 1e+08 1e+08 1e+08 ...
#  $ KEY_SEQ  : chr  "10100000" "10200000" "10300000" "10400000" ...
# > data_frame.map_df.as.factor(df) %>% str
# Classes ??tbl_df??, ??tbl?? and 'data.frame':	26 obs. of  8 variables:
#  $ rowname  : Factor w/ 26 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ LETTERS  : Factor w/ 26 levels "A","B","C","D",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ letters  : Factor w/ 26 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ numbers  : num  2 4 6 8 10 12 14 16 18 20 ...
#  $ PersonID : Factor w/ 26 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ PERSON_ID: Factor w/ 26 levels "101","102","103",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ KEY      : num  1e+08 1e+08 1e+08 1e+08 1e+08 ...
#  $ KEY_SEQ  : Factor w/ 26 levels "1.1e+07","1.2e+07",..: 3 4 5 6 7 8 9 10 11 1 ...
# > data_frame.map_df.as.factor(df, colnames.as.factor = NULL) %>% str
# Classes ??tbl_df??, ??tbl?? and 'data.frame':	26 obs. of  8 variables:
#  $ rowname  : Factor w/ 26 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ LETTERS  : Factor w/ 26 levels "A","B","C","D",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ letters  : Factor w/ 26 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ numbers  : num  2 4 6 8 10 12 14 16 18 20 ...
#  $ PersonID : int  1 2 3 4 5 6 7 8 9 10 ...
#  $ PERSON_ID: num  101 102 103 104 105 106 107 108 109 110 ...
#  $ KEY      : num  1e+08 1e+08 1e+08 1e+08 1e+08 ...
#  $ KEY_SEQ  : Factor w/ 26 levels "1.1e+07","1.2e+07",..: 3 4 5 6 7 8 9 10 11 1 ...
# > data_frame.map_df.as.factor(df, colnames_character.as.numeric.as.factor = NULL) %>% str
# Classes ??tbl_df??, ??tbl?? and 'data.frame':	26 obs. of  8 variables:
#  $ rowname  : Factor w/ 26 levels "1","10","11",..: 1 12 20 21 22 23 24 25 26 2 ...
#  $ LETTERS  : Factor w/ 26 levels "A","B","C","D",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ letters  : Factor w/ 26 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ numbers  : num  2 4 6 8 10 12 14 16 18 20 ...
#  $ PersonID : Factor w/ 26 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ PERSON_ID: Factor w/ 26 levels "101","102","103",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ KEY      : num  1e+08 1e+08 1e+08 1e+08 1e+08 ...
#  $ KEY_SEQ  : Factor w/ 26 levels "1.1e+07","1.2e+07",..: 3 4 5 6 7 8 9 10 11 1 ...
# > data_frame.map_df.as.factor(df, colnames_character.as.numeric.as.factor = "aaa") %>% str
# Classes ??tbl_df??, ??tbl?? and 'data.frame':	26 obs. of  8 variables:
#  $ rowname  : Factor w/ 26 levels "1","10","11",..: 1 12 20 21 22 23 24 25 26 2 ...
#  $ LETTERS  : Factor w/ 26 levels "A","B","C","D",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ letters  : Factor w/ 26 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ numbers  : num  2 4 6 8 10 12 14 16 18 20 ...
#  $ PersonID : Factor w/ 26 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ PERSON_ID: Factor w/ 26 levels "101","102","103",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ KEY      : num  1e+08 1e+08 1e+08 1e+08 1e+08 ...
#  $ KEY_SEQ  : Factor w/ 26 levels "1.1e+07","1.2e+07",..: 3 4 5 6 7 8 9 10 11 1 ...
# > data_frame.map_df.as.factor(df, colnames_character.as.numeric.as.factor = "letters") %>% str
# Classes ??tbl_df??, ??tbl?? and 'data.frame':	26 obs. of  8 variables:
#  $ rowname  : Factor w/ 26 levels "1","10","11",..: 1 12 20 21 22 23 24 25 26 2 ...
#  $ LETTERS  : Factor w/ 26 levels "A","B","C","D",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ letters  : Factor w/ 26 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ numbers  : num  2 4 6 8 10 12 14 16 18 20 ...
#  $ PersonID : Factor w/ 26 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ PERSON_ID: Factor w/ 26 levels "101","102","103",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ KEY      : num  1e+08 1e+08 1e+08 1e+08 1e+08 ...
#  $ KEY_SEQ  : Factor w/ 26 levels "1.1e+07","1.2e+07",..: 3 4 5 6 7 8 9 10 11 1 ...
# Warning messages:
# 1: In .f(.x[[i]], ...) : NAs introduced by coercion
# 2: In .f(.x[[i]], ...) :
#   any(is.na(as.numeric(x))) -> Check colnames_character.as.numeric.as.factor
# > data_frame.map_df.as.factor(df, colnames.not.as.factor = "KEY_SEQ") %>% str
# Classes ??tbl_df??, ??tbl?? and 'data.frame':	26 obs. of  8 variables:
#  $ rowname  : Factor w/ 26 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ LETTERS  : Factor w/ 26 levels "A","B","C","D",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ letters  : Factor w/ 26 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ numbers  : num  2 4 6 8 10 12 14 16 18 20 ...
#  $ PersonID : Factor w/ 26 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ PERSON_ID: Factor w/ 26 levels "101","102","103",..: 1 2 3 4 5 6 7 8 9 10 ...
#  $ KEY      : num  1e+08 1e+08 1e+08 1e+08 1e+08 ...
#  $ KEY_SEQ  : chr  "10100000" "10200000" "10300000" "10400000" ...
















is.numeric(as.Date("2002-01-01"))
is.integer(as.Date("2002-01-01"))
is.character(as.Date("2002-01-01"))
is.POSIXct(as.Date("2002-01-01"))
is.POSIXlt(as.Date("2002-01-01"))
is.POSIXt(as.Date("2002-01-01"))
class(as.Date("2002-01-01"))
lubridate::is.Date(as.Date("2002-01-01"))
is.numeric(999999999L)
is.integer(999999999L)
class(999999999L)
is.numeric(999999999)
is.integer(999999999)
class(999999999)
# > is.numeric(as.Date("2002-01-01"))
# [1] FALSE
# > is.integer(as.Date("2002-01-01"))
# [1] FALSE
# > is.character(as.Date("2002-01-01"))
# [1] FALSE
# > is.POSIXct(as.Date("2002-01-01"))
# [1] FALSE
# > is.POSIXlt(as.Date("2002-01-01"))
# [1] FALSE
# > is.POSIXt(as.Date("2002-01-01"))
# [1] FALSE
# > class(as.Date("2002-01-01"))
# [1] "Date"
# > lubridate::is.Date(as.Date("2002-01-01"))
# [1] TRUE
# > is.numeric(999999999L)
# [1] TRUE
# > is.integer(999999999L)
# [1] TRUE
# > class(999999999L)
# [1] "integer"
# > is.numeric(999999999)
# [1] TRUE
# > is.integer(999999999)
# [1] FALSE
# > class(999999999)
# [1] "numeric"


is(as.Date("2002-01-01"), "Date")
inherits(as.Date("2002-01-01"), "Date")
class(as.Date("2002-01-01")) == "Date"
lubridate::is.Date(as.Date("2002-01-01"))
# > is(as.Date("2002-01-01"), "Date")
# [1] TRUE
# > inherits(as.Date("2002-01-01"), "Date")
# [1] TRUE
# > class(as.Date("2002-01-01")) == "Date"
# [1] TRUE
# > lubridate::is.Date(as.Date("2002-01-01"))
# [1] TRUE

library(tidyverse)
as.Date("2002-01-01") %>% is("Date")
as.Date("2002-01-01") %>% inherits("Date")
as.Date("2002-01-01") %>% class %>% {. == "Date"}
as.Date("2002-01-01") %>% lubridate::is.Date
as.Date("2002-01-01") %>% lubridate::is.Date(.)
# > as.Date("2002-01-01") %>% is("Date")
# [1] TRUE
# > as.Date("2002-01-01") %>% inherits("Date")
# [1] TRUE
# > as.Date("2002-01-01") %>% class %>% {. == "Date"}
# [1] TRUE
# > as.Date("2002-01-01") %>% lubridate::is.Date
# Error in .::lubridate : unused argument (is.Date)
# > as.Date("2002-01-01") %>% lubridate::is.Date(.)
# [1] TRUE


# https://github.com/tidyverse/lubridate/blob/master/R/Dates.r
# https://github.com/wch/r-source/blob/tags/R-3-5-1/src/library/methods/R/is.R

#@ end -----
