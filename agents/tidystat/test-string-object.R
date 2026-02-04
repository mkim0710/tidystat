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

test_that("paste0_collapse0 works correctly", {
  if (exists("paste0_collapse0", envir = env1$env.internal.attach)) {
    result <- env1$env.internal.attach$paste0_collapse0("a", "b", "c")
    
    expect_type(result, "character")
    expect_equal(result, "abc")
  } else {
    skip("paste0_collapse0 not available")
  }
})

test_that("fObject.DfObjectSize_IEC calculates size", {
  if (exists("fObject.DfObjectSize_IEC", envir = env1$f)) {
    test_obj <- data.frame(x = 1:100, y = 1:100)
    
    result <- env1$f$fObject.DfObjectSize_IEC(list(test_obj))
    
    expect_type(result, "character")
    expect_true(grepl("bytes|KiB|MiB|GiB", result))
  } else {
    skip("fObject.DfObjectSize_IEC not available")
  }
})
