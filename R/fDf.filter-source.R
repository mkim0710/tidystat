##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 1) ----  
# @@ SOURCE)                                                                #L229
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B                   #L260
# @@ env1\$f\$f_object                                                      #L283
# @@ env1\$f\$f_str                                                         #L283
# @@ env1\$f\$f_vec                                                         #L395
# @@ env1\$f\$f_list                                                        #L396
# @@ env1\$f\$f_list_list                                                   #L796
# @@ env1\$f\$f_matrix                                                      #L797
# @@ env1\$f\$f_array                                                       #L798
# @@ env1\$f\$f_formula                                                     #L887
# @@ env1\$f\$f_df                                                          #L966
# @@ env1\$env.internal functions                                           #L1155
# @@ source()                                                               #L1631
# ls.str(env1) #                                                            #L1700
# ls.str(env1$env.internal) #                                               #L1701
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 2) ----  

# @@ env1\$f\$f_df                                                          #L966
# @@ env1\$f\$f_DS                                                          #L966
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




fDf_filter_mismatched_rows = function(
  inputDf,
  colName1 = NULL,
  colName2 = NULL,
  output_varName = "is_mismatched",
  na_handling = "distinct",
  add_original_cols = FALSE,
  add_row_number = TRUE,
  tol = 1e-8,
  prefix = "",
  suffix = "",
  verbose = FALSE
) {
  #' Identify Mismatched Rows Between Two Variables in a Dataframe
  #' 
  #' This function identifies rows where values differ between two columns,
  #' with flexible handling of NA values, numeric tolerance, and output formatting options.
  #' If no column names are provided, it will automatically use the first two columns.
  #'
  #' @param inputDf A dataframe containing the variables to compare
  #' @param colName1 Name of the first variable (default: first column of inputDf)
  #' @param colName2 Name of the second variable (default: second column of inputDf)
  #' @param output_varName Name for the logical indicator column (default: "is_mismatched")
  #' @param na_handling Treatment of NA values: "distinct" (default), "ignore", or "match"
  #'                    "distinct": NA != non-NA, NA != NA
  #'                    "ignore": Skip rows with any NA values
  #'                    "match": NA == NA, NA != non-NA
  #' @param add_original_cols Logical, whether to include the original columns in output (default: FALSE)
  #' @param add_row_number Logical, whether to add row numbers to output (default: TRUE)
  #' @param tol Numeric tolerance for comparing numeric values (default: 1e-8)
  #' @param prefix Prefix to add to output column names
  #' @param suffix Suffix to add to output column names
  #' @param verbose Logical, whether to print additional information (default: FALSE)
  #'
  #' @return A dataframe containing only mismatched rows with indicator columns
  #'
  #' @examples
  #' # Basic example with column names
  #' sample_df = data.frame(
  #'   a = c(1, 2, 3, NA, 5), 
  #'   b = c(1, 3, 3, 4, NA)
  #' )
  #' fDf_filter_mismatched_rows(sample_df, "a", "b")
  #' 
  #' # Example with auto-detection of columns
  #' two_col_df = data.frame(
  #'   first = c(1, 2, 3, NA, 5),
  #'   second = c(1, 3, 3, 4, NA)
  #' )
  #' fDf_filter_mismatched_rows(two_col_df)
  #'
  #' # Example with different NA handling
  #' na_df = data.frame(
  #'   x = c(1, NA, 3, NA), 
  #'   y = c(1, 2, NA, NA)
  #' )
  #' fDf_filter_mismatched_rows(na_df, na_handling = "match")
  
  # Input validation
  if (!inherits(inputDf, "data.frame")) {
    stop("Input 'inputDf' must be a data frame.")
  }
  
  # Check the number of columns
  if (ncol(inputDf) < 2) {
    stop("Input 'inputDf' must have at least two columns.")
  }
  
  # Validate na_handling parameter
  if (!na_handling %in% c("distinct", "ignore", "match")) {
    stop("na_handling must be one of: 'distinct', 'ignore', or 'match'")
  }
  
  # Auto-detect columns if not provided
  if (is.null(colName1)) {
    colName1 = names(inputDf)[1]
    if (verbose) {
      cat(paste0("Using first column: '", colName1, "'\n"))
    }
  }
  
  if (is.null(colName2)) {
    colName2 = names(inputDf)[2]
    if (verbose) {
      cat(paste0("Using second column: '", colName2, "'\n"))
    }
  }
  
  # Check if colName1 and colName2 are in inputDf
  if (!all(c(colName1, colName2) %in% names(inputDf))) {
    missing_cols = c(colName1, colName2)[!c(colName1, colName2) %in% names(inputDf)]
    stop(paste("Variables", paste(missing_cols, collapse=", "), "not found in dataframe"))
  }
  
  # Create variable references using tidyeval
  col1_sym = rlang::sym(colName1)
  col2_sym = rlang::sym(colName2)
  
  # Check if columns are numeric for tolerance comparison
  is_col1_numeric = is.numeric(inputDf[[colName1]])
  is_col2_numeric = is.numeric(inputDf[[colName2]])
  both_numeric = is_col1_numeric && is_col2_numeric
  
  # Print warning if types don't match
  if (!identical(class(inputDf[[colName1]]), class(inputDf[[colName2]]))) {
    warning(paste0(
      "Column types don't match: '", colName1, "' is ", class(inputDf[[colName1]]), 
      ", '", colName2, "' is ", class(inputDf[[colName2]]), 
      ". Type conversion may affect comparison results."
    ))
  }
  
  # Add row numbers if requested
  if (add_row_number) {
    inputDf = inputDf %>%
      dplyr::mutate(row_number = dplyr::row_number())
  }
  
  # Filter rows with differences based on na_handling preference
  if (na_handling == "distinct") {
    # Treat NA values as distinct (NA != NA)
    if (both_numeric) {
      # For numeric columns, use tolerance-based comparison
      mismatched_rows = inputDf %>%
        dplyr::filter(
          ((!is.na(!!col1_sym) & !is.na(!!col2_sym)) & 
             (abs(!!col1_sym - !!col2_sym) > tol)) |
          (is.na(!!col1_sym) & !is.na(!!col2_sym)) |
          (!is.na(!!col1_sym) & is.na(!!col2_sym))
        )
    } else {
      # For non-numeric columns, use standard comparison
      mismatched_rows = inputDf %>%
        dplyr::filter(
          ((!is.na(!!col1_sym) & !is.na(!!col2_sym)) & (!!col1_sym != !!col2_sym)) |
          (is.na(!!col1_sym) & !is.na(!!col2_sym)) |
          (!is.na(!!col1_sym) & is.na(!!col2_sym))
        )
    }
  } else if (na_handling == "ignore") {
    # Skip rows with any NA values
    if (both_numeric) {
      mismatched_rows = inputDf %>%
        dplyr::filter(
          !is.na(!!col1_sym) & !is.na(!!col2_sym) & 
            abs(!!col1_sym - !!col2_sym) > tol
        )
    } else {
      mismatched_rows = inputDf %>%
        dplyr::filter(
          !is.na(!!col1_sym) & !is.na(!!col2_sym) & 
            !!col1_sym != !!col2_sym
        )
    }
  } else if (na_handling == "match") {
    # NA matches NA, but not non-NA
    if (both_numeric) {
      mismatched_rows = inputDf %>%
        dplyr::filter(
          (is.na(!!col1_sym) != is.na(!!col2_sym)) |
            (!is.na(!!col1_sym) & !is.na(!!col2_sym) & 
               abs(!!col1_sym - !!col2_sym) > tol)
        )
    } else {
      mismatched_rows = inputDf %>%
        dplyr::filter(
          (is.na(!!col1_sym) != is.na(!!col2_sym)) |
            (!is.na(!!col1_sym) & !is.na(!!col2_sym) & 
               !!col1_sym != !!col2_sym)
        )
    }
  }
  
  # Add mismatch indicator
  mismatched_rows = mismatched_rows %>%
    dplyr::mutate(!!output_varName := TRUE)
  
  # Add original columns if requested
  if (add_original_cols) {
    mismatched_rows = mismatched_rows %>%
      dplyr::mutate(
        !!paste0(prefix, colName1, suffix) := !!col1_sym,
        !!paste0(prefix, colName2, suffix) := !!col2_sym
      )
  }
  
  # Calculate and display statistics if verbose
  if (verbose) {
    # Count NA patterns
    na_pattern_counts = inputDf %>%
      dplyr::select(!!col1_sym, !!col2_sym) %>%
      dplyr::mutate(
        na_pattern = dplyr::case_when(
          is.na(!!col1_sym) & is.na(!!col2_sym) ~ "both_NA",
          is.na(!!col1_sym) & !is.na(!!col2_sym) ~ "only_col1_NA",
          !is.na(!!col1_sym) & is.na(!!col2_sym) ~ "only_col2_NA",
          !!col1_sym == !!col2_sym ~ "equal_values",
          TRUE ~ "different_values"
        )
      ) %>%
      dplyr::count(na_pattern, name = "count") %>%
      dplyr::arrange(dplyr::desc(count))
    
    cat("\n--- Summary Statistics ---\n")
    cat(paste0("Column 1: ", colName1, " (", class(inputDf[[colName1]]), ")\n"))
    print(summary(inputDf[[colName1]]))
    cat(paste0("\nColumn 2: ", colName2, " (", class(inputDf[[colName2]]), ")\n"))
    print(summary(inputDf[[colName2]]))
    
    cat("\nNA and difference patterns:\n")
    print(na_pattern_counts)
    
    if (both_numeric) {
      cat(paste0("\nUsing numeric tolerance: ", tol, "\n"))
      
      # Calculate difference statistics for non-NA pairs
      not_na_rows = inputDf %>%
        dplyr::filter(!is.na(!!col1_sym) & !is.na(!!col2_sym))
      
      if (nrow(not_na_rows) > 0) {
        diff_values = not_na_rows %>%
          dplyr::mutate(diff = !!col1_sym - !!col2_sym) %>%
          dplyr::filter(abs(diff) > tol)
        
        if (nrow(diff_values) > 0) {
          cat("\nStatistics for differences exceeding tolerance (col1 - col2):\n")
          cat(paste0("Count: ", nrow(diff_values), "\n"))
          diff_summary = summary(diff_values$diff)
          print(diff_summary)
        } else {
          cat("\nNo differences exceeding tolerance found in non-NA rows.\n")
        }
      }
    } else {
      # Calculate difference statistics for non-NA pairs
      not_na_rows = inputDf %>%
        dplyr::filter(!is.na(!!col1_sym) & !is.na(!!col2_sym))
      
      if (nrow(not_na_rows) > 0) {
        diff_rows = not_na_rows %>%
          dplyr::filter(!!col1_sym != !!col2_sym)
        
        if (nrow(diff_rows) > 0) {
          cat("\nFound ", nrow(diff_rows), " non-NA rows with different values.\n")
          
          # For character columns, show sample differences
          if (is.character(inputDf[[colName1]]) && is.character(inputDf[[colName2]]) && nrow(diff_rows) > 0) {
            sample_size = min(5, nrow(diff_rows))
            sample_rows = diff_rows %>% 
              dplyr::select(!!col1_sym, !!col2_sym) %>% 
              utils::head(sample_size)
            
            cat("\nSample differences (first", sample_size, "rows):\n")
            print(sample_rows)
          }
        } else {
          cat("\nNo non-NA rows with different values found.\n")
        }
      }
    }
  }
  
  return(mismatched_rows)
}

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
# @@ END -----  
# cat("* To revert to the last commited file, run the following terminal command:\n", 
#     '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
