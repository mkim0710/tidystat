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
# https://chatgpt.com/c/82e6c7a3-d288-42b3-92d4-3d22cf42fc93
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# # Load necessary libraries
# library(tidyverse)
# # List all files recursively and filter for PDF files
# pdf_files <- getwd() |> list.files(pattern = "\\.pdf$", recursive = TRUE, full.names = TRUE)
# pdf_files |> dput()
# # > pdf_files |> dput()
# # c("/home/rstudio/Rproject_KoGES_AA10030/00env1-Rproject_KoGES_AA10030.pdf", 
# # "/home/rstudio/Rproject_KoGES_AA10030/01df_dirs_recursive.df_files-Rproject_KoGES_AA10030.pdf", 
# # "/home/rstudio/Rproject_KoGES_AA10030/10CodeBook-Rproject_KoGES_AA10030.pdf", 
# # "/home/rstudio/Rproject_KoGES_AA10030/220DataSet.na.Date.fct-as1_7.na.Date.fct.select971.pdf", 
# # "/home/rstudio/Rproject_KoGES_AA10030/320DataSet.CensorEND.n-df_NewDMv3.CensorEND.n8845.select971.pdf", 
# # "/home/rstudio/Rproject_KoGES_AA10030/df_NewDMv3.CensorEND.n8845.select218/df_NewDMv3.CensorEND.n8845.select218 from as1.na.Date.fct.select218.Rmd.pdf", 
# # "/home/rstudio/Rproject_KoGES_AA10030/df_NewDMv3.CensorEND.n8845.select218/df_NewDMv3.CensorEND.n8845.select218.na.omit.n____.Rmd.pdf"
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# # Remove the PDF files
# walk(pdf_files, file.remove)
# # Print a message indicating completion
# cat(length(pdf_files), "PDF files removed.", "\n")



#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ Remove the Local Repository & Clone the Repository Cleanly ====
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ Remove the Local Repository (and completely remove/rename the base folder) ====
# 'cd /path/to/your/repo' |> system(intern=TRUE) |> cat(sep="\n")
if (.Platform$OS.type == "windows") {'rmdir /s /q .git' |> system(intern=TRUE)} else {'rm -rf .git' |> system(intern=TRUE)}  # You may just delete from the windows file explorer

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#| Remove PDF Files from Git History |#
#@ Remove PDF Files from Git History: ======
# "pip install git-filter-repo" |> system(intern=TRUE) |> cat(sep="\n")
# "git filter-repo --path-glob '*.pdf' --invert-paths" |> system(intern=TRUE) |> cat(sep="\n")
# "git push origin --force --all" |> system(intern=TRUE) |> cat(sep="\n")
# "git push origin --force --tags" |> system(intern=TRUE) |> cat(sep="\n")
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#@ Remove Existing PDF Files from the Repository ====
# 'git rm --recursive *.pdf'  # This will actually delete the files from the local file system.
'git rm --recursive --cached *.pdf' |> system(intern=TRUE)  # This will untrack the files (remove files from the repository), but not from the local file system  
'git commit -m "Remove PDF files from repository and add to .gitignore"' |> system(intern=TRUE) |> cat(sep="\n")
'git push origin main' |> system(intern=TRUE) |> cat(sep="\n")







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
