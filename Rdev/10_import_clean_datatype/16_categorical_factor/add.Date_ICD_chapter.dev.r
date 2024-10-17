# https://github.com/mkim0710/tidystat/tree/master/Rdev/10_import_clean_datatype/16_categorical_factor
# https://github.com/mkim0710/Rproject_MH/blob/master/Rpr.bind_rows/NHID_JK0213.bind_rows.Date.DTH_I2025I3052I6069I7079%20from%20.r


gj_jk.Date.DTH %>% dplyr::filter(DTH_CODE1_1char == "R") %>% {.$DTH_CODE1} |> as.character() |> table() #-----
# > NHID_JK0213.bind_rows.Date.DTH %>% dplyr::filter(DTH_CODE1_1char == "R") %>% {.$DTH_CODE1} |> as.character() |> table() #-----  
# .
#  R02  R04  R06  R07  R09  R10  R17  R18  R40  R50  R53  R54  R56  R57  R58  R63  R64  R68  R95  R96  R98  R99 
#    2   16    8    2  171    4    3    1    1    1   16 4575    2   20    1    1   36   71    5  192  123  727 

gj_jk.Date.DTH %>% dplyr::filter(DTH_CODE1_1char == "I") %>% {.$DTH_CODE1} |> as.character() |> table() #-----
# > NHID_JK0213.bind_rows.Date.DTH %>% dplyr::filter(DTH_CODE1_1char == "I") %>% {.$DTH_CODE1} |> as.character() |> table() #-----  
# .
#  I05  I06  I07  I08  I10  I11  I12  I13  I20  I21  I22  I24  I25  I26  I27  I28  I31  I33  I34  I35  I36  I38  I40  I42  I44  I46  I47  I48  I49  I50  I51  I60  I61  I62  I63  I64  I67  I69  I70  I71  I72  I73  I74  I77  I80  I82  I85  I95  I99 
#   36    3    2   25  437  503  115   49  231 2094    5   18  555   39   12    4   17   20   22   40    2   36   11  110    8  495   14  112   78  657  138  455 1200   86 2170  729  103 1665   36  144    5   19   19    6    9    3    3    4    2 

paste0("I", 20:25) |> dput() #----
paste0("I", 30:52) |> dput() #----
paste0("I", 60:69) |> dput() #----
paste0("I", 70:79) |> dput() #----
# > paste0("I", 20:25) |> dput() #----  
# c("I20", "I21", "I22", "I23", "I24", "I25")
# > paste0("I", 30:52) |> dput() #----  
# c("I30", "I31", "I32", "I33", "I34", "I35", "I36", "I37", "I38", "I39", "I40", "I41", "I42", "I43", "I44", "I45", "I46", "I47", "I48", "I49", "I50", "I51", "I52")
# > paste0("I", 60:69) |> dput() #----  
# c("I60", "I61", "I62", "I63", "I64", "I65", "I66", "I67", "I68", "I69")
# > paste0("I", 70:79) |> dput() #----  
# c("I70", "I71", "I72", "I73", "I74", "I75", "I76", "I77", "I78", "I79")



.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
set.seed(123)

sample_data <- tibble(
  STND_Y = sample(2003:2013, 100, replace = TRUE),
  PERSON_ID = sample(10000001:10000100, 100),
  DTH.Date = as.Date(sample(1:3650, 100, replace=TRUE), origin="2002-01-01"),
  DTH_CODE1 = sample(c(paste0("I", 10:99), paste0("R", 95:99)), 100, replace = TRUE)
) %>% mutate(DTH_CODE1_1char = substr(DTH_CODE1, 1, 1))


# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/16_categorical_factor/add.Date_ICD_chapter.dev.r
#%% add.Date_ICD_chapter() =====  
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
    as_tibble()
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



# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/16_categorical_factor/add.Date_ICD_chapter.dev.r
#%% add.Date_ICD() =====  
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
    as_tibble()
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







.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}

set.seed(123)
sample_data <- tibble(
  STND_Y = sample(2003:2013, 100, replace = TRUE),
  PERSON_ID = sample(10000001:10000100, 100),
  DTH.Date = as.Date(sample(1:3650, 100, replace=TRUE), origin="2002-01-01"),
  DTH_CODE1 = sample(paste0("I", 10:80), 100, replace = TRUE)
)


# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/16_categorical_factor/add.Date_ICD_chapter.dev.r
#%% add.ICD_indicator() =====  
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
    as_tibble
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



