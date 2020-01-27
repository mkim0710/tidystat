# data.PersonTime.source.r



#@ analyticDF2797.PersonTime7 ====
Interval = 7 * 12

analyticDF2797 %>% select(ENROLID, PrimaryOutcome123456.time, PrimaryOutcome123456) %>% 
    mutate(PeriodSeq = PrimaryOutcome123456.time %>% map(function(x) 1L:ceiling(x/Interval)))
analyticDF2797 %>% select(ENROLID, PrimaryOutcome123456.time, PrimaryOutcome123456) %>% 
    mutate(PeriodSeq = PrimaryOutcome123456.time %>% map(function(x) 1L:ceiling(x/Interval))) %>% unnest
analyticDF2797 %>% select(ENROLID, PrimaryOutcome123456.time, PrimaryOutcome123456) %>% 
    mutate(PeriodSeq = PrimaryOutcome123456.time %>% map(function(x) 1L:ceiling(x/Interval))) %>% unnest %>%  
    mutate(
        Period = paste0("(", (PeriodSeq-1)*Interval, ",", PeriodSeq*Interval, "]") %>% as.factor
        , time = PeriodSeq * Interval
        , event = (PrimaryOutcome123456 == 1) & (PrimaryOutcome123456.time <= PeriodSeq * Interval)
        , timesq = time*time
        , k = PeriodSeq - 1  # defined as in hernanrobins_v2.17.22 $17.2 From hazards to risks
        , Dk_plus1 = event  # defined as in hernanrobins_v2.17.22 $17.2 From hazards to risks 
    ) 
# > analyticDF2797 %>% select(ENROLID, PrimaryOutcome123456.time, PrimaryOutcome123456) %>% 
# +     mutate(PeriodSeq = PrimaryOutcome123456.time %>% map(function(x) 1L:ceiling(x/Interval)))
# # A tibble: 2,797 x 4
#      ENROLID PrimaryOutcome123456.time PrimaryOutcome123456 PeriodSeq
#        <dbl>                     <int> <lgl>                <list>   
#  1 130298303                       273 FALSE                <int [4]>
#  2 357944602                       252 TRUE                 <int [3]>
#  3 514563701                       273 FALSE                <int [4]>
#  4 585415901                       273 FALSE                <int [4]>
#  5 597484206                       273 FALSE                <int [4]>
#  6 654552101                       245 TRUE                 <int [3]>
#  7 665579604                       273 FALSE                <int [4]>
#  8 666119601                       273 FALSE                <int [4]>
#  9 673451601                       273 FALSE                <int [4]>
# 10 685036801                       273 FALSE                <int [4]>
# # ... with 2,787 more rows
# > analyticDF2797 %>% select(ENROLID, PrimaryOutcome123456.time, PrimaryOutcome123456) %>% 
# +     mutate(PeriodSeq = PrimaryOutcome123456.time %>% map(function(x) 1L:ceiling(x/Interval))) %>% unnest
# # A tibble: 9,561 x 4
#      ENROLID PrimaryOutcome123456.time PrimaryOutcome123456 PeriodSeq
#        <dbl>                     <int> <lgl>                    <int>
#  1 130298303                       273 FALSE                        1
#  2 130298303                       273 FALSE                        2
#  3 130298303                       273 FALSE                        3
#  4 130298303                       273 FALSE                        4
#  5 357944602                       252 TRUE                         1
#  6 357944602                       252 TRUE                         2
#  7 357944602                       252 TRUE                         3
#  8 514563701                       273 FALSE                        1
#  9 514563701                       273 FALSE                        2
# 10 514563701                       273 FALSE                        3
# # ... with 9,551 more rows
# > analyticDF2797 %>% select(ENROLID, PrimaryOutcome123456.time, PrimaryOutcome123456) %>% 
# +     mutate(PeriodSeq = PrimaryOutcome123456.time %>% map(function(x) 1L:ceiling(x/Interval))) %>% unnest %>%  
# +     mutate(
# +         Period = paste0("(", (PeriodSeq-1)*Interval, ",", PeriodSeq*Interval, "]") %>% as.factor
# +         , time = PeriodSeq * Interval
# +         , event = (PrimaryOutcome123456 == 1) & (PrimaryOutcome123456.time <= PeriodSeq * Interval)
# +         , timesq = time*time
# +         , k = PeriodSeq - 1  # defined as in hernanrobins_v2.17.22 $17.2 From hazards to risks
# +         , Dk_plus1 = event  # defined as in hernanrobins_v2.17.22 $17.2 From hazards to risks 
# +     ) 
# # A tibble: 9,561 x 10
#      ENROLID PrimaryOutcome123456.time PrimaryOutcome123456 PeriodSeq Period     time event timesq     k Dk_plus1
#        <dbl>                     <int> <lgl>                    <int> <fct>     <dbl> <lgl>  <dbl> <dbl> <lgl>   
#  1 130298303                       273 FALSE                        1 (0,84]       84 FALSE   7056     0 FALSE   
#  2 130298303                       273 FALSE                        2 (84,168]    168 FALSE  28224     1 FALSE   
#  3 130298303                       273 FALSE                        3 (168,252]   252 FALSE  63504     2 FALSE   
#  4 130298303                       273 FALSE                        4 (252,336]   336 FALSE 112896     3 FALSE   
#  5 357944602                       252 TRUE                         1 (0,84]       84 FALSE   7056     0 FALSE   
#  6 357944602                       252 TRUE                         2 (84,168]    168 FALSE  28224     1 FALSE   
#  7 357944602                       252 TRUE                         3 (168,252]   252 TRUE   63504     2 TRUE    
#  8 514563701                       273 FALSE                        1 (0,84]       84 FALSE   7056     0 FALSE   
#  9 514563701                       273 FALSE                        2 (84,168]    168 FALSE  28224     1 FALSE   
# 10 514563701                       273 FALSE                        3 (168,252]   252 FALSE  63504     2 FALSE   
# # ... with 9,551 more rows



