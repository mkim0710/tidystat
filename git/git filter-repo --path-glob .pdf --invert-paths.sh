#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# https://chatgpt.com/c/82e6c7a3-d288-42b3-92d4-3d22cf42fc93
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ #1. Remove the Local Repository ====
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #1-1a. (Preferred) Recursively Remove PDF Files from the Index Using git rm --cached (wihout deleting the files in the local file system) ----
# git rm -r: resursively delete (untrack) files from the index, and also actually delete the files from the local file system. (caution~!)
# git rm -r --cached: resursively delete (untrack) files from the index (without deleting the files in the local file system)
cd ../Rproject_Rmd
git rm -r --cached "*.pdf"
git rm -r --cached "*.html"
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
##@ #1-1b. (Alternative) Recursively Remove PDF Files from the Index and the Local File System Using git rm. ----
cd ../Rproject_Rmd
git rm -r "*.pdf"
git rm -r "*.html"
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
##@ #1-1c. (Alternative) Completely Delete the Local Repository (and completely remove/rename the base folder) ----
cd ../Rproject_Rmd
if (.Platform$OS.type == "windows") {'rmdir /s /q .git' |> system(intern=TRUE)} else {'rm -rf .git' |> system(intern=TRUE)}  # You may just delete from the windows file explorer
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #1-2. Commit and Push the Changes: Ensures the changes are reflected in the repository. ====
git commit -m "Untrack PDF/HTML files from the index"
git push origin main
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ #2. Clone a fresh repository "--mirror" cleanly ====
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #2-1a. (preferred) Clone a fresh repository "--mirror" into the new directory ----
# Caution) note the dot at the end~!! 
# Caution) Without the dot, a new folder will be created with the repository name under the current directory~!!
cd ..
mkdir Rproject_Rmd.mirror
cd Rproject_Rmd.mirror
# git clone --mirror <repository_url> .
git clone --mirror https://github.com/mkim0710/tidystat.git .
git clone --mirror https://github.com/mkim0710/Rproject_KoGES_AA10030.git .
git clone --mirror https://github.com/mkim0710/Rproject_Rmd.git .
# git clone --mirror git@github.com:mkim0710/tidystat.git .
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
##@ #2-1b. (alternative) Clone a fresh repository "--mirror" into a sub-directory ----
# git clone --mirror <repository_url> subdir-name
# cd subdir-name
# cd ..
# git clone --mirror https://github.com/mkim0710/Rproject_Rmd.git Rproject_Rmd.mirror
# cd Rproject_Rmd.mirror
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ #3. Use git filter-repo: Removes PDF files from the entire Git history. ====
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #3-0. pip install git-filter-repo ====
# cmd.exe "/K" C:\Users\mkim0\anaconda3\Scripts\activate.bat C:\Users\mkim0\anaconda3
# pip install git-filter-repo
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #3-1. git filter-repo --path-glob "*.pdf" --invert-paths ====
cd ../Rproject_Rmd
cmd.exe "/K" C:\Users\mkim0\anaconda3\Scripts\activate.bat C:\Users\mkim0\anaconda3
git filter-repo --path-glob "*.pdf" --invert-paths
git filter-repo --path-glob "*.html" --invert-paths
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #3-2. Force Push Changes: Updates the remote repository with the cleaned history. ====
# git remote set-url origin git@github.com:mkim0710/Rproject_KoGES_AA10030.git
git push origin --force --mirror
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#4. Re-clone the Repository (including the PC where the filter-repo was run): Ensures that everyone works with the updated history.
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
# git clone git@github.com:mkim0710/tidystat.git .
# git clone git@github.com:mkim0710/Rproject_KoGES_AA10030.git .
# git clone git@github.com:mkim0710/Rproject_Rmd.git .
# Here, you may use the github desktop to clone the repository.
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #4-2. Add PDF Files to .gitignore: Prevents future PDF files from being tracked. ====
echo "*.pdf" >> /path/to/your/repo/.gitignore
echo "*.pdf.xz" >> /path/to/your/repo/.gitignore
echo "*.pdf.gz" >> /path/to/your/repo/.gitignore
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #4-3. git add .gitignore ====
git add .gitignore
git commit -m "Add .gitignore to exclude PDF files in all remote"
git push origin main




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
# 'git lfs install' |> system(intern=TRUE) |> cat(sep="\n")
# 'git lfs track "*.pdf"' |> system(intern=TRUE) |> cat(sep="\n")
# 'git add .gitattributes' |> system(intern=TRUE) |> cat(sep="\n")
# 'git commit -m "Track PDF files with Git LFS"' |> system(intern=TRUE) |> cat(sep="\n")
# 'git lfs migrate import --include="*.pdf"' |> system(intern=TRUE) |> cat(sep="\n")
# 'git push origin --all' |> system(intern=TRUE) |> cat(sep="\n")


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
