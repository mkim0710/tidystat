# # objectname = "f_DataSetName.read.checkEntity"
# # f_DataSetName.read.checkEntity.dev.r
# # f_DataSetName.read.checkEntity.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/f_DataSetName.read.checkEntity.dev.r
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/f_DataSetName.read.checkEntity.source.r")
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
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
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# file.edit( paste0("[Working Files List] ",basename(getwd()),".r") )  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## \$ env1\$path\$CurrentSource.path.filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal$f_path.CurrentSource.path.filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) source -----  
### @ .subpath, .sourcename ======  
.subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(.subpath!="") utils::browseURL(normalizePath(.subpath))
.sourcename = "f_DataSetName.read.checkEntity" |> paste0(".source.r")
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# env1$path$.subpath = .subpath
# .sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
# env1$path$.sourcename_root = .sourcename_root  
# env1$path$.subpath.filename.dev.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.r")
# env1$path$.subpath.filename.dev.Rmd = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.Rmd")
# env1$path$.subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# cat("# ",'.sourcename_root = "',.sourcename_root,'"', "  \n",
#     "# ",env1$path$.subpath.filename.dev.r, "  \n",
#     "# ",env1$path$.subpath.filename.dev.Rmd, "  \n",
#     "# ",env1$path$.subpath.filename.source.r, "  \n",
#     '# # source("',env1$path$source_base,"/",env1$path$.subpath.filename.source.r,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
#     sep="")
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# # \% source( file.path(env1$path$source_base,.subpath.filename.source.r) ) ----  
# .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ RUN ALL ABOVE: CTRL+ALT+B -----  
#| RUN ALL ABOVE: CTRL+ALT+B |#
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  



library(tidyverse)

# \$ .GlobalEnv$.tmp = list() ====  
if(!exists(".tmp", envir=.GlobalEnv)) { assign(".tmp", list(), envir=.GlobalEnv) }  
# \$ .GlobalEnv$env1 = new.env() ====  
if(!exists("env1", envir=.GlobalEnv)) { assign("env1", new.env(), envir=.GlobalEnv) }
# env1 = as.environment(env1)
# \$ .GlobalEnv$env1$env.internal = new.env() ====  
if(!"env.internal" %in% names(.GlobalEnv$env1)) { .GlobalEnv$env1$env.internal <- new.env() }
# \$ .GlobalEnv$env1$f = list() ====  
if(!"f" %in% names(.GlobalEnv$env1)) { .GlobalEnv$env1$f <- list() }

if(!"path" %in% names(.GlobalEnv$env1)) {
    env1$path = list()
    objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); .GlobalEnv$env1$path[[objectname]] = object
    objectname = "source_base_github"; object = "https://raw.githubusercontent.com/mkim0710/tidystat/master"; .GlobalEnv$env1$path[[objectname]] = object
    if(!"source_base" %in% names(.GlobalEnv$env1$path)) { env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github) }  
} 
#@ for (.dependancy in c("")) { -----  
# for (.dependancy in c("f_filename.ext.find_subpath", "f_path.size_files")) {
for (.dependancy in c("f_path.size_files")) {
    if(!.dependancy %in% names(.GlobalEnv$env1)) {
        if(Sys.getenv("print.intermediate")==TRUE) { print(paste0("sys.nframe() = ", sys.nframe())) }
        .sourcename = .dependancy |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
    }
}



#@ objectname = "f_DataSetName.read.checkEntity" =========  
.tmp$objectname = "f_DataSetName.read.checkEntity"
.tmp$object = function(DataSetName, ext = "rds", .path4read = ".", vec_varname4ID = c("rowname", "rownum", "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID"), BreathFirstSearch = TRUE, max_depth = 3, .width.cutoff=120-15, print2console = TRUE, return.output = TRUE, print.name.dput = FALSE, print.names.tidyeval = FALSE, print.intermediate = FALSE) {
    MessageText1 = getwd() %>% {paste0(deparse(substitute(.)),' == "',.,'"')}
    MessageText2 = .path4read %>% {paste0(deparse(substitute(.)),' == "',.,'"')}
    # if (getwd() != .path4read) {MessageText4cat = paste0(MessageText1," != ",MessageText2, "  \n");warning(MessageText4cat);cat("Warning: ",MessageText4cat,"\n",sep="")} else {MessageText4cat = paste0(MessageText1," == ",MessageText2, "  \n");cat(MessageText4cat)} #----
    if (getwd()|>normalizePath(winslash="/") != .path4read|>normalizePath(winslash="/")) {MessageText4cat = paste0(MessageText1," != ",MessageText2, "  \n");warning(MessageText4cat)} else {MessageText4cat = paste0("getwd() == ",MessageText2, "  \n")}

    if(print.intermediate) cat('DataSetName = "', DataSetName, '"  \n', sep="")
    filename.ext = paste0(DataSetName,".", ext)
    if(file.exists(file.path(.path4read, filename.ext))) {
    } else if(file.exists(file.path(.path4read, paste0(filename.ext, ".xz")))) {
        filename.ext = paste0(filename.ext, ".xz")
    } else if(BreathFirstSearch) {
        
        for (.dependancy in c("f_filename.ext.find_subpath")) {
            if(!.dependancy %in% names(.GlobalEnv$env1)) {
                if(Sys.getenv("print.intermediate")==TRUE) { print(paste0("sys.nframe() = ", sys.nframe())) }
                .sourcename = .dependancy |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
            }
        }
        
        path.filename.ext = env1$f$f_filename.ext.find_subpath(filename.ext, input_path = .path4read, max_depth = max_depth, print.intermediate = print.intermediate)
        if (is.null(path.filename.ext)) {
            path.filename.ext = env1$f$f_filename.ext.find_subpath(paste0(filename.ext, ".xz"), input_path = .path4read, max_depth = max_depth, print.intermediate = print.intermediate)
            if (is.null(path.filename.ext)) warning(paste0(filename.ext, " does not exist!")) 
        }
        .path4read = dirname(path.filename.ext)
        cat('Found subpath: ', '.path4read = "', .path4read, '"  \n', sep="")
        filename.ext = basename(path.filename.ext)
    } else {
        warning(paste0(filename.ext, " does not exist!")) 
    }
    if(print.intermediate) cat('filename.ext = "', filename.ext, '"  \n', sep="")

    # filename.ext.regex = filename.ext %>%  
    #     str_replace_all("\\.", "\\\\.") %>%
    #     str_replace_all("\\(", "\\\\(") %>% 
    #     str_replace_all("\\)", "\\\\)") %>% 
    #     str_replace_all("\\[", "\\\\[") %>% 
    #     str_replace_all("\\]", "\\\\]") %>% 
    #     str_replace_all("\\-", "\\\\-") 
    # filename.ext.regex <- filename.ext |> str_replace_all("([().\\[\\]\\-])", "\\\\\\1")

    ## \% return.list$DataSetName ====
    return.list = list()
    return.list$DataSetName = DataSetName
    
    ## \% return.list$df_size_files ====
    # return.list$df_size_files = env1$f$f_path.size_files(.path4read = .path4read, regex4filename = filename.ext.regex)
    return.list$df_size_files = env1$f$f_path.size_files(.path4read=.path4read, literal_filename = filename.ext, print2console=print2console)
    
    ## \% return.list$read.proc_time ====
    # if(print2console) cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
    return.list$read.proc_time = system.time(assign(DataSetName, read_rds(file.path(.path4read, filename.ext)), envir=.GlobalEnv))
    if(print2console) return.list$read.proc_time |> print()

    ## \% return.list$dim ====
    if(print2console) cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")
    return.list$dim = dim(get(DataSetName))
    if(print2console) cat("dim(",DataSetName,") = ",deparse(dim(get(DataSetName))),"  \n", sep="")
    if(print2console) cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")
    
    ## \% return.list$n_distinct ====
    # Error: attributes(get(DataSetName))$n_distinct = list()
    if( !"n_distinct" %in% names(attributes(.GlobalEnv[[DataSetName]])) ) attributes(.GlobalEnv[[DataSetName]])$n_distinct = list()
    DataSetName.nrow = nrow(get(DataSetName))
    attributes(.GlobalEnv[[DataSetName]])$n_distinct$nrow = DataSetName.nrow
    for (varname in vec_varname4ID) {
        if(varname %in% names(get(DataSetName))) {
            .varname.n_distinct = n_distinct(get(DataSetName)[[varname]])
            attributes(.GlobalEnv[[DataSetName]])$n_distinct[[varname]] = .varname.n_distinct
            MessageText1 = paste0("nrow(",DataSetName,")")
            MessageText2 = paste0("n_distinct(",DataSetName,"$",varname,") = ",.varname.n_distinct)
            # if (DataSetName.nrow != .varname.n_distinct) {MessageText4cat = paste0(MessageText1," != ",MessageText2, "  \n");warning(MessageText4cat);cat("Warning: ",MessageText4cat,"\n",sep="")} else {MessageText4cat = paste0(MessageText1," == ",MessageText2, "  \n");cat(MessageText4cat)}
            if (DataSetName.nrow != .varname.n_distinct) {  MessageText4cat = paste0(MessageText1," != ",MessageText2, "  \n"); warning(MessageText4cat)  } else {  MessageText4cat = paste0(MessageText1," == ",MessageText2, "  \n"); if(print2console) cat(MessageText4cat)  }
        # } else {
        #     attributes(.GlobalEnv[[DataSetName]])$n_distinct[[varname]] = NA
        }
    }
    return.list$n_distinct = attributes(.GlobalEnv[[DataSetName]])$n_distinct
    # if (all(!( vec_varname4ID %in% names(get(DataSetName)) ))) {MessageText4cat = paste0('varname for ID not identified among: ', deparse(vec_varname4ID), "  \n");warning(MessageText4cat);cat("Warning: ",MessageText4cat,"\n",sep="")}
    if (  all( !( vec_varname4ID %in% names(get(DataSetName)) ) )  ) {  MessageText4cat = paste0('varname for ID not identified among: ', vec_varname4ID|>deparse(width.cutoff=500), "  \n"); warning(MessageText4cat)  }
    
    ## \% return.list$names ====
    if(print2console) cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")
    return.list$names = get(DataSetName) |> names() 
    if(print2console) {
        cat("> names(",DataSetName,') |> deparse(width.cutoff=',.width.cutoff,') |> paste0(collapse="  \\n") |> cat("  \\n", sep="")',"  \n", sep=""); 
        if(ncol(get(DataSetName)) <= 100 || print.name.dput) {
            get(DataSetName) |> names() |> deparse(width.cutoff=.width.cutoff) |> paste0(collapse="  \n") |> cat("  \n", sep=""); # dput(); |> deparse(width.cutoff=120-15) |> paste0(collapse="  \n") |> cat("  \n", sep=""); # width.cutoff=500 is the max ---  
        } else {cat("ncol(get(",DataSetName,")) > 100 && !print.name.dput \n", sep="")}
        cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
    }
    
    # return.list$names.tidyeval = get(DataSetName) |> names() |> paste(collapse=", ") |> strsplit(paste0("(?<=.{",120-20,"})"), perl = TRUE) |> unlist() |> paste0(collapse="  \n") 
    if(print2console) {
        cat("> names(",DataSetName,') |> paste(collapse=", ") |> strsplit(paste0("(?<=.{",',.width.cutoff,',"})"), perl = TRUE) |> unlist() |> paste0(collapse="  \\n") |> cat("  \\n", sep="")',"  \n", sep=""); 
        if(print.names.tidyeval) {
            get(DataSetName) |> names() |> paste(collapse=", ") |> strsplit(paste0("(?<=.{",.width.cutoff,"})"), perl = TRUE) |> unlist() |> paste0(collapse="  \n") |> cat("  \n", sep=""); # tidyeval) paste(collapse=", ") |> cat("  \n", sep="") ---  
        } else {cat("!print.names.tidyeval  \n")}
    }
    
    ## \% return.list$str ====
    if(print2console) cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")
    if(print2console) { invisible_or_not = function(x) x } else { invisible_or_not = function(x) invisible(x) }
    return.list$str = get(DataSetName) |> str() |> capture.output() |> invisible_or_not()
    if(print2console) {cat("> ",DataSetName," |> str(max.level=2, give.attr=FALSE)","  \n", sep=""); str(get(DataSetName), max.level=2, give.attr=FALSE)}
    
    ## \% return.list$head_tail ====
    if(print2console) cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")
    # return.list$head = get(DataSetName) |> rownames_to_column('#') |> head(n=10) |> as_tibble()
    # return.list$tail = get(DataSetName) |> rownames_to_column('#') |> tail(n=10) |> as_tibble()
    # cat("> ",DataSetName," |> as_tibble() |> print(n=9)","  \n", sep=""); print( as_tibble(get(DataSetName)), n=9)
    if(print2console) {
        cat("> ",DataSetName," |> rownames_to_column('#') |> head(n=10) |> as_tibble()","  \n", sep=""); get(DataSetName) |> rownames_to_column('#') |> head(n=10) |> as_tibble() |> print()
        cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
        cat("> ",DataSetName," |> rownames_to_column('#') |> tail(n=10) |> as_tibble()","  \n", sep=""); get(DataSetName) |> rownames_to_column('#') |> tail(n=10) |> as_tibble() |> print()
    }
    
    # if(print2console) cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")
    # .t0 = Sys.time()
    # cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); cat("> ",DataSetName," |> dplyr::select_if(is.numeric))"," |> summary()","  \n", sep=""); get(DataSetName) |> dplyr::select_if(is.numeric) |> summary() #-----
    # Sys.time() - .t0
    # cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); cat("> ",DataSetName," |> dplyr::select_if(is.logical))"," |> summary()","  \n", sep=""); get(DataSetName) |> dplyr::select_if(is.logical) |> summary() #-----
    # Sys.time() - .t0
    # cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); cat("> ",DataSetName," |> dplyr::select_if(is.factor))"," |> summary()","  \n", sep=""); get(DataSetName) |> dplyr::select_if(is.factor) |> summary() #-----
    # Sys.time() - .t0
    # cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); cat("> ",DataSetName," |> dplyr::select_if(is.factor))"," |> summary()","  \n", sep=""); get(DataSetName) %>% select_if(is.character) %>% map_df(as.factor) |> summary() #-----
    # Sys.time() - .t0
    if(return.output) return(invisible(return.list))
}
### @ f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name) ----
env1$env.internal$f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name = "f", show_packageStartupMessage = TRUE)


# # \$ DataSetName = "fhs.index100le10" =======  
# DataSetName = "fhs.index100le10"
# out = env1$f$f_DataSetName.read.checkEntity(DataSetName = DataSetName, print2console = FALSE)
# # Warning messages:
# # 1: In env1$f$f_DataSetName.read.checkEntity(DataSetName = DataSetName) :
# #   getwd() != .path4read == "."
# # 2: In env1$f$f_DataSetName.read.checkEntity(DataSetName = DataSetName) :
# #   varname for ID not identified among: c("ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID")
# out = env1$f$f_DataSetName.read.checkEntity(DataSetName = DataSetName, vec_varname4ID = "randid", print2console = FALSE)
# # Warning message:
# # In env1$f$f_DataSetName.read.checkEntity(DataSetName = DataSetName,  :
# #   getwd() != .path4read == "."


