# testthat runner for tidystat functions
# Run from repo root with: testthat::test_dir("agents/claude.ai/tests/testthat")

library(testthat)

# Bootstrap tidystat environment via .Rprofile
# This initializes env1 and loads base packages (dplyr, purrr, stringr)
# Get the path to the repository root (3 levels up from testthat dir)
repo_root <- normalizePath(file.path(dirname(getwd()), "..", "..", ".."), winslash = "/")
if (file.exists(file.path(repo_root, ".Rprofile"))) {
  source(file.path(repo_root, ".Rprofile"))
  .First()
} else {
  stop("Cannot find .Rprofile at repo root: ", repo_root)
}

# Run tests from repo root
testthat::test_dir("agents/claude.ai/tests/testthat")
