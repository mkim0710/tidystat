
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
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
# .sourcename = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
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
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
if (requireNamespace("rstudioapi")) {
    if(Sys.getenv("print.intermediate")==TRUE) {.CodeText2Print = 'requireNamespace("rstudioapi")'; print(ifelse(is.null(eval(parse(text=.CodeText2Print))), paste0("is.null(",.CodeText2Print,") == TRUE"), paste0(.CodeText2Print," == ",eval(parse(text=.CodeText2Print)))))}  
    if (rstudioapi::isAvailable()) {
        env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
    } else { if(Sys.getenv("print.intermediate")==TRUE) print('rstudioapi::isAvailable() == FALSE') }
    if(Sys.getenv("print.intermediate")==TRUE) {.CodeText2Print = 'env1$path$CurrentSource.path.filename.ext'; print(ifelse(is.null(eval(parse(text=.CodeText2Print))), paste0("is.null(",.CodeText2Print,") == TRUE"), paste0(.CodeText2Print," == ",eval(parse(text=.CodeText2Print)))))}  
} else { if(Sys.getenv("print.intermediate")==TRUE) print('requireNamespace("rstudioapi") == FALSE') }
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
#|________________________________________________________________________________|#  
cat("> .tmp |> str(max.level = 1)", "  \n", sep="") 
.tmp |> str(max.level = 1)
cat("> env1 |> as.list() |> str(max.level = 2, give.attr = FALSE)", "  \n", sep="") 
env1 |> as.list() |> str(max.level = 2, give.attr = FALSE)
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) source -----  
### @ .subpath, .sourcename ======  
# .subpath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") {.subpath = env1$path$CurrentSource.path.filename.ext |> dirname(); ".subpath" %>% {cat(.,' = "',get(.),'"', sep="")} }
# if(.subpath!="") utils::browseURL(normalizePath(.subpath))
# .sourcename = "default.template" |> paste0(".source.r")
if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") {.sourcename = env1$path$CurrentSource.path.filename.ext |> basename() |> str_replace("\\.(dev|source)\\.(r|Rmd)$"|>regex(ignore_case=TRUE), "") |> str_replace("\\.(r|Rmd)$"|>regex(ignore_case=TRUE),""); ".sourcename" %>% {cat(.,' = "',get(.),'"', sep="")} }
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
env1$path$.subpath = .subpath
.sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
env1$path$.sourcename_root = .sourcename_root
env1$path$.subpath.filename.dev.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.r")
env1$path$.subpath.filename.dev.Rmd = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.Rmd")
env1$path$.subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
cat("# ",'.sourcename_root = "',.sourcename_root,'"', "  \n",
    "# ",env1$path$.subpath.filename.dev.r, "  \n",
    "# ",env1$path$.subpath.filename.dev.Rmd, "  \n",
    "# ",env1$path$.subpath.filename.source.r, "  \n",
    '# # source("',env1$path$source_base,"/",env1$path$.subpath.filename.source.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    sep="")
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# # \% source( file.path(env1$path$source_base,.subpath.filename.source.r) ) ----  
# .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ RUN ALL ABOVE: CTRL+ALT+B -----  
#| RUN ALL ABOVE: CTRL+ALT+B |#
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# #@@ START) data -----  
# # \$ assign( DataSetName, read_rds(paste0(.path4read,"/",DataSetName,".rds")) ) ====  
# # .path4read = file.path(env1$path$path0,"Rproject_KNHIS.CohortGJ0910 NoHx")
# # DataSetName = "CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds"
# .subpath = r"(data)"|>str_replace_all("\\\\","/")
# DataSetName = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
# # .subpath.filename.ext = DataSetName |> paste0(".rds") %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# # .path.filename.ext = ifelse( file.exists(.subpath.filename.ext), .subpath.filename.ext, paste0(env1$path$source_base_github,"/data/",DataSetName,".rds") )
# # cat(".path.filename.ext = ", .path.filename.ext, "  \n", sep = "")
# # assign( DataSetName, read_rds(.path.filename.ext) )
# DataSetName |> paste0(".rds") %>% paste0(.subpath,ifelse(.subpath=="","","/"),.) |> read_rds() %>% assign(DataSetName, value = ., envir = .GlobalEnv)

















#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:\n", 
    '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## \%\% update template (default.R) -----  
env1$path$RTemplate.filename.ext = "default.R"
env1$path$MyTemplate.filename.ext = "default.R"
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
if (.Platform$OS.type == "windows") {
    if(env1$path$MyTemplate.filename.ext == basename(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)})) {
        if (.Platform$OS.type == "windows") {.path4APPDATA_RStudio = normalizePath(file.path(Sys.getenv("APPDATA"), "RStudio"),winslash="/") |> str_replace_all("\\\\","/")} else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = normalizePath("~/.config/rstudio")} 
        .destination_path = file.path(.path4APPDATA_RStudio, "templates"); if(!dir.exists(.destination_path)) dir.create(.destination_path, recursive=TRUE) ; cat('browseURL("',.destination_path,'")',"  \n", sep="") 
        .destination_path.filename.ext = file.path(.destination_path, env1$path$RTemplate.filename.ext)
        .backup_to_path = file.path(env1$path$path0, "-backup") ; env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = .destination_path.filename.ext, .backup_to_path=.backup_to_path) 
        if(.Platform$OS.type == "windows") {browseURL(.backup_to_path)}
        
        if(file.copy(from=env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)}, to=.destination_path.filename.ext, overwrite=TRUE)) message(paste0("Update successful: ", .destination_path.filename.ext)) else warning(paste0("Update failed: ", .destination_path.filename.ext))
        # if (.Platform$OS.type == "windows") {shell( paste0("notepad.exe"," ",shQuote(.destination_path.filename.ext)), wait=FALSE )} # else if (.Platform$OS.type == "unix") {system(paste0("open -a TextEdit ",.destination_path.filename.ext),wait=FALSE)}  
        
        for ( .destination_path.filename.ext in c(
            file.path(env1$path$source_base_local, "rstudio-prefs", "templates", env1$path$MyTemplate.filename.ext)
            , file.path(env1$path$path0, "Rproject_Rmd", env1$path$MyTemplate.filename.ext)
        )) {if(dir.exists(dirname(.destination_path.filename.ext)) && env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)}|>normalizePath(winslash="/") != .destination_path.filename.ext) {
            if(file.copy(from=env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)}, to=.destination_path.filename.ext, overwrite=TRUE)) message(paste0("Update successful: ", .destination_path.filename.ext)) else warning(paste0("Update failed: ", .destination_path.filename.ext))
            # if (.Platform$OS.type == "windows") {shell( paste0("notepad.exe"," ",shQuote(.destination_path.filename.ext)), wait=FALSE )} # else if (.Platform$OS.type == "unix") {system(paste0("open -a TextEdit ",.destination_path.filename.ext),wait=FALSE)}  
        }}
        if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
    }
}

