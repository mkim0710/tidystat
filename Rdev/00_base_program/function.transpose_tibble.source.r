
    
analyticDF2797 %>% group_by(Exposure) %>% {left_join(summarize(., n()), summarise_at(., vars(matches("Outcome"), -matches("time")), funs(sum, mean)))} %>% 
    {bind_cols(
        transmute(., Exposure = Exposure, `n()` = paste0(`n()`, " (100%)"))
        ,
        map2_df(select(., matches("_sum")), select(., matches("_mean")), function(x, y) {
            paste0(x, " (", round(y*100,2), "%)")
        }) 
    )} %>%
    as.data.frame %>% column_to_rownames("Exposure") %>% t %>% as.data.frame %>% rownames_to_column #----
# > analyticDF2797 %>% group_by(Exposure) %>% {left_join(summarize(., n()), summarise_at(., vars(matches("Outcome"), -matches("time")), funs(sum, mean)))} %>% 
# +     {bind_cols(
# +         transmute(., Exposure = Exposure, `n()` = paste0(`n()`, " (100%)"))
# +         ,
# +         map2_df(select(., matches("_sum")), select(., matches("_mean")), function(x, y) {
# +             paste0(x, " (", round(y*100,2), "%)")
# +         }) 
# +     )} %>%
# +     as.data.frame %>% column_to_rownames("Exposure") %>% t %>% as.data.frame %>% rownames_to_column #----
# Joining, by = "Exposure"
#                          rowname  insulin_only metformin_after_insulin
# 1                            n()   2278 (100%)              519 (100%)
# 2       PrimaryOutcome123456_sum  773 (33.93%)            126 (24.28%)
# 3  SecondaryOutcomeP1456fhkl_sum 1437 (63.08%)            320 (61.66%)
# 4            PrimaryOutcome1_sum  297 (13.04%)              35 (6.74%)
# 5            PrimaryOutcome2_sum  460 (20.19%)             89 (17.15%)
# 6            PrimaryOutcome3_sum     8 (0.35%)                  0 (0%)
# 7            PrimaryOutcome4_sum     5 (0.22%)               3 (0.58%)
# 8            PrimaryOutcome5_sum     4 (0.18%)                  0 (0%)
# 9            PrimaryOutcome6_sum    27 (1.19%)              11 (2.12%)
# 10         SecondaryOutcome1_sum  372 (16.33%)             89 (17.15%)
# 11         SecondaryOutcome4_sum     5 (0.22%)               3 (0.58%)
# 12         SecondaryOutcome5_sum     4 (0.18%)                  0 (0%)
# 13         SecondaryOutcome6_sum    27 (1.19%)              11 (2.12%)
# 14         SecondaryOutcome7_sum     2 (0.09%)                  0 (0%)
# 15        SecondaryOutcome10_sum    36 (1.58%)              11 (2.12%)
# 16        SecondaryOutcome13_sum 1021 (44.82%)            263 (50.67%)
# 17        SecondaryOutcome14_sum     3 (0.13%)                  0 (0%)
# 18        SecondaryOutcome15_sum        0 (0%)                  0 (0%)
# 19        SecondaryOutcome17_sum  680 (29.85%)            181 (34.87%)
# 20        SecondaryOutcome20_sum     8 (0.35%)                  0 (0%)
# 21        SecondaryOutcome21_sum    22 (0.97%)               2 (0.39%)

analyticDF2797 %>% group_by(Exposure) %>% {left_join(summarize(., n()), summarise_at(., vars(matches("Outcome"), -matches("time")), funs(sum, mean)))} %>% 
    {bind_cols(
        transmute(., Exposure = Exposure, `n()` = paste0(`n()`, " (100%)"))
        ,
        map2_df(select(., matches("_sum")), select(., matches("_mean")), function(x, y) {
            paste0(x, " (", round(y*100,2), "%)")
        }) 
    )} %>% gather(key, value, -Exposure) %>% spread(Exposure, value) #----
# > analyticDF2797 %>% group_by(Exposure) %>% {left_join(summarize(., n()), summarise_at(., vars(matches("Outcome"), -matches("time")), funs(sum, mean)))} %>% 
# +     {bind_cols(
# +         transmute(., Exposure = Exposure, `n()` = paste0(`n()`, " (100%)"))
# +         ,
# +         map2_df(select(., matches("_sum")), select(., matches("_mean")), function(x, y) {
# +             paste0(x, " (", round(y*100,2), "%)")
# +         }) 
# +     )} %>% gather(key, value, -Exposure) %>% spread(Exposure, value) #----
# Joining, by = "Exposure"
# # A tibble: 21 x 3
#    key                      insulin_only metformin_after_insulin
#    <chr>                    <chr>        <chr>                  
#  1 n()                      2278 (100%)  519 (100%)             
#  2 PrimaryOutcome1_sum      297 (13.04%) 35 (6.74%)             
#  3 PrimaryOutcome123456_sum 773 (33.93%) 126 (24.28%)           
#  4 PrimaryOutcome2_sum      460 (20.19%) 89 (17.15%)            
#  5 PrimaryOutcome3_sum      8 (0.35%)    0 (0%)                 
#  6 PrimaryOutcome4_sum      5 (0.22%)    3 (0.58%)              
#  7 PrimaryOutcome5_sum      4 (0.18%)    0 (0%)                 
#  8 PrimaryOutcome6_sum      27 (1.19%)   11 (2.12%)             
#  9 SecondaryOutcome1_sum    372 (16.33%) 89 (17.15%)            
# 10 SecondaryOutcome10_sum   36 (1.58%)   11 (2.12%)             
# # ... with 11 more rows


