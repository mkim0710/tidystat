#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  

# 1-1. Remove PDF Files from the Index and the Local File System Using git rm.
git rm --recursive '*.pdf'
git rm --recursive '*.html'

# 1-2. Remove PDF Files from the Index Using git rm --cached (wihout deleting the files in the local file system)
git rm --recursive --cached '*.pdf'
git rm --recursive --cached '*.html'

#2. Commit and Push the Changes: Ensures the changes are reflected in the repository.
git commit -m "Untrack PDF/HTML files from the index"
git push origin main

#3-1. Clone a Fresh Repository: Start with a clean state.
# git clone --mirror <repository_url> fresh-repo
# cd fresh-repo

#3-2. Clone the repository into the current directory 
# Caution) note the dot at the end~!! 
# Caution) Without the dot, a new folder will be created with the repository name under the current directory~!!
# git clone --mirror <repository_url> .
git clone --mirror https://github.com/mkim0710/tidystat.git .
git clone --mirror https://github.com/mkim0710/Rproject_KoGES_AA10030.git .
# git clone --mirror git@github.com:mkim0710/tidystat.git .

#4. Use git filter-repo: Removes PDF files from the entire Git history.
cmd.exe "/K" C:\Users\mkim0\anaconda3\Scripts\activate.bat C:\Users\mkim0\anaconda3
# pip install git-filter-repo
git filter-repo --path-glob '*.pdf' --invert-paths
git filter-repo --path-glob '*.html' --invert-paths

#5. Force Push Changes: Updates the remote repository with the cleaned history.
git push origin --force --mirror

#6. Re-clone the Repository (including the PC where the filter-repo was run): Ensures that everyone works with the updated history.
# rm -rf /path/to/your/repo
# or just delete in the file explorer
# git clone <repository_url> /path/to/your/repo
# git clone https://github.com/mkim0710/tidystat.git .
# git clone https://github.com/mkim0710/Rproject_KoGES_AA10030.git .
# Here, you may use the github desktop to clone the repository.

#7. Add .gitignore: Prevents future PDF files from being tracked.
echo "*.pdf" >> /path/to/your/repo/.gitignore
git add .gitignore
git commit -m "Add .gitignore to exclude PDF files"
git push origin main



