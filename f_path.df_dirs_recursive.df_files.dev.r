#@ f_path.df_dirs_recursive.ls_files.df_files.dev.r


#@ input_path = "Rdev" =====
library(tidyverse)
dir(full.names = FALSE) %>% str #----
dir(full.names = T) %>% str #----
# dir(full.names = T, recursive = T) %>% str #----
# input_path = "Rdev"
# dir(input_path, full.names = T, recursive = T) %>% str #----
# dir(input_path, full.names = T, recursive = T, include.dirs = T) %>% str #----
# setdiff( dir(input_path, full.names = T, recursive = T, include.dirs = T), dir(input_path, full.names = T, recursive = T) ) %>% str #----
# list.dirs(input_path, full.names = TRUE) %>% str #----
# # > dir(full.names = FALSE) %>% str #----
# #  chr [1:37] "-info" "-tmp" "-void.r" "[[Stat]] CRAN R - Shortcut.lnk" "bfg-1.13.0.jar" "bfg.txt" "bfg.zip" ...
# # > dir(full.names = T) %>% str #----
# #  chr [1:37] "./-info" "./-tmp" "./-void.r" "./[[Stat]] CRAN R - Shortcut.lnk" "./bfg-1.13.0.jar" "./bfg.txt" "./bfg.zip" ...
# # > dir(full.names = T, recursive = T) %>% str #----
# #  chr [1:444] "./-info/facets_2017 - annotate (3) tableone_by_P_WH.ge.5.zip" "./-info/facets_2017 - annotate.xlsx - 바로 가기.lnk" ...
# # > input_path = "Rdev"
# # > dir(input_path, full.names = T, recursive = T) %>% str #----
# #  chr [1:231] "Rdev/-dev/object.coxph from analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample -dev.r" ...
# # > dir(input_path, full.names = T, recursive = T, include.dirs = T) %>% str #----
# #  chr [1:273] "Rdev/-dev" "Rdev/-dev/object.coxph from analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample -dev.r" ...
# # > setdiff( dir(input_path, full.names = T, recursive = T, include.dirs = T), dir(input_path, full.names = T, recursive = T) ) %>% str #----
# #  chr [1:42] "Rdev/-dev" "Rdev/00_base_program" "Rdev/00_protocol" "Rdev/00_protocol/01_sample_size" ...
# # > list.dirs(input_path, full.names = TRUE) %>% str #----
# #  chr [1:43] "Rdev" "Rdev/-dev" "Rdev/00_base_program" "Rdev/00_protocol" "Rdev/00_protocol/01_sample_size" ...




library(tidyverse)

f_path.df_dirs_recursive.ls_files <- function(
  input_path = ".", 
  max_depth = 9, 
  current_depth = 0, 
  gitignore_escaped_select.UC = c(
    "\\.RPROJ\\.USER", "\\.RHISTORY", "\\.RDATA", "\\.RUSERDATA",
    ".*\\.ZIP", ".*\\.7Z", ".*\\.RPROJ", "\\.GITIGNORE",
    "MH\\).*\\.R", ".*\\.LNK", ".*ALIAS", ".*\\- VOID.*\\..*", ".*\\-VOID.*\\..*",
    ".*\\- INFO\\..*", ".*\\-INFO\\..*", ".*\\-DEV.*\\..*", ".*DEBUG.*\\..*",
    "\\-TMP", ".*\\- TMP.*\\..*", ".*\\-TMP.*\\..*", ".*\\-LOG.*\\..*",
    ".*\\.RTF", "[\\/\\\\]\\.[^\\/\\\\]"
  )
) {
    if (!dir.exists(input_path)) {
        stop("The specified input_path does not exist or is not a directory.")
    }
    if (current_depth == 0) cat(".Platform$file.sep: ", .Platform$file.sep, "\n")
    if (current_depth == 0) {cat("input_path0: ", input_path0 = input_path, "\n")}
    if (current_depth >= max_depth) {
        return(tibble())
    }

    dirs <- list.dirs(input_path, full.names = TRUE, recursive = FALSE) %>%
        str_subset(paste0(gitignore_escaped_select.UC, collapse = "|") %>% regex(ignore_case = TRUE), negate = TRUE)
    
    df_dirs_recursive0 <- tibble(path.level = integer(), full_path = character())
    
    for (dir in dirs) {
        df_dirs_recursive0 <- bind_rows(df_dirs_recursive0, tibble(path.level = current_depth + 1, full_path = dir))
        
        # Recursively process subdirectories
        df_dirs_recursive0 <- bind_rows(df_dirs_recursive0, f_path.df_dirs_recursive.ls_files(dir, max_depth, current_depth + 1, gitignore_escaped_select.UC))
    }
    
    if (current_depth == 0) {
        cat("Finished iterating through paths.\n")
        
        df_dirs_recursive1 = df_dirs_recursive0 %>% 
            mutate(
                path.parent = dirname(full_path)
                , path.basename = basename(full_path)
                # , path.basename.ext = tools::file_ext(path.basename)
            ) %>% 
            mutate(print_tree_path = map_chr(path.level, ~paste(rep("\t", .x - 1), collapse = "")) %>% paste0(path.basename) ) %>%
            mutate(
                path = full_path %>% {gsub(input_path, "", ., fixed = T)} %>% str_replace_all(paste0("^", .Platform$file.sep), "")
                , normalized_path = normalizePath(full_path, winslash = "/", mustWork = FALSE)
            ) %>% 
            # arrange(path.parent, path.basename) %>% 
            arrange(full_path) %>% 
            as.tibble
        
        df_dirs_recursive2 = df_dirs_recursive1 %>% 
            select(path.level, path, 
                   path.basename, path.parent, 
                   # path.basename.ext, 
                   full_path, normalized_path, 
                   print_tree_path) %>%
            as.tibble
        
        df_dirs_recursive.ls_files1 = df_dirs_recursive2 %>% mutate(
            files = full_path %>% map(function(chr) {list.files(chr, include.dirs = FALSE) %>% str_subset(paste0(gitignore_escaped_select.UC, collapse = "|") %>% regex(ignore_case = TRUE), negate = TRUE)}) 
            , files.r = full_path %>% map(function(chr) {list.files(chr, "\\.r$", ignore.case = T, include.dirs = FALSE)}) 
            , files.rmd = full_path %>% map(function(chr) {list.files(chr, "\\.rmd$", ignore.case = T, include.dirs = FALSE)}) 
            , files.rds = full_path %>% map(function(chr) {list.files(chr, "\\.rds(.xz)?$", ignore.case = T, include.dirs = FALSE)}) 
            , files.rda = full_path %>% map(function(chr) {list.files(chr, "\\.rda(ta)?(.xz)?$", ignore.case = T, include.dirs = FALSE)}) 
        )
        
        df_dirs_recursive.ls_files2 = df_dirs_recursive.ls_files1 %>% 
            mutate(
                print_tree_path_files = 
                    paste0(
                        "@", 
                        print_tree_path,
                        "/\n",
                        map2_chr(
                            path.level, 
                            files, 
                            # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) %>% paste(collapse = "\n") 
                            ~rep("\t", .x-0) %>% paste(collapse = "") %>% paste0(.y) %>% paste(collapse = "\n")
                        ) 
                    )
                , print_tree_path_files.r = 
                    paste0(
                        "@", 
                        print_tree_path,
                        "/\n",
                        map2_chr(
                            path.level, 
                            files.r, 
                            # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) %>% paste(collapse = "\n") 
                            ~rep("\t", .x-0) %>% paste(collapse = "") %>% paste0(.y) %>% paste(collapse = "\n")
                        ) 
                    )
                , print_tree_path_files.rmd = 
                    paste0(
                        "@", 
                        print_tree_path,
                        "/\n",
                        map2_chr(
                            path.level, 
                            files.rmd, 
                            # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) %>% paste(collapse = "\n") 
                            ~rep("\t", .x-0) %>% paste(collapse = "") %>% paste0(.y) %>% paste(collapse = "\n")
                        ) 
                    )
                , print_tree_path_files.rds = 
                    paste0(
                        "@", 
                        print_tree_path,
                        "/\n",
                        map2_chr(
                            path.level, 
                            files.rds, 
                            # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) %>% paste(collapse = "\n") 
                            ~rep("\t", .x-0) %>% paste(collapse = "") %>% paste0(.y) %>% paste(collapse = "\n")
                        ) 
                    )
                , print_tree_path_files.rda = 
                    paste0(
                        "@", 
                        print_tree_path,
                        "/\n",
                        map2_chr(
                            path.level, 
                            files.rda, 
                            # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) %>% paste(collapse = "\n") 
                            ~rep("\t", .x-0) %>% paste(collapse = "") %>% paste0(.y) %>% paste(collapse = "\n")
                        ) 
                    )
                ) %>%
            as.tibble
        df_out = df_dirs_recursive.ls_files2
    } else {
        df_out = df_dirs_recursive0
    }
    return(df_out)
}



#@ df_dirs_recursive = "Rdev" %>% f_path.df_dirs_recursive.ls_files() =======
df_dirs_recursive = f_path.df_dirs_recursive.ls_files()
df_dirs_recursive %>% str(max.level = 2) #----
# df_dirs_recursive %>% {.$full_path} %>% sort %>% paste(collapse = "\n") %>% cat; cat("\n") #----
# df_dirs_recursive %>% {.$path.basename} %>% sort %>% paste(collapse = "\n") %>% cat; cat("\n")  #----
df_dirs_recursive %>% select(path.level, path.parent, path.basename, path, full_path) %>% as.tibble %>% print(n=99) #----
# df_dirs_recursive %>% select(print_tree_path) %>% as.tibble
df_dirs_recursive %>% select(print_tree_path) %>% unlist %>% paste(collapse = "\n") %>% cat; cat("\n")  #----
df_dirs_recursive %>% select(print_tree_path_files) %>% unlist %>% paste(collapse = "\n") %>% cat; cat("\n")  #----
df_dirs_recursive %>% select(print_tree_path_files.rmd) %>% unlist %>% paste(collapse = "\n") %>% cat; cat("\n")  #----
# > df_dirs_recursive = f_path.df_dirs_recursive.ls_files()
# .Platform$file.sep:  / 
# input_path0:  . 
# Finished iterating through paths.
# > df_dirs_recursive %>% str(max.level = 2) #----
# tibble [60 × 17] (S3: tbl_df/tbl/data.frame)
#  $ path.level               : num [1:60] 1 1 2 2 2 3 3 3 3 2 ...
#  $ path                     : chr [1:60] "-info" "Rdev" "Rdev/-dev" "Rdev/00_base_program" ...
#  $ path.basename            : chr [1:60] "-info" "Rdev" "-dev" "00_base_program" ...
#  $ path.parent              : chr [1:60] "." "." "./Rdev" "./Rdev" ...
#  $ full_path                : chr [1:60] "./-info" "./Rdev" "./Rdev/-dev" "./Rdev/00_base_program" ...
#  $ normalized_path          : chr [1:60] "D:/OneDrive/[][Rproject]/github_tidystat/-info" "D:/OneDrive/[][Rproject]/github_tidystat/Rdev" "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/-dev" "D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_base_program" ...
#  $ print_tree_path          : chr [1:60] "-info" "Rdev" "\t-dev" "\t00_base_program" ...
#  $ files                    :List of 60
#  $ files.r                  :List of 60
#  $ files.rmd                :List of 60
#  $ files.rds                :List of 60
#  $ files.rda                :List of 60
#  $ print_tree_path_files    : chr [1:60] "@-info/\n\tFACETS_data_2017.NA.NonLatino.tableone_by_P_WH.ge.5 -annotate.xlsx\n\tJK2079.GY20CCW.bind_rows0213.M"| __truncated__ "@Rdev/\n\t-dev\n\t00_base_program\n\t00_protocol\n\t10_import_clean_datatype\n\t20_tidy_group_by_match\n\t30_tr"| __truncated__ "@\t-dev/\n\t\t" "@\t00_base_program/\n\t\tfunction.alarm.dev.r\n\t\tfunction.attach.dev.r\n\t\tfunction.calculate_mode.sou"| __truncated__ ...
#  $ print_tree_path_files.r  : chr [1:60] "@-info/\n\t" "@Rdev/\n\tdata.variable.Date.nID_anyTRUE_allTRUE.dev.r\n\tdata.variable.Date.nID_TRUE_NA.dev.r\n\tflowcha"| __truncated__ "@\t-dev/\n\t\tobject.coxph from analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample -dev.r" "@\t00_base_program/\n\t\tfunction.alarm.dev.r\n\t\tfunction.attach.dev.r\n\t\tfunction.calculate_mode.sou"| __truncated__ ...
#  $ print_tree_path_files.rmd: chr [1:60] "@-info/\n\t" "@Rdev/\n\t" "@\t-dev/\n\t\t" "@\t00_base_program/\n\t\t" ...
#  $ print_tree_path_files.rds: chr [1:60] "@-info/\n\t" "@Rdev/\n\t" "@\t-dev/\n\t\t" "@\t00_base_program/\n\t\t" ...
#  $ print_tree_path_files.rda: chr [1:60] "@-info/\n\t" "@Rdev/\n\tenv.custom.fun.t.tribble_construct.RData" "@\t-dev/\n\t\t" "@\t00_base_program/\n\t\t" ...
# > # df_dirs_recursive %>% {.$full_path} %>% sort %>% paste(collapse = "\n") %>% cat; cat("\n") #----
# > # df_dirs_recursive %>% {.$path.basename} %>% sort %>% paste(collapse = "\n") %>% cat; cat("\n")  #----
# > df_dirs_recursive %>% select(path.level, path.parent, path.basename, path, full_path) %>% as.tibble %>% print(n=99) #----
# # A tibble: 60 × 5
#    path.level path.parent                                      path.basename                             path                          full_path
#         <dbl> <chr>                                            <chr>                                     <chr>                         <chr>    
#  1          1 .                                                -info                                     -info                         ./-info  
#  2          1 .                                                Rdev                                      Rdev                          ./Rdev   
#  3          2 ./Rdev                                           -dev                                      Rdev/-dev                     ./Rdev/-…
#  4          2 ./Rdev                                           00_base_program                           Rdev/00_base_program          ./Rdev/0…
#  5          2 ./Rdev                                           00_protocol                               Rdev/00_protocol              ./Rdev/0…
#  6          3 ./Rdev/00_protocol                               01_sample_size                            Rdev/00_protocol/01_sample_s… ./Rdev/0…
#  7          3 ./Rdev/00_protocol                               05_count_eligible                         Rdev/00_protocol/05_count_el… ./Rdev/0…
#  8          3 ./Rdev/00_protocol                               06_count_exposure                         Rdev/00_protocol/06_count_ex… ./Rdev/0…
#  9          3 ./Rdev/00_protocol                               07_count_outcome                          Rdev/00_protocol/07_count_ou… ./Rdev/0…
# 10          2 ./Rdev                                           10_import_clean_datatype                  Rdev/10_import_clean_datatype ./Rdev/1…
# 11          3 ./Rdev/10_import_clean_datatype                  11_metadata                               Rdev/10_import_clean_datatyp… ./Rdev/1…
# 12          3 ./Rdev/10_import_clean_datatype                  12_import_files                           Rdev/10_import_clean_datatyp… ./Rdev/1…
# 13          3 ./Rdev/10_import_clean_datatype                  12_import_sqlite                          Rdev/10_import_clean_datatyp… ./Rdev/1…
# 14          3 ./Rdev/10_import_clean_datatype                  12_import_vocabulary                      Rdev/10_import_clean_datatyp… ./Rdev/1…
# 15          3 ./Rdev/10_import_clean_datatype                  13_duplicated                             Rdev/10_import_clean_datatyp… ./Rdev/1…
# 16          3 ./Rdev/10_import_clean_datatype                  13_missing_value                          Rdev/10_import_clean_datatyp… ./Rdev/1…
# 17          3 ./Rdev/10_import_clean_datatype                  13_split_fold                             Rdev/10_import_clean_datatyp… ./Rdev/1…
# 18          3 ./Rdev/10_import_clean_datatype                  15_cleaning_text                          Rdev/10_import_clean_datatyp… ./Rdev/1…
# 19          3 ./Rdev/10_import_clean_datatype                  15_cleaning_time                          Rdev/10_import_clean_datatyp… ./Rdev/1…
# 20          3 ./Rdev/10_import_clean_datatype                  16_categorical_factor                     Rdev/10_import_clean_datatyp… ./Rdev/1…
# 21          3 ./Rdev/10_import_clean_datatype                  17_categorical_indicators                 Rdev/10_import_clean_datatyp… ./Rdev/1…
# 22          3 ./Rdev/10_import_clean_datatype                  18_dichotomous_logical                    Rdev/10_import_clean_datatyp… ./Rdev/1…
# 23          3 ./Rdev/10_import_clean_datatype                  19_datetime                               Rdev/10_import_clean_datatyp… ./Rdev/1…
# 24          3 ./Rdev/10_import_clean_datatype                  19_numeric_integer                        Rdev/10_import_clean_datatyp… ./Rdev/1…
# 25          3 ./Rdev/10_import_clean_datatype                  array_list                                Rdev/10_import_clean_datatyp… ./Rdev/1…
# 26          2 ./Rdev                                           20_tidy_group_by_match                    Rdev/20_tidy_group_by_match   ./Rdev/2…
# 27          3 ./Rdev/20_tidy_group_by_match                    23_group_by_PersonID                      Rdev/20_tidy_group_by_match/… ./Rdev/2…
# 28          3 ./Rdev/20_tidy_group_by_match                    25_study_population                       Rdev/20_tidy_group_by_match/… ./Rdev/2…
# 29          3 ./Rdev/20_tidy_group_by_match                    27_match                                  Rdev/20_tidy_group_by_match/… ./Rdev/2…
# 30          2 ./Rdev                                           30_transform_scale_categorical            Rdev/30_transform_scale_cate… ./Rdev/3…
# 31          2 ./Rdev                                           40_visualize_explore_bivariate_stratified Rdev/40_visualize_explore_bi… ./Rdev/4…
# 32          3 ./Rdev/40_visualize_explore_bivariate_stratified 43_network                                Rdev/40_visualize_explore_bi… ./Rdev/4…
# 33          3 ./Rdev/40_visualize_explore_bivariate_stratified 44_map                                    Rdev/40_visualize_explore_bi… ./Rdev/4…
# 34          3 ./Rdev/40_visualize_explore_bivariate_stratified 45_bivariate_measures                     Rdev/40_visualize_explore_bi… ./Rdev/4…
# 35          3 ./Rdev/40_visualize_explore_bivariate_stratified 47_bivariate_partial_stratified           Rdev/40_visualize_explore_bi… ./Rdev/4…
# 36          2 ./Rdev                                           50_model_formula_evaluation               Rdev/50_model_formula_evalua… ./Rdev/5…
# 37          3 ./Rdev/50_model_formula_evaluation               51_model_formula                          Rdev/50_model_formula_evalua… ./Rdev/5…
# 38          3 ./Rdev/50_model_formula_evaluation               53_model_selection                        Rdev/50_model_formula_evalua… ./Rdev/5…
# 39          3 ./Rdev/50_model_formula_evaluation               55_model_weighted                         Rdev/50_model_formula_evalua… ./Rdev/5…
# 40          3 ./Rdev/50_model_formula_evaluation               56_model_bootstrap                        Rdev/50_model_formula_evalua… ./Rdev/5…
# 41          3 ./Rdev/50_model_formula_evaluation               57_model_time2event                       Rdev/50_model_formula_evalua… ./Rdev/5…
# 42          3 ./Rdev/50_model_formula_evaluation               57_model_trajectory                       Rdev/50_model_formula_evalua… ./Rdev/5…
# 43          3 ./Rdev/50_model_formula_evaluation               59_model_evaluation                       Rdev/50_model_formula_evalua… ./Rdev/5…
# 44          2 ./Rdev                                           60_communicate_report_export              Rdev/60_communicate_report_e… ./Rdev/6…
# 45          1 .                                                Rmd                                       Rmd                           ./Rmd    
# 46          1 .                                                Rplot                                     Rplot                         ./Rplot  
# 47          1 .                                                data                                      data                          ./data   
# 48          2 ./data                                           ATC_RxNorm_NDC                            data/ATC_RxNorm_NDC           ./data/A…
# 49          1 .                                                examples                                  examples                      ./exampl…
# 50          1 .                                                other                                     other                         ./other  
# 51          2 ./other                                          Bash                                      other/Bash                    ./other/…
# 52          2 ./other                                          Batch                                     other/Batch                   ./other/…
# 53          2 ./other                                          C                                         other/C                       ./other/C
# 54          2 ./other                                          Excel                                     other/Excel                   ./other/…
# 55          2 ./other                                          ODBC                                      other/ODBC                    ./other/…
# 56          2 ./other                                          SAS                                       other/SAS                     ./other/…
# 57          2 ./other                                          Stata                                     other/Stata                   ./other/…
# 58          2 ./other                                          VBA                                       other/VBA                     ./other/…
# 59          1 .                                                tests                                     tests                         ./tests  
# 60          1 .                                                vignettes                                 vignettes                     ./vignet…
# > # df_dirs_recursive %>% select(print_tree_path) %>% as.tibble
# > df_dirs_recursive %>% select(print_tree_path) %>% unlist %>% paste(collapse = "\n") %>% cat; cat("\n")  #----
# -info
# Rdev
# 	-dev
# 	00_base_program
# 	00_protocol
# 		01_sample_size
# 		05_count_eligible
# 		06_count_exposure
# 		07_count_outcome
# 	10_import_clean_datatype
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
# 	20_tidy_group_by_match
# 		23_group_by_PersonID
# 		25_study_population
# 		27_match
# 	30_transform_scale_categorical
# 	40_visualize_explore_bivariate_stratified
# 		43_network
# 		44_map
# 		45_bivariate_measures
# 		47_bivariate_partial_stratified
# 	50_model_formula_evaluation
# 		51_model_formula
# 		53_model_selection
# 		55_model_weighted
# 		56_model_bootstrap
# 		57_model_time2event
# 		57_model_trajectory
# 		59_model_evaluation
# 	60_communicate_report_export
# Rmd
# Rplot
# data
# 	ATC_RxNorm_NDC
# examples
# other
# 	Bash
# 	Batch
# 	C
# 	Excel
# 	ODBC
# 	SAS
# 	Stata
# 	VBA
# tests
# vignettes



# df_dirs_recursive = "Rdev" %>% f_path.df_dirs_recursive.ls_files()
#' > df_dirs_recursive %>% select(print_tree_path_files) %>% unlist %>% paste(collapse = "\n") %>% cat; cat("\n")  #----
#' @-dev/
#' 	object.coxph from analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample -dev.r
#' @00_base_program/
#' 	function.alarm.dev.r
#' 	function.attach.dev.r
#' 	function.calculate_mode.dev.r
#' 	function.checkpoint.dev.r
#' 	function.compiler.dev.r
#' 	function.convert_to_standard_name.dev.r
#' 	function.deparse.cat.width.dev.r
#' 	function.dput.dev.r
#' 	function.eval.parse.Vectorize.dev.r
#' 	function.file.path.dev.r
#' 	function.FindDuplicateFiles.dev.r
#' 	function.frequencyDF.dev.r
#' 	function.group_by.do.dev.r
#' 	function.hangul.source -dev -old.r
#' 	function.hangul.source -dev -old2.r
#' 	function.hangul.source -dev.r
#' 	function.hangul.dev.r
#' 	function.iconv.dev.r
#' 	function.install.packages.dev.r
#' 	function.object.str_summary.dev.r
#' 	function.pipe.dev.r
#' 	function.print.options.dev.r
#' 	function.read_encoded_csv.dev.r
#' 	function.readClipboard.dev.r
#' 	function.rm_attr.dev.r
#' 	function.safe_sum.dev.r
#' 	function.show_c_source.dev.r
#' 	function.Stata2R.dev.r
#' 	function.str.dev.r
#' 	function.str2.longest_common_prefix.dev.r
#' 	function.Sys.setenv.dev.r
#' 	function.text2quo.dev.r
#' 	function.transpose_tibble.dev.r
#' 	function.write_rds.xz.dev.r
#' 	InputData.list_All from -void.r
#' 	library(dplyr) nest().r
#' 	map.parent_name.dev.r
#' 	objectname.write_rds.dev.r
#' 	options.r
#' 	Rprofile.r
#' 	Rsnapshot.r
#' @00_protocol/
#' 	01_sample_size
#' 	05_count_eligible
#' 	06_count_exposure
#' 	07_count_outcome
#' @	01_sample_size/
#' 		Rstata power cox.r
#' 		Rstata power mcc.r
#' 		Rstata power onemean twomeans.r
#' 		Rstata power oneproportion twoproportions.r
#' 		Sample size calculations in clinical research 2ed 2008.pdf - Shortcut.lnk
#' 		Sample size for diagnostic test.r
#' @	05_count_eligible/
#' 		
#' @	06_count_exposure/
#' 		
#' @	07_count_outcome/
#' 		
#' @10_import_clean_datatype/
#' 	11_metadata
#' 	12_import_files
#' 	12_import_sqlite
#' 	12_import_vocabulary
#' 	13_duplicated
#' 	13_missing_value
#' 	13_split_fold
#' 	15_cleaning_text
#' 	15_cleaning_time
#' 	16_categorical_factor
#' 	17_categorical_indicators
#' 	18_dichotomous_logical
#' 	19_datetime
#' 	19_numeric_integer
#' 	array_list
#' @	11_metadata/
#' 		fun.data.primarykey.dev.r
#' 		function.metadata.dev.r
#' @	12_import_files/
#' 		dir() read_dta() write_rds().r
#' 		dir() read_rda() write_rds().r
#' 		dir() read_rds(filenames2read).r
#' 		dir() read_sas() write_rds().r
#' 		function.list.files.file.info.dev.r
#' 		function.list.files.read.sqlite.dev.r
#' 		function.read_excel_allsheets.dev.r
#' 		read.csv(Population-UTF-8.CSV).r
#' @	12_import_sqlite/
#' 		function.sqlite.dbListTables.dbListFields.ifelse.bindcols.dev.r
#' 		function.sqlite.index.dev.r
#' 		function.sqlite.tbl.dev.r
#' @	12_import_vocabulary/
#' 		ATC_RxNorm_NDC from .r
#' 		function.OMOP_CommonDataModel.ATC_to_NDC.dev.r
#' 		function.OMOP_CommonDataModel.RxNorm_to_NDC.dev.r
#' @	13_duplicated/
#' 		data.duplicated.dev.r
#' 		function.left_anti_join.dev.r
#' @	13_missing_value/
#' 		data.mutate_at.rename_at.dev.r
#' 		data.NA.recode.dev.r
#' 		data.NotNA_p_df.dev.r
#' 		data.nproptable.dev.r
#' 		data.rm_cols_na.dev.r
#' 		data.summarize_all_sum_is.na.dev.r
#' @	13_split_fold/
#' 		function.vec.fold.index.dev.r
#' @	15_cleaning_text/
#' 		function.character.clean.dev.r
#' 		function.cleanHTML.dev.r
#' 		function.compareSentences.dev.r
#' 		function.RegEx.except.dev.r
#' 		function.sequence_with_leading_zeros.dev.r
#' 		function.str_extract_dose.dev.r
#' 		function.str_split_subset.dev.r
#' 		function.string.mutate.dev.r
#' 		function.vector.filterRegEx.dev.r
#' @	15_cleaning_time/
#' 		function.add_months.dev.r
#' 		function.floor_month.dev.r
#' 		function.time_since_t0.dev.r
#' 		function.YYYYMM_to_Date.dev.r
#' @	16_categorical_factor/
#' 		add.Date_ICD_chapter.dev.r
#' 		data.add_AgeGroup_Decade.dev.r
#' 		data.add_BMI.cut4.dev.r
#' 		data.add_BP_HTN_140_90.dev.r
#' 		data.add_FPG_ge100lt126.dev.r
#' 		data.add_IncomeQuartile_MedicalAid.dev.r
#' 		data.recode_Sex.dev.r
#' 		data_frame.map_df.as.factor.dev.r
#' 		function.cut_quartile.dev.r
#' @	17_categorical_indicators/
#' 		function.df_dummy2factor.dev.r
#' 		function.df_factor.one_hot_encode.dev.r
#' 		function.indicators2factor.dev.r
#' @	18_dichotomous_logical/
#' 		function.dichotomous2logical.dev.r
#' 		function.ExpressionText2StandardName.dev.r
#' 		function.is2level.dev.r
#' 		function.mutate_all.apply_ExpressionText.dev.r
#' @	19_datetime/
#' 		function.Time2RelativeTime.dev.r
#' @	19_numeric_integer/
#' 		function.check.integer.microbenchmark.r
#' 		function.check.integer.dev.r
#' 		function.df_continuous_vars.normalize.dev.r
#' 		function.numeric2integer.dev.r
#' @	array_list/
#' 		function.list_df2array.dev.r
#' 		function.vector2list.dev.r
#' 		help.array.r
#' 		list_list.to.data_frame.dev.r
#' 		list3d.to.array3d.dev.r
#' @20_tidy_group_by_match/
#' 	23_group_by_PersonID
#' 	25_study_population
#' 	27_match
#' 	data.CaseCtrl.list.source.zip
#' 	data.ExposedUnexposed.list.dev.r
#' @	23_group_by_PersonID/
#' 		data.byID_filter_min_rank.dev.r
#' 		data.byID_filter_minDate_maxDate.dev.r
#' 		function.filter.PrimaryKey_duplicated.dev.r
#' @	25_study_population/
#' 		data.drop_pmhx_negativetime.dev.r
#' 		tblPersonID_FilterName.ndDate.append_FilterRegexMet.dev.r
#' 		tblPersonID_FilterName.ndDate_CriteriaID.lgl.dev.r
#' @	27_match/
#' 		data.stratified.ccwc.dev.r
#' 		data.stratified.Match.dev.r
#' 		function.MatchingPairID_Case_Ctrl_shuffle.source.zip
#' 		function.MatchingPairID_Exposed_Unexposed_shuffle.microbenchmark.r
#' 		function.MatchingPairID_Exposed_Unexposed_shuffle.dev.r
#' @30_transform_scale_categorical/
#' 	data.recode.factor.dev.r
#' 	function.cut.quantile.dev.r
#' 	function.df2df_wave.dev.r
#' 	function.df2df_wave_cumulative.dev.r
#' 	function.df2matrix_wave.dev.r
#' 	function.rz_transformation.dev.r
#' @40_visualize_explore_bivariate_stratified/
#' 	43_network
#' 	44_map
#' 	45_bivariate_measures
#' 	45_bivariate_measures - Shortcut.lnk
#' 	47_bivariate_partial_stratified
#' 	59_model_evaluation - Shortcut.lnk
#' 	data.conditional_expectation.dev.r
#' 	data.ggplot.dev.r
#' @	43_network/
#' 		data.lgl.comat.gather.microbenchmark.r
#' 		data.lgl.comat.gather.dev.r
#' 		data_V1_V2_EdgeWeight.igraph.source -dev.r
#' 		data_V1_V2_EdgeWeight.igraph.source -void.r
#' 		data_V1_V2_EdgeWeight.igraph.source -void2.r
#' 		data_V1_V2_EdgeWeight.igraph.source -void3.r
#' 		data_V1_V2_EdgeWeight.igraph.dev.r
#' 		data_V1_V2_EdgeWeight.statnet.df.dev.r
#' @	44_map/
#' 		function.MK.ClinicCluster.source) Run This.r
#' 		function.MK.ClinicCluster.dev.r
#' 		function.MK.Cluster4NoSingle.dev.r
#' 		function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$Min.SC0.4$Max.Distance10$Min.Pop10000.pdf
#' 		function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$Min.SC0.4$Max.Distance10$Min.Pop30000.pdf
#' 		function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$Min.SC0.4$Max.Distance30$Min.Pop10000.pdf
#' 		function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$Min.SC0.4$Max.Distance30$Min.Pop30000.pdf
#' 		function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$Min.SC0.5$Max.Distance10$Min.Pop10000.pdf
#' 		function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$Min.SC0.5$Max.Distance10$Min.Pop30000.pdf
#' 		function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$Min.SC0.5$Max.Distance30$Min.Pop10000.pdf
#' 		function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows.map$Min.SC0.5$Max.Distance30$Min.Pop30000.pdf
#' 		function.shapefile.fortify.join.dev.r
#' @	45_bivariate_measures/
#' 		45_bivariate_measures - Shortcut.lnk
#' 		59_model_evaluation - Shortcut.lnk
#' 		function.df_nTotal_nEvent.append_CI.dev.r
#' 		matrix2x2.OR_CI_phi.dev.r
#' @	47_bivariate_partial_stratified/
#' 		array3d_R_C_strata.OR_CI_partial_cor_strata.dev.r
#' 		x1x2z.partial_correlation_dbl() -dev 180523.r
#' 		x1x2z.patial_correlation.microbenchmark.r
#' 		x1x2z.patial_correlation.dev.r
#' @50_model_formula_evaluation/
#' 	45_bivariate_measures - Shortcut.lnk
#' 	51_model_formula
#' 	53_model_selection
#' 	55_model_weighted
#' 	56_model_bootstrap
#' 	57_model_time2event
#' 	57_model_trajectory
#' 	59_model_evaluation
#' 	59_model_evaluation - Shortcut.lnk
#' 	function.matrix.split.dev.r
#' @	51_model_formula/
#' 		function.formula2text.dev.r
#' 		function.txt4varnames.ssv2formula.dev.r
#' @	53_model_selection/
#' 		trainset.cv.glmnet_alphas_cox.source -void.zip
#' 		trainset.cv.glmnet_alphas_cox.dev.r
#' @	55_model_weighted/
#' 		function.learn_wt.list.dev.r
#' 		function.svyglm.MainModel.byEffectModifier.dev.r
#' 		function.weighted.sum.dev.r
#' 		function.weighted_join_FIPS_HANES.dev.r
#' @	56_model_bootstrap/
#' 		function.boot.statistic_glm_coef.dev.r
#' 		function.boot.statistic_RiskDifference.dev.r
#' 		function.Data_Exposure_Outcome_shuffle.dev.r
#' @	57_model_time2event/
#' 		AnalyticDataset$Time2Censor_NewDMv3.rmd
#' 		AnalyticDataset.censor5yr.survfit.ggsurvplot_CIRiskTableP -old.rmd
#' 		AnalyticDataset.censor5yr.survfit.ggsurvplot_CIRiskTableP.source -old.r
#' 		AnalyticDataset.CensorEND.survfit.ggsurvplot_CIRiskTableP.rmd
#' 		AnalyticDataset.CensorLastMeasure.survfit.ggsurvplot_CIRiskTableP.rmd
#' 		AnalyticDataset.pairwise_survdiff_bonferroni.dev.r
#' 		data.PersonTime.dev.r
#' 		formulas4coxph_model_list.dev.r
#' @	57_model_trajectory/
#' 		function.traj_clusters_by_time.dev.r
#' @	59_model_evaluation/
#' 		45_bivariate_measures - Shortcut.lnk
#' 		59_model_evaluation - Shortcut.lnk
#' 		function.ConfusionMatrix.asSquareMatrix.dev.r
#' 		function.ConfusionMatrix.Metrics.bootstrapCI.dev.r
#' 		function.ConfusionMatrix.Metrics.dev.r
#' 		function.threshold_roc.plot.dev.r
#' @60_communicate_report_export/
#' 	calculate.smd.dev.r
#' 	data.CreateTableOne.source (github 1017).zip
#' 	data.CreateTableOne.dev.r
#' 	data.CreateTableOne.source.zip
#' 	data.gather.group_by_variable.dev.r
#' 	data.median_IQR.dev.r
#' 	data_factor.byExposure.table_proptable.dev.r
#' 	data_logical.byExposure.table_proptable.dev.r
#' 	function.calculatePersonTime.dev.r
#' 	function.Code_vec.list.dot_x.dev.r
#' 	function.ggplot.ORCI.dev.r
#' 	function.glm_object.summary.exp() -debug 180806.r
#' 	function.HazardRatios.spread.dev.r
#' 	function.list_df2xlsx.dev.r
#' 	function.lm_object.coef.lsmeans.source -dev.r
#' 	function.lm_object.summary.coefCI.dev.r
#' 	function.polr_object.summary.exp.dev.r
#' 	function.prop.table.addmargins.dev.r
#' 	function.RiskDifferenceCI.dev.r
#' 	function.tbl_varname_level_HRCI.dev.r
#' 	function.tbl_varname_level_ORCI.dev.r



#@ end ----
