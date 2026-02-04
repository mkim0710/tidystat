# Canonical List of Functions - tidystat

This document provides a comprehensive catalog of all functions defined in the tidystat R package, organized by category.

## Function Catalog

| Category | Subcategory | Function Name | Function Purpose | Inputs | Outputs |
|----------|-------------|---------------|------------------|--------|---------|
| **File Operations** | File Reading | `f_objectname.read_rds_or_xz` | Read RDS/XZ file by object name into global environment | `.objectname`, `.path4read`, `vec.folder`, `vec.extension`, `VERBOSE`, `DEBUGMODE` | Invisibly returns the read object |
| File Operations | File Reading | `f_FileNameExt.read_rds_or_xz` | Read RDS/XZ file by filename extension | `.FileNameExt`, `.objectname`, `.path4read`, `vec.folder`, `vec.extension`, `VERBOSE`, `DEBUGMODE` | Invisibly returns the read object |
| File Operations | File Reading | `fExcelPath_readAllSheets` | Read all worksheets from Excel file into named list | `filenamePath`, `colNamesFlag`, `colTypesVec`, `naText`, `trimWsFlag`, `skipInt`, `nMaxInt`, `guessMaxInt`, `tibbleFlag`, `verboseFlag` | Named list of data frames/tibbles |
| File Operations | File Saving | `dir.create.outputDirPath` | Create output directory if not exists | `outputDirPath` | NULL (side effect: creates directory) |
| File Operations | File Saving | `template.yymmddThhmm` | Generate timestamp string (YYMMDDTHHmm format) | None | Character string timestamp |
| File Operations | File Saving | `outputFilenamePrefix` | Get base filename from current source editor | None | Character string filename |
| File Operations | File Saving | `outputFilenamePath` | Generate full output file path with timestamp | None | Character string file path |
| File Operations | File Saving | `f_objectname.size.write_rds.git_lfs_track_add_f` | Write object to RDS with automatic compression and git LFS tracking | `.objectname`, `CompressionMethod`, `.FileNameExt4write`, `.path4write`, `.path_file`, `createBACKUP`, `EXECUTE`, `git_lfs_track`, `git_add_f`, etc. | Invisible NULL (side effects: writes file, git operations) |
| File Operations | File Saving | `write_rds.ECHO.CodeText` | Echo write_rds code text for manual execution | `.objectname`, `EXECUTE_write_rds`, `EXECUTE_write_rds_xz` | NULL (side effect: prints code) |
| File Operations | File Saving | `fDf.write_xlsx_to_onedrive` | Write data frame to Excel on OneDrive | `.objectname`, `.path4write`, `as_table`, `table_style`, `row_names`, `col_widths`, `first_active_row`, `first_active_col`, `windows_path_changed_from`, `windows_path_changed_to`, `open_xlsx` | NULL (side effect: writes Excel file) |
| File Operations | File Saving | `fDf.write_csv_UTF8BOM_to_onedrive` | Write data frame to CSV with UTF-8 BOM encoding | `.objectname`, `.path4write`, `windows_path_changed_from`, `windows_path_changed_to`, `open_xlsx`, `archive_to_xz` | NULL (side effect: writes CSV file) |
| File Operations | File Saving | `f.generateText4TimeStamp.yymmddThhmm` | Generate timestamp (minute precision) | `timeFormat` | Character string timestamp |
| File Operations | File Saving | `f.generateText4TimeStamp.yymmddThh` | Generate timestamp (hour precision) | `timeFormat` | Character string timestamp |
| File Operations | File Saving | `f.generateText4TimeStamp.yymmdd` | Generate timestamp (day precision) | `timeFormat` | Character string timestamp |
| File Operations | File Saving | `f.generateText4FileNameBase` | Generate base filename with optional prefix/suffix | `prefix`, `suffix` | Character string filename |
| File Operations | File Update | `f_file2.compare` | Compare two files chunk-by-chunk | `file1`, `file2`, `chunk_size` | Logical (TRUE if identical) |
| File Operations | File Update | `f_url_destfile.DownloadIfDifferent` | Download file only if web version differs | `url`, `destfile`, `chunk_size`, `VERBOSE`, `EXECUTE` | Logical (TRUE if downloaded) |
| File Operations | File Update | `f.updateTemplates` | Update RStudio templates from GitHub | `.path4APPDATA_RStudio`, `TestMode`, `VERBOSE`, `EXECUTE` | NULL (side effect: updates files) |
| File Operations | File Backup | `f_FileNameExt.createBACKUP` | Create timestamped backup copy of file | `BACKUP_from_path_FileNameExt`, `BACKUP_from_ext`, `.BACKUP_to_path`, `timeFormat`, `overwrite` | NULL (side effect: creates backup) |
| File Operations | File Backup | `f_path_path.BACKUP.overwrite` | Backup destination then overwrite with source | `.overwrite_from_path_FileNameExt`, `.destination_path_FileNameExt`, `.BACKUP_to_path`, `timeFormat`, `createFile` | NULL (side effect: backup and overwrite) |
| File Operations | File Open/Edit | `fPath.browseURL` | Open path/URL in browser | `...` (passed to browseURL) | NULL (side effect: opens browser) |
| **Git Operations** | Git Tracking | `f_path.is_git_tracked` | Check if path is tracked by Git | `path`, `check_parents` | Character (git dir path) or NA |
| Git Operations | Git LFS | `f_file.git_lfs_track_add_f` | Track file with Git LFS and add | `.path_file`, `EXECUTE`, `SkipIfAlreadyAdded` | Invisible list of terminal commands |
| Git Operations | Git Attributes | `f_gitattributes.split` | Split .gitattributes into LFS and non-LFS | `input_path`, `output_path.lfs`, `split_non_lfs`, `output_path.non_lfs`, `OPEN_OUTPUT` | Invisible NULL |
| **String/Character Operations** | Type Conversion | `fChr.as_numeric_safe_automatic` | Safe character to numeric conversion with validation | `char_vec`, `decimal_sep`, `thousands_sep`, `missing_codes`, `force`, `remove_non_num`, `verbose` | Numeric vector or original char_vec |
| String/Character Operations | RegEx | `f_RegExChrClass1_RegExChrClass2.setdiff_list` | Compute set difference between two regex character classes | `RegExChrClass1`, `RegExChrClass2`, `output_as_data_frame`, `VERBOSE` | List or data frame of set operations |
| String/Character Operations | RegEx | `f_list_RegExChrClass.union_df` | Compute union of multiple regex character classes | `input_list_RegExChrClass`, `print_str`, `VERBOSE` | Data frame with union membership |
| **Numeric Operations** | Rounding | `fNum.signif_preserve_decimals` | Apply signif() while preserving initial decimal places | `numVec`, `signifDigitsInt`, `roundDigitsInt`, `verboseBool` | Numeric vector/matrix/array/data frame |
| **Vector Operations** | Output/Display | `f_vec.dput_line_by_line` | Print vector elements line by line | `vec`, `space_between_vec_elements`, `sep_parentheses`, `end_of_text` | NULL (side effect: prints to console) |
| Vector Operations | Set Operations | `f_vec1_vec2.setdiff_list` | Compute set operations between two vectors | `vec1`, `vec2`, `print_str`, `output_as_data_frame` | List of set operations |
| Vector Operations | Set Operations | `f_vec1_vec2.setdiff_df` | Compute set operations as data frame | `vec1`, `vec2`, `print_str` | Data frame with set membership |
| Vector Operations | Set Operations | `f_list_vecs.union_df` | Compute union of multiple vectors with membership indicators | `input_list_vecs`, `print_str`, `VERBOSE` | Tibble with union and membership columns |
| Vector Operations | String Split | `f_vec_chr.strsplit0_as_list_vec` | Split character vector by pattern | `input_vec_chr`, `split`, `n`, `simplify` | List of character vectors |
| Vector Operations | String Split | `f_chr1.strsplit0_as_vec` | Split single character into vector | `input_chr1`, `split` | Character vector |
| Vector Operations | String Split | `f_chr1.strsplit0_as_vec.unique.sort` | Split, unique, and sort | `input_chr1`, `split` | Sorted unique character vector |
| Vector Operations | NA Handling | `f_vec_chr.na_if_NotMatching` | Replace non-matching elements with NA | `input_vec_chr`, `RegEx4keep` | Character vector with NAs |
| Vector Operations | Formatting | `f_vec_chr.add_line_numbers` | Add line numbers to vector elements | `input_vec_chr`, `width.cutoff`, `URL4line_numbers`, `prefix4line_numbers` | Character vector with line numbers |
| Vector Operations | Section Extraction | `f_vec_chr.list_SECTION_nonSECTION` | Extract SECTION and non-SECTION parts | `input_vec_chr`, `RegEx4SECTION_start`, `RegEx4SECTION_end` | List with SECTION and nonSECTION |
| Vector Operations | NA Imputation | `fVec.na.locf` | Fill NA using Last Observation Carried Forward | `x`, `fillLeadingNA`, `defaultValue`, `verbose` | Vector with NAs filled |
| **List Operations** | Output/Display | `f_list.dput_line_by_line` | Print list elements line by line | `list_vec`, `space_between_vec_elements`, `space_between_list_elements`, `sep_parentheses`, `end_of_text` | NULL (side effect: prints) |
| List Operations | Output/Display | `f_list.str_by_element` | Print str() for each list element | `ls`, `max.level`, `give.attr`, `tabInsteadOfSpace`, `width`, `strict.width` | NULL (side effect: prints) |
| List Operations | Output/Display | `f_list.print_by_element` | Print each list element | `ls`, `tabInsteadOfSpace`, `width`, `strict.width` | NULL (side effect: prints) |
| List Operations | Output/Display | `f_list_tibble.print_by_element` | Print each list element as tibble | `ls`, `n`, `tabInsteadOfSpace`, `width`, `strict.width` | NULL (side effect: prints) |
| List Operations | Parsing | `f_chrNameValuePairs2vector` | Parse name=value pairs into named vector | `chrNameValuePairs`, `NameValuePair_separator`, `Name_Value_separator`, `vecNamed.swap` | Named character vector |
| List Operations | Attribute Handling | `fLs.map_keepAttrs` | Apply function while preserving attributes | `inputList`, `funCallback`, `drop_env_objects`, `verbose` | List with preserved attributes |
| List Operations | Environment Cleaning | `fLs.removeEnvAttr` | Remove .Environment attributes from nested list | `inputList`, `drop_env_objects`, `convert_env_to_list`, `verbose` | Cleaned list |
| List Operations | Environment Checking | `fLs.hasEnvAttr` | Check if list contains environment references | `inputList`, `max_paths` | Logical (TRUE if environments found) |
| List Operations | Environment Cleaning | `fLs.removeEnvAttr.str` | Print str() of cleaned list | `inputList`, `...` | NULL (side effect: prints) |
| List Operations | Environment Cleaning | `fLs.removeEnvAttr.saveRDS` | Clean list and save to RDS | `inputList`, `file_path`, `compression`, `drop_env_objects`, `convert_env_to_list`, `verbose` | Invisible file path |
| **Matrix/Array Operations** | Conversion | `f_list_list.to_matrix` | Convert nested list to matrix | `list_list`, `type` | Matrix |
| Matrix/Array Operations | Conversion | `f_list_list.to_data_frame` | Convert nested list to data frame | `list_list`, `type` | Data frame with rownames column |
| Matrix/Array Operations | Conversion | `f_matrix.to_list_list` | Convert matrix to nested list | `input_matrix`, `type` | Nested list |
| Matrix/Array Operations | Conversion | `f_matrix.set_names.to_vector` | Convert matrix to named vector | `input_matrix` | Named vector |
| **Data Frame Operations** | Filtering | `fDf.fiter_different_rows` | Filter rows where two columns differ | `inputDf`, `colName1`, `colName2`, `output_varName`, `add_row_number`, `na_mode`, `tol`, `verbose`, `prefix`, `suffix`, `add_original_cols` | Data frame of mismatched rows |
| Data Frame Operations | Consistency Check | `fDf.checkConstancyAcrossVars` | Check constancy of variables across longitudinal waves | `dfInput`, `pattern`, `varname4ID`, `min_nonNA`, `output_autosave`, `output_dir`, `return_type`, `VERBOSE` | List with consistency results |
| Data Frame Operations | Consistency Check | `fDf.checkConstancyAcrossVars.lgl` | Quick logical constancy check | `dfInput`, `pattern`, `return_ids`, `varname4ID` | Logical vector or character vector of IDs |
| Data Frame Operations | Filtering | `fDf.filter_mismatched_rows` | Filter rows with inconsistent values across columns | `dfInput`, `pattern`, `varname4ID`, `select_only_matched_cols` | Data frame of inconsistent rows |
| Data Frame Operations | Mutation | `f_df.add_VarNameT.deltaT0` | Add delta (difference) column | `DS.DNR`, `VarName0`, `VarNameT`, `prefix`, `suffix`, `logical_as_numeric` | Data frame with new column |
| Data Frame Operations | Mutation | `f_df.add_VarNameT.pdeltaT0` | Add percentage delta column | `DS.DNR`, `VarName0`, `VarNameT`, `prefix`, `suffix`, `logical_as_numeric` | Data frame with new column |
| Data Frame Operations | Mutation | `f_df.add_RegExVars.kbins` | Add binned (cut) variables | `DS.DNR`, `regex_pattern`, `breaks`, `suffix` | Data frame with binned columns |
| Data Frame Operations | Mutation | `f_df.add_RegExVars.quintile_factor` | Add quintile factor columns | `DS.DNR`, `regex_pattern`, `factor.ordered` | Data frame with quintile columns |
| Data Frame Operations | Mutation | `f_df.add_RegExVars.quartile_factor` | Add quartile factor columns | `DS.DNR`, `regex_pattern`, `factor.ordered` | Data frame with quartile columns |
| **Object/Structure Operations** | Display | `str_max_level1` | str() with max.level=1 | `object`, `...` | NULL (side effect: prints) |
| Object/Structure Operations | Display | `str_max_level2` | str() with max.level=2 | `object`, `...` | NULL (side effect: prints) |
| Object/Structure Operations | Display | `str_give_attr_F` | str() without attributes | `object`, `...` | NULL (side effect: prints) |
| Object/Structure Operations | Display | `str_max_level1.give_attr_F` | str() level 1 without attributes | `object`, `...` | NULL (side effect: prints) |
| Object/Structure Operations | Display | `str_max_level2.give_attr_F` | str() level 2 without attributes | `object`, `...` | NULL (side effect: prints) |
| Object/Structure Operations | String Building | `paste0_collapse0` | paste0 with collapse="" | `...`, `collapse`, `DEBUGMODE` | Character string |
| Object/Structure Operations | String Building | `paste0_collapse0.print` | paste0 with collapse and print | `...`, `collapse` | NULL (side effect: prints) |
| Object/Structure Operations | Output | `cat0` | cat with trailing newline | `...` | NULL (side effect: prints) |
| Object/Structure Operations | Output | `catLF` | cat with line feed separators | `...`, `trailing_double_spaces` | NULL (side effect: prints) |
| Object/Structure Operations | Output | `deparse.cat0` | deparse and cat | `object`, `width.cutoff` | NULL (side effect: prints) |
| Object/Structure Operations | Memory | `fObject.DfObjectSize_IEC` | Report object memory size in IEC units | `inputObjects`, `digits`, `env`, `return`, `verbose` | Tibble or named list with sizes |
| **Environment Operations** | Conversion | `fEnv.asList.allNames` | Convert environment to list including hidden names | `inputEnv`, `all.names`, `sorted` | List |
| **Export Operations** | JSON Export | `fLsLs_exportJSON` | Export nested list to JSON file | `inputLsLs`, `outputFilePathText`, `prettyBool`, `autoUnboxBool`, `naStringText`, `autoTimestampBool`, `output_to_console`, `verboseBool` | Character file path |
| Export Operations | CSV Export | `fLsLs_exportCSV` | Export list to CSV with smart serialization | `inputLsLs`, `outputFilePathText`, `serializationMethodText`, `autoTimestampBool`, `multiRowCSV`, `output_to_console`, `str_to_console`, `verboseBool` | Character file path |
| Export Operations | Path Generation | `f.generateText4OutputPath` | Generate output file path with timestamp | `pathText`, `extensionText`, `outputDirText`, `timestampBool`, `verboseBool` | Character file path |

## Function Naming Convention

The codebase follows a consistent naming convention:

- `f_` or `f.` - function prefix
- `fChr` - Character operations
- `fVec` - Vector operations
- `fDf` - Data frame operations
- `fLs` - List operations
- `fMat` - Matrix operations
- `fArr` - Array operations
- `fObj` - Object operations
- `fStr` - String/structure operations
- `fSys` - System operations
- `fEnv` - Environment operations
- `fNum` - Numeric operations

## Source File Organization

| Source File | Primary Category |
|-------------|-----------------|
| `fChr-fFilePath-fURL-source.R` | File path, URL, and character operations |
| `fChr-fFilePath.read-source.R` | File reading operations |
| `fChr-fFilePath.save-source.R` | File saving operations |
| `fChr-fFilePath.update-source.R` | File update operations |
| `fChr-fFilePath.git-source.R` | Git-related operations |
| `fChr-fFilePath.BACKUP-source.R` | Backup operations |
| `fChr-fFilePath.open.edit-source.R` | File open/edit operations |
| `fChr-fRegEx-source.R` | Regular expression operations |
| `fVecChr-source.R` | Character vector operations |
| `fVecNum-source.R` | Numeric vector operations |
| `fLs-fVec-source.R` | List and vector operations |
| `fLsLs-fMat-fArr-source.R` | Nested list, matrix, array operations |
| `fDf.filter-source.R` | Data frame filtering operations |
| `fDf.mutate-source.R` | Data frame mutation operations |
| `fObj-fStr-source.R` | Object and string/structure operations |
| `fSys-fEnv-source.R` | System and environment operations |

---

*Generated by claude.ai agent for tidystat package documentation*
