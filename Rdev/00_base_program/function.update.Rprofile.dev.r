# Define the path to the .Rprofile file in the user's home directory
r_profile_path <- file.path(Sys.getenv("HOME"), ".Rprofile")

# Function to update or add language setting
update_language_setting <- function(file_path, setting) {
  # Read the current contents of the file
  lines <- readLines(file_path, warn = FALSE)
  
  # Pattern to find existing language setting
  pattern <- "^Sys.setenv\\(LANG ="
  
  # Check if the language setting line exists
  lang_line_index <- grep(pattern, lines)
  
  # If it exists, update the line
  if (length(lang_line_index) > 0) {
    lines[lang_line_index] <- setting
  } else {
    # If not, append the setting
    lines <- c(lines, setting)
  }
  
  # Write the updated or new lines back to the file
  writeLines(lines, file_path)
}

# Define the language setting line
language_setting <- "Sys.setenv(LANG = \"en\")  # Set default language to English"

# Check if the .Rprofile file exists
if (!file.exists(r_profile_path)) {
  # Create the file if it does not exist
  file.create(r_profile_path)
}

# Update or add the language setting
update_language_setting(r_profile_path, language_setting)

# Optional: Open the file in the default text editor for manual inspection
file.edit(r_profile_path)
