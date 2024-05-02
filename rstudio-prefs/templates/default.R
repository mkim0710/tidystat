# sourcename = "default.template"
# default.template.dev.r
# default.template.source.r
#         https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.template.dev.r
# source("https://github.com/mkim0710/tidystat/raw/master/rstudio-prefs/templates/default.template.source.r")
# ################################################################################
# --------------------------------------------------------------------------------
# ================================================================================
# --------------------------------------------------------------------------------
# ################################################################################
Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
# ################################################################################
# --------------------------------------------------------------------------------
# ================================================================================
# --------------------------------------------------------------------------------
# ################################################################################
subpath = "rstudio-prefs/templates"
sourcename = "default.template"
# ================================================================================
if(!exists("env.custom", envir=.GlobalEnv)) assign("env.custom", new.env(), envir=.GlobalEnv)
if(!"info" %in% names(env.custom)) env.custom$info = list()
if(!"path" %in% names(env.custom)) env.custom$path = list()
objectname = "source_base_local"; object = "D:/OneDrive/[][Rproject]/github_tidystat"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)  
env.custom$path$source_base_github_blob = "https://github.com/mkim0710/tidystat/blob/master"
env.custom$path$subpath = subpath
env.custom$path$sourcename = sourcename
env.custom$path$dev.subpath.filename.ext = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.r")
env.custom$path$source.subpath.filename.ext = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r")
cat("# ",'sourcename = "',sourcename,'"', "\n",
    "# ",sourcename,".dev.r", "\n",
    "# ",sourcename,".source.r", "\n",
    '#         ',env.custom$path$source_base_github_blob,"/",env.custom$path$dev.subpath.filename.ext, "\n",
    '# source("',env.custom$path$source_base_github,"/",env.custom$path$source.subpath.filename.ext,'")', "\n",
    '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$dev.subpath.filename.ext,'")', "\n",
    '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$source.subpath.filename.ext,'")', "\n",
    sep="")
env.custom$path$current.path.filename.ext=rstudioapi::getSourceEditorContext()$path 
if(!file.exists(env.custom$path$dev.subpath.filename.ext)) file.create(env.custom$path$dev.subpath.filename.ext); file.edit(env.custom$path$dev.subpath.filename.ext); file.edit(env.custom$path$current.path.filename.ext);
if(!file.exists(env.custom$path$source.subpath.filename.ext)) file.create(env.custom$path$source.subpath.filename.ext); file.edit(env.custom$path$source.subpath.filename.ext); file.edit(env.custom$path$current.path.filename.ext);















# ################################################################################
# --------------------------------------------------------------------------------
# ================================================================================
# --------------------------------------------------------------------------------
# ################################################################################
# --------------------------------------------------------------------------------
# ================================================================================
# --------------------------------------------------------------------------------
# ################################################################################
# --------------------------------------------------------------------------------
# ================================================================================
# --------------------------------------------------------------------------------
# ################################################################################
# --------------------------------------------------------------------------------
# ================================================================================
# --------------------------------------------------------------------------------
# ################################################################################
# @@ update default.R -----
env.custom$path$default.filename.ext = "default.R"
env.custom$path$current.path.filename.ext=rstudioapi::getSourceEditorContext()$path; 

if(env.custom$path$default.filename.ext == basename(env.custom$path$current.path.filename.ext)) {
    if (.Platform$OS.type == "windows") {path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio") %>% str_replace_all("\\\\","/")} else if (.Platform$OS.type == "unix") {path4APPDATA_RStudio = "~/.config/rstudio"} ;
    if(!dir.exists(file.path(path4APPDATA_RStudio, "templates"))) dir.create(file.path(path4APPDATA_RStudio, "templates")) ;
    
    env.custom$path$destination.path.filename.ext = file.path(path4APPDATA_RStudio, "templates", "default.R"); 
    if(file.copy(from=env.custom$path$current.path.filename.ext, to=env.custom$path$destination.path.filename.ext, overwrite=TRUE)) message(paste0("Update successful: ", env.custom$path$destination.path.filename.ext)) else warning(paste0("Update failed: ", env.custom$path$destination.path.filename.ext)); 
    if (.Platform$OS.type == "windows") {shell(paste0("notepad.exe ",env.custom$path$destination.path.filename.ext),wait=FALSE)} else if (.Platform$OS.type == "unix") {system(paste0("open -a TextEdit ",env.custom$path$destination.path.filename.ext),wait=FALSE)};
    for ( destination.path.filename.ext in c(
        file.path(env.custom$path$source_base_local, "rstudio-prefs", "templates", env.custom$path$default.filename.ext)
        , file.path(env.custom$path$path0, "Rproject_Rmd", env.custom$path$default.filename.ext)
    )) {if(env.custom$path$current.path.filename.ext != destination.path.filename.ext) {
        if(file.copy(from=env.custom$path$current.path.filename.ext, to=destination.path.filename.ext, overwrite=TRUE)) message(paste0("Update successful: ", destination.path.filename.ext)) else warning(paste0("Update failed: ", destination.path.filename.ext));
        if (.Platform$OS.type == "windows") {shell(paste0("notepad.exe ",destination.path.filename.ext),wait=FALSE)} else if (.Platform$OS.type == "unix") {system(paste0("open -a TextEdit ",destination.path.filename.ext),wait=FALSE)};
    }}
    file.edit(env.custom$path$current.path.filename.ext);
}
# ################################################################################
# --------------------------------------------------------------------------------
# ================================================================================
# --------------------------------------------------------------------------------
# ################################################################################
# --------------------------------------------------------------------------------
# ================================================================================
# --------------------------------------------------------------------------------
# ################################################################################
# --------------------------------------------------------------------------------
# ================================================================================
# --------------------------------------------------------------------------------
# ################################################################################
# --------------------------------------------------------------------------------
# ================================================================================
# --------------------------------------------------------------------------------
# ################################################################################