# # objectname = "f_path.df_dirs_recursive.df_files"
# # f_path.df_dirs_recursive.df_files.dev.r
# # f_path.df_dirs_recursive.df_files.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/f_path.df_dirs_recursive.df_files.dev.r
# # source("https://github.com/mkim0710/tidystat/raw/master/f_path.df_dirs_recursive.df_files.source.r")
# # gitignore_escaped_select.UC.regex from gitignore.Rmd
# # f_vec.extract_non_alphanumeric_list.dev.r
# ###################################################################################################
# objectname = "f_path.df_dirs_recursive.df_files"
# cat("# ", 'objectname = "', objectname, '"', "\n",
#     "# ", objectname, ".dev.r", "\n",
#     "# ", objectname, ".source.r", "\n",
#     "#         https://github.com/mkim0710/tidystat/blob/master/", objectname, ".dev.r", "\n",
#     '# source("https://github.com/mkim0710/tidystat/raw/master/', objectname, '.source.r")', "\n",
#     sep="")
# rstudioapi::navigateToFile(paste0(objectname,".source.r"))
# rstudioapi::navigateToFile(paste0(objectname,".dev.r"))



library(tidyverse)
# if(!exists("env.custom", envir = .GlobalEnv)) assign("env.custom", new.env(), envir = .GlobalEnv)
if(!exists("env.custom", envir = .GlobalEnv)) assign("env.custom", new.env(), envir = .GlobalEnv)
# env.custom = env.custom %>% as.environment
# if(!exists("env.internal", envir = env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir = .GlobalEnv)
if(!"env.internal" %in% names(env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir = .GlobalEnv)


objectname = "gitignore_escaped_select.UC.regex"
object = "^(\\.RPROJ\\.USER)|(\\.RHISTORY)|(\\.RDATA)|(\\.RUSERDATA)|(.*\\.ZIP)|(.*\\.7Z)|(.*\\.R\\.GZ)|(.*\\.R\\.XZ)|(.*\\.RMD\\.GZ)|(.*\\.RMD\\.XZ)|(.*\\.RPROJ)|(\\.GITIGNORE)|(\\.GIT)|(\\.GITHUB)|(MH\\).*\\.R)|(.*\\.LNK)|(.*ALIAS)|(.*\\- VOID.*\\..*)|(.*\\-VOID.*\\..*)|(.*\\- INFO\\..*)|(.*\\-INFO\\..*)|(.*\\-DEV.*\\..*)|(.*DEBUG.*\\..*)|(\\-TMP)|(.*\\- TMP.*\\..*)|(.*\\-TMP.*\\..*)|(.*\\- OLD\\..*)|(.*\\-OLD\\..*)|(.*\\-LOG.*\\..*)|(.*\\.RTF)$"    
if(!objectname %in% names(env.custom)) {
    packageStartupMessage(paste0("Loading: ", "env.custom$", objectname)); 
    env.custom[[objectname]] = object
    # cat("> env.custom$", objectname, "()\n", sep=""); tmp.function = env.custom[[objectname]]; tmp.function()  # Run the loaded function by default
}




objectname = "f_path.df_dirs_recursive.df_files"
object = function(
        input_path = ".", 
        max_depth = 9, 
        current_depth = 0, 
        gitignore_escaped_select.UC.regex = env.custom$gitignore_escaped_select.UC.regex, 
        print.message = TRUE
) {
    if (!dir.exists(input_path)) {
        stop("The specified input_path does not exist or is not a directory.")
    }
    if (print.message) {if (current_depth == 0) message(paste0(".Platform$file.sep: ", .Platform$file.sep, "; ", "input_path0: ", input_path0 = input_path))}
    if (current_depth >= max_depth) {
        return(tibble())
    }
    
    if (!exists("f_path.df_dirs_recursive.df_files", envir = .GlobalEnv)) assign("f_path.df_dirs_recursive.df_files", env.custom$f_path.df_dirs_recursive.df_files, envir = .GlobalEnv)
    
    dirs = list.dirs(input_path, full.names = TRUE, recursive = FALSE) %>% 
        str_subset(paste0("^", input_path, .Platform$file.sep, "\\.") %>% regex(ignore_case = TRUE), negate = TRUE) %>%  # exclude basename starting with dot
        str_subset(gitignore_escaped_select.UC.regex %>% regex(ignore_case = TRUE), negate = TRUE)
    
    df_dirs_recursive0 <- tibble(path.level = integer(), full_path = character())
    
    if (current_depth == 0) {
        df_dirs_recursive0 <- bind_rows(df_dirs_recursive0, tibble(path.level = 0L, full_path = input_path))
    }
    
    for (dir in dirs) {
        df_dirs_recursive0 <- bind_rows(df_dirs_recursive0, tibble(path.level = current_depth + 1, full_path = dir))
        
        # Recursively process subdirectories
        df_dirs_recursive0 <- bind_rows(df_dirs_recursive0, f_path.df_dirs_recursive.df_files(dir, max_depth, current_depth + 1, gitignore_escaped_select.UC.regex, print.message))
    }
    
    if (current_depth == 0) {
        if (print.message) message("Finished iterating through paths.")
        
        df_dirs_recursive1 = df_dirs_recursive0 %>% 
            mutate(
                path = full_path %>% {gsub(input_path, "", ., fixed = T)} %>% str_replace_all(paste0("^", .Platform$file.sep), "")
                , normalized_path = normalizePath(full_path, winslash = "/", mustWork = FALSE)
                , path.parent = dirname(full_path)
                # , path.parent = if_else(full_path == ".", "..", dirname(full_path))
                , path.basename = basename(full_path)
                # , path.basename.ext = tools::file_ext(path.basename)
                # # , path.basename.ext = tools::file_ext(path.basename)
                # # # > tools::file_ext
                # # # function (x) 
                # # # {
                # # #     pos <- regexpr("\\.([[:alnum:]]+)$", x)
                # # #     ifelse(pos > -1L, substring(x, pos + 1L), "")
                # # # }
                # # # <bytecode: 0x0000020ed66821a0>
                # # # <environment: namespace:tools>
                # path.basename %>% str_extract("\\.([[:alnum:]]+)$") %>% str_replace("^\\.", "")
            ) %>% 
            mutate(print_tree_path = map_chr(path.level, ~paste(rep("\t", max(.x - 1, 0)), collapse = "")) %>% paste0(path.basename) ) %>%
            # arrange(path.parent, path.basename) %>% 
            arrange(full_path) %>% 
            as_tibble
        
        df_dirs_recursive2 = df_dirs_recursive1 %>% 
            select(path.level, path, 
                   path.basename, path.parent, 
                   # path.basename.ext, 
                   full_path, normalized_path, 
                   print_tree_path) %>%
            as_tibble
        
        df_dirs_recursive.ls_files1 = df_dirs_recursive2 %>% mutate(
            files = full_path %>% map(function(chr) {list.files(chr, include.dirs = FALSE) %>% str_subset(paste0(gitignore_escaped_select.UC.regex, collapse = "|") %>% regex(ignore_case = TRUE), negate = TRUE)}) 
            , files.codes = full_path %>% map(function(chr) {list.files(chr, "\\.(r|rmd|txt|pdf|doc|docx|docm|ppt|pptx|pptm)$", ignore.case = T, include.dirs = FALSE)}) 
            # , files.rmd = full_path %>% map(function(chr) {list.files(chr, "\\.rmd$", ignore.case = T, include.dirs = FALSE)}) 
            # , files.rds = full_path %>% map(function(chr) {list.files(chr, "\\.rds(.xz)?$", ignore.case = T, include.dirs = FALSE)}) 
            # , files.rda = full_path %>% map(function(chr) {list.files(chr, "\\.rda(ta)?(.xz)?$", ignore.case = T, include.dirs = FALSE)}) 
            # , files.ppt = full_path %>% map(function(chr) {list.files(chr, "\\.(ppt|pptx|pptm)$", ignore.case = T, include.dirs = FALSE)}) 
            , files.data = full_path %>% map(function(chr) {list.files(chr, "\\.(rdata|rda|rds|csv|sas7bdat|xls|xlsx|data|dta)(\\.[gx]z)?$", ignore.case = T, include.dirs = FALSE)}) 
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
                            ~ifelse(length(.y)>0, {rep("\t", .x-0) %>% paste(collapse="") %>% paste0(.y) %>% c("") %>% paste(collapse = "\n")}, "")
                        ) 
                    )
                , print_tree_path_files.codes = 
                    paste0(
                        "@", 
                        print_tree_path,
                        "/\n",
                        map2_chr(
                            path.level, 
                            files.codes, 
                            # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) %>% paste(collapse = "\n") 
                            ~ifelse(length(.y)>0, {rep("\t", .x-0) %>% paste(collapse="") %>% paste0(.y) %>% c("") %>% paste(collapse = "\n")}, "")
                        ) 
                    )
                # , print_tree_path_files.rmd = 
                #     paste0(
                #         "@", 
                #         print_tree_path,
                #         "/\n",
                #         map2_chr(
                #             path.level, 
                #             files.rmd, 
                #             # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) %>% paste(collapse = "\n") 
                #             ~ifelse(length(.y)>0, {rep("\t", .x-0) %>% paste(collapse="") %>% paste0(.y) %>% c("") %>% paste(collapse = "\n")}, "")
                #         ) 
                #     )
                # , print_tree_path_files.ppt = 
                #     paste0(
                #         "@", 
                #         print_tree_path,
                #         "/\n",
                #         map2_chr(
                #             path.level, 
                #             files.ppt, 
                #             # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) %>% paste(collapse = "\n") 
                #             ~ifelse(length(.y)>0, {rep("\t", .x-0) %>% paste(collapse="") %>% paste0(.y) %>% c("") %>% paste(collapse = "\n")}, "")
                #         ) 
                #     )
                # , print_tree_path_files.rds = 
                #     paste0(
                #         "@", 
                #         print_tree_path,
                #         "/\n",
                #         map2_chr(
                #             path.level, 
                #             files.rds, 
                #             # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) %>% paste(collapse = "\n") 
                #             ~ifelse(length(.y)>0, {rep("\t", .x-0) %>% paste(collapse="") %>% paste0(.y) %>% c("") %>% paste(collapse = "\n")}, "")
                #         ) 
                #     )
                # , print_tree_path_files.rda = 
                #     paste0(
                #         "@", 
                #         print_tree_path,
                #         "/\n",
                #         map2_chr(
                #             path.level, 
                #             files.rda, 
                #             # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) %>% paste(collapse = "\n") 
                #             ~ifelse(length(.y)>0, {rep("\t", .x-0) %>% paste(collapse="") %>% paste0(.y) %>% c("") %>% paste(collapse = "\n")}, "")
                #         ) 
                #     )
                , print_tree_path_files.data =
                    paste0(
                        "@",
                        print_tree_path,
                        "/\n",
                        map2_chr(
                            path.level,
                            files.data,
                            # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) %>% paste(collapse = "\n")
                            ~ifelse(length(.y)>0, {rep("\t", .x-0) %>% paste(collapse="") %>% paste0(.y) %>% c("") %>% paste(collapse = "\n")}, "")
                        )
                    )
            ) %>%
            as_tibble
        df_out = df_dirs_recursive.ls_files2
    } else {
        df_out = df_dirs_recursive0
    }
    return(df_out)
}
if(!objectname %in% names(env.custom)) {
    packageStartupMessage(paste0("Loading: ", "env.custom$", objectname)); 
    env.custom[[objectname]] = object
    # cat("> env.custom$", objectname, "()\n", sep=""); get(objectname, envir = env.custom)() # Run the loaded function by default
}

# > cat("> env.custom$", objectname, "()\n", sep=""); tmp.function = env.custom[[objectname]]; tmp.function()  # Run the loaded function by default
# > env.custom$f_path.df_dirs_recursive.df_files()
# .Platform$file.sep:  / 
# input_path0:  . 
# Finished iterating through paths.
# # A tibble: 61 × 15
#    path.level path       path.basename path.parent full_path normalized_path print_tree_path files files.r files.rmd files.data print_tree_path_files print_tree_path_file…¹
#         <dbl> <chr>      <chr>         <chr>       <chr>     <chr>           <chr>           <lis> <list>  <list>    <list>     <chr>                 <chr>                 
#  1          0 ""         .             .           .         D:/OneDrive/[]… "."             <chr> <chr>   <chr [1]> <chr [1]>  "@./\n-info\nbfg-1.1… "@./\n-void.r\nenv.cu…
#  2          1 "-info"    -info         .           ./-info   D:/OneDrive/[]… "-info"         <chr> <chr>   <chr [0]> <chr [0]>  "@-info/\n\tFACETS_d… "@-info/\n"           
#  3          1 "Rdev"     Rdev          .           ./Rdev    D:/OneDrive/[]… "Rdev"          <chr> <chr>   <chr [0]> <chr [0]>  "@Rdev/\n\t-dev\n\t0… "@Rdev/\n\tdata.varia…
#  4          2 "Rdev/-de… -dev          ./Rdev      ./Rdev/-… D:/OneDrive/[]… "\t-dev"        <chr> <chr>   <chr [0]> <chr [0]>  "@\t-dev/\n"          "@\t-dev/\n\t\tobject…
#  5          2 "Rdev/00_… 00_base_prog… ./Rdev      ./Rdev/0… D:/OneDrive/[]… "\t00_base_pro… <chr> <chr>   <chr [0]> <chr [0]>  "@\t00_base_program/… "@\t00_base_program/\…
#  6          2 "Rdev/00_… 00_protocol   ./Rdev      ./Rdev/0… D:/OneDrive/[]… "\t00_protocol" <chr> <chr>   <chr [0]> <chr [0]>  "@\t00_protocol/\n\t… "@\t00_protocol/\n"   
#  7          3 "Rdev/00_… 01_sample_si… ./Rdev/00_… ./Rdev/0… D:/OneDrive/[]… "\t\t01_sample… <chr> <chr>   <chr [0]> <chr [0]>  "@\t\t01_sample_size… "@\t\t01_sample_size/…
#  8          3 "Rdev/00_… 05_count_eli… ./Rdev/00_… ./Rdev/0… D:/OneDrive/[]… "\t\t05_count_… <chr> <chr>   <chr [0]> <chr [0]>  "@\t\t05_count_eligi… "@\t\t05_count_eligib…
#  9          3 "Rdev/00_… 06_count_exp… ./Rdev/00_… ./Rdev/0… D:/OneDrive/[]… "\t\t06_count_… <chr> <chr>   <chr [0]> <chr [0]>  "@\t\t06_count_expos… "@\t\t06_count_exposu…
# 10          3 "Rdev/00_… 07_count_out… ./Rdev/00_… ./Rdev/0… D:/OneDrive/[]… "\t\t07_count_… <chr> <chr>   <chr [0]> <chr [0]>  "@\t\t07_count_outco… "@\t\t07_count_outcom…
# # ℹ 51 more rows
# # ℹ abbreviated name: ¹​print_tree_path_files.r
# # ℹ 2 more variables: print_tree_path_files.rmd <chr>, print_tree_path_files.data <chr>
# # ℹ Use `print(n = ...)` to see more rows



#@ end -----
# ls.str(env.custom) #-----
# ls.str(env.custom$env.internal) #-----
# # > ls.str(env.custom) #-----
# # env.internal : <environment: 0x000001f6d74c17b0> 
# # f_path.df_dirs_recursive.df_files : function (input_path = ".", max_depth = 9, current_depth = 0, gitignore_escaped_select.UC.regex = env.custom$gitignore_escaped_select.UC.regex)  
# # gitignore_escaped_select.UC.regex :  chr [1:23] "\\.RPROJ\\.USER" "\\.RHISTORY" "\\.RDATA" "\\.RUSERDATA" ".*\\.ZIP" ".*\\.7Z" ".*\\.RPROJ" "\\.GITIGNORE" ...
# # > ls.str(env.custom$env.internal) #-----

#@ end ----
