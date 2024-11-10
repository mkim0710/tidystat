
# https://chatgpt.com/c/673012da-c450-800e-81ad-6a7251d79683
# --> Now included in "env1$env.internal.source.r"

# Define the file path for the sample text file
# tmp_path = paste0(env1$path$path1,"/-tmp")
input_path_file <- "-tmp/old.ObjectName.txt"

# Define the sample text content
sample_text <- "
This is a sample text file for testing.
old.ObjectName should be replaced with new.ObjectName.
old.name should not be replaced.
OtherOld.Name should not be replaced.
Some text like _Old.Name or Old.Name_ should not be replaced.
Exact match of old.ObjectName here.
"

?writeLines
# Write the sample text to the file
writeLines(sample_text, input_path_file)

# Confirm creation
message(sprintf("Sample text file created at: %s", input_path_file %>% normalizePath(winslash = "/")))

input_path_file %>% file.edit_if_exists()



# Define the function
f_file.gsub.old.ObjectName <- function(input_path_file, old.ObjectName, new.ObjectName, output_path_file = NULL) {
    # Construct the regex pattern for word boundary including dot and underscore
    regex_pattern <- sprintf("(?<![\\w_.])%s(?![\\w_.])", gsub("\\.", "\\\\.", old.ObjectName)) # Escape the dot in old.ObjectName
    
    # Read the file content
    file_content <- readLines(input_path_file, warn = FALSE)
    
    # Replace occurrences of old.ObjectName with new.ObjectName using the regex pattern
    updated_content <- gsub(
        pattern = regex_pattern,
        replacement = new.ObjectName,
        x = file_content,
        perl = TRUE # Enable Perl-compatible regex for lookbehind
    )
    
    # Determine the output path (overwrite or save to new file)
    if (is.null(output_path_file)) {
        # output_path_file <- input_path_file # Overwrite the original file
        output_path_file = f_filename.ext.append_suffix(input_path_file, ".", "new.ObjectName")
    }
    
    # Write the updated content back to the file
    writeLines(updated_content, con = output_path_file)
    
    # Return a message
    message(sprintf("Replaced '%s' with '%s' in %s.", old.ObjectName, new.ObjectName, output_path_file))
}

# Usage example
old.ObjectName <- "old.ObjectName"
new.ObjectName <- "new.ObjectName"
output_path_file <- paste0(dirname(input_path_file), "/new.ObjectName.txt")

# Call the function
f_file.gsub.old.ObjectName(input_path_file, old.ObjectName, new.ObjectName, output_path_file)

output_path_file %>% file.edit_if_exists()
output_path_file %>% file.remove()




# Load the stringr package
library(stringr)

# Define the function
f_file.str_replace_all.old.ObjectName <- function(input_path_file, old.ObjectName, new.ObjectName, output_path_file = NULL) {
    # Construct the regex pattern for word boundary including dot and underscore
    regex_pattern <- sprintf("(?<![\\w_.])%s(?![\\w_.])", gsub("\\.", "\\\\.", old.ObjectName)) # Escape the dot in old.ObjectName
    
    # Read the file content
    file_content <- readLines(input_path_file, warn = FALSE)
    
    # Replace occurrences of old.ObjectName with new.ObjectName using the regex pattern
    updated_content <- str_replace_all(
        string = file_content,
        pattern = regex_pattern,
        replacement = new.ObjectName
    )
    
    # Determine the output path (overwrite or save to new file)
    if (is.null(output_path_file)) {
        # output_path_file <- input_path_file # Overwrite the original file
        output_path_file = f_filename.ext.append_suffix(input_path_file, ".", "new.ObjectName")
    }
    
    # Write the updated content back to the file
    writeLines(updated_content, con = output_path_file)
    
    # Return a message
    message(sprintf("Replaced '%s' with '%s' in %s.", old.ObjectName, new.ObjectName, output_path_file))
}


# Usage example
old.ObjectName <- "old.ObjectName"
new.ObjectName <- "new.ObjectName"
output_path_file <- paste0(dirname(input_path_file), "/new.ObjectName.txt")

# Call the function
f_file.gsub.old.ObjectName(input_path_file, old.ObjectName, new.ObjectName, output_path_file)

output_path_file %>% file.edit_if_exists()
# output_path_file %>% file.remove()
