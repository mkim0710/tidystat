# file.create.default.r

# https://stackoverflow.com/questions/35158708/how-to-set-default-template-for-new-r-files-in-rstudio

# "~/.config/rstudio/templates/default.R"

# # Create a templates folder
# fs::dir_create(path = "~/AppData/Roaming/RStudio/templates")

# # Create the file
# fs::file_create("~/AppData/Roaming/RStudio/templates/default.R")

# # Open the file in RStudio to edit it
# # usethis::edit_file("~/AppData/Roaming/RStudio/templates/default.R")



# file.edit(here::here(.path4APPDATA_RStudio, FileName))
if (Sys.info()["sysname"] == "Windows") {.path4APPDATA_RStudio = here::here(Sys.getenv("APPDATA"), "RStudio")} else if (.Platform$OS.type == "unix") {.path4APPDATA_RStudio = "~/.config/rstudio"}

if(!dir.exists(here::here(.path4APPDATA_RStudio, "templates"))) dir.create(here::here(.path4APPDATA_RStudio, "templates"))
FileNameExt = "default.R"; if(!file.exists(here::here(.path4APPDATA_RStudio, "templates", FileNameExt))) file.create(here::here(.path4APPDATA_RStudio, "templates", FileNameExt)); file.edit(here::here(.path4APPDATA_RStudio, "templates", FileNameExt))
FileNameExt = "notebook.Rmd"; if(!file.exists(here::here(.path4APPDATA_RStudio, "templates", FileNameExt))) file.create(here::here(.path4APPDATA_RStudio, "templates", FileNameExt)); file.edit(here::here(.path4APPDATA_RStudio, "templates", FileNameExt))

