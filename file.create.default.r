# file.create.default.r

# https://stackoverflow.com/questions/35158708/how-to-set-default-template-for-new-r-files-in-rstudio

# "~/.config/rstudio/templates/default.R"

# # Create a templates folder
# fs::dir_create(path = "~/AppData/Roaming/RStudio/templates")

# # Create the file
# fs::file_create("~/AppData/Roaming/RStudio/templates/default.R")

# # Open the file in RStudio to edit it
# # usethis::edit_file("~/AppData/Roaming/RStudio/templates/default.R")



# rstudioapi::navigateToFile(file.path(path4APPDATA_RStudio, filename))
if (.Platform$OS.type == "unix") {
    path4APPDATA_RStudio = "~/.config/rstudio"
} else if (.Platform$OS.type == "windows") {
    path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio")
} 

if(!dir.exists(file.path(path4APPDATA_RStudio, "templates"))) dir.create(file.path(path4APPDATA_RStudio, "templates"))
if(!file.exists(file.path(path4APPDATA_RStudio, "templates", "default.R"))) file.create(file.path(path4APPDATA_RStudio, "templates", "default.R"))
rstudioapi::navigateToFile(file.path(path4APPDATA_RStudio, "templates", "default.R"))

