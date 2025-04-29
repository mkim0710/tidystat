##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 1) ----  
# ⸿ SOURCE)                                                                #L229
# ⸿ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B                   #L260
# ⸿ env1\$f\$f_object                                                      #L283
# ⸿ env1\$f\$f_vec                                                         #L395
# ⸿ env1\$f\$f_str                                                         #L283
# ⸿ env1\$f\$f_list                                                        #L396
# ⸿ env1\$f\$f_list_list                                                   #L796
# ⸿ env1\$f\$f_matrix                                                      #L797
# ⸿ env1\$f\$f_array                                                       #L798
# ⸿ env1\$f\$f_formula                                                     #L887
# ⸿ env1\$f\$f_df                                                          #L966
# ⸿ env1\$env.internal functions                                           #L1155
# ⸿ source()                                                               #L1631
# ls.str(env1) #                                                            #L1700
# ls.str(env1$env.internal) #                                               #L1701
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 2) ----  

# ⸿ env1\$f\$f_list_list                                                   #L796
# ⸿ env1\$f\$f_matrix                                                      #L797
# ⸿ env1\$f\$f_array                                                       #L798
## :: f_list_list.to_matrix =                                               #L800
## :: f_list_list.to_data_frame =                                           #L819
## :: f_matrix.to_list_list =                                               #L839
## :: f_matrix.set_names.to_vector =                                        #L866
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  



##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ env1\$f\$f_list_list ----  
# ⸿ env1\$f\$f_matrix ----  
# ⸿ env1\$f\$f_array ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_list_list.to_matrix =  ----
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/array_list/f_list_list.to_data_frame.dev.r
.tmp$objectname = "f_list_list.to_matrix"
.tmp$object = function(list_list = paste0("C",1:3) %>% set_names() %>% map(function(chr) paste0("R",1:2) %>% set_names() %>% map(paste0, chr)), type = "list_list[[indexColumn]][[indexRow]]") {
    if (type == "list_list[[indexColumn]][[indexRow]]") {
        out = simplify2array(list_list)
    } else if (type == "list_list[[indexRow]][[indexColumn]]") {
        out = t(simplify2array(list_list))
    } else {
        stop("Please specify type: either list_list[[indexColumn]][[indexRow]] or list_list[[indexRow]][[indexColumn]]")
    }
    out2 = unlist(out)
    dim(out2) = dim(out)
    dimnames(out2) = dimnames(out)
    out2
}
### \% |> f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = .tmp$env1_subenv_name == "f", RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_list_list.to_data_frame =  ----
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/array_list/f_list_list.to_data_frame.dev.r
.tmp$objectname = "f_list_list.to_data_frame"
.tmp$object = function(list_list = paste0("C",1:3) %>% set_names() %>% map(function(chr) paste0("R",1:2) %>% set_names() %>% map(paste0, chr)), type = "list_list[[indexColumn]][[indexRow]]") {
    if (type == "list_list[[indexColumn]][[indexRow]]") {
        out = simplify2array(list_list)
    } else if (type == "list_list[[indexRow]][[indexColumn]]") {
        out = t(simplify2array(list_list))
    } else {
        stop("Please specify type: either list_list[[indexColumn]][[indexRow]] or list_list[[indexRow]][[indexColumn]]")
    }
    out2 = unlist(out)
    dim(out2) = dim(out)
    dimnames(out2) = dimnames(out)
    out2 = out2 |> as.data.frame() |> rownames_to_column() |> as_data_frame()
    out2
}
### \% |> f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = .tmp$env1_subenv_name == "f", RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_matrix.to_list_list =  ----
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/array_list/f_matrix.to_list_list.dev.r
.tmp$objectname = "f_matrix.to_list_list"
.tmp$object = function(input_matrix = outer(1:2, 1:3, function(i, j) {paste0("R", i, "C", j)}), type = "list_list[[indexColumn]][[indexRow]]") {
    if (length(dim(input_matrix)) != 2) {
        stop("length(dim(input_matrix)) != 2")
    }
    if (is.null(rownames(input_matrix))) {
        rownames(input_matrix) = paste0("R", 1:nrow(input_matrix))
    }
    if (is.null(colnames(input_matrix))) {
        colnames(input_matrix) = paste0("C", 1:ncol(input_matrix))
    }
    
    if (type == "list_list[[indexColumn]][[indexRow]]") {
        
    } else if (type == "list_list[[indexRow]][[indexColumn]]") {
        input_matrix = t(input_matrix)
    } else {
        stop("Please specify type: either list_list[[indexColumn]][[indexRow]] or list_list[[indexRow]][[indexColumn]]")
    }
    out_list_list = input_matrix %>% as.data.frame %>% map(as.list) %>% map(set_names, rownames(input_matrix))
    out_list_list
}
### \% |> f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = .tmp$env1_subenv_name == "f", RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_matrix.set_names.to_vector =  ----
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/array_list/f_matrix.set_names.to_vector.dev.r
.tmp$objectname = "f_matrix.set_names.to_vector"
.tmp$object = function(input_matrix = matrix(0, nrow = 2, ncol = 3)) {
    if (is.null(rownames(input_matrix))) {
        rownames(input_matrix) = paste0("R", 1:nrow(input_matrix))
    }
    if (is.null(colnames(input_matrix))) {
        colnames(input_matrix) = paste0("C", 1:ncol(input_matrix))
    }
    # input_matrix %>% set_names(outer(rownames(.), colnames(.), paste0)) %>% as.vector()
    input_matrix %>% set_names(outer(rownames(.), colnames(.), paste0)) %>% c()
}
### \% |> f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = .tmp$env1_subenv_name == "f", RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)




##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: fLsLs_exportCSV-source.R =  ----
# https://github.com/mkim0710/Rproject_KoGES2020AS8840/blob/main/AICSV_KoGES2020AS8840/fLsLs_exportCSV-source.R
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: fLsLs_exportJSON-source.R =  ----
# https://github.com/mkim0710/Rproject_KoGES2020AS8840/blob/main/AICSV_KoGES2020AS8840/fLsLs_exportJSON-source.R
#' Export Nested List to JSON File
#' 
#' @description
#' Exports a (nested) list to a JSON file, with optional pretty-printing and timestamped filenames.
#' Can also print the JSON structure to the console.
#'
#' @param inputLsLs A list (nested or flat) to be exported
#' @param outputFilePathText Path to output JSON file (NULL for auto-generated)
#' @param prettyBool Format JSON with indentation (default: TRUE)
#' @param autoUnboxBool Automatically unbox single-element arrays (default: TRUE)
#' @param naStringText Representation for NA values (default: "null")
#' @param autoTimestampBool Append timestamp to filename (default: TRUE)
#' @param output_to_console Print JSON to console (default: TRUE)
#' @param verboseBool Logical flag for debugging output (default: getOption("verbose"))
#' 
#' @return Path to created JSON file
#' 
#' @examples
#' testLsLs <- list(name = "Example", values = list(a = 1, b = list(c = 2)))
#' fLsLs_exportJSON(testLsLs, "output.json")
#'
#' @importFrom jsonlite write_json toJSON
#' @importFrom tools file_path_sans_ext
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fLsLs_exportJSON"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
    inputLsLs, 
    outputFilePathText = NULL,
    prettyBool = TRUE, 
    autoUnboxBool = TRUE,
    naStringText = "null", 
    autoTimestampBool = TRUE,
    output_to_console = TRUE,
    verboseBool = isTRUE(getOption("verbose"))
) {
  # Input validation
  if (!is.list(inputLsLs)) stop("Input must be a list object")
  
  # Generate output file path
  outputFilePathText <- .fText_generateOutputPath(
    outputFilePathText, 
    "json", 
    autoTimestampBool, 
    verboseBool
  )
  
  # Create JSON string
  jsonText <- jsonlite::toJSON(
    x = inputLsLs,
    pretty = prettyBool,
    na = naStringText,
    auto_unbox = autoUnboxBool
  )
  
  # Print to console if requested
  if (output_to_console) {
    cat(jsonText, "\n")
  }
  
  # Write JSON with error handling
  tryCatch(
    {
      write(jsonText, file = outputFilePathText)
      
      if (verboseBool) message("JSON export complete.")
    },
    error = function(e) {
      stop(paste("Error writing to file:", e$message))
    }
  )
  
  # Return the file path
  return(outputFilePathText)
}

#' Export List to CSV with Smart Serialization
#' 
#' @description
#' Exports a list as a CSV file. Can create either a single-row CSV where each list element 
#' becomes a column, or a multi-row CSV where the list is converted to a data frame.
#' Nested lists or vectors are stored via a user-specified serialization method.
#' Can optionally print data structure information to console.
#'
#' @param inputLsLs List to export (elements become columns or rows)
#' @param outputFilePathText Path to output CSV file (NULL for auto-generated)
#' @param serializationMethodText "deparse" or "dput" (default)
#' @param autoTimestampBool Append timestamp to filename (default: TRUE)
#' @param multiRowCSV Create multi-row CSV if possible (default: TRUE). For vectors of 
#'        different lengths, shorter vectors are filled with blank text ("").
#' @param output_to_console Print CSV data to console (default: FALSE)
#' @param str_to_console Print structure of the tibble before writing (default: TRUE)
#' @param verboseBool Logical flag for debugging output (default: getOption("verbose"))
#' 
#' @return Path to created CSV file
#' 
#' @examples
#' # Single-row example
#' testLsLs1 <- list(simple = 42, nested = list(a = "test", b = 5:7))
#' fLsLs_exportCSV(testLsLs1, "output1.csv", multiRowCSV = FALSE)
#' 
#' # Multi-row example with equal lengths
#' testLsLs2 <- list(
#'   id = 1:5,
#'   name = c("A", "B", "C", "D", "E"),
#'   value = c(10.1, 20.2, 30.3, 40.4, 50.5)
#' )
#' fLsLs_exportCSV(testLsLs2, "output2.csv")
#'
#' # Multi-row example with different lengths (shorter vectors filled with "")
#' testLsLs3 <- list(
#'   id = 1:5,
#'   name = c("A", "B", "C"),
#'   value = c(10.1, 20.2)
#' )
#' fLsLs_exportCSV(testLsLs3, "output3.csv")
#'
#' @importFrom readr write_csv
#' @importFrom tibble as_tibble_row tibble
#' @importFrom purrr map
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fLsLs_exportCSV"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
    inputLsLs, 
    outputFilePathText = NULL,
    serializationMethodText = c("dput", "deparse"),
    autoTimestampBool = TRUE,
    multiRowCSV = TRUE,
    output_to_console = FALSE,
    str_to_console = TRUE,
    verboseBool = isTRUE(getOption("verbose"))
) {
  # Input validation
  if (!is.list(inputLsLs)) stop("Input must be a list object")
  serializationMethodText <- match.arg(serializationMethodText)
  
  # Generate output file path
  outputFilePathText <- .fText_generateOutputPath(
    outputFilePathText, 
    "csv", 
    autoTimestampBool, 
    verboseBool
  )
  
  if (verboseBool) message("Preparing data for CSV export.")
  
  # Check if list can be converted to multi-row data frame
  canBeMultiRow <- FALSE
  if (multiRowCSV) {
    # Check if all elements are vectors
    allVectors <- all(sapply(inputLsLs, is.vector))
    
    # For multi-row CSV, all elements must be vectors and at least one must have length > 0
    canBeMultiRow <- allVectors && max(sapply(inputLsLs, length)) > 0
    
    if (verboseBool && !canBeMultiRow && multiRowCSV) {
      message("List cannot be converted to multi-row format; using single-row instead.")
    }
  }
  
  # Create output dataframe
  if (canBeMultiRow) {
    # Get the maximum length of vectors
    maxLength <- max(sapply(inputLsLs, length))
    
    if (verboseBool) {
      message("Creating multi-row tibble with maximum length: ", maxLength)
    }
    
    # Normalize all vectors to the same length by filling shorter ones with ""
    normalizedLsLs <- lapply(inputLsLs, function(vec) {
      vecLength <- length(vec)
      if (vecLength < maxLength) {
        # If vector is shorter, extend it with blank text
        if (is.character(vec)) {
          c(vec, rep("", maxLength - vecLength))
        } else if (is.numeric(vec)) {
          # For numeric vectors, convert to character first to avoid NA issues
          c(as.character(vec), rep("", maxLength - vecLength))
        } else {
          # For other types, convert to character
          c(as.character(vec), rep("", maxLength - vecLength))
        }
      } else {
        vec
      }
    })
    
    # Create multi-row tibble
    outputDf <- tibble::tibble(!!!normalizedLsLs)
    
    if (verboseBool) {
      message("Created multi-row tibble with ", nrow(outputDf), " rows and ", 
              ncol(outputDf), " columns.")
    }
  } else {
    # Process each list element for single-row output
    processedLsLs <- purrr::map(inputLsLs, function(element) {
      if (is.atomic(element) && length(element) == 1) {
        element 
      } else {
        switch(
          serializationMethodText,
          "deparse" = paste(deparse(element), collapse = "\n"),
          "dput" = paste(capture.output(dput(element)), collapse = "\n")
        )
      }
    })
    
    # Create a single-row tibble
    outputDf <- tibble::as_tibble_row(processedLsLs)
    
    if (verboseBool) {
      message("Created single-row tibble with ", ncol(outputDf), " columns.")
    }
  }
  
  # Print structure of the tibble to console if requested
  if (str_to_console) {
    cat("Structure of tibble before writing to CSV:\n")
    str(outputDf)
    cat("\n")
  }
  
  # Print tibble data to console if requested
  if (output_to_console) {
    cat("CSV data:\n")
    print(outputDf)
    cat("\n")
  }
  
  if (verboseBool) message("Writing CSV to: ", outputFilePathText)
  
  # Write CSV with error handling
  tryCatch(
    {
      readr::write_csv(outputDf, file = outputFilePathText)
      if (verboseBool) message("CSV export complete.")
    },
    error = function(e) {
      stop(paste("Error writing to file:", e$message))
    }
  )
  
  # Return the file path
  return(outputFilePathText)
}

#' Generate Output File Path
#'
#' @description
#' Helper function to generate output file paths with optional timestamps.
#'
#' @param pathText User-provided output path (if NULL, auto-generate)
#' @param extensionText File extension without dot
#' @param timestampBool Whether to add timestamp to filename
#' @param verboseBool Whether to print verbose messages
#' 
#' @return Full file path
#'
#' @keywords internal
.fText_generateOutputPath <- function(
    pathText, 
    extensionText, 
    timestampBool, 
    verboseBool
) {
  if (!is.null(pathText)) return(pathText)
  
  # Try to get script name or use default
  baseNameText <- tryCatch({
    tools::file_path_sans_ext(basename(rstudioapi::getSourceEditorContext()$path))
  }, error = function(e) {
    "list_export"
  })
  
  # Append timestamp if requested
  if (timestampBool) {
    timestampText <- format(Sys.time(), "-%y%m%dT%H%M")
    baseNameText <- paste0(baseNameText, timestampText)
  }
  
  # Build full path with "output/" subpath
  outputDirText <- "output"
  finalPathText <- file.path(outputDirText, paste0(baseNameText, ".", extensionText))
  
  # Create output directory if it doesn't exist
  dir.create(outputDirText, showWarnings = FALSE, recursive = TRUE)
  
  if (verboseBool) message("Using output path: ", finalPathText)
  
  return(finalPathText)
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
