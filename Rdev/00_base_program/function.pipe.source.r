# function.pipe.source.r



# https://rdrr.io/cran/magrittr/src/tests/testthat/test-anonymous-functions.r ======
# Simple vectorized function
(function(x) 1 + x^2/2 + x^3/9 + x^4/16)(1:10)
1:10 %>% (function(x) 1 + x^2/2 + x^3/9 + x^4/16)
1:10 %>% (function(x) 1 + x^2/2 + x^3/9 + x^4/16)(.)
1:10 %>% {1 + .^2/2 + .^3/9 + .^4/16}
1:10 %>% (function(x) x %>% {1 + .^2/2 + .^3/9 + .^4/16})
# > (function(x) 1 + x^2/2 + x^3/9 + x^4/16)(1:10)
#  [1]   1.673611   4.888889  13.562500  32.111111  66.451389 124.000000 213.673611 345.888889 532.562500 787.111111
# > 1:10 %>% (function(x) 1 + x^2/2 + x^3/9 + x^4/16)
#  [1]   1.673611   4.888889  13.562500  32.111111  66.451389 124.000000 213.673611 345.888889 532.562500 787.111111
# > 1:10 %>% (function(x) 1 + x^2/2 + x^3/9 + x^4/16)(.)
#  [1]   1.673611   4.888889  13.562500  32.111111  66.451389 124.000000 213.673611 345.888889 532.562500 787.111111
# > 1:10 %>% {1 + .^2/2 + .^3/9 + .^4/16}
#  [1]   1.673611   4.888889  13.562500  32.111111  66.451389 124.000000 213.673611 345.888889 532.562500 787.111111
# > 1:10 %>% (function(x) x %>% {1 + .^2/2 + .^3/9 + .^4/16})
#  [1]   1.673611   4.888889  13.562500  32.111111  66.451389 124.000000 213.673611 345.888889 532.562500 787.111111






# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/13_duplicated/data.duplicated.source.r



library(tidyverse)

# https://stackoverflow.com/questions/22959635/remove-duplicated-rows-using-dplyr
set.seed(1234)
df.example = data.frame(x=sample(0:1,10,replace=T),y=sample(0:1,10,replace=T)) %>% rownames_to_column
# df.example %>% tribble_paste #----
tibble::tribble(
    ~rowname, ~x, ~y,
         "1", 0L, 1L,
         "2", 1L, 1L,
         "3", 1L, 0L,
         "4", 1L, 1L,
         "5", 1L, 0L,
         "6", 1L, 1L,
         "7", 0L, 0L,
         "8", 0L, 0L,
         "9", 1L, 0L,
        "10", 1L, 0L
    )


df.example %>% group_by(x,y) %>% summarize(n())
# > df.example %>% group_by(x,y) %>% summarize(n())
# # A tibble: 4 x 3
# # Groups:   x [2]
#       x     y `n()`
#   <int> <int> <int>
# 1     0     0     2
# 2     0     1     1
# 3     1     0     4
# 4     1     1     3


df.example %>% 
    (function(df) {
        df %>% group_by(x,y) %>% summarize(n()) %>% 
            left_join(df)
    })
# > df.example %>% 
# +     (function(df) {
# +         df %>% group_by(x,y) %>% summarize(n()) %>% 
# +             left_join(df)
# +     })
# Joining, by = c("x", "y")
# # A tibble: 10 x 4
# # Groups:   x [2]
#        x     y `n()` rowname
#    <int> <int> <int> <chr>  
#  1     0     0     2 7      
#  2     0     0     2 8      
#  3     0     1     1 1      
#  4     1     0     4 3      
#  5     1     0     4 5      
#  6     1     0     4 9      
#  7     1     0     4 10     
#  8     1     1     3 2      
#  9     1     1     3 4      
# 10     1     1     3 6  




df.example %>% 
    (function(df.example) {
        df.example %>% group_by(x,y) %>% summarize(n()) %>% 
            left_join(df.example)
    }) %>% group_by(x, y, `n()`) %>% nest
# > df.example %>% 
# +     (function(df.example) {
# +         df.example %>% group_by(x,y) %>% summarize(n()) %>% 
# +             left_join(df.example)
# +     }) %>% group_by(x, y, `n()`) %>% nest
# Joining, by = c("x", "y")
# # A tibble: 4 x 4
#       x     y `n()` data            
#   <int> <int> <int> <list>          
# 1     0     0     2 <tibble [2 x 1]>
# 2     0     1     1 <tibble [1 x 1]>
# 3     1     0     4 <tibble [4 x 1]>
# 4     1     1     3 <tibble [3 x 1]>


df.example %>% group_by(x, y) %>% nest %>% 
    mutate(nrow = data %>% map_dbl(nrow))
df.example %>% group_by(x, y) %>% nest %>% arrange(x, y) %>% 
    mutate(nrow = data %>% map_dbl(nrow))
# > df.example %>% group_by(x, y) %>% nest %>% 
# +     mutate(nrow = data %>% map_dbl(nrow))
# # A tibble: 4 x 4
#       x     y data              nrow
#   <int> <int> <list>           <dbl>
# 1     0     1 <tibble [1 x 1]>     1
# 2     1     1 <tibble [3 x 1]>     3
# 3     1     0 <tibble [4 x 1]>     4
# 4     0     0 <tibble [2 x 1]>     2
# > df.example %>% group_by(x, y) %>% nest %>% arrange(x, y) %>% 
# +     mutate(nrow = data %>% map_dbl(nrow))
# # A tibble: 4 x 4
#       x     y data              nrow
#   <int> <int> <list>           <dbl>
# 1     0     0 <tibble [2 x 1]>     2
# 2     0     1 <tibble [1 x 1]>     1
# 3     1     0 <tibble [4 x 1]>     4
# 4     1     1 <tibble [3 x 1]>     3


df.example %>% group_by(x, y) %>% nest %>% arrange(x, y) %>% 
    mutate(data = data %>% map_chr(paste0, collapse = "|"))
# > df.example %>% group_by(x, y) %>% nest %>% arrange(x, y) %>% 
# +     mutate(data = data %>% map_chr(paste0, collapse = "|"))
# # A tibble: 4 x 3
#       x     y data                            
#   <int> <int> <chr>                           
# 1     0     0 "c(\"7\", \"8\")"               
# 2     0     1 1                               
# 3     1     0 "c(\"3\", \"5\", \"9\", \"10\")"
# 4     1     1 "c(\"2\", \"4\", \"6\")" 















#@ ------
d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm.metformin.2797 %>% 
    filter(CONCEPT_NDC_metformin) %>% 
    filter(lmp + 7*6 <= SVCDATE & SVCDATE < lmp + 7*23) %>% 
    (function (df) df %>%     
         select(ENROLID, SVCDATE, Exposure, METQTY, DAYSUPP, concept_name.toupper.METFORMIN.dose) %>% 
         mutate(`METQTY/D` = METQTY/abs(DAYSUPP), `dose*METQTY/D` = concept_name.toupper.METFORMIN.dose*METQTY/abs(DAYSUPP)) %>% 
         filter(`dose*METQTY/D` == 2000) %>% 
         group_by(ENROLID) %>% summarise(n(), sum(DAYSUPP), mean(DAYSUPP), mean(`dose*METQTY/D`)) %>% 
         
         filter(`sum(DAYSUPP)` >= 180) %>% 
         
         left_join(df) %>%
         as.tibble
    ) %>% 
    mutate(SVCDATE - lmp, enddate - lmp) %>% 
    select(ENROLID, lmp, `enddate - lmp`, `n()`, `SVCDATE - lmp`, DAYSUPP, everything()) %>% 
    arrange(lmp, ENROLID, SVCDATE) %>% print(n=99) #----
# > d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm.metformin.2797 %>% 
# +     filter(CONCEPT_NDC_metformin) %>% 
# +     filter(lmp + 7*6 <= SVCDATE & SVCDATE < lmp + 7*23) %>% 
# +     (function (df) df %>%     
# +          select(ENROLID, SVCDATE, Exposure, METQTY, DAYSUPP, concept_name.toupper.METFORMIN.dose) %>% 
# +          mutate(`METQTY/D` = METQTY/abs(DAYSUPP), `dose*METQTY/D` = concept_name.toupper.METFORMIN.dose*METQTY/abs(DAYSUPP)) %>% 
# +          filter(`dose*METQTY/D` == 2000) %>% 
# +          group_by(ENROLID) %>% summarise(n(), sum(DAYSUPP), mean(DAYSUPP), mean(`dose*METQTY/D`)) %>% 
# +          
# +          filter(`sum(DAYSUPP)` >= 180) %>% 
# +          
# +          left_join(df) %>%
# +          as.tibble
# +     ) %>% 
# +     mutate(SVCDATE - lmp, enddate - lmp) %>% 
# +     select(ENROLID, lmp, `enddate - lmp`, `n()`, `SVCDATE - lmp`, DAYSUPP, everything()) %>% 
# +     arrange(lmp, ENROLID, SVCDATE) %>% print(n=99) #----
# Joining, by = "ENROLID"
# # A tibble: 65 x 31
#    ENROLID lmp        `enddate - lmp` `n()` `SVCDATE - lmp` DAYSUPP `sum(DAYSUPP)` `mean(DAYSUPP)` `mean(\`dose*ME~ Exposure enddate    SVCDATE    PDDATE     NDCNUM METQTY   QTY `max(enddate)`
#      <dbl> <date>     <time>          <int> <time>            <dbl>          <dbl>           <dbl>            <dbl> <fct>    <date>     <date>     <date>     <chr>   <dbl> <dbl> <date>        
#  1 2.32e 9 2011-01-05 273 days            2  57 days             90            180              90             2000 metform~ 2011-10-05 2011-03-03 2011-03-24 68382~    180     1 2011-10-05    
#  2 2.32e 9 2011-01-05 273 days            2 129 days             90            180              90             2000 metform~ 2011-10-05 2011-05-14 2011-05-24 68382~    180     1 2011-10-05    
#  3 2.93e10 2011-01-11 273 days            3  49 days             30            210              70             2000 metform~ 2011-10-11 2011-03-01 2011-03-01 00093~    120     1 2011-10-11    
#  4 2.93e10 2011-01-11 273 days            3  76 days             90            210              70             2000 metform~ 2011-10-11 2011-03-28 2011-03-28 00093~    360     1 2011-10-11    
#  5 2.93e10 2011-01-11 273 days            3  96 days             90            210              70             2000 metform~ 2011-10-11 2011-04-17 2011-04-17 00093~    360     1 2011-10-11    
#  6 3.13e 9 2011-01-19 273 days            2  48 days             90            180              90             2000 metform~ 2011-10-19 2011-03-08 2011-03-31 68382~    180     1 2011-10-19    
#  7 3.13e 9 2011-01-19 273 days            2 124 days             90            180              90             2000 metform~ 2011-10-19 2011-05-23 2011-06-09 68382~    180     1 2011-10-19    
#  8 2.10e 9 2011-01-24 245 days            2  93 days             90            180              90             2000 insulin~ 2011-09-26 2011-04-27 2011-04-30 00093~    360     1 2011-09-26    
#  9 2.10e 9 2011-01-24 245 days            2 156 days             90            180              90             2000 insulin~ 2011-09-26 2011-06-29 2011-06-30 00093~    180     1 2011-09-26    
# 10 2.10e 9 2011-01-24 245 days            2 156 days             90            180              90             2000 insulin~ 2011-09-26 2011-06-29 2011-06-30 00093~    360     1 2011-09-26    
# 11 1.41e 9 2011-07-18 273 days            2  46 days            100            200             100             2000 metform~ 2012-04-16 2011-09-02 2011-09-30 65862~    200     1 2012-04-16    
# 12 1.41e 9 2011-07-18 273 days            2 149 days            100            200             100             2000 metform~ 2012-04-16 2011-12-14 2011-12-31 65862~    200     1 2012-04-16    
# 13 2.62e 9 2011-08-05 273 days            2  50 days             90            180              90             2000 metform~ 2012-05-04 2011-09-24 2011-09-30 68382~    180     1 2012-05-04    
# 14 2.62e 9 2011-08-05 273 days            2 132 days             90            180              90             2000 metform~ 2012-05-04 2011-12-15 2011-12-23 68382~    180     1 2012-05-04    
# 15 1.59e 9 2011-09-02 273 days            2  43 days             90            180              90             2000 metform~ 2012-06-01 2011-10-15 2011-10-15 68382~    180     1 2012-06-01    
# 16 1.59e 9 2011-09-02 273 days            2 133 days             90            180              90             2000 metform~ 2012-06-01 2012-01-13 2012-01-13 68382~    180     1 2012-06-01    
# 17 2.85e 9 2011-09-11 273 days            2  52 days             90            180              90             2000 metform~ 2012-06-10 2011-11-02 2011-11-07 00093~    360     1 2012-06-10    
# 18 2.85e 9 2011-09-11 273 days            2 136 days             90            180              90             2000 metform~ 2012-06-10 2012-01-25 2012-01-31 00093~    360     1 2012-06-10    
# 19 2.19e 9 2011-11-12 273 days            2  45 days             90            180              90             2000 metform~ 2012-08-11 2011-12-27 2011-12-31 00093~    360     1 2012-08-11    
# 20 2.19e 9 2011-11-12 273 days            2 115 days             90            180              90             2000 metform~ 2012-08-11 2012-03-06 2012-03-07 00093~    360     1 2012-08-11    
# 21 1.82e 9 2011-12-12 273 days            2  57 days             90            180              90             2000 metform~ 2012-09-10 2012-02-07 2012-02-07 65862~    180     1 2012-09-10    
# 22 1.82e 9 2011-12-12 273 days            2 149 days             90            180              90             2000 metform~ 2012-09-10 2012-05-09 2012-05-09 65862~    180     1 2012-09-10    
# 23 3.06e10 2012-02-26 273 days            3  48 days             90            210              70             2000 metform~ 2012-11-25 2012-04-14 2012-04-27 43547~    180     1 2012-11-25    
# 24 3.06e10 2012-02-26 273 days            3 148 days             90            210              70             2000 metform~ 2012-11-25 2012-07-23 2012-08-03 43547~    180     1 2012-11-25    
# 25 3.06e10 2012-02-26 273 days            3 150 days             30            210              70             2000 metform~ 2012-11-25 2012-07-25 2012-08-03 68382~     60     1 2012-11-25    
# 26 2.57e 9 2012-04-06 273 days            2  80 days             90            180              90             2000 metform~ 2013-01-04 2012-06-25 2012-06-25 57664~    180     1 2013-01-04    
# 27 2.57e 9 2012-04-06 273 days            2 153 days             90            180              90             2000 metform~ 2013-01-04 2012-09-06 2012-09-06 57664~    180     1 2013-01-04    
# 28 2.61e 9 2012-04-30 273 days            2  46 days            100            200             100             2000 metform~ 2013-01-28 2012-06-15 2012-06-30 65862~    400     1 2013-01-28    
# 29 2.61e 9 2012-04-30 273 days            2 114 days            100            200             100             2000 metform~ 2013-01-28 2012-08-22 2012-08-31 65862~    400     1 2013-01-28    
# 30 2.55e 9 2012-05-18 273 days            2  54 days             90            180              90             2000 metform~ 2013-02-15 2012-07-11 2012-07-11 62756~    360     1 2013-02-15    
# 31 2.55e 9 2012-05-18 273 days            2 143 days             90            180              90             2000 metform~ 2013-02-15 2012-10-08 NA         62756~    360     1 2013-02-15    
# 32 3.10e10 2012-11-14 245 days            2  89 days             90            180              90             2000 metform~ 2013-07-17 2013-02-11 2013-02-22 62756~    360     1 2013-07-17    
# 33 3.10e10 2012-11-14 245 days            2 153 days             90            180              90             2000 metform~ 2013-07-17 2013-04-16 2013-05-03 62756~    360     1 2013-07-17    
# 34 3.05e10 2012-11-23 273 days            4  63 days             30            180              45             2000 metform~ 2013-08-23 2013-01-25 2013-01-29 68382~     30     1 2013-08-23    
# 35 3.05e10 2012-11-23 273 days            4  63 days             30            180              45             2000 metform~ 2013-08-23 2013-01-25 2013-01-29 68382~     60     1 2013-08-23    
# 36 3.05e10 2012-11-23 273 days            4  89 days             30            180              45             2000 metform~ 2013-08-23 2013-02-20 2013-02-26 68382~     30     1 2013-08-23    
# 37 3.05e10 2012-11-23 273 days            4  89 days             30            180              45             2000 metform~ 2013-08-23 2013-02-20 2013-02-26 68382~     60     1 2013-08-23    
# 38 3.05e10 2012-11-23 273 days            4 135 days             30            180              45             2000 metform~ 2013-08-23 2013-04-07 2013-04-09 68382~     60     1 2013-08-23    
# 39 3.05e10 2012-11-23 273 days            4 136 days             30            180              45             2000 metform~ 2013-08-23 2013-04-08 2013-04-09 68382~     30     1 2013-08-23    
# 40 3.05e10 2012-11-23 273 days            4 141 days             90            180              45             2000 metform~ 2013-08-23 2013-04-13 2013-04-23 65862~    180     1 2013-08-23    
# 41 2.91e 9 2013-05-02 273 days            3  47 days             30            210              70             2000 metform~ 2014-01-30 2013-06-18 2013-07-04 00378~    120     1 2014-01-30    
# 42 2.91e 9 2013-05-02 273 days            3  54 days             90            210              70             2000 metform~ 2014-01-30 2013-06-25 2013-07-18 00093~    360     1 2014-01-30    
# 43 2.91e 9 2013-05-02 273 days            3 144 days             90            210              70             2000 metform~ 2014-01-30 2013-09-23 2013-10-10 65862~    360     1 2014-01-30    
# 44 2.81e10 2013-05-07 273 days            4  56 days             30            180              45             2000 metform~ 2014-02-04 2013-07-02 2013-07-12 23155~    120     1 2014-02-04    
# 45 2.81e10 2013-05-07 273 days            4  85 days             30            180              45             2000 metform~ 2014-02-04 2013-07-31 2013-08-09 23155~    120     1 2014-02-04    
# 46 2.81e10 2013-05-07 273 days            4 110 days             30            180              45             2000 metform~ 2014-02-04 2013-08-25 2013-08-30 23155~    120     1 2014-02-04    
# 47 2.81e10 2013-05-07 273 days            4 142 days             90            180              45             2000 metform~ 2014-02-04 2013-09-26 2013-10-04 65862~    180     1 2014-02-04    
# 48 2.59e 9 2013-11-14 224 days            2  42 days             90            180              90             2000 metform~ 2014-06-26 2013-12-26 2013-12-31 00093~    180     1 2014-06-26    
# 49 2.59e 9 2013-11-14 224 days            2 129 days             90            180              90             2000 metform~ 2014-06-26 2014-03-23 2014-03-23 00093~    180     1 2014-06-26    
# 50 3.48e 9 2014-01-30 273 days            2  47 days            100            200             100             2000 metform~ 2014-10-30 2014-03-18 2014-03-31 00093~    400     1 2014-10-30    
# 51 3.48e 9 2014-01-30 273 days            2 130 days            100            200             100             2000 metform~ 2014-10-30 2014-06-09 2014-06-30 00093~    400     1 2014-10-30    
# 52 1.55e 9 2014-02-20 273 days            2  47 days             90            180              90             2000 metform~ 2014-11-20 2014-04-08 2014-04-15 00093~    180     1 2014-11-20    
# 53 1.55e 9 2014-02-20 273 days            2 137 days             90            180              90             2000 metform~ 2014-11-20 2014-07-07 2014-07-07 00093~    180     1 2014-11-20    
# 54 3.25e 9 2014-04-12 273 days            3  46 days             30            210              70             2000 metform~ 2015-01-10 2014-05-28 2014-06-10 53746~    120     1 2015-01-10    
# 55 3.25e 9 2014-04-12 273 days            3  73 days             90            210              70             2000 metform~ 2015-01-10 2014-06-24 2014-07-08 62756~    360     1 2015-01-10    
# 56 3.25e 9 2014-04-12 273 days            3 140 days             90            210              70             2000 metform~ 2015-01-10 2014-08-30 2014-09-16 62756~    360     1 2015-01-10    
# 57 2.04e 9 2014-05-24 273 days            2  47 days            100            200             100             2000 metform~ 2015-02-21 2014-07-10 2014-07-31 65862~    200     1 2015-02-21    
# 58 2.04e 9 2014-05-24 273 days            2 138 days            100            200             100             2000 metform~ 2015-02-21 2014-10-09 2014-10-31 65862~    200     1 2015-02-21    
# 59 2.73e10 2014-08-17 273 days            3  92 days             30            210              70             2000 metform~ 2015-05-17 2014-11-17 2014-11-18 68382~     60     1 2015-05-17    
# 60 2.73e10 2014-08-17 273 days            3  96 days             90            210              70             2000 metform~ 2015-05-17 2014-11-21 2014-11-21 65862~    180     1 2015-05-17    
# 61 2.73e10 2014-08-17 273 days            3 125 days             90            210              70             2000 metform~ 2015-05-17 2014-12-20 2014-12-20 68382~    180     1 2015-05-17    
# 62 8.91e 8 2014-11-15 273 days            2  69 days             90            180              90             2000 metform~ 2015-08-15 2015-01-23 2015-02-12 53746~    360     1 2015-08-15    
# 63 8.91e 8 2014-11-15 273 days            2 159 days             90            180              90             2000 metform~ 2015-08-15 2015-04-23 2015-05-07 53746~    360     1 2015-08-15    
# 64 1.88e 9 2014-11-26 196 days            2  64 days             90            180              90             2000 insulin~ 2015-06-10 2015-01-29 2015-01-31 00093~    180     1 2015-06-10    
# 65 1.88e 9 2014-11-26 196 days            2  79 days             90            180              90             2000 insulin~ 2015-06-10 2015-02-13 2015-02-15 00093~    180     1 2015-06-10    
# # ... with 14 more variables: CONCEPT_NDC_insulin <lgl>, CONCEPT_NDC_insulin_acarbose_miglitol_pramlintide <lgl>, CONCEPT_NDC_metformin <lgl>, CONCEPT_NDC_SU_TZD_etc <lgl>, rowSums_logical <dbl>,
# #   concept_name <chr>, concept_name.toupper <chr>, n <int>, is.combination <lgl>, BrandName <chr>, concept_name.toupper.rm_BrandName <chr>, concept_name.toupper.METFORMIN <chr>,
# #   concept_name.toupper.rm_METFORMIN <chr>, concept_name.toupper.METFORMIN.dose <dbl>




#@ end -------
