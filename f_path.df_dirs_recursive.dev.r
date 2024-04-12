#@ f_path.df_dirs_recursive.dev.r


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

f_path.df_dirs_recursive <- function(
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
        df_dirs_recursive0 <- bind_rows(df_dirs_recursive0, f_path.df_dirs_recursive(dir, max_depth, current_depth + 1, gitignore_escaped_select.UC))
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
            as_tibble
        
        df_out = df_dirs_recursive1 %>% 
            select(path.level, path, 
                   path.basename, path.parent, 
                   # path.basename.ext, 
                   full_path, normalized_path, 
                   print_tree_path) %>%
            as_tibble
    } else {
        df_out = df_dirs_recursive0
    }
    return(df_out)
}


f_path.df_dirs_recursive(max_depth = 2) %>% as_tibble
f_path.df_dirs_recursive("Rdev", max_depth = 2) %>% as_tibble




#@ df_dirs_recursive = f_path.df_dirs_recursive(".") =======
df_dirs_recursive = f_path.df_dirs_recursive(".")
df_dirs_recursive %>% str #----
# df_dirs_recursive %>% {.$full_path} %>% sort %>% paste(collapse = "\n") %>% cat; cat("\n") #----
# df_dirs_recursive %>% {.$path.basename} %>% sort %>% paste(collapse = "\n") %>% cat; cat("\n")  #----
df_dirs_recursive %>% select(path.level, path.parent, path.basename, path, full_path) %>% as_tibble %>% print(n=99) #----
df_dirs_recursive %>% select(print_tree_path) %>% as_tibble
df_dirs_recursive %>% select(print_tree_path) %>% unlist %>% paste(collapse = "\n") %>% cat; cat("\n")  #----




#@ df_dirs_recursive = f_path.df_dirs_recursive(getwd()) =======
df_dirs_recursive = f_path.df_dirs_recursive(getwd())
df_dirs_recursive %>% str #----
# df_dirs_recursive %>% {.$full_path} %>% sort %>% paste(collapse = "\n") %>% cat; cat("\n") #----
# df_dirs_recursive %>% {.$path.basename} %>% sort %>% paste(collapse = "\n") %>% cat; cat("\n")  #----
df_dirs_recursive %>% select(path.level, path.parent, path.basename, path, full_path) %>% as_tibble %>% print(n=99) #----
df_dirs_recursive %>% select(print_tree_path) %>% as_tibble
df_dirs_recursive %>% select(print_tree_path) %>% unlist %>% paste(collapse = "\n") %>% cat; cat("\n")  #----




#@ df_dirs_recursive = "Rdev" %>% f_path.df_dirs_recursive() =======
df_dirs_recursive = "Rdev" %>% f_path.df_dirs_recursive()
df_dirs_recursive %>% str #----
# df_dirs_recursive %>% {.$full_path} %>% sort %>% paste(collapse = "\n") %>% cat; cat("\n") #----
# df_dirs_recursive %>% {.$path.basename} %>% sort %>% paste(collapse = "\n") %>% cat; cat("\n")  #----
df_dirs_recursive %>% select(path.level, path.parent, path.basename, path, full_path) %>% as_tibble %>% print(n=99) #----
df_dirs_recursive %>% select(print_tree_path) %>% as_tibble
df_dirs_recursive %>% select(print_tree_path) %>% unlist %>% paste(collapse = "\n") %>% cat; cat("\n")  #----



#@ setwd("Rdev") -------------
#@ df_dirs_recursive = f_path.df_dirs_recursive() =======
# setwd("Rdev")
# getwd()
df_dirs_recursive = f_path.df_dirs_recursive(getwd())
df_dirs_recursive %>% str #----
# df_dirs_recursive %>% {.$full_path} %>% sort %>% paste(collapse = "\n") %>% cat; cat("\n") #----
# df_dirs_recursive %>% {.$path.basename} %>% sort %>% paste(collapse = "\n") %>% cat; cat("\n")  #----
df_dirs_recursive %>% select(path.level, path.parent, path.basename, path, full_path) %>% as_tibble %>% print(n=99) #----
df_dirs_recursive %>% select(print_tree_path) %>% as_tibble
df_dirs_recursive %>% select(print_tree_path) %>% unlist %>% paste(collapse = "\n") %>% cat; cat("\n")  #----





#@ setwd("Rdev") -------------
#@ df_dirs_recursive = f_path.df_dirs_recursive(".") =======
# setwd("Rdev")
# getwd()
df_dirs_recursive = f_path.df_dirs_recursive(".")
df_dirs_recursive %>% str #----
# df_dirs_recursive %>% {.$full_path} %>% sort %>% paste(collapse = "\n") %>% cat; cat("\n") #----
# df_dirs_recursive %>% {.$path.basename} %>% sort %>% paste(collapse = "\n") %>% cat; cat("\n")  #----
df_dirs_recursive %>% select(path.level, path.parent, path.basename, path, full_path) %>% as_tibble %>% print(n=99) #----
df_dirs_recursive %>% select(print_tree_path) %>% as_tibble
df_dirs_recursive %>% select(print_tree_path) %>% unlist %>% paste(collapse = "\n") %>% cat; cat("\n")  #----






#@ end ----
# setwd("..")
# getwd()

