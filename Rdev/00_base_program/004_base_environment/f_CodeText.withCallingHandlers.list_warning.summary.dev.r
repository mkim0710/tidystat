"Rdev/00_base_program/004_base_environment/warnings.summary.dev.r"
"Rdev/00_base_program/004_base_environment/warnings.suppress.print_summary.dev.r"
"Rdev/00_base_program/004_base_environment/warnings.suppress.print_summary.dev.Rmd"
# f_CodeText.withCallingHandlers.list_warning.summary
# f_CodeText.withCallingHandlers.attr_warning.summary

f_CodeText.withCallingHandlers.list_warning.summary <- function(CodeText) {
  # Save the current 'warn' option
  options_warn_original <- getOption("warn")
  
  # Set 'warn' to 0 to collect warnings
  options(warn = 0)
  
  # Initialize an empty list to store warnings
  list_warning <- list()
  
  # Execute the CodeText and capture warnings
  result <- withCallingHandlers(
    expr = CodeText,
    warning = function(w) {
      # Capture the call that generated the warning
      warning.conditionCall <- conditionCall(w)
      if (is.null(warning.conditionCall)) {
        warning.conditionCall <- "NULL"
      }
      
      # Capture the warning message
      warning.conditionMessage <- conditionMessage(w)
      
      # Append the call to the list, with the message as the name
      list_warning[[length(list_warning) + 1]] <<- warning.conditionCall
      names(list_warning)[length(list_warning)] <<- warning.conditionMessage
      
      invokeRestart("muffleWarning")
    }
  )
  
  # Restore the original 'warn' option
  options(warn = options_warn_original)
  
  # Assign the 'warnings' class to the list_warning
  class(list_warning) <- "warnings"
  
  # # Use the 'summary' function to summarize warnings
  # list_warning.summary <- summary(list_warning)
  
  # # Return the result and captured warnings
  # list(result = result, warnings = list_warning, summary = list_warning.summary)
  
  attributes(result)$warnings <- list_warning
  attributes(result)$warnings.summary <- list_warning %>% summary
  
  result
}


cat("    ________________________________________________________________________    \n")
cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")
cat("    ************************************************************************    \n")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
# Generate warnings without suppression
for (i in 1:3) {
  mat <- matrix(1:7, 3, 4)
}

# Get the summary of warnings
summary(warnings())
# 3 identical warnings:
# In matrix(1:7, 3, 4) :
#   data length [7] is not a sub-multiple or multiple of the number of rows [3]

cat("    ________________________________________________________________________    \n")
cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")
# Example usage of the custom function
example_function <- function() {
  for (i in 1:3) {
    mat <- matrix(1:7, 3, 4)  # Generates warnings due to recycling
  }
  return(mat)
}

# Run the example function with suppressed warnings
output <- f_CodeText.withCallingHandlers.list_warning.summary(example_function())

# Inspect the results
output$result      # The return value of the function
output$warnings    # Stored warnings
output$summary     # Summary of unique warnings
# > output$result      # The return value of the function
# [1] "Example function completed."
# > output$warnings    # Stored warnings
# Warning messages:
# 1: In matrix(1:7, 3, 4) :
#   data length [7] is not a sub-multiple or multiple of the number of rows [3]
# 2: In matrix(1:7, 3, 4) :
#   data length [7] is not a sub-multiple or multiple of the number of rows [3]
# 3: In matrix(1:7, 3, 4) :
#   data length [7] is not a sub-multiple or multiple of the number of rows [3]
# > output$summary     # Summary of unique warnings
# 3 identical warnings:
# In matrix(1:7, 3, 4) :
#   data length [7] is not a sub-multiple or multiple of the number of rows [3]

cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
output %>% f_list.str_by_element(max.level = 2, give.attr = FALSE)
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
output %>% f_list.print_by_element()
# > output %>% f_list.str_by_element(max.level = 2, give.attr = FALSE)
# # List of 3  
# # $ result		: chr "Example function completed."
# # ________________________________________________________________________________    
# # $ warnings		:List of 3
# ## $ data length [7] is not a sub-multiple or multiple of the number of rows [3]: language matrix(1:7, 3, 4)
# ## $ data length [7] is not a sub-multiple or multiple of the number of rows [3]: language matrix(1:7, 3, 4)
# ## $ data length [7] is not a sub-multiple or multiple of the number of rows [3]: language matrix(1:7, 3, 4)
# # ________________________________________________________________________________    
# # $ summary		:List of 1
# ## $ data length [7] is not a sub-multiple or multiple of the number of rows [3]: language matrix(1:7, 3, 4)
# # ________________________________________________________________________________    
# > cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
#     ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    
# > output %>% f_list.print_by_element()
# # List of 3  
# # print(. $ result)
# ##[1] "Example function completed."
# # ________________________________________________________________________________    
# # print(. $ warnings)
# ##Warning messages:
# ##1: In matrix(1:7, 3, 4) :
# ##  data length [7] is not a sub-multiple or multiple of the number of rows [3]
# ##2: In matrix(1:7, 3, 4) :
# ##  data length [7] is not a sub-multiple or multiple of the number of rows [3]
# ##3: In matrix(1:7, 3, 4) :
# ##  data length [7] is not a sub-multiple or multiple of the number of rows [3]
# # ________________________________________________________________________________    
# # print(. $ summary)
# ##3 identical warnings:
# ##In matrix(1:7, 3, 4) :
# ##  data length [7] is not a sub-multiple or multiple of the number of rows [3]
# # ________________________________________________________________________________ 

