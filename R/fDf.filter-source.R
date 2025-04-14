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



#' @title fDf_fiter_mismatched_rows
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
#' fDf_fiter_mismatched_rows(df_2col)
#'
#' # 2) Multi-column data frame => specify which columns to compare
#' df_3col = data.frame(a = 1:3, b = c(1,2,2), c = c("A","A","B"))
#' fDf_fiter_mismatched_rows(df_3col, colName1="a", colName2="b", verbose=TRUE)
#'
#' # 3) Numeric tolerance example
#' df_tol = data.frame(colA = c(1.00000001, 2.0),
#'                     colB = c(1.00000000, 2.00000010))
#' fDf_fiter_mismatched_rows(df_tol)
#'
#' # 4) NA handling modes
#' df_na = data.frame(colA = c(1,  NA, NA),
#'                    colB = c(1,   2, NA))
#' # "distinct": row 2 & row 3 => mismatch
#' fDf_fiter_mismatched_rows(df_na, na_mode="distinct")
#' # "match": only row 2 => mismatch
#' fDf_fiter_mismatched_rows(df_na, na_mode="match")
#' # "ignore": no rows => mismatch
#' fDf_fiter_mismatched_rows(df_na, na_mode="ignore")
fDf_fiter_mismatched_rows = function(
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
  rowMismatch = function(v1, v2) {
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
  mismatchVec = mapply(rowMismatch, col1, col2)

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


//////////////////////////  
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
