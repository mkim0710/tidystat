# https://github.com/mkim0710/tidystat/blob/master/Rdev/60_communicate_report_export/f_df.median_IQR.dev.r
## @ f_df.median_IQR.dev.r ------  

ADS_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
    mutate(time = fuduration_yr/365) %>% 
    group_by(is.Case) %>% summarise(mean(time), sd(time), quantile(time, probs = 1/4), median(time), quantile(time, probs = 3/4)) #-----
# > ADS_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
# +     mutate(time = fuduration_yr/365) %>% 
# +     group_by(is.Case) %>% summarise(mean(time), sd(time), quantile(time, probs = 1/4), median(time), quantile(time, probs = 3/4)) #-----  
# # A tibble: 2 x 6
#   is.Case `mean(time)` `sd(time)` `quantile(time, probs = 1/4)` `median(time)` `quantile(time, probs = 3/4)`
#   <lgl>          <dbl>      <dbl>                         <dbl>          <dbl>                         <dbl>
# 1 FALSE           6.67       1.01                          7.00           7.00                          7.00
# 2 TRUE            3.58       2.01                          1.87           3.63                          5.32

