"Rdev/00_base_program/004_base_environment/warnings.summary.dev.r"
"Rdev/00_base_program/004_base_environment/f_expression.eval.withCallingHandlers.list_warnings.summary.dev.r"
"Rdev/00_base_program/004_base_environment/f_expression.eval.withCallingHandlers.attr_warnings.summary.dev.r"
"Rdev/00_base_program/004_base_environment/f_expression.eval.withCallingHandlers.attr_warnings.summary.dev.Rmd"
# f_expression.eval.withCallingHandlers.list_warnings.summary
# f_expression.eval.withCallingHandlers.attr_warnings.summary

f_expression.eval.withCallingHandlers.attr_warnings.summary <- function(expression.eval, warnings.summary_only = TRUE, warnings.summary.print = TRUE) {
    options_warn_original <- getOption("warn")  # Save the current 'warn' option
    options(warn = 0)  # Set 'warn' to 0 to collect warnings
    list_warning <- list()  # Initialize an empty list to store warnings
    
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
    
    options(warn = options_warn_original)  # Restore the original 'warn' option
    class(list_warning) <- "warnings"  # Assign the 'warnings' class to the list_warning
    # list_warnings.summary <- summary(list_warning)  # Use the 'summary' function to summarize warnings
    # list(expression.eval.output = expression.eval.output, warnings = list_warning, summary = list_warnings.summary)  # Return the expression.eval.output and captured warnings
    
    attributes(expression.eval.output)$expression <- substitute(expression.eval)
    attributes(expression.eval.output)$expression.eval.deparse <- deparse(expression.eval)
    if(!warnings.summary_only) attributes(expression.eval.output)$warnings <- list_warning
    attributes(expression.eval.output)$warnings.summary <- list_warning %>% summary
    
    # if(warnings.summary.print) list_warning %>% summary %>% print
    if(warnings.summary.print) list_warning %>% summary %>% capture.output() %>% paste0(collapse = "\n") %>% paste0("\n") %>% warning(call. = TRUE, immediate. = TRUE)
    
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
output <- f_expression.eval.withCallingHandlers.attr_warnings.summary(example_function(), warnings.summary_only = FALSE)

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


