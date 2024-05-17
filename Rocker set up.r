# Rocker set up -private.r 
# Rocker set up.r 
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
# if(!exists("env.custom", envir=.GlobalEnv))
#     assign("env.custom", new.env(), envir=.GlobalEnv)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")){if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
## env.custom\$path ====
# path2look = "/"; normalizePath(path2look,winslash="/"); dir(path2look,all.files=TRUE,include.dirs=TRUE);
# path2look = "~"; normalizePath(path2look,winslash="/"); dir(path2look,all.files=TRUE,include.dirs=TRUE);
# path2look = "."; normalizePath(path2look,winslash="/"); dir(path2look,all.files=TRUE,include.dirs=TRUE);
if(!"path" %in% names(env.custom)) env.custom$path = list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)
objectname = "getwd"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};




file.edit("-private/docker run -d -p --restart=always --name -e -v -private.sh")
file.edit("Rocker set up.r")
# file.edit("Rocker set up -private.r")


# # To paste text in the terminal use Shift + Insert. (Or Ctrl + Shift + v)


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


# file.edit(file.path(path4APPDATA_RStudio, filename))
if (.Platform$OS.type == "windows") {path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio")} else if (.Platform$OS.type == "unix") {path4APPDATA_RStudio = "~/.config/rstudio"}

file.edit(file.path(path4APPDATA_RStudio, "rstudio-prefs.json"))

if(!dir.exists(file.path(path4APPDATA_RStudio, "templates"))) dir.create(file.path(path4APPDATA_RStudio, "templates"))
filename.ext = "default.R"; if(!file.exists(file.path(path4APPDATA_RStudio, "templates", filename.ext))) file.create(file.path(path4APPDATA_RStudio, "templates", filename.ext)); file.edit(file.path(path4APPDATA_RStudio, "templates", filename.ext))
filename.ext = "notebook.Rmd"; if(!file.exists(file.path(path4APPDATA_RStudio, "templates", filename.ext))) file.create(file.path(path4APPDATA_RStudio, "templates", filename.ext)); file.edit(file.path(path4APPDATA_RStudio, "templates", filename.ext))



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





for (packagename in c("tidyverse", "datapasta")) {
  if(packagename %in% installed.packages()[,"Package"]) {   
    warning(paste0(packagename, ' %in% installed.packages()[,"Package"])'))
    # If that package is already installed, then just load it. (You don't want to re-install if it is already installed.)
    require(packagename,character.only=TRUE)
  } else {  
    # If that package is not already installed, then install first.
    install.packages(packagename)
    # install.packages(packagename, type = "binary")  # I am installing via "binary" because the installed R version is too old.
    require(packagename,character.only=TRUE)
  }
}


# https://community.rstudio.com/t/using-library-checkpoint-in-rstudio-cloud/
# https://packagemanager.rstudio.com/client/#/repos/2/overview
# options(repos = c(CRAN= "https://packagemanager.rstudio.com/cran/302"))  # snapshot for 2020-07-16
options(repos = c(CRAN= "https://packagemanager.rstudio.com/cran/__linux__/xenial/302"))  # snapshot for 2020-07-16, binary for Ubuntu 16.04 (Xenial)

for (packagename in c("icd")) {
    if(packagename %in% installed.packages()[,"Package"]) {   
        # If that package is already installed, then just load it. (You don't want to re-install if it is already installed.)
        warning(paste0(packagename, ' %in% installed.packages()[,"Package"])'))
        require(packagename,character.only=TRUE)
    } else {  
        # If that package is not already installed, then install first.
        install.packages(packagename)
        # install.packages(packagename, type = "binary")  # I am installing via "binary" because the installed R version is too old.
        require(packagename,character.only=TRUE)
    }
}
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
# system('git config --global user.email "mkim0710@gmail.com"')
# system('git config --global user.name "mkim0710@RStudio.Cloud"')

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



#@ ROOT=TRUE ----
# https://stackoverflow.com/questions/64562427/how-to-add-rocker-verse-configuration-root-true-to-docker-compose-file

#@ PASSWORD= ----
# https://github.com/rocker-org/rocker-versioned2/issues/237
# https://github.com/rocker-org/rocker/issues/255
# https://github.com/rocker-org/rocker-versioned2/issues/294
# https://github.com/rocker-org/rocker-versioned2/pull/298

# @ copilot-enabled=1 ------
# https://github.com/rstudio/rstudio/issues/13612
# https://github.com/rstudio/rstudio/issues/13718
# https://chatgpt.com/c/4b8f922c-327a-4b0b-871e-18c07575a4d9

system("sudo R")
system("sudo chmod 666 /etc/rstudio/rsession.conf")
file_path <- "/etc/rstudio/rsession.conf"
lines <- readLines(file_path, warn = FALSE)
modified_lines <- lines[!grepl("^copilot-enabled=", lines)]
modified_lines = c(modified_lines, "copilot-enabled=1", "")
writeLines(modified_lines, file_path)
file.edit(file_path)
system("sudo chmod 644 /etc/rstudio/rsession.conf")


#@ end ----

