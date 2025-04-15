# function.filter.PrimaryKey_duplicated.dev.r
# function.group_by_n_gt1.dev.r
# function.duplicated_original.dev.r

######### NEED MORE WORK~!
# https://github.com/mkim0710/tidystat/blob/master/Rdev/20_tidy_group_by_match/23_group_by_PersonID/function.filter.PrimaryKey_duplicated.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/11_metadata/fun.data.primarykey.dev.r


# d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm.metformin2000 from .r ----  
tmp.df %>% mutate(concept_name.toupper.rm_METFORMIN = concept_name.toupper.rm_BrandName) %>% separate_rows(concept_name.toupper.rm_METFORMIN, sep = "/") %>% 
    mutate(PrimaryKey = concept_name.toupper) %>% 
    {{. %>% group_by(PrimaryKey) %>% summarize(n()) %>% dplyr::filter(`n()` > 1)} %>% left_join(.)}
tmp.df %>% mutate(concept_name.toupper.rm_METFORMIN = concept_name.toupper.rm_BrandName) %>% separate_rows(concept_name.toupper.rm_METFORMIN, sep = "/") %>% 
    mutate(PrimaryKey = concept_name.toupper) %>% 
    {~function(df) {df %>% group_by(PrimaryKey) %>% summarize(n()) %>% dplyr::filter(`n()` > 1)} %>% left_join(df)}
tmp.df %>% mutate(concept_name.toupper.rm_METFORMIN = concept_name.toupper.rm_BrandName) %>% separate_rows(concept_name.toupper.rm_METFORMIN, sep = "/") %>% 
    mutate(PrimaryKey = concept_name.toupper) %>% 
    left_join(
        dplyr::filter(
            summarize( 
                group_by(., PrimaryKey), n()
            ), `n()` > 1)
        , .)
tmp.df %>% mutate(concept_name.toupper.rm_METFORMIN = concept_name.toupper.rm_BrandName) %>% separate_rows(concept_name.toupper.rm_METFORMIN, sep = "/") %>% 
    mutate(PrimaryKey = concept_name.toupper) %>% 
    left_join(dplyr::filter(summarize(group_by(., PrimaryKey), n()), `n()` > 1), .)
# > tmp.df %>% mutate(concept_name.toupper.rm_METFORMIN = concept_name.toupper.rm_BrandName) %>% separate_rows(concept_name.toupper.rm_METFORMIN, sep = "/") %>% 
# +     mutate(PrimaryKey = concept_name.toupper) %>% 
# +     {{. %>% group_by(PrimaryKey) %>% summarize(n()) %>% dplyr::filter(`n()` > 1)} %>% left_join(.)}
# Error in UseMethod("left_join") : 
#   no applicable method for 'left_join' applied to an .object of class "c('fseq', 'function')"
# > tmp.df %>% mutate(concept_name.toupper.rm_METFORMIN = concept_name.toupper.rm_BrandName) %>% separate_rows(concept_name.toupper.rm_METFORMIN, sep = "/") %>% 
# +     mutate(PrimaryKey = concept_name.toupper) %>% 
# +     {~function(df) {df %>% group_by(PrimaryKey) %>% summarize(n()) %>% dplyr::filter(`n()` > 1)} %>% left_join(df)}
# ~function(df) {
#     df %>% group_by(PrimaryKey) %>% summarize(n()) %>% dplyr::filter(`n()` > 
#         1)
# } %>% left_join(df)
# <environment: 0x0000012d08dbc528>
# > tmp.df %>% mutate(concept_name.toupper.rm_METFORMIN = concept_name.toupper.rm_BrandName) %>% separate_rows(concept_name.toupper.rm_METFORMIN, sep = "/") %>% 
# +     mutate(PrimaryKey = concept_name.toupper) %>% 
# +     left_join(
# +         dplyr::filter(
# +             summarize( 
# +                 group_by(., PrimaryKey), n()
# +             ), `n()` > 1)
# +         , .)
# Joining, by = "PrimaryKey"
# # A tibble: 66 x 9
#    PrimaryKey           `n()` concept_name.toupper           n is.combination BrandName concept_name.toupper.rm_~ concept_name.toupper~ concept_name.toupper~
#    <fct>                <int> <fct>                      <int> <lgl>          <chr>     <chr>                     <chr>                 <chr>                
#  1 24 HR DAPAGLIFLOZIN~     2 24 HR DAPAGLIFLOZIN 10 MG~     1 TRUE           [XIGDUO]  "24 HR DAPAGLIFLOZIN 10 ~ " METFORMIN HYDROCHL~ "24 HR DAPAGLIFLOZIN~
#  2 24 HR DAPAGLIFLOZIN~     2 24 HR DAPAGLIFLOZIN 10 MG~     1 TRUE           [XIGDUO]  "24 HR DAPAGLIFLOZIN 10 ~ " METFORMIN HYDROCHL~ " METFORMIN HYDROCHL~
#  3 24 HR METFORMIN HYD~     2 24 HR METFORMIN HYDROCHLO~    36 TRUE           NA        24 HR METFORMIN HYDROCHL~ "24 HR METFORMIN HYD~ "24 HR METFORMIN HYD~
#  4 24 HR METFORMIN HYD~     2 24 HR METFORMIN HYDROCHLO~    36 TRUE           NA        24 HR METFORMIN HYDROCHL~ "24 HR METFORMIN HYD~ " PIOGLITAZONE 15 MG~
#  5 24 HR METFORMIN HYD~     2 24 HR METFORMIN HYDROCHLO~   302 TRUE           [KOMBIGL~ "24 HR METFORMIN HYDROCH~ "24 HR METFORMIN HYD~ "24 HR METFORMIN HYD~
#  6 24 HR METFORMIN HYD~     2 24 HR METFORMIN HYDROCHLO~   302 TRUE           [KOMBIGL~ "24 HR METFORMIN HYDROCH~ "24 HR METFORMIN HYD~ " SAXAGLIPTIN 2.5 MG~
#  7 24 HR METFORMIN HYD~     2 24 HR METFORMIN HYDROCHLO~   197 TRUE           [KOMBIGL~ "24 HR METFORMIN HYDROCH~ "24 HR METFORMIN HYD~ "24 HR METFORMIN HYD~
#  8 24 HR METFORMIN HYD~     2 24 HR METFORMIN HYDROCHLO~   197 TRUE           [KOMBIGL~ "24 HR METFORMIN HYDROCH~ "24 HR METFORMIN HYD~ " SAXAGLIPTIN 5 MG E~
#  9 24 HR METFORMIN HYD~     2 24 HR METFORMIN HYDROCHLO~    78 TRUE           [JANUMET] "24 HR METFORMIN HYDROCH~ "24 HR METFORMIN HYD~ "24 HR METFORMIN HYD~
# 10 24 HR METFORMIN HYD~     2 24 HR METFORMIN HYDROCHLO~    78 TRUE           [JANUMET] "24 HR METFORMIN HYDROCH~ "24 HR METFORMIN HYD~ " SITAGLIPTIN 100 MG~
# # ... with 56 more rows






















#### https://stackoverflow.com/questions/16905425/find-duplicate-values-in-r ====  

.t0 = Sys.time()
enrolid_mom_duplicated = mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp$enrolid_mom |> table() %>% {which(. > 1)} |> names()
Sys.time() - .t0
# > .t0 = Sys.time()
# > enrolid_mom_duplicated = mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp$enrolid_mom |> table() %>% {which(. > 1)} |> names()
# > Sys.time() - .t0
# Time difference of 10.28465 secs

enrolid_mom_duplicated |> str(max.level = 2, give.attr = TRUE)
# > enrolid_mom_duplicated |> str(max.level = 2, give.attr = TRUE)
#  chr [1:92] "239829107" "1093751903" "1106849502" "1127317301" "1178104602" "1235845901" "1250572403" "1334742802" ...


.t0 = Sys.time()
mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp %>% 
    dplyr::filter(enrolid_mom %in% enrolid_mom_duplicated) %>% 
    select(pregid, enrolid_mom, lmp, enddate) %>% arrange(enrolid_mom)
Sys.time() - .t0
# > .t0 = Sys.time()
# > mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp %>% 
# +     dplyr::filter(enrolid_mom %in% enrolid_mom_duplicated) %>% 
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
# > Sys.time() - .t0
# Time difference of 1.426264 mins



#### https://grokbase.com/t/r/r-help/129wg7ft4n/r-select-original-and-duplicates ====  


.t0 = Sys.time()
mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp %>% 
    dplyr::filter(duplicated(enrolid_mom) | duplicated(enrolid_mom, fromLast = T)) %>% 
    select(pregid, enrolid_mom, lmp, enddate) %>% arrange(enrolid_mom)
Sys.time() - .t0
# > .t0 = Sys.time()
# > mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp %>% 
# +     dplyr::filter(duplicated(enrolid_mom) | duplicated(enrolid_mom, fromLast = T)) %>% 
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
# > Sys.time() - .t0
# Time difference of 1.757985 mins



#### group_by() ====  

.t0 = Sys.time()
mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp %>% 
    group_by(enrolid_mom) %>% 
    summarize(n()) %>% 
    dplyr::filter(`n()` > 1) %>% 
    left_join(mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp) %>% 
    select(pregid, enrolid_mom, lmp, enddate) %>% arrange(enrolid_mom)
Sys.time() - .t0
# > .t0 = Sys.time()
# > mscan_pregcohort_r4.sas7bdat.byID_min_rank_lmp %>% 
# +     group_by(enrolid_mom) %>% 
# +     summarize(n()) %>% 
# +     dplyr::filter(`n()` > 1) %>% 
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
# > Sys.time() - .t0
# Time difference of 7.574048 secs



  
  
# __________|------  
# ⸿ END----  
