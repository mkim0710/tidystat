# https://github.com/mkim0710/tidystat/blob/master/function.update.Rprofile.dev.r
# https://github.com/mkim0710/tidystat/edit/master/function.Sys.setenv.dev.r
# ################################################################################
# --------------------------------------------------------------------------------
# ================================================================================
# --------------------------------------------------------------------------------
# ################################################################################

# Function to search and modify or create .Rprofile for setting locale
function2find = "Sys.setlocale"
function2rewrite = "Sys.setlocale('LC_ALL', 'en_US.UTF-8')"

# Paths to search for .Rprofile
paths4Rprofile <- c("./.Rprofile", "~/.Rprofile")

# Initialize variable
path4Rprofile <- NULL

# Check if the .Rprofile file exists
for (path in paths4Rprofile) {
  if (file.exists(path)) {
    cat(paste0("Found the file: ", path, "\n"))
    path4Rprofile <- path
    break
  }
}

# Process the .Rprofile file if found
if (!is.null(path4Rprofile)) {
  # Read the contents of the .Rprofile file
  profile_content <- readLines(path4Rprofile)
  
  # Check if the language setting already exists in the file
  if (any(grepl(function2find, profile_content))) {
    cat("Language setting already exists in .Rprofile. Updating...\n")
    profile_content <- gsub(paste0(function2find, ".*?$"), "", profile_content, perl = TRUE)
  } else {
    cat("Adding language setting to .Rprofile...\n")
  }
  # Append the new setting
  profile_content <- c(profile_content, function2rewrite)
  
  # Write the updated contents back to the .Rprofile file
  writeLines(profile_content, path4Rprofile)
} else {
  # Prompt for creating a new .Rprofile if none exists
  createRprofile <- tolower(readline(prompt = "Do you want to create a new Rprofile file? (yes/no): "))
  
  # Create .Rprofile if user confirms
  if (createRprofile == "yes" || createRprofile == "y") {
    cat("Creating new .Rprofile with language setting...\n")
    writeLines(function2rewrite, "~/.Rprofile")
    cat("Created -- ~/.Rprofile -- with: ", function2rewrite, ".\n")
  } else {
    cat("Operation aborted. No .Rprofile file created.\n")
  }
}

# ################################################################################
# --------------------------------------------------------------------------------
# ================================================================================
# --------------------------------------------------------------------------------
# ################################################################################

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










