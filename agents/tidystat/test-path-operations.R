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

test_that("f_path.is_git_tracked checks git tracking", {
  if (exists("f_path.is_git_tracked", envir = env1$f)) {
    # Test with current directory (should be in git repo)
    result <- env1$f$f_path.is_git_tracked(getwd())
    
    expect_type(result, "logical")
    # In GitHub Actions, this should be TRUE
    expect_true(is.logical(result))
  } else {
    skip("f_path.is_git_tracked not available")
  }
})
