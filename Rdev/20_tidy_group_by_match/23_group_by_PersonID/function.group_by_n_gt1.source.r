# function.group_by_n_gt1.source.r
# function.duplicated_original.source.r

#### https://stackoverflow.com/questions/16905425/find-duplicate-values-in-r ====

t0 = Sys.time()
enrolid_mom_duplicated = mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp$enrolid_mom %>% table %>% {which(. > 1)} %>% names
Sys.time() - t0
# > t0 = Sys.time()
# > enrolid_mom_duplicated = mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp$enrolid_mom %>% table %>% {which(. > 1)} %>% names
# > Sys.time() - t0
# Time difference of 10.28465 secs

enrolid_mom_duplicated %>% str
# > enrolid_mom_duplicated %>% str
#  chr [1:92] "239829107" "1093751903" "1106849502" "1127317301" "1178104602" "1235845901" "1250572403" "1334742802" ...


t0 = Sys.time()
mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp %>% 
    filter(enrolid_mom %in% enrolid_mom_duplicated) %>% 
    select(pregid, enrolid_mom, lmp, enddate) %>% arrange(enrolid_mom)
Sys.time() - t0
# > t0 = Sys.time()
# > mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp %>% 
# +     filter(enrolid_mom %in% enrolid_mom_duplicated) %>% 
# +     select(pregid, enrolid_mom, lmp, enddate) %>% arrange(enrolid_mom)
# # A tibble: 184 x 4
# # Groups:   enrolid_mom [92]
#       pregid enrolid_mom lmp        enddate   
#        <dbl>       <dbl> <date>     <date>    
#  1 900010669   239829107 2013-06-26 2014-03-26
#  2 900010668   239829107 2013-06-26 2013-08-21
#  3 900139959  1093751903 2013-01-29 2013-10-29
#  4 900139958  1093751903 2013-01-29 2013-03-26
#  5 900143440  1106849502 2012-02-08 2012-11-07
#  6 900143439  1106849502 2012-02-08 2012-04-04
#  7 900150200  1127317301 2014-05-27 2015-02-24
#  8 900150199  1127317301 2014-05-27 2014-07-22
#  9 900161803  1178104602 2011-01-26 2011-10-26
# 10 900161802  1178104602 2011-01-26 2011-03-23
# # ... with 174 more rows
# > Sys.time() - t0
# Time difference of 1.426264 mins



#### https://grokbase.com/t/r/r-help/129wg7ft4n/r-select-original-and-duplicates ====


t0 = Sys.time()
mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp %>% 
    filter(duplicated(enrolid_mom) | duplicated(enrolid_mom, fromLast = T)) %>% 
    select(pregid, enrolid_mom, lmp, enddate) %>% arrange(enrolid_mom)
Sys.time() - t0
# > t0 = Sys.time()
# > mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp %>% 
# +     filter(duplicated(enrolid_mom) | duplicated(enrolid_mom, fromLast = T)) %>% 
# +     select(pregid, enrolid_mom, lmp, enddate) %>% arrange(enrolid_mom)
# # A tibble: 184 x 4
# # Groups:   enrolid_mom [92]
#       pregid enrolid_mom lmp        enddate   
#        <dbl>       <dbl> <date>     <date>    
#  1 900010669   239829107 2013-06-26 2014-03-26
#  2 900010668   239829107 2013-06-26 2013-08-21
#  3 900139959  1093751903 2013-01-29 2013-10-29
#  4 900139958  1093751903 2013-01-29 2013-03-26
#  5 900143440  1106849502 2012-02-08 2012-11-07
#  6 900143439  1106849502 2012-02-08 2012-04-04
#  7 900150200  1127317301 2014-05-27 2015-02-24
#  8 900150199  1127317301 2014-05-27 2014-07-22
#  9 900161803  1178104602 2011-01-26 2011-10-26
# 10 900161802  1178104602 2011-01-26 2011-03-23
# # ... with 174 more rows
# > Sys.time() - t0
# Time difference of 1.757985 mins



#### group_by() ====

t0 = Sys.time()
mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp %>% 
    group_by(enrolid_mom) %>% 
    summarize(n()) %>% 
    filter(`n()` > 1) %>% 
    left_join(mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp) %>% 
    select(pregid, enrolid_mom, lmp, enddate) %>% arrange(enrolid_mom)
Sys.time() - t0
# > t0 = Sys.time()
# > mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp %>% 
# +     group_by(enrolid_mom) %>% 
# +     summarize(n()) %>% 
# +     filter(`n()` > 1) %>% 
# +     left_join(mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp) %>% 
# +     select(pregid, enrolid_mom, lmp, enddate) %>% arrange(enrolid_mom)
# Joining, by = "enrolid_mom"
# # A tibble: 184 x 4
#       pregid enrolid_mom lmp        enddate   
#        <dbl>       <dbl> <date>     <date>    
#  1 900010669   239829107 2013-06-26 2014-03-26
#  2 900010668   239829107 2013-06-26 2013-08-21
#  3 900139959  1093751903 2013-01-29 2013-10-29
#  4 900139958  1093751903 2013-01-29 2013-03-26
#  5 900143440  1106849502 2012-02-08 2012-11-07
#  6 900143439  1106849502 2012-02-08 2012-04-04
#  7 900150200  1127317301 2014-05-27 2015-02-24
#  8 900150199  1127317301 2014-05-27 2014-07-22
#  9 900161803  1178104602 2011-01-26 2011-10-26
# 10 900161802  1178104602 2011-01-26 2011-03-23
# # ... with 174 more rows
# > Sys.time() - t0
# Time difference of 7.574048 secs





#@ end ----
