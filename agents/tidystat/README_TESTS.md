# Unit Tests for tidystat Functions

This directory contains comprehensive unit tests for all functions in the tidystat R package.

## Test Organization

Tests are organized by functional category:

- `test-df-operations.R` - Data frame filtering, validation, and transformation
- `test-file-io.R` - File reading, writing, and management
- `test-vector-list.R` - Vector and list operations
- `test-matrix-array.R` - Matrix and array transformations
- `test-path-operations.R` - Path and file system operations
- `test-string-object.R` - String utilities and object analysis
- `test-type-conversion.R` - Type conversion functions
- `test-regex.R` - Regular expression operations
- `test-environment.R` - Environment manipulation

## Running Tests

### Run all tests:
```r
library(testthat)
test_dir("agents/tidystat")
```

### Run specific test file:
```r
test_file("agents/tidystat/test-df-operations.R")
```

### Run tests with detailed output:
```r
test_dir("agents/tidystat", reporter = "progress")
```

## Test Structure

Each test file follows this structure:

1. **Setup**: Sources `.Rprofile` to initialize `env1` environment
2. **Context**: Groups related tests
3. **Test Cases**: Individual test functions using `test_that()`
4. **Assertions**: Uses `expect_*()` functions to verify behavior
5. **Skipping**: Tests skip gracefully if functions aren't available

## Test Coverage

These tests cover:

- ✓ Basic functionality
- ✓ Edge cases (empty inputs, NA values, etc.)
- ✓ Error handling
- ✓ Type validation
- ✓ Integration with env1 namespace

## Prerequisites

Tests assume:
- `.Rprofile` is sourced (initializes `env1`)
- Required R packages are installed (`testthat`, `dplyr`, etc.)
- Functions are loaded into `env1$f$` or `env1$env.internal$` namespace

## Notes

- Tests use `skip()` for unavailable functions
- Temporary files are cleaned up after tests
- Tests are designed to be run in CI/CD pipelines
- All tests respect tidystat's `env1` architecture

## Contributing

When adding new functions:

1. Add corresponding tests to appropriate test file
2. Follow existing test patterns
3. Include edge cases and error conditions
4. Ensure tests clean up any created resources
