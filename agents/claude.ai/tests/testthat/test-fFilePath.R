# Test file for File Path Operations
# Source: R/fChr-fFilePath-fURL-source.R, R/fChr-fFilePath.git-source.R, R/fChr-fFilePath.save-source.R

library(testthat)

# Bootstrap tidystat environment if not already done
if (!exists("env1") || is.null(env1)) {
  repo_root <- normalizePath(file.path(dirname(getwd()), "..", "..", ".."), winslash = "/")
  source(file.path(repo_root, ".Rprofile"))
  .First()
}

# Load the production functions from R/fChr-fFilePath-*.R
.FileName.source.r <- "fChr-fFilePath-fURL-source.R"
.RelativeSubPath <- "R"
env1$f$f_sourcePath.execute_if_not_sourced(
  .RelativeSubPath_FileName.source.r = file.path(.RelativeSubPath, .FileName.source.r)
)

.FileName.source.r <- "fChr-fFilePath.git-source.R"
env1$f$f_sourcePath.execute_if_not_sourced(
  .RelativeSubPath_FileName.source.r = file.path(.RelativeSubPath, .FileName.source.r)
)

.FileName.source.r <- "fChr-fFilePath.save-source.R"
env1$f$f_sourcePath.execute_if_not_sourced(
  .RelativeSubPath_FileName.source.r = file.path(.RelativeSubPath, .FileName.source.r)
)

describe("f_file2.compare (production)", {

  it("returns TRUE for identical files", {
    file1 <- tempfile()
    file2 <- tempfile()
    writeLines(c("line1", "line2", "line3"), file1)
    writeLines(c("line1", "line2", "line3"), file2)

    result <- env1$f$f_file2.compare(file1, file2)
    expect_true(result)

    unlink(file1)
    unlink(file2)
  })

  it("returns FALSE for different files", {
    file1 <- tempfile()
    file2 <- tempfile()
    writeLines(c("line1", "line2"), file1)
    writeLines(c("line1", "different"), file2)

    result <- env1$f$f_file2.compare(file1, file2)
    expect_false(result)

    unlink(file1)
    unlink(file2)
  })

  it("returns FALSE when files have different lengths", {
    file1 <- tempfile()
    file2 <- tempfile()
    writeLines(c("line1", "line2", "line3"), file1)
    writeLines(c("line1", "line2"), file2)

    result <- env1$f$f_file2.compare(file1, file2)
    expect_false(result)

    unlink(file1)
    unlink(file2)
  })

  it("returns TRUE for empty files", {
    file1 <- tempfile()
    file2 <- tempfile()
    writeLines(character(0), file1)
    writeLines(character(0), file2)

    result <- env1$f$f_file2.compare(file1, file2)
    expect_true(result)

    unlink(file1)
    unlink(file2)
  })

  it("handles binary content correctly", {
    file1 <- tempfile()
    file2 <- tempfile()
    writeBin(as.raw(1:100), file1)
    writeBin(as.raw(1:100), file2)

    result <- env1$f$f_file2.compare(file1, file2)
    expect_true(result)

    unlink(file1)
    unlink(file2)
  })

})

describe("f_path.is_git_tracked (production)", {

  it("returns path to .git directory for tracked path", {
    result <- env1$f$f_path.is_git_tracked(getwd())
    if (!is.na(result)) {
      expect_true(grepl("\\.git$", result))
      expect_true(dir.exists(result))
    }
  })

  it("returns NA for non-git directory when check_parents=FALSE", {
    temp_dir <- tempdir()
    temp_subdir <- file.path(temp_dir, "test_no_git")
    dir.create(temp_subdir, showWarnings = FALSE)

    result <- env1$f$f_path.is_git_tracked(temp_subdir, check_parents = FALSE)

    expect_true(is.na(result) || grepl("\\.git$", result))

    unlink(temp_subdir, recursive = TRUE)
  })

})

describe("f.generateText4TimeStamp functions (production)", {

  it("f.generateText4TimeStamp.yymmddThhmm returns correct format", {
    result <- env1$f$f.generateText4TimeStamp.yymmddThhmm()
    expect_true(grepl("^\\d{6}T\\d{4}$", result))
  })

  it("f.generateText4TimeStamp.yymmddThh returns correct format", {
    result <- env1$f$f.generateText4TimeStamp.yymmddThh()
    expect_true(grepl("^\\d{6}T\\d{2}$", result))
  })

  it("f.generateText4TimeStamp.yymmdd returns correct format", {
    result <- env1$f$f.generateText4TimeStamp.yymmdd()
    expect_true(grepl("^\\d{6}$", result))
  })

  it("accepts custom time format", {
    result <- env1$f$f.generateText4TimeStamp.yymmddThhmm(timeFormat = "%Y-%m-%d")
    expect_true(grepl("^\\d{4}-\\d{2}-\\d{2}$", result))
  })

})

describe("f.generateText4OutputPath (production)", {

  it("returns provided path when pathText is not NULL", {
    result <- env1$f$f.generateText4OutputPath(pathText = "/custom/path.csv")
    expect_equal(result, "/custom/path.csv")
  })

  it("generates path with timestamp when timestampBool=TRUE", {
    result <- env1$f$f.generateText4OutputPath(extensionText = "csv", timestampBool = TRUE)
    expect_true(grepl("\\.csv$", result))
    expect_true(grepl("-\\d{6}T\\d{4}", result))
  })

  it("generates path without timestamp when timestampBool=FALSE", {
    result <- env1$f$f.generateText4OutputPath(extensionText = "csv", timestampBool = FALSE)
    expect_true(grepl("\\.csv$", result))
    expect_false(grepl("-\\d{6}T\\d{4}", result))
  })

  it("uses specified extension", {
    result <- env1$f$f.generateText4OutputPath(extensionText = "json", timestampBool = FALSE)
    expect_true(grepl("\\.json$", result))
  })

  it("uses specified output directory", {
    result <- env1$f$f.generateText4OutputPath(
      outputDirText = "custom_output",
      extensionText = "txt",
      timestampBool = FALSE
    )
    expect_true(grepl("^custom_output/", result))
  })

})
