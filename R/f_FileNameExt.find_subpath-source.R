# # .objectname = "f_FileNameExt.find_subpath"
# # f_FileNameExt.find_subpath.dev.r
# # f_FileNameExt.find_subpath.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/f_FileNameExt.find_subpath.dev.r
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/f_FileNameExt.find_subpath.source.r")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# env1$f$MH_shortcuts()
# env1$f$openWorkingFilesList()
# env1$f$showCodeText2restartSession.pending()
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# env1$f$showSymbolPaths()
# env1$f$showProjectPathFiles()
# env1$f$showProjectPathsRecursively()
# env1$f$showProjectPathsAtTidyStat()
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# # .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
# env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
# if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .RelativeSubPath, .FileName.source.r ======  
.RelativeSubPath = r"(R)" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
.FileName.source.r = "f_FileNameExt.find_subpath" |> paste0("-source.R")
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
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1 = env0 ----
### \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) )  ----  
# env1 = env0
# env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}

## .GlobalEnv$.tmp = list() ---  
.listname = ".tmp"; if(!exists(.listname, envir=.GlobalEnv)) { assign(.listname, list(), envir=.GlobalEnv) }
## .GlobalEnv$env1 = new.env() ====  
.envname = "env1"; if(!exists(.envname, envir=.GlobalEnv)) { assign(.envname, new.env(), envir=.GlobalEnv) }
# env1 = as.environment(env1)
### .GlobalEnv$env1$env.internal = new.env() ====  
.subenvname = "env.internal"; .parentname = "env1"; if(!.subenvname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.subenvname]] = new.env() }
### .GlobalEnv$env1$env.internal.attach = new.env() ====  
.subenvname = "env.internal.attach"; .parentname = "env1"; if(!.subenvname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.subenvname]] = new.env() }
### .GlobalEnv$env1$f = list() ====  
.sublistname = "f"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }

if(!"path" %in% names(.GlobalEnv$env1)) {
    env1$path = list()
    .objectname = "source_base_local"; .object = Filter(dir.exists, paste0(c("D:/D_Repositories", "D:/OneDrive/[][Rproject]", "~"), "/github_tidystat"))[1]; .GlobalEnv$env1$path[[.objectname]] = .object
    .objectname = "source_base_github"; .object = "https://raw.githubusercontent.com/mkim0710/tidystat/master"; .GlobalEnv$env1$path[[.objectname]] = .object
    if(!"source_base" %in% names(.GlobalEnv$env1$path)) { env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github) }  
} 
# #@ for (.dependancy in c("")) { -----  
# for (.dependancy in c("f_df.t.tribble_construct")) {
#     if(!.dependancy %in% names(.GlobalEnv$env1)) {
#         if(Sys.getenv("VERBOSE")==TRUE) { print(paste0("sys.nframe() = ", sys.nframe())) }
#         .objectname = .dependancy
#         source(file.path(env1$path$source_base,"",paste0(.objectname,".source.r")))
#     }
# }




## @ .objectname = "f_FileNameExt.find_subpath" =========  
.tmp$objectname = "f_FileNameExt.find_subpath"
.tmp$object = function(FileNameExt, input_path = ".", max_depth = 3, VERBOSE = FALSE, BreathFirstSearch = TRUE, findMultiple = FALSE) {
    # # tools::file_ext(path.basename)
    # # # > tools::file_ext
    # # # function (x) 
    # # # {
    # # #     pos <- regexpr("\\.([[:alnum:]]+)$", x)
    # # #     ifelse(pos > -1L, substring(x, pos + 1L), "")
    # # # }
    # # # <bytecode: 0x0000020ed66821a0>
    # # # <environment: namespace:tools>
    ext = FileNameExt |> str_extract("\\.([[:alnum:]]+)$") |> str_remove("^\\.")
    if (is.na(ext)) {stop("Error: FileNameExt must have an extension.")}
    
    if (VERBOSE) {
        cat("Searching: ", input_path, strrep(" ", max(50-nchar(input_path),0)), "\t at depth ", 0, "  \n", sep="")
    }
    
    if (file.exists(file.path(input_path, FileNameExt))) {
        return(file.path(input_path, FileNameExt))
    } else if (BreathFirstSearch) {
        return(env1$f$f_FileNameExt.find_subpath.BreathFirstSearch(FileNameExt=FileNameExt, input_path=input_path, max_depth=max_depth, VERBOSE=VERBOSE, findMultiple=findMultiple))
    } else {
        return(NULL)
    }
}
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ----
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)



## @ .objectname = "f_FileNameExt.find_subpath.BreathFirstSearch" =========  
.tmp$objectname = "f_FileNameExt.find_subpath.BreathFirstSearch"
.tmp$object = function(FileNameExt, input_path = ".", max_depth = 3, VERBOSE = FALSE, findMultiple = FALSE) {
    # Breath-first search for the FileNameExt in the subdirectories of the input_path
    # Initialize the queue with the input_path at depth 0
    list_list_path_depth <- list(list(path = input_path, depth = 0))
    list_subpath = list()
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
            # vec_files_subpath <- list.files(list_path_depth.current$path, full.names = TRUE, recursive = FALSE)
            vec_files_subpath <- list.dirs(list_path_depth.current$path, full.names = TRUE, recursive = FALSE)
            vec_files_subpath = vec_files_subpath[!basename(vec_files_subpath) %in% c(".git", ".Rproj.user", "-BACKUP", "cache", ".history", "libs")]
            for (i_files_subpath in vec_files_subpath) {
                if (VERBOSE) cat(' >  i_files_subpath == ',deparse(i_files_subpath), "  \n", sep = "")
                if (file.info(i_files_subpath)$isdir) {
                    if (VERBOSE) {
                        cat("Searching: ", i_files_subpath, strrep(" ", max(50-nchar(i_files_subpath),0)), "\t at depth ", list_path_depth.current$depth+1, "; ", sep="")
                        cat("Queue length: ", length(list_list_path_depth)+1, "  \n", sep="")
                    }
                    if (file.exists(file.path(i_files_subpath, FileNameExt))) {
                        if (findMultiple == FALSE) return(file.path(i_files_subpath, FileNameExt))
                        list_out <- c(list_out, list(file.path(i_files_subpath, FileNameExt)))
                    }
                    # Enqueue subdirectories with incremented depth
                    list_list_path_depth <- c(list_list_path_depth, list(list(path = i_files_subpath, depth = list_path_depth.current$depth + 1)))
                }
            }
        }
    }

    if (VERBOSE) {
        if (length(list_out) == 0) {
            cat("----------- File not found while searching following .RelativeSubPaths:\n")
            vec_subpath <- unlist(list_subpath, use.names = FALSE)
            vec_subpath |> paste0(collapse='",  \n  "') %>% {cat('c("',.,'")  \n', sep="")}; # env1$f$f_vec.dput_line_by_line(); |> paste0(collapse='",  \n  "') %>% {cat('c("',.,'")  \n', sep="")} ----
            return(NULL)
        }
    }
    
        
    # # Flatten the list to make it a character vector
    vec_out <- unlist(list_out, use.names = FALSE)
    return(vec_out)
}


### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ----
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)



# FileNameExt = "fhs.index100le10.rds"
# env1$f$f_FileNameExt.find_subpath(FileNameExt, VERBOSE = T)
# # > env1$f$f_FileNameExt.find_subpath(FileNameExt, VERBOSE = T)
# # Searching: .                                                 	 at depth 0
# # Searching: ./-info                                           	 at depth 1; Queue length: 1
# # Searching: ./-personal -old                                  	 at depth 1; Queue length: 2
# # Searching: ./-tmp                                            	 at depth 1; Queue length: 3
# # Searching: ./data                                            	 at depth 1; Queue length: 4
# # [1] "./data/fhs.index100le10.rds"
# 
# FileNameExt = "help.array.r"
# env1$f$f_FileNameExt.find_subpath(FileNameExt, VERBOSE = T)
# # > env1$f$f_FileNameExt.find_subpath(FileNameExt, VERBOSE = T)
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
# FileNameExt = "does not exist.r"
# env1$f$f_FileNameExt.find_subpath(FileNameExt, VERBOSE = T)
# # > env1$f$f_FileNameExt.find_subpath(FileNameExt, VERBOSE = T)
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
# # ----------- File not found while searching following .RelativeSubPaths:
# # c(".", "./-info", "./-personal -old", "./-tmp", "./data", "./examples", "./other", "./Rdev", "./Rmd", "./Rplot", "./tests", "./vignettes", "./data/ATC_RxNorm_NDC", "./other/Bash", "./other/Batch", "./other/C", "./other/Excel", "./other/ODBC", "./other/SAS", "./other/Stata", "./other/VBA", "./Rdev/-dev", "./Rdev/00_base_program", "./Rdev/00_protocol", "./Rdev/10_import_clean_datatype", "./Rdev/20_tidy_group_by_match", "./Rdev/30_transform_scale_categorical", "./Rdev/40_visualize_explore_bivariate_stratified", "./Rdev/50_model_formula_evaluation", "./Rdev/60_communicate_report_export", "./Rdev/00_protocol/01_sample_size", "./Rdev/00_protocol/05_count_eligible", "./Rdev/00_protocol/06_count_exposure", "./Rdev/00_protocol/07_count_outcome", "./Rdev/10_import_clean_datatype/11_metadata", "./Rdev/10_import_clean_datatype/12_import_files", "./Rdev/10_import_clean_datatype/12_import_sqlite", "./Rdev/10_import_clean_datatype/12_import_vocabulary", "./Rdev/10_import_clean_datatype/13_duplicated", "./Rdev/10_import_clean_datatype/13_missing_value", "./Rdev/10_import_clean_datatype/13_split_fold", "./Rdev/10_import_clean_datatype/15_cleaning_text", "./Rdev/10_import_clean_datatype/15_cleaning_time", "./Rdev/10_import_clean_datatype/16_categorical_factor", "./Rdev/10_import_clean_datatype/17_categorical_indicators", "./Rdev/10_import_clean_datatype/18_dichotomous_logical", "./Rdev/10_import_clean_datatype/19_datetime", "./Rdev/10_import_clean_datatype/19_numeric_integer", "./Rdev/10_import_clean_datatype/array_list", "./Rdev/20_tidy_group_by_match/23_group_by_PersonID", "./Rdev/20_tidy_group_by_match/25_study_population", "./Rdev/20_tidy_group_by_match/27_match", "./Rdev/40_visualize_explore_bivariate_stratified/43_network", "./Rdev/40_visualize_explore_bivariate_stratified/44_map", "./Rdev/40_visualize_explore_bivariate_stratified/45_bivariate_measures", "./Rdev/40_visualize_explore_bivariate_stratified/47_bivariate_partial_stratified", "./Rdev/50_model_formula_evaluation/51_model_formula", "./Rdev/50_model_formula_evaluation/53_model_selection", "./Rdev/50_model_formula_evaluation/55_model_weighted", "./Rdev/50_model_formula_evaluation/56_model_bootstrap", "./Rdev/50_model_formula_evaluation/57_model_time2event", "./Rdev/50_model_formula_evaluation/57_model_trajectory", "./Rdev/50_model_formula_evaluation/59_model_evaluation")
# # NULL
