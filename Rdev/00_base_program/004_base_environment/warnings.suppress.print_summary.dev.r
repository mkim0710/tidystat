suppress_and_store_warnings <- function(code) {
  # Save the current warn option
  original_warn <- getOption("warn")
  
  # Suppress warnings temporarily
  options(warn = -1)
  
  # Capture warnings using withCallingHandlers
  warnings_list <- NULL
  result <- tryCatch(
    {
      withCallingHandlers(
        { code }, # Run the code provided as an argument
        warning = function(w) {
          # Capture warnings
          warnings_list <<- c(warnings_list, conditionMessage(w))
          invokeRestart("muffleWarning") # Suppress warning output
        }
      )
    },
    error = function(e) {
      # Handle any errors if needed
      message("An error occurred: ", e$message)
      return(NULL)
    }
  )
  
  # Restore the original warn option
  options(warn = original_warn)
  
  # Return the result and captured warnings
  # list(result = result, warnings = warnings_list, summary = summary(warnings_list))
  list(result = result, warnings = warnings_list, summary = table(warnings_list))
}


cat("    ________________________________________________________________________    \n")
cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")
cat("    ************************************************************************    \n")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
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
# output$result      # The return value of the function
# output$warnings    # Stored warnings
# output$summary     # Summary of unique warnings

output %>% f_list.str_by_element(max.level = 2, give.attr = FALSE)
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
output %>% f_list.print_by_element()


