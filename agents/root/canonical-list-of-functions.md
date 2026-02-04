# Canonical List of Functions

This document enumerates the canonical functions defined in the `R/` sources and groups them by purpose. It is intended as a navigational reference for the tidystat codebase.

## Function catalog

| Category | Subcategory | Function Name | Function Purpose | Inputs | Outputs |
| --- | --- | --- | --- | --- | --- |
| File paths & output | Output directories | dir.create.outputDirPath | Create the output directory path (and directory) used by env1 output helpers. | outputDirPath (optional, defaults to env1 constant) | Directory path; side-effect creates directory |
| File paths & output | Timestamp helpers | template.yymmddThhmm | Build a compact timestamp string (yyMMddThhmm). | None | Character timestamp |
| File paths & output | Output filename helpers | outputFilenamePrefix | Return the default output filename prefix. | None | Character prefix |
| File paths & output | Output filename helpers | outputFilenamePath | Construct a full output file path using prefix and timestamp. | outputDirPath | Character file path |
| File paths & output | RDS/Excel/CSV writes | write_rds.ECHO.CodeText | Optionally write an object to RDS and echo code text for reproducibility. | .objectname, EXECUTE flags | Character code text; optional file output |
| File paths & output | RDS/Excel/CSV writes | fDf.write_xlsx_to_onedrive | Write a data frame to an Excel file with optional formatting/opening. | .objectname, .path4write, formatting params | Excel file path; optional side-effects |
| File paths & output | RDS/Excel/CSV writes | fDf.write_csv_UTF8BOM_to_onedrive | Write a UTF-8 BOM CSV to a target path. | .objectname, .path4write, options | CSV file path; optional side-effects |
| File paths & output | Timestamp helpers | f.generateText4TimeStamp.yymmddThhmm | Generate timestamp text (yyMMddThhmm). | timeFormat | Character timestamp |
| File paths & output | Timestamp helpers | f.generateText4TimeStamp.yymmddThh | Generate timestamp text (yyMMddThh). | timeFormat | Character timestamp |
| File paths & output | Timestamp helpers | f.generateText4TimeStamp.yymmdd | Generate timestamp text (yyMMdd). | timeFormat | Character timestamp |
| File paths & output | Output filename helpers | f.generateText4FileNameBase | Create a filename base from prefix/suffix and timestamp. | prefix, suffix | Character filename base |
| Code templates | Snippets | CodeSnippet.END | Print a standardized end-of-snippet block with helpful GitHub links. | None | Console output |
| Code templates | Templates | CodeTemplate.env1.env.internal.attach | Emit a template for defining an env1 function in a target sub-environment. | .objectname, .env1_subenv_name | Console output (template text) |
| Code templates | Templates | CodeTemplate.env1.env.internal.attach.ALIAS | Emit a template for defining an alias for an env1 function. | .ALIASname, .env1_subenv_name | Console output (template text) |
| Help & navigation | RStudio shortcuts | MH_shortcuts | Show a list of RStudio shortcuts. | show_hotkeys, show_cmd_code | Console output |
| Help & navigation | Working files | openWorkingFilesList | Open a curated working files list. | None | Side-effect: opens file |
| Help & navigation | Symbol paths | showSymbolPaths | Show symbol paths tracked by env1. | None | Console output |
| Help & navigation | Project paths | showProjectPathFiles | Show project path files with optional formatting. | assign_to_env1_path, printProjectPaths.* | Console output |
| Help & navigation | Project paths | showProjectPathsRecursively | Print project paths recursively. | assign_to_env1_path, printProjectPaths.* | Console output |
| Help & navigation | Project paths | showProjectPathsAtTidyStat | Print project paths under tidy stat defaults. | assign_to_env1_path, printProjectPaths.* | Console output |
| Help & navigation | Source helpers | showCodeText2open.FileName.source.r | Show code text that opens a source file. | .RelativeSubPath, .FileName.source.r, .SourceName_root, assign_to_env1_path | Console output |
| Help & navigation | Source helpers | showCodeText2openSourceInGitHub | Show code text to open the current file on GitHub. | None | Console output |
| Help & navigation | Source helpers | showCodeText2revert2LastCommit | Show code text for reverting to last commit. | None | Console output |
| Help & navigation | Session helpers | showCodeText2restartSession.pending | Show code text to restart an R session (pending). | None | Console output |
| Data frame filtering | Row comparison | fDf.fiter_different_rows | Find rows that differ between data frames. | df1, df2, ... | Data frame/list of mismatched rows |
| Data frame filtering | Constancy checks | fDf.checkConstancyAcrossVars | Check constancy across variables, with diagnostics. | dfInput, pattern, varname4ID, ... | List with consistency results |
| Data frame filtering | Constancy checks | fDf.checkConstancyAcrossVars.lgl | Logical wrapper for constancy check. | dfInput, pattern, varname4ID, ... | Logical vector/summary |
| Data frame filtering | Row mismatch | fDf.filter_mismatched_rows | Filter rows that violate a consistency pattern. | dfInput, pattern, return_ids, varname4ID | Filtered data frame or IDs |
| Data frame filtering | Simulation | simulate_longitudinal_data | Generate simulated longitudinal data for testing. | n_subjects, n_waves, seed, ... | Data frame |
| Numeric utilities | Rounding | fNum.signif_preserve_decimals | Apply significant digits while preserving initial decimal places. | numVec, signifDigitsInt, roundDigitsInt, verboseBool | Numeric vector/matrix/data frame |
| Dataset search | Entity checks | f_DS_path_FileNameExt.read.checkEntity | Read a dataset by path and check entity identifiers. | DS_path_FileNameExt, vec_candidate4ID, ... | List/diagnostics; optionally console output |
| Dataset search | Entity checks | f_DSname.Search.read.checkEntity | Search for a dataset by name, read it, and check entity identifiers. | DSN, ext, .path4read, ... | List/diagnostics; optionally console output |
| File backups | Backup creation | f_FileNameExt.createBACKUP | Create a timestamped backup copy of a file. | BACKUP_from_path_FileNameExt, BACKUP_from_ext, .BACKUP_to_path, timeFormat, overwrite | Backup file path |
| File backups | Backup creation | f_path_path.BACKUP.overwrite | Overwrite destination with a backup copy using a timestamp. | .overwrite_from_path_FileNameExt, .destination_path_FileNameExt, .BACKUP_to_path, timeFormat | Backup file path |
| File paths & output | Open/browse | fPath.browseURL | Open a URL or path with the system browser. | ... | Side-effect: opens URL |
| Environment utilities | Env inspection | fEnv.asList.allNames | Convert an environment to a list of all names. | inputEnv, all.names, sorted | List |
| Regex utilities | Regex class set ops | f_RegExChrClass1_RegExChrClass2.setdiff_list | Compute set differences between regex character classes. | RegExChrClass1, RegExChrClass2 | List of regex class diffs |
| Regex utilities | Regex class set ops | f_list_RegExChrClass.union_df | Union regex character class definitions into a data frame. | input_list_RegExChrClass | Data frame |
| File paths & output | Path listing | f_path.list_subpath.DepthFirstSearch_recursive | List subpaths using depth-first search recursion. | input_path, max_depth, include_input_path, VERBOSE, .initial_max_depth | Character vector/data frame of paths |
| File paths & output | Path listing | f_path.list_subpath.BreathFirstSearch | List subpaths using breadth-first search. | input_path, max_depth, include_input_path, VERBOSE | Character vector/data frame of paths |
| File paths & output | Path listing | f_path.list_subpath | List subpaths with configurable search strategy. | input_path, max_depth, include_input_path, VERBOSE, BreadthFirstSearch | Character vector/data frame of paths |
| String/object utilities | Structure helpers | str_max_level1 | Wrapper around str() with max.level = 1. | object, ... | Console output |
| String/object utilities | Structure helpers | str_max_level2 | Wrapper around str() with max.level = 2. | object, ... | Console output |
| String/object utilities | Structure helpers | str_give_attr_F | Wrapper around str() with give.attr = FALSE. | object, ... | Console output |
| String/object utilities | Structure helpers | str_max_level1.give_attr_F | Wrapper around str() with max.level = 1 and give.attr = FALSE. | object, ... | Console output |
| String/object utilities | Structure helpers | str_max_level2.give_attr_F | Wrapper around str() with max.level = 2 and give.attr = FALSE. | object, ... | Console output |
| String/object utilities | String concatenation | paste0_collapse0 | Paste and collapse arguments without separators. | ..., collapse | Character string |
| String/object utilities | String concatenation | paste0_collapse0.print | Paste/collapse and print the result. | ..., collapse | Console output |
| String/object utilities | Output helpers | cat0 | Cat with no separator and optional collapse. | ... | Console output |
| String/object utilities | Output helpers | catLF | Cat with LF endings. | ... | Console output |
| String/object utilities | Output helpers | deparse.cat0 | Deparse an object and cat in one step. | object, width.cutoff | Console output |
| String/object utilities | Object sizing | fObject.DfObjectSize_IEC | Return object size summary in IEC units. | inputObjects, ... | Data frame summary |
| List/vector utilities | Dput helpers | f_vec.dput_line_by_line | Format a vector with dput-style line breaks. | vec, space_between_vec_elements, sep_parentheses, end_of_text | Character string |
| List/vector utilities | Dput helpers | f_list.dput_line_by_line | Format a list with dput-style line breaks. | list_vec, space_between_vec_elements, space_between_list_elements, sep_parentheses, end_of_text | Character string |
| List/vector utilities | List formatting | f_list.str_by_element | Apply str() element-wise for a list. | ls, max.level, ... | Console output |
| List/vector utilities | List formatting | f_list.print_by_element | Print list elements one-by-one. | ls, tabInsteadOfSpace, width, ... | Console output |
| List/vector utilities | List formatting | f_list_tibble.print_by_element | Print tibble list elements with width controls. | ls, n, tabInsteadOfSpace, width, ... | Console output |
| List/vector utilities | Name/value utilities | f_chrNameValuePairs2vector | Convert name=value pairs to a named vector. | chrNameValuePairs, NameValuePair_separator, Name_Value_separator, vecNamed.swap | Named vector |
| List/vector utilities | Set operations | f_vec1_vec2.setdiff_list | Return set differences between two vectors as a list. | vec1, vec2, print_str, output_as_data_frame | List (or data frame) |
| List/vector utilities | Set operations | f_vec1_vec2.setdiff_df | Return set differences between two vectors as a data frame. | vec1, vec2, print_str | Data frame |
| List/vector utilities | Set operations | f_list_vecs.union_df | Union a list of vectors into a data frame summary. | input_list_vecs, print_str, VERBOSE | Data frame |
| List/vector utilities | String splitting | f_vec_chr.strsplit0_as_list_vec | Split character vectors without dropping empty tokens. | input_vec_chr, split, n, simplify | List of character vectors |
| List/vector utilities | String splitting | f_chr1.strsplit0_as_vec | Split a single string without dropping empty tokens. | input_chr1, split | Character vector |
| List/vector utilities | String splitting | f_chr1.strsplit0_as_vec.unique.sort | Split a string, then unique+sort tokens. | input_chr1, split | Character vector |
| List/vector utilities | Matching helpers | f_vec_chr.na_if_NotMatching | Replace non-matching tokens with NA using a regex. | input_vec_chr, RegEx4keep | Character vector |
| List/vector utilities | Line numbering | f_vec_chr.add_line_numbers | Add line numbers to a character vector. | input_vec_chr, width.cutoff, URL4line_numbers, prefix4line_numbers | Character vector |
| List/vector utilities | Line numbering | f_vec_chr.add_line_numbers.paste_collapse_LF_cat | Add line numbers and cat as a single block. | input_vec_chr, width.cutoff | Console output |
| List/vector utilities | Section parsing | f_vec_chr.list_SECTION_nonSECTION | Split vector into section and non-section chunks. | input_vec_chr, RegEx4SECTION_start, RegEx4SECTION_end | List |
| List/vector utilities | Imputation | fVec.na.locf | Last observation carried forward for vectors. | x, fillLeadingNA, defaultValue, verbose | Vector |
| List/vector utilities | Attribute helpers | fLs.map_keepAttrs | Map over list while preserving attributes. | inputList, funCallback, ... | List |
| List/vector utilities | Attribute helpers | fLs.removeEnvAttr | Remove environment attributes from a list. | inputList, ... | List |
| List/vector utilities | Attribute helpers | fLs.hasEnvAttr | Check if list elements have environment attributes. | inputList, max_paths | Logical + diagnostics |
| List/vector utilities | Attribute helpers | fLs.removeEnvAttr.str | Remove environment attributes from list and return str(). | inputList, ... | Console output |
| List/vector utilities | Attribute helpers | fLs.removeEnvAttr.saveRDS | Remove environment attributes and save to RDS. | inputList, file_path, ... | RDS file path |
| File paths & output | Search | f_FileNameExt.find_subpath | Find a file by name under a directory (depth-first default). | FileNameExt, input_path, max_depth, VERBOSE, BreathFirstSearch, findMultiple | Character path(s) |
| File paths & output | Search | f_FileNameExt.find_subpath.BreathFirstSearch | Find a file by name using breadth-first search. | FileNameExt, input_path, max_depth, VERBOSE, findMultiple | Character path(s) |
| List/list-matrix utilities | List-list conversions | f_list_list.to_matrix | Convert a list-of-lists to a matrix. | list_list, type | Matrix |
| List/list-matrix utilities | List-list conversions | f_list_list.to_data_frame | Convert a list-of-lists to a data frame. | list_list, type | Data frame |
| List/list-matrix utilities | Matrix conversions | f_matrix.to_list_list | Convert a matrix to a list-of-lists. | input_matrix, type | List of lists |
| List/list-matrix utilities | Matrix conversions | f_matrix.set_names.to_vector | Flatten matrix with row/col names into a vector. | input_matrix | Named vector |
| List/list-matrix utilities | Export | fLsLs_exportJSON | Export list-of-lists to JSON file. | inputLsLs, output_path, ... | JSON file path |
| List/list-matrix utilities | Export | fLsLs_exportCSV | Export list-of-lists to CSV file. | inputLsLs, output_path, ... | CSV file path |
| List/list-matrix utilities | Output paths | f.generateText4OutputPath | Generate output path text for exports. | outputDirPath, fileName, ... | Character path |
| Data frame mutate | Delta helpers | f_df.add_VarNameT.deltaT0 | Add delta columns between baseline and target variables. | DS.DNR, VarName0, VarNameT, prefix, suffix, logical_as_numeric | Data frame |
| Data frame mutate | Delta helpers | f_df.add_VarNameT.pdeltaT0 | Add percent-delta columns between baseline and target variables. | DS.DNR, VarName0, VarNameT, prefix, suffix, logical_as_numeric | Data frame |
| Data frame mutate | Binning | f_df.add_RegExVars.kbins | Bin variables matching a regex into k bins. | DS.DNR, regex_pattern, breaks, suffix | Data frame |
| Data frame mutate | Binning | f_df.add_RegExVars.quintile_factor | Create quintile factor columns for regex-matched vars. | DS.DNR, regex_pattern, factor.ordered | Data frame |
| Data frame mutate | Binning | f_df.add_RegExVars.quartile_factor | Create quartile factor columns for regex-matched vars. | DS.DNR, regex_pattern, factor.ordered | Data frame |
| Character/vector conversion | Numeric coercion | fChr.as_numeric_safe_automatic | Safely coerce character vectors to numeric with audit info. | char_vec, decimal_sep, thousands_sep, missing_codes, force, remove_non_num, verbose | Numeric vector or original input |
| File reads | RDS helpers | f_objectname.read_rds_or_xz | Read an RDS or RDS.xz file by object name conventions. | .objectname, .path4read, .objectfolder, .objectextension | R object |
| File reads | RDS helpers | f_FileNameExt.read_rds_or_xz | Read an RDS or RDS.xz file by file name. | filenamePath, ... | R object |
| File reads | Excel helpers | fExcelPath_readAllSheets | Read all sheets from an Excel workbook into a list. | filenamePath, ... | List of data frames |
| Git helpers | Git tracking | f_path.is_git_tracked | Check if a path is tracked by git. | path, check_parents | Logical |
| Git helpers | Git attributes | f_gitattributes.split | Split .gitattributes file into components. | ... | List/data frame |
| File updates | Comparisons | f_file2.compare | Compare two files in chunks. | file1, file2, chunk_size | Logical/equality |
| File updates | Downloads | f_url_destfile.DownloadIfDifferent | Download a URL only if remote content differs. | url, destfile, chunk_size, VERBOSE, EXECUTE | Logical/side-effect download |
| File paths & output | Directory inventory | f_path.df_dirs_recursive.df_files | Build recursive directory/file inventory data frames. | input_path, max_depth, ... | Data frame |
