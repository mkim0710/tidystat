


ENROLID3169_Age1845_Inc2.ia_Exc12356abcd %>% left_join(d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm)
ENROLID3169_Age1845_Inc2.ia_Exc12356abcd %>% left_join(d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm) %>%
    mutate_at(vars(matches("CONCEPT_NDC")), list(~if_else(., SVCDATE, as.Date(NA)))) %>% 
    filter(SVCDATE >= lmp - 90) %>% 
    filter(SVCDATE <= lmp + 120) %>% 
    group_by(ENROLID) %>% summarise_at(.vars = vars(matches("CONCEPT_NDC")), .funs = list(ndDate = n_distinct, minDate = min, maxDate = max), na.rm = T)
warnings()
# > ENROLID3169_Age1845_Inc2.ia_Exc12356abcd %>% left_join(d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm)
# Joining, by = "ENROLID"
# # A tibble: 43,298 x 69
#    ENROLID Exc1  Exc2  Exc3  Exc4  Exc5  Exc5.i Exc5.ii Exc5.iii Exc6  Exc10 Exc11 Exc12 Exc13 Inc2  Inc2.ia Inc2.ia.1 Inc2.ia.1.a Inc2.ia.1.b Inc2.ia.1.b.1 Inc2.ia.1.b.2
#      <dbl> <lgl> <lgl> <lgl> <lgl> <lgl> <lgl>  <lgl>   <lgl>    <lgl> <lgl> <lgl> <lgl> <lgl> <lgl> <lgl>   <lgl>     <lgl>       <lgl>       <lgl>         <lgl>        
#  1  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
#  2  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
#  3  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
#  4  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
#  5  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
#  6  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
#  7  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
#  8  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
#  9  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
# 10  1.30e8 FALSE FALSE FALSE TRUE  FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
# # ... with 43,288 more rows, and 48 more variables: Inc2.ia.1.c <lgl>, Inc2.ia.2 <lgl>, Inc2.ia.2.a <lgl>, Inc2.ia.2.b <lgl>, Inc2.ia.3 <lgl>, Inc2.ia.3.a <lgl>,
# #   Inc2.ia.3.b <lgl>, Inc2.ia.3.c <lgl>, Inc2.ia.3.d <lgl>, Inc2.ia.4 <lgl>, Inc2.ia.4.a <lgl>, Inc2.ia.4.b <lgl>, Inc2.ia.4.c <lgl>, Inc2.ia.4.c.1 <lgl>,
# #   Inc2.ia.4.c.2 <lgl>, Inc2.ia.4.c.3 <lgl>, Inc2.iib <lgl>, Inc2.iib.1 <lgl>, Inc2.iib.1.a <lgl>, Inc2.iib.1.b <lgl>, Inc2.iib.1.b.1 <lgl>, Inc2.iib.1.b.2 <lgl>,
# #   Inc2.iib.1.c <lgl>, Inc2.iib.2 <lgl>, Inc2.iib.2.a <lgl>, Inc2.iib.2.b <lgl>, Inc2.iib.3 <lgl>, Inc2.iib.3.b <lgl>, Inc2.iib.3.c <lgl>, Inc2.iib.3.d <lgl>, DOBYR <dbl>,
# #   Age_at_lmp <dbl>, Exc12356abcd <lgl>, Study <lgl>, SVCDATE <date>, PDDATE <date>, NDCNUM <chr>, METQTY <dbl>, QTY <dbl>, DAYSUPP <dbl>, lmp <date>,
# #   `max(enddate)` <date>, CONCEPT_NDC_insulin <lgl>, CONCEPT_NDC_insulin_acarbose_miglitol_pramlintide <lgl>, CONCEPT_NDC_metformin <lgl>, CONCEPT_NDC_SU_TZD_etc <lgl>,
# #   rowSums_logical <dbl>, concept_name <chr>
# Warning message:
# Column `ENROLID` has different attributes on LHS and RHS of join 
# > ENROLID3169_Age1845_Inc2.ia_Exc12356abcd %>% left_join(d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm)
# Joining, by = "ENROLID"
# # A tibble: 43,298 x 69
#    ENROLID Exc1  Exc2  Exc3  Exc4  Exc5  Exc5.i Exc5.ii Exc5.iii Exc6  Exc10 Exc11 Exc12 Exc13 Inc2  Inc2.ia Inc2.ia.1 Inc2.ia.1.a Inc2.ia.1.b Inc2.ia.1.b.1 Inc2.ia.1.b.2
#      <dbl> <lgl> <lgl> <lgl> <lgl> <lgl> <lgl>  <lgl>   <lgl>    <lgl> <lgl> <lgl> <lgl> <lgl> <lgl> <lgl>   <lgl>     <lgl>       <lgl>       <lgl>         <lgl>        
#  1  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
#  2  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
#  3  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
#  4  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
#  5  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
#  6  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
#  7  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
#  8  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
#  9  1.03e8 FALSE FALSE FALSE FALSE FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
# 10  1.30e8 FALSE FALSE FALSE TRUE  FALSE FALSE  FALSE   FALSE    FALSE FALSE FALSE FALSE FALSE TRUE  TRUE    TRUE      TRUE        FALSE       FALSE         FALSE        
# # ... with 43,288 more rows, and 48 more variables: Inc2.ia.1.c <lgl>, Inc2.ia.2 <lgl>, Inc2.ia.2.a <lgl>, Inc2.ia.2.b <lgl>, Inc2.ia.3 <lgl>, Inc2.ia.3.a <lgl>,
# #   Inc2.ia.3.b <lgl>, Inc2.ia.3.c <lgl>, Inc2.ia.3.d <lgl>, Inc2.ia.4 <lgl>, Inc2.ia.4.a <lgl>, Inc2.ia.4.b <lgl>, Inc2.ia.4.c <lgl>, Inc2.ia.4.c.1 <lgl>,
# #   Inc2.ia.4.c.2 <lgl>, Inc2.ia.4.c.3 <lgl>, Inc2.iib <lgl>, Inc2.iib.1 <lgl>, Inc2.iib.1.a <lgl>, Inc2.iib.1.b <lgl>, Inc2.iib.1.b.1 <lgl>, Inc2.iib.1.b.2 <lgl>,
# #   Inc2.iib.1.c <lgl>, Inc2.iib.2 <lgl>, Inc2.iib.2.a <lgl>, Inc2.iib.2.b <lgl>, Inc2.iib.3 <lgl>, Inc2.iib.3.b <lgl>, Inc2.iib.3.c <lgl>, Inc2.iib.3.d <lgl>, DOBYR <dbl>,
# #   Age_at_lmp <dbl>, Exc12356abcd <lgl>, Study <lgl>, SVCDATE <date>, PDDATE <date>, NDCNUM <chr>, METQTY <dbl>, QTY <dbl>, DAYSUPP <dbl>, lmp <date>,
# #   `max(enddate)` <date>, CONCEPT_NDC_insulin <lgl>, CONCEPT_NDC_insulin_acarbose_miglitol_pramlintide <lgl>, CONCEPT_NDC_metformin <lgl>, CONCEPT_NDC_SU_TZD_etc <lgl>,
# #   rowSums_logical <dbl>, concept_name <chr>
# Warning message:
# Column `ENROLID` has different attributes on LHS and RHS of join 
# > ENROLID3169_Age1845_Inc2.ia_Exc12356abcd %>% left_join(d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm) %>%
# +     mutate_at(vars(matches("CONCEPT_NDC")), list(~if_else(., SVCDATE, as.Date(NA)))) %>% 
# +     filter(SVCDATE >= lmp - 90) %>% 
# +     filter(SVCDATE <= lmp + 120) %>% 
# +     group_by(ENROLID) %>% summarise_at(.vars = vars(matches("CONCEPT_NDC")), .funs = list(ndDate = n_distinct, minDate = min, maxDate = max), na.rm = T)
# Joining, by = "ENROLID"
# # A tibble: 3,041 x 13
#    ENROLID CONCEPT_NDC_ins~ CONCEPT_NDC_ins~ CONCEPT_NDC_met~ CONCEPT_NDC_SU_~ CONCEPT_NDC_ins~ CONCEPT_NDC_ins~ CONCEPT_NDC_met~ CONCEPT_NDC_SU_~ CONCEPT_NDC_ins~
#      <dbl>            <int>            <int>            <int>            <int> <date>           <date>           <date>           <date>           <date>          
#  1  1.59e7                1                1                5                5 2013-01-14       2013-01-14       2012-08-13       2012-08-13       2013-01-14      
#  2  4.81e7                4                4                1                0 2012-10-15       2012-10-15       2012-10-30       NA               2012-11-27      
#  3  5.55e7                1                1                0                0 2012-01-05       2012-01-05       NA               NA               2012-01-05      
#  4  5.55e7                1                1                0                0 2012-10-19       2012-10-19       NA               NA               2012-10-19      
#  5  1.03e8                1                1                1                0 2011-12-10       2011-12-10       2011-12-10       NA               2011-12-10      
#  6  1.25e8                5                5                2                0 2012-07-05       2012-07-05       2012-04-12       NA               2012-09-05      
#  7  1.25e8                1                1                4                0 2011-09-07       2011-09-07       2011-03-08       NA               2011-09-07      
#  8  1.30e8                2                2                0                0 2011-02-01       2011-02-01       NA               NA               2011-02-08      
#  9  1.38e8                7                7                0                0 2011-03-23       2011-03-23       NA               NA               2011-09-09      
# 10  1.70e8                2                2                0                0 2012-07-10       2012-07-10       NA               NA               2012-10-05      
# # ... with 3,031 more rows, and 3 more variables: CONCEPT_NDC_insulin_acarbose_miglitol_pramlintide_maxDate <date>, CONCEPT_NDC_metformin_maxDate <date>,
# #   CONCEPT_NDC_SU_TZD_etc_maxDate <date>
# There were 50 or more warnings (use warnings() to see the first 50)

# 47: In min.default(structure(NA_real_, class = "Date"), na.rm = TRUE) :
#   no non-missing arguments to min; returning Inf
# 49: In min.default(structure(c(NA_real_, NA_real_, NA_real_ ... :
#   no non-missing arguments to min; returning Inf
# 50: In min.default(structure(c(NA_real_, NA_real_), class = "Date"),  ... :
#   no non-missing arguments to min; returning Inf



ENROLID3169_Age1845_Inc2.ia_Exc12356abcd.exposure %>% map(function(x) tibble(is.Inf = sum(x == Inf, na.rm = T), is.NInf = sum(x == -Inf, na.rm = T), is.na = sum(is.na(x))) ) %>% bind_rows(.id = ".id") %>% print(n = 99) #----
# > ENROLID3169_Age1845_Inc2.ia_Exc12356abcd.exposure %>% map(function(x) tibble(is.Inf = sum(x == Inf, na.rm = T), is.NInf = sum(x == -Inf, na.rm = T), is.na = sum(is.na(x))) ) %>% bind_rows(.id = ".id") %>% print(n = 99) #----
# # A tibble: 67 x 4
#    .id                                                       is.Inf is.NInf is.na
#    <chr>                                                      <int>   <int> <int>
#  1 ENROLID                                                        0       0     0
#  2 Exc1                                                           0       0     0
#  3 Exc2                                                           0       0     0
#  4 Exc3                                                           0       0     0
#  5 Exc4                                                           0       0     0
#  6 Exc5                                                           0       0     0
#  7 Exc5.i                                                         0       0     0
#  8 Exc5.ii                                                        0       0     0
#  9 Exc5.iii                                                       0       0     0
# 10 Exc6                                                           0       0     0
# 11 Exc10                                                          0       0     0
# 12 Exc11                                                          0       0     0
# 13 Exc12                                                          0       0     0
# 14 Exc13                                                          0       0     0
# 15 Inc2                                                           0       0     0
# 16 Inc2.ia                                                        0       0     0
# 17 Inc2.ia.1                                                      0       0     0
# 18 Inc2.ia.1.a                                                    0       0     0
# 19 Inc2.ia.1.b                                                    0       0     0
# 20 Inc2.ia.1.b.1                                                  0       0     0
# 21 Inc2.ia.1.b.2                                                  0       0     0
# 22 Inc2.ia.1.c                                                    0       0     0
# 23 Inc2.ia.2                                                      0       0     0
# 24 Inc2.ia.2.a                                                    0       0     0
# 25 Inc2.ia.2.b                                                    0       0     0
# 26 Inc2.ia.3                                                      0       0     0
# 27 Inc2.ia.3.a                                                    0       0     0
# 28 Inc2.ia.3.b                                                    0       0     0
# 29 Inc2.ia.3.c                                                    0       0     0
# 30 Inc2.ia.3.d                                                    0       0     0
# 31 Inc2.ia.4                                                      0       0     0
# 32 Inc2.ia.4.a                                                    0       0     0
# 33 Inc2.ia.4.b                                                    0       0     0
# 34 Inc2.ia.4.c                                                    0       0     0
# 35 Inc2.ia.4.c.1                                                  0       0     0
# 36 Inc2.ia.4.c.2                                                  0       0     0
# 37 Inc2.ia.4.c.3                                                  0       0     0
# 38 Inc2.iib                                                       0       0     0
# 39 Inc2.iib.1                                                     0       0     0
# 40 Inc2.iib.1.a                                                   0       0     0
# 41 Inc2.iib.1.b                                                   0       0     0
# 42 Inc2.iib.1.b.1                                                 0       0     0
# 43 Inc2.iib.1.b.2                                                 0       0     0
# 44 Inc2.iib.1.c                                                   0       0     0
# 45 Inc2.iib.2                                                     0       0     0
# 46 Inc2.iib.2.a                                                   0       0     0
# 47 Inc2.iib.2.b                                                   0       0     0
# 48 Inc2.iib.3                                                     0       0     0
# 49 Inc2.iib.3.b                                                   0       0     0
# 50 Inc2.iib.3.c                                                   0       0     0
# 51 Inc2.iib.3.d                                                   0       0     0
# 52 DOBYR                                                          0       0     0
# 53 Age_at_lmp                                                     0       0     0
# 54 Exc12356abcd                                                   0       0     0
# 55 Study                                                          0       0     0
# 56 CONCEPT_NDC_insulin_ndDate                                     0       0   128
# 57 CONCEPT_NDC_insulin_acarbose_miglitol_pramlintide_ndDate       0       0   128
# 58 CONCEPT_NDC_metformin_ndDate                                   0       0   128
# 59 CONCEPT_NDC_SU_TZD_etc_ndDate                                  0       0   128
# 60 CONCEPT_NDC_insulin_minDate                                  195       0   128
# 61 CONCEPT_NDC_insulin_acarbose_miglitol_pramlintide_minDate    195       0   128
# 62 CONCEPT_NDC_metformin_minDate                               1312       0   128
# 63 CONCEPT_NDC_SU_TZD_etc_minDate                              1965       0   128
# 64 CONCEPT_NDC_insulin_maxDate                                    0     195   128
# 65 CONCEPT_NDC_insulin_acarbose_miglitol_pramlintide_maxDate      0     195   128
# 66 CONCEPT_NDC_metformin_maxDate                                  0    1312   128
# 67 CONCEPT_NDC_SU_TZD_etc_maxDate                                 0    1965   128



# https://stackoverflow.com/questions/24282550/no-non-missing-arguments-warning-when-using-min-or-max-in-reshape2 -----
as.Date(Inf)
as.Date(-Inf)
# > as.Date(Inf)
# Error in as.Date.numeric(Inf) : 'origin' must be supplied
# > as.Date(-Inf)
# Error in as.Date.numeric(-Inf) : 'origin' must be supplied


structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% dput
structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")
structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% summary #----
structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% {if_else(. == Inf, as.Date(NA), as.Date(.))} %>% summary #----
structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% {if_else(. == Inf | . == -Inf, as.Date(NA), as.Date(.))} %>% summary #----
structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% {ifelse(. == Inf | . == -Inf, as.Date(NA), as.Date(.))} %>% summary #----
structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% {ifelse(. == Inf | . == -Inf, (NA), (.))} %>% summary #----
# > structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% dput
# structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")
# > structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")
# [1] "2011-12-10" NA           NA           NA           "2011-02-28"
# > structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% summary #----
#         Min.      1st Qu.       Median         Mean      3rd Qu.         Max.         NA's 
#           NA           NA "2011-07-20"           NA           NA           NA          "1" 
# > structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% {if_else(. == Inf, as.Date(NA), as.Date(.))} %>% summary #----
#         Min.      1st Qu.       Median         Mean      3rd Qu.         Max.         NA's 
#           NA           NA "2011-02-28"           NA "2011-07-20" "2011-12-10"          "2" 
# > structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% {if_else(. == Inf | . == -Inf, as.Date(NA), as.Date(.))} %>% summary #----
#         Min.      1st Qu.       Median         Mean      3rd Qu.         Max.         NA's 
# "2011-02-28" "2011-05-10" "2011-07-20" "2011-07-20" "2011-09-29" "2011-12-10"          "3" 
# > structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% {ifelse(. == Inf | . == -Inf, as.Date(NA), as.Date(.))} %>% summary #----
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#   15033   15104   15176   15176   15247   15318       3 
# > structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% {ifelse(. == Inf | . == -Inf, (NA), (.))} %>% summary #----
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#   15033   15104   15176   15176   15247   15318       3 

data.frame(value = structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")) %>% map_df(function(x) if_else(x == (Inf) | x == (-Inf), as.Date(NA), as.Date(x))) %>% summary #-----
data.frame(value = structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")) %>% map_df(function(x) if_else(x == as.Date(Inf) | x == as.Date(-Inf), as.Date(NA), as.Date(x))) %>% summary #-----
data.frame(value = structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")) %>% map_df(function(x) if_else(as.numeric(x) == (Inf) | as.numeric(x) == (-Inf), as.Date(NA), as.Date(x))) %>% summary #-----
# > data.frame(value = structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")) %>% map_df(function(x) if_else(x == (Inf) | x == (-Inf), as.Date(NA), as.Date(x))) %>% summary #-----
#      value           
#  Min.   :2011-02-28  
#  1st Qu.:2011-05-10  
#  Median :2011-07-20  
#  Mean   :2011-07-20  
#  3rd Qu.:2011-09-29  
#  Max.   :2011-12-10  
#  NA's   :3           
# > data.frame(value = structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")) %>% map_df(function(x) if_else(x == as.Date(Inf) | x == as.Date(-Inf), as.Date(NA), as.Date(x))) %>% summary #-----
# Error in as.Date.numeric(Inf) : 'origin' must be supplied
# Called from: as.Date.numeric(Inf)
# > data.frame(value = structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")) %>% map_df(function(x) if_else(as.numeric(x) == (Inf) | as.numeric(x) == (-Inf), as.Date(NA), as.Date(x))) %>% summary #-----
#      value           
#  Min.   :2011-02-28  
#  1st Qu.:2011-05-10  
#  Median :2011-07-20  
#  Mean   :2011-07-20  
#  3rd Qu.:2011-09-29  
#  Max.   :2011-12-10  
#  NA's   :3        



                                                                                         
                                                                                         


#@ ENROLID3169_Age1845_Inc2.ia_Exc12356abcd.exposure ====
# ENROLID3169_Age1845_Inc2.ia_Exc12356abcd.exposure = 
#     ENROLID3169_Age1845_Inc2.ia_Exc12356abcd %>% left_join(
#         ENROLID3169_Age1845_Inc2.ia_Exc12356abcd %>% left_join(d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm) %>%
#             mutate_at(vars(matches("CONCEPT_NDC")), list(~if_else(., SVCDATE, as.Date(NA)))) %>% 
#             filter(SVCDATE >= lmp - 90) %>% 
#             filter(SVCDATE <= lmp + 120) %>% 
#             group_by(ENROLID) %>% summarise_at(.vars = vars(matches("CONCEPT_NDC")), .funs = list(ndDate = n_distinct, minDate = min, maxDate = max), na.rm = T)
#     ) %>% 
#     map_df(function(x) if(class(x) == "Date") if_else(x == Inf | x == -Inf, as.Date(NA), as.Date(x)) else x) 
ENROLID3169_Age1845_Inc2.ia_Exc12356abcd.exposure = 
    ENROLID3169_Age1845_Inc2.ia_Exc12356abcd %>% left_join(
        ENROLID3169_Age1845_Inc2.ia_Exc12356abcd %>% left_join(d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm) %>%
            mutate_at(vars(matches("CONCEPT_NDC")), function(vec) if_else(vec, SVCDATE, as.Date(NA)) ) %>% 
            filter(SVCDATE >= lmp - 90) %>% 
            filter(SVCDATE <= lmp + 120) %>% 
            group_by(ENROLID) %>% summarise_at(.vars = vars(matches("CONCEPT_NDC")), .funs = list(ndDate = n_distinct, minDate = min, maxDate = max), na.rm = T)
    ) %>% 
    map_df(function(x) if(class(x) == "Date") if_else(x == Inf | x == -Inf, as.Date(NA), as.Date(x)) else x) 
warnings()
# > ENROLID3169_Age1845_Inc2.ia_Exc12356abcd.exposure = 
# +     ENROLID3169_Age1845_Inc2.ia_Exc12356abcd %>% left_join(
# +         ENROLID3169_Age1845_Inc2.ia_Exc12356abcd %>% left_join(d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm) %>%
# +             mutate_at(vars(matches("CONCEPT_NDC")), list(~if_else(., SVCDATE, as.Date(NA)))) %>% 
# +             filter(SVCDATE >= lmp - 90) %>% 
# +             filter(SVCDATE <= lmp + 120) %>% 
# +             group_by(ENROLID) %>% summarise_at(.vars = vars(matches("CONCEPT_NDC")), .funs = list(ndDate = n_distinct, minDate = min, maxDate = max), na.rm = T)
# +     )
# Joining, by = "ENROLID"
# Joining, by = "ENROLID"
# There were 50 or more warnings (use warnings() to see the first 50)

# 47: In min.default(structure(NA_real_, class = "Date"), na.rm = TRUE) :
#   no non-missing arguments to min; returning Inf
# 49: In min.default(structure(c(NA_real_, NA_real_, NA_real_ ... :
#   no non-missing arguments to min; returning Inf
# 50: In min.default(structure(c(NA_real_, NA_real_), class = "Date"),  ... :
#   no non-missing arguments to min; returning Inf



#@ end -----


