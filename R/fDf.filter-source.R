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
#' @description Filters rows from a data frame where two specified columns differ,
#'   optionally treating \code{NA}s as distinct, adding a row-number column, and
#'   customizing output column names.
#'
#' @param inputDf A data frame containing the columns to compare.
#' @param colName1 A character string of the first column name.
#' @param colName2 A character string of the second column name.
#' @param mismatch_col_name A character string naming the logical column
#'   indicating mismatch (default: \code{"mismatched"}).
#' @param na_distinct Logical. If \code{TRUE}, treat \code{NA} as different from \code{NA};
#'   if \code{FALSE}, two \code{NA}s in the same row are not considered a mismatch.
#'   Defaults to \code{FALSE}.
#' @param add_row_number Logical. If \code{TRUE}, adds a column with row numbers
#'   (default is \code{FALSE}).
#' @param prefix A character string to prepend to newly created columns (default "").
#' @param suffix A character string to append to newly created columns (default "").
#' @param verbose Logical. If \code{TRUE}, prints summary info for debugging (default \code{FALSE}).
#'
#' @return A data frame containing only the rows where the two specified columns
#'   differ (including \code{NA} mismatch if \code{na_distinct=TRUE}). An added logical
#'   column (by default named \code{mismatched}) indicates the mismatch status.
#'
#' @examples
#' # Create example data
#' exampleDf = data.frame(
#'   id = 1:7,
#'   colA = c(1, 2, NA, 3, 4, NA, 5),
#'   colB = c(1, 2, 2, NA, 4, NA, 7)
#' )
#'
#' # Basic usage (treating NA == NA as not mismatched)
#' mismatches1 = fDf_fiter_mismatched_rows(exampleDf, "colA", "colB")
#' mismatches1
#'
#' # When na_distinct=TRUE, NA vs NA is considered a mismatch
#' mismatches2 = fDf_fiter_mismatched_rows(exampleDf, "colA", "colB", na_distinct=TRUE)
#' mismatches2
#'
#' # Add row numbering and custom mismatch column name
#' mismatches3 = fDf_fiter_mismatched_rows(exampleDf, "colA", "colB",
#'   add_row_number=TRUE, mismatch_col_name="isDifferent", verbose=TRUE)
#' mismatches3
#'
fDf_fiter_mismatched_rows = function(
  inputDf,
  colName1,
  colName2,
  mismatch_col_name = "mismatched",
  na_distinct = FALSE,
  add_row_number = FALSE,
  prefix = "",
  suffix = "",
  verbose = FALSE
) {
  # 1) Safety checks
  if (!all(c(colName1, colName2) %in% names(inputDf))) {
    stop("One or both specified columns do not exist in the data frame.")
  }

  # 2) Optionally add a row number column (potentially with prefix/suffix)
  if (isTRUE(add_row_number)) {
    inputDf[[paste0(prefix, "row_number", suffix)]] = seq_len(nrow(inputDf))
  }

  # 3) Extract columns
  col1 = inputDf[[colName1]]
  col2 = inputDf[[colName2]]

  # 4) Create a logical vector of mismatches
  if (isTRUE(na_distinct)) {
    # Treat NA as always different, so mismatch if value differs OR NA pattern differs
    mismatchVec = (col1 != col2) | (is.na(col1) != is.na(col2))
  } else {
    # Mismatch if not equal and not both NA
    mismatchVec = !( (col1 == col2) | (is.na(col1) & is.na(col2)) )
  }

  # 5) Subset rows
  mismatchRows = inputDf[mismatchVec %in% TRUE, , drop=FALSE]

  # 6) Add mismatch indicator column
  mismatchRows[[paste0(prefix, mismatch_col_name, suffix)]] = TRUE

  # 7) Verbose output
  if (isTRUE(verbose)) {
    message("Number of rows in original DF: ", nrow(inputDf))
    message("Number of mismatched rows: ", nrow(mismatchRows))
  }

  # 8) Return results
  return(mismatchRows)
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
