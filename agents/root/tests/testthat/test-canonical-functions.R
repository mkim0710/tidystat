testthat::test_that("canonical functions are defined in R sources", {
  # Read the canonical function catalog
  catalog_path <- "agents/root/canonical-list-of-functions.md"
  catalog_lines <- readLines(catalog_path, warn = FALSE)
  
  # Extract function names from markdown table (column 3)
  # Skip header and separator rows, then parse table rows
  table_start <- which(grepl("^\\| Category \\|", catalog_lines))[1]
  if (is.na(table_start)) {
    stop("Could not find table header in canonical-list-of-functions.md")
  }
  
  # Get all rows after the separator line
  table_rows <- catalog_lines[(table_start + 2):length(catalog_lines)]
  # Filter to rows that look like table rows (start with |)
  table_rows <- table_rows[grepl("^\\|", table_rows)]
  
  # Extract function name from third column
  function_names <- character(0)
  for (row in table_rows) {
    # Split by | and trim whitespace
    cols <- trimws(strsplit(row, "\\|")[[1]])
    # Remove empty first/last elements from leading/trailing pipes
    cols <- cols[nchar(cols) > 0]
    if (length(cols) >= 3) {
      function_names <- c(function_names, cols[3])
    }
  }
  
  # Remove duplicates and ensure we found some functions
  function_names <- unique(function_names)
  testthat::expect_true(length(function_names) > 0, 
                       info = "No function names extracted from catalog")
  
  # Read all R source files
  r_sources <- list.files("R", pattern = "\\.R$", full.names = TRUE)
  source_text <- paste(vapply(r_sources, function(path) {
    paste(readLines(path, warn = FALSE), collapse = "\n")
  }, character(1)), collapse = "\n")
  
  # Check each function name exists in sources with proper escaping
  missing <- function_names[!vapply(function_names, function(name) {
    # Escape special regex characters (especially dots)
    escaped_name <- gsub("([.|()\\^{}+$*?\\[\\]])", "\\\\\\1", name)
    pattern <- paste0("\\.tmp\\$objectname\\s*=\\s*\"", escaped_name, "\"")
    grepl(pattern, source_text)
  }, logical(1))]
  
  testthat::expect_length(missing, 0, 
                         info = paste("Missing definitions for:", 
                                    paste(missing, collapse = ", ")))
})
