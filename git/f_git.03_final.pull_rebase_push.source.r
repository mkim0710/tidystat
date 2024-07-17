# sourcename = "f_git.03_final.pull_rebase_push" |> paste0(".source.r")
# f_git.03_final.pull_rebase_push.dev.r
# f_git.03_final.pull_rebase_push.source.r
# utils::browseURL("/git/f_git.03_final.pull_rebase_push.dev.r")
# source(paste0(env1$path$source_base, "/", "git/f_git.03_final.pull_rebase_push.source.r"))
# # source("D:/OneDrive/[][Rproject]/github_tidystat/git/f_git.03_final.pull_rebase_push.source.r")
# # source("https://github.com/mkim0710/tidystat/raw/master/git/f_git.03_final.pull_rebase_push.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/git/f_git.03_final.pull_rebase_push.dev.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/git/f_git.03_final.pull_rebase_push.dev.Rmd")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/git/f_git.03_final.pull_rebase_push.source.r")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# "." |> normalizePath(winslash="/") |> browseURL()
# paste0("[Working Files List] ",basename(getwd()),".r") |> file.edit()
# "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> shQuote(type="cmd") |> shell.exec()
# "D:/OneDrive/[][Rproject]/Rproject_Rmd/templates-00env1.minimum.Rmd" |> shQuote(type="cmd") |> (\(.) shell( paste0('cmd /c ""', file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe")|>normalizePath(winslash="/"), '" "', ., '""') ) )()
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
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); source( file.path(env1$path$source_base,subpath.filename.source.r) )
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
if(.Platform$OS.type == "windows") Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
if(!exists("env1", envir=.GlobalEnv))
    assign("env1", new.env(), envir=.GlobalEnv)
## env1\$path ====
if(!"path" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$path <- list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env1$path[[objectname]] = object;
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env1$path[[objectname]] = object;
env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)
objectname = "getwd"; object = getwd(); env1$path[[objectname]] = object;
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); env1$path[[objectname]] = object;
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# # @ subpath, sourcename ======
# subpath = r"(git)" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# # if(subpath!="") utils::browseURL(normalizePath(subpath))
# sourcename = "f_git.03_final.pull_rebase_push" |> paste0(".source.r")
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# env1$path$subpath = subpath
# sourcename_root = sourcename |> str_replace("\\.source\\.r$", "")
# env1$path$sourcename_root = sourcename_root  
# env1$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.r")
# env1$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.Rmd")
# env1$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename)
# cat("# ",'sourcename_root = "',sourcename_root,'"', "\n",
#     "# ",sourcename_root,".dev.r", "\n",
#     "# ",sourcename_root,".source.r", "\n",
#     '# utils::browseURL("',env1$path$source_base_local,"/",env1$path$subpath,'")', "\n",
#     '# utils::browseURL("',env1$path$source_base_github_blob,"/",env1$path$subpath.filename.dev.r,'")', "\n",
#     '# source(paste0(env1$path$source_base, "/", "',env1$path$subpath.filename.source.r,'"))', "\n",
#     '# # source("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     '# # source("',env1$path$source_base_github,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     sep="")
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "") 
# if(sourcename == "default.template") { warning('sourcename == "default.template"') } else {
#     # # if(!file.exists(env1$path$subpath.filename.dev.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.dev.r); env1$path$subpath.filename.dev.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext);
#     # if(!file.exists(env1$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","templates-00env1.minimum.Rmd"),to=env1$path$subpath.filename.dev.Rmd); env1$path$subpath.filename.dev.Rmd %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext);
#     # if(!file.exists(env1$path$subpath.filename.source.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.source.r); env1$path$subpath.filename.source.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext);
#     file2create = env1$path$subpath.filename.dev.Rmd; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env1$path$CurrentSource.path.filename.ext);
#     file2create = env1$path$subpath.filename.source.r; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env1$path$CurrentSource.path.filename.ext);
# }
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
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




#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
