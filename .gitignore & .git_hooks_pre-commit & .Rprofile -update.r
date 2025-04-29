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
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ SOURCE) -----  
## § .RelativeSubPath, .FileName.source.r ======  



##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
#### \$ .gitignore -----  
# # ".gitignore" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# # ".gitignore" |> env1$env.internal.attach$f_file.edit_vscode()
# .file2edit = ".gitignore" ; if (Sys.info()["sysname"] == "Windows") { .file2edit |> env1$env.internal.attach$f_file.edit_vscode() } else { if(file.exists(.file2edit)) {.file2edit |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()} }
# .file2edit = ".git/hooks/pre-commit" ; if (Sys.info()["sysname"] == "Windows") { .file2edit |> env1$env.internal.attach$f_file.edit_vscode() } else { if(file.exists(.file2edit)) {.file2edit |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()} }
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
#### \% f_path_file.BACKUP_copy_overwrite -----  
f_path_file.BACKUP_copy_overwrite = function(.overwrite_from_path, .overwrite_from_FileNameExt, .vec_destination_paths, VERBOSE = FALSE, restrict_execution_path = "D:/OneDrive/[][Rproject]/github_tidystat", createFile = FALSE) {
    .vec_destination_paths = .vec_destination_paths |> unique()
    .overwrite_from_path_FileNameExt = paste0(.overwrite_from_path, "/", .overwrite_from_FileNameExt)
    # if (basename(getwd()) == "github_tidystat") {
    if (getwd() |> normalizePath(winslash="/",mustWork=NA) %in% restrict_execution_path) {
        env1$env.internal.attach$f_FileNameExt.createBACKUP(BACKUP_from_path_FileNameExt = paste0(.vec_destination_paths, "/", .overwrite_from_FileNameExt) |> keep(file.exists) |> first(default = ""), .BACKUP_to_path = paste0(env1$path$path0,"/-BACKUP"), timeFormat = "%y%m%d") 
        for (.destination_path in unique(.vec_destination_paths)) {
            if(VERBOSE) cat(".destination_path: ", .destination_path, "\n", sep="")
            .destination_path_FileNameExt = paste0(.destination_path, "/", .overwrite_from_FileNameExt) 
            env1$env.internal.attach$f_path_path.BACKUP.overwrite(.overwrite_from_path_FileNameExt=.overwrite_from_path_FileNameExt, .destination_path_FileNameExt=.destination_path_FileNameExt, .BACKUP_to_path=NULL, timeFormat = "%y%m%d", createFile = createFile)
        }
    } else {
        stop("The run from github_tidystat as the working directory")
    }
}
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
#### \$ vec_Rproject_names.gitignore_update -----  
vec_Rproject_names.gitignore_update = c("Rproject_MH", "Rproject_Rmd", "Rproject_KoGES_AA10030")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##### .overwrite_from_FileNameExt = ".gitignore" ----  
.overwrite_from_path = "D:/OneDrive/[][Rproject]/github_tidystat"
.overwrite_from_FileNameExt = ".gitignore"
.vec_destination_paths = c(
    env1$path$path0
    , "~" 
    , Sys.getenv("USERPROFILE") |> normalizePath(winslash="/",mustWork=NA)
    , paste0(Sys.getenv("USERPROFILE"),"/Documents") |> normalizePath(winslash="/",mustWork=NA)
    , paste0(Sys.getenv("OneDriveConsumer"),"/Documents") |> normalizePath(winslash="/",mustWork=NA)
    , "D:/OneDrive/MHShell"
    , paste0("D:/OneDrive/[][Rproject]/",vec_Rproject_names.gitignore_update)
)
f_path_file.BACKUP_copy_overwrite(.overwrite_from_path, .overwrite_from_FileNameExt, .vec_destination_paths, VERBOSE = TRUE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##### .overwrite_from_FileNameExt = ".gitattributes" ----  
.overwrite_from_path = "D:/OneDrive/[][Rproject]/github_tidystat"
.overwrite_from_FileNameExt = ".gitattributes"
.vec_destination_paths = c(
    env1$path$path0
    , "~" 
    , Sys.getenv("USERPROFILE") |> normalizePath(winslash="/",mustWork=NA)
    , paste0(Sys.getenv("USERPROFILE"),"/Documents") |> normalizePath(winslash="/",mustWork=NA)
    , paste0(Sys.getenv("OneDriveConsumer"),"/Documents") |> normalizePath(winslash="/",mustWork=NA)
    , "D:/OneDrive/MHShell"
    , paste0("D:/OneDrive/[][Rproject]/",vec_Rproject_names.gitignore_update)
)
f_path_file.BACKUP_copy_overwrite(.overwrite_from_path, .overwrite_from_FileNameExt, .vec_destination_paths, VERBOSE = TRUE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##### .overwrite_from_FileNameExt = ".Rprofile" ----  
.overwrite_from_path = "D:/OneDrive/[][Rproject]/github_tidystat"
.overwrite_from_FileNameExt = ".Rprofile"
.vec_destination_paths = c(
    env1$path$path0
    , "~" |> normalizePath(winslash="/",mustWork=NA)
    , paste0("D:/OneDrive/[][Rproject]/",vec_Rproject_names.gitignore_update)
)
f_path_file.BACKUP_copy_overwrite(.overwrite_from_path, .overwrite_from_FileNameExt, .vec_destination_paths, VERBOSE = TRUE, createFile = TRUE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##### .overwrite_from_FileNameExt = "git/hooks/pre-commit" ----  
.overwrite_from_path = "D:/OneDrive/[][Rproject]/github_tidystat/git/hooks"
.overwrite_from_FileNameExt = "pre-commit"
.vec_destination_paths = c(
    "D:/OneDrive/[][Rproject]/github_tidystat/.git/hooks"
    , "D:/OneDrive/MHShell/.git/hooks"
    , paste0("D:/OneDrive/[][Rproject]/",vec_Rproject_names.gitignore_update,"/git/hooks")
    , paste0("D:/OneDrive/[][Rproject]/",vec_Rproject_names.gitignore_update,"/.git/hooks")
)
f_path_file.BACKUP_copy_overwrite(.overwrite_from_path, .overwrite_from_FileNameExt, .vec_destination_paths, VERBOSE = TRUE)
if(.Platform$OS.type == "unix") {
    for (.destination_path in paste0("../",vec_Rproject_names.gitignore_update,"/.git/hooks")) {
        .destination_path_FileNameExt = paste0(.destination_path, "/", .overwrite_from_FileNameExt) 
        if (file.exists(.destination_path_FileNameExt)) { paste0("chmode +x ",.destination_path_FileNameExt) |> system(intern=TRUE) |> try() }
    }
}
# In Windows, you don't need to explicitly set executable permissions on the hook script because Git for Windows will execute the script as long as it has the correct shebang (#!/bin/sh) and is located in the correct directory (.git/hooks).
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.BACKUP_to_path = paste0(env1$path$path0,"/-BACKUP")
cat('%windir%\\explorer.exe "',.BACKUP_to_path|>normalizePath(winslash="\\"),'"',"  \n", sep="")
if(Sys.info()["sysname"] == "Windows") {browseURL(.BACKUP_to_path)}
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
env1$f$showCodeText2openSourceInGitHub()
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

