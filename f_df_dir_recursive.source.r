#@ f_df_path.dirname_recursive.source.r

library(tidyverse)
dir() %>% str #----
dir(recursive = T) %>% str #----
dir("Rdev", recursive = T) %>% str #----
dir("Rdev", recursive = T, include.dirs = T) %>% str #----
setdiff( dir("Rdev", recursive = T, include.dirs = T), dir("Rdev", recursive = T) ) %>% str #----
# > dir() %>% str #----
#  chr [1:36] "-info" "-tmp" "-void.r" "[[Stat]] CRAN R - Shortcut.lnk" "bfg-1.13.0.jar" "bfg.txt" "bfg.zip" ...
# > dir(recursive = T) %>% str #----
#  chr [1:443] "-info/facets_2017 - annotate (3) tableone_by_P_WH.ge.5.zip" ...
# > dir("Rdev", recursive = T) %>% str #----
#  chr [1:231] "-dev/object.coxph from analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample -dev.r" ...
# > dir("Rdev", recursive = T, include.dirs = T) %>% str #----
#  chr [1:273] "-dev" "-dev/object.coxph from analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample -dev.r" ...
# > setdiff( dir("Rdev", recursive = T, include.dirs = T), dir("Rdev", recursive = T) ) %>% str #----
#  chr [1:42] "-dev" "00_base_program" "00_protocol" "00_protocol/01_sample_size" "00_protocol/05_count_eligible" ...



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

#@ df_dir1 =====
df_dir1 = tibble(full_path = setdiff( dir("Rdev", recursive = T, include.dirs = T), dir("Rdev", recursive = T) ) ) %>%
    mutate(
        path.dirname = dirname(full_path),
        path.basename = basename(full_path),
        path.basename.ext = tools::file_ext(path.basename)
    ) %>% 
    f_df_add_TOUPPER %>% 
    arrange(path.dirname, path.basename) %>% 
    select(matches("TOUPPER"))
df_dir1 %>% select(-matches("full_path"))
# > df_dir1 %>% select(-matches("full_path"))
# # A tibble: 42 × 3
#    path.dirname.TOUPPER path.basename.TOUPPER                     path.basename.ext.TOUPPER
#    <chr>                <chr>                                     <chr>                    
#  1 .                    -DEV                                      ""                       
#  2 .                    00_BASE_PROGRAM                           ""                       
#  3 .                    00_PROTOCOL                               ""                       
#  4 .                    10_IMPORT_CLEAN_DATATYPE                  ""                       
#  5 .                    20_TIDY_GROUP_BY_MATCH                    ""                       
#  6 .                    30_TRANSFORM_SCALE_CATEGORICAL            ""                       
#  7 .                    40_VISUALIZE_EXPLORE_BIVARIATE_STRATIFIED ""                       
#  8 .                    50_MODEL_FORMULA_EVALUATION               ""                       
#  9 .                    60_COMMUNICATE_REPORT_EXPORT              ""                       
# 10 00_PROTOCOL          01_SAMPLE_SIZE                            ""                       
# # ℹ 32 more rows
# # ℹ Use `print(n = ...)` to see more rows


# df_dir1$path.dirname.TOUPPER %>% unique %>% as.list %>% str #----
df_dir1$path.dirname.TOUPPER %>% table #----
df_dir1$path.basename.ext.TOUPPER %>% table #----
# > df_dir1$path.dirname.TOUPPER %>% table #----
# .
#                                         .                               00_PROTOCOL 
#                                         9                                         4 
#                  10_IMPORT_CLEAN_DATATYPE                    20_TIDY_GROUP_BY_MATCH 
#                                        15                                         3 
# 40_VISUALIZE_EXPLORE_BIVARIATE_STRATIFIED               50_MODEL_FORMULA_EVALUATION 
#                                         4                                         7 
# > df_dir1$path.basename.ext.TOUPPER %>% table #----
# .
#    
# 42 






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
#     df <- df_dir1 %>% filter(!str_detect(path.basename, i_regex))
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







#@ df_dir2 ====
df_dir1 %>% str #----
df_dir2 = df_dir1 %>% filter(!str_detect(path.basename.TOUPPER, gitignore_escaped_select %>% toupper %>% paste(collapse = "|")))
df_dir2 %>% str #----
# > df_dir1 %>% str #----
# tibble [42 × 4] (S3: tbl_df/tbl/data.frame)
#  $ full_path.TOUPPER        : chr [1:42] "-DEV" "00_BASE_PROGRAM" "00_PROTOCOL" "10_IMPORT_CLEAN_DATATYPE" ...
#  $ path.dirname.TOUPPER     : chr [1:42] "." "." "." "." ...
#  $ path.basename.TOUPPER    : chr [1:42] "-DEV" "00_BASE_PROGRAM" "00_PROTOCOL" "10_IMPORT_CLEAN_DATATYPE" ...
#  $ path.basename.ext.TOUPPER: chr [1:42] "" "" "" "" ...
# > df_dir2 = df_dir1 %>% filter(!str_detect(path.basename.TOUPPER, gitignore_escaped_select %>% toupper %>% paste(collapse = "|")))
# > df_dir2 %>% str #----
# tibble [42 × 4] (S3: tbl_df/tbl/data.frame)
#  $ full_path.TOUPPER        : chr [1:42] "-DEV" "00_BASE_PROGRAM" "00_PROTOCOL" "10_IMPORT_CLEAN_DATATYPE" ...
#  $ path.dirname.TOUPPER     : chr [1:42] "." "." "." "." ...
#  $ path.basename.TOUPPER    : chr [1:42] "-DEV" "00_BASE_PROGRAM" "00_PROTOCOL" "10_IMPORT_CLEAN_DATATYPE" ...
#  $ path.basename.ext.TOUPPER: chr [1:42] "" "" "" "" ...

setdiff(df_dir1, df_dir2) #----
# > setdiff(df_dir1, df_dir2) #----
# # A tibble: 0 × 4
# # ℹ 4 variables: full_path.TOUPPER <chr>, path.dirname.TOUPPER <chr>, path.basename.TOUPPER <chr>,
# #   path.basename.ext.TOUPPER <chr>

df_dir2 %>% filter(path.dirname.TOUPPER == ".") #----
# > df_dir2 %>% filter(path.dirname.TOUPPER == ".") #----
# # A tibble: 9 × 4
#   full_path.TOUPPER                         path.dirname.TOUPPER path.basename.TOUPPER              path.basename.ext.TO…¹
#   <chr>                                     <chr>                <chr>                              <chr>                 
# 1 -DEV                                      .                    -DEV                               ""                    
# 2 00_BASE_PROGRAM                           .                    00_BASE_PROGRAM                    ""                    
# 3 00_PROTOCOL                               .                    00_PROTOCOL                        ""                    
# 4 10_IMPORT_CLEAN_DATATYPE                  .                    10_IMPORT_CLEAN_DATATYPE           ""                    
# 5 20_TIDY_GROUP_BY_MATCH                    .                    20_TIDY_GROUP_BY_MATCH             ""                    
# 6 30_TRANSFORM_SCALE_CATEGORICAL            .                    30_TRANSFORM_SCALE_CATEGORICAL     ""                    
# 7 40_VISUALIZE_EXPLORE_BIVARIATE_STRATIFIED .                    40_VISUALIZE_EXPLORE_BIVARIATE_ST… ""                    
# 8 50_MODEL_FORMULA_EVALUATION               .                    50_MODEL_FORMULA_EVALUATION        ""                    
# 9 60_COMMUNICATE_REPORT_EXPORT              .                    60_COMMUNICATE_REPORT_EXPORT       ""                    
# # ℹ abbreviated name: ¹​path.basename.ext.TOUPPER


df_dir2 %>% filter(path.basename.ext.TOUPPER == "") #----
# > df_dir2 %>% filter(path.basename.ext.TOUPPER == "") #----
# # A tibble: 42 × 4
#    full_path.TOUPPER                         path.dirname.TOUPPER path.basename.TOUPPER             path.basename.ext.TO…¹
#    <chr>                                     <chr>                <chr>                             <chr>                 
#  1 -DEV                                      .                    -DEV                              ""                    
#  2 00_BASE_PROGRAM                           .                    00_BASE_PROGRAM                   ""                    
#  3 00_PROTOCOL                               .                    00_PROTOCOL                       ""                    
#  4 10_IMPORT_CLEAN_DATATYPE                  .                    10_IMPORT_CLEAN_DATATYPE          ""                    
#  5 20_TIDY_GROUP_BY_MATCH                    .                    20_TIDY_GROUP_BY_MATCH            ""                    
#  6 30_TRANSFORM_SCALE_CATEGORICAL            .                    30_TRANSFORM_SCALE_CATEGORICAL    ""                    
#  7 40_VISUALIZE_EXPLORE_BIVARIATE_STRATIFIED .                    40_VISUALIZE_EXPLORE_BIVARIATE_S… ""                    
#  8 50_MODEL_FORMULA_EVALUATION               .                    50_MODEL_FORMULA_EVALUATION       ""                    
#  9 60_COMMUNICATE_REPORT_EXPORT              .                    60_COMMUNICATE_REPORT_EXPORT      ""                    
# 10 00_PROTOCOL/01_SAMPLE_SIZE                00_PROTOCOL          01_SAMPLE_SIZE                    ""                    
# # ℹ 32 more rows
# # ℹ abbreviated name: ¹​path.basename.ext.TOUPPER
# # ℹ Use `print(n = ...)` to see more rows




#@ end ----
