# RStudioServer-setup.r
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app="https://github.com/mkim0710/tidystat/blob/master/RStudioServer-setup.r"  
# RStudio.Cloud-setup.r 
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app="https://github.com/mkim0710/tidystat/edit/master/RStudio.Cloud-setup.r"  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app="https://posit.cloud/spaces/100015/content/6373416"  # Shared Workspace@MKim0710 - github_mkim0710_tidystat
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app="https://posit.cloud/spaces/100015/content/6373521"  # Shared Workspace@v - PositCloud@v
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
# @@ Check path -----  
## @ "~" |> normalizePath(winslash="/",mustWork=NA) ====  
tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/",mustWork=NA) ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  \n", sep="  \n")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#| @MAGB760M13700KF D:/OneDrive/Documents |#
#   symbol normalizePath                           
# 1 /      D:/                                     
# 2 ~      D:/OneDrive/Documents                   
# 3 .      D:/OneDrive/[][Rproject]/github_tidystat
# 4 ..     D:/OneDrive/[][Rproject]                
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#| @Mac /Users/mkim0710 |#
#   symbol normalizePath                                                                      
# 1 /      /                                                                                  
# 2 ~      /Users/mkim0710                                                                    
# 3 .      /Users/mkim0710/Library/CloudStorage/OneDrive-Personal/[][Rproject]/github_tidystat
# 4 ..     /Users/mkim0710/Library/CloudStorage/OneDrive-Personal/[][Rproject]                
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#| @Posit.Cloud |#
#   symbol normalizePath      
# 1 /      /                  
# 2 ~      /cloud/home/r149319
# 3 .      /cloud/project     
# 4 ..     /cloud             
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#| @Rocker /home/rstudio |#
#   symbol normalizePath                
# 1 /      /                            
# 2 ~      /home/rstudio                
# 3 .      /home/rstudio/github_tidystat
# 4 ..     /home/rstudio                
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app="http://localhost:58723/files/github_tidystat/rstudio-prefs/templates/default.R"
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app="http://localhost:58723/files/github_tidystat/rstudio-prefs/templates/templates-00env1.minimum.nb.html"
##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# Rocker Setup.r

# paste0(env1$path$source_base_local,"/","-private/docker run -d -p --restart=always --name -e -v -private.sh") |> file.edit()
# # file.edit("Rocker set up.r")
# # file.edit("Rocker set up -private.r")
##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#| To paste text in the terminal use Shift + Insert. (Or Ctrl + Shift + v) |#
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________    
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
# .FileName.source.r = "function.detachAllPackages" |> paste0(".source.r"); .RelativeSubPath=r"()"|>str_replace_all("\\\\","/"); env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = file.path(.RelativeSubPath, .FileName.source.r))
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# "https://github.com/mkim0710/tidystat/blob/master/.Rprofile" %>% paste0("if (Sys.info()['sysname'] == 'Windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }") %>% {eval(parse(text=.))}  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# To check default paths in the Server.
tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/",mustWork=NA) ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n")
# "/" |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="")
# "~" |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="")
# if (Sys.info()['sysname'] == 'Windows') { "." |> normalizePath(winslash="/",mustWork=NA) |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
# ".." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# paste0("[Working Files List] ",basename(getwd()),".r") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#| @MAGB760M13700KF |#
# > env1$info$info_system_info |> utils::str()
# List of 9
#  $ GUI             : chr "RStudio"
#  $ os_type         : chr "windows"
#  $ os_sysname      : chr "Windows"
#  $ os_version      : chr "build 19045"
#  $ machine_type    : chr "x86-64"
#  $ machine_nodename: chr "MAGB760M13700KF"
#  $ machine_cpu     : chr "13th Gen Intel(R) Core(TM) i7-13700KF"
#  $ Sys.getlocale   :List of 4
#   ..$ LC_COLLATE       : chr "en_US.utf8"
#   ..$ LC_CTYPE         : chr "en_US.utf8"
#   ..$ LC_locale_NUMERIC: chr "C"
#   ..$ LC_locale_TIME   : chr "en_US.utf8"
#  $ l10n_info       :List of 5
#   ..$ localization_UTF8           : logi TRUE
#   ..$ localization_Latin1         : logi FALSE
#   ..$ localization_codeset        : NULL
#   ..$ localization_codepage       : int 65001
#   ..$ localization_system.codepage: int 65001
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#| @Mac |#
# List of 9
#  $ GUI             : chr "X11"
#  $ os_type         : chr "unix"
#  $ os_sysname      : chr "Darwin"
#  $ os_version      : chr "Darwin Kernel Version 23.6.0: Mon Jul 29 21:14:30 PDT 2024; root:xnu-10063.141.2~1/RELEASE_ARM64_T6000"
#  $ machine_type    : chr "arm64"
#  $ machine_nodename: chr "Min-Hyungs-MacBook-Pro.local"
#  $ machine_cpu     : chr "Apple M1 Max"
#  $ Sys.getlocale   :List of 4
#   ..$ LC_COLLATE       : chr "en_US.UTF-8"
#   ..$ LC_CTYPE         : chr "en_US.UTF-8"
#   ..$ LC_locale_NUMERIC: chr "C"
#   ..$ LC_locale_TIME   : chr "en_US.UTF-8"
#  $ l10n_info       :List of 5
#   ..$ localization_UTF8           : logi TRUE
#   ..$ localization_Latin1         : logi FALSE
#   ..$ localization_codeset        : chr "UTF-8"
#   ..$ localization_codepage       : NULL
#   ..$ localization_system.codepage: NULL
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#| @Posit.Cloud |#
# List of 9
#  $ GUI             : chr "X11"
#  $ os_type         : chr "unix"
#  $ os_sysname      : chr "Linux"
#  $ os_version      : chr "#22~22.04.1-Ubuntu SMP Fri Jun 14 16:31:00 UTC 2024"
#  $ machine_type    : chr "x86_64"
#  $ machine_nodename: chr "application-9677830-deployment-22791571-pss9h"
#  $ machine_cpu     : chr "AMD EPYC 7R13 Processor"
#  $ Sys.getlocale   :List of 4
#   ..$ LC_COLLATE       : chr "C.UTF-8"
#   ..$ LC_CTYPE         : chr "C.UTF-8"
#   ..$ LC_locale_NUMERIC: chr "C"
#   ..$ LC_locale_TIME   : chr "C.UTF-8"
#  $ l10n_info       :List of 5
#   ..$ localization_UTF8           : logi TRUE
#   ..$ localization_Latin1         : logi FALSE
#   ..$ localization_codeset        : chr "UTF-8"
#   ..$ localization_codepage       : NULL
#   ..$ localization_system.codepage: NULL
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#| @Rocker |#
# List of 9
#  $ GUI             : chr "RStudio"
#  $ GUI             : chr "X11"
#  $ os_type         : chr "unix"
#  $ os_sysname      : chr "Linux"
#  $ os_version      : chr "#1 SMP Thu Jan 11 04:09:03 UTC 2024"
#  $ machine_type    : chr "x86_64"
#  $ machine_nodename: chr "059a785fbdc6"
#  $ machine_cpu     : chr "13th Gen Intel(R) Core(TM) i7-13700KF"
#  $ Sys.getlocale   :List of 4
#   ..$ LC_COLLATE       : chr "en_US.utf8"
#   ..$ LC_CTYPE         : chr "en_US.utf8"
#   ..$ LC_locale_NUMERIC: chr "C"
#   ..$ LC_locale_TIME   : chr "en_US.utf8"
#  $ l10n_info       :List of 5
#   ..$ localization_UTF8           : logi TRUE
#   ..$ localization_Latin1         : logi FALSE
#   ..$ localization_codeset        : chr "UTF-8"
#   ..$ localization_codepage       : NULL
#   ..$ localization_system.codepage: NULL

##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .RelativeSubPath, .FileName.source.r ======  
#### env1$path$.RelativeSubPath_FileName.source.r ----  
# .RelativeSubPath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) {    .RelativeSubPath = env1$path$LastSourceEditorContext.path_FileNameExt |> dirname() |> env1$f$f_path.relative()  ;    ".RelativeSubPath" |> env1$f$f_ObjectName.get.dput.ECHO()    }
# if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
# .FileName.source.r = "default.template" |> paste0(".source.r")
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path_FileNameExt)) {    .SourceName_root = env1$path$LastSourceEditorContext.path_FileNameExt |> basename() |> str_replace("\\.(dev|source)\\.(r|Rmd)$"|>regex(ignore_case=TRUE), "") |> str_replace("\\.(r|Rmd)$"|>regex(ignore_case=TRUE),"")  ;    ".SourceName_root" |> env1$f$f_ObjectName.get.dput.ECHO()    }
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
env1$path$.RelativeSubPath = .RelativeSubPath
if(!exists(".SourceName_root") && exists(".FileName.source.r")) .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
.FileName.source.r = .SourceName_root |> paste0(".source.r")
env1$path$.SourceName_root = .SourceName_root
env1$path$.RelativeSubPath_FileName.dev.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.r")
env1$path$.RelativeSubPath_FileName.dev.Rmd = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".dev.Rmd")
env1$path$.RelativeSubPath_FileName.source.r = paste0(.RelativeSubPath,ifelse(.RelativeSubPath=="","","/"),.SourceName_root,".source.r")
cat("# ",'.SourceName_root = "',.SourceName_root,'"  \n',
    "#### ",env1$path$.RelativeSubPath_FileName.dev.r, "----  \n",
    "#### ",env1$path$.RelativeSubPath_FileName.dev.Rmd, "----  \n",
    "#### ",env1$path$.RelativeSubPath_FileName.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.RelativeSubPath_FileName.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'")', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.dev.Rmd,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    '# "',env1$path$source_base_local,"/",env1$path$.RelativeSubPath_FileName.source.r,'" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()', "  \n",
    sep="")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1 = env0 ----
### \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) )  ----  
# env1 = env0
# env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = file.path(.RelativeSubPath, .FileName.source.r))
##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) rstudio-prefs -----  
##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### @ rstudio-prefs ----  
#|  @ rstudio-prefs  

# file.edit(file.path(.path4APPDATA_RStudio, FileName))
if (Sys.info()["sysname"] == "Windows") {.path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio")} else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"}

file.path(.path4APPDATA_RStudio, "rstudio-prefs.json") |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()



##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
#| @Posit.Cloud |#
#   symbol normalizePath      
# 1 /      /                  
# 2 ~      /cloud/home/r149319
# 3 .      /cloud/project     
# 4 ..     /cloud             
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#| @Rocker /home/rstudio |#
#   symbol normalizePath                
# 1 /      /                            
# 2 ~      /home/rstudio                
# 3 .      /home/rstudio/github_tidystat
# 4 ..     /home/rstudio                


# #@@ Now Included in f.updateTemplates.exe.r -----
#| @@ Now Included in f.updateTemplates.exe.r -----
# ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# ##@ rstudio-prefs.json@PositCloud ----
# # file.edit("rstudio-prefs/rstudio-prefs.json@PositCloud-MH241015copilot-false.json")
# .url = "https://github.com/mkim0710/tidystat/raw/master/rstudio-prefs/rstudio-prefs.json%40PositCloud-MH241015copilot-false.json"
# ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# ##@ rstudio-prefs.json@Rocker ----
# .url = "https://github.com/mkim0710/tidystat/raw/master/rstudio-prefs/rstudio-prefs.json%40Rocker%40MAGB760M13700KF-240520.json"
# ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# 
# # "ls ~/.config/rstudio" %>% system(intern=TRUE)
# # dir("~/.config/rstudio")
# .destfile = "~/.config/rstudio/rstudio-prefs.json"
# # file.edit(.destfile)
# 
# # download.file(url = .url, destfile = .destfile)
# env1$env.internal.attach$f_url_destfile.DownloadIfDifferent(url = .url, destfile = .destfile)
# 
# 
# # Global Options > General > Save workspace to .RData on exit: Never
# # Global Options > Code > Insert spaces for tab: 4
# # Global Options > Code > Auto-indent code after paste: uncheck
# # Global Options > Code > Display > Show indent guides: check (Rainbow lines?)
# # Global Options > Code > Display > Syntax: Highlight R function calls
# # Global Options > Code > Display > Syntax: Use rainbow parentheses
# # Global Options > Appearance > Editor theme: Ambiance -void
# # Global Options > Appearance > Editor theme: Twilight (better for RMD, red for titles)
# 
# 
# 
# ##________________________________________________________________________________    
# ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ### @ templates ----  
# #|  @ templates  
# # if(!dir.exists(file.path(.path4APPDATA_RStudio, "templates"))) dir.create(file.path(.path4APPDATA_RStudio, "templates"))
# # FileNameExt = "default.R"; if(!file.exists(file.path(.path4APPDATA_RStudio, "templates", FileNameExt))) file.create(file.path(.path4APPDATA_RStudio, "templates", FileNameExt)); file.edit(file.path(.path4APPDATA_RStudio, "templates", FileNameExt))
# # FileNameExt = "notebook.Rmd"; if(!file.exists(file.path(.path4APPDATA_RStudio, "templates", FileNameExt))) file.create(file.path(.path4APPDATA_RStudio, "templates", FileNameExt)); file.edit(file.path(.path4APPDATA_RStudio, "templates", FileNameExt))



##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### @ install.packages ----  
#|  @ install.packages  
# https://gopensource.com/going-through-docker-hell-once-243199d6f7a1
for(.packagename in c("rmarkdown", "xfun")) {if(!require(.packagename,character.only=TRUE)) install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}






##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) copilot @ RStudio Server @ Rocker (not necessary in Posit.Cloud?) -----  

### @ ROOT=TRUE ----  
# https://stackoverflow.com/questions/64562427/how-to-add-rocker-verse-configuration-root-true-to-docker-compose-file

### @ PASSWORD= ----  
# https://github.com/rocker-org/rocker-versioned2/issues/237
# https://github.com/rocker-org/rocker/issues/255
# https://github.com/rocker-org/rocker-versioned2/issues/294
# https://github.com/rocker-org/rocker-versioned2/pull/298

### @ copilot-enabled=1 ------  
# https://github.com/rstudio/rstudio/issues/13612
# https://github.com/rstudio/rstudio/issues/13718
# https://chatgpt.com/c/4b8f922c-327a-4b0b-871e-18c07575a4d9

if(.Platform$OS.type == "unix") {
    if(Sys.info()["sysname"] == "Linux") {
        if("~" |> normalizePath() == "/home/rstudio") {  # @Rocker
            system("sudo R")
            system("sudo chmod 666 /etc/rstudio/rsession.conf")
            file_path <- "/etc/rstudio/rsession.conf"
            lines <- readLines(file_path, warn = FALSE)
            modified_lines <- lines[!grepl("^copilot-enabled=", lines)]
            modified_lines = c(modified_lines, "copilot-enabled=1", "")
            writeLines(modified_lines, file_path)
            file.edit(file_path)
            system("sudo chmod 644 /etc/rstudio/rsession.conf")
        } else if ("~" |> normalizePath() |> dirname() == "/cloud/home") {  # @Posit.Cloud
            
        } else if(Sys.info()["sysname"] == "Darwin") {
            
        }
    } else if(Sys.info()["sysname"] == "Windows") {
        
    }
}
##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# quit(save="no")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#| Tools > Global Options > Copilot > login |#
##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  
# __________|------  
# @@ START) git setup -----  
##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### @ .gitignore ----  
#|  @ .gitignore  

# Caution) do not forget to add .gitignore to .gitignore
# "~/.gitignore" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
# ".gitignore" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
".gitignore" |> env1$env.internal.attach$f_file.edit_vscode()


##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### @ Git/SVN > SSH Key ----  
#|  @ Git/SVN > SSH Key  
# https://github.com/maurolepore/cloudgithub
# Connecting rstudio.cloud and GitHub
# Tools > Global Options > Git/SVN > SSH key

## @ > "~" |> normalizePath(winslash="/",mustWork=NA) ----  
#### [1] "D:/OneDrive/Documents"  #@ MAGB760M13700KF ----  
#### [1] "/home/rstudio"  #@ Rocker ----  
#### [1] "/home/rstudio"  #@ Rocker ----  
path2look = "~/.ssh"; if(!dir.exists(path2look)) dir.create(path2look)
"~/.ssh/id_rsa.pub" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
"~/.ssh/id_rsa" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
"~/.ssh/id_ed25519.pub" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
"~/.ssh/id_ed25519" |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()

#| Click Tools > Global Options > Git/SVN > [Create SSH Key]
# if(!file.exists("~/.ssh/id_ed25519")) {
#     if(.Platform$OS.type == "unix") {
#         if(Sys.info()["sysname"] == "Linux") {
#             if("~" |> normalizePath() == "/home/rstudio") {  # @Rocker
#                 system('ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -q -N "" -C "mkim0710@Rocker"')
#             } else if ("~" |> normalizePath() |> dirname() == "/cloud/home") {  # @Posit.Cloud
#                 system('ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -q -N "" -C "mkim0710@Posit.Cloud"')
#             } else if(Sys.info()["sysname"] == "Darwin") {
#                 system('ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -q -N "" -C "mkim@MacOS"')
#            }
#         } else if(Sys.info()["sysname"] == "Windows") {
#                 system('ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -q -N "" -C "mkim0710@Windows"')
#         }
#     }
# }

if(FALSE) {  # Do not auto-run
    system("sudo chmod 600 ~/.ssh/id_ed25519")  # read & write for the owner
    system("sudo chmod 400 ~/.ssh/id_ed25519")  # read only for the owner
}
path_file = file.path(env1$path$path0,"-private",".ssh@Docker","id_ed25519.pub"); if(file.exists(path_file)) file.edit(path_file)
path_file = file.path(env1$path$path0,"-private",".ssh@Docker","id_ed25519"); if(file.exists(path_file)) file.edit(path_file)

system("git status")

# https://github.com/settings/keys
browseURL("https://github.com/settings/keys")
#' @Rocker@MAGB760M13700KF-240509
#' SHA256:PXJBET0lW71UCJsf7ai2UXdF9/i8vsTY3er+n+rIcx8
#' Added on May 10, 2024
#' @Rocker@MAGB760M13700KF-241012
#' SHA256:j6KHOmd+yakjqAWUgK2jX2TWTFEDoMSHzhQPp4fGJA0
#' Added on Oct 12, 2024
#' -> To check SHA256 of the public key in my PC, run the following command:
#' ssh-keygen -lf ~/.ssh/id_ed25519.pub

base64_fingerprint = "~/.ssh/id_ed25519.pub" |> readLines() |> str_extract(" .*? ") |> str_replace_all(" ","") |>
    base64_decode() |> sha256() |> base64_encode()
base64_fingerprint |> str_length()
# 256 bits (32 bytes) = 64 (=256/4) hexadecimal characters = 42.67 (=256/6) ASCII characters in base64 
# Cf) 6 bits per character => 2^6 = 64 different ASCII character in base64 encoding
base64_fingerprint |> str_replace_all("=$", "")  # Remove padding from the end of the string, making 43 characters
base64_fingerprint |> str_replace_all("=$", "") |> str_replace_all("\\+", "-") |> str_replace_all("\\/", "_")  # Replace + with - and / with _ to make it URL safe


##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### @ git config --global user.email "mkim0710@gmail.com" ----  
### @ git config --global user.name "mhkim@rocker@MAGB760M13700KF" ----  
#|  @ git config --global user.email "mkim0710@gmail.com"  
#|  @ git config --global user.name "mhkim@rocker@MAGB760M13700KF"  
# >>> /usr/bin/git commit -F /tmp/Rtmpw9zfpP/git-commit-message-8a2e196d1d.txt --amend
# *** Please tell me who you are.
# Run
#   git config --global user.email "you@example.com"
#   git config --global user.name "Your Name"
# to set your account's default identity.
# Omit --global to set the identity only in this repository.
# fatal: unable to auto-detect email address (got 'rstudio-user@application-3089508-deployment-7850965-gpdff.(none)')

# If necessary configure git
# To paste text in the terminal use Shift + Insert.
# git config --global user.email "USEREMAIL@gmail.com"
# git config --global user.name "USERNAME"


system('git config --global user.email "mkim0710@gmail.com"')

# system('git config --global user.email "mhkim710@gmail.com"')
if(.Platform$OS.type == "unix") {
    if(Sys.info()["sysname"] == "Linux") {
        if("~" |> normalizePath() == "/home/rstudio") {  # @Rocker
            system('git config --global user.name "mhkim@rocker@MAGB760M13700KF"')
        } else if ("~" |> normalizePath() |> dirname() == "/cloud/home") {  # @Posit.Cloud
            system('git config --global user.name "mkim0710@Posit.Cloud"')
        } else if(Sys.info()["sysname"] == "Darwin") {
            system('git config --global user.name "mkim@MacOS"')
        }
    } else if(Sys.info()["sysname"] == "Windows") {
        # system('git config --global user.name "mkim@Windows"')
    }
}


##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### @ git remote set-url origin git@github.com:mkim0710/Rproject_.git ----  
#|  @ git remote set-url origin git@github.com:mkim0710/Rproject_.git  
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
# # git remote set-url origin git@github.com:USERNAME/REPOSITORY.git
# git config remote.origin.url git@github.com:USERNAME/REPOSITORY.git
# git remote -v

git.remote.v = "git remote -v" |> system(intern=TRUE)
git.remote.v |> dput()
c("origin\thttps://github.com/mkim0710/RprojectAgePeriodCohort.git (fetch)", 
  "origin\thttps://github.com/mkim0710/RprojectAgePeriodCohort.git (push)")
# > system("git remote -v")
# origin	https://github.com/mkim0710/tidystat (fetch)
# origin	https://github.com/mkim0710/tidystat (push)

git.remote.v2 = git.remote.v %>% str_replace("^origin\\t", "") %>% str_replace(" \\((fetch|push)\\)$", "") %>% 
  str_replace("https://github.com/", "git@github.com:") |> unique()
git.remote.v2
# [1] "git@github.com:mkim0710/RprojectAgePeriodCohort.git"

# system("git remote set-url origin git@github.com:mkim0710/REPOSITORY.git")
# system("git config remote.origin.url git@github.com:mkim0710/tidystat.git")
paste0("git config remote.origin.url ", git.remote.v2) |> system(intern = TRUE)

system("git remote -v")
# > system("git remote -v")
# origin	git@github.com:mkim0710/tidystat.git (fetch)
# origin	git@github.com:mkim0710/tidystat.git (push)


##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### @ install-git-hooks.sh ----  
#|  @ install-git-hooks.sh  
# To ignore csv files > 10 MB
# "cp git/hooks/pre-commit .git/hooks/pre-commit" |> system(intern = TRUE)
# "chmod +x .git/hooks/pre-commit" |> system(intern = TRUE)
"chmod +x git/hooks/install-git-hooks.sh" |> system(intern = TRUE)
"./git/hooks/install-git-hooks.sh" |> system(intern = TRUE)

##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### @ git config --global pull.rebase false ----  
#|  @ git config --global pull.rebase false  
#|  
# hint: You have divergent branches and need to specify how to reconcile them.
# hint: You can do so by running one of the following commands sometime before
# hint: your next pull:
# hint: 
# hint:   git config pull.rebase false  # merge (the default strategy)
# hint:   git config pull.rebase true   # rebase
# hint:   git config pull.ff only       # fast-forward only
# hint: 
# hint: You can replace "git config" with "git config --global" to set a default
# hint: preference for all repositories. You can also pass --rebase, --no-rebase,
# hint: or --ff-only on the command line to override the configured default per
# hint: invocation.
# fatal: Need to specify how to reconcile divergent branches.

"git config --global pull.rebase false" |> system(intern = TRUE)
## @ -> This is the default behavior of git pull. So, you don't need to set it.???
## @ -> Even though the default strategy is merge, Git requires an explicit confirmation in some situations, especially when dealing with divergent branches.~!!!
"git config --global pull.rebase" |> system(intern = TRUE)
# > system("git config --global pull.rebase")
# false

##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ git lfs install
"sudo apt-get update" |> system(intern = TRUE)
"sudo apt-get install -y curl ca-certificates" |> system(intern = TRUE)
"curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash" |> system(intern = TRUE)
"sudo apt-get install -y git-lfs" |> system(intern = TRUE)

##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) Posit.Cloud -----  
##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### @ file upload ----  
#|  @ file upload  
# https://community.rstudio.com/t/how-can-i-upload-csv-or-excel-files-existing-in-computer-to-rstudio-cloud/23621



##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### @ Posit.Cloud: Resources> RAM 0.5, CPU 0.5, Background 1 hr -----  
#|  @ Posit.Cloud: Resources> RAM 0.5, CPU 0.5, Background 1 hr |#
# https://support.posit.co/hc/en-us/articles/4422648539031-Compute-Hours-and-the-Background-Execution-Limit-in-Posit-Cloud#:~:text=Compute%20hours%20are%20calculated%20based,based%20on%20the%20current%20plan.
# Resources> RAM 0.5, CPU 0.5, Background 1 hr
# Cf) Cloud Free: 25 hrs/month
# Cf) Cloud Student ($5/month): 75 hrs/month





##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) Install Fonts -----  


##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) Install Fonts for RStudio Server Editor pane -----  
# https://github.com/rstudio/rstudio/issues/2534
# Just for future searchers: you can now add fonts to /etc/rstudio/fonts and then change the ‘Editor font’ using the UI.
# So I’m just pasting the contents of /etc/rstudio/fonts/README.md here, I’m on RStudio Server 2022.07.0 on Ubuntu Server 22.04 LTS:

# This directory structure would make two fonts available, *Coding-Font* and
# *Coding Font Two*.

# Some fonts come in many different weights and styles. If you want these weights
# and styles to be treated as single font, you can place them underneath a single
# folder. This is useful when a theme uses bold or italic variants of a font to
# decorate code (e.g., to set comments in italics).

# To do this, create subfolders with the font's weight or style. For example,
# this creates a single font, "Coding Font 3", which has two weights (400 and 700
# for regular and bold, respectively) and an italic style for each weight.

#     + fonts/
#     |
#     +-- Coding Font Three/
#         |
#         +-- 400/
#         |   |
#         |   +-- CodingFont3-Regular.woff
#         |   |
#         |   +-- italic/
#         |       |
#         |       +-- CodingFont3-Italic.woff
#         |
#         +-- 700/
#             |
#             +-- CodingFont3-Bold.woff
#             |
#             +-- italic/
#                 |
#                 +-- CodingFont3-BoldItalic.woff



##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) install.packages -----  
# install.packages(.tmp$packagename, type = "binary")  # If the installed R version is too old?
# install.packages(.tmp$packagename, type = "source")  # If the installed R version is too new?
##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### @ checkpoint ----  
# # https://community.rstudio.com/t/using-library-checkpoint-in-rstudio-cloud/
# # https://packagemanager.rstudio.com/client/#/repos/2/overview
# # options(repos = c(CRAN= "https://packagemanager.rstudio.com/cran/302"))  # snapshot for 2020-07-16
# options(repos = c(CRAN= "https://packagemanager.rstudio.com/cran/__linux__/xenial/302"))  # snapshot for 2020-07-16, binary for Ubuntu 16.04 (Xenial)

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# for(.packagename in c("tidyverse")) {if(!require(.packagename,character.only=TRUE)) install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}  
# remove.packages(c("tidyverse", "dplyr", "purrr", "stringr", "forcats", "readr", "ggplot2", "tibble", "lubridate", "tidyr"))
# for(.packagename in c("tidyverse")) {
# for(.packagename in c("dplyr", "purrr", "stringr", "forcats", "readr", "ggplot2", "tibble", "lubridate", "tidyr")) {
for(.packagename in c("dplyr", "purrr", "stringr")) {
    tryCatch({
        if(!require(.packagename, character.only=TRUE)) {
            stop(paste0("Package ", .packagename, " is not installed. Please install it before running this script.  \n install.packages(",deparse(.packagename),")"))
        }
    }, error = function(e) {
        # Additional code to handle the error or provide fallback options
        # Print a warning message but allow R to continue
        warning("Error in .Rprofile: ", e$message, "\n", call. = FALSE, immediate. = TRUE)
    })
}  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# for(.packagename in c("icd")) {if(!require(.packagename,character.only=TRUE)) install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}
# # https://packagemanager.rstudio.com/client/#/repos/1/packages/icd




##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_FileNameExt) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
