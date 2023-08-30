# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/15_cleaning_time/convert.YYYYMM_to_Date.source.r
#%% convert.YYYYMM_to_Date() =====
convert.YYYYMM_to_Date <- function(string_YYYYMM) {
    library(lubridate)
    ceiling_date(as.Date(paste0(string_YYYYMM, "01"), format="%Y%m%d"), "month") - days(1)
}
dput(as.character(convert.YYYYMM_to_Date(202300+1:12)))
c("2023-01-31", "2023-02-28", "2023-03-31", "2023-04-30", "2023-05-31", "2023-06-30",
  "2023-07-31", "2023-08-31", "2023-09-30", "2023-10-31", "2023-11-30", "2023-12-31")
dput(convert.YYYYMM_to_Date(202300+1:12))
structure(c(19388, 19416, 19447, 19477, 19508, 19538, 19569, 
19600, 19630, 19661, 19691, 19722), class = "Date")



# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/15_cleaning_time/convert.YYYYMM_to_Date.source.r
#%% convert.YYYYMMDD_to_Date() =====
convert.YYYYMMDD_to_Date <- function(string_YYYYMMDD) {
    as.Date(string_YYYYMMDD, format="%Y%m%d")
}
c("20230131", "20230228", "20230331", "20230430", "20230531", "20230630",
  "20230731", "20230831", "20230930", "20231031", "20231130", "20231231") %>% 
    convert.YYYYMMDD_to_Date %>% dput
structure(c(19388, 19416, 19447, 19477, 19508, 19538, 19569, 
19600, 19630, 19661, 19691, 19722), class = "Date")
c("20230131", "20230228", "20230331", "20230430", "20230531", "20230630",
  "20230731", "20230831", "20230930", "20231031", "20231130", "20231231") %>% 
    convert.YYYYMMDD_to_Date %>% as.character %>% dput
c("2023-01-31", "2023-02-28", "2023-03-31", "2023-04-30", "2023-05-31", "2023-06-30",
  "2023-07-31", "2023-08-31", "2023-09-30", "2023-10-31", "2023-11-30", "2023-12-31")


#%% lubridate::ymd() =====
c("20230131", "20230228", "20230331", "20230430", "20230531", "20230630",
  "20230731", "20230831", "20230930", "20231031", "20231130", "20231231") %>% 
    ymd %>% dput
structure(c(19388, 19416, 19447, 19477, 19508, 19538, 19569, 
19600, 19630, 19661, 19691, 19722), class = "Date")
c("20230131", "20230228", "20230331", "20230430", "20230531", "20230630",
  "20230731", "20230831", "20230930", "20231031", "20231130", "20231231") %>% 
    ymd %>% as.character %>% dput
c("2023-01-31", "2023-02-28", "2023-03-31", "2023-04-30", "2023-05-31", "2023-06-30",
  "2023-07-31", "2023-08-31", "2023-09-30", "2023-10-31", "2023-11-30", "2023-12-31")


library(dplyr)
library(lubridate)


# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/15_cleaning_time/convert.YYYYMM_to_Date.source.r
#%% convert.ymd_to_Date() =====
convert.ymd_to_Date <- function(dataset, 
                                varname4ymd = "RECU_FR_DT", 
                                varname4Date = "RECU_FR_Date") {
  
  dataset <- dataset %>%
    mutate(!!varname4Date := ymd(!!sym(varname4ymd))) %>%
    select(-!!sym(varname4ymd))
  
  return(dataset)
}
