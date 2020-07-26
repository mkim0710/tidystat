# https://github.com/mkim0710/tidystat/new/master/Rdev/60_communicate_report_export/function.calculatePersonTime.source.r



# analyticDF_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode function.calculatePersonTime().r


analyticDF_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode$fuduration_yr %>% summary #----
# > analyticDF_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode$fuduration_yr %>% summary #---- 
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#       3    2312    2556    2246    2556    2556 


# https://github.com/mkim0710/tidystat/blob/master/Rdev/60_communicate_report_export/data.median_IQR.source.r
#@ data.median_IQR.source.r ------

analyticDF_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
    mutate(time = fuduration_yr/365) %>% 
    group_by(is.Case) %>% summarise(mean(time), sd(time), quantile(time, probs = 1/4), median(time), quantile(time, probs = 3/4)) #-----
# > analyticDF_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
# +     mutate(time = fuduration_yr/365) %>% 
# +     group_by(is.Case) %>% summarise(mean(time), sd(time), quantile(time, probs = 1/4), median(time), quantile(time, probs = 3/4)) #-----
# # A tibble: 2 x 6
#   is.Case `mean(time)` `sd(time)` `quantile(time, probs = 1/4)` `median(time)` `quantile(time, probs = 3/4)`
#   <lgl>          <dbl>      <dbl>                         <dbl>          <dbl>                         <dbl>
# 1 FALSE           6.67       1.01                          7.00           7.00                          7.00
# 2 TRUE            3.58       2.01                          1.87           3.63                          5.32




analyticDF_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
    mutate(time = fuduration_yr/365) %>% 
    group_by(is.Case) %>% summarise(sum(time)) #----
# > analyticDF_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
# +     mutate(time = fuduration_yr/365) %>% 
# +     group_by(is.Case) %>% summarise(sum(time)) #----
# # A tibble: 2 x 2
#   is.Case `sum(time)`
#   <lgl>         <dbl>
# 1 FALSE        30743.
# 2 TRUE          3305.

analyticDF_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
    mutate(time = fuduration_yr/365) %>% 
    filter(is.Case) %>% {.$time} %>% sum #----
# > analyticDF_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
# +     mutate(time = fuduration_yr/365) %>% 
# +     filter(is.Case) %>% {.$time} %>% sum #----
# [1] 3305.099

3305.099 / 922
# > 3305.099 / 922
# [1] 3.584706



function.calculatePersonTime = function(dataset, varname4time, varname4event) {
    
}







#@ end ------





