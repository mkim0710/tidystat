# https://github.com/mkim0710/tidystat/tree/master/Rdev/10_import_clean_datatype/16_categorical_factor
# https://github.com/mkim0710/Rproject_MH/blob/master/Rpr.bind_rows/NHID_JK0213.bind_rows.Date.DTH_I2025I3052I6069I7079%20from%20.r


library(tidyverse)
set.seed(123)

sample_data <- tibble(
  STND_Y = sample(2003:2013, 100, replace = TRUE),
  PERSON_ID = sample(10000001:10000100, 100),
  DTH.Date = as.Date(sample(1:3650, 100, replace=TRUE), origin="2002-01-01"),
  DTH_CODE1 = sample(c(paste0("I", 10:99), paste0("R", 95:99)), 100, replace = TRUE)
) %>% mutate(DTH_CODE1_1char = substr(DTH_CODE1, 1, 1))

add.Date_ICD_chapter <- function(dataset, varname4Date = "DTH.Date", varname4ICD_chapter = "DTH_CODE1_1char", ICD_chapter = "I") {
    
  col_name <- paste0(varname4Date, ".", ICD_chapter)
  
  # Add the new indicator column to the dataset
  dataset <- dataset %>%
    mutate(!!col_name := if_else(!!sym(varname4ICD_chapter) %in% ICD_chapter, !!sym(varname4Date), as.Date(NA_character_)))
  
  return(dataset)
}

sample_data %>% 
    add.Date_ICD_chapter(varname4Date = "DTH.Date", varname4ICD_chapter = "DTH_CODE1_1char", ICD_chapter = "I") %>% 
    add.Date_ICD_chapter(varname4Date = "DTH.Date", varname4ICD_chapter = "DTH_CODE1_1char", ICD_chapter = "R") %>% 
    add.Date_ICD_chapter(varname4Date = "DTH.Date", varname4ICD_chapter = "DTH_CODE1_1char", ICD_chapter = "C") %>% 
    as.tibble()
# # A tibble: 100 × 8
#    STND_Y PERSON_ID DTH.Date   DTH_CODE1 DTH_CODE1_1char DTH.Date.I DTH.Date.R DTH.Date.C
#     <int>     <int> <date>     <chr>     <chr>           <date>     <date>     <date>    
#  1   2005  10000094 2009-05-18 R98       R               NA         2009-05-18 NA        
#  2   2005  10000079 2008-07-23 I40       I               2008-07-23 NA         NA        
#  3   2012  10000024 2010-10-07 R98       R               NA         2010-10-07 NA        
#  4   2004  10000087 2008-03-16 I82       I               2008-03-16 NA         NA        
#  5   2008  10000007 2003-09-11 I45       I               2003-09-11 NA         NA        
#  6   2013  10000093 2007-03-21 I31       I               2007-03-21 NA         NA        
#  7   2007  10000099 2009-07-09 I53       I               2009-07-09 NA         NA        
#  8   2006  10000023 2002-12-04 I50       I               2002-12-04 NA         NA        
#  9   2008  10000026 2009-10-16 R96       R               NA         2009-10-16 NA        
# 10   2011  10000032 2007-09-06 R97       R               NA         2007-09-06 NA        
# # ℹ 90 more rows
# # ℹ Use `print(n = ...)` to see more rows




add.Date_ICD <- function(dataset, varname4Date = "DTH.Date", varname4ICD = "DTH_CODE1", ICD_chapter = "I", ICD_number23_vector = 20:25) {
  
  # Generate the ICD codes
  ICD_codes <- paste0(ICD_chapter, ICD_number23_vector)
  
  # Create column name based on ICD range
  col_name <- paste0(varname4Date, ".", ICD_chapter, min(ICD_number23_vector), max(ICD_number23_vector))
  
  # Add the new indicator column to the dataset
  dataset <- dataset %>%
    mutate(!!col_name := if_else(!!sym(varname4ICD) %in% ICD_codes, !!sym(varname4Date), as.Date(NA_character_)))
  
  return(dataset)
}

sample_data %>% 
    add.Date_ICD(varname4Date = "DTH.Date", varname4ICD = "DTH_CODE1", ICD_chapter = "I", ICD_number23_vector = 20:25) %>% 
    add.Date_ICD(varname4Date = "DTH.Date", varname4ICD = "DTH_CODE1", ICD_chapter = "I", ICD_number23_vector = 30:52) %>% 
    add.Date_ICD(varname4Date = "DTH.Date", varname4ICD = "DTH_CODE1", ICD_chapter = "I", ICD_number23_vector = 60:69) %>% 
    add.Date_ICD(varname4Date = "DTH.Date", varname4ICD = "DTH_CODE1", ICD_chapter = "I", ICD_number23_vector = 70:79) %>% 
    as.tibble()
# # A tibble: 100 × 8
#    STND_Y PERSON_ID DTH.Date   DTH_CODE1 DTH.Date.I2025 DTH.Date.I3052 DTH.Date.I6069 DTH.Date.I7079
#     <int>     <int> <date>     <chr>     <date>         <date>         <date>         <date>        
#  1   2005  10000094 2009-05-18 I40       NA             2009-05-18     NA             NA            
#  2   2005  10000079 2008-07-23 I45       NA             2008-07-23     NA             NA            
#  3   2012  10000024 2010-10-07 I31       NA             2010-10-07     NA             NA            
#  4   2004  10000087 2008-03-16 I53       NA             NA             NA             NA            
#  5   2008  10000007 2003-09-11 I50       NA             2003-09-11     NA             NA            
#  6   2013  10000093 2007-03-21 I52       NA             2007-03-21     NA             NA            
#  7   2007  10000099 2009-07-09 I48       NA             2009-07-09     NA             NA            
#  8   2006  10000023 2002-12-04 I46       NA             2002-12-04     NA             NA            
#  9   2008  10000026 2009-10-16 I42       NA             2009-10-16     NA             NA            
# 10   2011  10000032 2007-09-06 I21       2007-09-06     NA             NA             NA            
# # ℹ 90 more rows
# # ℹ Use `print(n = ...)` to see more rows







library(tidyverse)

set.seed(123)
sample_data <- tibble(
  STND_Y = sample(2003:2013, 100, replace = TRUE),
  PERSON_ID = sample(10000001:10000100, 100),
  DTH.Date = as.Date(sample(1:3650, 100, replace=TRUE), origin="2002-01-01"),
  DTH_CODE1 = sample(paste0("I", 10:80), 100, replace = TRUE)
)



add.ICD_indicator <- function(dataset, varname4ICD = "DTH_CODE1", ICD_chapter = "I", ICD_number23_vector = 20:25) {
  # Generate the ICD codes
  ICD_codes <- paste0(ICD_chapter, ICD_number23_vector)
  
  # Create column name based on ICD range
  col_name <- paste0(varname4ICD, ".", ICD_chapter, min(ICD_number23_vector), max(ICD_number23_vector))
  
  # Add the new indicator column to the dataset
  dataset <- dataset %>%
    mutate(!!col_name := !!sym(varname4ICD) %in% ICD_codes)
  
  return(dataset)
}
str(add.ICD_indicator(sample_data, ICD_number23_vector = 20:25))

sample_data %>% 
    add.ICD_indicator(varname4ICD = "DTH_CODE1", ICD_chapter = "I", ICD_number23_vector = 20:25) %>% 
    add.ICD_indicator(varname4ICD = "DTH_CODE1", ICD_chapter = "I", ICD_number23_vector = 30:52) %>% 
    add.ICD_indicator(varname4ICD = "DTH_CODE1", ICD_chapter = "I", ICD_number23_vector = 60:69) %>% 
    add.ICD_indicator(varname4ICD = "DTH_CODE1", ICD_chapter = "I", ICD_number23_vector = 70:79) %>% 
    as.tibble
# # A tibble: 100 × 8
#    STND_Y PERSON_ID DTH.Date   DTH_CODE1 DTH_CODE1.I2025 DTH_CODE1.I3052 DTH_CODE1.I6069 DTH_CODE1.I7079
#     <int>     <int> <date>     <chr>     <lgl>           <lgl>           <lgl>           <lgl>          
#  1   2005  10000094 2009-05-18 I40       FALSE           TRUE            FALSE           FALSE          
#  2   2005  10000079 2008-07-23 I45       FALSE           TRUE            FALSE           FALSE          
#  3   2012  10000024 2010-10-07 I31       FALSE           TRUE            FALSE           FALSE          
#  4   2004  10000087 2008-03-16 I53       FALSE           FALSE           FALSE           FALSE          
#  5   2008  10000007 2003-09-11 I50       FALSE           TRUE            FALSE           FALSE          
#  6   2013  10000093 2007-03-21 I52       FALSE           TRUE            FALSE           FALSE          
#  7   2007  10000099 2009-07-09 I48       FALSE           TRUE            FALSE           FALSE          
#  8   2006  10000023 2002-12-04 I46       FALSE           TRUE            FALSE           FALSE          
#  9   2008  10000026 2009-10-16 I42       FALSE           TRUE            FALSE           FALSE          
# 10   2011  10000032 2007-09-06 I21       TRUE            FALSE           FALSE           FALSE          
# # ℹ 90 more rows
# # ℹ Use `print(n = ...)` to see more rows


