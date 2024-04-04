#@ f_df_path.filename_recursive.source.r

library(tidyverse)
dir() %>% str #----
dir(recursive = T) %>% str #----
dir("Rdev", recursive = T) %>% str #----
# > dir() %>% str #----
#  chr [1:34] "-info" "-tmp" "-void.r" "[[Stat]] CRAN R - Shortcut.lnk" "bfg-1.13.0.jar" "bfg.txt" "bfg.zip" ...
# > dir(recursive = T) %>% str #----
#  chr [1:441] "-info/facets_2017 - annotate (3) tableone_by_P_WH.ge.5.zip" ...
# > dir("Rdev", recursive = T) %>% str #----
#  chr [1:231] "-dev/object.coxph from analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample -dev.r" ...


# Function to add '.TOUPPER' columns to a data frame
f_df_add_TOUPPER <- function(df) {
    # Function to uppercase and retain factor if original column was a factor
    uppercase_factor <- function(x) {
        if (is.factor(x)) {
            factor(toupper(levels(x))[x])
        } else {
            toupper(x)
        }
    }
    df %>%
        mutate(across(.cols = c(where(is.character), where(is.factor)),
                      .fns = list(TOUPPER = ~uppercase_factor(.)),
                      .names = "{.col}.TOUPPER"))
}

#@ df_path.filename1 =====
df_path.filename1 = tibble(full_path = c(dir(), dir("Rdev", recursive = T))) %>%
    mutate(
        path.dirname = dirname(full_path),
        path.basename = basename(full_path),
        path.basename.ext = tools::file_ext(path.basename)
    ) %>% 
    f_df_add_TOUPPER %>% 
    arrange(path.dirname, path.basename) %>% 
    select(matches("TOUPPER"))
df_path.filename1 %>% select(-matches("full_path"))
# > df_path.filename1 %>% select(-matches("full_path"))
# # A tibble: 266 × 3
#    path.dirname.TOUPPER path.basename.TOUPPER                                                       path.basename.ext.TO…¹
#    <chr>                <chr>                                                                       <chr>                 
#  1 -DEV                 OBJECT.COXPH FROM ANALYTICDF_C24.DROP_PMHX_NEGATIVETIME._5YR.CUT.01SAMPLE … "R"                   
#  2 .                    -INFO                                                                       ""                    
#  3 .                    -TMP                                                                        ""                    
#  4 .                    -VOID.R                                                                     "R"                   
#  5 .                    BLANK) ENV.CUSTOM.FUN.T.TRIBBLE_CONSTRUCT.RMD - SHORTCUT.LNK                "LNK"                 
#  6 .                    BLANK.RMD - SHORTCUT.LNK                                                    "LNK"                 
#  7 .                    ENCODING.TXT                                                                "TXT"                 
#  8 .                    README.MD                                                                   "MD"                  
#  9 .                    RSTUDIO.CLOUD SET UP.R                                                      "R"                   
# 10 .                    RSTUDIO.CLOUD.RPROJ                                                         "RPROJ"               
# # ℹ 256 more rows
# # ℹ abbreviated name: ¹​path.basename.ext.TOUPPER
# # ℹ Use `print(n = ...)` to see more rows



# df_path.filename1$path.dirname.TOUPPER %>% unique %>% as.list %>% str #----
df_path.filename1$path.dirname.TOUPPER %>% table #----
df_path.filename1$path.basename.ext.TOUPPER %>% table #----
# > df_path.filename1$path.dirname.TOUPPER %>% table #----
# .
#                                                                      -DEV 
#                                                                         1 
#                                                                         . 
#                                                                        53 
#                                                           00_BASE_PROGRAM 
#                                                                        41 
#                                                00_PROTOCOL/01_SAMPLE_SIZE 
#                                                                         6 
#                                      10_IMPORT_CLEAN_DATATYPE/11_METADATA 
#                                                                         2 
#                                  10_IMPORT_CLEAN_DATATYPE/12_IMPORT_FILES 
#                                                                         8 
#                                 10_IMPORT_CLEAN_DATATYPE/12_IMPORT_SQLITE 
#                                                                         3 
#                             10_IMPORT_CLEAN_DATATYPE/12_IMPORT_VOCABULARY 
#                                                                         3 
#                                    10_IMPORT_CLEAN_DATATYPE/13_DUPLICATED 
#                                                                         2 
#                                 10_IMPORT_CLEAN_DATATYPE/13_MISSING_VALUE 
#                                                                         6 
#                                    10_IMPORT_CLEAN_DATATYPE/13_SPLIT_FOLD 
#                                                                         1 
#                                 10_IMPORT_CLEAN_DATATYPE/15_CLEANING_TEXT 
#                                                                         9 
#                                 10_IMPORT_CLEAN_DATATYPE/15_CLEANING_TIME 
#                                                                         4 
#                            10_IMPORT_CLEAN_DATATYPE/16_CATEGORICAL_FACTOR 
#                                                                         9 
#                        10_IMPORT_CLEAN_DATATYPE/17_CATEGORICAL_INDICATORS 
#                                                                         3 
#                           10_IMPORT_CLEAN_DATATYPE/18_DICHOTOMOUS_LOGICAL 
#                                                                         4 
#                                      10_IMPORT_CLEAN_DATATYPE/19_DATETIME 
#                                                                         1 
#                               10_IMPORT_CLEAN_DATATYPE/19_NUMERIC_INTEGER 
#                                                                         4 
#                                       10_IMPORT_CLEAN_DATATYPE/ARRAY_LIST 
#                                                                         5 
#                                                    20_TIDY_GROUP_BY_MATCH 
#                                                                         2 
#                               20_TIDY_GROUP_BY_MATCH/23_GROUP_BY_PERSONID 
#                                                                         3 
#                                20_TIDY_GROUP_BY_MATCH/25_STUDY_POPULATION 
#                                                                         3 
#                                           20_TIDY_GROUP_BY_MATCH/27_MATCH 
#                                                                         5 
#                                            30_TRANSFORM_SCALE_CATEGORICAL 
#                                                                         6 
#                                 40_VISUALIZE_EXPLORE_BIVARIATE_STRATIFIED 
#                                                                         4 
#                      40_VISUALIZE_EXPLORE_BIVARIATE_STRATIFIED/43_NETWORK 
#                                                                         8 
#                          40_VISUALIZE_EXPLORE_BIVARIATE_STRATIFIED/44_MAP 
#                                                                        12 
#           40_VISUALIZE_EXPLORE_BIVARIATE_STRATIFIED/45_BIVARIATE_MEASURES 
#                                                                         4 
# 40_VISUALIZE_EXPLORE_BIVARIATE_STRATIFIED/47_BIVARIATE_PARTIAL_STRATIFIED 
#                                                                         4 
#                                               50_MODEL_FORMULA_EVALUATION 
#                                                                         3 
#                              50_MODEL_FORMULA_EVALUATION/51_MODEL_FORMULA 
#                                                                         2 
#                            50_MODEL_FORMULA_EVALUATION/53_MODEL_SELECTION 
#                                                                         2 
#                             50_MODEL_FORMULA_EVALUATION/55_MODEL_WEIGHTED 
#                                                                         4 
#                            50_MODEL_FORMULA_EVALUATION/56_MODEL_BOOTSTRAP 
#                                                                         3 
#                           50_MODEL_FORMULA_EVALUATION/57_MODEL_TIME2EVENT 
#                                                                         8 
#                           50_MODEL_FORMULA_EVALUATION/57_MODEL_TRAJECTORY 
#                                                                         1 
#                           50_MODEL_FORMULA_EVALUATION/59_MODEL_EVALUATION 
#                                                                         6 
#                                              60_COMMUNICATE_REPORT_EXPORT 
#                                                                        21 
# > df_path.filename1$path.basename.ext.TOUPPER %>% table #----
# .
#         JAR   LNK    MD   PDF     R RDATA   RMD RPROJ   TXT   URL  XLSX   ZIP 
#    11     1    13     1     8   213     1     5     2     3     1     1     6 








#@ gitignore = read_lines(".gitignore") =====
gitignore = read_lines(".gitignore")
gitignore %>% dput
# > gitignore %>% dput
c(".Rproj.user", ".Rhistory", ".RData", ".Ruserdata", "", "*.zip",
"*.Rproj", ".gitignore", "", "MH)*.r", "*.lnk", "*alias", "",
"*.ppt", "*.pptx", "*.xls", "*.xlsx", "*.doc", "*.docx", "",
"*- void*.*", "*-void*.*", "*- info.*", "*-info.*", "*-dev*.*",
"*debug*.*", "-tmp", "*- tmp*.*", "*-tmp*.*", "", "*-log*.*",
"", "*.rtf", "")


f_path.basename.extract_non_alphanumeric_chars <- function(input_vec) {
  path.basename.extract_non_alnum <- function(string) {
    positions <- gregexpr("[^[:alnum:]]", string)  # Match any non-alphanumeric character
    non_alnum_chars <- regmatches(string, positions)
    unlist(non_alnum_chars)  # Unlist to get a vector of non-alphanumeric characters
  }
  
  # Use map to apply path.basename.extract_non_alnum to each element and maintain list structure
  result_list <- map(input_vec, path.basename.extract_non_alnum)
  
  # Set the names of the list elements to match the input vector
  names(result_list) <- input_vec
  
  result_list
}

# # Example usage of the function
# input_vec <- c("Hello, World!", "R4 & Python?", "123% Ready!", "12345")
# result <- f_path.basename.extract_non_alphanumeric_chars(input_vec)
# result %>% dput
# list(`Hello, World!` = c(",", " ", "!"), `R4 & Python?` = c(" ", "&", " ", "?"), `123% Ready!` = c("%", " ", "!"), `12345` = character(0))

c(".Rproj.user", ".Rhistory", ".RData", ".Ruserdata", "", "*.zip",
"*.Rproj", ".gitignore", "", "MH)*.r", "*.lnk", "*alias", "",
"*.ppt", "*.pptx", "*.xls", "*.xlsx", "*.doc", "*.docx", "",
"*- void*.*", "*-void*.*", "*- info.*", "*-info.*", "*-dev*.*",
"*debug*.*", "-tmp", "*- tmp*.*", "*-tmp*.*", "", "*-log*.*",
"", "*.rtf", "") %>% f_path.basename.extract_non_alphanumeric_chars %>% unlist %>% unique %>% dput
c(".", "*", ")", "-", " ")



#@ gitignore_escaped =====
gitignore_escaped = gitignore[gitignore != ""] %>% 
    str_replace_all("\\.", "\\\\.") %>% # Caution: dot should be handled before asterisk~!
    str_replace_all("\\*", "\\.\\*") %>%
    str_replace_all("\\)", "\\\\)") %>% 
    str_replace_all("\\-", "\\\\-") %>% 
    # str_replace_all("\\ ", "\\\\ ") %>%  # spaces  are generally treated as literal spaces in regular expressions 
    unique 
gitignore_escaped %>% dput
# c("\\.Rproj\\.user", "\\.Rhistory", "\\.RData", "\\.Ruserdata", 
# ".*\\.zip", ".*\\.Rproj", "\\.gitignore", "MH\\).*\\.r", ".*\\.lnk", 
# ".*alias", ".*\\.ppt", ".*\\.pptx", ".*\\.xls", ".*\\.xlsx", 
# ".*\\.doc", ".*\\.docx", ".*\\- void.*\\..*", ".*\\-void.*\\..*", 
# ".*\\- info\\..*", ".*\\-info\\..*", ".*\\-dev.*\\..*", ".*debug.*\\..*", 
# "\\-tmp", ".*\\- tmp.*\\..*", ".*\\-tmp.*\\..*", ".*\\-log.*\\..*", 
# ".*\\.rtf")
gitignore_escaped %>% str_which("doc|xls|ppt")
gitignore_escaped_select = gitignore_escaped %>% {.[-str_which(., "doc|xls|ppt")]}
gitignore_escaped_select %>% dput #----
c("\\.Rproj\\.user", "\\.Rhistory", "\\.RData", "\\.Ruserdata", 
".*\\.zip", ".*\\.Rproj", "\\.gitignore", "MH\\).*\\.r", ".*\\.lnk", 
".*alias", ".*\\- void.*\\..*", ".*\\-void.*\\..*", ".*\\- info\\..*", 
".*\\-info\\..*", ".*\\-dev.*\\..*", ".*debug.*\\..*", "\\-tmp", 
".*\\- tmp.*\\..*", ".*\\-tmp.*\\..*", ".*\\-log.*\\..*", ".*\\.rtf"
)
# for (i_regex in unique(gitignore_escaped_select)) {
#     df <- df_path.filename1 %>% filter(!str_detect(path.basename, i_regex))
# }

gitignore_escaped_select %>% paste(collapse = "|") #----
# [1] "\\.Rproj\\.user|\\.Rhistory|\\.RData|\\.Ruserdata|.*\\.zip|.*\\.Rproj|\\.gitignore|MH\\).*\\.r|.*\\.lnk|.*alias|.*\\- void.*\\..*|.*\\-void.*\\..*|.*\\- info\\..*|.*\\-info\\..*|.*\\-dev.*\\..*|.*debug.*\\..*|\\-tmp|.*\\- tmp.*\\..*|.*\\-tmp.*\\..*|.*\\-log.*\\..*|.*\\.rtf"


gitignore_escaped_select %>% toupper %>% dput #----
gitignore_escaped_select %>% toupper %>% paste(collapse = "|") #----
# > gitignore_escaped_select %>% toupper %>% dput #----
# c("\\.RPROJ\\.USER", "\\.RHISTORY", "\\.RDATA", "\\.RUSERDATA", 
# ".*\\.ZIP", ".*\\.RPROJ", "\\.GITIGNORE", "MH\\).*\\.R", ".*\\.LNK", 
# ".*ALIAS", ".*\\- VOID.*\\..*", ".*\\-VOID.*\\..*", ".*\\- INFO\\..*", 
# ".*\\-INFO\\..*", ".*\\-DEV.*\\..*", ".*DEBUG.*\\..*", "\\-TMP", 
# ".*\\- TMP.*\\..*", ".*\\-TMP.*\\..*", ".*\\-LOG.*\\..*", ".*\\.RTF"
# )
# > gitignore_escaped_select %>% toupper %>% paste(collapse = "|") #----
# [1] "\\.RPROJ\\.USER|\\.RHISTORY|\\.RDATA|\\.RUSERDATA|.*\\.ZIP|.*\\.RPROJ|\\.GITIGNORE|MH\\).*\\.R|.*\\.LNK|.*ALIAS|.*\\- VOID.*\\..*|.*\\-VOID.*\\..*|.*\\- INFO\\..*|.*\\-INFO\\..*|.*\\-DEV.*\\..*|.*DEBUG.*\\..*|\\-TMP|.*\\- TMP.*\\..*|.*\\-TMP.*\\..*|.*\\-LOG.*\\..*|.*\\.RTF"







#@ df_path.filename2 ====
df_path.filename1 %>% str #----
df_path.filename2 = df_path.filename1 %>% filter(!str_detect(path.basename.TOUPPER, gitignore_escaped_select %>% toupper %>% paste(collapse = "|")))
df_path.filename2 %>% str #----
# > df_path.filename1 %>% str #----
# tibble [266 × 4] (S3: tbl_df/tbl/data.frame)
#  $ full_path.TOUPPER        : chr [1:266] "-DEV/OBJECT.COXPH FROM ANALYTICDF_C24.DROP_PMHX_NEGATIVETIME._5YR.CUT.01SAMPLE -DEV.R" "-INFO" "-TMP" "-VOID.R" ...
#  $ path.dirname.TOUPPER     : chr [1:266] "-DEV" "." "." "." ...
#  $ path.basename.TOUPPER    : chr [1:266] "OBJECT.COXPH FROM ANALYTICDF_C24.DROP_PMHX_NEGATIVETIME._5YR.CUT.01SAMPLE -DEV.R" "-INFO" "-TMP" "-VOID.R" ...
#  $ path.basename.ext.TOUPPER: chr [1:266] "R" "" "" "R" ...
# > df_path.filename2 = df_path.filename1 %>% filter(!str_detect(path.basename.TOUPPER, gitignore_escaped_select %>% toupper %>% paste(collapse = "|")))
# > df_path.filename2 %>% str #----
# tibble [226 × 4] (S3: tbl_df/tbl/data.frame)
#  $ full_path.TOUPPER        : chr [1:226] "-INFO" "ENCODING.TXT" "README.MD" "RSTUDIO.CLOUD SET UP.R" ...
#  $ path.dirname.TOUPPER     : chr [1:226] "." "." "." "." ...
#  $ path.basename.TOUPPER    : chr [1:226] "-INFO" "ENCODING.TXT" "README.MD" "RSTUDIO.CLOUD SET UP.R" ...
#  $ path.basename.ext.TOUPPER: chr [1:226] "" "TXT" "MD" "R" ...

setdiff(df_path.filename1, df_path.filename2) #----
# > setdiff(df_path.filename1, df_path.filename2) #----
# # A tibble: 40 × 4
#    full_path.TOUPPER                                     path.dirname.TOUPPER path.basename.TOUPPER path.basename.ext.TO…¹
#    <chr>                                                 <chr>                <chr>                 <chr>                 
#  1 -DEV/OBJECT.COXPH FROM ANALYTICDF_C24.DROP_PMHX_NEGA… -DEV                 OBJECT.COXPH FROM AN… "R"                   
#  2 -TMP                                                  .                    -TMP                  ""                    
#  3 -VOID.R                                               .                    -VOID.R               "R"                   
#  4 BLANK) ENV.CUSTOM.FUN.T.TRIBBLE_CONSTRUCT.RMD - SHOR… .                    BLANK) ENV.CUSTOM.FU… "LNK"                 
#  5 BLANK.RMD - SHORTCUT.LNK                              .                    BLANK.RMD - SHORTCUT… "LNK"                 
#  6 RSTUDIO.CLOUD.RPROJ                                   .                    RSTUDIO.CLOUD.RPROJ   "RPROJ"               
#  7 [[STAT]] CRAN R - SHORTCUT.LNK                        .                    [[STAT]] CRAN R - SH… "LNK"                 
#  8 BFG.ZIP                                               .                    BFG.ZIP               "ZIP"                 
#  9 ENV.CUSTOM.FUN.T.TRIBBLE_CONSTRUCT.RDATA              .                    ENV.CUSTOM.FUN.T.TRI… "RDATA"               
# 10 GITHUB_TIDYSTAT.RPROJ                                 .                    GITHUB_TIDYSTAT.RPROJ "RPROJ"               
# # ℹ 30 more rows
# # ℹ abbreviated name: ¹​path.basename.ext.TOUPPER
# # ℹ Use `print(n = ...)` to see more rows


df_path.filename2 %>% filter(path.dirname.TOUPPER == ".") #----
# > df_path.filename2 %>% filter(path.dirname.TOUPPER == ".") #----
# # A tibble: 39 × 4
#    full_path.TOUPPER                             path.dirname.TOUPPER path.basename.TOUPPER         path.basename.ext.TO…¹
#    <chr>                                         <chr>                <chr>                         <chr>                 
#  1 -INFO                                         .                    -INFO                         ""                    
#  2 ENCODING.TXT                                  .                    ENCODING.TXT                  "TXT"                 
#  3 README.MD                                     .                    README.MD                     "MD"                  
#  4 RSTUDIO.CLOUD SET UP.R                        .                    RSTUDIO.CLOUD SET UP.R        "R"                   
#  5 RDEV                                          .                    RDEV                          ""                    
#  6 REMOVING SENSITIVE DATA FROM A REPOSITORY.URL .                    REMOVING SENSITIVE DATA FROM… "URL"                 
#  7 RMD                                           .                    RMD                           ""                    
#  8 RPLOT                                         .                    RPLOT                         ""                    
#  9 BFG-1.13.0.JAR                                .                    BFG-1.13.0.JAR                "JAR"                 
# 10 BFG.TXT                                       .                    BFG.TXT                       "TXT"                 
# # ℹ 29 more rows
# # ℹ abbreviated name: ¹​path.basename.ext.TOUPPER
# # ℹ Use `print(n = ...)` to see more rows



df_path.filename2 %>% filter(path.basename.ext.TOUPPER == "") #----
# > df_path.filename2 %>% filter(path.basename.ext.TOUPPER == "") #----
# # A tibble: 9 × 4
#   full_path.TOUPPER path.dirname.TOUPPER path.basename.TOUPPER path.basename.ext.TOUPPER
#   <chr>             <chr>                <chr>                 <chr>                    
# 1 -INFO             .                    -INFO                 ""                       
# 2 RDEV              .                    RDEV                  ""                       
# 3 RMD               .                    RMD                   ""                       
# 4 RPLOT             .                    RPLOT                 ""                       
# 5 DATA              .                    DATA                  ""                       
# 6 EXAMPLES          .                    EXAMPLES              ""                       
# 7 OTHER             .                    OTHER                 ""                       
# 8 TESTS             .                    TESTS                 ""                       
# 9 VIGNETTES         .                    VIGNETTES             ""                       


df_path.filename2 %>% filter(path.dirname.TOUPPER == "Rdev" %>% toupper) #----
# > df_path.filename2 %>% filter(path.dirname == "Rdev") #----
# # A tibble: 0 × 4
# # ℹ 4 variables: full_path <chr>, path.dirname <chr>, path.basename <chr>, path.basename.ext <chr>


df_path.filename2$path.basename.ext.TOUPPER %>% table
# > df_path.filename2$path.basename.ext.TOUPPER %>% table
# .
#       JAR   MD  PDF    R  RMD  TXT  URL XLSX 
#    9    1    1    8  198    5    2    1    1 

df_path.filename2 %>% filter(path.basename.ext.TOUPPER == "xlsx" %>% toupper) #----
df_path.filename2 %>% filter(full_path.TOUPPER %>% str_detect("xlsx" %>% toupper)) #----
# > df_path.filename2 %>% filter(path.basename.ext.TOUPPER == "xlsx" %>% toupper) #----
# # A tibble: 1 × 4
#   full_path.TOUPPER                path.dirname.TOUPPER path.basename.TOUPPER            path.basename.ext.TOUPPER
#   <chr>                            <chr>                <chr>                            <chr>                    
# 1 SVYGLM 10VAR VS 10VAR.INTER.XLSX .                    SVYGLM 10VAR VS 10VAR.INTER.XLSX XLSX                     
# > df_path.filename2 %>% filter(full_path.TOUPPER %>% str_detect("xlsx" %>% toupper)) #----
# # A tibble: 2 × 4
#   full_path.TOUPPER                                      path.dirname.TOUPPER path.basename.TOUPPER path.basename.ext.TO…¹
#   <chr>                                                  <chr>                <chr>                 <chr>                 
# 1 SVYGLM 10VAR VS 10VAR.INTER.XLSX                       .                    SVYGLM 10VAR VS 10VA… XLSX                  
# 2 60_COMMUNICATE_REPORT_EXPORT/FUNCTION.LIST_df_path.filename2XLSX.SO… 60_COMMUNICATE_REPO… FUNCTION.LIST_df_path.filename2XLS… R                     
# # ℹ abbreviated name: ¹​path.basename.ext.TOUPPER

df_path.filename2 %>% filter(path.basename.ext.TOUPPER == "rmd" %>% toupper) #----
# > df_path.filename2 %>% filter(path.basename.ext.TOUPPER == "rmd" %>% toupper) #----
# # A tibble: 5 × 4
#   full_path.TOUPPER                                      path.dirname.TOUPPER path.basename.TOUPPER path.basename.ext.TO…¹
#   <chr>                                                  <chr>                <chr>                 <chr>                 
# 1 ENV.CUSTOM.FUN.T.TRIBBLE_CONSTRUCT.RMD                 .                    ENV.CUSTOM.FUN.T.TRI… RMD                   
# 2 50_MODEL_FORMULA_EVALUATION/57_MODEL_TIME2EVENT/ANALY… 50_MODEL_FORMULA_EV… ANALYTICDATASET$TIME… RMD                   
# 3 50_MODEL_FORMULA_EVALUATION/57_MODEL_TIME2EVENT/ANALY… 50_MODEL_FORMULA_EV… ANALYTICDATASET.CENS… RMD                   
# 4 50_MODEL_FORMULA_EVALUATION/57_MODEL_TIME2EVENT/ANALY… 50_MODEL_FORMULA_EV… ANALYTICDATASET.CENS… RMD                   
# 5 50_MODEL_FORMULA_EVALUATION/57_MODEL_TIME2EVENT/ANALY… 50_MODEL_FORMULA_EV… ANALYTICDATASET.CENS… RMD                   
# # ℹ abbreviated name: ¹​path.basename.ext.TOUPPER

df_path.filename2 %>% filter(path.basename.ext.TOUPPER == "r" %>% toupper) #----
# > df_path.filename2 %>% filter(path.basename.ext.TOUPPER == "r" %>% toupper) #----
# # A tibble: 198 × 4
#    full_path.TOUPPER                               path.dirname.TOUPPER path.basename.TOUPPER       path.basename.ext.TO…¹
#    <chr>                                           <chr>                <chr>                       <chr>                 
#  1 RSTUDIO.CLOUD SET UP.R                          .                    RSTUDIO.CLOUD SET UP.R      R                     
#  2 DATA.VARIABLE.DATE.NID_TRUE_NA.SOURCE.R         .                    DATA.VARIABLE.DATE.NID_TRU… R                     
#  3 DATA.VARIABLE.DATE.NID_ANYTRUE_ALLTRUE.SOURCE.R .                    DATA.VARIABLE.DATE.NID_ANY… R                     
#  4 ENV.CUSTOM.FUN.T.TRIBBLE_CONSTRUCT.SOURCE.R     .                    ENV.CUSTOM.FUN.T.TRIBBLE_C… R                     
#  5 F_DF.ADD_TOUPPER.SOURCE.R                       .                    F_DF.ADD_TOUPPER.SOURCE.R   R                     
#  6 F_DF_DIR_RECURSIVE.SOURCE.R                     .                    F_DF_DIR_RECURSIVE.SOURCE.R R                     
#  7 F_EXTRACT_NON_ALPHANUMERIC_CHARS.SOURCE.R       .                    F_EXTRACT_NON_ALPHANUMERIC… R                     
#  8 FLOWCHART_INCLUSION_EXCLUSIONS.SOURCE.R         .                    FLOWCHART_INCLUSION_EXCLUS… R                     
#  9 FUN.DF.TRANSPOSE.SOURCE.R                       .                    FUN.DF.TRANSPOSE.SOURCE.R   R                     
# 10 FUN.PATH_FILES_SIZE.SOURCE.R                    .                    FUN.PATH_FILES_SIZE.SOURCE… R                     
# # ℹ 188 more rows
# # ℹ abbreviated name: ¹​path.basename.ext.TOUPPER
# # ℹ Use `print(n = ...)` to see more rows


#@ end ----
