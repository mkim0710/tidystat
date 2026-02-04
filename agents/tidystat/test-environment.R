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

test_that("fEnv.asList.allNames converts environment to list", {
  if (exists("fEnv.asList.allNames", envir = env1$f)) {
    test_env <- new.env()
    test_env$var1 <- 10
    test_env$var2 <- "test"
    
    result <- env1$f$fEnv.asList.allNames(test_env)
    
    expect_type(result, "list")
    expect_true("var1" %in% names(result))
    expect_true("var2" %in% names(result))
  } else {
    skip("fEnv.asList.allNames not available")
  }
})
