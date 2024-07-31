# function.time_since_t0.dev.r



#@ -----  
ID_Eligible_Exposure.TargetTrial2v38.2.113vs200.Outcome.Covariates.DDD.A1c %>% select(matches("Window4Exposure"))
ID_Eligible_Exposure.TargetTrial2v38.2.113vs200.Outcome.Covariates.DDD.A1c %>% select(lmp, matches("Window4Exposure")) %>% 
     mutate_if(function(x) lubridate::is.Date(x), function(x) {as.numeric(x - .$lmp)})  #----
# > ID_Eligible_Exposure.TargetTrial2v38.2.113vs200.Outcome.Covariates.DDD.A1c %>% select(matches("Window4Exposure"))
# # A tibble: 313 x 9
#    Window4Exposure.R~ Window4Exposure.Rx~ Window4Exposure.R~ Window4Exposure.R~ Window4Exposure.R~ Window4Exposure.R~ Window4Exposure.R~ Window4Exposure.R~ Window4Exposure.R~
#                 <int> <date>              <date>                          <int> <date>             <date>                          <int> <date>             <date>            
#  1                  4 2013-05-01          2013-08-01                          2 2013-05-01         2013-08-02                         NA NA                 NA                
#  2                  5 2015-01-23          2015-04-13                          2 2015-01-23         2015-04-23                         NA NA                 NA                
#  3                  2 2012-03-12          2012-03-30                          2 2012-03-12         2012-03-29                         NA NA                 NA                
#  4                  2 2012-10-04          2012-12-07                          1 2012-12-10         2012-12-10                         NA NA                 NA                
#  5                  4 2012-12-23          2013-02-14                          1 2013-04-02         2013-04-02                         NA NA                 NA                
#  6                  4 2014-02-24          2014-05-05                          1 2014-04-24         2014-04-24                         NA NA                 NA                
#  7                  8 2013-05-14          2013-09-03                          1 2013-05-30         2013-05-30                         NA NA                 NA                
#  8                  8 2011-12-09          2012-03-04                          4 2011-12-02         2012-03-02                         NA NA                 NA                
#  9                  1 2014-01-15          2014-01-15                          4 2013-10-28         2014-02-13                         NA NA                 NA                
# 10                  6 2012-05-26          2012-08-21                          3 2012-05-26         2012-08-20                         NA NA                 NA                
# # ... with 303 more rows
# > ID_Eligible_Exposure.TargetTrial2v38.2.113vs200.Outcome.Covariates.DDD.A1c %>% select(lmp, matches("Window4Exposure")) %>% 
# +      mutate_if(function(x) lubridate::is.Date(x), function(x) {as.numeric(x - .$lmp)})  #----
# # A tibble: 313 x 10
#      lmp Window4Exposure.R~ Window4Exposure.R~ Window4Exposure.R~ Window4Exposure.R~ Window4Exposure.~ Window4Exposure.~ Window4Exposure.~ Window4Exposure.~ Window4Exposure.~
#    <dbl>              <int>              <dbl>              <dbl>              <int>             <dbl>             <dbl>             <int>             <dbl>             <dbl>
#  1     0                  4                 85                177                  2                85               178                NA                NA                NA
#  2     0                  5                 69                149                  2                69               159                NA                NA                NA
#  3     0                  2                 84                102                  2                84               101                NA                NA                NA
#  4     0                  2                 87                151                  1               154               154                NA                NA                NA
#  5     0                  4                 65                118                  1               165               165                NA                NA                NA
#  6     0                  4                 62                132                  1               121               121                NA                NA                NA
#  7     0                  8                 66                178                  1                82                82                NA                NA                NA
#  8     0                  8                 80                166                  4                73               164                NA                NA                NA
#  9     0                  1                145                145                  4                66               174                NA                NA                NA
# 10     0                  6                 65                152                  3                65               151                NA                NA                NA
# # ... with 303 more rows













#@ -----  
data %>% mutate_if(lubridate::is.Date, function(vec) if_else(is.na(vec), as.Date("9999-12-31"), vec))
data %>% mutate_if(lubridate::is.Date, function(vec) replace(vec, is.na(vec), as.Date("9999-12-31")))
data %>% mutate_if(lubridate::is.Date, function(vec) replace_na(vec, as.Date("9999-12-31")))





#@ -----  

# https://stackoverflow.com/questions/24282550/no-non-missing-arguments-warning-when-using-min-or-max-in-reshape2 -----
as.Date(Inf)
as.Date(-Inf)
# > as.Date(Inf)
# Error in as.Date.numeric(Inf) : 'origin' must be supplied
# > as.Date(-Inf)
# Error in as.Date.numeric(-Inf) : 'origin' must be supplied
structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") |> dput()
structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")
structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") |> summary() #----
structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% {if_else(. == Inf, as.Date(NA), as.Date(.))} |> summary() #----
structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% {if_else(. == Inf | . == -Inf, as.Date(NA), as.Date(.))} |> summary() #----
structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% {ifelse(. == Inf | . == -Inf, as.Date(NA), as.Date(.))} |> summary() #----
structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% {ifelse(. == Inf | . == -Inf, (NA), (.))} |> summary() #----
# > structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") |> dput()
# structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")
# > structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")
# [1] "2011-12-10" NA           NA           NA           "2011-02-28"
# > structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") |> summary() #----
#         Min.      1st Qu.       Median         Mean      3rd Qu.         Max.         NA's 
#           NA           NA "2011-07-20"           NA           NA           NA          "1" 
# > structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% {if_else(. == Inf, as.Date(NA), as.Date(.))} |> summary() #----
#         Min.      1st Qu.       Median         Mean      3rd Qu.         Max.         NA's 
#           NA           NA "2011-02-28"           NA "2011-07-20" "2011-12-10"          "2" 
# > structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% {if_else(. == Inf | . == -Inf, as.Date(NA), as.Date(.))} |> summary() #----
#         Min.      1st Qu.       Median         Mean      3rd Qu.         Max.         NA's 
# "2011-02-28" "2011-05-10" "2011-07-20" "2011-07-20" "2011-09-29" "2011-12-10"          "3" 
# > structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% {ifelse(. == Inf | . == -Inf, as.Date(NA), as.Date(.))} |> summary() #----
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#   15033   15104   15176   15176   15247   15318       3 
# > structure(c(15318, -Inf, NA, Inf, 15033), class = "Date") %>% {ifelse(. == Inf | . == -Inf, (NA), (.))} |> summary() #----
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#   15033   15104   15176   15176   15247   15318       3 







data.frame(value = structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")) %>% map_df(function(x) if_else(x == (Inf) | x == (-Inf), as.Date(NA), as.Date(x))) |> summary() #-----
data.frame(value = structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")) %>% map_df(function(x) if_else(x == as.Date(Inf) | x == as.Date(-Inf), as.Date(NA), as.Date(x))) |> summary() #-----
data.frame(value = structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")) %>% map_df(function(x) if_else(as.numeric(x) == (Inf) | as.numeric(x) == (-Inf), as.Date(NA), as.Date(x))) |> summary() #-----
# > data.frame(value = structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")) %>% map_df(function(x) if_else(x == (Inf) | x == (-Inf), as.Date(NA), as.Date(x))) |> summary() #-----
#      value           
#  Min.   :2011-02-28  
#  1st Qu.:2011-05-10  
#  Median :2011-07-20  
#  Mean   :2011-07-20  
#  3rd Qu.:2011-09-29  
#  Max.   :2011-12-10  
#  NA's   :3           
# > data.frame(value = structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")) %>% map_df(function(x) if_else(x == as.Date(Inf) | x == as.Date(-Inf), as.Date(NA), as.Date(x))) |> summary() #-----
# Error in as.Date.numeric(Inf) : 'origin' must be supplied
# Called from: as.Date.numeric(Inf)
# > data.frame(value = structure(c(15318, -Inf, NA, Inf, 15033), class = "Date")) %>% map_df(function(x) if_else(as.numeric(x) == (Inf) | as.numeric(x) == (-Inf), as.Date(NA), as.Date(x))) |> summary() #-----
#      value           
#  Min.   :2011-02-28  
#  1st Qu.:2011-05-10  
#  Median :2011-07-20  
#  Mean   :2011-07-20  
#  3rd Qu.:2011-09-29  
#  Max.   :2011-12-10  
#  NA's   :3        
#@ end -----  





ENROLID3169_Age1845_Inc2.ia_Exc12356abcd.exposure %>% map_df(function(x) if(class(x) == "Date") {if_else(x == Inf | x == -Inf, as.Date(NA), as.Date(x))} else x) |> summary() #-----
# > ENROLID3169_Age1845_Inc2.ia_Exc12356abcd.exposure %>% map_df(function(x) if(class(x) == "Date") {if_else(x == Inf | x == -Inf, as.Date(NA), as.Date(x))} else x) |> summary() #-----
#     ENROLID             Exc1            Exc2            Exc3            Exc4            Exc5           Exc5.i         Exc5.ii         Exc5.iii          Exc6        
#  Min.   :1.591e+07   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical  
#  1st Qu.:2.074e+09   FALSE:3169      FALSE:3169      FALSE:3169      FALSE:1211      FALSE:3169      FALSE:3169      FALSE:3169      FALSE:3169      FALSE:3169     
#  Median :2.910e+09                                                   TRUE :1958                                                                                     
#  Mean   :1.293e+10                                                                                                                                                  
#  3rd Qu.:2.860e+10                                                                                                                                                  
#  Max.   :3.246e+10                                                                                                                                                  
#    Exc10           Exc11           Exc12           Exc13           Inc2         Inc2.ia        Inc2.ia.1      Inc2.ia.1.a     Inc2.ia.1.b     Inc2.ia.1.b.1  
#  Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode:logical   Mode:logical   Mode:logical   Mode :logical   Mode :logical   Mode :logical  
#  FALSE:3169      FALSE:3169      FALSE:3169      FALSE:3169      TRUE:3169      TRUE:3169      TRUE:3169      FALSE:14        FALSE:3169      FALSE:3157     
#                                                                                                               TRUE :3155                      TRUE :12       
#  Inc2.ia.1.b.2   Inc2.ia.1.c     Inc2.ia.2      Inc2.ia.2.a     Inc2.ia.2.b     Inc2.ia.3      Inc2.ia.3.a     Inc2.ia.3.b    Inc2.ia.3.c     Inc2.ia.3.d     Inc2.ia.4     
#  Mode :logical   Mode :logical   Mode:logical   Mode :logical   Mode :logical   Mode:logical   Mode :logical   Mode:logical   Mode :logical   Mode :logical   Mode:logical  
#  FALSE:2882      FALSE:2262      TRUE:3169      FALSE:68        FALSE:2332      TRUE:3169      FALSE:2036      TRUE:3169      FALSE:421       FALSE:2370      TRUE:3169     
#  TRUE :287       TRUE :907                      TRUE :3101      TRUE :837                      TRUE :1133                     TRUE :2748      TRUE :799                     
#  Inc2.ia.4.a     Inc2.ia.4.b     Inc2.ia.4.c     Inc2.ia.4.c.1   Inc2.ia.4.c.2   Inc2.ia.4.c.3   Inc2.iib       Inc2.iib.1     Inc2.iib.1.a    Inc2.iib.1.b   
#  Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode:logical   Mode :logical   Mode:logical   Mode :logical   Mode :logical  
#  FALSE:2332      FALSE:2370      FALSE:878       FALSE:799       FALSE:421       TRUE:3169      FALSE:3169      TRUE:3169      FALSE:14        FALSE:3169     
#  TRUE :837       TRUE :799       TRUE :2291      TRUE :2370      TRUE :2748                                                    TRUE :3155                     
#  Inc2.iib.1.b.1  Inc2.iib.1.b.2  Inc2.iib.1.c    Inc2.iib.2      Inc2.iib.2.a    Inc2.iib.2.b    Inc2.iib.3      Inc2.iib.3.b    Inc2.iib.3.c    Inc2.iib.3.d   
#  Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical  
#  FALSE:3157      FALSE:2882      FALSE:2262      FALSE:3169      FALSE:3101      FALSE:837       FALSE:3169      FALSE:631       FALSE:3149      FALSE:1133     
#  TRUE :12        TRUE :287       TRUE :907                       TRUE :68        TRUE :2332                      TRUE :2538      TRUE :20        TRUE :2036     
#      DOBYR        Age_at_lmp    Exc12356abcd     Study         CONCEPT_NDC_insulin_ndDate CONCEPT_NDC_insulin_acarbose_miglitol_pramlintide_ndDate
#  Min.   :1966   Min.   :18.00   Mode :logical   Mode:logical   Min.   : 0.000             Min.   : 0.00                                           
#  1st Qu.:1975   1st Qu.:30.00   FALSE:3169      TRUE:3169      1st Qu.: 1.000             1st Qu.: 1.00                                           
#  Median :1978   Median :34.00                                  Median : 2.000             Median : 2.00                                           
#  Mean   :1978   Mean   :33.79                                  Mean   : 2.605             Mean   : 2.61                                           
#  3rd Qu.:1982   3rd Qu.:37.00                                  3rd Qu.: 3.000             3rd Qu.: 3.00                                           
#  Max.   :1996   Max.   :45.00                                  Max.   :20.000             Max.   :20.00                                           
#                                                                NA's   :128                NA's   :128                                             
#  CONCEPT_NDC_metformin_ndDate CONCEPT_NDC_SU_TZD_etc_ndDate CONCEPT_NDC_insulin_minDate CONCEPT_NDC_insulin_acarbose_miglitol_pramlintide_minDate
#  Min.   : 0.000               Min.   : 0.0000               Min.   :2011-01-01          Min.   :2011-01-01                                       
#  1st Qu.: 0.000               1st Qu.: 0.0000               1st Qu.:2011-09-06          1st Qu.:2011-09-06                                       
#  Median : 1.000               Median : 0.0000               Median :2012-07-09          Median :2012-07-09                                       
#  Mean   : 1.589               Mean   : 0.9457               Mean   :2012-09-19          Mean   :2012-09-19                                       
#  3rd Qu.: 3.000               3rd Qu.: 1.0000               3rd Qu.:2013-09-09          3rd Qu.:2013-09-09                                       
#  Max.   :14.000               Max.   :15.0000               Max.   :2015-04-11          Max.   :2015-04-11                                       
#  NA's   :128                  NA's   :128                   NA's   :323                 NA's   :323                                              
#  CONCEPT_NDC_metformin_minDate CONCEPT_NDC_SU_TZD_etc_minDate CONCEPT_NDC_insulin_maxDate CONCEPT_NDC_insulin_acarbose_miglitol_pramlintide_maxDate
#  Min.   :2011-01-01            Min.   :2011-01-01             Min.   :2011-01-01          Min.   :2011-01-01                                       
#  1st Qu.:2011-07-20            1st Qu.:2011-08-25             1st Qu.:2011-10-26          1st Qu.:2011-10-26                                       
#  Median :2012-05-21            Median :2012-06-19             Median :2012-08-20          Median :2012-08-20                                       
#  Mean   :2012-07-30            Mean   :2012-08-28             Mean   :2012-11-03          Mean   :2012-11-03                                       
#  3rd Qu.:2013-07-07            3rd Qu.:2013-08-11             3rd Qu.:2013-10-24          3rd Qu.:2013-10-24                                       
#  Max.   :2015-02-25            Max.   :2015-03-11             Max.   :2015-04-30          Max.   :2015-04-30                                       
#  NA's   :1440                  NA's   :2093                   NA's   :323                 NA's   :323                                              
#  CONCEPT_NDC_metformin_maxDate CONCEPT_NDC_SU_TZD_etc_maxDate
#  Min.   :2011-01-01            Min.   :2011-01-03            
#  1st Qu.:2011-10-06            1st Qu.:2011-10-22            
#  Median :2012-08-10            Median :2012-08-14            
#  Mean   :2012-10-10            Mean   :2012-10-23            
#  3rd Qu.:2013-09-14            3rd Qu.:2013-10-02            
#  Max.   :2015-04-09            Max.   :2015-04-22            
#  NA's   :1440                  NA's   :2093 




#@ ENROLID3169_Age1845_Inc2.ia_Exc12356abcd.exposure ====  
# ENROLID3169_Age1845_Inc2.ia_Exc12356abcd.exposure = 
#     ENROLID3169_Age1845_Inc2.ia_Exc12356abcd %>% left_join(
#         ENROLID3169_Age1845_Inc2.ia_Exc12356abcd %>% left_join(d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm) %>%
#             mutate_at(vars(matches("CONCEPT_NDC")), list(~if_else(., SVCDATE, as.Date(NA)))) %>% 
#             dplyr::filter(SVCDATE >= lmp - 90) %>% 
#             dplyr::filter(SVCDATE <= lmp + 120) %>% 
#             group_by(ENROLID) %>% summarise_at(.vars = vars(matches("CONCEPT_NDC")), .funs = list(ndDate = n_distinct, minDate = min, maxDate = max), na.rm = T)
#     ) %>% 
#     map_df(function(x) if(class(x) == "Date") if_else(x == Inf | x == -Inf, as.Date(NA), as.Date(x)) else x) 
ENROLID3169_Age1845_Inc2.ia_Exc12356abcd.exposure = 
    ENROLID3169_Age1845_Inc2.ia_Exc12356abcd %>% left_join(
        ENROLID3169_Age1845_Inc2.ia_Exc12356abcd %>% left_join(d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm) %>%
            mutate_at(vars(matches("CONCEPT_NDC")), function(vec) if_else(vec, SVCDATE, as.Date(NA)) ) %>% 
            dplyr::filter(SVCDATE >= lmp - 90) %>% 
            dplyr::filter(SVCDATE <= lmp + 120) %>% 
            group_by(ENROLID) %>% summarise_at(.vars = vars(matches("CONCEPT_NDC")), .funs = list(ndDate = n_distinct, minDate = min, maxDate = max), na.rm = T)
    ) %>% 
    map_df(function(x) if(class(x) == "Date") if_else(x == Inf | x == -Inf, as.Date(NA), as.Date(x)) else x) 
warnings()
# > ENROLID3169_Age1845_Inc2.ia_Exc12356abcd.exposure = 
# +     ENROLID3169_Age1845_Inc2.ia_Exc12356abcd %>% left_join(
# +         ENROLID3169_Age1845_Inc2.ia_Exc12356abcd %>% left_join(d.ID_DATE_DX.distinct.byID_min_rank_lmp.ID_lmp.ge_lmp_365_le_enddate.CONCEPT_NDC_DM.na_rm) %>%
# +             mutate_at(vars(matches("CONCEPT_NDC")), list(~if_else(., SVCDATE, as.Date(NA)))) %>% 
# +             dplyr::filter(SVCDATE >= lmp - 90) %>% 
# +             dplyr::filter(SVCDATE <= lmp + 120) %>% 
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

























#@@@@ -----  

as.Date("2000-01-01") |> str() #----
as.Date("2000-01-01") |> dput() #----
structure(0, class = "Date")
structure(10000, class = "Date")
structure(20000, class = "Date")
# > as.Date("2000-01-01") |> str() #----
#  Date[1:1], format: "2000-01-01"
# > as.Date("2000-01-01") |> dput() #----
# structure(10957, class = "Date")
# > structure(0, class = "Date")
# [1] "1970-01-01"
# > structure(10000, class = "Date")
# [1] "1997-05-19"
# > structure(20000, class = "Date")
# [1] "2024-10-04"



is.numeric.Date(structure(0, class = "Date"))
lubridate::is.Date(structure(0, class = "Date"))
class(structure(0, class = "Date")) == "Date"
# > is.numeric.Date(structure(0, class = "Date"))
# [1] FALSE
# > lubridate::is.Date(structure(0, class = "Date"))
# [1] TRUE
# > class(structure(0, class = "Date")) == "Date"
# [1] TRUE






#@ -----  

structure(0, class = "Date")
structure(0, class = c("POSIXt", "POSIXct"))
# > structure(0, class = "Date")
# [1] "1970-01-01"
# > structure(0, class = c("POSIXt", "POSIXct"))
# [1] "1969-12-31 19:00:00 EST"








#@ -----  

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



















#@ end -----  
