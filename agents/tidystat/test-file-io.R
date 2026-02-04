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

context('File I/O Operations')

test_that("f_FileNameExt.createBACKUP creates backup files", {
  if (exists("f_FileNameExt.createBACKUP", envir = env1$f)) {
    # Create a temporary test file
    temp_file <- tempfile(fileext = ".txt")
    writeLines("test content", temp_file)
    
    # Create backup
    backup_path <- env1$f$f_FileNameExt.createBACKUP(
      temp_file,
      .BACKUP_to_path = tempdir()
    )
    
    expect_true(file.exists(backup_path))
    
    # Cleanup
    unlink(temp_file)
    unlink(backup_path)
  } else {
    skip("f_FileNameExt.createBACKUP not available")
  }
})

test_that("f_file2.compare compares files correctly", {
  if (exists("f_file2.compare", envir = env1$f)) {
    # Create two identical files
    file1 <- tempfile()
    file2 <- tempfile()
    writeLines(c("line1", "line2"), file1)
    writeLines(c("line1", "line2"), file2)
    
    result_same <- env1$f$f_file2.compare(file1, file2)
    expect_true(result_same)
    
    # Create different file
    file3 <- tempfile()
    writeLines(c("line1", "different"), file3)
    
    result_diff <- env1$f$f_file2.compare(file1, file3)
    expect_false(result_diff)
    
    # Cleanup
    unlink(c(file1, file2, file3))
  } else {
    skip("f_file2.compare not available")
  }
})
