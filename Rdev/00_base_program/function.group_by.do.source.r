
https://stackoverflow.com/questions/26796829/how-can-dplyr-generate-data-frame-for-each-group-after-the-group-by-operation
http://www.win-vector.com/blog/2017/07/better-grouped-summaries-in-dplyr/
#@ df %>% rownames_to_column %>% group_by(GROUP) %>% do(tail(.,3)) #----
ENROLID2797_Age1845_Inc2.ia_Exc12356abcd.t_42_154.exposure.enrolid_inf.outcomes %>% 
    mutate(
        PrimaryOutcome1.minDate = if_else(final_type %in% c(3, 5), enddate, as.Date(NA))
        , PrimaryOutcome2.minDate = if_else((gestage < 37) & (final_type == 2), enddate, as.Date(NA))
        , PrimaryOutcome123456 = PrimaryOutcome1 | PrimaryOutcome2 | PrimaryOutcome3 | PrimaryOutcome4 | PrimaryOutcome5 | PrimaryOutcome6
        , PrimaryOutcome123456.minDate = pmin(PrimaryOutcome1.minDate, PrimaryOutcome2.minDate, PrimaryOutcome3.minDate, PrimaryOutcome4.minDate, PrimaryOutcome5.minDate, PrimaryOutcome6.minDate, na.rm = T)
    ) %>% select(
        lmp, PrimaryOutcome1, PrimaryOutcome1.minDate, PrimaryOutcome2.minDate, PrimaryOutcome123456, PrimaryOutcome123456.minDate
    ) %>% rownames_to_column %>% group_by(PrimaryOutcome1) %>% do(tail(.,3))
# > ENROLID2797_Age1845_Inc2.ia_Exc12356abcd.t_42_154.exposure.enrolid_inf.outcomes %>% 
# +     mutate(
# +         PrimaryOutcome1.minDate = if_else(final_type %in% c(3, 5), enddate, as.Date(NA))
# +         , PrimaryOutcome2.minDate = if_else((gestage < 37) & (final_type == 2), enddate, as.Date(NA))
# +         , PrimaryOutcome123456 = PrimaryOutcome1 | PrimaryOutcome2 | PrimaryOutcome3 | PrimaryOutcome4 | PrimaryOutcome5 | PrimaryOutcome6
# +         , PrimaryOutcome123456.minDate = pmin(PrimaryOutcome1.minDate, PrimaryOutcome2.minDate, PrimaryOutcome3.minDate, PrimaryOutcome4.minDate, PrimaryOutcome5.minDate, PrimaryOutcome6.minDate, na.rm = T)
# +     ) %>% select(
# +         lmp, PrimaryOutcome1, PrimaryOutcome1.minDate, PrimaryOutcome2.minDate, PrimaryOutcome123456, PrimaryOutcome123456.minDate
# +     ) %>% rownames_to_column %>% group_by(PrimaryOutcome1) %>% do(tail(.,3))
# # A tibble: 6 x 7
# # Groups:   PrimaryOutcome1 [2]
#   rowname lmp        PrimaryOutcome1 PrimaryOutcome1.minDate PrimaryOutcome2.minDate PrimaryOutcome123456 PrimaryOutcome123456.minDate
#   <chr>   <date>     <lgl>           <date>                  <date>                  <lgl>                <date>                      
# 1 2788    2014-04-08 FALSE           NA                      NA                      FALSE                NA                          
# 2 2793    2013-11-25 FALSE           NA                      2014-08-04              TRUE                 2014-08-04                  
# 3 2796    2014-11-20 FALSE           NA                      NA                      FALSE                NA                          
# 4 2794    2014-04-01 TRUE            2014-05-27              NA                      TRUE                 2014-05-27                  
# 5 2795    2014-07-01 TRUE            2014-08-26              NA                      TRUE                 2014-08-26                  
# 6 2797    2014-10-16 TRUE            2014-12-11              NA                      TRUE                 2014-12-11  



