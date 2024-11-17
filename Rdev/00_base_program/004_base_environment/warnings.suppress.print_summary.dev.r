suppress_and_store_warnings <- function(code) {
  # Save the current 'warn' option
  original_warn <- getOption("warn")
  
  # Set 'warn' to 0 to collect warnings
  options(warn = 0)
  
  # Initialize an empty list to store warnings
  warnings_list <- list()
  
  # Execute the code and capture warnings
  result <- withCallingHandlers(
    expr = code,
    warning = function(w) {
      # Capture the call that generated the warning
      w_call <- conditionCall(w)
      if (is.null(w_call)) {
        w_call <- "NULL"
      }
      
      # Capture the warning message
      w_message <- conditionMessage(w)
      
      # Append the call to the list, with the message as the name
      warnings_list[[length(warnings_list) + 1]] <<- w_call
      names(warnings_list)[length(warnings_list)] <<- w_message
      
      invokeRestart("muffleWarning")
    }
  )
  
  # Restore the original 'warn' option
  options(warn = original_warn)
  
  # Assign the 'warnings' class to the warnings_list
  class(warnings_list) <- "warnings"
  
  # Use the 'summary' function to summarize warnings
  summary_warnings <- summary(warnings_list)
  
  # Return the result and captured warnings
  list(result = result, warnings = warnings_list, summary = summary_warnings)
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
  return("Example function completed.")
}

# Run the example function with suppressed warnings
output <- suppress_and_store_warnings(example_function())

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

