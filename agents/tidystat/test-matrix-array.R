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

test_that("f_list_list.to_matrix converts nested lists", {
  if (exists("f_list_list.to_matrix", envir = env1$f)) {
    # Create a simple nested list
    test_list <- list(
      col1 = list(r1 = "A1", r2 = "A2"),
      col2 = list(r1 = "B1", r2 = "B2")
    )
    
    result <- env1$f$f_list_list.to_matrix(test_list)
    
    expect_true(is.matrix(result))
    expect_equal(dim(result), c(2, 2))
  } else {
    skip("f_list_list.to_matrix not available")
  }
})

test_that("f_matrix.to_list_list converts matrices", {
  if (exists("f_matrix.to_list_list", envir = env1$f)) {
    test_matrix <- matrix(1:6, nrow = 2, ncol = 3)
    rownames(test_matrix) <- c("R1", "R2")
    colnames(test_matrix) <- c("C1", "C2", "C3")
    
    result <- env1$f$f_matrix.to_list_list(test_matrix)
    
    expect_type(result, "list")
    expect_true(all(sapply(result, is.list)))
  } else {
    skip("f_matrix.to_list_list not available")
  }
})
