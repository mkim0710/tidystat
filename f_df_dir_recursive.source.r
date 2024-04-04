#@ f_df_path.dirname_recursive.source.r

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


#@ df1 =====
df1 = tibble(full_path = c(dir(), dir("Rdev", recursive = T))) %>%
    mutate(
        path.dirname = dirname(full_path),
        path.basename = basename(full_path),
        path.basename.ext = tools::file_ext(path.basename)
    ) %>% 
    mutate(across(everything(), 
                .fns = list(TOUPPER = ~toupper(as.character(.))), 
                .names = "{.col}.TOUPPER"))
    arrange(path.dirname, path.basename)
df1 %>% select(-full_path)
# > df %>% select(-full_path)
# # A tibble: 264 × 3
#    path.dirname   path.basename                                                                             path.basename.ext    
#    <chr> <chr>                                                                            <chr>  
#  1 -dev  object.coxph from analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample -dev.r "r"    
#  2 .     -info                                                                            ""     
#  3 .     -tmp                                                                             ""     
#  4 .     -void.r                                                                          "r"    
#  5 .     Blank) env.custom.fun.t.tribble_construct.Rmd - Shortcut.lnk                     "lnk"  
#  6 .     Blank.Rmd - Shortcut.lnk                                                         "lnk"  
#  7 .     Encoding.txt                                                                     "txt"  
#  8 .     README.md                                                                        "md"   
#  9 .     RStudio.Cloud set up.r                                                           "r"    
# 10 .     RStudio.cloud.Rproj                                                              "Rproj"
# # ℹ 254 more rows
# # ℹ Use `print(n = ...)` to see more rows

df1$path.dirname %>% unique %>% as.list %>% str #----
# > df$path.dirname %>% unique %>% as.list %>% str #----
# List of 38
#  $ : chr "-dev"
#  $ : chr "."
#  $ : chr "00_base_program"
#  $ : chr "00_protocol/01_sample_size"
#  $ : chr "10_import_clean_datatype/11_metadata"
#  $ : chr "10_import_clean_datatype/12_import_path.basenames"
#  $ : chr "10_import_clean_datatype/12_import_sqlite"
#  $ : chr "10_import_clean_datatype/12_import_vocabulary"
#  $ : chr "10_import_clean_datatype/13_duplicated"
#  $ : chr "10_import_clean_datatype/13_missing_value"
#  $ : chr "10_import_clean_datatype/13_split_fold"
#  $ : chr "10_import_clean_datatype/15_cleaning_tpath.basename.ext"
#  $ : chr "10_import_clean_datatype/15_cleaning_time"
#  $ : chr "10_import_clean_datatype/16_categorical_factor"
#  $ : chr "10_import_clean_datatype/17_categorical_indicators"
#  $ : chr "10_import_clean_datatype/18_dichotomous_logical"
#  $ : chr "10_import_clean_datatype/19_datetime"
#  $ : chr "10_import_clean_datatype/19_numeric_integer"
#  $ : chr "10_import_clean_datatype/array_list"
#  $ : chr "20_tidy_group_by_match"
#  $ : chr "20_tidy_group_by_match/23_group_by_PersonID"
#  $ : chr "20_tidy_group_by_match/25_study_population"
#  $ : chr "20_tidy_group_by_match/27_match"
#  $ : chr "30_transform_scale_categorical"
#  $ : chr "40_visualize_explore_bivariate_stratified"
#  $ : chr "40_visualize_explore_bivariate_stratified/43_network"
#  $ : chr "40_visualize_explore_bivariate_stratified/44_map"
#  $ : chr "40_visualize_explore_bivariate_stratified/45_bivariate_measures"
#  $ : chr "40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified"
#  $ : chr "50_model_formula_evaluation"
#  $ : chr "50_model_formula_evaluation/51_model_formula"
#  $ : chr "50_model_formula_evaluation/53_model_selection"
#  $ : chr "50_model_formula_evaluation/55_model_weighted"
#  $ : chr "50_model_formula_evaluation/56_model_bootstrap"
#  $ : chr "50_model_formula_evaluation/57_model_time2event"
#  $ : chr "50_model_formula_evaluation/57_model_trajectory"
#  $ : chr "50_model_formula_evaluation/59_model_evaluation"
#  $ : chr "60_communicate_report_export"



df1$path.dirname %>% table #----
df1$path.basename.ext %>% table #----
# > df1$path.dirname %>% table #----
# .
#                                                                      -dev 
#                                                                         1 
#                                                                         . 
#                                                                        52 
#                                                           00_base_program 
#                                                                        41 
#                                                00_protocol/01_sample_size 
#                                                                         6 
#                                      10_import_clean_datatype/11_metadata 
#                                                                         2 
#                                  10_import_clean_datatype/12_import_path.basenames 
#                                                                         8 
#                                 10_import_clean_datatype/12_import_sqlite 
#                                                                         3 
#                             10_import_clean_datatype/12_import_vocabulary 
#                                                                         3 
#                                    10_import_clean_datatype/13_duplicated 
#                                                                         2 
#                                 10_import_clean_datatype/13_missing_value 
#                                                                         6 
#                                    10_import_clean_datatype/13_split_fold 
#                                                                         1 
#                                 10_import_clean_datatype/15_cleaning_tpath.basename.ext 
#                                                                         9 
#                                 10_import_clean_datatype/15_cleaning_time 
#                                                                         4 
#                            10_import_clean_datatype/16_categorical_factor 
#                                                                         9 
#                        10_import_clean_datatype/17_categorical_indicators 
#                                                                         3 
#                           10_import_clean_datatype/18_dichotomous_logical 
#                                                                         4 
#                                      10_import_clean_datatype/19_datetime 
#                                                                         1 
#                               10_import_clean_datatype/19_numeric_integer 
#                                                                         4 
#                                       10_import_clean_datatype/array_list 
#                                                                         5 
#                                                    20_tidy_group_by_match 
#                                                                         2 
#                               20_tidy_group_by_match/23_group_by_PersonID 
#                                                                         3 
#                                20_tidy_group_by_match/25_study_population 
#                                                                         3 
#                                           20_tidy_group_by_match/27_match 
#                                                                         5 
#                                            30_transform_scale_categorical 
#                                                                         6 
#                                 40_visualize_explore_bivariate_stratified 
#                                                                         4 
#                      40_visualize_explore_bivariate_stratified/43_network 
#                                                                         8 
#                          40_visualize_explore_bivariate_stratified/44_map 
#                                                                        12 
#           40_visualize_explore_bivariate_stratified/45_bivariate_measures 
#                                                                         4 
# 40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified 
#                                                                         4 
#                                               50_model_formula_evaluation 
#                                                                         3 
#                              50_model_formula_evaluation/51_model_formula 
#                                                                         2 
#                            50_model_formula_evaluation/53_model_selection 
#                                                                         2 
#                             50_model_formula_evaluation/55_model_weighted 
#                                                                         4 
#                            50_model_formula_evaluation/56_model_bootstrap 
#                                                                         3 
#                           50_model_formula_evaluation/57_model_time2event 
#                                                                         8 
#                           50_model_formula_evaluation/57_model_trajectory 
#                                                                         1 
#                           50_model_formula_evaluation/59_model_evaluation 
#                                                                         6 
#                                              60_communicate_report_export 
#                                                                        21 
# > df1$path.basename.ext %>% table #----
# .
#         jar   lnk    md   pdf     r     R RData   rmd   Rmd Rproj   txt   url  xlsx   zip 
#    11     1    13     1     8   210     2     1     4     1     2     3     1     1     6 











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
gitignore_escaped_select %>% dput
c("\\.Rproj\\.user", "\\.Rhistory", "\\.RData", "\\.Ruserdata", 
".*\\.zip", ".*\\.Rproj", "\\.gitignore", "MH\\).*\\.r", ".*\\.lnk", 
".*alias", ".*\\- void.*\\..*", ".*\\-void.*\\..*", ".*\\- info\\..*", 
".*\\-info\\..*", ".*\\-dev.*\\..*", ".*debug.*\\..*", "\\-tmp", 
".*\\- tmp.*\\..*", ".*\\-tmp.*\\..*", ".*\\-log.*\\..*", ".*\\.rtf"
)
# for (i_regex in unique(gitignore_escaped_select)) {
#     df <- df1 %>% filter(!str_detect(path.basename, i_regex))
# }

gitignore_escaped_select %>% paste(collapse = "|")
# [1] "\\.Rproj\\.user|\\.Rhistory|\\.RData|\\.Ruserdata|.*\\.zip|.*\\.Rproj|\\.gitignore|MH\\).*\\.r|.*\\.lnk|.*alias|.*\\- void.*\\..*|.*\\-void.*\\..*|.*\\- info\\..*|.*\\-info\\..*|.*\\-dev.*\\..*|.*debug.*\\..*|\\-tmp|.*\\- tmp.*\\..*|.*\\-tmp.*\\..*|.*\\-log.*\\..*|.*\\.rtf"

#@ df2 ====
df1 %>% str
df2 = df1 %>% filter(!str_detect(path.basename, gitignore_escaped_select %>% paste(collapse = "|")))
df2 %>% str
# > df2 %>% str
# tibble [225 × 4] (S3: tbl_df/tbl/data.frame)
#  $ full_path: chr [1:225] "-info" "Encoding.txt" "README.md" "RStudio.Cloud set up.r" ...
#  $ path.dirname      : chr [1:225] "." "." "." "." ...
#  $ path.basename     : chr [1:225] "-info" "Encoding.txt" "README.md" "RStudio.Cloud set up.r" ...
#  $ path.basename.ext      : chr [1:225] "" "txt" "md" "r" ...

setdiff(df1, df2)
# > setdiff(df1, df2)
# # A tibble: 40 × 4
#    full_path                                                                             path.dirname   path.basename                    path.basename.ext  
#    <chr>                                                                                 <chr> <chr>                   <chr>
#  1 -dev/object.coxph from analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample -dev.r -dev  object.coxph from anal… "r"  
#  2 -tmp                                                                                  .     -tmp                    ""   
#  3 -void.r                                                                               .     -void.r                 "r"  
#  4 Blank) env.custom.fun.t.tribble_construct.Rmd - Shortcut.lnk                          .     Blank) env.custom.fun.… "lnk"
#  5 Blank.Rmd - Shortcut.lnk                                                              .     Blank.Rmd - Shortcut.l… "lnk"
#  6 RStudio.cloud.Rproj                                                                   .     RStudio.cloud.Rproj     "Rpr…
#  7 [[Stat]] CRAN R - Shortcut.lnk                                                        .     [[Stat]] CRAN R - Shor… "lnk"
#  8 bfg.zip                                                                               .     bfg.zip                 "zip"
#  9 env.custom.fun.t.tribble_construct.RData                                              .     env.custom.fun.t.tribb… "RDa…
# 10 github_tidystat.Rproj                                                                 .     github_tidystat.Rproj   "Rpr…
# # ℹ 30 more rows
# # ℹ Use `print(n = ...)` to see more rows



df2 %>% filter(path.dirname == ".") #----
# > df2 %>% filter(path.dirname == ".") #----
# # A tibble: 38 × 4
#    full_path                                     path.dirname   path.basename                                          path.basename.ext  
#    <chr>                                         <chr> <chr>                                         <chr>
#  1 -info                                         .     -info                                         ""   
#  2 Encoding.txt                                  .     Encoding.txt                                  "txt"
#  3 README.md                                     .     README.md                                     "md" 
#  4 RStudio.Cloud set up.r                        .     RStudio.Cloud set up.r                        "r"  
#  5 Rdev                                          .     Rdev                                          ""   
#  6 Removing sensitive data from a repository.url .     Removing sensitive data from a repository.url "url"
#  7 Rmd                                           .     Rmd                                           ""   
#  8 Rplot                                         .     Rplot                                         ""   
#  9 bfg-1.13.0.jar                                .     bfg-1.13.0.jar                                "jar"
# 10 bfg.txt                                       .     bfg.txt                                       "txt"
# # ℹ 28 more rows
# # ℹ Use `print(n = ...)` to see more rows

df2 %>% filter(path.basename.ext == "") #----
# > df2 %>% filter(path.basename.ext == "") #----
# # A tibble: 9 × 4
#   full_path path.dirname   path.basename      path.basename.ext  
#   <chr>     <chr> <chr>     <chr>
# 1 -info     .     -info     ""   
# 2 Rdev      .     Rdev      ""   
# 3 Rmd       .     Rmd       ""   
# 4 Rplot     .     Rplot     ""   
# 5 data      .     data      ""   
# 6 examples  .     examples  ""   
# 7 other     .     other     ""   
# 8 tests     .     tests     ""   
# 9 vignettes .     vignettes ""  



df2 %>% filter(path.dirname == "Rdev") #----
# > df2 %>% filter(path.dirname == "Rdev") #----
# # A tibble: 0 × 4
# # ℹ 4 variables: full_path <chr>, path.dirname <chr>, path.basename <chr>, path.basename.ext <chr>


df2 %>% filter(path.basename.ext == "pptx") #----
df2 %>% filter(full_path %>% str_detect("ppt")) #----





#@ end ----
