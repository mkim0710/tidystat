# # objectname = "f_filename.ext.find_subpath"
# # f_filename.ext.find_subpath.dev.r
# # f_filename.ext.find_subpath.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/f_filename.ext.find_subpath.dev.r
# # source("https://github.com/mkim0710/tidystat/raw/master/f_filename.ext.find_subpath.source.r")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# "." |> normalizePath(winslash="/") |> browseURL()
# "[Working Files List].r" |> file.edit()
# "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> shQuote() |> shell.exec()
# "D:/OneDrive/[][Rproject]/Rproject_Rmd/templates-00env.custom.minimum.Rmd" |> shQuote() |> (\(.) shell( paste0('cmd /c ""', file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe")|>normalizePath(winslash="/"), '" "', ., '""') ) )()
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
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
if(!exists("env.custom", envir=.GlobalEnv))
    assign("env.custom", new.env(), envir=.GlobalEnv)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
## env.custom\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat(sep="\n")
# path2look = "/"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "~"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "."; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
if(!"path" %in% names(.GlobalEnv$env.custom)) .GlobalEnv$env.custom$path <- list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env.custom$path[[objectname]] = object;
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env.custom$path[[objectname]] = object;
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)
objectname = "getwd"; object = getwd(); env.custom$path[[objectname]] = object;
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); env.custom$path[[objectname]] = object;
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @ subpath, sourcename ======
subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "f_filename.ext.find_subpath"
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# env.custom$path$subpath = subpath
# env.custom$path$sourcename = sourcename
# env.custom$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.r")
# env.custom$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.Rmd")
# env.custom$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r")
# cat("# ",'sourcename = "',sourcename,'"', "\n",
#     "# ",sourcename,".dev.r", "\n",
#     "# ",sourcename,".source.r", "\n",
#     '# utils::browseURL("',env.custom$path$source_base_local,"/",env.custom$path$subpath,'")', "\n",
#     '# utils::browseURL("',env.custom$path$source_base_github_blob,"/",env.custom$path$subpath.filename.dev.r,'")', "\n",
#     '# source(paste0(env.custom$path$source_base,"/","',env.custom$path$subpath.filename.source.r,'"))', "\n",
#     '# # source("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
#     '# # source("',env.custom$path$source_base_github,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
#     '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.dev.r,'")', "\n",
#     '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.dev.Rmd,'")', "\n",
#     '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
#     sep="")
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# env.custom$path$CurrentSource.path.filename.ext=rstudioapi::getSourceEditorContext()$path 
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# if(sourcename == "default.template") { warning('sourcename == "default.template"') } else {
#     # # if(!file.exists(env.custom$path$subpath.filename.dev.r)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","default.R"),to=env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$CurrentSource.path.filename.ext);
#     # if(!file.exists(env.custom$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","templates-00env.custom.minimum.Rmd"),to=env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$CurrentSource.path.filename.ext);
#     # if(!file.exists(env.custom$path$subpath.filename.source.r)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","default.R"),to=env.custom$path$subpath.filename.source.r); file.edit(env.custom$path$subpath.filename.source.r); file.edit(env.custom$path$CurrentSource.path.filename.ext);
#     file2open = env.custom$path$subpath.filename.dev.Rmd; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); file.edit(env.custom$path$CurrentSource.path.filename.ext);
#     file2open = env.custom$path$subpath.filename.source.r; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); file.edit(env.custom$path$CurrentSource.path.filename.ext);
# }
# #|________________________________________________________________________________|#  
# #|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  

library(tidyverse)

if(!exists("env.custom", envir=.GlobalEnv))
    assign("env.custom", new.env(), envir=.GlobalEnv)
if(!exists("env.custom", envir=.GlobalEnv))
    assign("env.custom", new.env(), envir=.GlobalEnv)
# env.custom = as.environment(env.custom)
# if(!exists("env.internal", envir = env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir=.GlobalEnv)
# if(!"env.internal" %in% names(env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir=.GlobalEnv)
if(!"env.internal" %in% names(.GlobalEnv$env.custom)) .GlobalEnv$env.custom$env.internal <- new.env()

if(!"path" %in% names(env.custom)) {
    env.custom$path = list()
    objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env.custom$path[[objectname]] = object;
    objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env.custom$path[[objectname]] = object;
    env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)  
} 
# #@ for (env.custom.dependancy in c("")) { -----
# for (env.custom.dependancy in c("f_df.tribble_construct")) {
#     if(!env.custom.dependancy %in% names(env.custom)) {
#         if(exists("print.intermediate")) {if(print.intermediate) cat(paste0("sys.nframe() = ", sys.nframe(), "\n"))}
#         objectname = env.custom.dependancy
#         source(file.path(env.custom$path$source_base,"",paste0(objectname,".source.r")))
#     }
# }




#@ objectname = "f_filename.ext.find_subpath" =========
objectname = "f_filename.ext.find_subpath"
object = function(filename.ext, input_path = ".", max_depth = 3, print.intermediate = FALSE, BreathFirstSearch = TRUE, findMultiple = FALSE) {
    # # tools::file_ext(path.basename)
    # # # > tools::file_ext
    # # # function (x) 
    # # # {
    # # #     pos <- regexpr("\\.([[:alnum:]]+)$", x)
    # # #     ifelse(pos > -1L, substring(x, pos + 1L), "")
    # # # }
    # # # <bytecode: 0x0000020ed66821a0>
    # # # <environment: namespace:tools>
    ext = filename.ext |> str_extract("\\.([[:alnum:]]+)$") |> str_replace("^\\.", "")
    if (is.na(ext)) {stop("Error: filename.ext must have an extension.")}
    
    if (print.intermediate) {
        cat("Searching: ", input_path, strrep(" ", max(50-nchar(input_path),0)), "\t at depth ", 0, "\n", sep="")
    }
    
    if (file.exists(file.path(input_path, filename.ext))) {
        return(file.path(input_path, filename.ext))
    } else if (BreathFirstSearch) {
        return(env.custom$f_filename.ext.find_subpath.BreathFirstSearch(filename.ext=filename.ext, input_path=input_path, max_depth=max_depth, print.intermediate=print.intermediate, findMultiple=findMultiple))
    } else {
        return(NULL)
    }
}
if(!objectname %in% names(env.custom)) {
    packageStartupMessage(paste0("Loading: ", "env.custom$", objectname)); 
    env.custom[[objectname]] = object
    # cat("> env.custom$",objectname,"()\n",sep=""); get(objectname, envir=env.custom)() # Run the loaded function by default
}



#@ objectname = "f_filename.ext.find_subpath.BreathFirstSearch" =========
objectname = "f_filename.ext.find_subpath.BreathFirstSearch"
object = function(filename.ext, input_path = ".", max_depth = 3, print.intermediate = FALSE, findMultiple = FALSE) {
    # Breath-first search for the filename.ext in the subdirectories of the input_path
    # Initialize the queue with the input_path at depth 0
    list_list_path_depth <- list(list(path = input_path, depth = 0))
    list_subpath <- list()
    list_out = list()
    
    # Process the queue
    while (length(list_list_path_depth) > 0) {
        # Dequeue the first element
        list_path_depth.current <- list_list_path_depth[[1]]
        list_list_path_depth <- list_list_path_depth[-1]  # Remove the first element
        
        # Add the current path to list_subpath if it's within the max_depth
        if (list_path_depth.current$depth <= max_depth) {
            list_subpath <- c(list_subpath, list(list_path_depth.current$path))
            
            # List subdirectories and enqueue them with incremented depth
            vec_files_subpath <- list.files(list_path_depth.current$path, full.names = TRUE)
            for (i_files_subpath in vec_files_subpath) {
                if (file.info(i_files_subpath)$isdir) {
                    if (print.intermediate) {
                        cat("Searching: ", i_files_subpath, strrep(" ", max(50-nchar(i_files_subpath),0)), "\t at depth ", list_path_depth.current$depth+1, "; ", sep="")
                        cat("Queue length: ", length(list_list_path_depth)+1, "\n", sep="")
                    }
                    if (file.exists(file.path(i_files_subpath, filename.ext))) {
                        if (findMultiple == FALSE) return(file.path(i_files_subpath, filename.ext))
                        list_out <- c(list_out, list(file.path(i_files_subpath, filename.ext)))
                    }
                    # Enqueue subdirectories with incremented depth
                    list_list_path_depth <- c(list_list_path_depth, list(list(path = i_files_subpath, depth = list_path_depth.current$depth + 1)))
                }
            }
        }
    }

    if (length(list_out) == 0) {
        cat("----------- File not found while searching following subpaths:\n")
        vec_subpath <- unlist(list_subpath, use.names = FALSE)
        vec_subpath %>% deparse(width.cutoff=500) |> cat(sep="\n");cat("\n"); # dput(); %>% deparse(width.cutoff=120-15) |> cat(sep="\n"); # width.cutoff=500 is the max ----
        return(NULL)
    }
        
    # # Flatten the list to make it a character vector
    vec_out <- unlist(list_out, use.names = FALSE)
    return(vec_out)
}


if(!objectname %in% names(env.custom)) {
    # packageStartupMessage(paste0("Loading: ", "env.custom$", objectname)); 
    env.custom[[objectname]] = object
    # cat("> env.custom$",objectname,"()\n",sep=""); get(objectname, envir=env.custom)() # Run the loaded function by default
}



# filename.ext = "fhs.index100le10.rds"
# env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# # > env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# # Searching: .                                                 	 at depth 0
# # Searching: ./-info                                           	 at depth 1; Queue length: 1
# # Searching: ./-personal -old                                  	 at depth 1; Queue length: 2
# # Searching: ./-tmp                                            	 at depth 1; Queue length: 3
# # Searching: ./data                                            	 at depth 1; Queue length: 4
# # [1] "./data/fhs.index100le10.rds"
# 
# filename.ext = "help.array.r"
# env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# # > env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# # Searching: .                                                 	 at depth 0
# # Searching: ./-info                                           	 at depth 1; Queue length: 1
# # Searching: ./-personal -old                                  	 at depth 1; Queue length: 2
# # Searching: ./-tmp                                            	 at depth 1; Queue length: 3
# # Searching: ./data                                            	 at depth 1; Queue length: 4
# # Searching: ./examples                                        	 at depth 1; Queue length: 5
# # Searching: ./other                                           	 at depth 1; Queue length: 6
# # Searching: ./Rdev                                            	 at depth 1; Queue length: 7
# # Searching: ./Rmd                                             	 at depth 1; Queue length: 8
# # Searching: ./Rplot                                           	 at depth 1; Queue length: 9
# # Searching: ./tests                                           	 at depth 1; Queue length: 10
# # Searching: ./vignettes                                       	 at depth 1; Queue length: 11
# # Searching: ./data/ATC_RxNorm_NDC                             	 at depth 2; Queue length: 8
# # Searching: ./other/Bash                                      	 at depth 2; Queue length: 7
# # Searching: ./other/Batch                                     	 at depth 2; Queue length: 8
# # Searching: ./other/C                                         	 at depth 2; Queue length: 9
# # Searching: ./other/Excel                                     	 at depth 2; Queue length: 10
# # Searching: ./other/ODBC                                      	 at depth 2; Queue length: 11
# # Searching: ./other/SAS                                       	 at depth 2; Queue length: 12
# # Searching: ./other/Stata                                     	 at depth 2; Queue length: 13
# # Searching: ./other/VBA                                       	 at depth 2; Queue length: 14
# # Searching: ./Rdev/-dev                                       	 at depth 2; Queue length: 14
# # Searching: ./Rdev/00_base_program                            	 at depth 2; Queue length: 15
# # Searching: ./Rdev/00_protocol                                	 at depth 2; Queue length: 16
# # Searching: ./Rdev/10_import_clean_datatype                   	 at depth 2; Queue length: 17
# # Searching: ./Rdev/20_tidy_group_by_match                     	 at depth 2; Queue length: 18
# # Searching: ./Rdev/30_transform_scale_categorical             	 at depth 2; Queue length: 19
# # Searching: ./Rdev/40_visualize_explore_bivariate_stratified  	 at depth 2; Queue length: 20
# # Searching: ./Rdev/50_model_formula_evaluation                	 at depth 2; Queue length: 21
# # Searching: ./Rdev/60_communicate_report_export               	 at depth 2; Queue length: 22
# # Searching: ./Rdev/00_protocol/01_sample_size                 	 at depth 3; Queue length: 7
# # Searching: ./Rdev/00_protocol/05_count_eligible              	 at depth 3; Queue length: 8
# # Searching: ./Rdev/00_protocol/06_count_exposure              	 at depth 3; Queue length: 9
# # Searching: ./Rdev/00_protocol/07_count_outcome               	 at depth 3; Queue length: 10
# # Searching: ./Rdev/10_import_clean_datatype/11_metadata       	 at depth 3; Queue length: 10
# # Searching: ./Rdev/10_import_clean_datatype/12_import_files   	 at depth 3; Queue length: 11
# # Searching: ./Rdev/10_import_clean_datatype/12_import_sqlite  	 at depth 3; Queue length: 12
# # Searching: ./Rdev/10_import_clean_datatype/12_import_vocabulary	 at depth 3; Queue length: 13
# # Searching: ./Rdev/10_import_clean_datatype/13_duplicated     	 at depth 3; Queue length: 14
# # Searching: ./Rdev/10_import_clean_datatype/13_missing_value  	 at depth 3; Queue length: 15
# # Searching: ./Rdev/10_import_clean_datatype/13_split_fold     	 at depth 3; Queue length: 16
# # Searching: ./Rdev/10_import_clean_datatype/15_cleaning_text  	 at depth 3; Queue length: 17
# # Searching: ./Rdev/10_import_clean_datatype/15_cleaning_time  	 at depth 3; Queue length: 18
# # Searching: ./Rdev/10_import_clean_datatype/16_categorical_factor	 at depth 3; Queue length: 19
# # Searching: ./Rdev/10_import_clean_datatype/17_categorical_indicators	 at depth 3; Queue length: 20
# # Searching: ./Rdev/10_import_clean_datatype/18_dichotomous_logical	 at depth 3; Queue length: 21
# # Searching: ./Rdev/10_import_clean_datatype/19_datetime       	 at depth 3; Queue length: 22
# # Searching: ./Rdev/10_import_clean_datatype/19_numeric_integer	 at depth 3; Queue length: 23
# # Searching: ./Rdev/10_import_clean_datatype/array_list        	 at depth 3; Queue length: 24
# # [1] "./Rdev/10_import_clean_datatype/array_list/help.array.r"
# 
# filename.ext = "does not exist.r"
# env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# # > env.custom$f_filename.ext.find_subpath(filename.ext, print.intermediate = T)
# # Searching: .                                                 	 at depth 0
# # Searching: ./-info                                           	 at depth 1; Queue length: 1
# # Searching: ./-personal -old                                  	 at depth 1; Queue length: 2
# # Searching: ./-tmp                                            	 at depth 1; Queue length: 3
# # Searching: ./data                                            	 at depth 1; Queue length: 4
# # Searching: ./examples                                        	 at depth 1; Queue length: 5
# # Searching: ./other                                           	 at depth 1; Queue length: 6
# # Searching: ./Rdev                                            	 at depth 1; Queue length: 7
# # Searching: ./Rmd                                             	 at depth 1; Queue length: 8
# # Searching: ./Rplot                                           	 at depth 1; Queue length: 9
# # Searching: ./tests                                           	 at depth 1; Queue length: 10
# # Searching: ./vignettes                                       	 at depth 1; Queue length: 11
# # Searching: ./data/ATC_RxNorm_NDC                             	 at depth 2; Queue length: 8
# # Searching: ./other/Bash                                      	 at depth 2; Queue length: 7
# # Searching: ./other/Batch                                     	 at depth 2; Queue length: 8
# # Searching: ./other/C                                         	 at depth 2; Queue length: 9
# # Searching: ./other/Excel                                     	 at depth 2; Queue length: 10
# # Searching: ./other/ODBC                                      	 at depth 2; Queue length: 11
# # Searching: ./other/SAS                                       	 at depth 2; Queue length: 12
# # Searching: ./other/Stata                                     	 at depth 2; Queue length: 13
# # Searching: ./other/VBA                                       	 at depth 2; Queue length: 14
# # Searching: ./Rdev/-dev                                       	 at depth 2; Queue length: 14
# # Searching: ./Rdev/00_base_program                            	 at depth 2; Queue length: 15
# # Searching: ./Rdev/00_protocol                                	 at depth 2; Queue length: 16
# # Searching: ./Rdev/10_import_clean_datatype                   	 at depth 2; Queue length: 17
# # Searching: ./Rdev/20_tidy_group_by_match                     	 at depth 2; Queue length: 18
# # Searching: ./Rdev/30_transform_scale_categorical             	 at depth 2; Queue length: 19
# # Searching: ./Rdev/40_visualize_explore_bivariate_stratified  	 at depth 2; Queue length: 20
# # Searching: ./Rdev/50_model_formula_evaluation                	 at depth 2; Queue length: 21
# # Searching: ./Rdev/60_communicate_report_export               	 at depth 2; Queue length: 22
# # Searching: ./Rdev/00_protocol/01_sample_size                 	 at depth 3; Queue length: 7
# # Searching: ./Rdev/00_protocol/05_count_eligible              	 at depth 3; Queue length: 8
# # Searching: ./Rdev/00_protocol/06_count_exposure              	 at depth 3; Queue length: 9
# # Searching: ./Rdev/00_protocol/07_count_outcome               	 at depth 3; Queue length: 10
# # Searching: ./Rdev/10_import_clean_datatype/11_metadata       	 at depth 3; Queue length: 10
# # Searching: ./Rdev/10_import_clean_datatype/12_import_files   	 at depth 3; Queue length: 11
# # Searching: ./Rdev/10_import_clean_datatype/12_import_sqlite  	 at depth 3; Queue length: 12
# # Searching: ./Rdev/10_import_clean_datatype/12_import_vocabulary	 at depth 3; Queue length: 13
# # Searching: ./Rdev/10_import_clean_datatype/13_duplicated     	 at depth 3; Queue length: 14
# # Searching: ./Rdev/10_import_clean_datatype/13_missing_value  	 at depth 3; Queue length: 15
# # Searching: ./Rdev/10_import_clean_datatype/13_split_fold     	 at depth 3; Queue length: 16
# # Searching: ./Rdev/10_import_clean_datatype/15_cleaning_text  	 at depth 3; Queue length: 17
# # Searching: ./Rdev/10_import_clean_datatype/15_cleaning_time  	 at depth 3; Queue length: 18
# # Searching: ./Rdev/10_import_clean_datatype/16_categorical_factor	 at depth 3; Queue length: 19
# # Searching: ./Rdev/10_import_clean_datatype/17_categorical_indicators	 at depth 3; Queue length: 20
# # Searching: ./Rdev/10_import_clean_datatype/18_dichotomous_logical	 at depth 3; Queue length: 21
# # Searching: ./Rdev/10_import_clean_datatype/19_datetime       	 at depth 3; Queue length: 22
# # Searching: ./Rdev/10_import_clean_datatype/19_numeric_integer	 at depth 3; Queue length: 23
# # Searching: ./Rdev/10_import_clean_datatype/array_list        	 at depth 3; Queue length: 24
# # Searching: ./Rdev/20_tidy_group_by_match/23_group_by_PersonID	 at depth 3; Queue length: 24
# # Searching: ./Rdev/20_tidy_group_by_match/25_study_population 	 at depth 3; Queue length: 25
# # Searching: ./Rdev/20_tidy_group_by_match/27_match            	 at depth 3; Queue length: 26
# # Searching: ./Rdev/40_visualize_explore_bivariate_stratified/43_network	 at depth 3; Queue length: 25
# # Searching: ./Rdev/40_visualize_explore_bivariate_stratified/44_map	 at depth 3; Queue length: 26
# # Searching: ./Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures	 at depth 3; Queue length: 27
# # Searching: ./Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified	 at depth 3; Queue length: 28
# # Searching: ./Rdev/50_model_formula_evaluation/51_model_formula	 at depth 3; Queue length: 28
# # Searching: ./Rdev/50_model_formula_evaluation/53_model_selection	 at depth 3; Queue length: 29
# # Searching: ./Rdev/50_model_formula_evaluation/55_model_weighted	 at depth 3; Queue length: 30
# # Searching: ./Rdev/50_model_formula_evaluation/56_model_bootstrap	 at depth 3; Queue length: 31
# # Searching: ./Rdev/50_model_formula_evaluation/57_model_time2event	 at depth 3; Queue length: 32
# # Searching: ./Rdev/50_model_formula_evaluation/57_model_trajectory	 at depth 3; Queue length: 33
# # Searching: ./Rdev/50_model_formula_evaluation/59_model_evaluation	 at depth 3; Queue length: 34
# # ----------- File not found while searching following subpaths:
# # c(".", "./-info", "./-personal -old", "./-tmp", "./data", "./examples", "./other", "./Rdev", "./Rmd", "./Rplot", "./tests", "./vignettes", "./data/ATC_RxNorm_NDC", "./other/Bash", "./other/Batch", "./other/C", "./other/Excel", "./other/ODBC", "./other/SAS", "./other/Stata", "./other/VBA", "./Rdev/-dev", "./Rdev/00_base_program", "./Rdev/00_protocol", "./Rdev/10_import_clean_datatype", "./Rdev/20_tidy_group_by_match", "./Rdev/30_transform_scale_categorical", "./Rdev/40_visualize_explore_bivariate_stratified", "./Rdev/50_model_formula_evaluation", "./Rdev/60_communicate_report_export", "./Rdev/00_protocol/01_sample_size", "./Rdev/00_protocol/05_count_eligible", "./Rdev/00_protocol/06_count_exposure", "./Rdev/00_protocol/07_count_outcome", "./Rdev/10_import_clean_datatype/11_metadata", "./Rdev/10_import_clean_datatype/12_import_files", "./Rdev/10_import_clean_datatype/12_import_sqlite", "./Rdev/10_import_clean_datatype/12_import_vocabulary", "./Rdev/10_import_clean_datatype/13_duplicated", "./Rdev/10_import_clean_datatype/13_missing_value", "./Rdev/10_import_clean_datatype/13_split_fold", "./Rdev/10_import_clean_datatype/15_cleaning_text", "./Rdev/10_import_clean_datatype/15_cleaning_time", "./Rdev/10_import_clean_datatype/16_categorical_factor", "./Rdev/10_import_clean_datatype/17_categorical_indicators", "./Rdev/10_import_clean_datatype/18_dichotomous_logical", "./Rdev/10_import_clean_datatype/19_datetime", "./Rdev/10_import_clean_datatype/19_numeric_integer", "./Rdev/10_import_clean_datatype/array_list", "./Rdev/20_tidy_group_by_match/23_group_by_PersonID", "./Rdev/20_tidy_group_by_match/25_study_population", "./Rdev/20_tidy_group_by_match/27_match", "./Rdev/40_visualize_explore_bivariate_stratified/43_network", "./Rdev/40_visualize_explore_bivariate_stratified/44_map", "./Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures", "./Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified", "./Rdev/50_model_formula_evaluation/51_model_formula", "./Rdev/50_model_formula_evaluation/53_model_selection", "./Rdev/50_model_formula_evaluation/55_model_weighted", "./Rdev/50_model_formula_evaluation/56_model_bootstrap", "./Rdev/50_model_formula_evaluation/57_model_time2event", "./Rdev/50_model_formula_evaluation/57_model_trajectory", "./Rdev/50_model_formula_evaluation/59_model_evaluation")
# # NULL
