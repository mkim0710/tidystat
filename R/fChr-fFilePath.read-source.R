
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_file.read ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_objectname.read_rds_or_xz ====  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_objectname.read_rds_or_xz"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
        .objectname, 
        .path4read = env1$path$path4read,
        vec.folder = paste0(.path4read,c("", paste0("/",.objectname))),
        vec.extension = paste0(".rds",c("", ".xz")),
        VERBOSE = isTRUE(getOption("verbose")),
        DEBUGMODE = isTRUE(getOption("DEBUGMODE"))) {
    .objectpath = outer(
        vec.folder, 
        vec.extension, 
        function(.objectfolder, .objectextension) {paste0(.objectfolder,"/",.objectname,.objectextension)}
    ) |> keep(file.exists) |> first()
    if (VERBOSE) {
        cat("  .objectpath == ",deparse(.objectpath),"  \n", sep="")
    }
    assign(.objectname, read_rds(.objectpath), envir = .GlobalEnv)
    cat(" length(",.objectname,") == ",deparse(length(get(.objectname))),"  \n", sep="")
    cat(" dim(",.objectname,") == ",deparse(dim(get(.objectname))),"  \n", sep="")
    invisible(get(.objectname, envir = .GlobalEnv))
}
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_FileNameExt.read_rds_or_xz ====  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_FileNameExt.read_rds_or_xz"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
        .FileNameExt = NA, 
        .objectname = .FileNameExt |> str_remove("\\.xz$") |> str_remove("\\.rds$"),
        .path4read = env1$path$path4read,
        vec.folder = paste0(.path4read,c("", paste0("/",.objectname))),
        vec.extension = paste0(".rds",c("", ".xz")),
        VERBOSE = isTRUE(getOption("verbose")),
        DEBUGMODE = isTRUE(getOption("DEBUGMODE"))) {
    env1$f$f_objectname.read_rds_or_xz(
        .objectname = .objectname, 
        .path4read = .path4read,
        vec.folder = vec.folder,
        vec.extension = vec.extension,
        VERBOSE = VERBOSE,
        DEBUGMODE = DEBUGMODE
    )
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) read_rds_or_xz  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "read_rds_or_xz")


#' function.read_excel_allsheets-Cl.r
#' LsCodeBookXLS from 지역사회기반코호트_(1기)기반=01-02년~(8기)7차추적=15-16년_201912-Table.xlsx.r
#' Ls_tblWAVE_VARNAME from KoGES_지역사회기반코호트_반복_추적조사_통합자료_코드북(ver3.1)_201912.xlsx
#' 
#' Read All Excel Worksheets Into a List
#'
#' @description 
#' This function reads all sheets from an Excel file and returns them as a named list
#' of data frames or tibbles. Each element is named after its corresponding worksheet.
#'
#' @param filenamePath Character string specifying the path to the Excel file.
#' @param colNamesFlag Logical indicating whether the first row should be used as column names. Default is TRUE.
#' @param colTypesVec Column types specification. Default is NULL.
#' @param naText Character vector of strings to interpret as missing values. Default is "".
#' @param trimWsFlag Logical indicating whether to trim whitespace from cell values. Default is TRUE.
#' @param skipInt Integer specifying the number of rows to skip before reading data. Default is 0.
#' @param nMaxInt Maximum number of rows to read. Default is Inf.
#' @param guessMaxInt Maximum number of rows used to guess column types. Default is min(1000, nMaxInt).
#' @param tibbleFlag Logical indicating whether to return tibbles (TRUE) or data frames (FALSE). Default is TRUE.
#' @param verboseFlag Logical indicating whether to print intermediate outputs for debugging. Default is FALSE.
#'
#' @return A named list of data frames or tibbles, with names corresponding to worksheet names.
#'
#' @examples
#' \dontrun{
#' # Read all sheets from an Excel file
#' excelSheetsLs = fExcelPath_readAllSheets("path/to/file.xlsx")
#' 
#' # Read all sheets, specifying return as data frames instead of tibbles
#' excelSheetsDfLs = fExcelPath_readAllSheets("path/to/file.xlsx", tibbleFlag = FALSE)
#' 
#' # Read all sheets with customized options
#' excelSheetsCustomLs = fExcelPath_readAllSheets(
#'   "path/to/file.xlsx", 
#'   colNamesFlag = FALSE,
#'   naText = c("NA", "N/A"),
#'   skipInt = 2,
#'   verboseFlag = TRUE
#' )
#' }
#'
#' @importFrom readxl excel_sheets read_excel
#' @importFrom purrr map set_names
#'
#' @export
fExcelPath_readAllSheets = function(filenamePath, 
                                   colNamesFlag = TRUE, 
                                   colTypesVec = NULL, 
                                   naText = "", 
                                   trimWsFlag = TRUE, 
                                   skipInt = 0, 
                                   nMaxInt = Inf, 
                                   guessMaxInt = min(1000, nMaxInt), 
                                   tibbleFlag = TRUE,
                                   verboseFlag = FALSE) {
  
  # Set verbose mode based on parameter or global option
  VERBOSE = verboseFlag || isTRUE(getOption("verbose"))
  
  # Input validation
  if (!is.character(filenamePath) || length(filenamePath) != 1) {
    stop("filenamePath must be a single character string.")
  }
  
  if (!file.exists(filenamePath)) {
    stop("File not found: ", filenamePath)
  }
  
  if (VERBOSE) {
    message("Reading Excel file: ", filenamePath)
  }
  
  # Extract sheet names
  tryCatch({
    sheetNamesVec = readxl::excel_sheets(filenamePath)
    
    if (length(sheetNamesVec) == 0) {
      warning("No sheets found in Excel file.")
      return(list())
    }
    
    if (VERBOSE) {
      message("Found ", length(sheetNamesVec), " sheets: ", 
              paste(sheetNamesVec, collapse = ", "))
    }
  }, error = function(e) {
    stop("Error reading Excel sheets: ", e$message)
  })
  
  # Read each sheet
  tryCatch({
    resultLs = purrr::map(sheetNamesVec, function(sheetName) {
      if (VERBOSE) {
        message("Reading sheet: ", sheetName)
      }
      
      readxl::read_excel(
        path = filenamePath, 
        sheet = sheetName, 
        col_names = colNamesFlag, 
        col_types = colTypesVec, 
        na = naText, 
        trim_ws = trimWsFlag, 
        skip = skipInt, 
        n_max = nMaxInt, 
        guess_max = guessMaxInt
      )
    }) %>% 
      purrr::set_names(sheetNamesVec)
    
    # Convert to data.frames if requested
    if (!tibbleFlag) {
      if (VERBOSE) {
        message("Converting tibbles to data frames")
      }
      
      resultLs = purrr::map(resultLs, as.data.frame)
    }
    
    return(resultLs)
  }, error = function(e) {
    stop("Error reading Excel data: ", e$message)
  })
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
# ⸿ END -----  
# cat("* To revert to the last commited file, run the following terminal command:\n", 
#     '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  



