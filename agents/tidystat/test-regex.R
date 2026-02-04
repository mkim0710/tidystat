# Unit Tests for tidystat Functions
# Generated: 2026-02-04
# 
# Test Structure:
# - Each category has its own test file
# - Tests follow tidystat conventions (env1$f$ namespace)
# - Uses testthat framework
# - Includes basic functionality, edge cases, and error handling

library(testthat)

# Setup: Source .Rprofile to initialize env1
if (file.exists(".Rprofile")) {
  source(".Rprofile")
  if (exists(".First")) .First()
}

context('Regular Expression Operations')

test_that("f_RegExChrClass1_RegExChrClass2.setdiff_list works", {
  if (exists("f_RegExChrClass1_RegExChrClass2.setdiff_list", envir = env1$f)) {
    # Test set difference of regex character classes
    class1 <- "[a-z]"
    class2 <- "[a-m]"
    
    result <- env1$f$f_RegExChrClass1_RegExChrClass2.setdiff_list(class1, class2)
    
    expect_type(result, "list")
  } else {
    skip("f_RegExChrClass1_RegExChrClass2.setdiff_list not available")
  }
})
