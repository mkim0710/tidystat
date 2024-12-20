
# --> Now included in "env1$env.internal.source.r"
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://chatgpt.com/g/g-p-676526fc1c848191a84f233bacf2df34-regex/c/67651b58-d21c-800e-9f60-b8d16e9a13a7
# Cf) (?!NegativeLookahead)MainPatternToMatch
# e.g.) (?!abc)XYZ DOES match "abcXYZ", because when looking at the point of "(", there was no "abc" ahead (after) "(".  → rarely makes sense???
# e.g.) remove all non-heading lines, when heading lines starts with "# @" 
# ^(?!# @).*: DOES match all lines that DOES NOT start with "# @", because when looking at the point of "(", which is at the beginning of a line (^), there should be no "# @" ahead (after) "(".
# Alternative:
# Search: ^(# @.*)?.*
# Replace to: $1

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  ----  
#@@ Heading 1 ----


##@ Heading 1.1 ----

# @@ Heading 2 ====

## @ Heading 2.1 ----


# Load the stringr package
library(stringr)

# Define the function
f_file.str_subset.lines4heading <- function(input_path_file = rstudioapi::getSourceEditorContext()$path, RegEx4heading = "^#.*(-{4}|={4}) *$", new.ObjectName, output_path_file = NULL, replace_input_path_file = FALSE) {
    
    # Read the file content
    input_path_file.readLines <- readLines(input_path_file, warn = FALSE)
    
    # Replace occurrences of old.ObjectName with new.ObjectName using the regex pattern
    input_path_file.readLines.str_subset <- str_subset(
        string = input_path_file.readLines,
        pattern = RegEx4heading,
        negate = FALSE
    )
    
    input_path_file.readLines.str_subset = input_path_file.readLines.str_subset %>% str_replace_all("(-{4,}|={4,})( *)$", "\\2")
    
    input_path_file.readLines.str_subset = 
        c(
            "##HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH##  ",
            "# @@@ TABLE OF CONTENTS @@@ ----  ", 
            input_path_file.readLines.str_subset,
            "# @@@ END OF TABLE OF CONTENTS @@@  ",
            "##HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH##  "
        )
    
    if(replace_input_path_file) {
        if (!is.null(output_path_file)) {warning("replace_input_path_file == TRUE -> output_path_file will be ignored.")}
        output_path_file <- input_path_file # Overwrite the original file
    } 
    
    if (!is.null(output_path_file)) {
        writeLines(c(input_path_file.readLines.str_subset, input_path_file.readLines), con = output_path_file)
        message(paste0("Added TABLE OF CONTENTS in the beginning of ", deparse(input_path_file), " and saved to : ", deparse(output_path_file)))
    } else {
        input_path_file.readLines.str_subset %>% paste0(collapse = "\n") %>% cat("\n")
    }
    
    invisible(input_path_file.readLines.str_subset)
}


f_file.str_subset.lines4heading()


