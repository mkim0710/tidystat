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
# env1$env.internal$showProjectPathsAtTidyStat()
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




##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://chatgpt.com/c/82e6c7a3-d288-42b3-92d4-3d22cf42fc93
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ #1. Remove the Local Repository ====  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## @ #1-1a. (Preferred) Recursively Remove PDF Files from the Index Using git rm --cached (wihout deleting the files in the local file system) ----  
'cd ../Rproject_Rmd' |> system(intern=TRUE) |> cat("  ", sep="  \n")
git rm -r --cached "*.pdf"
git rm -r --cached "*.html"
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
## @ #1-1b. (Alternative) Recursively Remove PDF Files from the Index and the Local File System Using git rm. ----  
'cd ../Rproject_Rmd' |> system(intern=TRUE) |> cat("  ", sep="  \n")
git rm -r "*.pdf"
git rm -r "*.html"
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
## @ #1-1c. (Alternative) Completely Delete the Local Repository (and completely remove/rename the base folder) ----  
'cd ../Rproject_Rmd' |> system(intern=TRUE) |> cat("  ", sep="  \n")
if (Sys.info()["sysname"] == "Windows") {'rmdir /s /q .git' |> system(intern=TRUE)} else {'rm -rf .git' |> system(intern=TRUE)}  # You may just delete from the windows file explorer
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## @ #1-2. Commit and Push the Changes: Ensures the changes are reflected in the repository. ====  
git commit -m "Untrack PDF/HTML files from the index"
git push origin main
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ #2. Clone the Repository "--mirror" Cleanly ====  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## @ #2-1a. (preferred) Clone a fresh repository "--mirror" into the new directory ----  
# Caution) note the dot at the end~!! 
# Caution) Without the dot, a new folder will be created with the repository name under the current directory~!!
cd ..
mkdir Rproject_Rmd.mirror
cd Rproject_Rmd.mirror
# 'git clone --mirror <repository_url> .' |> system(intern=TRUE) |> cat("  ", sep="  \n")
# "git clone --mirror https://github.com/mkim0710/tidystat.git ." |> system(intern=TRUE) |> cat("  ", sep="  \n")
# "git clone --mirror git@github.com:mkim0710/tidystat.git ." |> system(intern=TRUE) |> cat("  ", sep="  \n")
paste0("git clone git@github.com:mkim0710/",basename(getwd()),".git"," .") |> system(intern=TRUE) |> cat("  ", sep="  \n")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
## @ #2-1b. (alternative) Clone a fresh repository "--mirror" into a sub-directory ----  
# git clone --mirror <repository_url> subdir-name
# cd subdir-name
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ #3. Use git filter-repo: Removes PDF files from the entire Git history. ====  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## @ #3-0. pip install git-filter-repo ====  
# "pip install git-filter-repo" |> system(intern=TRUE) |> cat("  ", sep="  \n")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## @ #3-1. git filter-repo --path-glob "*.pdf" --invert-paths ====  
# "git filter-repo --path-glob '*.pdf' --invert-paths" |> system(intern=TRUE) |> cat("  ", sep="  \n")
# "git push origin --force --all" |> system(intern=TRUE) |> cat("  ", sep="  \n")
# "git push origin --force --tags" |> system(intern=TRUE) |> cat("  ", sep="  \n")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## @ #3-2. Force Push Changes: Updates the remote repository with the cleaned history. ====  
# git remote set-url origin git@github.com:mkim0710/Rproject_KoGES_AA10030.git
git push origin --force --mirror
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ #4. Re-clone the Repository (including the PC where the filter-repo was run): Ensures that everyone works with the updated history. ====  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## @ #4-0. delete/rename/archive the old repository directory ====  
# rm -rf /path/to/your/repo
# or just delete in the file explorer
# or just rename, e.g., Rproject_Rmd_old
# or just archive, e.g., Rproject_Rmd_old.7z
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## @ #4-1. git clone <repository_url> . ====  
# cd ../Rproject_Rmd
# git clone <repository_url> /path/to/your/repo
# git clone https://github.com/mkim0710/tidystat.git .
# git clone https://github.com/mkim0710/Rproject_KoGES_AA10030.git .
# Here, you may use the github desktop to clone the repository.
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## @ #4-2. Add PDF Files to .gitignore: Prevents future PDF files from being tracked. ====  
# 'echo "*.pdf" >> .gitignore' |> system(intern=TRUE) |> cat("  ", sep="  \n")
# 'echo "*.pdf.xz" >> .gitignore' |> system(intern=TRUE) |> cat("  ", sep="  \n")
# 'echo "*.pdf.gz" >> .gitignore' |> system(intern=TRUE) |> cat("  ", sep="  \n")
".gitignore" %>% {.[file.exists(.)]} |> file.edit()
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## @ #4-3. git add .gitignore ====  
git add .gitignore
'git commit -m "Add .gitignore to exclude PDF files in all remote"' |> system(intern=TRUE) |> cat("  ", sep="  \n")
'git push origin main' |> system(intern=TRUE) |> cat("  ", sep="  \n")



##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#| (pending) using Git Large File Storage (Git LFS) for handling large files. |#
## @ (pending) using Git Large File Storage (Git LFS) for handling large files. ======  
# Git LFS stores large files outside your repository and keeps pointers in your Git history
# 'git lfs install' |> system(intern=TRUE) |> cat("  ", sep="  \n")
# 'git lfs track "*.pdf"' |> system(intern=TRUE) |> cat("  ", sep="  \n")
# 'git add .gitattributes' |> system(intern=TRUE) |> cat("  ", sep="  \n")
# 'git commit -m "Track PDF files with Git LFS"' |> system(intern=TRUE) |> cat("  ", sep="  \n")
# 'git lfs migrate import --include="*.pdf"' |> system(intern=TRUE) |> cat("  ", sep="  \n")
# 'git push origin --all' |> system(intern=TRUE) |> cat("  ", sep="  \n")







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
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
