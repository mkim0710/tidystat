# RStudio.Cloud set up.r 
# https://posit.cloud/spaces/100015/content/6373416  # Shared Workspace@MKim0710 - github_mkim0710_tidystat
# https://posit.cloud/spaces/404673/content/6373521  # Shared Workspace@v - PositCloud@v

# # To paste text in the terminal use Shift + Insert. (Or Ctrl + Shift + v)

"/" |> normalizePath()
"~" |> normalizePath()
"." |> normalizePath()
## @ mac ------  
# > "/" |> normalizePath()
# [1] "/"
# > "~" |> normalizePath()
# [1] "/Users/mkim0710"
# > "." |> normalizePath()
# [1] "/Users/mkim0710/Library/CloudStorage/OneDrive-Personal/[][Rproject]/github_tidystat"




"/" |> list.dirs(recursive = FALSE) |> normalizePath() |> dput()
"~" |> list.dirs(recursive = FALSE) |> normalizePath() |> dput()
"." |> list.dirs(recursive = FALSE) |> normalizePath() |> dput()
# > "/" |> list.dirs(recursive = FALSE) |> normalizePath() |> dput()
# c("/usr/bin", "/boot", "/dev", "/etc", "/home", "/usr/lib", "/usr/lib32", 
# "/usr/lib64", "/libexec", "/usr/libx32", "/media", "/mnt", "/opt", 
# "/proc", "/rocker_scripts", "/root", "/run", "/usr/sbin", "/srv", 
# "/sys", "/tmp", "/usr", "/var")
# > "~" |> list.dirs(recursive = FALSE) |> normalizePath() |> dput()
# c("/home/rstudio/-backup", "/home/rstudio/.cache", "/home/rstudio/.config", 
# "/home/rstudio/.local", "/home/rstudio/.ssh", "/home/rstudio/github_tidystat"
# )
# > "." |> list.dirs(recursive = FALSE) |> normalizePath() |> dput()
# c("/home/rstudio/github_tidystat/.git", "/home/rstudio/github_tidystat/.github", 
# "/home/rstudio/github_tidystat/.Rproj.user", "/home/rstudio/github_tidystat/data", 
# "/home/rstudio/github_tidystat/examples", "/home/rstudio/github_tidystat/git", 
# "/home/rstudio/github_tidystat/other", "/home/rstudio/github_tidystat/Rdev", 
# "/home/rstudio/github_tidystat/Rmd", "/home/rstudio/github_tidystat/Rplot", 
# "/home/rstudio/github_tidystat/rstudio-prefs")


# file.edit(file.path(.path4APPDATA_RStudio, filename))
if (Sys.info()["sysname"] == "Windows") {.path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio")} else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"}

file.edit(file.path(.path4APPDATA_RStudio, "rstudio-prefs.json"))

if(!dir.exists(file.path(.path4APPDATA_RStudio, "templates"))) dir.create(file.path(.path4APPDATA_RStudio, "templates"))
filename.ext = "default.R"; if(!file.exists(file.path(.path4APPDATA_RStudio, "templates", filename.ext))) file.create(file.path(.path4APPDATA_RStudio, "templates", filename.ext)); file.edit(file.path(.path4APPDATA_RStudio, "templates", filename.ext))
filename.ext = "notebook.Rmd"; if(!file.exists(file.path(.path4APPDATA_RStudio, "templates", filename.ext))) file.create(file.path(.path4APPDATA_RStudio, "templates", filename.ext)); file.edit(file.path(.path4APPDATA_RStudio, "templates", filename.ext))



# Global Options > General > Save workspace to .RData on exit: Never
# Global Options > Code > Insert spaces for tab: 4
# Global Options > Code > Auto-indent code after paste: uncheck
# Global Options > Code > Display > Show indent guides: check (Rainbow lines?)
# Global Options > Code > Display > Syntax: Highlight R function calls
# Global Options > Code > Display > Syntax: Use rainbow parentheses
# Global Options > Appearance > Editor theme: Ambiance -void
# Global Options > Appearance > Editor theme: Twilight (better for RMD, red for titles)
# Global Options > Git/SVN > SSH RSA key
file.edit("/home/rstudio/.ssh/id_ed25519.pub")
file.edit("/home/rstudio/.ssh/id_ed25519")
system("git status")

# https://support.posit.co/hc/en-us/articles/4422648539031-Compute-Hours-and-the-Background-Execution-Limit-in-Posit-Cloud#:~:text=Compute%20hours%20are%20calculated%20based,based%20on%20the%20current%20plan.
# Resources> RAM 0.5, CPU 0.5, Background 1 hr
# Cf) Cloud Free: 25 hrs/month
# Cf) Cloud Student ($5/month): 75 hrs/month

for(.packagename in c("tidyverse", "datapasta")) {if(!require(.packagename,character.only=TRUE)) install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}


# https://community.rstudio.com/t/using-library-checkpoint-in-rstudio-cloud/
# https://packagemanager.rstudio.com/client/#/repos/2/overview
# options(repos = c(CRAN= "https://packagemanager.rstudio.com/cran/302"))  # snapshot for 2020-07-16
options(repos = c(CRAN= "https://packagemanager.rstudio.com/cran/__linux__/xenial/302"))  # snapshot for 2020-07-16, binary for Ubuntu 16.04 (Xenial)

for(.packagename in c("icd")) {if(!require(.packagename,character.only=TRUE)) install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}
# https://packagemanager.rstudio.com/client/#/repos/1/packages/icd

# https://github.com/maurolepore/cloudgithub
# Connecting rstudio.cloud and GitHub
# Tools > Global options > Git > Create key
# https://github.com/settings/keys

file.edit("/home/rstudio/.ssh/id_ed25519.pub")

# >>> /usr/bin/git commit -F /tmp/Rtmpw9zfpP/git-commit-message-8a2e196d1d.txt --amend
# 
# *** Please tell me who you are.
# 
# Run
# 
#   git config --global user.email "you@example.com"
#   git config --global user.name "Your Name"
# 
# to set your account's default identity.
# Omit --global to set the identity only in this repository.
# 
# fatal: unable to auto-detect email address (got 'rstudio-user@application-3089508-deployment-7850965-gpdff.(none)')

# # If necessary configure git
# # To paste text in the terminal use Shift + Insert.
# # git config --global user.email "USEREMAIL@gmail.com"
# # git config --global user.name "USERNAME"
system('git config --global user.email "mkim0710@gmail.com"')
system('git config --global user.name "mkim0710@RStudio.Cloud"')

# system('git config --global user.email "mhkim710@gmail.com"')
# system('git config --global user.name "mhkim@rocker@MAGB760M13700KF"')




# https://happygitwithr.com/ssh-keys.html#ssh-keys
# How to see the remote URL(s) associated with the current repo in the shell:
# git remote -v
# 
# An SSH remote will look like this:
# git@github.com:USERNAME/REPOSITORY.git
# 
# whereas an HTTPS remote will look like this:
# https://github.com/USERNAME/REPOSITORY.git
# 
# https://docs.github.com/en/free-pro-team@latest/github/using-git/changing-a-remotes-url
# git remote -v
# git remote set-url origin git@github.com:USERNAME/REPOSITORY.git
# git remote -v

system("git remote -v")
# > system("git remote -v")
# origin	https://github.com/mkim0710/tidystat (fetch)
# origin	https://github.com/mkim0710/tidystat (push)

# system("git remote set-url origin git@github.com:mkim0710/REPOSITORY.git ")
system("git remote set-url origin git@github.com:mkim0710/tidystat.git ")

system("git remote -v")
# > system("git remote -v")
# origin	git@github.com:mkim0710/tidystat.git (fetch)
# origin	git@github.com:mkim0710/tidystat.git (push)



# https://community.rstudio.com/t/how-can-i-upload-csv-or-excel-files-existing-in-computer-to-rstudio-cloud/23621


# Caution) do not forget to add .gitignore to .gitignore
file.edit(".gitignore")






# @@ END----  

