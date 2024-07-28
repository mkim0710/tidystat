#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rstudio-prefs.json.navigateToFile@MAGB760M13700KF.r
# rstudio-prefs.json.navigateToFile.r
# open_rstudio-prefs.json.r
# https://stackoverflow.com/questions/50750866/rstudio-global-settings-options-export-import
# https://support.posit.co/hc/en-us/articles/200534577-Resetting-RStudio-Desktop-s-State
# https://github.com/r-lib/rappdirs/blob/main/R/utils.R
# file.edit(file.path(.path4APPDATA_RStudio, filename))
if (.Platform$OS.type == "unix") {
    .path4APPDATA_RStudio = "~/.config/rstudio"
} else if (.Platform$OS.type == "windows") {
    .path4APPDATA_RStudio = file.path(Sys.getenv("APPDATA"), "RStudio")
} 
file.edit(file.path(.path4APPDATA_RStudio, "rstudio-prefs.json"))
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# Specify the path to the RStudio preferences file
rstudio_prefs_json_path <- file.path(.path4APPDATA_RStudio, "rstudio-prefs.json")
# Specify the path for the backup file
backup_file_path <- paste0(gsub(".json$","",rstudio_prefs_json_path), "-backup", format(Sys.Date(), "%Y%m%d"), ".json")
# Copy the original file to the backup location
if (file.exists(rstudio_prefs_json_path)) {
  file.copy(rstudio_prefs_json_path, backup_file_path)
  cat("Backup of the existing preferences file created at: ", backup_file_path, "\n")
}
file.edit(backup_file_path)
# Define the JSON content as a string
rstudio_prefs_json_new <- '{
    "save_workspace": "never",
    "initial_working_directory": "~",
    "num_spaces_for_tab": 4,
    "reindent_on_paste": false,
    "highlight_r_function_calls": true,
    "rainbow_parentheses": true,
    "default_encoding": "UTF-8",
    "indent_guides": "rainbowlines",
    "editor_theme": "Twilight",
    "show_doc_outline_rmd": true,
    "pdf_previewer": "none",
    "windows_terminal_shell": "win-cmd",
    "copilot_enabled": true,
    "copilot_indexing_enabled": true,
    "jobs_tab_visibility": "shown",
    "source_with_echo": true,
    "auto_append_newline": true,
    "line_ending_conversion": "posix",
    "show_invisibles": true,
    "highlight_selected_line": true
}'
# Ask the user if they want to overwrite the existing preferences file
overwrite <- readline(prompt = "Do you want to overwrite the existing preferences file? (yes/no): ")
# Process the user's choice
if (tolower(overwrite) == "yes") {
  writeLines(rstudio_prefs_json_new, con = rstudio_prefs_json_path)
  cat("The preferences file has been overwritten.\n")
} else {
  cat("Operation aborted. The preferences file has not been overwritten.\n")
}
file.edit(file.path(.path4APPDATA_RStudio, "rstudio-prefs.json"))
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#