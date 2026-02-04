# tidystat Agent Documentation

This directory contains comprehensive documentation and testing resources for the tidystat R package.

## Contents

### 📚 Documentation

#### [FUNCTIONS_CANONICAL_LIST.md](./FUNCTIONS_CANONICAL_LIST.md)
Complete catalog of all 97+ functions in tidystat, organized by category:

- **Data Frame Operations** - Filtering, validation, and transformation
- **File I/O Operations** - Reading, writing, and file management
- **List & Vector Operations** - Display, set operations, and string manipulation
- **Matrix & Array Operations** - Conversions and exports
- **Path & File System** - Path utilities and git operations
- **String & Object Utilities** - Display and analysis helpers
- **Type Conversion** - Safe type conversions
- **Regular Expression** - Regex utilities
- **Environment & System** - Environment helpers
- **Help & Navigation** - Documentation and shortcuts
- **Code Templates** - Code generation utilities
- **Data Search & Entity Management** - Search operations
- **Miscellaneous** - Additional utilities

Each function is documented with:
- Function name and purpose
- Input parameters
- Output/return values
- Category and subcategory classification

### 🧪 Unit Tests

#### Test Files (9 categories)
Comprehensive testthat unit tests covering all function categories (19 tests total):

- `test-df-operations.R` - Data frame operations (4 tests)
- `test-file-io.R` - File I/O operations (2 tests)
- `test-vector-list.R` - Vector and list operations (4 tests)
- `test-matrix-array.R` - Matrix/array operations (2 tests)
- `test-path-operations.R` - Path operations (1 test)
- `test-string-object.R` - String utilities (2 tests)
- `test-type-conversion.R` - Type conversions (2 tests)
- `test-regex.R` - Regular expressions (1 test)
- `test-environment.R` - Environment operations (1 test)

See [README_TESTS.md](./README_TESTS.md) for details on running tests.

## Quick Start

### View Function Documentation
```bash
# Open the canonical function list
cat agents/tidystat/FUNCTIONS_CANONICAL_LIST.md
```

### Run Tests
```r
# In R console
library(testthat)

# Run all tests
test_dir("agents/tidystat")

# Run specific category
test_file("agents/tidystat/test-df-operations.R")

# Run with detailed output
test_dir("agents/tidystat", reporter = "progress")
```

## Function Categories Overview

| Category | Functions | Key Features |
|----------|-----------|--------------|
| Data Frame | 10+ | Filtering, validation, longitudinal data handling |
| File I/O | 15+ | RDS, Excel, CSV, OneDrive integration |
| List/Vector | 25+ | LOCF, set operations, string splitting |
| Matrix/Array | 6+ | Nested list conversions, JSON/CSV export |
| Path/File System | 12+ | Recursive search, git tracking |
| String/Object | 15+ | Display utilities, memory analysis |
| Type Conversion | 2+ | Safe numeric conversion, formatting |
| Regex | 2+ | Character class operations |
| Environment | 5+ | Environment list conversion, paths |
| Help/Navigation | 10+ | Shortcuts, documentation generators |
| Code Templates | 3+ | Function template generators |

## Architecture

### env1 Namespace

All functions are loaded into the `env1` environment structure:

```r
# Main functions
env1$f$fDf.fiter_different_rows()
env1$f$fVec.na.locf()

# Internal/attached functions
env1$env.internal$f_vec_chr.add_line_numbers()
env1$env.internal.attach$paste0_collapse0()
```

### Initialization

Functions are loaded via `.Rprofile`:

```r
source(".Rprofile")
.First()  # Initializes env1
```

## Testing Philosophy

1. **Coverage** - Tests cover basic functionality, edge cases, and error handling
2. **Robustness** - Tests skip gracefully if functions aren't available
3. **Cleanup** - All temporary resources are cleaned up
4. **Integration** - Tests work with tidystat's env1 architecture
5. **CI-Ready** - Designed for automated testing pipelines

## Contributing

When adding new functions:

1. Update `FUNCTIONS_CANONICAL_LIST.md` with new function details
2. Add corresponding tests to appropriate test file
3. Follow tidystat naming conventions (`fType.operation` pattern)
4. Include roxygen documentation in source files
5. Ensure functions work with `env1` namespace

## Project Structure

```
agents/tidystat/
├── README.md                      # This file
├── FUNCTIONS_CANONICAL_LIST.md    # Complete function documentation
├── README_TESTS.md                # Testing guide
├── test-df-operations.R           # Data frame tests
├── test-file-io.R                 # File I/O tests
├── test-vector-list.R             # Vector/list tests
├── test-matrix-array.R            # Matrix/array tests
├── test-path-operations.R         # Path operation tests
├── test-string-object.R           # String utility tests
├── test-type-conversion.R         # Type conversion tests
├── test-regex.R                   # Regex tests
└── test-environment.R             # Environment tests
```

## Links

- **Repository**: [mkim0710/tidystat](https://github.com/mkim0710/tidystat)
- **Source Functions**: `/R/*-source.R`
- **Development Notebooks**: `/Rdev/`

---

*Last Updated: 2026-02-04*
*Version: 1.0*
