# data.byID_filter_min_rank.source.r
# mscan_pregcohort_r4.sas7bdat.01sample) first pregid for each ENROLID.r


?top_n
?min_rank
top_n
# > top_n
# function (x, n, wt) 
# {
#     wt <- enquo(wt)
#     if (quo_is_missing(wt)) {
#         vars <- tbl_vars(x)
#         wt_name <- vars[length(vars)]
#         inform(glue("Selecting by ", wt_name))
#         wt <- sym(wt_name)
#     }
#     if (!is_scalar_integerish(n)) {
#         abort("`n` must be a scalar integer")
#     }
#     if (n > 0) {
#         quo <- quo(filter(x, min_rank(desc(!!wt)) <= !!n))
#     }
#     else {
#         quo <- quo(filter(x, min_rank(!!wt) <= !!abs(n)))
#     }
#     eval_tidy(quo)
# }
# <bytecode: 0x00000000036b7e88>
# <environment: namespace:dplyr>

?top_n

mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
    {f = function(df) df %>% group_by(ENROLID) %>% summarize(lmp = min(lmp)) %>% left_join(df); f(.)}
mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
    group_by(ENROLID) %>% filter(lmp == min(lmp)) #----
mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
    group_by(ENROLID) %>% filter(lmp == min(lmp)) #----
mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
    group_by(ENROLID) %>% filter(min_rank(lmp) == 1) #----
mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
    group_by(ENROLID) %>% top_n(1, lmp) #----
mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
    group_by(ENROLID) %>% top_n(-1, lmp) #----
mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
    group_by(ENROLID) %>% top_n(-2, lmp) #----
mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
    group_by(ENROLID) %>% filter(min_rank(lmp) <= 2) #----
mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
    group_by(ENROLID) %>% filter(min_rank(lmp) == 2) #----
mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
    group_by(ENROLID) %>% filter(min_rank(lmp) > 2) #----
# > mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
# +     {f = function(df) df %>% group_by(ENROLID) %>% summarize(lmp = min(lmp)) %>% left_join(df); f(.)}
# Joining, by = c("ENROLID", "lmp")
# # A tibble: 23,539 x 4
#     ENROLID lmp           pregid enddate   
#       <dbl> <date>         <dbl> <date>    
#  1  9591603 2012-04-06 900000020 2012-06-01
#  2 15621604 2010-08-19 900000311 2011-05-19
#  3 15913306 2012-10-29 900000354 2013-07-29
#  4 28422903 2010-08-15 900000594 2011-05-15
#  5 28927605 2013-12-27 900000643 2014-09-26
#  6 29827603 2014-05-03 900000796 2014-06-28
#  7 29954103 2015-07-10 900000822 2015-09-04
#  8 30316505 2013-11-15 900000874 2014-08-15
#  9 32110003 2011-03-10 900001196 2011-12-08
# 10 32504704 2012-02-12 900001261 2012-11-11
# # ... with 23,529 more rows
# > mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
# +     group_by(ENROLID) %>% filter(lmp == min(lmp)) #----
# # A tibble: 23,539 x 4
# # Groups:   ENROLID [23,538]
#       pregid  ENROLID lmp        enddate   
#        <dbl>    <dbl> <date>     <date>    
#  1 900000020  9591603 2012-04-06 2012-06-01
#  2 900000311 15621604 2010-08-19 2011-05-19
#  3 900000354 15913306 2012-10-29 2013-07-29
#  4 900000594 28422903 2010-08-15 2011-05-15
#  5 900000643 28927605 2013-12-27 2014-09-26
#  6 900000796 29827603 2014-05-03 2014-06-28
#  7 900000822 29954103 2015-07-10 2015-09-04
#  8 900000874 30316505 2013-11-15 2014-08-15
#  9 900001196 32110003 2011-03-10 2011-12-08
# 10 900001261 32504704 2012-02-12 2012-11-11
# # ... with 23,529 more rows
# > mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
# +     group_by(ENROLID) %>% filter(lmp == min(lmp)) #----
# # A tibble: 23,539 x 4
# # Groups:   ENROLID [23,538]
#       pregid  ENROLID lmp        enddate   
#        <dbl>    <dbl> <date>     <date>    
#  1 900000020  9591603 2012-04-06 2012-06-01
#  2 900000311 15621604 2010-08-19 2011-05-19
#  3 900000354 15913306 2012-10-29 2013-07-29
#  4 900000594 28422903 2010-08-15 2011-05-15
#  5 900000643 28927605 2013-12-27 2014-09-26
#  6 900000796 29827603 2014-05-03 2014-06-28
#  7 900000822 29954103 2015-07-10 2015-09-04
#  8 900000874 30316505 2013-11-15 2014-08-15
#  9 900001196 32110003 2011-03-10 2011-12-08
# 10 900001261 32504704 2012-02-12 2012-11-11
# # ... with 23,529 more rows
# > mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
# +     group_by(ENROLID) %>% filter(min_rank(lmp) == 1) #----
# # A tibble: 23,539 x 4
# # Groups:   ENROLID [23,538]
#       pregid  ENROLID lmp        enddate   
#        <dbl>    <dbl> <date>     <date>    
#  1 900000020  9591603 2012-04-06 2012-06-01
#  2 900000311 15621604 2010-08-19 2011-05-19
#  3 900000354 15913306 2012-10-29 2013-07-29
#  4 900000594 28422903 2010-08-15 2011-05-15
#  5 900000643 28927605 2013-12-27 2014-09-26
#  6 900000796 29827603 2014-05-03 2014-06-28
#  7 900000822 29954103 2015-07-10 2015-09-04
#  8 900000874 30316505 2013-11-15 2014-08-15
#  9 900001196 32110003 2011-03-10 2011-12-08
# 10 900001261 32504704 2012-02-12 2012-11-11
# # ... with 23,529 more rows
# > mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
# +     group_by(ENROLID) %>% top_n(1, lmp) #----
# # A tibble: 23,538 x 4
# # Groups:   ENROLID [23,538]
#       pregid  ENROLID lmp        enddate   
#        <dbl>    <dbl> <date>     <date>    
#  1 900000021  9591603 2012-12-07 2013-09-06
#  2 900000312 15621604 2012-05-27 2013-02-24
#  3 900000354 15913306 2012-10-29 2013-07-29
#  4 900000594 28422903 2010-08-15 2011-05-15
#  5 900000643 28927605 2013-12-27 2014-09-26
#  6 900000796 29827603 2014-05-03 2014-06-28
#  7 900000822 29954103 2015-07-10 2015-09-04
#  8 900000874 30316505 2013-11-15 2014-08-15
#  9 900001196 32110003 2011-03-10 2011-12-08
# 10 900001261 32504704 2012-02-12 2012-11-11
# # ... with 23,528 more rows
# > mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
# +     group_by(ENROLID) %>% top_n(-1, lmp) #----
# # A tibble: 23,539 x 4
# # Groups:   ENROLID [23,538]
#       pregid  ENROLID lmp        enddate   
#        <dbl>    <dbl> <date>     <date>    
#  1 900000020  9591603 2012-04-06 2012-06-01
#  2 900000311 15621604 2010-08-19 2011-05-19
#  3 900000354 15913306 2012-10-29 2013-07-29
#  4 900000594 28422903 2010-08-15 2011-05-15
#  5 900000643 28927605 2013-12-27 2014-09-26
#  6 900000796 29827603 2014-05-03 2014-06-28
#  7 900000822 29954103 2015-07-10 2015-09-04
#  8 900000874 30316505 2013-11-15 2014-08-15
#  9 900001196 32110003 2011-03-10 2011-12-08
# 10 900001261 32504704 2012-02-12 2012-11-11
# # ... with 23,529 more rows
# > mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
# +     group_by(ENROLID) %>% top_n(-2, lmp) #----
# # A tibble: 26,920 x 4
# # Groups:   ENROLID [23,538]
#       pregid  ENROLID lmp        enddate   
#        <dbl>    <dbl> <date>     <date>    
#  1 900000020  9591603 2012-04-06 2012-06-01
#  2 900000021  9591603 2012-12-07 2013-09-06
#  3 900000311 15621604 2010-08-19 2011-05-19
#  4 900000312 15621604 2012-05-27 2013-02-24
#  5 900000354 15913306 2012-10-29 2013-07-29
#  6 900000594 28422903 2010-08-15 2011-05-15
#  7 900000643 28927605 2013-12-27 2014-09-26
#  8 900000796 29827603 2014-05-03 2014-06-28
#  9 900000822 29954103 2015-07-10 2015-09-04
# 10 900000874 30316505 2013-11-15 2014-08-15
# # ... with 26,910 more rows
# > mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
# +     group_by(ENROLID) %>% filter(min_rank(lmp) <= 2) #----
# # A tibble: 26,920 x 4
# # Groups:   ENROLID [23,538]
#       pregid  ENROLID lmp        enddate   
#        <dbl>    <dbl> <date>     <date>    
#  1 900000020  9591603 2012-04-06 2012-06-01
#  2 900000021  9591603 2012-12-07 2013-09-06
#  3 900000311 15621604 2010-08-19 2011-05-19
#  4 900000312 15621604 2012-05-27 2013-02-24
#  5 900000354 15913306 2012-10-29 2013-07-29
#  6 900000594 28422903 2010-08-15 2011-05-15
#  7 900000643 28927605 2013-12-27 2014-09-26
#  8 900000796 29827603 2014-05-03 2014-06-28
#  9 900000822 29954103 2015-07-10 2015-09-04
# 10 900000874 30316505 2013-11-15 2014-08-15
# # ... with 26,910 more rows
# > mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
# +     group_by(ENROLID) %>% filter(min_rank(lmp) == 2) #----
# # A tibble: 3,381 x 4
# # Groups:   ENROLID [3,381]
#       pregid   ENROLID lmp        enddate   
#        <dbl>     <dbl> <date>     <date>    
#  1 900000021   9591603 2012-12-07 2013-09-06
#  2 900000312  15621604 2012-05-27 2013-02-24
#  3 900001704  51948702 2013-04-16 2014-01-14
#  4 900001979  56588501 2011-12-08 2012-09-06
#  5 900002150  97750005 2012-03-21 2012-12-19
#  6 900003782 128158105 2012-06-01 2013-03-01
#  7 900003973 129968710 2013-02-18 2013-11-18
#  8 900004053 130255403 2014-06-17 2015-03-17
#  9 900004161 131286703 2014-11-26 2015-08-26
# 10 900004483 133326201 2014-08-28 2015-05-28
# # ... with 3,371 more rows
# > mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
# +     group_by(ENROLID) %>% filter(min_rank(lmp) > 2) #----
# # A tibble: 515 x 4
# # Groups:   ENROLID [441]
#       pregid   ENROLID lmp        enddate   
#        <dbl>     <dbl> <date>     <date>    
#  1 900014670 306446301 2013-08-28 2014-04-23
#  2 900018418 370780704 2014-08-29 2015-05-29
#  3 900018589 371653102 2013-08-30 2013-10-25
#  4 900018590 371653102 2014-01-28 2014-03-25
#  5 900018591 371653102 2014-02-26 2014-11-26
#  6 900022720 503249201 2013-05-21 2014-02-18
#  7 900022793 503326902 2013-12-15 2014-09-14
#  8 900026023 526924002 2015-04-21 2015-06-16
#  9 900040431 652735001 2013-11-11 2014-08-11
# 10 900055830 707055203 2012-09-28 2013-05-31
# # ... with 505 more rows



all.equal(
    mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
        group_by(ENROLID) %>% filter(min_rank(lmp) == 1)  #----
    , mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
        group_by(ENROLID) %>% top_n(-1, lmp)  #----
)
setdiff(
    mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
        group_by(ENROLID) %>% filter(min_rank(lmp) == 1) %>% {.$pregid} #----
    , mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
        group_by(ENROLID) %>% top_n(-1, lmp) %>% {.$pregid} #----
)
# > all.equal(
# +     mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
# +         group_by(ENROLID) %>% filter(min_rank(lmp) == 1)  #----
# +     , mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
# +         group_by(ENROLID) %>% top_n(-1, lmp)  #----
# + )
# [1] TRUE
# > setdiff(
# +     mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
# +         group_by(ENROLID) %>% filter(min_rank(lmp) == 1) %>% {.$pregid} #----
# +     , mscan_pregcohort_r4.sas7bdat.01sample %>% select(pregid, enrolid_mom, lmp, enddate) %>% rename(ENROLID = enrolid_mom) %>%  ## for each pregid: enrolid_mom, lmp, enddate -> join claims via ENROLID
# +         group_by(ENROLID) %>% top_n(-1, lmp) %>% {.$pregid} #----
# + )
# numeric(0)





#@ end -----
