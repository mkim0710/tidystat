#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# D:\OneDrive\[Note]\[Note] OS\[[OS]] Linux) git\[[OS]] Linux) git) log\Advanced Git Log _ Atlassian Git Tutorial.HTML.evoPDF.pdf




#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# https://chatgpt.com/c/c63fa826-37dd-42e3-9ac0-f51ecd0176d4
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@ Compare with the remote branch ----  
'git log origin/master..HEAD' |> system(intern=TRUE) |> cat(sep='\n')
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
"git log --oneline --graph origin/master..HEAD" |> system(intern=TRUE) |> cat("  ", sep="  \n")
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
"git log --oneline --graph --decorate origin/master..HEAD" |> system(intern=TRUE) |> cat("  ", sep="  \n")
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
"git log --oneline" |> system(intern=TRUE) |> cat("  ", sep="  \n")
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
"git log --oneline --graph" |> system(intern=TRUE) |> cat("  ", sep="  \n")
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
"git log --oneline --graph --decorate" |> system(intern=TRUE) |> cat("  ", sep="  \n")
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# 'git log --oneline --graph --decorate --since="9am" --until="9pm" --all' |> system(intern=TRUE) |> cat(sep='\n')
# 'git log --oneline --graph --decorate --since="24 hours ago" --all' |> system(intern=TRUE) |> cat(sep='\n')
'git log --oneline --graph --decorate --all --since="May 16 2024" --until=" May 20 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# > 'git log --oneline --graph --decorate --all --since="May 16 2024" --until=" May 20 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# * bc42adc (HEAD -> master, origin/master, origin/HEAD) f_session_recover.dev.04.r
# * ddf0e79 recovered_files01
# * 7cc98ee # else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"} 
# * 814b442 Update default.R
# * dc4c33a "auto_save_on_blur": true,
# *   4584b7c Merge branch 'master' of github.com:mkim0710/tidystat
# |\  
# | * 9a03189 tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n")
# | * 3bbda0f ; cat('"',path2look,'" |> normalizePath(winslash="/") == "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"  \n", sep="")
# * | 0f80ad0 f_session_recover.dev.01.r
# |/  
# * 27626a6 ; cat('"',path2look,'" |> normalizePath(winslash="/") == "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE,include.dirs=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE,include.dirs=TRUE)),"  \n", sep="")
# *   23b0ff7 Merge branch 'master' of github.com:mkim0710/tidystat
# |\  
# | * e7b53be ; cat('"',path2look,'" |> normalizePath(winslash="/") = ',normalizePath(path2look,winslash="/"),"  \n", sep=""); cat('"',path2look,'" |> dir(all.files=TRUE,include.dirs=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE,include.dirs=TRUE)),"  \n", sep="")
# * | 81842c5 file.edit("~/.ssh/id_ed25519.pub")
# |/  
# * ac401c2 git config remote.origin.url
# * c37e6e4 )) {if(!require(
# *   3857e39 Merge branch 'master' of https://github.com/mkim0710/tidystat
# |\  
# | * 930eb55 RStudio.Cloud set up.r
# * | 58c6c76 # file.edit(paste0("[Working Files List] ",basename(getwd()),".r"))
# |/  
# * 8158062 Revert "Add files via upload"
# * 236fc87 Add files via upload
# * c2125c7 RUN ALL ABOVE: CTRL+ALT+B
# * 807e36b f_df.NotNA_p_df
# * 60037c4 f_df.NotNA_p_df = function(data) {
# * ac85fff f_df.CreateTableOne
# * e347769 # for (CodeFileBaseName in rev(c("00env1", "01df_dirs_recursive.df_files", "10CodeBook"))) {
# * 1f93687 update
# * 44e2562 Rocker
# *   487c5ea Merge branch 'master' of https://github.com/mkim0710/tidystat
# |\  
# | *   a091ed7 Merge branch 'master' of github.com:mkim0710/tidystat
# | |\  
# | * | 8119876 filename.r = "f_df.t.tribble_construct" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); subpath.filename.r = subpath.filename.r[file.exists(subpath.filename.r)]; file.edit( file.path(env1$path$source_base, subpath.filename.r) ); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)}
# * | | f74220b Update f_df.t.tribble_construct.source.r
# | |/  
# |/|   
# * | b8e5acc .GlobalEnv$env1$path[[objectname]] = object
# |/  
# * b7d5f4d if(!exists("env1", envir=.GlobalEnv))     assign("env1", new.env(), envir=.GlobalEnv)
# * caa3dd2 #     assign("env1", new.env(), envir=.GlobalEnv)
# *   932dc06 Merge branch 'master' of https://github.com/mkim0710/tidystat
# |\  
# | * ec68f01 file.edit( file.path(subpath.filename.r) )
# | * 4cf4219 01df_dirs_recursive.df_files
# * | c9f5591 #     '# utils::browseURL("',env1$path$source_base_github_blob,"/",env1$path$subpath.filename.dev.r,'")', "\n",
# |/  
# * 81554d2 xenv1
# * 918eb6d #@@ END -----  
# * 265fd73 browseURL(normalizePath("."),winslash="/")
# * 246c842 ,"-",basename(getwd())
# * 2c05397 '# utils::browseURL("',env1$path$source_base_local,"/",env1$path$subpath,'")', "\n",
# * 9a865ad file.edit(paste0("[Working Files List] ",basename(getwd()),".r"))
# * e9ef464 # rm(list=ls())
# * a7dfd8f if(!exists("env1", envir=.GlobalEnv))
# *   8d282c7 Merge branch 'master' of https://github.com/mkim0710/tidystat
# |\  
# | * b3313bd default.R
# * | 208f12d if(!exists("env1", envir=.GlobalEnv))      assign("env1", new.env(), envir=.GlobalEnv)
# |/  
# * f7bfe63 default.R
# *   3fd0b82 Merge branch 'master' of https://github.com/mkim0710/tidystat
# |\  
# | * cf508e1 default
# * | 40da427 '# file.edit(paste0(env1$path$source_base,"/","',env1$path$subpath.filename.dev.r,'"))'
# |/  
# * 239b748 -MAGB760M13700KF
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
'git log -1 --oneline' |> system(intern=TRUE) |> cat(sep='\n')
# > 'git log -1 --oneline' |> system(intern=TRUE) |> cat(sep='\n')
# bc42adc f_session_recover.dev.04.r
'git log -1 --graph --decorate' |> system(intern=TRUE) |> cat(sep='\n')
# > 'git log -1 --graph --decorate' |> system(intern=TRUE) |> cat(sep='\n')
# * commit bc42adc4f5b9d4f576b9fd9b758ead93710bfd59 (HEAD -> master, origin/master, origin/HEAD)
# | Author: mhkim@rocker@MAGB760M13700KF <mhkim710@gmail.com>
# | Date:   Mon May 20 15:59:48 2024 +0000
# | 
# |     f_session_recover.dev.04.r
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
'git log -1 --stat' |> system(intern=TRUE) |> cat(sep='\n')
# > 'git log -1 --stat' |> system(intern=TRUE) |> cat(sep='\n')
# commit bc42adc4f5b9d4f576b9fd9b758ead93710bfd59
# Author: mhkim@rocker@MAGB760M13700KF <mhkim710@gmail.com>
# Date:   Mon May 20 15:59:48 2024 +0000
# 
#     f_session_recover.dev.04.r
# 
#  Rdev/00_base_program/f_session_recover.dev.02.r    | 669 ++++++++++++++-
#  Rdev/00_base_program/f_session_recover.dev.03.r    | 901 +++++++++++++++++++++
#  Rdev/00_base_program/f_session_recover.dev.04.r    | 347 ++++++++
#  .../Untitled-Untitled1-06A2BF28.R                  | 605 ++++++++++++++
#  .../Untitled-Untitled1-22452B12.R                  | 363 +++++++++
#  .../Untitled-Untitled1-A05040E0.R                  | 203 +++++
#  .../Untitled-Untitled1-D14D3FDE.R                  | 226 ++++++
#  .../Untitled-Untitled1-E01BF946.R                  | 318 ++++++++
#  .../Untitled-Untitled1-06A2BF28.R                  | 605 ++++++++++++++
#  .../Untitled-Untitled1-22452B12.R                  | 363 +++++++++
#  .../Untitled-Untitled1-A05040E0.R                  | 203 +++++
#  .../Untitled-Untitled1-D14D3FDE.R                  | 226 ++++++
#  .../Untitled-Untitled1-E01BF946.R                  | 319 ++++++++
#  .../Untitled-Untitled1-06A2BF28.R                  | 605 ++++++++++++++
#  .../Untitled-Untitled1-22452B12.R                  | 363 +++++++++
#  .../Untitled-Untitled1-A05040E0.R                  | 203 +++++
#  .../Untitled-Untitled1-D14D3FDE.R                  | 226 ++++++
#  .../Untitled-Untitled1-E01BF946.R                  | 288 +++++++
#  18 files changed, 6988 insertions(+), 45 deletions(-)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
'git log -1 --compact-summary' |> system(intern=TRUE) |> cat(sep='\n')
# > 'git log -1 --compact-summary' |> system(intern=TRUE) |> cat(sep='\n')
# commit bc42adc4f5b9d4f576b9fd9b758ead93710bfd59
# Author: mhkim@rocker@MAGB760M13700KF <mhkim710@gmail.com>
# Date:   Mon May 20 15:59:48 2024 +0000
# 
#     f_session_recover.dev.04.r
# 
#  Rdev/00_base_program/f_session_recover.dev.02.r    | 669 ++++++++++++++-
#  .../f_session_recover.dev.03.r (new)               | 901 +++++++++++++++++++++
#  .../f_session_recover.dev.04.r (new)               | 347 ++++++++
#  .../Untitled-Untitled1-06A2BF28.R (new)            | 605 ++++++++++++++
#  .../Untitled-Untitled1-22452B12.R (new)            | 363 +++++++++
#  .../Untitled-Untitled1-A05040E0.R (new)            | 203 +++++
#  .../Untitled-Untitled1-D14D3FDE.R (new)            | 226 ++++++
#  .../Untitled-Untitled1-E01BF946.R (new)            | 318 ++++++++
#  .../Untitled-Untitled1-06A2BF28.R (new)            | 605 ++++++++++++++
#  .../Untitled-Untitled1-22452B12.R (new)            | 363 +++++++++
#  .../Untitled-Untitled1-A05040E0.R (new)            | 203 +++++
#  .../Untitled-Untitled1-D14D3FDE.R (new)            | 226 ++++++
#  .../Untitled-Untitled1-E01BF946.R (new)            | 319 ++++++++
#  .../Untitled-Untitled1-06A2BF28.R (new)            | 605 ++++++++++++++
#  .../Untitled-Untitled1-22452B12.R (new)            | 363 +++++++++
#  .../Untitled-Untitled1-A05040E0.R (new)            | 203 +++++
#  .../Untitled-Untitled1-D14D3FDE.R (new)            | 226 ++++++
#  .../Untitled-Untitled1-E01BF946.R (new)            | 288 +++++++
#  18 files changed, 6988 insertions(+), 45 deletions(-)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
'git log -1 --shortstat' |> system(intern=TRUE) |> cat(sep='\n')
# > 'git log -1 --shortstat' |> system(intern=TRUE) |> cat(sep='\n')
# commit bc42adc4f5b9d4f576b9fd9b758ead93710bfd59
# Author: mhkim@rocker@MAGB760M13700KF <mhkim710@gmail.com>
# Date:   Mon May 20 15:59:48 2024 +0000
# 
#     f_session_recover.dev.04.r
# 
#  18 files changed, 6988 insertions(+), 45 deletions(-)
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
'git log -1 --patch' |> system(intern=TRUE) |> cat(sep='\n')
# too much
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
'git diff HEAD~1 HEAD' |> system(intern=TRUE) |> cat(sep='\n')
# too much
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
'git log origin/master..HEAD -1' |> system(intern=TRUE) |> cat(sep='\n')
# nothing
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  




#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# https://chatgpt.com/c/f6bf4953-7093-4682-b0e6-01f514d70b2e
# D:\OneDrive\[Note]\[Note] Software\[[Web]] OpenAI ChatGPT\[[Web]] OpenAI ChatGPT -export\Git Stash Use Cases.md.pdf
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# Commit Hash: 16abe9643b10fd156d92916a0233dac09f37a0e5
# Author: mkim0710 <mkim0710@gmail.com>
# Date: Thu May 16 15:42:30 2024 +0900
# Commit Message: subpath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
'git log --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# > 'git log --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# commit ddf0e79b37e25c6b0d10faf080b11cc72e67a156
# Author: mhkim@rocker@MAGB760M13700KF <mhkim710@gmail.com>
# Date:   Mon May 20 15:06:22 2024 +0000
# 
#     recovered_files01
# 
# commit 7cc98ee6e4ac14a5ca02c8f08b2e804e1d089fe9
# Author: mkim0710 <mkim0710@gmail.com>
# Date:   Mon May 20 23:52:46 2024 +0900
# 
#     # else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"} 
# 
# commit 814b442e31c6639123858e11ca94e1fba5781c44
# Author: mkim0710 <mkim0710@gmail.com>
# Date:   Mon May 20 23:50:23 2024 +0900
# 
#     Update default.R
# 
# commit dc4c33aa4eb1bc4103996975ebb2377beef88fe8
# Author: mkim0710 <mkim0710@gmail.com>
# Date:   Mon May 20 23:50:02 2024 +0900
# 
#     "auto_save_on_blur": true,
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
'git log --pretty=fuller --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# > 'git log --pretty=fuller --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# commit ddf0e79b37e25c6b0d10faf080b11cc72e67a156
# Author:     mhkim@rocker@MAGB760M13700KF <mhkim710@gmail.com>
# AuthorDate: Mon May 20 15:06:22 2024 +0000
# Commit:     mhkim@rocker@MAGB760M13700KF <mhkim710@gmail.com>
# CommitDate: Mon May 20 15:06:22 2024 +0000
# 
#     recovered_files01
# 
# commit 7cc98ee6e4ac14a5ca02c8f08b2e804e1d089fe9
# Author:     mkim0710 <mkim0710@gmail.com>
# AuthorDate: Mon May 20 23:52:46 2024 +0900
# Commit:     mkim0710 <mkim0710@gmail.com>
# CommitDate: Mon May 20 23:52:46 2024 +0900
# 
#     # else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"} 
# 
# commit 814b442e31c6639123858e11ca94e1fba5781c44
# Author:     mkim0710 <mkim0710@gmail.com>
# AuthorDate: Mon May 20 23:50:23 2024 +0900
# Commit:     mkim0710 <mkim0710@gmail.com>
# CommitDate: Mon May 20 23:50:23 2024 +0900
# 
#     Update default.R
# 
# commit dc4c33aa4eb1bc4103996975ebb2377beef88fe8
# Author:     mkim0710 <mkim0710@gmail.com>
# AuthorDate: Mon May 20 23:50:02 2024 +0900
# Commit:     mkim0710 <mkim0710@gmail.com>
# CommitDate: Mon May 20 23:50:02 2024 +0900
# 
#     "auto_save_on_blur": true,
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
'git log --name-status --pretty=fuller --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# > 'git log --name-status --pretty=fuller --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# commit ddf0e79b37e25c6b0d10faf080b11cc72e67a156
# Author:     mhkim@rocker@MAGB760M13700KF <mhkim710@gmail.com>
# AuthorDate: Mon May 20 15:06:22 2024 +0000
# Commit:     mhkim@rocker@MAGB760M13700KF <mhkim710@gmail.com>
# CommitDate: Mon May 20 15:06:22 2024 +0000
# 
#     recovered_files01
# 
# M	Rdev/00_base_program/f_session_recover.dev.02.r
# R100	recovered_files/RStudio Server Setup.r	recovered_files01/RStudio Server Setup.r
# R100	recovered_files/RStudio.Cloud set up.r	recovered_files01/RStudio.Cloud set up.r
# R100	recovered_files/Rocker set up.r	recovered_files01/Rocker set up.r
# R100	recovered_files/[Working Files List].r	recovered_files01/[Working Files List].r
# R100	recovered_files/f_df.CreateTableOne.dev.Rmd	recovered_files01/f_df.CreateTableOne.dev.Rmd
# R100	recovered_files/f_df.CreateTableOne.dev.r	recovered_files01/f_df.CreateTableOne.dev.r
# R100	recovered_files/f_df.CreateTableOne.source.r	recovered_files01/f_df.CreateTableOne.source.r
# R100	recovered_files/f_df.t.tribble_construct.source.r	recovered_files01/f_df.t.tribble_construct.source.r
# R100	recovered_files/f_session_recover.RsRecovr.r	recovered_files01/f_session_recover.RsRecovr.r
# R100	recovered_files/f_session_recover.dev.r	recovered_files01/f_session_recover.dev.r
# R100	recovered_files/git stash.r	recovered_files01/git stash.r
# R100	recovered_files/rstudio-prefs.json	recovered_files01/rstudio-prefs.json
# 
# commit 7cc98ee6e4ac14a5ca02c8f08b2e804e1d089fe9
# Author:     mkim0710 <mkim0710@gmail.com>
# AuthorDate: Mon May 20 23:52:46 2024 +0900
# Commit:     mkim0710 <mkim0710@gmail.com>
# CommitDate: Mon May 20 23:52:46 2024 +0900
# 
#     # else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"} 
# 
# M	rstudio-prefs/templates/templates-00env1.minimum.Rmd
# M	rstudio-prefs/templates/templates-00env1.minimum.nb.html
# 
# commit 814b442e31c6639123858e11ca94e1fba5781c44
# Author:     mkim0710 <mkim0710@gmail.com>
# AuthorDate: Mon May 20 23:50:23 2024 +0900
# Commit:     mkim0710 <mkim0710@gmail.com>
# CommitDate: Mon May 20 23:50:23 2024 +0900
# 
#     Update default.R
# 
# M	rstudio-prefs/templates/default.R
# 
# commit dc4c33aa4eb1bc4103996975ebb2377beef88fe8
# Author:     mkim0710 <mkim0710@gmail.com>
# AuthorDate: Mon May 20 23:50:02 2024 +0900
# Commit:     mkim0710 <mkim0710@gmail.com>
# CommitDate: Mon May 20 23:50:02 2024 +0900
# 
#     "auto_save_on_blur": true,
# 
# A	rstudio-prefs/rstudio-prefs.json@Rocker@MAGB760M13700KF-240513.json.xz
# R079	rstudio-prefs/rstudio-prefs.json@Rocker@MAGB760M13700KF-240513.json	rstudio-prefs/rstudio-prefs.json@Rocker@MAGB760M13700KF-240520.json
# A	rstudio-prefs/rstudio-prefs.json@Rocker@MAGB760M13700KF-240520.json.xz



#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
'git log --oneline --stat --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# > 'git log --oneline --stat --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# ddf0e79 recovered_files01
#  Rdev/00_base_program/f_session_recover.dev.02.r    | 71 +++++++++++++++++++---
#  .../RStudio Server Setup.r                         |  0
#  .../RStudio.Cloud set up.r                         |  0
#  .../Rocker set up.r                                |  0
#  .../[Working Files List].r                         |  0
#  .../f_df.CreateTableOne.dev.Rmd                    |  0
#  .../f_df.CreateTableOne.dev.r                      |  0
#  .../f_df.CreateTableOne.source.r                   |  0
#  .../f_df.t.tribble_construct.source.r              |  0
#  .../f_session_recover.RsRecovr.r                   |  0
#  .../f_session_recover.dev.r                        |  0
#  {recovered_files => recovered_files01}/git stash.r |  0
#  .../rstudio-prefs.json                             |  0
#  13 files changed, 62 insertions(+), 9 deletions(-)
# 7cc98ee # else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"} 
#  .../templates/templates-00env1.minimum.Rmd   |  2 +-
#  .../templates-00env1.minimum.nb.html         | 40 +++++++++++-----------  
#  2 files changed, 21 insertions(+), 21 deletions(-)
# 814b442 Update default.R
#  rstudio-prefs/templates/default.R | 2 +-
#  1 file changed, 1 insertion(+), 1 deletion(-)
# dc4c33a "auto_save_on_blur": true,
#  ...udio-prefs.json@Rocker@MAGB760M13700KF-240513.json.xz | Bin 0 -> 564 bytes
#  ...studio-prefs.json@Rocker@MAGB760M13700KF-240520.json} |  15 +++++++++++----  
#  ...udio-prefs.json@Rocker@MAGB760M13700KF-240520.json.xz | Bin 0 -> 648 bytes
#  3 files changed, 11 insertions(+), 4 deletions(-)


#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# %h: Abbreviated commit hash
# %an: Author name
# %ad: Author date (format can be customized)
# %s: Commit message
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
'git log --pretty=format:"%h %an %ad %s" --date=local --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# > 'git log --pretty=format:"%h %an %ad %s" --date=local --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# ddf0e79 mhkim@rocker@MAGB760M13700KF Mon May 20 15:06:22 2024 recovered_files01
# 7cc98ee mkim0710 Mon May 20 14:52:46 2024 # else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"} 
# 814b442 mkim0710 Mon May 20 14:50:23 2024 Update default.R
# dc4c33a mkim0710 Mon May 20 14:50:02 2024 "auto_save_on_blur": true,
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
'git log --oneline --stat --pretty=format:"%h %an %ad %s" --date=local --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# > 'git log --oneline --stat --pretty=format:"%h %an %ad %s" --date=local --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# ddf0e79 mhkim@rocker@MAGB760M13700KF Mon May 20 15:06:22 2024 recovered_files01
#  Rdev/00_base_program/f_session_recover.dev.02.r    | 71 +++++++++++++++++++---
#  .../RStudio Server Setup.r                         |  0
#  .../RStudio.Cloud set up.r                         |  0
#  .../Rocker set up.r                                |  0
#  .../[Working Files List].r                         |  0
#  .../f_df.CreateTableOne.dev.Rmd                    |  0
#  .../f_df.CreateTableOne.dev.r                      |  0
#  .../f_df.CreateTableOne.source.r                   |  0
#  .../f_df.t.tribble_construct.source.r              |  0
#  .../f_session_recover.RsRecovr.r                   |  0
#  .../f_session_recover.dev.r                        |  0
#  {recovered_files => recovered_files01}/git stash.r |  0
#  .../rstudio-prefs.json                             |  0
#  13 files changed, 62 insertions(+), 9 deletions(-)
# 
# 7cc98ee mkim0710 Mon May 20 14:52:46 2024 # else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"} 
#  .../templates/templates-00env1.minimum.Rmd   |  2 +-
#  .../templates-00env1.minimum.nb.html         | 40 +++++++++++-----------  
#  2 files changed, 21 insertions(+), 21 deletions(-)
# 
# 814b442 mkim0710 Mon May 20 14:50:23 2024 Update default.R
#  rstudio-prefs/templates/default.R | 2 +-
#  1 file changed, 1 insertion(+), 1 deletion(-)
# 
# dc4c33a mkim0710 Mon May 20 14:50:02 2024 "auto_save_on_blur": true,
#  ...udio-prefs.json@Rocker@MAGB760M13700KF-240513.json.xz | Bin 0 -> 564 bytes
#  ...studio-prefs.json@Rocker@MAGB760M13700KF-240520.json} |  15 +++++++++++----  
#  ...udio-prefs.json@Rocker@MAGB760M13700KF-240520.json.xz | Bin 0 -> 648 bytes
#  3 files changed, 11 insertions(+), 4 deletions(-)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
'git log --oneline --graph --decorate --pretty=format:"%h %an %ad %s" --date=local --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# > 'git log --oneline --graph --decorate --pretty=format:"%h %an %ad %s" --date=local --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# * ddf0e79 mhkim@rocker@MAGB760M13700KF Mon May 20 15:06:22 2024 recovered_files01
# * 7cc98ee mkim0710 Mon May 20 14:52:46 2024 # else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"} 
# * 814b442 mkim0710 Mon May 20 14:50:23 2024 Update default.R
# * dc4c33a mkim0710 Mon May 20 14:50:02 2024 "auto_save_on_blur": true,
'git log --oneline --graph --decorate --pretty=format:"%h %an %ad %s" --date=local --since="May 16 2024" --until=" May 20 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# > 'git log --oneline --graph --decorate --pretty=format:"%h %an %ad %s" --date=local --since="May 16 2024" --until=" May 20 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# * bc42adc mhkim@rocker@MAGB760M13700KF Mon May 20 15:59:48 2024 f_session_recover.dev.04.r
# * ddf0e79 mhkim@rocker@MAGB760M13700KF Mon May 20 15:06:22 2024 recovered_files01
# * 7cc98ee mkim0710 Mon May 20 14:52:46 2024 # else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"} 
# * 814b442 mkim0710 Mon May 20 14:50:23 2024 Update default.R
# * dc4c33a mkim0710 Mon May 20 14:50:02 2024 "auto_save_on_blur": true,
# *   4584b7c mhkim@rocker@MAGB760M13700KF Mon May 20 14:47:52 2024 Merge branch 'master' of github.com:mkim0710/tidystat
# |\  
# | * 9a03189 mkim0710 Mon May 20 07:16:04 2024 tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n")
# | * 3bbda0f mkim0710 Mon May 20 06:45:40 2024 ; cat('"',path2look,'" |> normalizePath(winslash="/") == "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"  \n", sep="")
# * | 0f80ad0 mhkim@rocker@MAGB760M13700KF Mon May 20 14:47:45 2024 f_session_recover.dev.01.r
# |/  
# * 27626a6 mkim0710 Mon May 20 04:34:56 2024 ; cat('"',path2look,'" |> normalizePath(winslash="/") == "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE,include.dirs=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE,include.dirs=TRUE)),"  \n", sep="")
# *   23b0ff7 mhkim@rocker@MAGB760M13700KF Mon May 20 00:44:23 2024 Merge branch 'master' of github.com:mkim0710/tidystat
# |\  
# | * e7b53be mkim0710 Mon May 20 00:43:22 2024 ; cat('"',path2look,'" |> normalizePath(winslash="/") = ',normalizePath(path2look,winslash="/"),"  \n", sep=""); cat('"',path2look,'" |> dir(all.files=TRUE,include.dirs=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE,include.dirs=TRUE)),"  \n", sep="")
# * | 81842c5 mhkim@rocker@MAGB760M13700KF Mon May 20 00:44:15 2024 file.edit("~/.ssh/id_ed25519.pub")
# |/  
# * ac401c2 mhkim@rocker@MAGB760M13700KF Sun May 19 05:41:38 2024 git config remote.origin.url
# * c37e6e4 mkim0710 Sun May 19 05:10:09 2024 )) {if(!require(
# *   3857e39 mkim0710 Sun May 19 05:08:31 2024 Merge branch 'master' of https://github.com/mkim0710/tidystat
# |\  
# | * 930eb55 mhkim@rocker@MAGB760M13700KF Sun May 19 05:06:52 2024 RStudio.Cloud set up.r
# * | 58c6c76 mkim0710 Sun May 19 05:08:23 2024 # file.edit(paste0("[Working Files List] ",basename(getwd()),".r"))
# |/  
# * 8158062 mkim0710 Sat May 18 07:00:11 2024 Revert "Add files via upload"
# * 236fc87 mkim0710 Sat May 18 06:46:18 2024 Add files via upload
# * c2125c7 mhkim@rocker@MAGB760M13700KF Sat May 18 03:46:24 2024 RUN ALL ABOVE: CTRL+ALT+B
# * 807e36b mhkim@rocker@MAGB760M13700KF Fri May 17 03:32:11 2024 f_df.NotNA_p_df
# * 60037c4 mkim0710 Fri May 17 03:29:52 2024 f_df.NotNA_p_df = function(data) {
# * ac85fff mkim0710 Fri May 17 03:18:12 2024 f_df.CreateTableOne
# * e347769 mkim0710 Fri May 17 03:17:35 2024 # for (CodeFileBaseName in rev(c("00env1", "01df_dirs_recursive.df_files", "10CodeBook"))) {
# * 1f93687 mhkim@rocker@MAGB760M13700KF Fri May 17 03:05:50 2024 update
# * 44e2562 mhkim@rocker@MAGB760M13700KF Fri May 17 03:04:18 2024 Rocker
# *   487c5ea mkim0710 Fri May 17 03:02:39 2024 Merge branch 'master' of https://github.com/mkim0710/tidystat
# |\  
# | *   a091ed7 mhkim@rocker@MAGB760M13700KF Fri May 17 02:58:31 2024 Merge branch 'master' of github.com:mkim0710/tidystat
# | |\  
# | * | 8119876 mhkim@rocker@MAGB760M13700KF Fri May 17 02:58:25 2024 filename.r = "f_df.t.tribble_construct" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); subpath.filename.r = subpath.filename.r[file.exists(subpath.filename.r)]; file.edit( file.path(env1$path$source_base, subpath.filename.r) ); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)}
# * | | f74220b mkim0710 Fri May 17 03:02:31 2024 Update f_df.t.tribble_construct.source.r
# | |/  
# |/|   
# * | b8e5acc mkim0710 Fri May 17 02:56:58 2024 .GlobalEnv$env1$path[[objectname]] = object
# |/  
# * b7d5f4d mkim0710 Fri May 17 02:25:16 2024 if(!exists("env1", envir=.GlobalEnv))     assign("env1", new.env(), envir=.GlobalEnv)
# * caa3dd2 mkim0710 Fri May 17 02:22:12 2024 #     assign("env1", new.env(), envir=.GlobalEnv)
# *   932dc06 mkim0710 Fri May 17 02:19:31 2024 Merge branch 'master' of https://github.com/mkim0710/tidystat
# |\  
# | * ec68f01 mhkim@rocker@MAGB760M13700KF Fri May 17 02:11:22 2024 file.edit( file.path(subpath.filename.r) )
# | * 4cf4219 mhkim@rocker@MAGB760M13700KF Fri May 17 01:46:53 2024 01df_dirs_recursive.df_files
# * | c9f5591 mkim0710 Fri May 17 02:19:29 2024 #     '# utils::browseURL("',env1$path$source_base_github_blob,"/",env1$path$subpath.filename.dev.r,'")', "\n",
# |/  
# * 81554d2 mkim0710 Fri May 17 01:45:08 2024 xenv1
# * 918eb6d mhkim@rocker@MAGB760M13700KF Fri May 17 01:42:37 2024 #@@ END -----  
# * 265fd73 mhkim@rocker@MAGB760M13700KF Fri May 17 01:41:01 2024 browseURL(normalizePath("."),winslash="/")
# * 246c842 mkim0710 Fri May 17 01:35:03 2024 ,"-",basename(getwd())
# * 2c05397 mkim0710 Fri May 17 01:22:50 2024 '# utils::browseURL("',env1$path$source_base_local,"/",env1$path$subpath,'")', "\n",
# * 9a865ad mhkim@rocker@MAGB760M13700KF Fri May 17 01:06:41 2024 file.edit(paste0("[Working Files List] ",basename(getwd()),".r"))
# * e9ef464 mkim0710 Fri May 17 01:00:45 2024 # rm(list=ls())
# * a7dfd8f mkim0710 Fri May 17 00:42:10 2024 if(!exists("env1", envir=.GlobalEnv))
# *   8d282c7 mkim0710 Fri May 17 00:18:58 2024 Merge branch 'master' of https://github.com/mkim0710/tidystat
# |\  
# | * b3313bd mhkim@rocker@MAGB760M13700KF Thu May 16 23:52:29 2024 default.R
# * | 208f12d mkim0710 Fri May 17 00:18:48 2024 if(!exists("env1", envir=.GlobalEnv))      assign("env1", new.env(), envir=.GlobalEnv)
# |/  
# * f7bfe63 mhkim@rocker@MAGB760M13700KF Thu May 16 23:48:34 2024 default.R
# *   3fd0b82 mkim0710 Thu May 16 23:46:44 2024 Merge branch 'master' of https://github.com/mkim0710/tidystat
# |\  
# | * cf508e1 mhkim@rocker@MAGB760M13700KF Thu May 16 23:34:50 2024 default
# * | 40da427 mkim0710 Thu May 16 23:46:31 2024 '# file.edit(paste0(env1$path$source_base,"/","',env1$path$subpath.filename.dev.r,'"))'
# |/  
# * 239b748 mkim0710 Thu May 16 23:29:27 2024 -MAGB760M13700KF




#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# --name-status: Shows the list of modified files along with their statuses
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# 'git log --name-status --pretty=format:"%h %an %ad %s" --date=local --since="24 hours ago"' |> system(intern=TRUE) |> cat(sep='\n')
'git log --name-status --pretty=format:"%h %an %ad %s" --date=local --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# > 'git log --name-status --pretty=format:"%h %an %ad %s" --date=local --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
# ddf0e79 mhkim@rocker@MAGB760M13700KF Mon May 20 15:06:22 2024 recovered_files01
# M	Rdev/00_base_program/f_session_recover.dev.02.r
# R100	recovered_files/RStudio Server Setup.r	recovered_files01/RStudio Server Setup.r
# R100	recovered_files/RStudio.Cloud set up.r	recovered_files01/RStudio.Cloud set up.r
# R100	recovered_files/Rocker set up.r	recovered_files01/Rocker set up.r
# R100	recovered_files/[Working Files List].r	recovered_files01/[Working Files List].r
# R100	recovered_files/f_df.CreateTableOne.dev.Rmd	recovered_files01/f_df.CreateTableOne.dev.Rmd
# R100	recovered_files/f_df.CreateTableOne.dev.r	recovered_files01/f_df.CreateTableOne.dev.r
# R100	recovered_files/f_df.CreateTableOne.source.r	recovered_files01/f_df.CreateTableOne.source.r
# R100	recovered_files/f_df.t.tribble_construct.source.r	recovered_files01/f_df.t.tribble_construct.source.r
# R100	recovered_files/f_session_recover.RsRecovr.r	recovered_files01/f_session_recover.RsRecovr.r
# R100	recovered_files/f_session_recover.dev.r	recovered_files01/f_session_recover.dev.r
# R100	recovered_files/git stash.r	recovered_files01/git stash.r
# R100	recovered_files/rstudio-prefs.json	recovered_files01/rstudio-prefs.json
# 
# 7cc98ee mkim0710 Mon May 20 14:52:46 2024 # else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"} 
# M	rstudio-prefs/templates/templates-00env1.minimum.Rmd
# M	rstudio-prefs/templates/templates-00env1.minimum.nb.html
# 
# 814b442 mkim0710 Mon May 20 14:50:23 2024 Update default.R
# M	rstudio-prefs/templates/default.R
# 
# dc4c33a mkim0710 Mon May 20 14:50:02 2024 "auto_save_on_blur": true,
# A	rstudio-prefs/rstudio-prefs.json@Rocker@MAGB760M13700KF-240513.json.xz
# R079	rstudio-prefs/rstudio-prefs.json@Rocker@MAGB760M13700KF-240513.json	rstudio-prefs/rstudio-prefs.json@Rocker@MAGB760M13700KF-240520.json
# A	rstudio-prefs/rstudio-prefs.json@Rocker@MAGB760M13700KF-240520.json.xz




#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# --patch: Shows the difference introduced in each commit
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
'git log --patch --pretty=format:"%h %an %ad %s" --date=local --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
#' > 'git log --patch --pretty=format:"%h %an %ad %s" --date=local --since="Mon May 20 14:50:00 2024" --until="Mon May 20 15:06:59 2024"' |> system(intern=TRUE) |> cat(sep='\n')
#' ddf0e79 mhkim@rocker@MAGB760M13700KF Mon May 20 15:06:22 2024 recovered_files01
#' diff --git a/Rdev/00_base_program/f_session_recover.dev.02.r b/Rdev/00_base_program/f_session_recover.dev.02.r
#' index cc8788c..5c0efe8 100644
#' --- a/Rdev/00_base_program/f_session_recover.dev.02.r
#' +++ b/Rdev/00_base_program/f_session_recover.dev.02.r
#' @@ -35,7 +35,7 @@
#'  #|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#'  ".Rproj.user/shared" |> list.files(recursive = TRUE) |> dput()
#'  # > ".Rproj.user/shared" |> list.files(recursive = TRUE) |> dput() ----  
#' -c("notebooks/40C0E44C-f_df.CreateTableOne.dev/1/E3EEE3A9702e3c18/chunks.json", 
#' +.Rproj.user.shared.list.files1 = c("notebooks/40C0E44C-f_df.CreateTableOne.dev/1/E3EEE3A9702e3c18/chunks.json", 
#'  "notebooks/40C0E44C-f_df.CreateTableOne.dev/1/E3EEE3A9800d5f74/chunks.json", 
#'  "notebooks/40C0E44C-f_df.CreateTableOne.dev/1/E3EEE3A9a2e5d569/chunks.json", 
#'  "notebooks/40C0E44C-f_df.CreateTableOne.dev/1/s/c2kv2ircdtmr9/000002.csv", 
#' @@ -104,12 +104,24 @@ c("notebooks/40C0E44C-f_df.CreateTableOne.dev/1/E3EEE3A9702e3c18/chunks.json",
#'  "notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/cyrnlj0ymdq5k/00000f.csv", 
#'  "notebooks/9EC9A4B0-f_git.03_final.pull_rebase_push.dev/1/s/czk7rsj2uariz/00000f.csv", 
#'  "notebooks/patch-chunk-names", "notebooks/paths")
#' -
#' +#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#' +function_setdiff = function(x, y) {
#' +    out = list()
#' +    out$setdiff_x_y = setdiff(x, y)
#' +    out$setdiff_y_x = setdiff(y, x)
#' +    out
#' +}
#' +#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#' +function_setdiff(".Rproj.user/shared" |> list.files(recursive = TRUE), .Rproj.user.shared.list.files1) |> str()
#' +# > function_setdiff(".Rproj.user/shared" |> list.files(recursive = TRUE), .Rproj.user.shared.list.files1) |> str()
#' +# List of 2
#' +#  $ setdiff_x_y: chr(0) 
#' +#  $ setdiff_y_x: chr "notebooks/6E4A1B4B-notebook/1/s/chunks.json"
#'  #|________________________________________________________________________________|#  
#'  #|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#'  ".Rproj.user/E3EEE3A9" |> list.files(recursive = TRUE) |> dput()
#'  # > ".Rproj.user/E3EEE3A9" |> list.files(recursive = TRUE) |> dput() ----  
#' -c("build_options", "copilot_options", "pcs/debug-breakpoints.pper", 
#' +.Rproj.user.E3EEE3A9.list.files1 = c("build_options", "copilot_options", "pcs/debug-breakpoints.pper", 
#'  "pcs/files-pane.pper", "pcs/packages-pane.pper", "pcs/source-pane.pper", 
#'  "pcs/windowlayoutstate.pper", "pcs/workbench-pane.pper", "persistent-state", 
#'  "saved_source_markers", "sources/prop/00965602", "sources/prop/0173D0A4", 
#' @@ -156,15 +168,40 @@ c("build_options", "copilot_options", "pcs/debug-breakpoints.pper",
#'  "sources/session-36531e49/FB61A0E1-contents", "sources/session-36531e49/FFF77695", 
#'  "sources/session-36531e49/FFF77695-contents", "sources/session-36531e49/lock_file"
#'  )
#' +#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#' +function_setdiff(".Rproj.user/E3EEE3A9" |> list.files(recursive = TRUE), .Rproj.user.E3EEE3A9.list.files1) |> str()
#' +# > function_setdiff(".Rproj.user/E3EEE3A9" |> list.files(recursive = TRUE), .Rproj.user.E3EEE3A9.list.files1) |> str()
#' +# List of 2
#' +#  $ setdiff_x_y: chr [1:25] "sources/prop/5057B9B6" "sources/prop/C8C3257E" "sources/session-bc8d1df6/10460832" "sources/session-bc8d1df6/10460832-contents" ...
#' +#  $ setdiff_y_x: chr [1:43] "sources/session-36531e49/0E61B345-contents" "sources/session-36531e49/10460832" "sources/session-36531e49/10460832-contents" "sources/session-36531e49/174795B9-contents" ...
#'  #|________________________________________________________________________________|#  
#'  #|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#'  library(jsonlite)
#'  
#' -# Define the path to the session directory
#' -session_dir <- file.path(".Rproj.user", "E3EEE3A9", "sources", "session-36531e49")
#' +# Define the path to the sources directory
#' +sources_dir <- file.path(".Rproj.user", "E3EEE3A9", "sources")
#' +
#' +# List all directories in the sources directory
#' +all_dirs <- list.dirs(sources_dir, recursive = FALSE)
#' +session_dirs <- all_dirs[grepl("session-", basename(all_dirs))]
#' +
#' +print("List of session directories:")
#' +print(session_dirs)
#'  
#' -# List all files in the session directory
#' -session_files <- list.files(session_dir, full.names = TRUE)
#' +# Check if there are any session directories
#' +if (length(session_dirs) == 0) {
#' +  stop("No session directories found.")
#' +}
#' +
#' +# Get the most recent session directory
#' +most_recent_session <- session_dirs[which.max(file.info(session_dirs)$mtime)]
#' +
#' +print(paste("Most recent session directory:", most_recent_session))
#' +
#' +# List all files in the most recent session directory
#' +session_files <- list.files(most_recent_session, full.names = TRUE)
#' +print("List of session files:")
#' +print(session_files)
#'  
#'  # Create output folder if it doesn't exist
#'  out_folder <- "recovered_untitled_files"
#' @@ -174,6 +211,8 @@ dir.create(out_folder, showWarnings = FALSE)
#'  recover_untitled_source_file <- function(metadata_file, content_file, out_folder) {
#'    # Read the metadata
#'    metadata <- fromJSON(metadata_file)
#' +  print(paste("Processing metadata file:", metadata_file))
#' +  print(metadata)
#'    
#'    # Determine the output filename
#'    if (!is.null(metadata$properties$tempName)) {
#' @@ -208,17 +247,31 @@ recover_untitled_source_file <- function(metadata_file, content_file, out_folder
#'  recovered_files <- lapply(session_files, function(file) {
#'    if (!grepl("-contents$", file)) {
#'      content_file <- paste0(file, "-contents")
#' +    print(paste("Checking file:", file))
#'      if (file.exists(content_file)) {
#' +      print(paste("Content file exists:", content_file))
#'        metadata <- fromJSON(file)
#' +      print(paste("Metadata content:", toJSON(metadata, pretty = TRUE)))
#'        if (!is.null(metadata$properties$tempName) && grepl("Untitled", metadata$properties$tempName)) {
#' -        recover_untitled_source_file(file, content_file, out_folder)
#' +        print(paste("Recovering untitled file:", file))
#' +        return(recover_untitled_source_file(file, content_file, out_folder))
#' +      } else {
#' +        print(paste("File", file, "is not untitled or has no tempName."))
#'        }
#' +    } else {
#' +      print(paste("Content file does not exist for metadata file:", file))
#'      }
#' +  } else {
#' +    print(paste("File", file, "is a content file, skipping."))
#'    }
#' +  return(NULL)
#'  })
#'  
#'  # Print the paths of recovered files
#' -str(recovered_files)
#' +print("Recovered files:")
#' +print(recovered_files)
#' +
#' +
#'  # > str(recovered_files)
#'  # List of 43
#'  #  $ : NULL
#' diff --git a/recovered_files/RStudio Server Setup.r b/recovered_files01/RStudio Server Setup.r
#' similarity index 100%
#' rename from recovered_files/RStudio Server Setup.r
#' rename to recovered_files01/RStudio Server Setup.r



