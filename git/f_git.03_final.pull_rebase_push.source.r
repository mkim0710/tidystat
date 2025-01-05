# .filename.source.r = "f_git.03_final.pull_rebase_push" |> paste0(".source.r")
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
# file.edit( paste0("[Working Files List] ",basename(getwd()),".r") )  
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
### env1\$path\$LastSourceEditorContext.path_filename_ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$LastSourceEditorContext.path_filename_ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA) |> str_replace(fixed(getwd()|>normalizePath(winslash="/",mustWork=NA)), "") |> str_replace("^/", "")
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_filename_ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .subpath, .filename.source.r ======  
# .subpath = r"(git)" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# # if(.relative.subpath!="") .relative.subpath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
# .filename.source.r = "f_git.03_final.pull_rebase_push" |> paste0(".source.r")
# ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# env1$path$.relative.subpath = .relative.subpath
# .sourcename_root = .filename.source.r |> str_replace("\\.source\\.r$", "")
# env1$path$.sourcename_root = .sourcename_root  
# env1$path$.relative.subpath_filename.dev.r = paste0(.relative.subpath,ifelse(.relative.subpath=="","","/"),.sourcename_root,".dev.r")
# env1$path$.relative.subpath_filename.dev.Rmd = paste0(.relative.subpath,ifelse(.relative.subpath=="","","/"),.sourcename_root,".dev.Rmd")
# env1$path$.relative.subpath_filename.source.r = paste0(.relative.subpath,ifelse(.relative.subpath=="","","/"),.filename.source.r)
# cat("# ",'sourcename_root = "',sourcename_root,'"', "\n",
#     "# ",sourcename_root,".dev.r", "\n",
#     "# ",sourcename_root,".source.r", "\n",
#     '# utils::browseURL("',env1$path$source_base_local,"/",env1$path$subpath,'")', "\n",
#     '# utils::browseURL("',env1$path$source_base_github_blob,"/",env1$path$subpath_filename.dev.r,'")', "\n",
#     '# source(paste0(env1$path$source_base, "/", "',env1$path$subpath_filename.source.r,'"))', "\n",
#     '# # source("',env1$path$source_base_local,"/",env1$path$subpath_filename.source.r,'")', "\n",
#     '# # source("',env1$path$source_base_github,"/",env1$path$subpath_filename.source.r,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath_filename.dev.r,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath_filename.dev.Rmd,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath_filename.source.r,'")', "\n",
#     sep="")
# ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_filename_ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$LastSourceEditorContext.path_filename_ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA) |> str_replace(fixed(getwd()|>normalizePath(winslash="/",mustWork=NA)), "") |> str_replace("^/", "")
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_filename_ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# if(.filename.source.r == "default.template") { warning('.filename.source.r == "default.template"') } else {
#     # # if(!file.exists(env1$path$subpath_filename.dev.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath_filename.dev.r); env1$path$subpath_filename.dev.r %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
#     # if(!file.exists(env1$path$subpath_filename.dev.Rmd)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","templates-00env1.minimum.Rmd"),to=env1$path$subpath_filename.dev.Rmd); env1$path$subpath_filename.dev.Rmd %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
#     # if(!file.exists(env1$path$subpath_filename.source.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath_filename.source.r); env1$path$subpath_filename.source.r %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
#     file2create = env1$path$subpath_filename.dev.Rmd; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
#     file2create = env1$path$subpath_filename.source.r; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext))
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
