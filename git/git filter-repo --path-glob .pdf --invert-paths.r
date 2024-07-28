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
# paste0("[Working Files List] ",basename(getwd()),".r") |> file.edit()
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R"  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd"  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(.GlobalEnv$env1$source[[sourcename]])}
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# "https://github.com/mkim0710/tidystat/blob/master/.Rprofile" %>% paste0("if (.Platform$OS.type == 'windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }") %>% {eval(parse(text=.))}  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/.Rprofile"    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  cat('> source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile")  \n')  ;  source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  cat('> source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile")  \n')  ;  source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile")  ;  .First()  }  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## env1\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  \n", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
if (requireNamespace("rstudioapi")) {
    if(Sys.getenv("print.intermediate")==TRUE) {CodeText2Print = 'requireNamespace("rstudioapi")'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}  
    if (rstudioapi::isAvailable()) {
        env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
    } else { if(Sys.getenv("print.intermediate")==TRUE) print('rstudioapi::isAvailable() == FALSE') }
    if(Sys.getenv("print.intermediate")==TRUE) {CodeText2Print = 'env1$path$CurrentSource.path.filename.ext'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}  
} else { if(Sys.getenv("print.intermediate")==TRUE) print('requireNamespace("rstudioapi") == FALSE') }
file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)})
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) source -----
### \$ subpath, sourcename ======




#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# https://chatgpt.com/c/82e6c7a3-d288-42b3-92d4-3d22cf42fc93
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ #1. Remove the Local Repository ====
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #1-1a. (Preferred) Recursively Remove PDF Files from the Index Using git rm --cached (wihout deleting the files in the local file system) ----
'cd ../Rproject_Rmd' |> system(intern=TRUE) |> cat("  \n", sep="  \n")
git rm -r --cached "*.pdf"
git rm -r --cached "*.html"
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
##@ #1-1b. (Alternative) Recursively Remove PDF Files from the Index and the Local File System Using git rm. ----
'cd ../Rproject_Rmd' |> system(intern=TRUE) |> cat("  \n", sep="  \n")
git rm -r "*.pdf"
git rm -r "*.html"
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
##@ #1-1c. (Alternative) Completely Delete the Local Repository (and completely remove/rename the base folder) ----
'cd ../Rproject_Rmd' |> system(intern=TRUE) |> cat("  \n", sep="  \n")
if (.Platform$OS.type == "windows") {'rmdir /s /q .git' |> system(intern=TRUE)} else {'rm -rf .git' |> system(intern=TRUE)}  # You may just delete from the windows file explorer
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #1-2. Commit and Push the Changes: Ensures the changes are reflected in the repository. ====
git commit -m "Untrack PDF/HTML files from the index"
git push origin main
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ #2. Clone the Repository "--mirror" Cleanly ====
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #2-1a. (preferred) Clone a fresh repository "--mirror" into the new directory ----
# Caution) note the dot at the end~!! 
# Caution) Without the dot, a new folder will be created with the repository name under the current directory~!!
cd ..
mkdir Rproject_Rmd.mirror
cd Rproject_Rmd.mirror
# 'git clone --mirror <repository_url> .' |> system(intern=TRUE) |> cat("  \n", sep="  \n")
# "git clone --mirror https://github.com/mkim0710/tidystat.git ." |> system(intern=TRUE) |> cat("  \n", sep="  \n")
# "git clone --mirror git@github.com:mkim0710/tidystat.git ." |> system(intern=TRUE) |> cat("  \n", sep="  \n")
paste0("git clone git@github.com:mkim0710/",basename(getwd()),".git"," .") |> system(intern=TRUE) |> cat("  \n", sep="  \n")
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
##@ #2-1b. (alternative) Clone a fresh repository "--mirror" into a sub-directory ----
# git clone --mirror <repository_url> subdir-name
# cd subdir-name
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ #3. Use git filter-repo: Removes PDF files from the entire Git history. ====
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #3-0. pip install git-filter-repo ====
# "pip install git-filter-repo" |> system(intern=TRUE) |> cat("  \n", sep="  \n")
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #3-1. git filter-repo --path-glob "*.pdf" --invert-paths ====
# "git filter-repo --path-glob '*.pdf' --invert-paths" |> system(intern=TRUE) |> cat("  \n", sep="  \n")
# "git push origin --force --all" |> system(intern=TRUE) |> cat("  \n", sep="  \n")
# "git push origin --force --tags" |> system(intern=TRUE) |> cat("  \n", sep="  \n")
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #3-2. Force Push Changes: Updates the remote repository with the cleaned history. ====
# git remote set-url origin git@github.com:mkim0710/Rproject_KoGES_AA10030.git
git push origin --force --mirror
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ #4. Re-clone the Repository (including the PC where the filter-repo was run): Ensures that everyone works with the updated history. ====
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #4-0. delete/rename/archive the old repository directory ====
# rm -rf /path/to/your/repo
# or just delete in the file explorer
# or just rename, e.g., Rproject_Rmd_old
# or just archive, e.g., Rproject_Rmd_old.7z
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #4-1. git clone <repository_url> . ====
# cd ../Rproject_Rmd
# git clone <repository_url> /path/to/your/repo
# git clone https://github.com/mkim0710/tidystat.git .
# git clone https://github.com/mkim0710/Rproject_KoGES_AA10030.git .
# Here, you may use the github desktop to clone the repository.
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #4-2. Add PDF Files to .gitignore: Prevents future PDF files from being tracked. ====
# 'echo "*.pdf" >> .gitignore' |> system(intern=TRUE) |> cat("  \n", sep="  \n")
# 'echo "*.pdf.xz" >> .gitignore' |> system(intern=TRUE) |> cat("  \n", sep="  \n")
# 'echo "*.pdf.gz" >> .gitignore' |> system(intern=TRUE) |> cat("  \n", sep="  \n")
".gitignore" |> file.edit()
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #4-3. git add .gitignore ====
git add .gitignore
'git commit -m "Add .gitignore to exclude PDF files in all remote"' |> system(intern=TRUE) |> cat("  \n", sep="  \n")
'git push origin main' |> system(intern=TRUE) |> cat("  \n", sep="  \n")



#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#| (pending) using Git Large File Storage (Git LFS) for handling large files. |#
#@ (pending) using Git Large File Storage (Git LFS) for handling large files. ======
# Git LFS stores large files outside your repository and keeps pointers in your Git history
# 'git lfs install' |> system(intern=TRUE) |> cat("  \n", sep="  \n")
# 'git lfs track "*.pdf"' |> system(intern=TRUE) |> cat("  \n", sep="  \n")
# 'git add .gitattributes' |> system(intern=TRUE) |> cat("  \n", sep="  \n")
# 'git commit -m "Track PDF files with Git LFS"' |> system(intern=TRUE) |> cat("  \n", sep="  \n")
# 'git lfs migrate import --include="*.pdf"' |> system(intern=TRUE) |> cat("  \n", sep="  \n")
# 'git push origin --all' |> system(intern=TRUE) |> cat("  \n", sep="  \n")







#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:\n", 
    '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
