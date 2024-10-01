# function.add_months.dev.r


# https://stackoverflow.com/questions/22628863/add-subtract-6-months-bond-time-in-r-using-lubridate
as.Date("2014-12-31") %m+% months(6)
# [1] "2015-06-30"
ceiling_date(as.Date("2014-02-28") %m+% months(6), unit = "month") - days(1)
# [1] "2014-08-31"









tblID_SIDO_full_sgg_sgg2_SIDO_SGG_CD_bar_Stage_plt_inner_join_PM25_inner_join_rmNA01_2018 %>% 
    select(no, SGG_CD_bar, `first visit.x`) %>% 
    mutate(
        t0 = `first visit.x` |> as.character() %>% as.Date(format = "%Y%m%d")
        , t0.floor_month = t0 %>% {lubridate::floor_date(., "month")}
        , tn1m.floor_month = t0.floor_month %m-% months(1) %>% {lubridate::floor_date(., "month")}
        , tn2m.floor_month = t0.floor_month %m-% months(2) %>% {lubridate::floor_date(., "month")}
        , tn3m.floor_month = t0.floor_month %m-% months(3) %>% {lubridate::floor_date(., "month")}
        , tn4m.floor_month = t0.floor_month %m-% months(4) %>% {lubridate::floor_date(., "month")}
        , tn5m.floor_month = t0.floor_month %m-% months(5) %>% {lubridate::floor_date(., "month")}
        , tn6m.floor_month = t0.floor_month %m-% months(6) %>% {lubridate::floor_date(., "month")}
        , tn7m.floor_month = t0.floor_month %m-% months(7) %>% {lubridate::floor_date(., "month")}
        , tn8m.floor_month = t0.floor_month %m-% months(8) %>% {lubridate::floor_date(., "month")}
        , tn9m.floor_month = t0.floor_month %m-% months(9) %>% {lubridate::floor_date(., "month")}
        , tn10m.floor_month = t0.floor_month %m-% months(10) %>% {lubridate::floor_date(., "month")}
        , tn11m.floor_month = t0.floor_month %m-% months(11) %>% {lubridate::floor_date(., "month")}
        , tn12m.floor_month = t0.floor_month %m-% months(12) %>% {lubridate::floor_date(., "month")}
    ) %>% 
    as_tibble #----
# > tblID_SIDO_full_sgg_sgg2_SIDO_SGG_CD_bar_Stage_plt_inner_join_PM25_inner_join_rmNA01_2018 %>% 
# +     select(no, SGG_CD_bar, `first visit.x`) %>% 
# +     mutate(
# +         t0 = `first visit.x` |> as.character() %>% as.Date(format = "%Y%m%d")
# +         , t0.floor_month = t0 %>% {lubridate::floor_date(., "month")}
# +         , tn1m.floor_month = t0.floor_month %m-% months(1) %>% {lubridate::floor_date(., "month")}
# +         , tn2m.floor_month = t0.floor_month %m-% months(2) %>% {lubridate::floor_date(., "month")}
# +         , tn3m.floor_month = t0.floor_month %m-% months(3) %>% {lubridate::floor_date(., "month")}
# +         , tn4m.floor_month = t0.floor_month %m-% months(4) %>% {lubridate::floor_date(., "month")}
# +         , tn5m.floor_month = t0.floor_month %m-% months(5) %>% {lubridate::floor_date(., "month")}
# +         , tn6m.floor_month = t0.floor_month %m-% months(6) %>% {lubridate::floor_date(., "month")}
# +         , tn7m.floor_month = t0.floor_month %m-% months(7) %>% {lubridate::floor_date(., "month")}
# +         , tn8m.floor_month = t0.floor_month %m-% months(8) %>% {lubridate::floor_date(., "month")}
# +         , tn9m.floor_month = t0.floor_month %m-% months(9) %>% {lubridate::floor_date(., "month")}
# +         , tn10m.floor_month = t0.floor_month %m-% months(10) %>% {lubridate::floor_date(., "month")}
# +         , tn11m.floor_month = t0.floor_month %m-% months(11) %>% {lubridate::floor_date(., "month")}
# +         , tn12m.floor_month = t0.floor_month %m-% months(12) %>% {lubridate::floor_date(., "month")}
# +     ) %>% 
# +     as_tibble #----  
# # A tibble: 1,391 x 17
#    no    SGG_CD_bar `first visit.x` t0         t0.floor_month tn1m.floor_month tn2m.floor_month tn3m.floor_month tn4m.floor_month
#    <chr> <chr>                <dbl> <date>     <date>         <date>           <date>           <date>           <date>          
#  1 1166~ 11250             20180502 2018-05-02 2018-05-01     2018-04-01       2018-03-01       2018-02-01       2018-01-01      
#  2 1166~ 11230             20181002 2018-10-02 2018-10-01     2018-09-01       2018-08-01       2018-07-01       2018-06-01      
#  3 1166~ 11250             20180914 2018-09-14 2018-09-01     2018-08-01       2018-07-01       2018-06-01       2018-05-01      
#  4 1166~ 11050             20181104 2018-11-04 2018-11-01     2018-10-01       2018-09-01       2018-08-01       2018-07-01      
#  5 1166~ 11240             20180306 2018-03-06 2018-03-01     2018-02-01       2018-01-01       2017-12-01       2017-11-01      
#  6 1166~ 31051|310~        20181213 2018-12-13 2018-12-01     2018-11-01       2018-10-01       2018-09-01       2018-08-01      
#  7 1166~ 11190             20181014 2018-10-14 2018-10-01     2018-09-01       2018-08-01       2018-07-01       2018-06-01      
#  8 1166~ 11250             20180426 2018-04-26 2018-04-01     2018-03-01       2018-02-01       2018-01-01       2017-12-01      
#  9 1167~ 31180             20180220 2018-02-20 2018-02-01     2018-01-01       2017-12-01       2017-11-01       2017-10-01      
# 10 1167~ 11110             20180423 2018-04-23 2018-04-01     2018-03-01       2018-02-01       2018-01-01       2017-12-01      
# # ... with 1,381 more rows, and 8 more variables: tn5m.floor_month <date>, tn6m.floor_month <date>, tn7m.floor_month <date>,
# #   tn8m.floor_month <date>, tn9m.floor_month <date>, tn10m.floor_month <date>, tn11m.floor_month <date>, tn12m.floor_month <date>






















# @@ END-----  
