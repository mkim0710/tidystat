# fun.data.primarykey.dev.r

######### NEED MORE WORK~!
# https://github.com/mkim0710/tidystat/blob/master/Rdev/20_tidy_group_by_match/23_group_by_PersonID/function.filter.PrimaryKey_duplicated.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/11_metadata/fun.data.primarykey.dev.r


library(tidyverse)
t0 = Sys.time()
nhis_heals_jk.sas7bdat <- readRDS("D:/OneDrive - SNU/[][SASproject]/SASproject_KNHIS_HEALS0215/nhis_heals_jk.sas7bdat.rds")
Sys.time() - t0
t0 = Sys.time()
nhis_heals_gj.sas7bdat <- readRDS("D:/OneDrive - SNU/[][SASproject]/SASproject_KNHIS_HEALS0215/nhis_heals_gj.sas7bdat.rds")
Sys.time() - t0


nhis_heals_jk.sas7bdat |> dim() #----
nhis_heals_jk.sas7bdat %>% {n_distinct(.$PERSON_ID)} #----
nhis_heals_jk.sas7bdat %>% select(PERSON_ID) %>% distinct |> dim() #----
nhis_heals_jk.sas7bdat %>% select(STND_Y, PERSON_ID) %>% distinct |> dim() #----
t0=Sys.time()
nhis_heals_jk.sas7bdat.duplicated = nhis_heals_jk.sas7bdat %>% group_by_at(vars(STND_Y, PERSON_ID)) %>% filter(n()>1)
Sys.time()-t0
nhis_heals_jk.sas7bdat.duplicated |> print()
# > nhis_heals_jk.sas7bdat |> dim() #----
# [1] 6933650      13
# > nhis_heals_jk.sas7bdat %>% {n_distinct(.$PERSON_ID)} #----
# [1] 514866
# > nhis_heals_jk.sas7bdat %>% select(PERSON_ID) %>% distinct |> dim() #----
# [1] 514866      1
# > nhis_heals_jk.sas7bdat %>% select(STND_Y, PERSON_ID) %>% distinct |> dim() #----
# [1] 6933649       2
# > nhis_heals_jk.sas7bdat.duplicated |> print()
# # A tibble: 2 × 13
# # Groups:   STND_Y, PERSON_ID [1]
#   STND_Y PERSON_ID SEX     AGE DTH_MDY  DTH_CODE1 DTH_CODE2 SIDO  IPSN_TYPE_CD CTRB_PT_TYPE_CD DFAB_GRD_CD DFAB_PTN_CD DFAB_REG_YM
#   <chr>  <chr>     <chr> <dbl> <chr>    <chr>     <chr>     <chr> <chr>        <chr>           <chr>       <chr>       <chr>      
# 1 2014   67877095  1        59 20141001 I21       ""        41    6            8               0           0           ""         
# 2 2014   67877095  1        59 20141001 I21       ""        41    6            8               0           0           "" 



fun.numeric.addFormated = function(input.numeric, digits = 3, nsmall = 0, big.mark=",") {
    if(is.numeric(input.numeric)) {
        attributes(input.numeric)$Formated = input.numeric %>% format(digits = digits, nsmall = nsmall, big.mark = big.mark) 
    }
    input.numeric
}

fun.data.primarykey_v2 <- function(inputdata, primarykey = c("PERSON_ID")) {
  
  # Check if primary key columns exist
  if (!all(primarykey %in% colnames(inputdata))) {
    stop("One or more of the specified primary key columns do not exist in the provided data.")
  }
  
  out = list()
  out$data.dim = inputdata |> dim() %>% fun.numeric.addFormated
  out$data.nrow = inputdata %>% nrow %>% fun.numeric.addFormated
  out$data.primarykey = primarykey
  out$data.primarykey.n_distinct = inputdata[primarykey] %>% distinct %>% nrow %>% fun.numeric.addFormated
  out$data.primarykey.n_distinct.diff = (as.numeric(out$data.primarykey.n_distinct) - as.numeric(out$data.nrow)) %>% fun.numeric.addFormated
  
  # Formatting proportion with better precision
  prop <- as.numeric(out$data.primarykey.n_distinct) / as.numeric(out$data.nrow)
  out$data.primarykey.n_distinct.prop = sprintf("%.3f", prop)
  
  # Check for duplicates
  duplicated_data = inputdata %>% dplyr::group_by_at(primarykey) %>% dplyr::filter(dplyr::n() > 1)
  if (nrow(duplicated_data) > 0) {
    out$data.primarykey.duplicated = duplicated_data
  } else {
    out$data.primarykey.duplicated = "No duplicated primary keys found"
  }
  
  out
}
df_example <- tibble(
  PERSON_ID = c(1, 2, 3, 4, 5, 1, 2),
  YEAR = c(2021, 2021, 2021, 2021, 2021, 2022, 2022)
)
fun.data.primarykey_v2(df_example, primarykey = c("PERSON_ID")) |> str() #----
fun.data.primarykey_v2(df_example, primarykey = c("PERSON_ID", "YEAR")) |> str() #----
# > fun.data.primarykey_v2(df_example, primarykey = c("PERSON_ID")) |> str() #----
# List of 7
#  $ data.dim                       : int [1:2] 7 2
#   ..- attr(*, "Formated")= chr [1:2] "7" "2"
#  $ data.nrow                      : int 7
#   ..- attr(*, "Formated")= chr "7"
#  $ data.primarykey                : chr "PERSON_ID"
#  $ data.primarykey.n_distinct     : int 5
#   ..- attr(*, "Formated")= chr "5"
#  $ data.primarykey.n_distinct.diff: num -2
#   ..- attr(*, "Formated")= chr "-2"
#  $ data.primarykey.n_distinct.prop: chr "0.714"
#  $ data.primarykey.duplicated     : gropd_df [4 × 2] (S3: grouped_df/tbl_df/tbl/data.frame)
#   ..$ PERSON_ID: num [1:4] 1 2 1 2
#   ..$ YEAR     : num [1:4] 2021 2021 2022 2022
#   ..- attr(*, "groups")= tibble [2 × 2] (S3: tbl_df/tbl/data.frame)
#   .. ..$ PERSON_ID: num [1:2] 1 2
#   .. ..$ .rows    : list<int> [1:2] 
#   .. .. ..$ : int [1:2] 1 3
#   .. .. ..$ : int [1:2] 2 4
#   .. .. ..@ ptype: int(0) 
#   .. ..- attr(*, ".drop")= logi TRUE
# > fun.data.primarykey_v2(df_example, primarykey = c("PERSON_ID", "YEAR")) |> str() #----
# List of 7
#  $ data.dim                       : int [1:2] 7 2
#   ..- attr(*, "Formated")= chr [1:2] "7" "2"
#  $ data.nrow                      : int 7
#   ..- attr(*, "Formated")= chr "7"
#  $ data.primarykey                : chr [1:2] "PERSON_ID" "YEAR"
#  $ data.primarykey.n_distinct     : int 7
#   ..- attr(*, "Formated")= chr "7"
#  $ data.primarykey.n_distinct.diff: num 0
#   ..- attr(*, "Formated")= chr "0"
#  $ data.primarykey.n_distinct.prop: chr "1.000"
#  $ data.primarykey.duplicated     : chr "No duplicated primary keys found"



fun.data.primarykey = function(inputdata, primarykey = c("PERSON_ID")) {
    out = list()
    out$data.dim = inputdata |> dim() %>% fun.numeric.addFormated
    out$data.nrow = inputdata %>% nrow %>% fun.numeric.addFormated
    out$data.primarykey = primarykey
    out$data.primarykey.n_distinct = inputdata[primarykey] %>% distinct %>% nrow %>% fun.numeric.addFormated
    out$data.primarykey.n_distinct.diff = (as.numeric(out$data.primarykey.n_distinct) - as.numeric(out$data.nrow)) %>% fun.numeric.addFormated
    out$data.primarykey.n_distinct.prop = (as.numeric(out$data.primarykey.n_distinct) / as.numeric(out$data.nrow)) %>% fun.numeric.addFormated
    out$data.primarykey.duplicated = inputdata %>% group_by_at(primarykey) %>% filter(n()>1)
    out
}

df_example <- tibble(
  PERSON_ID = c(1, 2, 3, 4, 5, 1, 2),
  YEAR = c(2021, 2021, 2021, 2021, 2021, 2022, 2022)
)
fun.data.primarykey(df_example, primarykey = c("PERSON_ID")) |> str() #----
fun.data.primarykey(df_example, primarykey = c("PERSON_ID", "YEAR")) |> str() #----
# > fun.data.primarykey(df_example, primarykey = c("PERSON_ID")) |> str() #----
# List of 7
#  $ data.dim                       : int [1:2] 7 2
#   ..- attr(*, "Formated")= chr [1:2] "7" "2"
#  $ data.nrow                      : int 7
#   ..- attr(*, "Formated")= chr "7"
#  $ data.primarykey                : chr "PERSON_ID"
#  $ data.primarykey.n_distinct     : int 5
#   ..- attr(*, "Formated")= chr "5"
#  $ data.primarykey.n_distinct.diff: num -2
#   ..- attr(*, "Formated")= chr "-2"
#  $ data.primarykey.n_distinct.prop: num 0.714
#   ..- attr(*, "Formated")= chr "0.714"
#  $ data.primarykey.duplicated     : gropd_df [4 × 2] (S3: grouped_df/tbl_df/tbl/data.frame)
#   ..$ PERSON_ID: num [1:4] 1 2 1 2
#   ..$ YEAR     : num [1:4] 2021 2021 2022 2022
#   ..- attr(*, "groups")= tibble [2 × 2] (S3: tbl_df/tbl/data.frame)
#   .. ..$ PERSON_ID: num [1:2] 1 2
#   .. ..$ .rows    : list<int> [1:2] 
#   .. .. ..$ : int [1:2] 1 3
#   .. .. ..$ : int [1:2] 2 4
#   .. .. ..@ ptype: int(0) 
#   .. ..- attr(*, ".drop")= logi TRUE
# > fun.data.primarykey(df_example, primarykey = c("PERSON_ID", "YEAR")) |> str() #----
# List of 7
#  $ data.dim                       : int [1:2] 7 2
#   ..- attr(*, "Formated")= chr [1:2] "7" "2"
#  $ data.nrow                      : int 7
#   ..- attr(*, "Formated")= chr "7"
#  $ data.primarykey                : chr [1:2] "PERSON_ID" "YEAR"
#  $ data.primarykey.n_distinct     : int 7
#   ..- attr(*, "Formated")= chr "7"
#  $ data.primarykey.n_distinct.diff: num 0
#   ..- attr(*, "Formated")= chr "0"
#  $ data.primarykey.n_distinct.prop: num 1
#   ..- attr(*, "Formated")= chr "1"
#  $ data.primarykey.duplicated     : gropd_df [0 × 2] (S3: grouped_df/tbl_df/tbl/data.frame)
#   ..$ PERSON_ID: num(0) 
#   ..$ YEAR     : num(0) 
#   ..- attr(*, "groups")= tibble [0 × 3] (S3: tbl_df/tbl/data.frame)
#   .. ..$ PERSON_ID: num(0) 
#   .. ..$ YEAR     : num(0) 
#   .. ..$ .rows    : list<int> [1:0] 
#  list()
#   .. .. ..@ ptype: int(0) 
#   .. ..- attr(*, ".drop")= logi TRUE


nhis_heals_jk.sas7bdat %>% fun.data.primarykey |> str(max.level = 1) %>% system.time #----
nhis_heals_jk.sas7bdat %>% fun.data.primarykey(c("PERSON_ID", "STND_Y")) |> str(max.level = 1) %>% system.time #----
# > nhis_heals_jk.sas7bdat %>% fun.data.primarykey |> str(max.level = 1) %>% system.time #----
# List of 7
#  $ data.dim                       : int [1:2] 6933650 13
#   ..- attr(*, "Formated")= chr [1:2] "6,933,650" "       13"
#  $ data.nrow                      : int 6933650
#   ..- attr(*, "Formated")= chr "6,933,650"
#  $ data.primarykey                : chr "PERSON_ID"
#  $ data.primarykey.n_distinct     : int 514866
#   ..- attr(*, "Formated")= chr "514,866"
#  $ data.primarykey.n_distinct.diff: num -6418784
#   ..- attr(*, "Formated")= chr "-6,418,784"
#  $ data.primarykey.n_distinct.prop: num 0.0743
#   ..- attr(*, "Formated")= chr "0.0743"
#  $ data.primarykey.duplicated     : gropd_df [6,933,616 × 13] (S3: grouped_df/tbl_df/tbl/data.frame)
#   ..- attr(*, "groups")= tibble [514,832 × 2] (S3: tbl_df/tbl/data.frame)
#   .. ..- attr(*, ".drop")= logi TRUE
#  사용자  시스템 elapsed 
#    3.31    0.11    5.50 
# > nhis_heals_jk.sas7bdat %>% fun.data.primarykey(c("PERSON_ID", "STND_Y")) |> str(max.level = 1) %>% system.time #----
# List of 7
#  $ data.dim                       : int [1:2] 6933650 13
#   ..- attr(*, "Formated")= chr [1:2] "6,933,650" "       13"
#  $ data.nrow                      : int 6933650
#   ..- attr(*, "Formated")= chr "6,933,650"
#  $ data.primarykey                : chr [1:2] "PERSON_ID" "STND_Y"
#  $ data.primarykey.n_distinct     : int 6933649
#   ..- attr(*, "Formated")= chr "6,933,649"
#  $ data.primarykey.n_distinct.diff: num -1
#   ..- attr(*, "Formated")= chr "-1"
#  $ data.primarykey.n_distinct.prop: num 1
#   ..- attr(*, "Formated")= chr "1"
#  $ data.primarykey.duplicated     : gropd_df [2 × 13] (S3: grouped_df/tbl_df/tbl/data.frame)
#   ..- attr(*, "groups")= tibble [1 × 3] (S3: tbl_df/tbl/data.frame)
#   .. ..- attr(*, ".drop")= logi TRUE
#  사용자  시스템 elapsed 
#   34.27    0.13   44.19 


?vars
?group_by_at
#@ end -----









library(tidyverse)

check_primary_key <- function(df, varname_ID, varname_Time) {
  
  # Filter out rows with missing values in varname_ID or varname_Time
  df_filtered <- df %>% filter(!is.na(df[[varname_ID]]) & !is.na(df[[varname_Time]]))
  
  # Calculating statistics
  total_rows <- nrow(df_filtered)
  distinct_ID <- n_distinct(df_filtered[[varname_ID]])
  distinct_Time <- n_distinct(df_filtered[[varname_Time]])
  distinct_ID_Time <- n_distinct(df_filtered %>% select(varname_ID, varname_Time))
  
  # Check for primary key
  primary_key <- "None"
  if (distinct_ID == total_rows) {
    primary_key <- varname_ID
  } else if (distinct_Time == total_rows) {
    primary_key <- varname_Time
  } else if (distinct_ID_Time == total_rows) {
    primary_key <- paste(varname_ID, varname_Time, sep="_")
  }
  
  list(
    nrow = total_rows,
    n_distinct_ID = distinct_ID,
    n_distinct_Time = distinct_Time,
    n_distinct_ID_Time = distinct_ID_Time,
    varname_primary_key = primary_key
  )
}

df_example <- data.frame(
  PERSON_ID = c(1, 2, 3, 4, 5, 1, 2),
  STND_Y = c(2021, 2021, 2021, 2021, 2021, 2022, 2022)
)

str(check_primary_key(df_example, "PERSON_ID", "STND_Y"))
# > str(check_primary_key(df_example, "PERSON_ID", "STND_Y"))
# List of 5
#  $ nrow               : int 7
#  $ n_distinct_ID      : int 5
#  $ n_distinct_Time    : int 2
#  $ n_distinct_ID_Time : int 7
#  $ varname_primary_key: chr "PERSON_ID_STND_Y"


#@ end -----


