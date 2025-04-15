##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# paste0("[Working Files List] ",basename(getwd()),".r") %>% {paste0(env1$path$path1,"/",.)} |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# "https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R" %>% paste0("if (Sys.info()['sysname'] == 'Windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }") %>% {eval(parse(text=.))}  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# "https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd" %>% paste0("if (Sys.info()['sysname'] == 'Windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }") %>% {eval(parse(text=.))}  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
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
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ SOURCE) -----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$path4write = .path4write = env1$path$LastSourceEditorContext.path
#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ RStudio Setup -----  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### \% file.edit(file.path(.path4APPDATA_RStudio, FileName)) ----  
# if (Sys.info()["sysname"] == "Windows") {.path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio")} else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### \$ rstudio-prefs.json ----  
# file.path(.path4APPDATA_RStudio, "rstudio-prefs.json") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
FileNameExt = "rstudio-prefs.json"; if (Sys.info()["sysname"] == "Windows") { file.path(Sys.getenv("APPDATA"), "RStudio", FileNameExt) |> env1$env.internal.attach$f_file.edit_vscode() } else { paste0("~/.config/rstudio/",FileNameExt) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext() }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### @ sumatraPDF settings ----  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### \% f_file_PDF.sumatra ====  
# https://github.com/rstudio/rstudio/issues/14370
# https://stackoverflow.com/questions/77447391/how-to-set-sumatra-as-default-pdf-viewer-in-rstudio
# https://github.com/brry/berryFunctions/blob/master/R/sumatraInitialize.R
# https://github.com/brry/berryFunctions/blob/master/R/openPDF.R
# https://github.com/brry/berryFunctions/blob/master/R/pdfpng.R
# https://github.com/brry/berryFunctions/blob/master/inst/extdata/sumatrapdfrestrict.ini
# https://github.com/brry/berryFunctions/blob/master/inst/extdata/SumatraPDF-settings.txt
paste0(env1$path$source_base,"/","f_file_PDF.sumatra.dev.r") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# paste0(env1$path$source_base,"/","f_file_PDF.sumatra.source.r") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
"D:/OneDrive/[][Rproject]/github_tidystat/env1$env.internal.source.r" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## @ RStudio Server Setup.r -----  
"RStudio Server Setup.r" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
### id_rsa, id_ed25519 -----  
"~/.ssh/id_rsa.pub" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
"~/.ssh/id_rsa" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
"~/.ssh/id_ed25519.pub" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
"~/.ssh/id_ed25519" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### @ Rocker set up.r -----  
"-private/docker run -d -p --restart=always --name -e -v -private.sh" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
"Rocker set up.r" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# "Rocker set up -private.r" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ git -----  
.RelativeSubPath="git"; .FileName.source.r = "ssh-add@Rocker.r"; file.path(env1$path$source_base, .RelativeSubPath, .FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
.RelativeSubPath="git"; .FileName.source.r = "git config --global core.autocrlf input.r"; file.path(env1$path$source_base, .RelativeSubPath, .FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### \$ .gitignore -----  
# ".gitignore" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# ".gitignore" |> env1$env.internal.attach$f_file.edit_vscode()
.file2edit = ".gitignore" ; if (Sys.info()["sysname"] == "Windows") { .file2edit |> env1$env.internal.attach$f_file.edit_vscode() } else { if(file.exists(.file2edit)) {.file2edit |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()} }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#### \% f_path_path.BACKUP.overwrite -----  
.overwrite_from_path = "D:/OneDrive/[][Rproject]/github_tidystat"
.overwrite_from_path_FileNameExt = paste0(.overwrite_from_path, "/.gitignore")
if (getwd() |> normalizePath(winslash="/",mustWork=NA) == .overwrite_from_path) {
    for (.destination_path in unique(c(
        env1$path$path0
        , "~" |> normalizePath(winslash="/",mustWork=NA)
        , Sys.getenv("USERPROFILE") |> normalizePath(winslash="/",mustWork=NA)
        , paste0(Sys.getenv("USERPROFILE"),"/Documents") |> normalizePath(winslash="/",mustWork=NA)
        , paste0(Sys.getenv("OneDriveConsumer"),"/Documents") |> normalizePath(winslash="/",mustWork=NA)
        , "../Rproject_MH"
        , "../Rproject_Rmd"
        , "../Rproject_KoGES_AA10030"
    ))) {
        .destination_path_FileNameExt = paste0(.destination_path,"/.gitignore") 
        env1$env.internal.attach$f_path_path.BACKUP.overwrite(.overwrite_from_path_FileNameExt=.overwrite_from_path_FileNameExt, .destination_path_FileNameExt=.destination_path_FileNameExt, .BACKUP_to_path = paste0(env1$path$path0,"/-BACKUP"), timeFormat = "%y%m%d")
    }
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### @ install-git-hooks.sh ----  
# To ignore csv files > 10 MB
# "chmod +x git/hooks/install-git-hooks.sh" |> system(intern = TRUE)
# "./git/hooks/install-git-hooks.sh" |> system(intern = TRUE)
"cp git/hooks/pre-commit .git/hooks/pre-commit" |> system(intern = TRUE)
"chmod +x .git/hooks/pre-commit" |> system(intern = TRUE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
.RelativeSubPath="git"; .FileName.source.r = "git automatic commit.r"; file.path(env1$path$source_base, .RelativeSubPath, .FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
.RelativeSubPath="git"; .FileName.source.r = "git stash.r"; file.path(env1$path$source_base, .RelativeSubPath, .FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
.RelativeSubPath="git"; .FileName.source.r = "git merge conflicts.r"; file.path(env1$path$source_base, .RelativeSubPath, .FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
.RelativeSubPath="git"; .FileName.source.r = "f_git.03_final.pull_rebase_push" |> paste0(c(".source.r",".dev.r")); file.path(env1$path$source_base, .RelativeSubPath, .FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### @ git filter-repo --path-glob .pdf --invert-paths.sh ----  
.RelativeSubPath="git"; .FileName.source.r = "git filter-repo --path-glob .pdf --invert-paths.r"; file.path(env1$path$source_base, .RelativeSubPath, .FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
.RelativeSubPath="git"; .FileName.source.r = "git filter-repo --path-glob .pdf --invert-paths.sh"; file.path(env1$path$source_base, .RelativeSubPath, .FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  
# __________|------  
# ⸿ START) Default Templates -----  

### @ sourceTemplate.path_FileNameExt -----  
# env1$path$sourceTemplate.path_FileNameExt = paste0(env1$path$source_base,"/","rstudio-prefs/templates/default.R"); env1$path$sourceTemplate.path_FileNameExt |> source(local=FALSE, echo=TRUE, print.eval=TRUE, spaced=FALSE, verbose=FALSE, max.deparse.length=150, width.cutoff=500L, chdir=TRUE, prompt.echo="> ", continue.echo="+ ", skip.echo=Inf)
# # if (Sys.info()["sysname"] == "Windows") {paste0("notepad.exe"," ",shQuote(env1$path$sourceTemplate.path_FileNameExt)) |> shell(wait=FALSE)}
# if (Sys.info()["sysname"] == "Windows") {.path4editor = c( file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe"), "C:/Program Files/Microsoft VS Code/Code.exe" ) |> keep(file.exists) |> first(default = "notepad.exe") |> normalizePath(winslash="/",mustWork=NA); paste0('cmd /c ""',.path4editor, '" "',env1$path$sourceTemplate.path_FileNameExt, '""') |> shell(wait=FALSE)}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  

#### @ default.R -----  
# .file2edit = paste0(env1$path$source_base,"/","rstudio-prefs/templates/default.R"); if (Sys.info()["sysname"] == "Windows") {.file2edit |> shQuote(type="cmd") |> shell.exec()} else {.file2edit |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()}
.file2edit = paste0(env1$path$source_base,"/","rstudio-prefs/templates/default.R"); if (Sys.info()["sysname"] == "Windows") {.file2edit |> env1$env.internal.attach$f_file.edit_vscode()} else {.file2edit |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()}
.RelativeSubPath=r"(rstudio-prefs/templates)"; .FileName.source.r = "default.R"; file.path(env1$path$source_base, .RelativeSubPath, .FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  

#### @ templates-00env1.minimum.Rmd -----  
# .file2edit = paste0(env1$path$source_base,"/","rstudio-prefs/templates/templates-00env1.minimum.Rmd"); if (Sys.info()["sysname"] == "Windows") {.file2edit |> env1$env.internal.attach$f_file.edit_vscode()} else {.file2edit |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()}
# .RelativeSubPath=r"(rstudio-prefs/templates)"; .FileName.source.r = "templates-00env1.minimum.Rmd"; file.path(env1$path$source_base, .RelativeSubPath, .FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
.file2edit = "D:/OneDrive/[][Rproject]/Rproject_Rmd/templates-00env1.minimum.Rmd"; if (Sys.info()["sysname"] == "Windows") {.file2edit |> env1$env.internal.attach$f_file.edit_vscode()} else {.file2edit |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()}
# "templates-00env1.minimum.Rmd" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
.RelativeSubPath=r"(rstudio-prefs/templates)"; .FileName.source.r = "templates-00env1.minimum.Rmd"; file.path(env1$path$source_base, .RelativeSubPath, .FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

## @ env1$env.internal -----  
.FileName.source.r = "env1$env.internal" |> paste0(c(".source.r",".dev.r")); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}; file.path(env1$path$source_base, .RelativeSubPath_FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# .FileName.source.r = "function.detachAllPackages" |> paste0(c(".source.r",".dev.r")); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}; file.path(env1$path$source_base, .RelativeSubPath_FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
.FileName.source.r = "function.detachAllPackages.dev.r"; .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}; file.path(env1$path$source_base, .RelativeSubPath_FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
.FileName.source.r = "Encoding.txt"; .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}; file.path(env1$path$source_base, .RelativeSubPath_FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
.FileName.source.r = "options.r"; .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}; file.path(env1$path$source_base, .RelativeSubPath_FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
.FileName.source.r = "function.update.Rprofile.dev.r"; .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}; file.path(env1$path$source_base, .RelativeSubPath_FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
.FileName.source.r = "function.Sys.setenv.dev.r"; .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}; file.path(env1$path$source_base, .RelativeSubPath_FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
.FileName.source.r = "f_clipboard_path_BackSlash.to_URL.dev.r"; .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}; file.path(env1$path$source_base, .RelativeSubPath_FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

### \% f_path -----  
#### \% internal.f_path0.list_path_hierarchy -----  
.FileName.source.r = "internal.f_path0.list_path_hierarchy" |> paste0(c(".source.r",".dev.r")); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}; file.path(env1$path$source_base, .RelativeSubPath_FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
#### \% f_path.list_subpath -----  
.FileName.source.r = "f_path.list_subpath" |> paste0(c("-source.R","-dev.R")); .RelativeSubPath=c("R", "Rdev")|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}; file.path(env1$path$source_base, .RelativeSubPath_FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
#### \% f_path.df_dirs_recursive.df_files -----  
.FileName.source.r = "f_path.df_dirs_recursive.df_files" |> paste0(c("-source.R","-dev.R")); .RelativeSubPath=c("R", "Rdev")|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}; file.path(env1$path$source_base, .RelativeSubPath_FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### \% f_file -----  
#### \% f_FileNameExt.find_subpath -----  
.FileName.source.r = "f_FileNameExt.find_subpath" |> paste0(c(".source.r",".dev.r")); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}; file.path(env1$path$source_base, .RelativeSubPath_FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
#### \% f_path.size_files -----  
.FileName.source.r = "f_path.size_files" |> paste0(c(".source.r",".dev.r")); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}; file.path(env1$path$source_base, .RelativeSubPath_FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

### \% f_df -----  
#### \% f_df.t.tribble_construct -----  
.FileName.source.r = "f_df.t.tribble_construct" |> paste0(c(".source.r",".dev.r")); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}; file.path(env1$path$source_base, .RelativeSubPath_FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
#### \% f_DSname.Search.read.checkEntity -----  
.FileName.source.r = "f_DSname.Search.read.checkEntity" |> paste0(c("-source.R","-dev.R")); .RelativeSubPath=c("R", "Rdev")|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)}; file.path(env1$path$source_base, .RelativeSubPath_FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

## @ .RelativeSubPath = r"(Rdev/00_base_program)" |> str_replace_all("\\\\","/") -----  
#### \% f_df.NotNA_p_df -----  
.RelativeSubPath = r"(00_base_program)"; .FileName.source.r = "f_df.NotNA_p_df" |> paste0(c(".source.r",".dev.r",".dev.Rmd")); file.path(env1$path$source_base, .RelativeSubPath, .FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

## @ .RelativeSubPath = r"(Rdev/10_import_clean_datatype/13_missing_value)" |> str_replace_all("\\\\","/") -----  
#### \% f_CodeText.ECHO -----  
.RelativeSubPath = r"(Rdev/10_import_clean_datatype/13_missing_value)"; .FileName.source.r = "f_CodeText.ECHO" |> paste0(c(".source.r",".dev.r",".dev.Rmd")); file.path(env1$path$source_base, .RelativeSubPath, .FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

## @ .RelativeSubPath = r"(Rdev/60_communicate_report_export)" |> str_replace_all("\\\\","/") -----  
#### \% f_df.Table1byExposure.xlsx -----  
.RelativeSubPath = r"(Rdev/60_communicate_report_export)"; .FileName.source.r = "f_df.Table1byExposure.xlsx" |> paste0(c(".source.r",".dev.r",".dev.Rmd")); file.path(env1$path$source_base, .RelativeSubPath, .FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
"Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.dev.Rmd" %>% file.edit
#### \% f_Table1_print_df.flextable  -----  
.RelativeSubPath = r"(Rdev/60_communicate_report_export)"; .FileName.source.r = "f_Table1_print_df.flextable" |> paste0(c(".source.r",".dev.r",".dev.Rmd")); file.path(env1$path$source_base, .RelativeSubPath, .FileName.source.r) |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
###### @ "" %>% {.[file.exists(.)]} |> file.edit()  #----  
"Rdev/10_import_clean_datatype/11_literature/f_query.entrez_search.summary.fetch.dev.r" |> file.edit()
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
###### @ "" %>% {.[file.exists(.)]} |> file.edit()  #----  

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
###### @ "" %>% {.[file.exists(.)]} |> file.edit()  #----  











##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#@ 2024-12-19 -----
# ~/github_tidystat/Rdev/60_communicate_report_export/f_list_df.write_xlsx_table.dev.Rmd
# ~/github_tidystat/Rdev/00_base_program/002_base_encoding_RegEx/f_path.df_FileNameExt_extended.dev.Rmd
# 
# ~/github_tidystat/Rdev/60_communicate_report_export/f_Table1_print_df.flextable.source.r
# ~/github_tidystat/Rdev/60_communicate_report_export/f_Table1_print_df.flextable.dev.Rmd
# ~/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.source.r
# ~/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.dev.r
# ~/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.dev.Rmd
# 
# ~/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source-dev.Rmd
# ~/github_tidystat/Rdev/60_communicate_report_export/f_df.glmnet.GT1.flextable.dev-GPT-pending.Rmd
# ~/github_tidystat/Rdev/60_communicate_report_export/f_df.glmnet.GT1.flextable.dev-Gemini-pending.Rmd
# ~/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source.r
# ~/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/trainset.cv.glmnet_alphas_cox.dev.Rmd
# ~/github_tidystat/DS.DNR.lbl.fct.select_.n_.recode.dev.Rmd
# ~/github_tidystat/Rdev/60_communicate_report_export/f_df.GT1.flextable.dev.Rmd
# ~/github_tidystat/git/f_gitattributes.update_non_lfs.dev.Rmd
# 
# 
# ~/github_tidystat/Rdev/00_base_program/001_base_file/f_path.DOCs_Rcode.file.info.xlsx.dev.Rmd
# ~/github_tidystat/Rdev/00_base_program/001_base_file/f_path.list.files_orphan_nb_html.remove.dev.Rmd
# 



# D:/D_Repositories/github_tidystat/Rdev/40_visualize_explore_bivariate_stratified/49_time/plotCumulativeVisitsOverTime.dev.Rmd
# D:/D_Repositories/github_tidystat/.gitignore & .git_hooks_pre-commit & .Rprofile -update.r
# D:/D_Repositories/github_tidystat/f_path.df_dirs_recursive.df_files.source.r
# D:/D_Repositories/github_tidystat/Rdev/10_import_clean_datatype/11_metadata/f_chrNameValuePairs2vector.dev.Rmd
# D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source.r
# D:/D_Repositories/github_tidystat/Rdev/60_communicate_report_export/f_list_df.write_xlsx_table.dev.Rmd
# D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.dev.Rmd
# D:/D_Repositories/github_tidystat/Rdev/00_base_program/002_base_encoding_RegEx/f_path.df_FileNameExt_extended.dev.Rmd


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#@ 2024-12-20 -----
# ~/github_tidystat/[Working Files List] github_tidystat.r
# ~/github_tidystat/[Pending Files List] github_tidystat.r
# ~/github_tidystat/.Rprofile
# ~/github_tidystat/env1$env.internal.source.r
# ~/github_tidystat/f_df.t.tribble_construct.source.r
# ~/github_tidystat/.gitattributes
# ~/github_tidystat/git/f_gitattributes.update_non_lfs.dev.Rmd
# ~/github_tidystat/Rdev/00_base_program/001_base_file/f_path.DOCs_Rcode.file.info.xlsx.dev.Rmd

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#@ 2024-12-23 -----
# ~/github_tidystat/git/f_gitattributes.update_non_lfs.dev.Rmd
# ~/github_tidystat/.gitattributes
# ~/github_tidystat/.lfs.gitattributes
# ~/github_tidystat/.non_lfs.gitattributes
# ~/github_tidystat/Rdev/00_base_program/001_base_file/f_path.DOCs_Rcode.file.info.xlsx.dev.Rmd
# ~/github_tidystat/Rdev/00_base_program/009_base_computation/f_vec_chr.add_line_numbers.dev.r



##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ START) basename(getwd()) ----  
list.files(pattern = ".Rmd$") |> shQuote(type="cmd") |> paste0(collapse=",\n  ") %>% {cat("c(",.,")", "  \n", sep="")}
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# .FileName.source.r = paste0("00env1","-", basename(getwd()),".Rmd"); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.FileName.source.r); .RelativeSubPath_FileName.source.r |> shQuote(type="cmd") |> paste0(" %>% {.[file.exists(.)]} |> file.edit()") |> cat("  \n", sep=""); .RelativeSubPath_FileName.source.r |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# .FileName.source.r = paste0("01df_dirs_recursive.df_files","-", basename(getwd()),".Rmd"); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.FileName.source.r); .RelativeSubPath_FileName.source.r |> shQuote(type="cmd") |> paste0(" %>% {.[file.exists(.)]} |> file.edit()") |> cat("  \n", sep=""); .RelativeSubPath_FileName.source.r |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# .FileName.source.r = paste0("05CodeBook","-", basename(getwd()),".Rmd"); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); .RelativeSubPath_FileName.source.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.FileName.source.r); .RelativeSubPath_FileName.source.r |> shQuote(type="cmd") |> paste0(" %>% {.[file.exists(.)]} |> file.edit()") |> cat("  \n", sep=""); .RelativeSubPath_FileName.source.r |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##////////////////////////////////////////////////////////////////////////////////  
##::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##********************************************************************************  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  
# ⸿ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
