# Canonical List of Functions - tidystat R Package

This document provides a comprehensive catalog of all functions in the tidystat R package, organized by functional category.

## Table of Contents
1. [Data Frame Operations](#data-frame-operations)
2. [File I/O Operations](#file-i/o-operations)
3. [List & Vector Operations](#list--vector-operations)
4. [Matrix & Array Operations](#matrix--array-operations)
5. [Path & File System](#path--file-system)
6. [String & Object Utilities](#string--object-utilities)
7. [Type Conversion](#type-conversion)
8. [Regular Expression](#regular-expression)
9. [Environment & System](#environment--system)
10. [Help & Navigation](#help--navigation)
11. [Code Templates](#code-templates)
12. [Data Search & Entity Management](#data-search--entity-management)
13. [Miscellaneous](#miscellaneous)

---

## Data Frame Operations

### Filtering & Validation

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `fDf.fiter_different_rows` | Filter rows where two columns differ based on NA handling and tolerance | inputDf, colName1, colName2, na_mode, tol | Data frame with mismatched rows |
| `fDf.checkConstancyAcrossVars` | Check constancy across longitudinal/repeated variables | dfInput, pattern, varname4ID, return_type | List with IDs and details of inconsistencies |
| `fDf.checkConstancyAcrossVars.lgl` | Boolean version of constancy check | dfInput, pattern, return_ids, varname4ID | Logical vector or IDs |
| `fDf.filter_mismatched_rows` | Filter data frame rows with inconsistent longitudinal values | dfInput, pattern, varname4ID, select_only_matched_cols | Filtered data frame |
| `simulate_longitudinal_data` | Generate simulated longitudinal data for testing | n_subjects, n_waves, seed, error_rates | Simulated longitudinal dataset |

### Transformation & Mutation

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `f_df.add_VarNameT.deltaT0` | Add delta time from baseline columns | df, VarNameT_pattern | Data frame with delta columns |
| `f_df.add_VarNameT.pdeltaT0` | Add percent delta time from baseline | df, VarNameT_pattern | Data frame with percent delta columns |
| `f_df.add_RegExVars.kbins` | Add k-bins discretization for matching variables | df, RegEx, k | Data frame with binned variables |
| `f_df.add_RegExVars.quintile_factor` | Add quintile factor variables | df, RegEx | Data frame with quintile factors |
| `f_df.add_RegExVars.quartile_factor` | Add quartile factor variables | df, RegEx | Data frame with quartile factors |

## File I/O Operations

### Reading

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `f_objectname.read_rds_or_xz` | Read RDS or XZ compressed file by object name | .objectname, .path4read, vec.folder | Loaded R object |
| `f_FileNameExt.read_rds_or_xz` | Read RDS or XZ file by filename | .FileNameExt, .objectname, .path4read | Loaded R object |
| `fExcelPath_readAllSheets` | Read all sheets from an Excel file as a list | filenamePath, colNamesFlag, colTypesVec, tibbleFlag | List of data frames/tibbles |

### Writing

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `f_objectname.size.write_rds.git_lfs_track_add_f` | Write RDS with git-lfs tracking and size check | .objectname, .path4write, execute parameters | File path and size info |
| `fDf.write_xlsx_to_onedrive` | Export data frame to Excel in OneDrive | .objectname, .path4write, formatting params | Path to saved file |
| `fDf.write_csv_UTF8BOM_to_onedrive` | Export CSV with UTF-8 BOM to OneDrive | .objectname, .path4write, open_xlsx, archive_to_xz | Path to saved file |
| `write_rds.ECHO.CodeText` | Generate code text for write_rds operations | .objectname, EXECUTE flags | Code text string |

### File Management

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `f_FileNameExt.createBACKUP` | Create timestamped backup of a file | BACKUP_from_path_FileNameExt, ext, path, timeFormat | Backup file path |
| `f_path_path.BACKUP.overwrite` | Backup and overwrite destination file | .overwrite_from, .destination, .BACKUP_to_path | Success/failure status |
| `f_file2.compare` | Compare two files chunk-by-chunk | file1, file2, chunk_size | Boolean (are files identical) |
| `f_url_destfile.DownloadIfDifferent` | Download file only if changed | url, destfile, chunk_size, EXECUTE | Download status |

## List & Vector Operations

### Display & Formatting

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `f_vec.dput_line_by_line` | Print vector with line-by-line formatting | vec, space_between_vec_elements | Formatted console output |
| `f_list.dput_line_by_line` | Print list with formatted layout | list_vec, spacing params | Formatted console output |
| `f_list.str_by_element` | str() output element-by-element | ls, max.level, give.attr | Console output |
| `f_list.print_by_element` | print() output element-by-element | ls, width | Console output |
| `f_list_tibble.print_by_element` | Print tibble list elements | ls, n | Console output |

### Set Operations

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `f_vec1_vec2.setdiff_list` | Set difference as named list | vec1, vec2, print_str | List with set operations |
| `f_vec1_vec2.setdiff_df` | Set difference as data frame | vec1, vec2, print_str | Data frame with differences |
| `f_list_vecs.union_df` | Union of vectors in a list | input_list_vecs, print_str, VERBOSE | Data frame with union |

### String Operations

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `f_vec_chr.strsplit0_as_list_vec` | Split string vector to list of vectors | vec_chr, split, n, simplify | List of character vectors |
| `f_chr1.strsplit0_as_vec` | Split single string to vector | chr1, split | Character vector |
| `f_chr1.strsplit0_as_vec.unique.sort` | Split with unique and sort | chr1, split | Sorted unique character vector |
| `f_vec_chr.na_if_NotMatching` | Replace non-matching strings with NA | vec_chr, RegEx4keep | Character vector with NAs |
| `f_vec_chr.add_line_numbers` | Add line numbers to character vector | vec_chr, width.cutoff, URL4line_numbers | Vector with line numbers |
| `f_vec_chr.add_line_numbers.paste_collapse_LF_cat` | Format with line numbers and cat | vec_chr, width.cutoff | Console output |
| `f_vec_chr.list_SECTION_nonSECTION` | Separate SECTION and non-SECTION lines | vec_chr, RegEx4SECTION_start/end | List with SECTION and nonSECTION |

### Data Transformation

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `f_chrNameValuePairs2vector` | Convert name=value pairs to vector | chrNameValuePairs, separators | Named vector |
| `fVec.na.locf` | Last observation carried forward for NA filling | x, fillLeadingNA, defaultValue, verbose | Vector with NAs filled |

### Advanced List Operations

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `fLs.map_keepAttrs` | Map function while preserving attributes | inputList, funCallback, drop_env_objects | Mapped list with preserved attributes |
| `fLs.removeEnvAttr` | Remove environment attributes from nested list | inputList, drop_env_objects, convert_env_to_list | Cleaned list |
| `fLs.hasEnvAttr` | Check for environment attributes in list | inputList, max_paths | Boolean or details |
| `fLs.removeEnvAttr.str` | Remove env attributes and str output | inputList, params | Console output |
| `fLs.removeEnvAttr.saveRDS` | Remove env attributes and save RDS | inputList, filepath, params | Saved file path |

## Matrix & Array Operations

### Conversion

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `f_list_list.to_matrix` | Convert nested list to matrix | list_list, type | Matrix |
| `f_list_list.to_data_frame` | Convert nested list to data frame | list_list, type | Data frame |
| `f_matrix.to_list_list` | Convert matrix to nested list | input_matrix, type | Nested list |
| `f_matrix.set_names.to_vector` | Convert matrix to named vector | input_matrix | Named vector |

### Export

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `fLsLs_exportJSON` | Export nested list to JSON file | inputLsLs, outputFilePathText, prettyBool | JSON file path |
| `fLsLs_exportCSV` | Export nested list to CSV file | inputLsLs, outputFilePathText, multiRowCSV | CSV file path |

## Path & File System

### Path Operations

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `f_path.list_subpath` | List subpaths (breadth/depth-first search) | path, max_depth, method | Vector of subpaths |
| `f_path.list_subpath.DepthFirstSearch_recursive` | Recursive depth-first path search | path, max_depth, filters | Vector of subpaths |
| `f_path.list_subpath.BreathFirstSearch` | Breadth-first path search | path, max_depth, filters | Vector of subpaths |
| `f_path.df_dirs_recursive.df_files` | Recursive directory and file listing as data frame | input_path, print.message | Data frame with paths and metadata |
| `f_FileNameExt.find_subpath` | Find file by name in subpaths | FileNameExt, path, method | Found file path |
| `f_FileNameExt.find_subpath.BreathFirstSearch` | Find file using breadth-first search | FileNameExt, path, max_depth | Found file path |

### Path Utilities

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `f.generateText4OutputPath` | Generate output file path with timestamp | pathText, extensionText, timestampBool | Output file path |
| `f.generateText4TimeStamp.yymmddThhmm` | Generate timestamp YYMMDDTHHMM | timeFormat | Timestamp string |
| `f.generateText4TimeStamp.yymmddThh` | Generate timestamp YYMMDDTHH | timeFormat | Timestamp string |
| `f.generateText4TimeStamp.yymmdd` | Generate timestamp YYMMDD | timeFormat | Timestamp string |

### Git Operations

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `f_path.is_git_tracked` | Check if path is git-tracked | path, check_parents | Boolean |
| `f_gitattributes.split` | Parse .gitattributes file | gitattributes_chr | Parsed attributes list |

## String & Object Utilities

### String Display

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `str_max_level1` | str() with max.level=1 | object, ... | Console output |
| `str_max_level2` | str() with max.level=2 | object, ... | Console output |
| `str_give_attr_F` | str() without attributes | object, ... | Console output |
| `str_max_level1.give_attr_F` | str() max.level=1 without attributes | object, ... | Console output |
| `str_max_level2.give_attr_F` | str() max.level=2 without attributes | object, ... | Console output |
| `paste0_collapse0` | Paste and collapse with warnings | ..., collapse, DEBUGMODE | Collapsed string |
| `paste0_collapse0.print` | Print collapsed paste | ..., collapse | Console output |
| `cat0` | Cat with controlled line spacing | ... | Console output |
| `catLF` | Cat with line feed options | ..., trailing_double_spaces | Console output |
| `deparse.cat0` | Deparse and cat with formatting | object, width.cutoff | Console output |

### Object Analysis

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `fObject.DfObjectSize_IEC` | Get object memory size in IEC units | inputObjects, digits, env, return | Size string (GiB/MiB/KiB) |
| `fEnv.asList.allNames` | Convert environment to list with all names | inputEnv, all.names, sorted | List |

## Type Conversion

### Character

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `fChr.as_numeric_safe_automatic` | Safe character to numeric conversion | char_vec, decimal_sep, thousands_sep, force | Numeric vector with warnings |

### Numeric

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `fNum.signif_preserve_decimals` | Apply significant digits preserving decimals | numVec, signifDigitsInt, roundDigitsInt | Formatted numeric vector |

## Regular Expression

### Set Operations

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `f_RegExChrClass1_RegExChrClass2.setdiff_list` | Set difference of regex character classes | RegExChrClass1, RegExChrClass2 | List with differences |
| `f_list_RegExChrClass.union_df` | Union of regex character classes | input_list_RegExChrClass | Data frame with union |

## Environment & System

### Environment Helpers

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `dir.create.outputDirPath` | Create output directory if not exists | outputDirPath | Directory path |
| `template.yymmddThhmm` | Get timestamp template | None | Timestamp string |
| `outputFilenamePrefix` | Get output filename prefix from editor | None | Filename prefix |
| `outputFilenamePath` | Generate output filename path | None | Full file path |

## Help & Navigation

### Documentation

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `MH_shortcuts` | Display RStudio keyboard shortcuts and commands | show_hotkeys, show_cmd_code | Console output |
| `openWorkingFilesList` | Open working files list for project | None | Opens file in editor |
| `showSymbolPaths` | Show normalized paths for symbols /, ~, ., .. | None | Console output |
| `showProjectPathFiles` | Show files in project root directory | None | Console output or browser |
| `showProjectPathsRecursively` | Show project paths recursively | assign_to_env1_path, print options | Data frame and console output |
| `showProjectPathsAtTidyStat` | Show tidystat-specific project structure | assign_to_env1_path, print options | Console output |
| `showCodeText2open.FileName.source.r` | Generate code to open source file | FileName | Code text string |
| `showCodeText2openSourceInGitHub` | Generate code to open source in GitHub | file path params | Code text string |
| `showCodeText2revert2LastCommit` | Generate code to revert to last commit | file path params | Code text string |
| `showCodeText2restartSession.pending` | Generate code to restart R session | None | Code text string |

## Code Templates

### Generators

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `CodeSnippet.END` | Generate code snippet end marker | None | Code text |
| `CodeTemplate.env1.env.internal.attach` | Generate template for env1 internal function | .objectname, .env1_subenv_name | Code text |
| `CodeTemplate.env1.env.internal.attach.ALIAS` | Generate template for function alias | .ALIASname, .env1_subenv_name | Code text |

## Data Search & Entity Management

### Search Operations

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `f_DS_path_FileNameExt.read.checkEntity` | Read data file and check entity structure | path, FileNameExt, entity checks | Data object with validation |
| `f_DSname.Search.read.checkEntity` | Search, read and validate data entity | DSname, search params, validation | Data object with validation |

## Miscellaneous

### File Utilities

| Function Name | Function Purpose | Inputs | Outputs |
|---------------|------------------|--------|----------|
| `fPath.browseURL` | Open URL in browser | ... | Opens browser |


---

## Summary Statistics

- **Total Categories**: 13
- **Total Subcategories**: 25
- **Total Functions**: 97

## Function Naming Conventions

Functions in this package follow these naming patterns:

- `f*` - General utility functions
- `fDf.*` - Data frame operations
- `fVec.*` / `fLs.*` - Vector and list operations
- `fNum.*` / `fChr.*` - Type-specific operations (numeric, character)
- `fPath.*` / `f_path.*` - Path and file system operations
- `env1$f$*` - Functions stored in env1$f environment
- `env1$env.internal$*` - Internal utility functions

## Usage Notes

1. Most functions are loaded into `env1$f$` namespace when sourced
2. Some common utilities have aliases in `env1$env.internal.attach$`
3. Functions with roxygen documentation (`#'`) have full parameter details in source
4. File I/O functions respect `env1$path$` configuration for read/write locations

## Source File Locations

All functions are located in `/R/*-source.R` files:

- **fDf.filter-source.R**: Data frame filtering and validation
- **fDf.mutate-source.R**: Data frame transformation
- **fLs-fVec-source.R**: List and vector operations
- **fLsLs-fMat-fArr-source.R**: Matrix and array operations
- **fChr-fFilePath.*-source.R**: File I/O operations
- **fObj-fStr-source.R**: Object display and string utilities
- **help-show-source.R**: Help and navigation functions
- **And more...**

---

*Generated: 2026-02-04*
*Repository: mkim0710/tidystat*
