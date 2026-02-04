# testthat runner for tidystat functions
# Run with: testthat::test_dir("agents/claude.ai/tests/testthat")

library(testthat)
library(tidyverse)

# Source the tidystat functions
# Note: In production, these would be loaded via the package

test_check("tidystat")
