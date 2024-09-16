##@ now included in env1$env.internal.source.r ----


## \$ f_updateTemplates =  ----  
# https://github.com/mkim0710/f_updateTemplates.source.r  
.tmp$objectname = "f_updateTemplates"
.tmp$object = function(list_formula) {
    #@ The Templates of RStudio (default.R, notebook.Rmd) ++++++++++++
    if (.Platform$OS.type == "windows") {.path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio")} else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"}
    if(!dir.exists(file.path(.path4APPDATA_RStudio, "templates"))) dir.create(file.path(.path4APPDATA_RStudio, "templates"))
    # # \% Edit the templates of RStudio (default.R, notebook.Rmd) ~~~~~~~~~~~~
    # "default.R" %>% file.path(.path4APPDATA_RStudio, "templates", .) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
    # "notebook.Rmd" %>% file.path(.path4APPDATA_RStudio, "templates", .) %>% {.[file.exists(.)]} |> file.edit(); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
    # \% Update the templates of RStudio (default.R, notebook.Rmd)  ~~~~~~~~~~~~
    download.file("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = file.path(.path4APPDATA_RStudio, "templates", "default.R"))
    download.file("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = file.path(.path4APPDATA_RStudio, "templates", "notebook.Rmd"))
    # for (filename.ext in c("default.R", "templates-00env1.minimum.Rmd")) {
    #     if (filename.ext %in% dir()) {
    #         env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = filename.ext, .backup_to_path="-backup", timeFormat="%y%m%d_%H", overwrite=TRUE)
    #             download.file(paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",filename.ext), destfile = filename.ext)
    #     }
    # }
    if (.Platform$OS.type == "windows") {
        # "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> source()
        # Sys.setenv(PARENT_RENDERING = "YES"); "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/templates-00env1.minimum.Rmd" |> rmarkdown::render(output_format = "html_notebook"); Sys.setenv(PARENT_RENDERING = "NO")
        for (filename.ext in c("default.R", "templates-00env1.minimum.Rmd")) {
            env1$env.internal$f_filename.ext.createBackup(backup_from_path.filename.ext = paste0("D:/OneDrive/[][Rproject]/Rproject_Rmd/",filename.ext), .backup_to_path="D:/OneDrive/[][Rproject]/-backup", timeFormat="%y%m%d_%H", overwrite=TRUE)
        }
        browseURL("D:/OneDrive/[][Rproject]/-backup")
        
        for (filename.ext in c("default.R", "templates-00env1.minimum.Rmd")) {
            download.file(paste0("https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/",filename.ext), destfile = paste0("D:/OneDrive/[][Rproject]/Rproject_Rmd/",filename.ext))
        }
    }
    
}
### @ f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name) ----
env1$env.internal$f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name = "env.internal", show_packageStartupMessage = TRUE)



