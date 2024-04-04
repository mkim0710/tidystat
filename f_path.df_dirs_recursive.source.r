#@ f_path.df_dirs_recursive.source.r


#@ input_path = "Rdev" =====
library(tidyverse)
dir(full.names = FALSE) %>% str #----
dir(full.names = T) %>% str #----
dir(full.names = T, recursive = T) %>% str #----
input_path = "Rdev"
dir(input_path, full.names = T, recursive = T) %>% str #----
dir(input_path, full.names = T, recursive = T, include.dirs = T) %>% str #----
setdiff( dir(input_path, full.names = T, recursive = T, include.dirs = T), dir(input_path, full.names = T, recursive = T) ) %>% str #----
list.dirs(input_path, full.names = TRUE) %>% str #----
# > dir(full.names = FALSE) %>% str #----
#  chr [1:37] "-info" "-tmp" "-void.r" "[[Stat]] CRAN R - Shortcut.lnk" "bfg-1.13.0.jar" "bfg.txt" "bfg.zip" ...
# > dir(full.names = T) %>% str #----
#  chr [1:37] "./-info" "./-tmp" "./-void.r" "./[[Stat]] CRAN R - Shortcut.lnk" "./bfg-1.13.0.jar" "./bfg.txt" "./bfg.zip" ...
# > dir(full.names = T, recursive = T) %>% str #----
#  chr [1:444] "./-info/facets_2017 - annotate (3) tableone_by_P_WH.ge.5.zip" "./-info/facets_2017 - annotate.xlsx - 바로 가기.lnk" ...
# > input_path = "Rdev"
# > dir(input_path, full.names = T, recursive = T) %>% str #----
#  chr [1:231] "Rdev/-dev/object.coxph from analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample -dev.r" ...
# > dir(input_path, full.names = T, recursive = T, include.dirs = T) %>% str #----
#  chr [1:273] "Rdev/-dev" "Rdev/-dev/object.coxph from analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample -dev.r" ...
# > setdiff( dir(input_path, full.names = T, recursive = T, include.dirs = T), dir(input_path, full.names = T, recursive = T) ) %>% str #----
#  chr [1:42] "Rdev/-dev" "Rdev/00_base_program" "Rdev/00_protocol" "Rdev/00_protocol/01_sample_size" ...
# > list.dirs(input_path, full.names = TRUE) %>% str #----
#  chr [1:43] "Rdev" "Rdev/-dev" "Rdev/00_base_program" "Rdev/00_protocol" "Rdev/00_protocol/01_sample_size" ...



# Function to add '.UC' columns to a data frame
f_df.add_UC <- function(df) {
    # Function to UpperCase and retain factor if original column was a factor
    f_vec.toupper_factor <- function(input_vec) {
        if (is.factor(input_vec)) {
            factor(toupper(levels(input_vec))[input_vec])
        } else if (is.character(input_vec)) {
            toupper(input_vec)
        } else {
            input_vec
        }
    }
    df %>%
        mutate(across(.cols = c(where(is.character), where(is.factor)),
                      .fns = list(UC = ~f_vec.toupper_factor(.)),
                      .names = "{.col}.UC"))
}


#@ df_dirs1 =====
df_dirs1 = tibble(full_path = list.dirs(input_path) ) %>%
    mutate(
        path.dirname = dirname(full_path),
        path.basename = basename(full_path),
        path.basename.ext = tools::file_ext(path.basename)
    ) %>% 
    f_df.add_UC %>% 
    arrange(path.dirname, path.basename) %>% 
    # select(matches("UC")) %>% 
    as.tibble
df_dirs1 %>% select(-matches("full_path"))
# > df_dirs1 %>% select(-matches("full_path"))
# # A tibble: 43 × 6
#    path.dirname path.basename                             path.basename.ext path.dirname.UC path.basename.UC                        path.basename.ext.UC
#    <chr>        <chr>                                     <chr>             <chr>           <chr>                                   <chr>               
#  1 .            Rdev                                      ""                .               RDEV                                    ""                  
#  2 Rdev         -dev                                      ""                RDEV            -DEV                                    ""                  
#  3 Rdev         00_base_program                           ""                RDEV            00_BASE_PROGRAM                         ""                  
#  4 Rdev         00_protocol                               ""                RDEV            00_PROTOCOL                             ""                  
#  5 Rdev         10_import_clean_datatype                  ""                RDEV            10_IMPORT_CLEAN_DATATYPE                ""                  
#  6 Rdev         20_tidy_group_by_match                    ""                RDEV            20_TIDY_GROUP_BY_MATCH                  ""                  
#  7 Rdev         30_transform_scale_categorical            ""                RDEV            30_TRANSFORM_SCALE_CATEGORICAL          ""                  
#  8 Rdev         40_visualize_explore_bivariate_stratified ""                RDEV            40_VISUALIZE_EXPLORE_BIVARIATE_STRATIF… ""                  
#  9 Rdev         50_model_formula_evaluation               ""                RDEV            50_MODEL_FORMULA_EVALUATION             ""                  
# 10 Rdev         60_communicate_report_export              ""                RDEV            60_COMMUNICATE_REPORT_EXPORT            ""                  
# # ℹ 33 more rows
# # ℹ Use `print(n = ...)` to see more rows


# df_dirs1$path.dirname.UC %>% unique %>% as.list %>% str #----
df_dirs1$path.dirname.UC %>% table #----
df_dirs1$path.basename.ext.UC %>% table #----
# > df_dirs1$path.dirname.UC %>% table #----
# .
# . 
# 1 
# RDEV 
# 9 
# RDEV/00_PROTOCOL 
# 4 
# RDEV/10_IMPORT_CLEAN_DATATYPE 
# 15 
# RDEV/20_TIDY_GROUP_BY_MATCH 
# 3 
# RDEV/40_VISUALIZE_EXPLORE_BIVARIATE_STRATIFIED 
# 4 
# RDEV/50_MODEL_FORMULA_EVALUATION 
# 7 
# > df_dirs1$path.basename.ext.UC %>% table #----
# .
#    
# 43 


#@ gitignore_escaped_select.UC =====
# gitignore_escaped_select.UC = gitignore_escaped_select %>% toupper %>% unique
# gitignore_escaped_select.UC %>% dput #----
gitignore_escaped_select.UC = c("\\.RPROJ\\.USER", "\\.RHISTORY", "\\.RDATA", "\\.RUSERDATA", 
".*\\.ZIP", ".*\\.GZ", ".*\\.XZ", ".*\\.7Z", ".*\\.RPROJ", "\\.GITIGNORE", 
"MH\\).*\\.R", ".*\\.LNK", ".*ALIAS", ".*\\- VOID.*\\..*", ".*\\-VOID.*\\..*", 
".*\\- INFO\\..*", ".*\\-INFO\\..*", ".*\\-DEV.*\\..*", ".*DEBUG.*\\..*", 
"\\-TMP", ".*\\- TMP.*\\..*", ".*\\-TMP.*\\..*", ".*\\-LOG.*\\..*", 
".*\\.RTF")

gitignore_escaped_select.UC %>% paste(collapse = "|") %>% dput #----
"\\.RPROJ\\.USER|\\.RHISTORY|\\.RDATA|\\.RUSERDATA|.*\\.ZIP|.*\\.GZ|.*\\.XZ|.*\\.7Z|.*\\.RPROJ|\\.GITIGNORE|MH\\).*\\.R|.*\\.LNK|.*ALIAS|.*\\- VOID.*\\..*|.*\\-VOID.*\\..*|.*\\- INFO\\..*|.*\\-INFO\\..*|.*\\-DEV.*\\..*|.*DEBUG.*\\..*|\\-TMP|.*\\- TMP.*\\..*|.*\\-TMP.*\\..*|.*\\-LOG.*\\..*|.*\\.RTF"



#@ df_dirs2 ====
df_dirs1 %>% str #----
df_dirs2 = df_dirs1 %>% filter(!str_detect(path.basename.UC, gitignore_escaped_select.UC %>% paste(collapse = "|")))
df_dirs2 %>% str #----
# > df_dirs1 %>% str #----
# tibble [43 × 8] (S3: tbl_df/tbl/data.frame)
#  $ full_path           : chr [1:43] "Rdev" "Rdev/-dev" "Rdev/00_base_program" "Rdev/00_protocol" ...
#  $ path.dirname        : chr [1:43] "." "Rdev" "Rdev" "Rdev" ...
#  $ path.basename       : chr [1:43] "Rdev" "-dev" "00_base_program" "00_protocol" ...
#  $ path.basename.ext   : chr [1:43] "" "" "" "" ...
#  $ full_path.UC        : chr [1:43] "RDEV" "RDEV/-DEV" "RDEV/00_BASE_PROGRAM" "RDEV/00_PROTOCOL" ...
#  $ path.dirname.UC     : chr [1:43] "." "RDEV" "RDEV" "RDEV" ...
#  $ path.basename.UC    : chr [1:43] "RDEV" "-DEV" "00_BASE_PROGRAM" "00_PROTOCOL" ...
#  $ path.basename.ext.UC: chr [1:43] "" "" "" "" ...
# > df_dirs2 = df_dirs1 %>% filter(!str_detect(path.basename.UC, gitignore_escaped_select.UC %>% paste(collapse = "|")))
# > df_dirs2 %>% str #----
# tibble [43 × 8] (S3: tbl_df/tbl/data.frame)
#  $ full_path           : chr [1:43] "Rdev" "Rdev/-dev" "Rdev/00_base_program" "Rdev/00_protocol" ...
#  $ path.dirname        : chr [1:43] "." "Rdev" "Rdev" "Rdev" ...
#  $ path.basename       : chr [1:43] "Rdev" "-dev" "00_base_program" "00_protocol" ...
#  $ path.basename.ext   : chr [1:43] "" "" "" "" ...
#  $ full_path.UC        : chr [1:43] "RDEV" "RDEV/-DEV" "RDEV/00_BASE_PROGRAM" "RDEV/00_PROTOCOL" ...
#  $ path.dirname.UC     : chr [1:43] "." "RDEV" "RDEV" "RDEV" ...
#  $ path.basename.UC    : chr [1:43] "RDEV" "-DEV" "00_BASE_PROGRAM" "00_PROTOCOL" ...
#  $ path.basename.ext.UC: chr [1:43] "" "" "" "" ...



setdiff(df_dirs1, df_dirs2) #----
# > setdiff(df_dirs1, df_dirs2) #----
# # A tibble: 0 × 8
# # ℹ 8 variables: full_path <chr>, path.dirname <chr>, path.basename <chr>,
# #   path.basename.ext <chr>, full_path.UC <chr>, path.dirname.UC <chr>,
# #   path.basename.UC <chr>, path.basename.ext.UC <chr>

df_dirs2 %>% filter(path.dirname.UC == ".") %>% select(-matches("\\.UC$")) #----
df_dirs2 %>% filter(path.dirname.UC == "Rdev" %>% toupper) %>% select(-matches("\\.UC$")) #----
# > df_dirs2 %>% filter(path.dirname.UC == ".") %>% select(-matches("\\.UC$")) #----
# # A tibble: 1 × 4
#   full_path path.dirname path.basename path.basename.ext
#   <chr>     <chr>        <chr>         <chr>            
# 1 Rdev      .            Rdev          ""    
# > df_dirs2 %>% filter(path.dirname.UC == "Rdev" %>% toupper) %>% select(-matches("\\.UC$")) #----
# # A tibble: 9 × 4
#   full_path                                      path.dirname path.basename                             path.basename.ext
#   <chr>                                          <chr>        <chr>                                     <chr>            
# 1 Rdev/-dev                                      Rdev         -dev                                      ""               
# 2 Rdev/00_base_program                           Rdev         00_base_program                           ""               
# 3 Rdev/00_protocol                               Rdev         00_protocol                               ""               
# 4 Rdev/10_import_clean_datatype                  Rdev         10_import_clean_datatype                  ""               
# 5 Rdev/20_tidy_group_by_match                    Rdev         20_tidy_group_by_match                    ""               
# 6 Rdev/30_transform_scale_categorical            Rdev         30_transform_scale_categorical            ""               
# 7 Rdev/40_visualize_explore_bivariate_stratified Rdev         40_visualize_explore_bivariate_stratified ""               
# 8 Rdev/50_model_formula_evaluation               Rdev         50_model_formula_evaluation               ""               
# 9 Rdev/60_communicate_report_export              Rdev         60_communicate_report_export              ""               


df_dirs2 %>% filter(path.basename.ext.UC == "") %>% select(-matches("\\.UC$")) #----
# > df_dirs2 %>% filter(path.basename.ext.UC == "") %>% select(-matches("\\.UC$")) #----
# # A tibble: 43 × 4
#    full_path                                      path.dirname path.basename                             path.basename.ext
#    <chr>                                          <chr>        <chr>                                     <chr>            
#  1 Rdev                                           .            Rdev                                      ""               
#  2 Rdev/-dev                                      Rdev         -dev                                      ""               
#  3 Rdev/00_base_program                           Rdev         00_base_program                           ""               
#  4 Rdev/00_protocol                               Rdev         00_protocol                               ""               
#  5 Rdev/10_import_clean_datatype                  Rdev         10_import_clean_datatype                  ""               
#  6 Rdev/20_tidy_group_by_match                    Rdev         20_tidy_group_by_match                    ""               
#  7 Rdev/30_transform_scale_categorical            Rdev         30_transform_scale_categorical            ""               
#  8 Rdev/40_visualize_explore_bivariate_stratified Rdev         40_visualize_explore_bivariate_stratified ""               
#  9 Rdev/50_model_formula_evaluation               Rdev         50_model_formula_evaluation               ""               
# 10 Rdev/60_communicate_report_export              Rdev         60_communicate_report_export              ""               
# # ℹ 33 more rows
# # ℹ Use `print(n = ...)` to see more rows


f_path.df_dirs_recursive = function(input_path = ".") {

    # Function to add '.UC' columns to a data frame
    f_df.add_UC <- function(df) {
        # Function to UpperCase and retain factor if original column was a factor
        f_vec.toupper_factor <- function(input_vec) {
            if (is.factor(input_vec)) {
                factor(toupper(levels(input_vec))[input_vec])
            } else if (is.character(input_vec)) {
                toupper(input_vec)
            } else {
                input_vec
            }
        }
        df %>%
            mutate(across(.cols = c(where(is.character), where(is.factor)),
                          .fns = list(UC = ~f_vec.toupper_factor(.)),
                          .names = "{.col}.UC"))
    }
    
    df_dirs1 = tibble(full_path = list.dirs(input_path) ) %>%
        mutate(
            path.dirname = dirname(full_path),
            path.basename = basename(full_path),
            path.basename.ext = tools::file_ext(path.basename)
        ) %>% 
        select(path.dirname, path.basename, path.basename.ext, full_path) %>%
        f_df.add_UC %>% 
        mutate(
            # Calculate the level of each path
            path.level = str_count(full_path, "/") + 1
        ) %>% 
        select(path.level, everything()) %>% 
        arrange(path.dirname, path.basename) %>% 
        # select(matches("UC")) %>% 
        as.tibble
    
    gitignore_escaped_select.UC = 
        c("\\.RPROJ\\.USER", "\\.RHISTORY", "\\.RDATA", "\\.RUSERDATA", 
          ".*\\.ZIP", ".*\\.GZ", ".*\\.XZ", ".*\\.7Z", ".*\\.RPROJ", "\\.GITIGNORE", 
          "MH\\).*\\.R", ".*\\.LNK", ".*ALIAS", ".*\\- VOID.*\\..*", ".*\\-VOID.*\\..*", 
          ".*\\- INFO\\..*", ".*\\-INFO\\..*", ".*\\-DEV.*\\..*", ".*DEBUG.*\\..*", 
          "\\-TMP", ".*\\- TMP.*\\..*", ".*\\-TMP.*\\..*", ".*\\-LOG.*\\..*", 
          ".*\\.RTF")
    
    df_dirs2 = df_dirs1 %>% filter(!str_detect(path.basename.UC, gitignore_escaped_select.UC %>% paste(collapse = "|")))

    df_dirs3 = df_dirs2 %>% 
        mutate(print_path_tree = map_chr(path.level, ~paste(rep("\t", .x-1), collapse = "")) %>% paste0(path.basename) ) 
    df_dirs3
}


"Rdev" %>% f_path.df_dirs_recursive %>% str #----
"Rdev" %>% f_path.df_dirs_recursive %>% select(-matches("\\.UC$"), -matches("\\.ext")) %>% as.data.frame #----
# > "Rdev" %>% f_path.df_dirs_recursive %>% str #----
# tibble [43 × 9] (S3: tbl_df/tbl/data.frame)
#  $ path.level          : num [1:43] 1 2 2 2 2 2 2 2 2 2 ...
#  $ path.dirname        : chr [1:43] "." "Rdev" "Rdev" "Rdev" ...
#  $ path.basename       : chr [1:43] "Rdev" "-dev" "00_base_program" "00_protocol" ...
#  $ path.basename.ext   : chr [1:43] "" "" "" "" ...
#  $ full_path           : chr [1:43] "Rdev" "Rdev/-dev" "Rdev/00_base_program" "Rdev/00_protocol" ...
#  $ path.dirname.UC     : chr [1:43] "." "RDEV" "RDEV" "RDEV" ...
#  $ path.basename.UC    : chr [1:43] "RDEV" "-DEV" "00_BASE_PROGRAM" "00_PROTOCOL" ...
#  $ path.basename.ext.UC: chr [1:43] "" "" "" "" ...
#  $ full_path.UC        : chr [1:43] "RDEV" "RDEV/-DEV" "RDEV/00_BASE_PROGRAM" "RDEV/00_PROTOCOL" ...
# > "Rdev" %>% f_path.df_dirs_recursive %>% select(-matches("\\.UC$"), -matches("\\.ext")) %>% as.data.frame #----
#    path.level                                   path.dirname                             path.basename                                                                      full_path
# 1           1                                              .                                      Rdev                                                                           Rdev
# 2           2                                           Rdev                                      -dev                                                                      Rdev/-dev
# 3           2                                           Rdev                           00_base_program                                                           Rdev/00_base_program
# 4           2                                           Rdev                               00_protocol                                                               Rdev/00_protocol
# 5           2                                           Rdev                  10_import_clean_datatype                                                  Rdev/10_import_clean_datatype
# 6           2                                           Rdev                    20_tidy_group_by_match                                                    Rdev/20_tidy_group_by_match
# 7           2                                           Rdev            30_transform_scale_categorical                                            Rdev/30_transform_scale_categorical
# 8           2                                           Rdev 40_visualize_explore_bivariate_stratified                                 Rdev/40_visualize_explore_bivariate_stratified
# 9           2                                           Rdev               50_model_formula_evaluation                                               Rdev/50_model_formula_evaluation
# 10          2                                           Rdev              60_communicate_report_export                                              Rdev/60_communicate_report_export
# 11          3                               Rdev/00_protocol                            01_sample_size                                                Rdev/00_protocol/01_sample_size
# 12          3                               Rdev/00_protocol                         05_count_eligible                                             Rdev/00_protocol/05_count_eligible
# 13          3                               Rdev/00_protocol                         06_count_exposure                                             Rdev/00_protocol/06_count_exposure
# 14          3                               Rdev/00_protocol                          07_count_outcome                                              Rdev/00_protocol/07_count_outcome
# 15          3                  Rdev/10_import_clean_datatype                               11_metadata                                      Rdev/10_import_clean_datatype/11_metadata
# 16          3                  Rdev/10_import_clean_datatype                           12_import_files                                  Rdev/10_import_clean_datatype/12_import_files
# 17          3                  Rdev/10_import_clean_datatype                          12_import_sqlite                                 Rdev/10_import_clean_datatype/12_import_sqlite
# 18          3                  Rdev/10_import_clean_datatype                      12_import_vocabulary                             Rdev/10_import_clean_datatype/12_import_vocabulary
# 19          3                  Rdev/10_import_clean_datatype                             13_duplicated                                    Rdev/10_import_clean_datatype/13_duplicated
# 20          3                  Rdev/10_import_clean_datatype                          13_missing_value                                 Rdev/10_import_clean_datatype/13_missing_value
# 21          3                  Rdev/10_import_clean_datatype                             13_split_fold                                    Rdev/10_import_clean_datatype/13_split_fold
# 22          3                  Rdev/10_import_clean_datatype                          15_cleaning_text                                 Rdev/10_import_clean_datatype/15_cleaning_text
# 23          3                  Rdev/10_import_clean_datatype                          15_cleaning_time                                 Rdev/10_import_clean_datatype/15_cleaning_time
# 24          3                  Rdev/10_import_clean_datatype                     16_categorical_factor                            Rdev/10_import_clean_datatype/16_categorical_factor
# 25          3                  Rdev/10_import_clean_datatype                 17_categorical_indicators                        Rdev/10_import_clean_datatype/17_categorical_indicators
# 26          3                  Rdev/10_import_clean_datatype                    18_dichotomous_logical                           Rdev/10_import_clean_datatype/18_dichotomous_logical
# 27          3                  Rdev/10_import_clean_datatype                               19_datetime                                      Rdev/10_import_clean_datatype/19_datetime
# 28          3                  Rdev/10_import_clean_datatype                        19_numeric_integer                               Rdev/10_import_clean_datatype/19_numeric_integer
# 29          3                  Rdev/10_import_clean_datatype                                array_list                                       Rdev/10_import_clean_datatype/array_list
# 30          3                    Rdev/20_tidy_group_by_match                      23_group_by_PersonID                               Rdev/20_tidy_group_by_match/23_group_by_PersonID
# 31          3                    Rdev/20_tidy_group_by_match                       25_study_population                                Rdev/20_tidy_group_by_match/25_study_population
# 32          3                    Rdev/20_tidy_group_by_match                                  27_match                                           Rdev/20_tidy_group_by_match/27_match
# 33          3 Rdev/40_visualize_explore_bivariate_stratified                                43_network                      Rdev/40_visualize_explore_bivariate_stratified/43_network
# 34          3 Rdev/40_visualize_explore_bivariate_stratified                                    44_map                          Rdev/40_visualize_explore_bivariate_stratified/44_map
# 35          3 Rdev/40_visualize_explore_bivariate_stratified                     45_bivariate_measures           Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures
# 36          3 Rdev/40_visualize_explore_bivariate_stratified           47_bivariate_partial_stratified Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified
# 37          3               Rdev/50_model_formula_evaluation                          51_model_formula                              Rdev/50_model_formula_evaluation/51_model_formula
# 38          3               Rdev/50_model_formula_evaluation                        53_model_selection                            Rdev/50_model_formula_evaluation/53_model_selection
# 39          3               Rdev/50_model_formula_evaluation                         55_model_weighted                             Rdev/50_model_formula_evaluation/55_model_weighted
# 40          3               Rdev/50_model_formula_evaluation                        56_model_bootstrap                            Rdev/50_model_formula_evaluation/56_model_bootstrap
# 41          3               Rdev/50_model_formula_evaluation                       57_model_time2event                           Rdev/50_model_formula_evaluation/57_model_time2event
# 42          3               Rdev/50_model_formula_evaluation                       57_model_trajectory                           Rdev/50_model_formula_evaluation/57_model_trajectory
# 43          3               Rdev/50_model_formula_evaluation                       59_model_evaluation                           Rdev/50_model_formula_evaluation/59_model_evaluation


"Rdev" %>% f_path.df_dirs_recursive %>% {.$full_path} %>% sort %>% paste(collapse = "\n") %>% cat #----
"Rdev" %>% f_path.df_dirs_recursive %>% {.$path.basename} %>% sort %>% paste(collapse = "\n") %>% cat #----
# > "Rdev" %>% f_path.df_dirs_recursive %>% {.$full_path} %>% sort %>% paste(collapse = "\n") %>% cat #----
# Rdev
# Rdev/-dev
# Rdev/00_base_program
# Rdev/00_protocol
# Rdev/00_protocol/01_sample_size
# Rdev/00_protocol/05_count_eligible
# Rdev/00_protocol/06_count_exposure
# Rdev/00_protocol/07_count_outcome
# Rdev/10_import_clean_datatype
# Rdev/10_import_clean_datatype/11_metadata
# Rdev/10_import_clean_datatype/12_import_files
# Rdev/10_import_clean_datatype/12_import_sqlite
# Rdev/10_import_clean_datatype/12_import_vocabulary
# Rdev/10_import_clean_datatype/13_duplicated
# Rdev/10_import_clean_datatype/13_missing_value
# Rdev/10_import_clean_datatype/13_split_fold
# Rdev/10_import_clean_datatype/15_cleaning_text
# Rdev/10_import_clean_datatype/15_cleaning_time
# Rdev/10_import_clean_datatype/16_categorical_factor
# Rdev/10_import_clean_datatype/17_categorical_indicators
# Rdev/10_import_clean_datatype/18_dichotomous_logical
# Rdev/10_import_clean_datatype/19_datetime
# Rdev/10_import_clean_datatype/19_numeric_integer
# Rdev/10_import_clean_datatype/array_list
# Rdev/20_tidy_group_by_match
# Rdev/20_tidy_group_by_match/23_group_by_PersonID
# Rdev/20_tidy_group_by_match/25_study_population
# Rdev/20_tidy_group_by_match/27_match
# Rdev/30_transform_scale_categorical
# Rdev/40_visualize_explore_bivariate_stratified
# Rdev/40_visualize_explore_bivariate_stratified/43_network
# Rdev/40_visualize_explore_bivariate_stratified/44_map
# Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures
# Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified
# Rdev/50_model_formula_evaluation
# Rdev/50_model_formula_evaluation/51_model_formula
# Rdev/50_model_formula_evaluation/53_model_selection
# Rdev/50_model_formula_evaluation/55_model_weighted
# Rdev/50_model_formula_evaluation/56_model_bootstrap
# Rdev/50_model_formula_evaluation/57_model_time2event
# Rdev/50_model_formula_evaluation/57_model_trajectory
# Rdev/50_model_formula_evaluation/59_model_evaluation
# Rdev/60_communicate_report_export> "Rdev" %>% f_path.df_dirs_recursive %>% {.$path.basename} %>% sort %>% paste(collapse = "\n") %>% cat #----
# -dev
# 00_base_program
# 00_protocol
# 01_sample_size
# 05_count_eligible
# 06_count_exposure
# 07_count_outcome
# 10_import_clean_datatype
# 11_metadata
# 12_import_files
# 12_import_sqlite
# 12_import_vocabulary
# 13_duplicated
# 13_missing_value
# 13_split_fold
# 15_cleaning_text
# 15_cleaning_time
# 16_categorical_factor
# 17_categorical_indicators
# 18_dichotomous_logical
# 19_datetime
# 19_numeric_integer
# 20_tidy_group_by_match
# 23_group_by_PersonID
# 25_study_population
# 27_match
# 30_transform_scale_categorical
# 40_visualize_explore_bivariate_stratified
# 43_network
# 44_map
# 45_bivariate_measures
# 47_bivariate_partial_stratified
# 50_model_formula_evaluation
# 51_model_formula
# 53_model_selection
# 55_model_weighted
# 56_model_bootstrap
# 57_model_time2event
# 57_model_trajectory
# 59_model_evaluation
# 60_communicate_report_export
# array_list
# Rdev



"Rdev" %>% f_path.df_dirs_recursive %>% 
    select(print_path_tree) %>%
    as.tibble
"Rdev" %>% f_path.df_dirs_recursive %>% 
    select(print_path_tree) %>%
    unlist %>% paste(collapse = "\n") %>% cat #----
# > "Rdev" %>% f_path.df_dirs_recursive %>% 
# +     select(print_path_tree) %>%
# +     as.tibble
# # A tibble: 43 × 1
#    print_path_tree                              
#    <chr>                                        
#  1 "Rdev"                                       
#  2 "\t-dev"                                     
#  3 "\t00_base_program"                          
#  4 "\t00_protocol"                              
#  5 "\t10_import_clean_datatype"                 
#  6 "\t20_tidy_group_by_match"                   
#  7 "\t30_transform_scale_categorical"           
#  8 "\t40_visualize_explore_bivariate_stratified"
#  9 "\t50_model_formula_evaluation"              
# 10 "\t60_communicate_report_export"             
# # ℹ 33 more rows
# # ℹ Use `print(n = ...)` to see more rows
# > "Rdev" %>% f_path.df_dirs_recursive %>% 
# +     select(print_path_tree) %>%
# +     unlist %>% paste(collapse = "\n") %>% cat #----
# Rdev
# 	-dev
# 	00_base_program
# 	00_protocol
# 	10_import_clean_datatype
# 	20_tidy_group_by_match
# 	30_transform_scale_categorical
# 	40_visualize_explore_bivariate_stratified
# 	50_model_formula_evaluation
# 	60_communicate_report_export
# 		01_sample_size
# 		05_count_eligible
# 		06_count_exposure
# 		07_count_outcome
# 		11_metadata
# 		12_import_files
# 		12_import_sqlite
# 		12_import_vocabulary
# 		13_duplicated
# 		13_missing_value
# 		13_split_fold
# 		15_cleaning_text
# 		15_cleaning_time
# 		16_categorical_factor
# 		17_categorical_indicators
# 		18_dichotomous_logical
# 		19_datetime
# 		19_numeric_integer
# 		array_list
# 		23_group_by_PersonID
# 		25_study_population
# 		27_match
# 		43_network
# 		44_map
# 		45_bivariate_measures
# 		47_bivariate_partial_stratified
# 		51_model_formula
# 		53_model_selection
# 		55_model_weighted
# 		56_model_bootstrap
# 		57_model_time2event
# 		57_model_trajectory
# 		59_model_evaluation


f_path.df_dirs_recursive() %>% 
    select(print_path_tree) %>%
    unlist %>% paste(collapse = "\n") %>% cat #----


#@ end ----
