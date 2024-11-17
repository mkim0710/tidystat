suppress_and_store_warnings <- function(code) {
  # Save the current 'warn' option
  original_warn <- getOption("warn")
  
  # Set 'warn' to 0 to collect warnings
  options(warn = 0)
  
  # Suppress warnings from being printed
  sink(tempfile(), type = "message")
  
  # Initialize an empty list to store warnings
  warnings_list <- list()
  
  # Execute the code and capture warnings
  result <- withCallingHandlers(
    expr = code,
    warning = function(w) {
      # Capture the warning message and associated call
      warnings_list[[length(warnings_list) + 1]] <<- conditionMessage(w)
      names(warnings_list)[length(warnings_list)] <<- deparse(conditionCall(w))
      invokeRestart("muffleWarning")
    }
  )
  
  # Restore the original 'warn' option
  options(warn = original_warn)
  
  # Reset the sink
  sink(type = "message")
  
  # Assign the "warnings" class to the warnings_list
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



output %>% f_list.str_by_element(max.level = 2, give.attr = FALSE)
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
output %>% f_list.print_by_element()


