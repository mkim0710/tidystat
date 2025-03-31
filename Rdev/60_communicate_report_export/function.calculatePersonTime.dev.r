#@ calculation of Person-Time, which is sum(time2event), and make Table 2.  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/60_communicate_report_export/function.calculatePersonTime.dev.r
## @ Person-Time format of survival data.  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/50_model_formula_evaluation/57_model_time2event/f_df.PersonTime.dev.r






set.seed(123)  # for reproducibility
# Generate sample data
tblID_Event_Time2Event <- tibble::tibble(
  PERSON_ID = 10^5 + 1:10,
  Female = sample(c(TRUE, FALSE), 10, replace = TRUE),  # Random event occurrence
  Time2Event = sample(240:275, 10),  # Random times between 240 and 275
  Event = sample(c(TRUE, FALSE), 10, replace = TRUE)  # Random event occurrence
)
print(tblID_Event_Time2Event)
# > print(tblID_Event_Time2Event)
# # A tibble: 10 × 4
#    PERSON_ID Female Time2Event Event
#        <dbl> <lgl>       <int> <lgl>
#  1    100001 FALSE         267 FALSE
#  2    100002 FALSE         248 TRUE 
#  3    100003 TRUE          268 TRUE 
#  4    100004 FALSE         247 TRUE 
#  5    100005 TRUE          265 TRUE 
#  6    100006 FALSE         246 FALSE
#  7    100007 TRUE          249 TRUE 
#  8    100008 TRUE          274 FALSE
#  9    100009 TRUE          258 FALSE
# 10    100010 TRUE          243 TRUE 

tblID_Event_Time2Event %>% 
  group_by(Female) %>% 
  summarise(
    nEvents = sum(Event == 1),
    PersonTime = sum(Time2Event),
  )
# # A tibble: 2 × 3
#   Female nEvents PersonTime
#   <lgl>    <int>      <int>
# 1 FALSE        2       1008
# 2 TRUE         4       1557








# ADS_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode function.calculatePersonTime().r



ADS_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode$fuduration_yr |> summary() #----
ADS_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode$fuduration_yr %>% {./365} |> summary() #----
# > ADS_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode$fuduration_yr |> summary() #----  
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#       3    2312    2556    2246    2556    2556 
# > ADS_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode$fuduration_yr %>% {./365} |> summary() #----  
#     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
# 0.008219 6.333562 7.002740 6.154781 7.002740 7.002740 



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




ADS_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
    mutate(time = fuduration_yr/365) %>% 
    group_by(is.Case) %>% summarise(sum(time)) #----
# > ADS_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
# +     mutate(time = fuduration_yr/365) %>% 
# +     group_by(is.Case) %>% summarise(sum(time)) #----  
# # A tibble: 2 x 2
#   is.Case `sum(time)`
#   <lgl>         <dbl>
# 1 FALSE        30743.
# 2 TRUE          3305.

ADS_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
    mutate(time = fuduration_yr/365) %>% 
    dplyr::filter(is.Case) %>% {.$time} %>% sum #----
# > ADS_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
# +     mutate(time = fuduration_yr/365) %>% 
# +     dplyr::filter(is.Case) %>% {.$time} %>% sum #----  
# [1] 3305.099

3305.099 / 922
# > 3305.099 / 922
# [1] 3.584706



function.calculatePersonTime <- function(dataset, varname4time, varname4event) {
  # Extract the time variable
  time <- dataset[[varname4time]]
  
  # If there's an event variable, we'll consider the time until the event
  if (!is.null(dataset[[varname4event]])) {
    event <- dataset[[varname4event]]
    # Assuming event variable has 1 for event occurrence and 0 otherwise
    time[event == 1] <- time[event == 1] * 0.5  # Adjusting the time for those with events (assuming we're taking half the time for the event year)
  }
  
  # Summing up the total person-time
  total_person_time <- sum(time)
  
  return(total_person_time)
}






  
  
# __________|------  
# @@ END------  


library(dplyr)
.packagename = "lubridate"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}

calculatePersonTime <- function(start_date, end_date) {
  # Ensure the dates are of Date class
  start_date <- as.Date(start_date)
  end_date <- as.Date(end_date)
  
  # Calculate the duration for each individual
  duration <- interval(start_date, end_date) %/% days(1)
  
  return(duration)
}

# Example usage:
df <- data.frame(
  id = 1:3,
  start_date = as.Date(c("2020-01-01", "2019-01-01", "2018-01-01")),
  end_date = as.Date(c("2020-12-31", "2019-12-31", "2020-06-01"))
)

df <- df %>% 
  mutate(person_time = calculatePersonTime(start_date, end_date))

print(df)



library(dplyr)

calculatePersonTime <- function(time, event = NULL) {
  # If there's an event variable, adjust the time 
  if (!is.null(event)) {
    # Assuming event variable has 1 for event occurrence and 0 otherwise
    time[event == 1] <- time[event == 1] * 0.5  # Adjusting the time for those with events (assuming we're taking half the time for the event year)
  }
  
  return(time)
}

# Example Usage
df <- data.frame(
  id = 1:5,
  years_observed = c(2, 3, 5, 1, 4),
  event_occurred = c(0, 1, 0, 1, 0)
)

df <- df %>% 
  mutate(person_time = calculatePersonTime(years_observed, event_occurred))

print(df)
