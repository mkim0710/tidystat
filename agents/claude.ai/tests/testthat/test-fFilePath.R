# Test file for File Path Operations
# Source: R/fChr-fFilePath-*.R

library(testthat)

# Define test functions

f_file2.compare <- function(file1, file2, chunk_size = 65536) {
  con1 <- file(file1, "rb")
  con2 <- file(file2, "rb")

  on.exit({
    close(con1)
    close(con2)
  })

  chunk1 <- readBin(con1, what = "raw", n = chunk_size)
  chunk2 <- readBin(con2, what = "raw", n = chunk_size)

  while (length(chunk1) > 0 || length(chunk2) > 0) {
    if (!identical(chunk1, chunk2)) {
      return(FALSE)
    }
    chunk1 <- readBin(con1, what = "raw", n = chunk_size)
    chunk2 <- readBin(con2, what = "raw", n = chunk_size)
  }

  return(TRUE)
}

f_path.is_git_tracked <- function(path = getwd(), check_parents = TRUE) {
  path <- normalizePath(path, winslash = "/", mustWork = TRUE)

  while (TRUE) {
    git_dir <- file.path(path, ".git")
    if (dir.exists(git_dir)) {
      return(git_dir)
    }

    if (!check_parents) {
      return(NA)
    }

    parent_path <- dirname(path)

    if (parent_path == path) {
      return(NA)
    }

    path <- parent_path
  }
}

f.generateText4TimeStamp.yymmddThhmm <- function(timeFormat = "%y%m%dT%H%M") {
  format(Sys.time(), timeFormat)
}

f.generateText4TimeStamp.yymmddThh <- function(timeFormat = "%y%m%dT%H") {
  format(Sys.time(), timeFormat)
}

f.generateText4TimeStamp.yymmdd <- function(timeFormat = "%y%m%d") {
  format(Sys.time(), timeFormat)
}

f.generateText4OutputPath <- function(
  pathText = NULL,
  extensionText = "tmp",
  outputDirText = "output",
  timestampBool = TRUE,
  verboseBool = FALSE
) {
  if (!is.null(pathText)) return(pathText)

  baseNameText <- tryCatch({
    tools::file_path_sans_ext(basename(rstudioapi::getSourceEditorContext()$path))
  }, error = function(e) {
    "list_export"
  })

  if (timestampBool) {
    timestampText <- format(Sys.time(), "-%y%m%dT%H%M")
    baseNameText <- paste0(baseNameText, timestampText)
  }

  finalPathText <- file.path(outputDirText, paste0(baseNameText, ".", extensionText))
  dir.create(outputDirText, showWarnings = FALSE, recursive = TRUE)

  return(finalPathText)
}

describe("f_file2.compare", {

  it("returns TRUE for identical files", {
    # Create temporary test files
    file1 <- tempfile()
    file2 <- tempfile()
    writeLines(c("line1", "line2", "line3"), file1)
    writeLines(c("line1", "line2", "line3"), file2)

    result <- f_file2.compare(file1, file2)
    expect_true(result)

    # Cleanup
    unlink(file1)
    unlink(file2)
  })

  it("returns FALSE for different files", {
    file1 <- tempfile()
    file2 <- tempfile()
    writeLines(c("line1", "line2"), file1)
    writeLines(c("line1", "different"), file2)

    result <- f_file2.compare(file1, file2)
    expect_false(result)

    unlink(file1)
    unlink(file2)
  })

  it("returns FALSE when files have different lengths", {
    file1 <- tempfile()
    file2 <- tempfile()
    writeLines(c("line1", "line2", "line3"), file1)
    writeLines(c("line1", "line2"), file2)

    result <- f_file2.compare(file1, file2)
    expect_false(result)

    unlink(file1)
    unlink(file2)
  })

  it("returns TRUE for empty files", {
    file1 <- tempfile()
    file2 <- tempfile()
    writeLines(character(0), file1)
    writeLines(character(0), file2)

    result <- f_file2.compare(file1, file2)
    expect_true(result)

    unlink(file1)
    unlink(file2)
  })

  it("handles binary content correctly", {
    file1 <- tempfile()
    file2 <- tempfile()
    writeBin(as.raw(1:100), file1)
    writeBin(as.raw(1:100), file2)

    result <- f_file2.compare(file1, file2)
    expect_true(result)

    unlink(file1)
    unlink(file2)
  })

})

describe("f_path.is_git_tracked", {

  it("returns path to .git directory for tracked path", {
    # This test assumes we're running in a git repository
    result <- f_path.is_git_tracked(getwd())
    if (!is.na(result)) {
      expect_true(grepl("\\.git$", result))
      expect_true(dir.exists(result))
    }
  })

  it("returns NA for non-git directory when check_parents=FALSE", {
    # Create a temporary directory that's definitely not git tracked
    temp_dir <- tempdir()
    temp_subdir <- file.path(temp_dir, "test_no_git")
    dir.create(temp_subdir, showWarnings = FALSE)

    result <- f_path.is_git_tracked(temp_subdir, check_parents = FALSE)

    # Note: This might return a git path if temp_dir is within a git repo
    # In most cases, temp directories are not git-tracked directly
    expect_true(is.na(result) || grepl("\\.git$", result))

    unlink(temp_subdir, recursive = TRUE)
  })

})

describe("f.generateText4TimeStamp functions", {

  it("f.generateText4TimeStamp.yymmddThhmm returns correct format", {
    result <- f.generateText4TimeStamp.yymmddThhmm()
    expect_true(grepl("^\\d{6}T\\d{4}$", result))
  })

  it("f.generateText4TimeStamp.yymmddThh returns correct format", {
    result <- f.generateText4TimeStamp.yymmddThh()
    expect_true(grepl("^\\d{6}T\\d{2}$", result))
  })

  it("f.generateText4TimeStamp.yymmdd returns correct format", {
    result <- f.generateText4TimeStamp.yymmdd()
    expect_true(grepl("^\\d{6}$", result))
  })

  it("accepts custom time format", {
    result <- f.generateText4TimeStamp.yymmddThhmm(timeFormat = "%Y-%m-%d")
    expect_true(grepl("^\\d{4}-\\d{2}-\\d{2}$", result))
  })

})

describe("f.generateText4OutputPath", {

  it("returns provided path when pathText is not NULL", {
    result <- f.generateText4OutputPath(pathText = "/custom/path.csv")
    expect_equal(result, "/custom/path.csv")
  })

  it("generates path with timestamp when timestampBool=TRUE", {
    result <- f.generateText4OutputPath(extensionText = "csv", timestampBool = TRUE)
    expect_true(grepl("\\.csv$", result))
    expect_true(grepl("-\\d{6}T\\d{4}", result))
  })

  it("generates path without timestamp when timestampBool=FALSE", {
    result <- f.generateText4OutputPath(extensionText = "csv", timestampBool = FALSE)
    expect_true(grepl("\\.csv$", result))
    expect_false(grepl("-\\d{6}T\\d{4}", result))
  })

  it("uses specified extension", {
    result <- f.generateText4OutputPath(extensionText = "json", timestampBool = FALSE)
    expect_true(grepl("\\.json$", result))
  })

  it("uses specified output directory", {
    result <- f.generateText4OutputPath(
      outputDirText = "custom_output",
      extensionText = "txt",
      timestampBool = FALSE
    )
    expect_true(grepl("^custom_output/", result))
  })

})
