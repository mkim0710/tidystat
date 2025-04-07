# # .objectname = "f_DSname.Search.read.checkEntity"
# # f_DSname.Search.read.checkEntity.dev.r
# # f_DSname.Search.read.checkEntity.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/f_DSname.Search.read.checkEntity.dev.r
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/f_DSname.Search.read.checkEntity.source.r")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
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
# if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .RelativeSubPath, .FileName.source.r ======  
.RelativeSubPath = r"(R)" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
.FileName.source.r = "f_DSname.Search.read.checkEntity" |> paste0("-source.R")
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
## @ for (.dependancy in c("")) { -----  
# # for (.dependancy in c("f_FileNameExt.find_subpath", "f_path.size_files")) {
# for (.dependancy in c("f_path.size_files")) {
#     if(!.dependancy %in% names(.GlobalEnv$env1)) {
#         if(Sys.getenv("VERBOSE")==TRUE) { print(paste0("sys.nframe() = ", sys.nframe())) }
#         .FileName.source.r = .dependancy |> paste0(".source.r"); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
#     }
# }




## @ .objectname = "f_DS_path_FileNameExt.read.checkEntity" =========  
.tmp$objectname = "f_DS_path_FileNameExt.read.checkEntity"
.tmp$object = function(DS_path_FileNameExt, vec_candidate4ID = c("rowname", "rownum", "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID"), .width.cutoff=120-15, print2console = TRUE, return.output = TRUE, print.name.dput = FALSE, print.names.tidyeval = FALSE, VERBOSE = isTRUE(getOption("verbose"))) {
    
    if(VERBOSE) cat('DS_path_FileNameExt = ', deparse(DS_path_FileNameExt), '  \n', sep="")

    .path4read = DS_path_FileNameExt |> dirname() 
    FileNameExt = DS_path_FileNameExt |> basename()
    DSN = FileNameExt |> str_remove("\\.(gz|bz2|xz)$") |> str_remove("\\.([[:alnum:]]+)$")
    
    # FileNameExt.regex = FileNameExt %>%  
    #     str_replace_all("\\.", "\\\\.") %>%
    #     str_replace_all("\\(", "\\\\(") %>% 
    #     str_replace_all("\\)", "\\\\)") %>% 
    #     str_replace_all("\\[", "\\\\[") %>% 
    #     str_replace_all("\\]", "\\\\]") %>% 
    #     str_replace_all("\\-", "\\\\-") 
    # FileNameExt.regex <- FileNameExt |> str_replace_all("([().\\[\\]\\-])", "\\\\\\1")

    ## \% return.list$DSN ====
    return.list = list()
    return.list$DSN = DSN
    
    ## \% return.list$df_size_files ====
    # return.list$df_size_files = env1$f$f_path.size_files(.path4read=.path4read[1], regex4FileName = FileNameExt.regex)
    return.list$df_size_files = env1$f$f_path.size_files(.path4read=.path4read[1], literal_FileName = FileNameExt, print2console=print2console)
    
    ## \% return.list$read.proc_time ====
    .path_file = file.path(.path4read[1], FileNameExt)
    # if(print2console) cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
    # return.list$read.proc_time = system.time(assign(DSN, read_rds(.path_file, envir=.GlobalEnv)))
    # if(print2console) return.list$read.proc_time |> print()
    .read.proc_time = system.time(assign(DSN, read_rds(.path_file), envir=.GlobalEnv))
    if(print2console) .read.proc_time |> print()
    
    
    ##@ MetaData needs to be restored to .GlobalEnv first: it will be updated within .GlobalEnv as needed.
    if (!is.null(attributes(.GlobalEnv[[DSN]])$MetaData)) {
        .GlobalEnv$MetaData = as.list(attributes(.GlobalEnv[[DSN]])$MetaData)
    }
        
    ##@ attributes(.GlobalEnv[[DSN]])$DSN or attributes(attributes(.GlobalEnv[[DSN]])$DSN)$.path_file need to be updated.
    attributes(.GlobalEnv[[DSN]])$DSN = DSN
    attributes(attributes(.GlobalEnv[[DSN]])$DSN)$.path_file = .path_file |> normalizePath(winslash = "/") |> str_replace_all(env1$path$path1|>fixed(ignore_case=TRUE), "") |> str_replace("^/", "")

    ## \% return.list$dim ====
    if(print2console) cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")
    return.list$dim = dim(get(DSN))
    if(print2console) cat("dim(",DSN,") == ",deparse(dim(get(DSN))),"  \n", sep="")
    
    ## \% return.list$n_distinct ====
    # Error: attributes(get(DSN))$n_distinct = list()
    if( !"n_distinct" %in% names(attributes(.GlobalEnv[[DSN]])) ) attributes(.GlobalEnv[[DSN]])$n_distinct = list()
    DSN.nrow = nrow(get(DSN))
    attributes(.GlobalEnv[[DSN]])$n_distinct$nrow = DSN.nrow
    for (varname in vec_candidate4ID) {
        if(varname %in% names(get(DSN))) {
            .varname.n_distinct = n_distinct(get(DSN)[[varname]])
            attributes(.GlobalEnv[[DSN]])$n_distinct[[varname]] = .varname.n_distinct
            MessageText1 = paste0("nrow(",DSN,")")
            MessageText2 = paste0("n_distinct(",DSN,"$",varname,") == ",.varname.n_distinct)
            # if (DSN.nrow != .varname.n_distinct) {MessageText4cat = paste0(MessageText1," != ",MessageText2, "  \n");warning(MessageText4cat);cat("Warning: ",MessageText4cat,"\n",sep="")} else {MessageText4cat = paste0(MessageText1," == ",MessageText2, "  \n");cat(MessageText4cat)}
            if (DSN.nrow != .varname.n_distinct) {  MessageText4cat = paste0(MessageText1," != ",MessageText2, "  \n"); warning(MessageText4cat)  } else {  MessageText4cat = paste0(MessageText1," == ",MessageText2, "  \n"); if(print2console) cat(MessageText4cat)  }
        # } else {
        #     attributes(.GlobalEnv[[DSN]])$n_distinct[[varname]] = NA
        }
    }
    return.list$n_distinct = attributes(.GlobalEnv[[DSN]])$n_distinct
    # if (all(!( vec_candidate4ID %in% names(get(DSN)) ))) {MessageText4cat = paste0('varname for ID not identified among: ', deparse(vec_candidate4ID), "  \n");warning(MessageText4cat);cat("Warning: ",MessageText4cat,"\n",sep="")}
    if (  all( !( vec_candidate4ID %in% names(get(DSN)) ) )  ) {  MessageText4cat = paste0('varname for ID not identified among: ', vec_candidate4ID|>deparse(width.cutoff=500), "  \n"); warning(MessageText4cat)  }
    
    ## \% return.list$names ====
    if(print2console) cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")
    return.list$names = get(DSN) |> names() 
    if(print2console) {
        cat("> names(",DSN,') |> deparse(width.cutoff=',.width.cutoff,') |> paste0(collapse="  \\n") |> cat("  \\n", sep="")',"  \n", sep=""); 
        if(ncol(get(DSN)) <= 100 || print.name.dput) {
            get(DSN) |> names() |> deparse(width.cutoff=.width.cutoff) |> paste0(collapse="  \n") |> cat("  \n", sep=""); # dput(); |> deparse(width.cutoff=120-15) |> paste0(collapse="  \n") |> cat("  \n", sep=""); # width.cutoff=500 is the max ---  
        } else {cat("ncol(get(",DSN,")) > 100 && !print.name.dput \n", sep="")}
        cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
    }
    
    # return.list$names.tidyeval = get(DSN) |> names() |> paste(collapse=", ") |> strsplit(paste0("(?<=.{",120-20,"})"), perl = TRUE) |> unlist() |> paste0(collapse="  \n") 
    if(print2console) {
        cat("> names(",DSN,') |> paste(collapse=", ") |> strsplit(paste0("(?<=.{",',.width.cutoff,',"})"), perl = TRUE) |> unlist() |> paste0(collapse="  \\n") |> cat("  \\n", sep="")',"  \n", sep=""); 
        if(print.names.tidyeval) {
            get(DSN) |> names() |> paste(collapse=", ") |> strsplit(paste0("(?<=.{",.width.cutoff,"})"), perl = TRUE) |> unlist() |> paste0(collapse="  \n") |> cat("  \n", sep=""); # tidyeval) paste(collapse=", ") |> cat("  \n", sep="") ---  
        } else {cat("!print.names.tidyeval  \n")}
    }
    
    ## \% return.list$str ====
    if(print2console) cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")
    if(print2console) { invisible_or_not = function(x) x } else { invisible_or_not = function(x) invisible(x) }
    # return.list$str = get(DSN) |> str() |> capture.output() |> invisible_or_not()
    attributes(return.list)$str = get(DSN) |> str() |> capture.output() |> invisible_or_not()
    attributes(return.list)$str = as.environment(list(DSN.get.str.capture.output = attributes(return.list)$str))
    if(print2console) {cat("> ",DSN," |> str(max.level=2, give.attr=FALSE)","  \n", sep=""); str(get(DSN), max.level=2, give.attr=FALSE)}
    
    ## \% return.list$head_tail ====
    if(print2console) cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")
    # return.list$head = get(DSN) |> rownames_to_column('#') |> head(n=10) |> as_tibble()
    # return.list$tail = get(DSN) |> rownames_to_column('#') |> tail(n=10) |> as_tibble()
    # cat("> ",DSN," |> as_tibble() |> print(n=9)","  \n", sep=""); print( as_tibble(get(DSN)), n=9)
    if(print2console) {
        cat("> ",DSN," |> rownames_to_column('#') |> head(n=10) |> as_tibble()","  \n", sep=""); get(DSN) |> rownames_to_column('#') |> head(n=10) |> as_tibble() |> print()
        cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
        cat("> ",DSN," |> rownames_to_column('#') |> tail(n=10) |> as_tibble()","  \n", sep=""); get(DSN) |> rownames_to_column('#') |> tail(n=10) |> as_tibble() |> print()
    }
    
    # if(print2console) cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")
    # .t0 = Sys.time()
    # cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); cat("> ",DSN," |> dplyr::select_if(is.numeric))"," |> summary()","  \n", sep=""); get(DSN) |> dplyr::select_if(is.numeric) |> summary() #-----
    # Sys.time() - .t0
    # cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); cat("> ",DSN," |> dplyr::select_if(is.logical))"," |> summary()","  \n", sep=""); get(DSN) |> dplyr::select_if(is.logical) |> summary() #-----
    # Sys.time() - .t0
    # cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); cat("> ",DSN," |> dplyr::select_if(is.factor))"," |> summary()","  \n", sep=""); get(DSN) |> dplyr::select_if(is.factor) |> summary() #-----
    # Sys.time() - .t0
    # cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); cat("> ",DSN," |> dplyr::select_if(is.factor))"," |> summary()","  \n", sep=""); get(DSN) %>% select_if(is.character) %>% map_df(as.factor) |> summary() #-----
    # Sys.time() - .t0
    if(return.output) return(invisible(return.list))
}
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ----
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)





## @ .objectname = "f_DSname.Search.read.checkEntity" =========  
.tmp$objectname = "f_DSname.Search.read.checkEntity"
.tmp$object = function(DSN, ext = "rds", .path4read =  c(".", "data"), vec_candidate4ID = c("rowname", "rownum", "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID"), BreathFirstSearch = TRUE, max_depth = 3, .width.cutoff=120-15, print2console = TRUE, return.output = TRUE, print.name.dput = FALSE, print.names.tidyeval = FALSE, VERBOSE = isTRUE(getOption("verbose"))) {
    MessageText1 = getwd() %>% {paste0(deparse(substitute(.)),' == "',.,'"')}
    MessageText2 = .path4read[1] %>% {paste0(deparse(substitute(.)),' == "',.,'"')}
    # if (getwd() != .path4read) {MessageText4cat = paste0(MessageText1," != ",MessageText2, "  \n");warning(MessageText4cat);cat("Warning: ",MessageText4cat,"\n",sep="")} else {MessageText4cat = paste0(MessageText1," == ",MessageText2, "  \n");cat(MessageText4cat)} #----
    if (getwd()|>normalizePath(winslash="/",mustWork=NA) != .path4read[1]|>normalizePath(winslash="/",mustWork=NA)) {MessageText4cat = paste0(MessageText1," != ",MessageText2, "  \n");warning(MessageText4cat)} else {MessageText4cat = paste0("getwd() == ",MessageText2, "  \n");cat(MessageText4cat)}

    if(VERBOSE) cat('DSN = "', DSN, '"  \n', sep="")
    FileNameExt = paste0(DSN,".", ext)
    
    
    # .path4read = c(.path4read, paste0(.path4read, "/data"))
    .tmp.file.found = FALSE
    for (i in 1:length(.path4read)) {
        i.path4read=.path4read[i]
        if(VERBOSE) cat('i.path4read = "', i.path4read, '"  \n', sep="")
        if(file.exists(file.path(i.path4read, FileNameExt))) {
            message( 'Found .path_FileNameExt == ', deparse(file.path(i.path4read, FileNameExt)) )
            .tmp.file.found = TRUE
            .path4read2 = i.path4read
        } else if(file.exists(file.path(i.path4read, paste0(FileNameExt, ".xz")))) {
            FileNameExt = paste0(FileNameExt, ".xz")
            message( 'Found .path_FileNameExt == ', deparse(file.path(i.path4read, FileNameExt)) )
            .tmp.file.found = TRUE
            .path4read2 = i.path4read
        }  
    }
    if(.tmp.file.found) .path4read=.path4read2

    if(!.tmp.file.found && BreathFirstSearch) {
        if(VERBOSE) cat('!.tmp.file.found && BreathFirstSearch  \n', sep="")
        for (.dependancy in c("f_FileNameExt.find_subpath")) {
            if(!.dependancy %in% names(.GlobalEnv$env1)) {
                if(Sys.getenv("VERBOSE")==TRUE) { print(paste0("sys.nframe() = ", sys.nframe())) }
                .FileName.source.r = .dependancy |> paste0(".source.r"); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
            }
        }
        
        path_FileNameExt = env1$f$f_FileNameExt.find_subpath(FileNameExt, input_path = .path4read[1], max_depth = max_depth, VERBOSE = VERBOSE)
        if (is.null(path_FileNameExt)) {
            path_FileNameExt = env1$f$f_FileNameExt.find_subpath(paste0(FileNameExt, ".xz"), input_path = .path4read[1], max_depth = max_depth, VERBOSE = VERBOSE)
            # if (is.null(path_FileNameExt)) warning(paste0(FileNameExt, " does not exist!")) 
        }
        if (!is.null(path_FileNameExt)) { 
            .tmp.file.found = TRUE
            .path4read = dirname(path_FileNameExt)
            message('Found .RelativeSubPath: ', '.path4read = ', deparse(.path4read))
            FileNameExt = basename(path_FileNameExt)
        }
    } 
    
    if(!.tmp.file.found) {
        warning(paste0(FileNameExt, " does not exist!")) 
    }
    # if(VERBOSE) cat('FileNameExt = "', FileNameExt, '"  \n', sep="")
    
    DS_path_FileNameExt = file.path(.path4read, FileNameExt)
    
    env1$f$f_DS_path_FileNameExt.read.checkEntity(DS_path_FileNameExt, vec_candidate4ID = vec_candidate4ID, .width.cutoff=.width.cutoff, print2console = print2console, return.output = return.output, print.name.dput = print.name.dput, print.names.tidyeval = print.names.tidyeval, VERBOSE = VERBOSE)
    
}
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ----
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)


# # \$ DSN = "fhs.index100le10" =======  
# DSN = "fhs.index100le10"
# out = env1$f$f_DSname.Search.read.checkEntity(DSN = DSN, print2console = FALSE)
# # Warning messages:
# # 1: In env1$f$f_DSname.Search.read.checkEntity(DSN = DSN) :
# #   getwd() != .path4read == "."
# # 2: In env1$f$f_DSname.Search.read.checkEntity(DSN = DSN) :
# #   varname for ID not identified among: c("ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID")
# out = env1$f$f_DSname.Search.read.checkEntity(DSN = DSN, vec_candidate4ID = "randid", print2console = FALSE)
# # Warning message:
# # In env1$f$f_DSname.Search.read.checkEntity(DSN = DSN,  :
# #   getwd() != .path4read == "."


