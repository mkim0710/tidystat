
# https://chatgpt.com/c/673012da-c450-800e-81ad-6a7251d79683
# --> Now included in "env1$env.internal.source.r"

# Define the file path for the sample text file
# tmp_path = paste0(env1$path$path1,"/-tmp")
input_path_file <- "-tmp/Old.Name.txt"

# Define the sample text content
sample_text <- "
This is a sample text file for testing.
Old.Name should be replaced with New.Name.
old.name should not be replaced.
OtherOld.Name should not be replaced.
Some text like _Old.Name or Old.Name_ should not be replaced.
Exact match of Old.Name here.
"

?writeLines
# Write the sample text to the file
writeLines(sample_text, input_path_file)

# Confirm creation
message(sprintf("Sample text file created at: %s", input_path_file %>% normalizePath(winslash = "/")))

input_path_file %>% file.edit_if_exists()



# Define the function
f_file.gsub.Old.Name <- function(input_path_file, Old.Name, New.Name, output_path = NULL) {
    # Construct the regex pattern for word boundary including dot and underscore
    regex_pattern <- sprintf("(?<![\\w_.])%s(?![\\w_.])", gsub("\\.", "\\\\.", Old.Name)) # Escape the dot in Old.Name
    
    # Read the file content
    file_content <- readLines(input_path_file, warn = FALSE)
    
    # Replace occurrences of Old.Name with New.Name using the regex pattern
    updated_content <- gsub(
        pattern = regex_pattern,
        replacement = New.Name,
        x = file_content,
        perl = TRUE # Enable Perl-compatible regex for lookbehind
    )
    
    # Determine the output path (overwrite or save to new file)
    if (is.null(output_path)) {
        output_path <- input_path_file # Overwrite the original file
    }
    
    # Write the updated content back to the file
    writeLines(updated_content, con = output_path)
    
    # Return a message
    message(sprintf("Replaced '%s' with '%s' in %s.", Old.Name, New.Name, output_path))
}

# Usage example
Old.Name <- "Old.Name"
New.Name <- "New.Name"
output_path_file <- paste0(dirname(input_path_file), "/New.Name.txt")

# Call the function
f_file.gsub.Old.Name(input_path_file, Old.Name, New.Name, output_path_file)

output_path_file %>% file.edit_if_exists()
output_path_file %>% file.remove()




# Load the stringr package
library(stringr)

# Define the function
f_file.str_replace_all.Old.Name <- function(input_path_file, Old.Name, New.Name, output_path = NULL) {
    # Construct the regex pattern for word boundary including dot and underscore
    regex_pattern <- sprintf("(?<![\\w_.])%s(?![\\w_.])", gsub("\\.", "\\\\.", Old.Name)) # Escape the dot in Old.Name
    
    # Read the file content
    file_content <- readLines(input_path_file, warn = FALSE)
    
    # Replace occurrences of Old.Name with New.Name using the regex pattern
    updated_content <- str_replace_all(
        string = file_content,
        pattern = regex_pattern,
        replacement = New.Name
    )
    
    # Determine the output path (overwrite or save to new file)
    if (is.null(output_path)) {
        output_path <- input_path_file # Overwrite the original file
    }
    
    # Write the updated content back to the file
    writeLines(updated_content, con = output_path)
    
    # Return a message
    message(sprintf("Replaced '%s' with '%s' in %s.", Old.Name, New.Name, output_path))
}



# Usage example
Old.Name <- "Old.Name"
New.Name <- "New.Name"
output_path_file <- paste0(dirname(input_path_file), "/New.Name.txt")

# Call the function
f_file.str_replace_all.Old.Name(input_path_file, Old.Name, New.Name, output_path_file)

output_path_file %>% file.edit_if_exists()
output_path_file %>% file.remove()

