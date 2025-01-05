# .FileName.source.r = "f_git.03_final.pull_rebase_push" |> paste0(".source.r")
# f_git.03_final.pull_rebase_push.dev.r
# f_git.03_final.pull_rebase_push.source.r
# utils::browseURL("/git/f_git.03_final.pull_rebase_push.dev.r")
# source(paste0(env1$path$source_base, "/", "git/f_git.03_final.pull_rebase_push.source.r"))
# # source("D:/OneDrive/[][Rproject]/github_tidystat/git/f_git.03_final.pull_rebase_push.source.r")
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/git/f_git.03_final.pull_rebase_push.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/git/f_git.03_final.pull_rebase_push.dev.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/git/f_git.03_final.pull_rebase_push.dev.Rmd")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/git/f_git.03_final.pull_rebase_push.source.r")
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
# paste0(env1$path$path1,"/[Working Files List] ",basename(getwd()),".r") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()  
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
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .RelativeSubPath, .FileName.source.r ======  
# .RelativeSubPath = r"(git)" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# # if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
# .FileName.source.r = "f_git.03_final.pull_rebase_push" |> paste0(".source.r")
# ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# env1$path$.RelativeSubPath = .RelativeSubPath
# .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
# env1$path$.SourceName_root = .SourceName_root  
# env1$path$.RelativeSubPath_FileName.dev.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.r")
# env1$path$.RelativeSubPath_FileName.dev.Rmd = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.Rmd")
# env1$path$.RelativeSubPath_FileName.source.r = file.path(.RelativeSubPath, .FileName.source.r)
# cat("# ",'.SourceName_root = "',.SourceName_root,'"', "\n",
#     "# ",.SourceName_root,".dev.r", "\n",
#     "# ",.SourceName_root,".source.r", "\n",
#     '# utils::browseURL("',env1$path$source_base_local,"/",env1$path$subpath,'")', "\n",
#     '# utils::browseURL("',env1$path$source_base_github_blob,"/",env1$path$subpath_FileName.dev.r,'")', "\n",
#     '# source(paste0(env1$path$source_base, "/", "',env1$path$subpath_FileName.source.r,'"))', "\n",
#     '# # source("',env1$path$source_base_local,"/",env1$path$subpath_FileName.source.r,'")', "\n",
#     '# # source("',env1$path$source_base_github,"/",env1$path$subpath_FileName.source.r,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath_FileName.dev.r,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath_FileName.dev.Rmd,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath_FileName.source.r,'")', "\n",
#     sep="")
# ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# if(.FileName.source.r == "default.template") { warning('.FileName.source.r == "default.template"') } else {
#     # # if(!file.exists(env1$path$subpath_FileName.dev.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath_FileName.dev.r); env1$path$subpath_FileName.dev.r |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
#     # if(!file.exists(env1$path$subpath_FileName.dev.Rmd)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","templates-00env1.minimum.Rmd"),to=env1$path$subpath_FileName.dev.Rmd); env1$path$subpath_FileName.dev.Rmd |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
#     # if(!file.exists(env1$path$subpath_FileName.source.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath_FileName.source.r); env1$path$subpath_FileName.source.r |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
#     file2create = env1$path$subpath_FileName.dev.Rmd; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_FileNameExt))
#     file2create = env1$path$subpath_FileName.source.r; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_FileNameExt))
# }
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
f_git.01_start.pull = function(intern = TRUE) {
    # 1. Start of Day - Sync with Remote Repository: git pull at the beginning of everyday work
    out.list = list()
    # system("git status") 
    Text4SystemCommand = "git status"; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))
    # system("git pull") # Simple merge. Integrates changes from the upstream branch of the currently checked out branch, assuming it's properly set up with an upstream link.
    Text4SystemCommand = "git pull"; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))  # Simple merge. Integrates changes from the upstream branch of the currently checked out branch, assuming it's properly set up with an upstream link.
    # # system("git pull origin") # Simple merge. Fetches from the origin remote and merges changes based on the currently checked out branch’s tracking configuration, still somewhat dependent on proper setup.
    # # system("git pull origin master") # Simple merge. Explicitly pulls and merges changes from the master branch of the origin remote into your current branch, used for direct control over the sources of changes you are integrating.
    # # system("git status") 
    out.list
}

f_git.02_interim.fetch_add_commit = function(intern = TRUE) {
    # 2. Before Making Commits - Stay Updated About Remote Changes: git fetch before any of my git commit
    out.list = list()
    # system("git status") 
    Text4SystemCommand = "git status"; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))
    # system("git fetch")  # Before Making Commits - Stay Updated About Remote Changes. Fetches updates for all branches from the default remote, updating remote-tracking branches.
    Text4SystemCommand = "git fetch"; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))  # Before Making Commits - Stay Updated About Remote Changes. Fetches updates for all branches from the default remote, updating remote-tracking branches. 
    # # system('git fetch origin') # Specifically fetches all data from the origin remote, updating the associated remote-tracking branches.
    # # system('git fetch origin master') # Specifically fetches updates from the master branch of the origin remote, updating only the origin/master remote-tracking branch.
    # system("git add .")
    Text4SystemCommand = "git add ."; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))
    # system('git commit -m "automatic commit using system()"')
    Text4SystemCommand = 'git commit -m "automatic commit using system()"'; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))
    # # system("git status") 
    out.list
}


f_git.03_final.pull_rebase_push = function(intern = TRUE) {
    # 3. Before Pushing Changes - Final Sync and Merge/Rebase: git pull before any of my push
    out.list = list()
    # system("git status") 
    Text4SystemCommand = "git status"; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))
    # # system("git pull --ff-only origin master") # If your branch can be fast-forwarded
    # # system("git pull --rebase origin master") # If you want to maintain a linear project history by replaying your changes on top of the fetched changes
    # system("git pull --rebase") # If you want to maintain a linear project history by replaying your changes on top of the fetched changes
    Text4SystemCommand = "git pull --rebase"; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))
    # # system("git config --global push.default simple") # simple (default in Git 2.0 and later): Pushes the current branch to its upstream branch, but only if the branch names match, and it refuses to push if the upstream branch does not already exist.
    # # system("git config --global push.default matching") # matching (default prior to Git 2.0): Pushes branches to the remote branches with the same name. 
    # # system("git config --global push.default current") # Pushes the current branch to the remote branch of the same name.
    # # system("git config --global push.default upstream") # Pushes the current branch to its upstream branch.
    # # system("git config --global push.default nothing") # Disables automatic pushing. This requires a branch to be explicitly specified.
    # system("git push") # Pushes branches based on the configuration of push.default. It is context-sensitive and relies on previous setup or defaults.
    Text4SystemCommand = "git push"; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))
    # # system("git push origin") # Pushes to the origin remote, relying on push.default for branch specifics.
    # # system("git push origin master") # Explicitly pushes the local master branch to the master branch at the origin remote, useful for precise control over what is being pushed and where.
    # system("git status") 
    # Text4SystemCommand = "git status"; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))
    out.list
}

# if (file.exists(".git")) f_git.01_start.pull(intern = TRUE)
# if (file.exists(".git")) f_git.02_interim.fetch_add_commit(intern = TRUE)
# if (file.exists(".git")) f_git.03_final.pull_rebase_push(intern = TRUE)




##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
