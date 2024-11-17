"Rdev/00_base_program/004_base_environment/warnings.summary.dev.r"
"Rdev/00_base_program/004_base_environment/f_expression.eval.withCallingHandlers.list_warning.summary.dev.r"
"Rdev/00_base_program/004_base_environment/f_expression.eval.withCallingHandlers.attr_warning.summary.dev.r"
"Rdev/00_base_program/004_base_environment/f_expression.eval.withCallingHandlers.attr_warning.summary.dev.Rmd"
# f_expression.eval.withCallingHandlers.list_warning.summary
# f_expression.eval.withCallingHandlers.attr_warning.summary

f_expression.eval.withCallingHandlers.attr_warning.summary <- function(expression.eval, warnings.summary_only = TRUE) {
  # Save the current 'warn' option
  options_warn_original <- getOption("warn")
  
  # Set 'warn' to 0 to collect warnings
  options(warn = 0)
  
  # Initialize an empty list to store warnings
  list_warning <- list()
  
  # Execute the expression.eval and capture warnings
  expression.eval.output <- withCallingHandlers(
    expr = expression.eval,
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
  
  # # Return the expression.eval.output and captured warnings
  # list(expression.eval.output = expression.eval.output, warnings = list_warning, summary = list_warning.summary)
  
  
  attributes(expression.eval.output)$expression <- substitute(expression.eval)
  attributes(expression.eval.output)$expression.eval.deparse <- deparse(expression.eval)
  if(!warnings.summary_only) attributes(expression.eval.output)$warnings <- list_warning
  attributes(expression.eval.output)$warnings.summary <- list_warning %>% summary
  
  expression.eval.output
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
# Warning messages:
# 1: In matrix(1:7, 3, 4) :
#   data length [7] is not a sub-multiple or multiple of the number of rows [3]
# 2: In matrix(1:7, 3, 4) :
#   data length [7] is not a sub-multiple or multiple of the number of rows [3]
# 3: In matrix(1:7, 3, 4) :
#   data length [7] is not a sub-multiple or multiple of the number of rows [3]

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
output <- f_expression.eval.withCallingHandlers.attr_warning.summary(example_function(), warnings.summary_only = FALSE)

# Inspect the results
output
output %>% str     # The return value of the function
# > output
#      [,1] [,2] [,3] [,4]
# [1,]    1    4    7    3
# [2,]    2    5    1    4
# [3,]    3    6    2    5
# attr(,"expression")
# example_function()
# attr(,"expression.eval.deparse")
# [1] "structure(c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 1L, 2L, 3L, 4L, 5L), dim = 3:4)"
# attr(,"warnings")
# Warning messages:
# 1: In matrix(1:7, 3, 4) :
#   data length [7] is not a sub-multiple or multiple of the number of rows [3]
# 2: In matrix(1:7, 3, 4) :
#   data length [7] is not a sub-multiple or multiple of the number of rows [3]
# 3: In matrix(1:7, 3, 4) :
#   data length [7] is not a sub-multiple or multiple of the number of rows [3]
# attr(,"warnings.summary")
# 3 identical warnings:
# In matrix(1:7, 3, 4) :
#   data length [7] is not a sub-multiple or multiple of the number of rows [3]
# > output %>% str     # The return value of the function
#  int [1:3, 1:4] 1 2 3 4 5 6 7 1 2 3 ...
#  - attr(*, "expression")= language example_function()
#  - attr(*, "expression.eval.deparse")= chr "structure(c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 1L, 2L, 3L, 4L, 5L), dim = 3:4)"
#  - attr(*, "warnings")=List of 3
#   ..$ data length [7] is not a sub-multiple or multiple of the number of rows [3]: language matrix(1:7, 3, 4)
#   ..$ data length [7] is not a sub-multiple or multiple of the number of rows [3]: language matrix(1:7, 3, 4)
#   ..$ data length [7] is not a sub-multiple or multiple of the number of rows [3]: language matrix(1:7, 3, 4)
#   ..- attr(*, "class")= chr "warnings"
#  - attr(*, "warnings.summary")=List of 1
#   ..$ data length [7] is not a sub-multiple or multiple of the number of rows [3]: language matrix(1:7, 3, 4)
#   ..- attr(*, "class")= chr "summary.warnings"
#   ..- attr(*, "counts")= int 3


attributes(output)$warnings
attributes(output)$warnings %>% str             # Stored warnings
# > attributes(output)$warnings
# Warning messages:
# 1: In matrix(1:7, 3, 4) :
#   data length [7] is not a sub-multiple or multiple of the number of rows [3]
# 2: In matrix(1:7, 3, 4) :
#   data length [7] is not a sub-multiple or multiple of the number of rows [3]
# 3: In matrix(1:7, 3, 4) :
#   data length [7] is not a sub-multiple or multiple of the number of rows [3]
# > attributes(output)$warnings %>% str             # Stored warnings
# List of 3
#  $ data length [7] is not a sub-multiple or multiple of the number of rows [3]: language matrix(1:7, 3, 4)
#  $ data length [7] is not a sub-multiple or multiple of the number of rows [3]: language matrix(1:7, 3, 4)
#  $ data length [7] is not a sub-multiple or multiple of the number of rows [3]: language matrix(1:7, 3, 4)
#  - attr(*, "class")= chr "warnings"


attributes(output)$warnings.summary
attributes(output)$warnings.summary %>% str     # Summary of unique warnings
# > attributes(output)$warnings.summary
# 3 identical warnings:
# In matrix(1:7, 3, 4) :
#   data length [7] is not a sub-multiple or multiple of the number of rows [3]
# > attributes(output)$warnings.summary %>% str     # Summary of unique warnings
# List of 1
#  $ data length [7] is not a sub-multiple or multiple of the number of rows [3]: language matrix(1:7, 3, 4)
#  - attr(*, "class")= chr "summary.warnings"
#  - attr(*, "counts")= int 3


