#@ f_path.df_dirs_recursive.df_files.dev.r
#         https://github.com/mkim0710/tidystat/blob/master/f_path.df_dirs_recursive.df_files.dev.r
# source("https://github.com/mkim0710/tidystat/raw/master/f_path.df_dirs_recursive.df_files.source.r")


# if(!exists("env.custom")) env.custom = new.env()
if(!exists("env.custom")) env.custom = list()
# env.custom = env.custom %>% as.environment
# if(!exists("env.internal", envir = env.custom)) env.custom$env.internal = new.env()
if(!exists("env.custom$env.internal")) env.custom$env.internal = new.env()


cat("Loading: ", "env.custom$gitignore_escaped_select.UC", "\n")
env.custom$gitignore_escaped_select.UC = c(
    "\\.RPROJ\\.USER", "\\.RHISTORY", "\\.RDATA", "\\.RUSERDATA",
    ".*\\.ZIP", ".*\\.7Z", ".*\\.RPROJ", "\\.GITIGNORE",
    "MH\\).*\\.R", ".*\\.LNK", ".*ALIAS", ".*\\- VOID.*\\..*", ".*\\-VOID.*\\..*",
    ".*\\- INFO\\..*", ".*\\-INFO\\..*", ".*\\-DEV.*\\..*", ".*DEBUG.*\\..*",
    "\\-TMP", ".*\\- TMP.*\\..*", ".*\\-TMP.*\\..*", ".*\\-LOG.*\\..*",
    ".*\\.RTF", "[\\/\\\\]\\.[^\\/\\\\]"
  )
cat("Loading: ", "env.custom$f_path.df_dirs_recursive.df_files", "\n")
env.custom$f_path.df_dirs_recursive.df_files <- function(
  input_path = ".", 
  max_depth = 9, 
  current_depth = 0, 
  gitignore_escaped_select.UC = env.custom$gitignore_escaped_select.UC
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
        df_dirs_recursive0 <- bind_rows(df_dirs_recursive0, f_path.df_dirs_recursive.df_files(dir, max_depth, current_depth + 1, gitignore_escaped_select.UC))
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




#@ end -----
# ls.str(env.custom) #-----
# ls.str(env.custom$env.internal) #-----
# # > ls.str(env.custom) #-----
# # env.internal : <environment: 0x000001f6d74c17b0> 
# # f_path.df_dirs_recursive.df_files : function (input_path = ".", max_depth = 9, current_depth = 0, gitignore_escaped_select.UC = env.custom$gitignore_escaped_select.UC)  
# # gitignore_escaped_select.UC :  chr [1:23] "\\.RPROJ\\.USER" "\\.RHISTORY" "\\.RDATA" "\\.RUSERDATA" ".*\\.ZIP" ".*\\.7Z" ".*\\.RPROJ" "\\.GITIGNORE" ...
# # > ls.str(env.custom$env.internal) #-----

#@ end ----
