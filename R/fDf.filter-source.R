##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 1) ----  
# 〚〛 SOURCE)                                                                #L229
# 〚〛 Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B                   #L260
# 〚〛 env1\$f\$f_object                                                      #L283
# 〚〛 env1\$f\$f_str                                                         #L283
# 〚〛 env1\$f\$f_vec                                                         #L395
# 〚〛 env1\$f\$f_list                                                        #L396
# 〚〛 env1\$f\$f_list_list                                                   #L796
# 〚〛 env1\$f\$f_matrix                                                      #L797
# 〚〛 env1\$f\$f_array                                                       #L798
# 〚〛 env1\$f\$f_formula                                                     #L887
# 〚〛 env1\$f\$f_df                                                          #L966
# 〚〛 env1\$env.internal functions                                           #L1155
# 〚〛 source()                                                               #L1631
# ls.str(env1) #                                                            #L1700
# ls.str(env1$env.internal) #                                               #L1701
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 2) ----  

# 〚〛 env1\$f\$f_df                                                          #L966
# 〚〛 env1\$f\$f_DS                                                          #L966
## :: f_df.tribble_construct =                                              #L968
## :: f_df.transpose =                                                      #L984
## :: f_df.t.tribble_construct =                                            #L998
## :: f_df.print_byVar =                                                    #L1015
## :: f_df.add_VarNameT.deltaT0 =                                           #L1030
## :: f_df.add_VarNameT.pdeltaT0 =                                          #L1045
## :: f_df.add_RegExVars.kbins =                                            #L1060
## :: f_df.add_RegExVars.quintile_factor =                                  #L1089
## :: f_df.add_RegExVars.quartile_factor =                                  #L1120
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: fDf.fiter_different_rows ====  
#' @title fDf.fiter_different_rows
#'
#' @description Filters rows from a data frame where two columns differ based
#'   on user-specified rules (multi-level NA handling, numeric tolerance, row
#'   numbering, optional addition of original columns, etc.).
#'
#' @param inputDf A data frame with at least two columns.
#' @param colName1,colName2 Character strings for the columns to compare. Defaults
#'   to the first two columns if none provided.
#' @param output_varName A string naming the mismatch indicator column
#'   (default: "mismatched").
#' @param add_row_number Logical. If \code{TRUE}, adds a row number column
#'   (default \code{FALSE}).
#' @param na_mode How to treat rows with \code{NA}:
#'   \itemize{
#'     \item \code{"distinct"}: \code{NA} vs. \code{NA} is considered a mismatch
#'     \item \code{"match"}: \code{NA} vs. \code{NA} is \emph{not} a mismatch
#'     \item \code{"ignore"}: If \emph{either} is \code{NA}, that row is \emph{not} a mismatch
#'   }
#'   Defaults to \code{"distinct"}.
#' @param tol Numeric tolerance for floating-point comparisons (default \code{1e-8}).
#' @param verbose Logical. If \code{TRUE}, prints summary info (default \code{FALSE}).
#' @param prefix A string prefix for newly created columns (default: "").
#' @param suffix A string suffix for newly created columns (default: "").
#' @param add_original_cols Logical. If \code{TRUE}, adds copies of the compared
#'   columns (with prefix/suffix) to the mismatch output (default \code{FALSE}).
#'
#' @return A data frame of mismatched rows. It will include:
#'   \itemize{
#'     \item A logical column named by \code{output_varName} (default "mismatched").
#'     \item If \code{add_row_number=TRUE}, an integer row number column.
#'     \item If \code{add_original_cols=TRUE}, copies of the two compared columns.
#'   }
#'
#' @examples
#' # 1) Auto-detect columns in a data frame with exactly 2 columns
#' df_2col = data.frame(x = c(1, 2, 2,  NA),
#'                      y = c(1, 2, 4,  NA))
#' fDf.fiter_different_rows(df_2col)
#'
#' # 2) Multi-column data frame => specify which columns to compare
#' df_3col = data.frame(a = 1:3, b = c(1,2,2), c = c("A","A","B"))
#' fDf.fiter_different_rows(df_3col, colName1="a", colName2="b", verbose=TRUE)
#'
#' # 3) Numeric tolerance example
#' df_tol = data.frame(colA = c(1.00000001, 2.0),
#'                     colB = c(1.00000000, 2.00000010))
#' fDf.fiter_different_rows(df_tol)
#'
#' # 4) NA handling modes
#' df_na = data.frame(colA = c(1,  NA, NA),
#'                    colB = c(1,   2, NA))
#' # "distinct": row 2 & row 3 => mismatch
#' fDf.fiter_different_rows(df_na, na_mode="distinct")
#' # "match": only row 2 => mismatch
#' fDf.fiter_different_rows(df_na, na_mode="match")
#' # "ignore": no rows => mismatch
#' fDf.fiter_different_rows(df_na, na_mode="ignore")
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fDf.fiter_different_rows"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
  inputDf,
  colName1 = names(inputDf)[1],
  colName2 = names(inputDf)[2],
  output_varName = "mismatched",
  add_row_number = FALSE,
  na_mode = c("distinct","match","ignore"),
  tol = 1e-8,
  verbose = FALSE,
  prefix = "",
  suffix = "",
  add_original_cols = FALSE
) {
  # 1) Basic validations
  if (!inherits(inputDf, "data.frame")) {
    stop("The 'inputDf' must be a data frame.")
  }
  if (ncol(inputDf) < 2) {
    stop("The 'inputDf' must have at least two columns.")
  }

  na_mode = match.arg(na_mode)

  # Ensure columns exist
  if (!all(c(colName1, colName2) %in% names(inputDf))) {
    missing_cols = c(colName1, colName2)[!(c(colName1, colName2) %in% names(inputDf))]
    stop(paste0("Column(s) ", paste(missing_cols, collapse=", "), " not found in data."))
  }

  # Warn if types differ
  class1 = class(inputDf[[colName1]])
  class2 = class(inputDf[[colName2]])
  if (!identical(class1, class2)) {
    warning("Column types differ: '", colName1, "' is ", class1,
            " vs. '", colName2, "' is ", class2,
            ". Type conversion may affect comparisons.")
  }

  # 2) Optionally add a row number column
  if (isTRUE(add_row_number)) {
    rowNumberCol = paste0(prefix, "row_number", suffix)
    if (rowNumberCol %in% names(inputDf)) {
      warning(paste("Row number column", rowNumberCol, "already exists; will be overwritten."))
    }
    inputDf[[rowNumberCol]] = seq_len(nrow(inputDf))
  }

  # 3) Extract columns
  col1 = inputDf[[colName1]]
  col2 = inputDf[[colName2]]

  # Convert factors => character
  if (is.factor(col1)) {
    col1 = as.character(col1)
    if (verbose) message("Converting '", colName1, "' from factor to character for comparison.")
  }
  if (is.factor(col2)) {
    col2 = as.character(col2)
    if (verbose) message("Converting '", colName2, "' from factor to character for comparison.")
  }

  # 4) Define row-by-row mismatch logic
  .rowMismatch = function(v1, v2) {
    # NA logic
    if (is.na(v1) || is.na(v2)) {
      if (na_mode == "ignore") {
        return(FALSE)
      } else if (na_mode == "match") {
        return(xor(is.na(v1), is.na(v2)))
      } else if (na_mode == "distinct") {
        return(TRUE)
      }
    }
    # If not NA => compare
    if (is.numeric(v1) && is.numeric(v2)) {
      return(abs(v1 - v2) > tol)
    } else {
      return(v1 != v2)
    }
  }

  # Apply mismatch logic across rows
  mismatchVec = mapply(.rowMismatch, col1, col2)

  # 5) Subset rows
  mismatchRows = inputDf[mismatchVec, , drop=FALSE]

  # 6) Add mismatch indicator column
  mismatchColName = paste0(prefix, output_varName, suffix)
  if (nrow(mismatchRows) > 0) {
    mismatchRows[[mismatchColName]] = TRUE
  } else {
    # Safely add an empty logical column if no mismatches
    mismatchRows[[mismatchColName]] = logical(0)
  }

  # 7) Optionally add the original columns
  if (isTRUE(add_original_cols) && nrow(mismatchRows) > 0) {
    newCol1Name = paste0(prefix, colName1, suffix)
    newCol2Name = paste0(prefix, colName2, suffix)
    mismatchRows[[newCol1Name]] = mismatchRows[[colName1]]
    mismatchRows[[newCol2Name]] = mismatchRows[[colName2]]
  }

  # 8) Verbose summary
  if (verbose) {
    message("Total rows in original data frame: ", nrow(inputDf))
    message("Number of mismatched rows: ", nrow(mismatchRows))

    # Summarize NA patterns vs. differences
    na_pattern_counts = table(
      ifelse(is.na(col1) & is.na(col2), "both_NA",
             ifelse(is.na(col1) & !is.na(col2), "only_col1_NA",
                    ifelse(!is.na(col1) & is.na(col2), "only_col2_NA",
                           ifelse(col1 == col2, "equal_values", "different_values")))),
      useNA = "no"
    )

    message("\nNA and difference patterns:")
    print(na_pattern_counts)

    # If numeric, show difference summary above tolerance
    if (is.numeric(col1) && is.numeric(col2)) {
      message("\nUsing numeric tolerance: ", tol)
      not_na_idx = !is.na(col1) & !is.na(col2)
      if (any(not_na_idx)) {
        differences = col1[not_na_idx] - col2[not_na_idx]
        diff_idx = abs(differences) > tol
        if (any(diff_idx)) {
          diff_summary = summary(differences[diff_idx])
          message("\nStatistics for differences exceeding tolerance (col1 - col2):")
          message("Count: ", sum(diff_idx))
          print(diff_summary)
        } else {
          message("\nNo differences exceeding tolerance found in non-NA rows.")
        }
      }
    }
  }

  return(mismatchRows)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) fiter_different_rows  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "fiter_different_rows")


# __________|------  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: fDf.checkConstancyAcrossVars ====  
#' Check Constancy of Variables Across Waves in Longitudinal Data
#'
#' @description
#' Verifies if variables maintain constant values across different waves,
#' accounting for missing values while identifying any inconsistencies.
#'
#' @param dfInput Data frame containing longitudinal data
#' @param pattern Regex pattern to identify variables (e.g., "SEX$" or "A0[013-9]_SEX")
#' @param varname4ID Name of ID column (NULL for row numbers)
#' @param min_nonNA Minimum non-NA values needed to determine consistency (default: 2)
#' @param output_autosave Whether to save inconsistencies to CSV (default: FALSE)
#' @param output_dir Directory to save output files (default: "./output")
#' @param return_type What to return: "standard", "summary", or "detailed"
#' @param VERBOSE Logical flag for diagnostic messages
#'
#' @return A list containing:
#'   - rowwise_tbl: Logical vectors for constant/inconsistent/undetermined rows
#'   - summary: Data frame with consistency statistics
#'   - discrepancies: Detailed inconsistent records (if return_type="detailed")
#'   - wave_patterns: Which values appeared in which waves (if return_type="detailed")
#'   - all_consistent: Overall consistency flag
#'   - output_files: Paths to saved CSV files (if output_autosave=TRUE)
#'
#' @examples
#' # Basic usage
#' out_list <- fDf.checkConstancyAcrossVars(longitudinal_data, "SEX$")
#' 
#' # Use pattern to select specific waves (exclude wave 2)
#' out_list <- fDf.checkConstancyAcrossVars(
#'   longitudinal_data, "A0[13-9]_SEX$",
#'   varname4ID = "ID", 
#'   return_type = "detailed",
#'   VERBOSE = TRUE
#' )
#'
#' @export
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fDf.checkConstancyAcrossVars"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
        dfInput,
        pattern,
        varname4ID = NULL,
        min_nonNA = 2,
        output_autosave = FALSE,
        output_dir = "./output",
        return_type = c("standard", "summary", "detailed"),
        VERBOSE = isTRUE(getOption("verbose"))
) {
    # Match return type argument
    return_type <- match.arg(return_type)
    
    # Input validation
    if (!is.data.frame(dfInput)) {
        stop("Input must be a data frame")
    }
    if (!is.character(pattern) || length(pattern) != 1) {
        stop("Pattern must be a single character string")
    }
    if (!is.null(varname4ID) && !(varname4ID %in% names(dfInput))) {
        stop("ID variable not found in data frame")
    }
    
    # Extract variables to check based on pattern
    cols_vec <- grep(pattern, names(dfInput), value = TRUE)
    
    if (length(cols_vec) == 0) {
        stop("No columns match the specified pattern: ", pattern)
    }
    
    if (length(cols_vec) < 2) {
        warning("Insufficient columns (", length(cols_vec), ") for comparison")
        return(invisible(NULL))
    }
    
    if (VERBOSE) {
        message("Checking constancy across ", length(cols_vec), " variables:")
        message(paste(cols_vec, collapse = ", "))
    }
    
    # Extract only the matching columns
    selected_data <- dfInput[, cols_vec, drop = FALSE]
    
    # Core consistency check with detailed pattern analysis
    check_results <- apply(selected_data, 1, function(row) {
        non_na_values <- row[!is.na(row)]
        unique_values <- unique(non_na_values)
        
        # Check if there are enough non-NA values to determine consistency
        if (length(non_na_values) < min_nonNA) {
            return(list(
                is_consistent = NA,
                unique_values = unique_values,
                wave_patterns = NULL
            ))
        }
        
        # Check consistency and create wave patterns for inconsistent rows
        is_consistent <- length(unique_values) == 1
        wave_patterns <- NULL
        
        if (!is_consistent) {
            wave_patterns <- list()
            for (value in unique_values) {
                waves_with_value <- cols_vec[which(row == value)]
                wave_patterns[[as.character(value)]] <- waves_with_value
            }
        }
        
        return(list(
            is_consistent = is_consistent,
            unique_values = unique_values,
            wave_patterns = wave_patterns
        ))
    })
    
    # Extract results
    is_consistent <- sapply(check_results, function(x) x$is_consistent)
    wave_patterns <- lapply(check_results, function(x) x$wave_patterns)
    
    # Three-state classification
    rowwise_tbl <- tibble(
        constant = is_consistent %in% TRUE,
        inconsistent = is_consistent %in% FALSE,
        undetermined = is.na(is_consistent)
    )
    
    # Summary statistics
    summary_stats <- data.frame(
        total_rows = nrow(dfInput),
        n_constant = sum(rowwise_tbl$constant, na.rm = TRUE),
        n_inconsistent = sum(rowwise_tbl$inconsistent, na.rm = TRUE),
        n_undetermined = sum(rowwise_tbl$undetermined, na.rm = TRUE),
        consistency_rate = round(100 * sum(rowwise_tbl$constant, na.rm = TRUE) / 
                                     (sum(rowwise_tbl$constant, na.rm = TRUE) + 
                                          sum(rowwise_tbl$inconsistent, na.rm = TRUE)), 1)
    )
    
    # Create discrepancy data for inconsistent rows
    discrepancies <- NULL
    output_files <- character(0)
    
    if (any(rowwise_tbl$inconsistent)) {
        # Get indices of inconsistent rows
        inconsistent_indices <- which(rowwise_tbl$inconsistent)
        
        # Create ID column
        id_column <- if (!is.null(varname4ID)) {
            dfInput[[varname4ID]][inconsistent_indices]
        } else {
            inconsistent_indices
        }
        
        # Extract inconsistent data
        discrepancies <- data.frame(
            ID = id_column,
            dfInput[inconsistent_indices, cols_vec, drop = FALSE],
            stringsAsFactors = FALSE
        )
        names(discrepancies)[1] <- if (!is.null(varname4ID)) varname4ID else "RowNum"
        
        # Display information if VERBOSE
        if (VERBOSE) {
            message("\nInconsistent rows found: ", nrow(discrepancies))
            message("Sample discrepancies (first 5):")
            print(utils::head(discrepancies, 5))
        }
        
        # Save output if requested
        if (output_autosave) {
            # Create output directory if it doesn't exist
            if (!dir.exists(output_dir)) {
                dir.create(output_dir, recursive = TRUE)
            }
            
            # Create timestamp for output files
            timestamp <- format(Sys.time(), "%y%m%dT%H%M")
            
            # Get source file name without extension
            source_file <- tryCatch({
                tools::file_path_sans_ext(basename(rstudioapi::getSourceEditorContext()$path))
            }, error = function(e) {
                "consistency_check"
            })
            
            # Create output filename
            output_file <- file.path(output_dir, paste0(
                source_file, "_", gsub("[^a-zA-Z0-9]", "", pattern), "-", timestamp, ".csv"))
            
            # Save inconsistent data to CSV
            utils::write.csv(discrepancies, output_file, row.names = FALSE)
            output_files <- c(output_files, output_file)
            
            if (VERBOSE) {
                message("Saved inconsistent rows to: ", output_file)
            }
        }
    } else if (VERBOSE) {
        message("\nNo inconsistencies found!")
    }
    
    # Prepare return value based on return_type
    out_list <- list(
        all_consistent = sum(rowwise_tbl$inconsistent, na.rm = TRUE) == 0,
        rowwise_tbl = rowwise_tbl,
        summary_stats = summary_stats,
        output_files = output_files
    )
    
    if (return_type %in% c("standard", "detailed")) {
        out_list$discrepancies <- discrepancies
    }
    
    if (return_type == "detailed") {
        # Add wave patterns for inconsistencies
        out_list$wave_patterns <- if (!is.null(discrepancies)) {
            wave_patterns[rowwise_tbl$inconsistent]
        } else {
            NULL
        }
    }
    
    return(out_list)
}



##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: fDf.checkConstancyAcrossVars.lgl ====  

#' Quick Check for Variable Constancy Across Waves
#'
#' @description
#' A simplified version for quick constancy checks
#'
#' @param dfInput Data frame containing longitudinal data
#' @param pattern Regex pattern to identify variables (e.g., "SEX$")
#' @param return_ids If TRUE, returns IDs of inconsistent rows
#' @param varname4ID Name of ID column (required if return_ids=TRUE)
#'
#' @return Either a logical vector (TRUE=inconsistent) or vector of inconsistent IDs
#'
#' @examples
#' # Get logical vector of inconsistencies
#' inconsistent <- fDf.checkConstancyAcrossVars.lgl(data, "SEX$")
#' 
#' # View inconsistent rows
#' data[inconsistent, ]
#'
#' @export
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fDf.checkConstancyAcrossVars.lgl"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(dfInput, pattern, return_ids = FALSE, varname4ID = NULL) {
    # Input validation
    if (!is.data.frame(dfInput)) {
        stop("Input must be a data frame")
    }
    if (return_ids && is.null(varname4ID)) {
        stop("varname4ID must be provided when return_ids=TRUE")
    }
    
    # Extract columns matching the pattern
    cols_vec <- grep(pattern, names(dfInput), value = TRUE)
    
    if (length(cols_vec) < 2) {
        warning("Insufficient columns (", length(cols_vec), ") for comparison")
        return(if (return_ids) character(0) else rep(FALSE, nrow(dfInput)))
    }
    
    # Check consistency
    lgl.inconsistent <- apply(dfInput[, cols_vec, drop = FALSE], 1, function(row) {
        non_na <- row[!is.na(row)]
        length(non_na) >= 2 && length(unique(non_na)) > 1
    })
    
    # Return appropriate type of results
    if (return_ids) {
        if (sum(lgl.inconsistent) == 0) return(character(0))
        return(dfInput[[varname4ID]][lgl.inconsistent])
    } else {
        return(lgl.inconsistent)
    }
}


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: fDf.filter_mismatched_rows ====  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fDf.filter_mismatched_rows"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(dfInput, pattern = ".", varname4ID = NULL, select_only_matched_cols = TRUE) {
    
    lgl.inconsistent <- env1$f$fDf.checkConstancyAcrossVars.lgl(dfInput, pattern)
    if(is.null(varname4ID)) {
        dfInput = dfInput %>% rownames_to_column()
        varname4ID = "rowname"
    } else if (!varname4ID %in% names(dfInput)) {
        stop("varname4ID must be a column name in dfInput")
    }
    dfOutput = dfInput[lgl.inconsistent, ]

    if (select_only_matched_cols) {
        dfOutput = dfOutput[, unique(c(varname4ID, grep(pattern, names(dfInput), value = TRUE))), drop = FALSE]
    } 
    
    dfOutput
}

##### ❡ EX) env1$f$fDf.filter_mismatched_rows() ----
######      🄾 env1$f$fDf.filter_mismatched_rows(longitudinal_data, "SEX", varname4ID = "ID") ----
# env1$f$fDf.filter_mismatched_rows(longitudinal_data, "SEX", varname4ID = "ID")
# # > env1$f$fDf.filter_mismatched_rows(longitudinal_data, "SEX", varname4ID = "ID")
# #      ID W1_SEX W2_SEX W3_SEX W4_SEX W5_SEX W0_SEX
# # 1  1001      1      1      1      2      1      1
# # 5  1005      2      2      1      2      2      2
# # 10 1010      2      2      2      1      2      2
# # 17 1017      2     NA      2      2      1      2
# # 20 1020      1      2      1      1      1      1
# # 25 1025      1     NA     NA      2      2      1
# # 41 1041      2      2      2      2      1      2
# # 58 1058      2      2      1      2      2      2
# # 64 1064      2      1      2     NA      2      2
# # 76 1076      2      2      1      2      2      2
# # 87 1087      1      2      1      1      1      1
# 
# 
######      🄾 longitudinal_data %>% select(matches("SEX")) %>% env1$f$fDf.filter_mismatched_rows() ----
# longitudinal_data %>% select(matches("SEX")) %>% env1$f$fDf.filter_mismatched_rows()
# # > longitudinal_data %>% select(matches("SEX")) %>% env1$f$fDf.filter_mismatched_rows()
# #    rowname W1_SEX W2_SEX W3_SEX W4_SEX W5_SEX W0_SEX
# # 1        1      1      1      1      2      1      1
# # 5        5      2      2      1      2      2      2
# # 10      10      2      2      2      1      2      2
# # 17      17      2     NA      2      2      1      2
# # 20      20      1      2      1      1      1      1
# # 25      25      1     NA     NA      2      2      1
# # 41      41      2      2      2      2      1      2
# # 58      58      2      2      1      2      2      2
# # 64      64      2      1      2     NA      2      2
# # 76      76      2      2      1      2      2      2
# # 87      87      1      2      1      1      1      1


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) fDf.filter_inconsistent_rows  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "fDf.filter_inconsistent_rows")

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) filter_mismatched_rows  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "filter_mismatched_rows")



# __________|------  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: simulate_longitudinal_data ====  
#' Simulate Longitudinal Dataset for Testing
#'
#' @description
#' Creates a simulated longitudinal dataset with controlled consistency issues
#'
#' @param n_subjects Number of subjects
#' @param n_waves Number of waves
#' @param error_rates List of error rates for different variables
#'
#' @return A data frame with simulated longitudinal data
#'
#' @examples
#' data <- simulate_longitudinal_data(100, 5)
#' 
#' @export
.tmp$env1_subenv_name = "env.internal"
.tmp$objectname = "simulate_longitudinal_data"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(n_subjects = 100, n_waves = 5, seed = 1,
                                       error_rates = list(
                                           SEX = 0.03,
                                           EDU = 0.05,
                                           BIRTHYEAR = 0.01
                                       )) {
    set.seed(seed)
    # Create base data frame
    sim_data <- data.frame(ID = 1000 + 1:n_subjects)
    
    # Generate base values
    sex_base <- sample(1:2, n_subjects, replace = TRUE)
    edu_base <- sample(1:6, n_subjects, replace = TRUE)
    birth_year_base <- sample(1950:1990, n_subjects, replace = TRUE)
    
    # For each wave, add variables
    for (wave in 1:n_waves) {
        wave_prefix <- paste0("W", wave, "_")
        
        # SEX variable
        sex_values <- sex_base
        if (wave > 1) {
            # Add missing values
            missing_idx <- sample(1:n_subjects, n_subjects * 0.1)
            sex_values[missing_idx] <- NA
            
            # Introduce errors
            error_idx <- sample(1:n_subjects, n_subjects * error_rates$SEX)
            sex_values[error_idx] <- ifelse(sex_base[error_idx] == 1, 2, 1)
        }
        sim_data[[paste0(wave_prefix, "SEX")]] <- sex_values
        
        # EDUCATION variable
        edu_values <- edu_base
        if (wave > 1) {
            missing_idx <- sample(1:n_subjects, n_subjects * 0.15)
            edu_values[missing_idx] <- NA
            
            error_idx <- sample(1:n_subjects, n_subjects * error_rates$EDU)
            edu_values[error_idx] <- sample(1:6, length(error_idx), replace = TRUE)
        }
        sim_data[[paste0(wave_prefix, "EDU")]] <- edu_values
        
        # BIRTHYEAR variable
        birth_values <- birth_year_base
        if (wave > 1) {
            missing_idx <- sample(1:n_subjects, n_subjects * 0.05)
            birth_values[missing_idx] <- NA
            
            error_idx <- sample(1:n_subjects, n_subjects * error_rates$BIRTHYEAR)
            birth_values[error_idx] <- birth_year_base[error_idx] + sample(-2:2, length(error_idx), replace = TRUE)
        }
        sim_data[[paste0(wave_prefix, "BIRTHYEAR")]] <- birth_values
        
        # Add a variable that's expected to change (WEIGHT)
        base_weight <- rnorm(n_subjects, mean = 70, sd = 15)
        weight_values <- base_weight + rnorm(n_subjects, mean = 0, sd = 2 * wave/n_waves)
        sim_data[[paste0(wave_prefix, "WEIGHT")]] <- round(weight_values, 1)
    }
    
    # Add reference variables (like A00_SEX)
    sim_data$W0_SEX <- sex_base
    sim_data$W0_EDU <- edu_base
    sim_data$W0_BIRTHYEAR <- birth_year_base
    
    return(sim_data)
}

##### ❡ EX) env1$env.internal$simulate_longitudinal_data() ----
# 
# longitudinal_data <- env1$env.internal$simulate_longitudinal_data(100, 5)
# longitudinal_data %>% str
# # > longitudinal_data %>% str
# # 'data.frame':	100 obs. of  24 variables:
# #  $ ID          : num  1001 1002 1003 1004 1005 ...
# #  $ W1_SEX      : int  1 2 1 1 2 1 1 1 2 2 ...
# #  $ W1_EDU      : int  4 4 1 5 5 6 1 1 3 6 ...
# #  $ W1_BIRTHYEAR: int  1978 1961 1963 1987 1965 1964 1951 1950 1952 1958 ...
# #  $ W1_WEIGHT   : num  54.3 91.9 55.1 76.2 64.2 76.5 94.9 94.6 64.9 36.4 ...
# #  $ W2_SEX      : num  1 2 1 1 2 1 1 1 2 2 ...
# #  $ W2_EDU      : int  4 4 1 5 NA 6 1 1 3 6 ...
# #  $ W2_BIRTHYEAR: int  1978 1961 1963 1987 1965 1964 1951 1950 1952 1958 ...
# #  $ W2_WEIGHT   : num  79.9 102 42.3 78.6 58 61.7 42 67.3 74.2 48.5 ...
# #  $ W3_SEX      : num  1 2 1 1 1 1 1 1 2 2 ...
# #  $ W3_EDU      : int  4 4 1 5 5 NA 1 1 NA 6 ...
# #  $ W3_BIRTHYEAR: int  1978 1961 1961 1987 1965 1964 1951 1950 1952 1958 ...
# #  $ W3_WEIGHT   : num  95.9 49.4 72.3 23.5 72.5 78.9 54.7 79.8 75 85.4 ...
# #  $ W4_SEX      : num  2 2 1 1 2 1 1 1 2 1 ...
# #  $ W4_EDU      : int  4 NA 4 5 5 3 1 1 3 6 ...
# #  $ W4_BIRTHYEAR: int  1978 1961 1963 1987 1965 1964 1951 1950 1952 1958 ...
# #  $ W4_WEIGHT   : num  73.9 87.3 96.5 54.4 94.6 58.2 75.1 72.6 64.8 91.7 ...
# #  $ W5_SEX      : num  1 2 NA 1 2 1 1 1 2 2 ...
# #  $ W5_EDU      : int  4 4 1 5 5 6 1 NA 3 6 ...
# #  $ W5_BIRTHYEAR: int  1978 1961 1963 1987 1965 1964 1951 1950 NA 1958 ...
# #  $ W5_WEIGHT   : num  51.5 82 60.7 62.4 70 45.9 67.5 66.9 59.5 61.6 ...
# #  $ W0_SEX      : int  1 2 1 1 2 1 1 1 2 2 ...
# #  $ W0_EDU      : int  4 4 1 5 5 6 1 1 3 6 ...
# #  $ W0_BIRTHYEAR: int  1978 1961 1963 1987 1965 1964 1951 1950 1952 1958 ...




##////////////////////////////////////////////////////////////////////////////////  
##::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##********************************************************************************  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  
# 〚〛 END -----  
# cat("* To revert to the last commited file, run the following terminal command:\n", 
#     '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
