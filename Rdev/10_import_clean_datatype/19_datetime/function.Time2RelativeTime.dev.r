# function.Time2RelativeTime.dev.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/19_datetime/function.Time2RelativeTime.dev.r




CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.Outcomes_DTH =
    CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.Outcomes_DTH %>% 
    mutate(time2DTH = as.numeric(replace_na(DTH_YM, as.Date("2014-01-01")) - as.Date("2008-12-31"))) #-----
CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.Outcomes_DTH %>% select(DTH_Y, DTH_YM, time2DTH) %>% summary #-----
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.Outcomes_DTH %>% select(DTH_Y, DTH_YM, time2DTH) %>% summary #-----
#      DTH_Y            DTH_YM              time2DTH   
#  Min.   :2009     Min.   :2009-03-31   Min.   :  90  
#  1st Qu.:2011     1st Qu.:2011-04-30   1st Qu.:1827  
#  Median :2012     Median :2012-04-30   Median :1827  
#  Mean   :2012     Mean   :2012-03-11   Mean   :1820  
#  3rd Qu.:2013     3rd Qu.:2013-03-31   3rd Qu.:1827  
#  Max.   :2013     Max.   :2013-12-31   Max.   :1827  
#  NA's   :280829   NA's   :280829                     

CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.Outcomes_DTH %>% select(matches("DTH_I")) %>% summary #-----
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.Outcomes_DTH %>% select(matches("DTH_I")) %>% summary #-----
#  DTH_I2025       DTH_I3052       DTH_I6069       DTH_I7079         DTH_I         DTH_I2079      
#  Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical  
#  FALSE:2856      FALSE:2884      FALSE:2781      FALSE:2960      FALSE:2524      FALSE:2574     
#  TRUE :113       TRUE :85        TRUE :188       TRUE :9         TRUE :431       TRUE :395      
#  NA's :280829    NA's :280829    NA's :280829    NA's :280829    NA's :280843    NA's :280829   

CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.Outcomes_DTH %>%
    mutate(  across(matches("DTH")&where(is.logical), replace_na, F)  )%>%
    select(matches("DTH_I")) %>% summary #-----
# > CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.Outcomes_DTH %>%
# +     mutate(  across(matches("DTH")&where(is.logical), replace_na, F)  )%>%
# +     select(matches("DTH_I")) %>% summary #-----
#  DTH_I2025       DTH_I3052       DTH_I6069       DTH_I7079         DTH_I         DTH_I2079      
#  Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical   Mode :logical  
#  FALSE:283685    FALSE:283713    FALSE:283610    FALSE:283789    FALSE:283367    FALSE:283403   
#  TRUE :113       TRUE :85        TRUE :188       TRUE :9         TRUE :431       TRUE :395      






dput(unlist(strsplit(Sys.getlocale(), ";")))
dput(l10n_info())
dput(.Platform)
dput(Sys.info())
packageVersion("tidyverse")
sessionInfo() #----
# > dput(unlist(strsplit(Sys.getlocale(), ";")))
# c("LC_COLLATE=English_United States.1252", "LC_CTYPE=English_United States.1252", 
# "LC_MONETARY=English_United States.1252", "LC_NUMERIC=C", "LC_TIME=English_United States.1252"
# )
# > dput(l10n_info())
# list(MBCS = FALSE, `UTF-8` = FALSE, `Latin-1` = TRUE, codepage = 1252L)
# > dput(.Platform)
# list(OS.type = "windows", file.sep = "/", dynlib.ext = ".dll", 
#     GUI = "RStudio", endian = "little", pkgType = "win.binary", 
#     path.sep = ";", r_arch = "x64")
# > dput(Sys.info())
# c(sysname = "Windows", release = "10 x64", version = "build 18362", 
# nodename = "LIVAI7-8700", machine = "x86-64", login = "mkim0", 
# user = "mkim0", effective_user = "mkim0")
# > packageVersion("tidyverse")
# [1] ‘1.2.1’
# > sessionInfo() #----
# R version 3.5.3 (2019-03-11)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 18362)
# 
# Matrix products: default
# 
# locale:
# [1] LC_COLLATE=English_United States.1252  LC_CTYPE=English_United States.1252    LC_MONETARY=English_United States.1252
# [4] LC_NUMERIC=C                           LC_TIME=English_United States.1252    
# 
# attached base packages:
# [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# other attached packages:
#  [1] forcats_0.4.0        stringr_1.4.0        dplyr_0.8.0.1        purrr_0.3.2          readr_1.3.1          tidyr_0.8.3         
#  [7] tibble_2.1.1         ggplot2_3.1.1        tidyverse_1.2.1      RevoUtils_11.0.3     RevoUtilsMath_11.0.0
# 
# loaded via a namespace (and not attached):
#  [1] zip_2.0.1        Rcpp_1.0.1       cellranger_1.1.0 pillar_1.3.1     compiler_3.5.3   plyr_1.8.4       tools_3.5.3     
#  [8] packrat_0.5.0    lubridate_1.7.4  jsonlite_1.6     nlme_3.1-137     gtable_0.3.0     lattice_0.20-38  pkgconfig_2.0.2 
# [15] rlang_0.3.4      openxlsx_4.1.0   cli_1.1.0        rstudioapi_0.10  haven_2.1.0      datapasta_3.0.0  withr_2.1.2     
# [22] xml2_1.2.0       httr_1.4.0       hms_0.4.2        generics_0.0.2   grid_3.5.3       tidyselect_0.2.5 glue_1.3.1      
# [29] R6_2.4.0         fansi_0.4.0      readxl_1.3.1     modelr_0.1.4     magrittr_1.5     backports_1.1.4  scales_1.0.0    
# [36] rvest_0.3.3      assertthat_0.2.1 colorspace_1.4-1 utf8_1.1.4       stringi_1.4.3    lazyeval_0.2.2   munsell_0.5.0   
# [43] broom_0.5.2      crayon_1.3.4  



ID_Eligible_Exposure.TargetTrial2v2.159vs266[1:5, ] %>% select(lmp, matches("Window4Exposure")) %>% add_column(Dummy = T, .before = 1) %>% add_column(rownum = 1:nrow(.), .before = 1) %>% rownames_to_column %>% dput #----
ID_lmp_Window4Exposure = structure(list(
    rowname = c("1", "2", "3", "4", "5")
    , rownum = 1:5
    , Dummy = c(TRUE, TRUE, TRUE, TRUE, TRUE)
    , lmp = structure(c(15741, 15001, 15018, 14999, 16389), class = "Date")
    , Window4Exposure.RxCONCEPT_NDC_insulin.ndDate = c(4L, 6L, 4L, 1L, 5L)
    , Window4Exposure.RxCONCEPT_NDC_insulin.minDate = structure(c(15826, 15084, 15093, 15159, 16458), class = "Date")
    , Window4Exposure.RxCONCEPT_NDC_insulin.maxDate = structure(c(15918, 15173, 15184, 15159, 16538), class = "Date")
    , Window4Exposure.RxCONCEPT_NDC_metformin.ndDate = c(2L, 1L, 1L, 4L, 2L)
    , Window4Exposure.RxCONCEPT_NDC_metformin.minDate = structure(c(15826, 15083, 15134, 15071, 16458), class = "Date")
    , Window4Exposure.RxCONCEPT_NDC_metformin.maxDate = structure(c(15919, 15083, 15134, 15155, 16548), class = "Date")
    , Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.ndDate = c(NA_integer_, NA_integer_, NA_integer_, NA_integer_, NA_integer_)
    , Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.minDate = structure(c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_), class = "Date")
    , Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.maxDate = structure(c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_), class = "Date")
), row.names = c(NA, -5L), class = c("tbl_df", "tbl", "data.frame") )


ID_lmp_Window4Exposure %>% str #----    
ID_lmp_Window4Exposure %>% mutate_if(lubridate::is.Date, function(vec) as.numeric(vec - .$lmp) ) %>% str #----
ID_lmp_Window4Exposure %>% mutate_if(lubridate::is.Date, function(vec) replace_na(vec, as.Date("9999-12-31"))) %>% str #----
# > ID_lmp_Window4Exposure %>% str #----    
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	5 obs. of  13 variables:
#  $ rowname                                         : chr  "1" "2" "3" "4" ...
#  $ rownum                                          : int  1 2 3 4 5
#  $ Dummy                                           : logi  TRUE TRUE TRUE TRUE TRUE
#  $ lmp                                             : Date, format: "2013-02-05" "2011-01-27" "2011-02-13" "2011-01-25" ...
#  $ Window4Exposure.RxCONCEPT_NDC_insulin.ndDate    : int  4 6 4 1 5
#  $ Window4Exposure.RxCONCEPT_NDC_insulin.minDate   : Date, format: "2013-05-01" "2011-04-20" "2011-04-29" "2011-07-04" ...
#  $ Window4Exposure.RxCONCEPT_NDC_insulin.maxDate   : Date, format: "2013-08-01" "2011-07-18" "2011-07-29" "2011-07-04" ...
#  $ Window4Exposure.RxCONCEPT_NDC_metformin.ndDate  : int  2 1 1 4 2
#  $ Window4Exposure.RxCONCEPT_NDC_metformin.minDate : Date, format: "2013-05-01" "2011-04-19" "2011-06-09" "2011-04-07" ...
#  $ Window4Exposure.RxCONCEPT_NDC_metformin.maxDate : Date, format: "2013-08-02" "2011-04-19" "2011-06-09" "2011-06-30" ...
#  $ Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.ndDate : int  NA NA NA NA NA
#  $ Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.minDate: Date, format: NA NA NA NA ...
#  $ Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.maxDate: Date, format: NA NA NA NA ...
# > ID_lmp_Window4Exposure %>% mutate_if(lubridate::is.Date, function(vec) as.numeric(vec - .$lmp) ) %>% str #----
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	5 obs. of  13 variables:
#  $ rowname                                         : chr  "1" "2" "3" "4" ...
#  $ rownum                                          : int  1 2 3 4 5
#  $ Dummy                                           : logi  TRUE TRUE TRUE TRUE TRUE
#  $ lmp                                             : num  0 0 0 0 0
#  $ Window4Exposure.RxCONCEPT_NDC_insulin.ndDate    : int  4 6 4 1 5
#  $ Window4Exposure.RxCONCEPT_NDC_insulin.minDate   : num  85 83 75 160 69
#  $ Window4Exposure.RxCONCEPT_NDC_insulin.maxDate   : num  177 172 166 160 149
#  $ Window4Exposure.RxCONCEPT_NDC_metformin.ndDate  : int  2 1 1 4 2
#  $ Window4Exposure.RxCONCEPT_NDC_metformin.minDate : num  85 82 116 72 69
#  $ Window4Exposure.RxCONCEPT_NDC_metformin.maxDate : num  178 82 116 156 159
#  $ Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.ndDate : int  NA NA NA NA NA
#  $ Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.minDate: num  NA NA NA NA NA
#  $ Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.maxDate: num  NA NA NA NA NA
# > ID_lmp_Window4Exposure %>% mutate_if(lubridate::is.Date, function(vec) replace_na(vec, as.Date("9999-12-31"))) %>% str #----
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	5 obs. of  13 variables:
#  $ rowname                                         : chr  "1" "2" "3" "4" ...
#  $ rownum                                          : int  1 2 3 4 5
#  $ Dummy                                           : logi  TRUE TRUE TRUE TRUE TRUE
#  $ lmp                                             : Date, format: "2013-02-05" "2011-01-27" "2011-02-13" "2011-01-25" ...
#  $ Window4Exposure.RxCONCEPT_NDC_insulin.ndDate    : int  4 6 4 1 5
#  $ Window4Exposure.RxCONCEPT_NDC_insulin.minDate   : Date, format: "2013-05-01" "2011-04-20" "2011-04-29" "2011-07-04" ...
#  $ Window4Exposure.RxCONCEPT_NDC_insulin.maxDate   : Date, format: "2013-08-01" "2011-07-18" "2011-07-29" "2011-07-04" ...
#  $ Window4Exposure.RxCONCEPT_NDC_metformin.ndDate  : int  2 1 1 4 2
#  $ Window4Exposure.RxCONCEPT_NDC_metformin.minDate : Date, format: "2013-05-01" "2011-04-19" "2011-06-09" "2011-04-07" ...
#  $ Window4Exposure.RxCONCEPT_NDC_metformin.maxDate : Date, format: "2013-08-02" "2011-04-19" "2011-06-09" "2011-06-30" ...
#  $ Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.ndDate : int  NA NA NA NA NA
#  $ Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.minDate: Date, format: "9999-12-31" "9999-12-31" "9999-12-31" "9999-12-31" ...
#  $ Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.maxDate: Date, format: "9999-12-31" "9999-12-31" "9999-12-31" "9999-12-31" ...




# ID_lmp_Window4Exposure %>% rename_if(
#     function(x) {get("tibble_vars", envir = parent.frame(n=2))[get("i", envir = parent.frame(n=2))] != "rowname"}
#     , function(chr) paste0("prefix.", chr) ) %>% str #----
ID_lmp_Window4Exposure %>% rename_at(vars(-rowname), funs(paste0("prefix.", c.)) ) %>% str #----
# > ID_lmp_Window4Exposure %>% rename_if(
# +     function(x) {get("tibble_vars", envir = parent.frame(n=2))[get("i", envir = parent.frame(n=2))] != "rowname"}
# +     , function(chr) paste0("prefix.", chr) ) %>% str #----
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	5 obs. of  13 variables:
#  $ rowname                                                : chr  "1" "2" "3" "4" ...
#  $ prefix.rownum                                          : int  1 2 3 4 5
#  $ prefix.Dummy                                           : logi  TRUE TRUE TRUE TRUE TRUE
#  $ prefix.lmp                                             : Date, format: "2013-02-05" "2011-01-27" "2011-02-13" "2011-01-25" ...
#  $ prefix.Window4Exposure.RxCONCEPT_NDC_insulin.ndDate    : int  4 6 4 1 5
#  $ prefix.Window4Exposure.RxCONCEPT_NDC_insulin.minDate   : Date, format: "2013-05-01" "2011-04-20" "2011-04-29" "2011-07-04" ...
#  $ prefix.Window4Exposure.RxCONCEPT_NDC_insulin.maxDate   : Date, format: "2013-08-01" "2011-07-18" "2011-07-29" "2011-07-04" ...
#  $ prefix.Window4Exposure.RxCONCEPT_NDC_metformin.ndDate  : int  2 1 1 4 2
#  $ prefix.Window4Exposure.RxCONCEPT_NDC_metformin.minDate : Date, format: "2013-05-01" "2011-04-19" "2011-06-09" "2011-04-07" ...
#  $ prefix.Window4Exposure.RxCONCEPT_NDC_metformin.maxDate : Date, format: "2013-08-02" "2011-04-19" "2011-06-09" "2011-06-30" ...
#  $ prefix.Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.ndDate : int  NA NA NA NA NA
#  $ prefix.Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.minDate: Date, format: NA NA NA NA ...
#  $ prefix.Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.maxDate: Date, format: NA NA NA NA ...













#@@@ debug 191017 -----
# ID_lmp_Window4Exposure %>% rename_if(
#     function(x) {get("tibble_vars", envir = parent.frame())[get("i", envir = parent.frame())] != "rowname"}
#     , function(chr) paste0("prefix.", chr)
# )
# # > ID_lmp_Window4Exposure %>% rename_if(
# # +     function(x) {get("tibble_vars", envir = parent.frame())[get("i", envir = parent.frame())] != "rowname"}
# # +     , function(chr) paste0("prefix.", chr)
# # + )
# # Error in get("tibble_vars", envir = parent.frame()) : 
# #   object 'tibble_vars' not found
# # Called from: get("tibble_vars", envir = parent.frame())


ID_lmp_Window4Exposure %>% rename_if(
    function(x) {browser()}
    , function(chr) paste0("prefix.", chr)
)


ls() #----
get(ls()[1]) #----

ls(envir = parent.frame()) #----
get( ls(envir = parent.frame()) [1], envir = parent.frame(n=2)) #----

ls(envir = parent.frame(n=2)) #----
get( ls(envir = parent.frame(n=2)) [1], envir = parent.frame(n=2)) #----

# Browse[1]> ls() #----
# [1] "x"
# Browse[1]> get(ls()[1]) #----
# [1] "1" "2" "3" "4" "5"

# Browse[1]> ls(envir = parent.frame()) #----
# character(0)
# Browse[1]> get( ls(envir = parent.frame()) [1], envir = parent.frame(n=2)) #----
# Error in get(ls(envir = parent.frame())[1], envir = parent.frame(n = 2)) : 
#   object 'NA' not found

# Browse[1]> ls(envir = parent.frame(n=2)) #----
# [1] "i"           "n"           "selected"    "tibble_vars"
# Browse[1]> get("i", envir = parent.frame(n=2)) #----
# [1] 1
# Browse[1]> get("n", envir = parent.frame(n=2)) #----
# [1] 13
# Browse[1]> get("selected", envir = parent.frame(n=2)) #----
#  [1] NA NA NA NA NA NA NA NA NA NA NA NA NA
# Browse[1]> get("tibble_vars", envir = parent.frame(n=2)) #----
#  [1] "rowname"                                          "rownum"                                          
#  [3] "Dummy"                                            "lmp"                                             
#  [5] "Window4Exposure.RxCONCEPT_NDC_insulin.ndDate"     "Window4Exposure.RxCONCEPT_NDC_insulin.minDate"   
#  [7] "Window4Exposure.RxCONCEPT_NDC_insulin.maxDate"    "Window4Exposure.RxCONCEPT_NDC_metformin.ndDate"  
#  [9] "Window4Exposure.RxCONCEPT_NDC_metformin.minDate"  "Window4Exposure.RxCONCEPT_NDC_metformin.maxDate" 
# [11] "Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.ndDate"  "Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.minDate"
# [13] "Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.maxDate"

# Browse[1]> ls(envir = parent.frame(n=3)) #----
# [1] "funs"
# Browse[1]> get("funs", envir = parent.frame(n=3)) #----
# <fun_calls>
# $ <fn>: (function (chr) ...
# Browse[1]> get("funs", envir = parent.frame(n=3))[[1]] #----
# <quosure>
# expr: ^<function(chr) paste0("prefix.", chr)>(.)
# env:  000002765A06FA00

# Browse[1]> ls(envir = parent.frame(n=4)) #----
# character(0)

# Browse[1]> ls(envir = parent.frame(n=5)) #----
# [1] "function_list" "k"             "value"  
# Browse[1]> get("function_list", envir = parent.frame(n=5)) #----
# [[1]]
# function (.) 
# rename_if(., function(x) {
#     browser()
# }, function(chr) paste0("prefix.", chr))
# 
# Browse[1]> get("k", envir = parent.frame(n=5)) #----
# [1] 1
# Browse[1]> get("value", envir = parent.frame(n=5)) #----
# # A tibble: 5 x 13
#   rowname rownum Dummy lmp        Window4Exposure~ Window4Exposure~ Window4Exposure~ Window4Exposure~ Window4Exposure~ Window4Exposure~
#   <chr>    <int> <lgl> <date>                <int> <date>           <date>                      <int> <date>           <date>          
# 1 1            1 TRUE  2013-02-05                4 2013-05-01       2013-08-01                      2 2013-05-01       2013-08-02      
# 2 2            2 TRUE  2011-01-27                6 2011-04-20       2011-07-18                      1 2011-04-19       2011-04-19      
# 3 3            3 TRUE  2011-02-13                4 2011-04-29       2011-07-29                      1 2011-06-09       2011-06-09      
# 4 4            4 TRUE  2011-01-25                1 2011-07-04       2011-07-04                      4 2011-04-07       2011-06-30      
# 5 5            5 TRUE  2014-11-15                5 2015-01-23       2015-04-13                      2 2015-01-23       2015-04-23      
# # ... with 3 more variables: Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.ndDate <int>,
# #   Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.minDate <date>, Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.maxDate <date>


# Browse[1]> eval(parse(text = "value"), envir = parent.frame(n=5)) #----
# # A tibble: 5 x 13
#   rowname rownum Dummy lmp        Window4Exposure~ Window4Exposure~ Window4Exposure~ Window4Exposure~ Window4Exposure~ Window4Exposure~
#   <chr>    <int> <lgl> <date>                <int> <date>           <date>                      <int> <date>           <date>          
# 1 1            1 TRUE  2013-02-05                4 2013-05-01       2013-08-01                      2 2013-05-01       2013-08-02      
# 2 2            2 TRUE  2011-01-27                6 2011-04-20       2011-07-18                      1 2011-04-19       2011-04-19      
# 3 3            3 TRUE  2011-02-13                4 2011-04-29       2011-07-29                      1 2011-06-09       2011-06-09      
# 4 4            4 TRUE  2011-01-25                1 2011-07-04       2011-07-04                      4 2011-04-07       2011-06-30      
# 5 5            5 TRUE  2014-11-15                5 2015-01-23       2015-04-13                      2 2015-01-23       2015-04-23      
# # ... with 3 more variables: Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.ndDate <int>,
# #   Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.minDate <date>, Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.maxDate <date>



#@ -----
# Browse[1]> get("tibble_vars", envir = parent.frame(n=2))[get("i", envir = parent.frame(n=2))] != "rowname" #----
# [1] FALSE


ID_lmp_Window4Exposure %>% rename_if(
    function(x) {get("tibble_vars", envir = parent.frame(n=2))[get("i", envir = parent.frame(n=2))] != "rowname"}
    , function(chr) paste0("prefix.", chr)
)
# > ID_lmp_Window4Exposure %>% rename_if(
# +     function(x) {get("tibble_vars", envir = parent.frame(n=2))[get("i", envir = parent.frame(n=2))] != "rowname"}
# +     , function(chr) paste0("prefix.", chr)
# + )
# # A tibble: 5 x 13
#   rowname prefix.rownum prefix.Dummy prefix.lmp prefix.Window4E~ prefix.Window4E~ prefix.Window4E~ prefix.Window4E~ prefix.Window4E~
#   <chr>           <int> <lgl>        <date>                <int> <date>           <date>                      <int> <date>          
# 1 1                   1 TRUE         2013-02-05                4 2013-05-01       2013-08-01                      2 2013-05-01      
# 2 2                   2 TRUE         2011-01-27                6 2011-04-20       2011-07-18                      1 2011-04-19      
# 3 3                   3 TRUE         2011-02-13                4 2011-04-29       2011-07-29                      1 2011-06-09      
# 4 4                   4 TRUE         2011-01-25                1 2011-07-04       2011-07-04                      4 2011-04-07      
# 5 5                   5 TRUE         2014-11-15                5 2015-01-23       2015-04-13                      2 2015-01-23      
# # ... with 4 more variables: prefix.Window4Exposure.RxCONCEPT_NDC_metformin.maxDate <date>,
# #   prefix.Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.ndDate <int>, prefix.Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.minDate <date>,
# #   prefix.Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.maxDate <date>



ID_lmp_Window4Exposure %>% rename_if(
    function(x) {get("tibble_vars", inherits = TRUE)[get("i", envir = parent.frame(n=2))] != "rowname"}
    , function(chr) paste0("prefix.", chr)
)

rename_if
# > rename_if
# function (.tbl, .predicate, .funs = list(), ...) 
# {
#     funs <- as_fun_list(.funs, enquo(.funs), caller_env(), ...)
#     .predicate <- as_fun_list(.predicate, enquo(.predicate), 
#         caller_env())
#     vars <- tbl_if_vars(.tbl, .predicate, caller_env(), .include_group_vars = TRUE)
#     syms <- vars_select_syms(vars, funs, .tbl, strict = TRUE)
#     rename(.tbl, !!!syms)
# }
# <bytecode: 0x000002765e1c1aa0>
# <environment: namespace:dplyr>



#@@@ debug -----
ID_lmp_Window4Exposure %>% rename_if(.predicate = function(v) {(v == "rowname")}, toupper)
# > ID_lmp_Window4Exposure %>% rename_if(.predicate = function(v) {(v == "rowname")}, toupper)
# Error in selected[[i]] <- .p(.tbl[[tibble_vars[[i]]]], ...) : 
#   more elements supplied than there are to replace

# https://github.com/tidyverse/dplyr/issues/1977 =====





#@@@ dev 191016 -----
ID_lmp_Window4Exposure %>% mutate_if(lubridate::is.Date, function(vec) {
    vec - get("value", envir = parent.frame(n=5))$lmp
})
# > ID_lmp_Window4Exposure %>% mutate_if(lubridate::is.Date, function(vec) {
# +     vec - get("value", envir = parent.frame(n=5))$lmp
# + })
# Error in get("value", envir = parent.frame(n = 5)) : 
#   object 'value' not found
# Called from: get("value", envir = parent.frame(n = 5))



ID_lmp_Window4Exposure %>% mutate_if(lubridate::is.Date, function(vec) {
    browser()
})


ls() #----
get(ls()[1]) #----

ls(envir = parent.frame()) #----
get( ls(envir = parent.frame()) [1], envir = parent.frame(n=2)) #----

ls(envir = parent.frame(n=2)) #----
get( ls(envir = parent.frame(n=2)) [1], envir = parent.frame(n=2)) #----

# Browse[1]> ls() #----
# [1] "vec"
# Browse[1]> get(ls()[1]) #----
# [1] "2013-02-05" "2011-01-27" "2011-02-13" "2011-01-25" "2014-11-15"

# Browse[1]> ls(envir = parent.frame()) #----
# [1] "~"
# Browse[1]> get( ls(envir = parent.frame()) [1], envir = parent.frame(n=2)) #----
# .Primitive("~")

# Browse[1]> ls(envir = parent.frame(n=2)) #----
# [1] "df"                                                              "ID_Eligible_Exposure.TargetTrial2v2.159vs266"                   
# [3] "ID_Eligible_Exposure.TargetTrial2v2.159vs266.Outcome.Covariates" "ID_lmp_Window4Exposure"                                         
# [5] "path4read"                                                       "path4write"                                                     
# [7] "tribble_paste"                                                  




#@@@ dev 191018 -----

ID_lmp_Window4Exposure %>% mutate_if(lubridate::is.Date, function(vec) as.numeric(vec - .$lmp) )
# > ID_lmp_Window4Exposure %>% mutate_if(lubridate::is.Date, function(vec) as.numeric(vec - .$lmp) )
# # A tibble: 5 x 13
#   rowname rownum Dummy   lmp Window4Exposure~ Window4Exposure~ Window4Exposure~ Window4Exposure~ Window4Exposure~ Window4Exposure~
#   <chr>    <int> <lgl> <dbl>            <int>            <dbl>            <dbl>            <int>            <dbl>            <dbl>
# 1 1            1 TRUE      0                4               85              177                2               85              178
# 2 2            2 TRUE      0                6               83              172                1               82               82
# 3 3            3 TRUE      0                4               75              166                1              116              116
# 4 4            4 TRUE      0                1              160              160                4               72              156
# 5 5            5 TRUE      0                5               69              149                2               69              159
# # ... with 3 more variables: Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.ndDate <int>,
# #   Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.minDate <dbl>, Window4Exposure.RxCONCEPT_NDC_SU_TZD_etc.maxDate <dbl>




#@ end -----

