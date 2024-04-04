#@ f_path.df_files_recursive.source.r

#@ input_path = "Rdev" =====
library(tidyverse)
dir(full.names = FALSE) %>% str #----
dir(full.names = T) %>% str #----
dir(full.names = T, recursive = T, include.dirs = FALSE) %>% str #----
input_path = "Rdev"
dir(input_path, full.names = T, recursive = T, include.dirs = FALSE) %>% str #----
# > dir(full.names = FALSE) %>% str #----
#  chr [1:37] "-info" "-tmp" "-void.r" "[[Stat]] CRAN R - Shortcut.lnk" "bfg-1.13.0.jar" "bfg.txt" "bfg.zip" ...
# > dir(full.names = T) %>% str #----
#  chr [1:37] "./-info" "./-tmp" "./-void.r" "./[[Stat]] CRAN R - Shortcut.lnk" "./bfg-1.13.0.jar" "./bfg.txt" "./bfg.zip" ...
# > dir(full.names = T, recursive = T, include.dirs = FALSE) %>% str #----
#  chr [1:444] "./-info/facets_2017 - annotate (3) tableone_by_P_WH.ge.5.zip" "./-info/facets_2017 - annotate.xlsx - 바로 가기.lnk" ...
# > input_path = "Rdev"
# > dir(input_path, full.names = T, recursive = T, include.dirs = FALSE) %>% str #----
#  chr [1:231] "Rdev/-dev/object.coxph from analyticDF_C24.drop_pmhx_negativetime._5yr.cut.01sample -dev.r" ...


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


#@ df_files1 =====
df_files1 = tibble(full_path = c(dir(), dir(input_path, full.names = T, recursive = T, include.dirs = FALSE))) %>%
    mutate(
        path.dirname = dirname(full_path),
        path.basename = basename(full_path),
        path.basename.ext = tools::file_ext(path.basename)
    ) %>% 
    select(path.dirname, path.basename, path.basename.ext, full_path) %>%
    f_df.add_UC %>% 
    mutate(
        # Calculate the level of each path
        path.level = str_count(full_path, "/") + 0
    ) %>% 
    select(path.level, everything()) %>% 
    arrange(path.dirname, path.basename) %>% 
    # select(matches("UC")) %>% 
    as.tibble

df_files1 %>% select(full_path) #----
df_files1 %>% filter(path.dirname != ".") %>% select(full_path)  #----
df_files1 %>% select(-matches("full_path")) #----
df_files1 %>% filter(path.dirname != ".") %>% select(-matches("full_path")) #----
df_files1 %>% filter(!path.dirname %in% c(".", "Rdev")) %>% select(-matches("full_path")) #----
# > df_files1 %>% select(full_path) #----
# # A tibble: 268 × 1
#    full_path                                                   
#    <chr>                                                       
#  1 -info                                                       
#  2 -tmp                                                        
#  3 -void.r                                                     
#  4 Blank) env.custom.fun.t.tribble_construct.Rmd - Shortcut.lnk
#  5 Blank.Rmd - Shortcut.lnk                                    
#  6 Encoding.txt                                                
#  7 README.md                                                   
#  8 RStudio.Cloud set up.r                                      
#  9 RStudio.cloud.Rproj                                         
# 10 Rdev                                                        
# # ℹ 258 more rows
# # ℹ Use `print(n = ...)` to see more rows
# > df_files1 %>% filter(path.dirname != ".") %>% select(full_path)  #----
# # A tibble: 231 × 1
#    full_path                                           
#    <chr>                                               
#  1 Rdev/data.variable.Date.nID_TRUE_NA.source.r        
#  2 Rdev/data.variable.Date.nID_anyTRUE_allTRUE.source.r
#  3 Rdev/env.custom.fun.t.tribble_construct.RData       
#  4 Rdev/env.custom.fun.t.tribble_construct.Rmd         
#  5 Rdev/env.custom.fun.t.tribble_construct.source.r    
#  6 Rdev/flowchart_inclusion_exclusions.source.r        
#  7 Rdev/fun.df.transpose.source.r                      
#  8 Rdev/fun.path_files_size.source.r                   
#  9 Rdev/fun.split_save_ICD1.source.r                   
# 10 Rdev/function.combination.source.r                  
# # ℹ 221 more rows
# # ℹ Use `print(n = ...)` to see more rows
# > df_files1 %>% select(-matches("full_path")) #----
# # A tibble: 268 × 7
#    path.level path.dirname path.basename                                                path.basename.ext path.dirname.UC path.basename.UC     path.basename.ext.UC
#         <dbl> <chr>        <chr>                                                        <chr>             <chr>           <chr>                <chr>               
#  1          0 .            -info                                                        ""                .               -INFO                ""                  
#  2          0 .            -tmp                                                         ""                .               -TMP                 ""                  
#  3          0 .            -void.r                                                      "r"               .               -VOID.R              "R"                 
#  4          0 .            Blank) env.custom.fun.t.tribble_construct.Rmd - Shortcut.lnk "lnk"             .               BLANK) ENV.CUSTOM.F… "LNK"               
#  5          0 .            Blank.Rmd - Shortcut.lnk                                     "lnk"             .               BLANK.RMD - SHORTCU… "LNK"               
#  6          0 .            Encoding.txt                                                 "txt"             .               ENCODING.TXT         "TXT"               
#  7          0 .            README.md                                                    "md"              .               README.MD            "MD"                
#  8          0 .            RStudio.Cloud set up.r                                       "r"               .               RSTUDIO.CLOUD SET U… "R"                 
#  9          0 .            RStudio.cloud.Rproj                                          "Rproj"           .               RSTUDIO.CLOUD.RPROJ  "RPROJ"             
# 10          0 .            Rdev                                                         ""                .               RDEV                 ""                  
# # ℹ 258 more rows
# # ℹ Use `print(n = ...)` to see more rows
# > df_files1 %>% filter(path.dirname != ".") %>% select(-matches("full_path")) #----
# # A tibble: 231 × 7
#    path.level path.dirname path.basename                                   path.basename.ext path.dirname.UC path.basename.UC                  path.basename.ext.UC
#         <dbl> <chr>        <chr>                                           <chr>             <chr>           <chr>                             <chr>               
#  1          1 Rdev         data.variable.Date.nID_TRUE_NA.source.r         r                 RDEV            DATA.VARIABLE.DATE.NID_TRUE_NA.S… R                   
#  2          1 Rdev         data.variable.Date.nID_anyTRUE_allTRUE.source.r r                 RDEV            DATA.VARIABLE.DATE.NID_ANYTRUE_A… R                   
#  3          1 Rdev         env.custom.fun.t.tribble_construct.RData        RData             RDEV            ENV.CUSTOM.FUN.T.TRIBBLE_CONSTRU… RDATA               
#  4          1 Rdev         env.custom.fun.t.tribble_construct.Rmd          Rmd               RDEV            ENV.CUSTOM.FUN.T.TRIBBLE_CONSTRU… RMD                 
#  5          1 Rdev         env.custom.fun.t.tribble_construct.source.r     r                 RDEV            ENV.CUSTOM.FUN.T.TRIBBLE_CONSTRU… R                   
#  6          1 Rdev         flowchart_inclusion_exclusions.source.r         r                 RDEV            FLOWCHART_INCLUSION_EXCLUSIONS.S… R                   
#  7          1 Rdev         fun.df.transpose.source.r                       r                 RDEV            FUN.DF.TRANSPOSE.SOURCE.R         R                   
#  8          1 Rdev         fun.path_files_size.source.r                    r                 RDEV            FUN.PATH_FILES_SIZE.SOURCE.R      R                   
#  9          1 Rdev         fun.split_save_ICD1.source.r                    r                 RDEV            FUN.SPLIT_SAVE_ICD1.SOURCE.R      R                   
# 10          1 Rdev         function.combination.source.r                   r                 RDEV            FUNCTION.COMBINATION.SOURCE.R     R                   
# # ℹ 221 more rows
# # ℹ Use `print(n = ...)` to see more rows
# > df_files1 %>% filter(!path.dirname %in% c(".", "Rdev")) %>% select(-matches("full_path")) #----
# # A tibble: 213 × 7
#    path.level path.dirname         path.basename                                            path.basename.ext path.dirname.UC path.basename.UC path.basename.ext.UC
#         <dbl> <chr>                <chr>                                                    <chr>             <chr>           <chr>            <chr>               
#  1          2 Rdev/-dev            object.coxph from analyticDF_C24.drop_pmhx_negativetime… r                 RDEV/-DEV       OBJECT.COXPH FR… R                   
#  2          2 Rdev/00_base_program InputData.list_All from -void.r                          r                 RDEV/00_BASE_P… INPUTDATA.LIST_… R                   
#  3          2 Rdev/00_base_program Rprofile.r                                               r                 RDEV/00_BASE_P… RPROFILE.R       R                   
#  4          2 Rdev/00_base_program Rsnapshot.r                                              r                 RDEV/00_BASE_P… RSNAPSHOT.R      R                   
#  5          2 Rdev/00_base_program function.FindDuplicateFiles.source.r                     r                 RDEV/00_BASE_P… FUNCTION.FINDDU… R                   
#  6          2 Rdev/00_base_program function.Stata2R.source.R                                R                 RDEV/00_BASE_P… FUNCTION.STATA2… R                   
#  7          2 Rdev/00_base_program function.Sys.setenv.source.r                             r                 RDEV/00_BASE_P… FUNCTION.SYS.SE… R                   
#  8          2 Rdev/00_base_program function.alarm.source.r                                  r                 RDEV/00_BASE_P… FUNCTION.ALARM.… R                   
#  9          2 Rdev/00_base_program function.attach.source.r                                 r                 RDEV/00_BASE_P… FUNCTION.ATTACH… R                   
# 10          2 Rdev/00_base_program function.calculate_mode.source.r                         r                 RDEV/00_BASE_P… FUNCTION.CALCUL… R                   
# # ℹ 203 more rows
# # ℹ Use `print(n = ...)` to see more rows





# df_files1$path.dirname.UC %>% unique %>% as.list %>% str #----
df_files1$path.dirname.UC %>% table #----
df_files1$path.basename.ext.UC %>% table #----
# > df_files1$path.dirname.UC %>% table #----
# .
#                                                                              . 
#                                                                             37 
#                                                                           RDEV 
#                                                                             18 
#                                                                      RDEV/-DEV 
#                                                                              1 
#                                                           RDEV/00_BASE_PROGRAM 
#                                                                             41 
#                                                RDEV/00_PROTOCOL/01_SAMPLE_SIZE 
#                                                                              6 
#                                      RDEV/10_IMPORT_CLEAN_DATATYPE/11_METADATA 
#                                                                              2 
#                                  RDEV/10_IMPORT_CLEAN_DATATYPE/12_IMPORT_FILES 
#                                                                              8 
#                                 RDEV/10_IMPORT_CLEAN_DATATYPE/12_IMPORT_SQLITE 
#                                                                              3 
#                             RDEV/10_IMPORT_CLEAN_DATATYPE/12_IMPORT_VOCABULARY 
#                                                                              3 
#                                    RDEV/10_IMPORT_CLEAN_DATATYPE/13_DUPLICATED 
#                                                                              2 
#                                 RDEV/10_IMPORT_CLEAN_DATATYPE/13_MISSING_VALUE 
#                                                                              6 
#                                    RDEV/10_IMPORT_CLEAN_DATATYPE/13_SPLIT_FOLD 
#                                                                              1 
#                                 RDEV/10_IMPORT_CLEAN_DATATYPE/15_CLEANING_TEXT 
#                                                                              9 
#                                 RDEV/10_IMPORT_CLEAN_DATATYPE/15_CLEANING_TIME 
#                                                                              4 
#                            RDEV/10_IMPORT_CLEAN_DATATYPE/16_CATEGORICAL_FACTOR 
#                                                                              9 
#                        RDEV/10_IMPORT_CLEAN_DATATYPE/17_CATEGORICAL_INDICATORS 
#                                                                              3 
#                           RDEV/10_IMPORT_CLEAN_DATATYPE/18_DICHOTOMOUS_LOGICAL 
#                                                                              4 
#                                      RDEV/10_IMPORT_CLEAN_DATATYPE/19_DATETIME 
#                                                                              1 
#                               RDEV/10_IMPORT_CLEAN_DATATYPE/19_NUMERIC_INTEGER 
#                                                                              4 
#                                       RDEV/10_IMPORT_CLEAN_DATATYPE/ARRAY_LIST 
#                                                                              5 
#                                                    RDEV/20_TIDY_GROUP_BY_MATCH 
#                                                                              2 
#                               RDEV/20_TIDY_GROUP_BY_MATCH/23_GROUP_BY_PERSONID 
#                                                                              3 
#                                RDEV/20_TIDY_GROUP_BY_MATCH/25_STUDY_POPULATION 
#                                                                              3 
#                                           RDEV/20_TIDY_GROUP_BY_MATCH/27_MATCH 
#                                                                              5 
#                                            RDEV/30_TRANSFORM_SCALE_CATEGORICAL 
#                                                                              6 
#                                 RDEV/40_VISUALIZE_EXPLORE_BIVARIATE_STRATIFIED 
#                                                                              4 
#                      RDEV/40_VISUALIZE_EXPLORE_BIVARIATE_STRATIFIED/43_NETWORK 
#                                                                              8 
#                          RDEV/40_VISUALIZE_EXPLORE_BIVARIATE_STRATIFIED/44_MAP 
#                                                                             12 
#           RDEV/40_VISUALIZE_EXPLORE_BIVARIATE_STRATIFIED/45_BIVARIATE_MEASURES 
#                                                                              4 
# RDEV/40_VISUALIZE_EXPLORE_BIVARIATE_STRATIFIED/47_BIVARIATE_PARTIAL_STRATIFIED 
#                                                                              4 
#                                               RDEV/50_MODEL_FORMULA_EVALUATION 
#                                                                              3 
#                              RDEV/50_MODEL_FORMULA_EVALUATION/51_MODEL_FORMULA 
#                                                                              2 
#                            RDEV/50_MODEL_FORMULA_EVALUATION/53_MODEL_SELECTION 
#                                                                              2 
#                             RDEV/50_MODEL_FORMULA_EVALUATION/55_MODEL_WEIGHTED 
#                                                                              4 
#                            RDEV/50_MODEL_FORMULA_EVALUATION/56_MODEL_BOOTSTRAP 
#                                                                              3 
#                           RDEV/50_MODEL_FORMULA_EVALUATION/57_MODEL_TIME2EVENT 
#                                                                              8 
#                           RDEV/50_MODEL_FORMULA_EVALUATION/57_MODEL_TRAJECTORY 
#                                                                              1 
#                           RDEV/50_MODEL_FORMULA_EVALUATION/59_MODEL_EVALUATION 
#                                                                              6 
#                                              RDEV/60_COMMUNICATE_REPORT_EXPORT 
#                                                                             21 
# > df_files1$path.basename.ext.UC %>% table #----
# .
#         JAR   LNK    MD   PDF     R RDATA   RMD RPROJ   TXT   URL  XLSX   ZIP 
#    11     1    13     1     8   215     1     5     2     3     1     1     6 







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



#@ df_files2 ====
df_files1 %>% str #----
df_files2 = df_files1 %>% filter(!str_detect(path.basename.UC, gitignore_escaped_select.UC %>% paste(collapse = "|")))
df_files2 %>% str #----
# > df_files1 %>% str #----
# tibble [268 × 9] (S3: tbl_df/tbl/data.frame)
#  $ path.level          : num [1:268] 0 0 0 0 0 0 0 0 0 0 ...
#  $ path.dirname        : chr [1:268] "." "." "." "." ...
#  $ path.basename       : chr [1:268] "-info" "-tmp" "-void.r" "Blank) env.custom.fun.t.tribble_construct.Rmd - Shortcut.lnk" ...
#  $ path.basename.ext   : chr [1:268] "" "" "r" "lnk" ...
#  $ full_path           : chr [1:268] "-info" "-tmp" "-void.r" "Blank) env.custom.fun.t.tribble_construct.Rmd - Shortcut.lnk" ...
#  $ path.dirname.UC     : chr [1:268] "." "." "." "." ...
#  $ path.basename.UC    : chr [1:268] "-INFO" "-TMP" "-VOID.R" "BLANK) ENV.CUSTOM.FUN.T.TRIBBLE_CONSTRUCT.RMD - SHORTCUT.LNK" ...
#  $ path.basename.ext.UC: chr [1:268] "" "" "R" "LNK" ...
#  $ full_path.UC        : chr [1:268] "-INFO" "-TMP" "-VOID.R" "BLANK) ENV.CUSTOM.FUN.T.TRIBBLE_CONSTRUCT.RMD - SHORTCUT.LNK" ...
# > df_files2 = df_files1 %>% filter(!str_detect(path.basename.UC, gitignore_escaped_select.UC %>% paste(collapse = "|")))
# > df_files2 %>% str #----
# tibble [227 × 9] (S3: tbl_df/tbl/data.frame)
#  $ path.level          : num [1:227] 0 0 0 0 0 0 0 0 0 0 ...
#  $ path.dirname        : chr [1:227] "." "." "." "." ...
#  $ path.basename       : chr [1:227] "-info" "Encoding.txt" "README.md" "RStudio.Cloud set up.r" ...
#  $ path.basename.ext   : chr [1:227] "" "txt" "md" "r" ...
#  $ full_path           : chr [1:227] "-info" "Encoding.txt" "README.md" "RStudio.Cloud set up.r" ...
#  $ path.dirname.UC     : chr [1:227] "." "." "." "." ...
#  $ path.basename.UC    : chr [1:227] "-INFO" "ENCODING.TXT" "README.MD" "RSTUDIO.CLOUD SET UP.R" ...
#  $ path.basename.ext.UC: chr [1:227] "" "TXT" "MD" "R" ...
#  $ full_path.UC        : chr [1:227] "-INFO" "ENCODING.TXT" "README.MD" "RSTUDIO.CLOUD SET UP.R" ...

setdiff(df_files1, df_files2) %>% select(-matches("\\.UC$")) #----
# > setdiff(df_files1, df_files2) %>% select(-matches("\\.UC$")) #----
# # A tibble: 41 × 5
#    path.level path.dirname path.basename                                                path.basename.ext full_path                                                
#         <dbl> <chr>        <chr>                                                        <chr>             <chr>                                                    
#  1          0 .            -tmp                                                         ""                -tmp                                                     
#  2          0 .            -void.r                                                      "r"               -void.r                                                  
#  3          0 .            Blank) env.custom.fun.t.tribble_construct.Rmd - Shortcut.lnk "lnk"             Blank) env.custom.fun.t.tribble_construct.Rmd - Shortcut…
#  4          0 .            Blank.Rmd - Shortcut.lnk                                     "lnk"             Blank.Rmd - Shortcut.lnk                                 
#  5          0 .            RStudio.cloud.Rproj                                          "Rproj"           RStudio.cloud.Rproj                                      
#  6          0 .            [[Stat]] CRAN R - Shortcut.lnk                               "lnk"             [[Stat]] CRAN R - Shortcut.lnk                           
#  7          0 .            bfg.zip                                                      "zip"             bfg.zip                                                  
#  8          0 .            github_tidystat.Rproj                                        "Rproj"           github_tidystat.Rproj                                    
#  9          0 .            github_tidystat.Rproj alias                                  ""                github_tidystat.Rproj alias                              
# 10          0 .            statnet -void.r                                              "r"               statnet -void.r                                          
# # ℹ 31 more rows
# # ℹ Use `print(n = ...)` to see more rows


df_files2 %>% filter(path.dirname.UC == ".") %>% select(-matches("\\.UC$")) #----
# > df_files2 %>% filter(path.dirname.UC == ".") %>% select(-matches("\\.UC$")) #----
# # A tibble: 24 × 5
#    path.level path.dirname path.basename                                 path.basename.ext full_path                                    
#         <dbl> <chr>        <chr>                                         <chr>             <chr>                                        
#  1          0 .            -info                                         ""                -info                                        
#  2          0 .            Encoding.txt                                  "txt"             Encoding.txt                                 
#  3          0 .            README.md                                     "md"              README.md                                    
#  4          0 .            RStudio.Cloud set up.r                        "r"               RStudio.Cloud set up.r                       
#  5          0 .            Rdev                                          ""                Rdev                                         
#  6          0 .            Removing sensitive data from a repository.url "url"             Removing sensitive data from a repository.url
#  7          0 .            Rmd                                           ""                Rmd                                          
#  8          0 .            Rplot                                         ""                Rplot                                        
#  9          0 .            bfg-1.13.0.jar                                "jar"             bfg-1.13.0.jar                               
# 10          0 .            bfg.txt                                       "txt"             bfg.txt                                      
# # ℹ 14 more rows
# # ℹ Use `print(n = ...)` to see more rows


df_files2 %>% filter(path.basename.ext.UC == "") %>% select(-matches("\\.UC$")) #----
# > df_files2 %>% filter(path.basename.ext.UC == "") %>% select(-matches("\\.UC$")) #----
# # A tibble: 9 × 5
#   path.level path.dirname path.basename path.basename.ext full_path
#        <dbl> <chr>        <chr>         <chr>             <chr>    
# 1          0 .            -info         ""                -info    
# 2          0 .            Rdev          ""                Rdev     
# 3          0 .            Rmd           ""                Rmd      
# 4          0 .            Rplot         ""                Rplot    
# 5          0 .            data          ""                data     
# 6          0 .            examples      ""                examples 
# 7          0 .            other         ""                other    
# 8          0 .            tests         ""                tests    
# 9          0 .            vignettes     ""                vignettes

df_files2 %>% filter(path.dirname.UC == input_path %>% toupper) %>% select(-matches("\\.UC$")) #----
# > df_files2 %>% filter(path.dirname.UC == input_path %>% toupper) %>% select(-matches("\\.UC$")) #----
# # A tibble: 17 × 5
#    path.level path.dirname path.basename                                          path.basename.ext full_path                                                  
#         <dbl> <chr>        <chr>                                                  <chr>             <chr>                                                      
#  1          1 Rdev         data.variable.Date.nID_TRUE_NA.source.r                r                 Rdev/data.variable.Date.nID_TRUE_NA.source.r               
#  2          1 Rdev         data.variable.Date.nID_anyTRUE_allTRUE.source.r        r                 Rdev/data.variable.Date.nID_anyTRUE_allTRUE.source.r       
#  3          1 Rdev         env.custom.fun.t.tribble_construct.Rmd                 Rmd               Rdev/env.custom.fun.t.tribble_construct.Rmd                
#  4          1 Rdev         env.custom.fun.t.tribble_construct.source.r            r                 Rdev/env.custom.fun.t.tribble_construct.source.r           
#  5          1 Rdev         flowchart_inclusion_exclusions.source.r                r                 Rdev/flowchart_inclusion_exclusions.source.r               
#  6          1 Rdev         fun.df.transpose.source.r                              r                 Rdev/fun.df.transpose.source.r                             
#  7          1 Rdev         fun.path_files_size.source.r                           r                 Rdev/fun.path_files_size.source.r                          
#  8          1 Rdev         fun.split_save_ICD1.source.r                           r                 Rdev/fun.split_save_ICD1.source.r                          
#  9          1 Rdev         function.combination.source.r                          r                 Rdev/function.combination.source.r                         
# 10          1 Rdev         function.cross_join.source.r                           r                 Rdev/function.cross_join.source.r                          
# 11          1 Rdev         function.matrix.source.r                               r                 Rdev/function.matrix.source.r                              
# 12          1 Rdev         function.p.observed_value.distribution_vector.source.r r                 Rdev/function.p.observed_value.distribution_vector.source.r
# 13          1 Rdev         function.pairwise.data_frame.source.r                  r                 Rdev/function.pairwise.data_frame.source.r                 
# 14          1 Rdev         function.tensor_product.source.r                       r                 Rdev/function.tensor_product.source.r                      
# 15          1 Rdev         get_system_info.source.r                               r                 Rdev/get_system_info.source.r                              
# 16          1 Rdev         list.PERSON_ID.setdiff.diagram.n grViz().r             r                 Rdev/list.PERSON_ID.setdiff.diagram.n grViz().r            
# 17          1 Rdev         vector.setdiff.source.r                                r                 Rdev/vector.setdiff.source.r  


df_files2$path.basename.ext.UC %>% table
# > df_files2$path.basename.ext.UC %>% table
# .
#       JAR   MD  PDF    R  RMD  TXT  URL XLSX 
#    9    1    1    8  199    5    2    1    1 

df_files2 %>% filter(path.basename.ext.UC == "xlsx" %>% toupper)  %>% select(-matches("\\.UC$")) #----
df_files2 %>% filter(full_path.UC %>% str_detect("xlsx" %>% toupper))  %>% select(-matches("\\.UC$")) #----
# > df_files2 %>% filter(path.basename.ext.UC == "xlsx" %>% toupper)  %>% select(-matches("\\.UC$")) #----
# # A tibble: 1 × 5
#   path.level path.dirname path.basename                    path.basename.ext full_path                       
#        <dbl> <chr>        <chr>                            <chr>             <chr>                           
# 1          0 .            svyglm 10var vs 10var.inter.xlsx xlsx              svyglm 10var vs 10var.inter.xlsx
# > df_files2 %>% filter(full_path.UC %>% str_detect("xlsx" %>% toupper))  %>% select(-matches("\\.UC$")) #----
# # A tibble: 2 × 5
#   path.level path.dirname                      path.basename                    path.basename.ext full_path                                                       
#        <dbl> <chr>                             <chr>                            <chr>             <chr>                                                           
# 1          0 .                                 svyglm 10var vs 10var.inter.xlsx xlsx              svyglm 10var vs 10var.inter.xlsx                                
# 2          2 Rdev/60_communicate_report_export function.list_df2xlsx.source.r   r                 Rdev/60_communicate_report_export/function.list_df2xlsx.source.r


df_files2 %>% filter(path.basename.ext.UC == "rmd" %>% toupper)  %>% select(-matches("\\.UC$")) #----
# > df_files2 %>% filter(path.basename.ext.UC == "rmd" %>% toupper)  %>% select(-matches("\\.UC$")) #----
# # A tibble: 5 × 5
#   path.level path.dirname                                         path.basename                                                         path.basename.ext full_path
#        <dbl> <chr>                                                <chr>                                                                 <chr>             <chr>    
# 1          1 Rdev                                                 env.custom.fun.t.tribble_construct.Rmd                                Rmd               Rdev/env…
# 2          3 Rdev/50_model_formula_evaluation/57_model_time2event AnalyticDataset$Time2Censor_NewDMv3.rmd                               rmd               Rdev/50_…
# 3          3 Rdev/50_model_formula_evaluation/57_model_time2event AnalyticDataset.CensorEND.survfit.ggsurvplot_CIRiskTableP.rmd         rmd               Rdev/50_…
# 4          3 Rdev/50_model_formula_evaluation/57_model_time2event AnalyticDataset.CensorLastMeasure.survfit.ggsurvplot_CIRiskTableP.rmd rmd               Rdev/50_…
# 5          3 Rdev/50_model_formula_evaluation/57_model_time2event AnalyticDataset.censor5yr.survfit.ggsurvplot_CIRiskTableP -old.rmd    rmd               Rdev/50_…


df_files2 %>% filter(path.basename.ext.UC == "r" %>% toupper) %>% select(-matches("\\.UC$")) #----
# > df_files2 %>% filter(path.basename.ext.UC == "r" %>% toupper) %>% select(-matches("\\.UC$")) #----
# # A tibble: 199 × 5
#    path.level path.dirname path.basename                                path.basename.ext full_path                                   
#         <dbl> <chr>        <chr>                                        <chr>             <chr>                                       
#  1          0 .            RStudio.Cloud set up.r                       r                 RStudio.Cloud set up.r                      
#  2          0 .            f_df.add_UC.source.r                         r                 f_df.add_UC.source.r                        
#  3          0 .            f_path.df_dirs_recursive.source.r            r                 f_path.df_dirs_recursive.source.r           
#  4          0 .            f_path.df_files_recursive.source.r           r                 f_path.df_files_recursive.source.r          
#  5          0 .            f_vec.extract_non_alphanumeric_list.source.r r                 f_vec.extract_non_alphanumeric_list.source.r
#  6          0 .            git automatic commit.r                       r                 git automatic commit.r                      
#  7          0 .            git merge conflicts.r                        r                 git merge conflicts.r                       
#  8          0 .            gitignore_escaped_select from gitignore.r    r                 gitignore_escaped_select from gitignore.r   
#  9          0 .            library(checkpoint).r                        r                 library(checkpoint).r                       
# 10          1 Rdev         data.variable.Date.nID_TRUE_NA.source.r      r                 Rdev/data.variable.Date.nID_TRUE_NA.source.r
# # ℹ 189 more rows
# # ℹ Use `print(n = ...)` to see more rows





#@ end ----
