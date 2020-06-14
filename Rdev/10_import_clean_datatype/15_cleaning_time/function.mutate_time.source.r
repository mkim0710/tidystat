# function.mutate_time.source.r



tblID_SIDO_full_sgg_sgg2_SIDO_SGG_CD_bar_Stage_plt_inner_join_PM25_inner_join_rmNA01_2018 %>% 
    select(`first visit.x`) %>% 
    mutate(
        t0 = `first visit.x` %>% as.character %>% as.Date(format = "%Y%m%d")
        , t0.year = lubridate::year(t0)
        , t0.month = lubridate::month(t0)
        , t0.yday = lubridate::yday(t0)
        , t0.mday = lubridate::mday(t0)
        , t0.wday = lubridate::wday(t0)
        , t0.floor_date = lubridate::floor_date(t0)
    ) %>% 
    as.tibble #----
# > tblID_SIDO_full_sgg_sgg2_SIDO_SGG_CD_bar_Stage_plt_inner_join_PM25_inner_join_rmNA01_2018 %>% 
# +     select(`first visit.x`) %>% 
# +     mutate(
# +         t0 = `first visit.x` %>% as.character %>% as.Date(format = "%Y%m%d")
# +         , t0.year = lubridate::year(t0)
# +         , t0.month = lubridate::month(t0)
# +         , t0.yday = lubridate::yday(t0)
# +         , t0.mday = lubridate::mday(t0)
# +         , t0.wday = lubridate::wday(t0)
# +         , t0.floor_date = lubridate::floor_date(t0)
# +     ) %>% 
# +     as.tibble #----
# # A tibble: 1,391 x 8
#    `first visit.x` t0         t0.year t0.month t0.yday t0.mday t0.wday t0.floor_date      
#              <dbl> <date>       <dbl>    <dbl>   <dbl>   <int>   <dbl> <dttm>             
#  1        20180502 2018-05-02    2018        5     122       2       4 2018-05-02 00:00:00
#  2        20181002 2018-10-02    2018       10     275       2       3 2018-10-02 00:00:00
#  3        20180914 2018-09-14    2018        9     257      14       6 2018-09-14 00:00:00
#  4        20181104 2018-11-04    2018       11     308       4       1 2018-11-04 00:00:00
#  5        20180306 2018-03-06    2018        3      65       6       3 2018-03-06 00:00:00
#  6        20181213 2018-12-13    2018       12     347      13       5 2018-12-13 00:00:00
#  7        20181014 2018-10-14    2018       10     287      14       1 2018-10-14 00:00:00
#  8        20180426 2018-04-26    2018        4     116      26       5 2018-04-26 00:00:00
#  9        20180220 2018-02-20    2018        2      51      20       3 2018-02-20 00:00:00
# 10        20180423 2018-04-23    2018        4     113      23       2 2018-04-23 00:00:00
# # ... with 1,381 more rows









#@ end ----
