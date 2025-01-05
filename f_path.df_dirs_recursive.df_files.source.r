.FileName.source.r = "f_path.df_dirs_recursive.df_files" |> paste0(".source.r")  
if(Sys.getenv("VERBOSE")==TRUE) { print(paste0('Sourcing: "',.FileName.source.r,'"')) }  
# # .FileName.source.r = "f_path.df_dirs_recursive.df_files" |> paste0(".source.r")
# # f_path.df_dirs_recursive.df_files.dev.r
# # f_path.df_dirs_recursive.df_files.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/f_path.df_dirs_recursive.df_files.dev.r
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/f_path.df_dirs_recursive.df_files.source.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/f_path.df_dirs_recursive.df_files.dev.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/f_path.df_dirs_recursive.df_files.source.r")
# ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  ----  
#| Ctrl(+Shift)+1: Move focus (zoom) to Source Editor 
#| Ctrl+Shift+.[period]: Switch to tab (Show List of Open Tabs~!!!)
#| Ctrl+Alt+Shift+Left/Right: First/Last tab
#| Ctrl+Alt+D: Show diff between current and last commit
#| Ctrl+Alt+M: Commit changes to Git
#| Ctrl+Shift+O: Show/Hide Document Outline
#| Alt+Shift+Drag: Multiline Cursor
#| Ctrl+Shift+F10: Restart R Session 
#| Ctrl+Alt+B: Run from start to current line 
#| Shift+F9: Toggle Breakpoint 
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# paste0("[Working Files List] ",basename(getwd()),".r") %>% {paste0(env1$path$path1,"/",.)} |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/",mustWork=NA) ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (Sys.info()['sysname'] == 'Windows') { "." |> normalizePath(winslash="/",mustWork=NA) |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# # .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
# env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
# if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .RelativeSubPath, .FileName.source.r ======  
# .RelativeSubPath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# # if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
# .FileName.source.r = "f_path.df_dirs_recursive.df_files" |> paste0(".source.r")
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# env1$path$.RelativeSubPath = .RelativeSubPath
# .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
# env1$path$.SourceName_root = .SourceName_root  
# env1$path$.RelativeSubPath_FileName.dev.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.r")
# env1$path$.RelativeSubPath_FileName.dev.Rmd = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.Rmd")
# env1$path$.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}
# cat("# ",'.SourceName_root = "',.SourceName_root,'"  \n',
#     "# ",env1$path$.RelativeSubPath_FileName.dev.r, "  \n",
#     "# ",env1$path$.RelativeSubPath_FileName.dev.Rmd, "  \n",
#     "# ",env1$path$.RelativeSubPath_FileName.source.r, "  \n",
#     '# # source(paste0(env1$path$source_base,"/","',env1$path$.RelativeSubPath_FileName.source.r,'"))', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")', "  \n",
#    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
#    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
#    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
#     sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  



.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
## .GlobalEnv$.tmp = list() ---  
.listname = ".tmp"; if(!exists(.listname, envir=.GlobalEnv)) { assign(.listname, list(), envir=.GlobalEnv) }
## .GlobalEnv$env1 = new.env() ====  
.envname = "env1"; if(!exists(.envname, envir=.GlobalEnv)) { assign(.envname, new.env(), envir=.GlobalEnv) }
### .GlobalEnv$env1$env.internal = new.env() ====  
.subenvname = "env.internal"; .parentname = "env1"; if(!.subenvname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.subenvname]] = new.env() }
### .GlobalEnv$env1$env.internal.attach = new.env() ====  
.subenvname = "env.internal.attach"; .parentname = "env1"; if(!.subenvname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.subenvname]] = new.env() }
### .GlobalEnv$env1$f = list() ====  
.sublistname = "f"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }


.tmp$gitignore_escaped_select.UC.regex = "^(\\.RPROJ\\.USER)|(\\.RHISTORY)|(\\.RDATA)|(\\.RUSERDATA)|(.*\\.ZIP)|(.*\\.7Z)|(.*\\.R\\.GZ)|(.*\\.R\\.XZ)|(.*\\.RMD\\.GZ)|(.*\\.RMD\\.XZ)|(.*\\.RPROJ)|(\\.GITIGNORE)|(\\.GIT)|(\\.GITHUB)|(MH\\).*\\.R)|(.*\\.LNK)|(.*ALIAS)|(.*\\- VOID.*\\..*)|(.*\\-VOID.*\\..*)|(.*\\- INFO\\..*)|(.*\\-INFO\\..*)|(.*\\-DEV.*\\..*)|(.*DEBUG.*\\..*)|(\\-TMP)|(.*\\- TMP.*\\..*)|(.*\\-TMP.*\\..*)|(.*\\- OLD\\..*)|(.*\\-OLD\\..*)|(.*\\-LOG.*\\..*)|(.*\\.RTF)$"    


.tmp$objectname = "f_path.df_dirs_recursive.df_files"
.tmp$object = function(
    input_path = ".", 
    max_depth = 9, 
    current_depth = 0, 
    gitignore_escaped_select.UC.regex = .tmp$gitignore_escaped_select.UC.regex, 
    print.message = TRUE
) {
    if (!dir.exists(input_path)) {
        stop("The specified input_path does not exist or is not a directory.")
    }
    if (print.message) {if (current_depth == 0) message(paste0(".Platform$file.sep: ", .Platform$file.sep, "; ", "input_path0: ", input_path0 = input_path))}
    if (current_depth >= max_depth) {
        return(tibble())
    }
    
    if (!exists("f_path.df_dirs_recursive.df_files", envir=.GlobalEnv)) assign("f_path.df_dirs_recursive.df_files", env1$env.internal$f_path.df_dirs_recursive.df_files, envir=.GlobalEnv)
    
    dirs = list.dirs(input_path, full.names = TRUE, recursive = FALSE) %>% 
        str_subset(paste0(input_path, .Platform$file.sep, ".") %>% fixed(ignore_case = TRUE), negate = TRUE) %>%  # exclude basename starting with dot
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
                path = full_path %>% {gsub(input_path, "", ., fixed = T)} |> str_replace_all(paste0("^", .Platform$file.sep), "")
                , normalized_path = normalizePath(full_path, winslash = "/")
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
                # path.basename |> str_extract("\\.([[:alnum:]]+)$") |> str_remove("^\\.")
            ) %>% 
            mutate(print_tree_path = map_chr(path.level, ~paste(rep("\t", max(.x - 1, 0)), collapse = "")) |> paste0(path.basename) ) %>%
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
            files = full_path %>% map(function(chr) {list.files(chr, include.dirs = FALSE) |> str_subset(paste0(gitignore_escaped_select.UC.regex, collapse = "|") %>% regex(ignore_case = TRUE), negate = TRUE)}) 
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
                            # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) |> paste(collapse = "\n") 
                            ~ifelse(length(.y)>0, {rep("\t", .x-0) |> paste(collapse="") |> paste0(.y) %>% c("") |> paste(collapse = "\n")}, "")
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
                            # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) |> paste(collapse = "\n") 
                            ~ifelse(length(.y)>0, {rep("\t", .x-0) |> paste(collapse="") |> paste0(.y) %>% c("") |> paste(collapse = "\n")}, "")
                        ) 
                    )
                # , print_tree_path_files.codes = 
                #     paste0(
                #         "@", 
                #         print_tree_path,
                #         "/\n",
                #         map2_chr(
                #             path.level, 
                #             files.rmd, 
                #             # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) |> paste(collapse = "\n") 
                #             ~ifelse(length(.y)>0, {rep("\t", .x-0) |> paste(collapse="") |> paste0(.y) %>% c("") |> paste(collapse = "\n")}, "")
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
                #             # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) |> paste(collapse = "\n") 
                #             ~ifelse(length(.y)>0, {rep("\t", .x-0) |> paste(collapse="") |> paste0(.y) %>% c("") |> paste(collapse = "\n")}, "")
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
                #             # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) |> paste(collapse = "\n") 
                #             ~ifelse(length(.y)>0, {rep("\t", .x-0) |> paste(collapse="") |> paste0(.y) %>% c("") |> paste(collapse = "\n")}, "")
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
                #             # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) |> paste(collapse = "\n") 
                #             ~ifelse(length(.y)>0, {rep("\t", .x-0) |> paste(collapse="") |> paste0(.y) %>% c("") |> paste(collapse = "\n")}, "")
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
                            # ~paste0(paste(c("|->", rep("\t", .x-0)), collapse = ""), .y) |> paste(collapse = "\n")
                            ~ifelse(length(.y)>0, {rep("\t", .x-0) |> paste(collapse="") |> paste0(.y) %>% c("") |> paste(collapse = "\n")}, "")
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
if(!.tmp$objectname %in% names(.GlobalEnv$env1$env.internal)) {
    packageStartupMessage(paste0("Loading: ", ".GlobalEnv$env1$env.internal$", .tmp$objectname))
    .GlobalEnv$env1$env.internal[[.tmp$objectname]] = .tmp$object
    # cat("> .GlobalEnv$env1$",.tmp$objectname,"()\n",sep=""); get(.tmp$objectname, envir=.GlobalEnv$env1)() # Run the loaded function by default
}

# > cat("> env1$", .objectname, "()\n", sep=""); tmp.function = env1[[.objectname]]; tmp.function()  # Run the loaded function by default
# > env1$env.internal$f_path.df_dirs_recursive.df_files()
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
# # ℹ 2 more variables: print_tree_path_files.codes <chr>, print_tree_path_files.data <chr>
# # ℹ Use `print(n = ...)` to see more rows



## @ run @ Rocker 240625 ----  
# > env1$env.internal$f_path.df_dirs_recursive.df_files()
# .Platform$file.sep: /; input_path0: .
# Finished iterating through paths.
# # A tibble: 61 × 13
#    path.level path    path.basename path.parent full_path normalized_path print_tree_path files files.codes files.data print_tree_path_files print_tree_path_file…¹ print_tree_path_file…²
#         <dbl> <chr>   <chr>         <chr>       <chr>     <chr>           <chr>           <lis> <list>      <list>     <chr>                 <chr>                  <chr>                 
#  1          0 ""      .             .           .         /home/rstudio/… "."             <chr> <chr [45]>  <chr [2]>  "@./\n[Working Files… "@./\n[Working Files … "@./\nCohortGJ0910.Ba…
#  2          1 "Rdev"  Rdev          .           ./Rdev    /home/rstudio/… "Rdev"          <chr> <chr [12]>  <chr [0]>  "@Rdev/\n\t-dev\n\t0… "@Rdev/\n\tdata.varia… "@Rdev/\n"            
#  3          2 "Rdev/… -dev          ./Rdev      ./Rdev/-… /home/rstudio/… "\t-dev"        <chr> <chr [1]>   <chr [0]>  "@\t-dev/\n"          "@\t-dev/\n\t\tobject… "@\t-dev/\n"          
#  4          2 "Rdev/… 00_base_prog… ./Rdev      ./Rdev/0… /home/rstudio/… "\t00_base_pro… <chr> <chr [57]>  <chr [0]>  "@\t00_base_program/… "@\t00_base_program/\… "@\t00_base_program/\…
#  5          2 "Rdev/… 00_protocol   ./Rdev      ./Rdev/0… /home/rstudio/… "\t00_protocol" <chr> <chr [0]>   <chr [0]>  "@\t00_protocol/\n\t… "@\t00_protocol/\n"    "@\t00_protocol/\n"   
#  6          3 "Rdev/… 01_sample_si… ./Rdev/00_… ./Rdev/0… /home/rstudio/… "\t\t01_sample… <chr> <chr [5]>   <chr [0]>  "@\t\t01_sample_size… "@\t\t01_sample_size/… "@\t\t01_sample_size/…
#  7          2 "Rdev/… 10_import_cl… ./Rdev      ./Rdev/1… /home/rstudio/… "\t10_import_c… <chr> <chr [0]>   <chr [0]>  "@\t10_import_clean_… "@\t10_import_clean_d… "@\t10_import_clean_d…
#  8          3 "Rdev/… 11_metadata   ./Rdev/10_… ./Rdev/1… /home/rstudio/… "\t\t11_metada… <chr> <chr [3]>   <chr [0]>  "@\t\t11_metadata/\n… "@\t\t11_metadata/\n\… "@\t\t11_metadata/\n" 
#  9          3 "Rdev/… 12_import_fi… ./Rdev/10_… ./Rdev/1… /home/rstudio/… "\t\t12_import… <chr> <chr [10]>  <chr [0]>  "@\t\t12_import_file… "@\t\t12_import_files… "@\t\t12_import_files…
# 10          3 "Rdev/… 12_import_sq… ./Rdev/10_… ./Rdev/1… /home/rstudio/… "\t\t12_import… <chr> <chr [3]>   <chr [0]>  "@\t\t12_import_sqli… "@\t\t12_import_sqlit… "@\t\t12_import_sqlit…
# # ℹ 51 more rows
# # ℹ abbreviated names: ¹​print_tree_path_files.codes, ²​print_tree_path_files.data
# # ℹ Use `print(n = ...)` to see more rows
  
  
# __________|------  
# @@ END-----  
# ls.str(env1) #-----  
# ls.str(env1$env.internal) #-----  
# # > ls.str(env1) #-----  
# # env.internal : <environment: 0x000001f6d74c17b0> 
# # f_path.df_dirs_recursive.df_files : function (input_path = ".", max_depth = 9, current_depth = 0, gitignore_escaped_select.UC.regex = .tmp$gitignore_escaped_select.UC.regex)  
# # gitignore_escaped_select.UC.regex :  chr [1:23] "\\.RPROJ\\.USER" "\\.RHISTORY" "\\.RDATA" "\\.RUSERDATA" ".*\\.ZIP" ".*\\.7Z" ".*\\.RPROJ" "\\.GITIGNORE" ...
# # > ls.str(env1$env.internal) #-----    
  
# __________|------  
# @@ END----  
