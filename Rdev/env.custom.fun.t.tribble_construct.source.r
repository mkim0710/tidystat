# env.custom.fun.t.tribble_construct.source.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/env.custom.fun.t.tribble_construct.source.r

# tribble_paste = datapasta::tribble_paste
# t.tribble_paste = function(df) {df %>% t %>% as.data.frame %>% rownames_to_column("varname") %>% tribble_paste}
# nhis_heals_jk.sas7bdat.duplicated %>% t %>% as.data.frame %>% rownames_to_column("varname") %>% tribble_paste
# tibble::tribble(
#              ~varname,        ~V1,        ~V2,
#              "STND_Y",     "2014",     "2014",
#           "PERSON_ID", "67877095", "67877095",
#                 "SEX",        "1",        "1",
#                 "AGE",       "59",       "59",
#             "DTH_MDY", "20141001", "20141001",
#           "DTH_CODE1",      "I21",      "I21",
#           "DTH_CODE2",         NA,         NA,
#                "SIDO",       "41",       "41",
#        "IPSN_TYPE_CD",        "6",        "6",
#     "CTRB_PT_TYPE_CD",        "8",        "8",
#         "DFAB_GRD_CD",        "0",        "0",
#         "DFAB_PTN_CD",        "0",        "0",
#         "DFAB_REG_YM",         NA,         NA
#     )

load(url("https://github.com/mkim0710/tidystat/raw/master/Rdev/env.custom.fun.t.tribble_construct.RData"))

if(!exists("env.custom")) env.custom = new.env()

# https://github.com/cran/datapasta/blob/master/R/tribble_paste.R
# globalVariables(c(".rs.readUiPref","env.custom$.global_datapasta_env"), "datapasta") #ignore this function in R CMD checks, since it is part of RStudio runtime
env.custom$.global_datapasta_env <- new.env()
env.custom$.global_datapasta_env$decimal_mark <- "."
env.custom$.global_datapasta_env$max_rows <- 200
env.custom$.global_datapasta_env$no_clip_msg <- "Clipboard is not available. Is xsel or xclip installed? Is DISPLAY set?"
#' tribble_paste
#' @description Parse the current clipboard as a table, or use the table argument supplied, and paste in at the cursor location in tribble format.
#' @param input_table an optional input `data.frame`. If `input_table` is supplied, then nothing is read from the clipboard.
#' @param output_context an optional output context that defines the target and indentation. Default is to guess between rstudio and console.
#' Table is output as `tribble()` call. Useful for creating reproducible examples.
#' @return Nothing.
#' @export
#'
env.custom$tribble_paste <- function(input_table, output_context = env.custom$guess_output_context()){
  output <- env.custom$tribble_construct(input_table, oc = output_context)

  switch(output_context$output_mode,
         rstudioapi = rstudioapi::insertText(output),
         console = cat(output))
}

#' env.custom$tribble_format
#' @description Parse the current clipboard as a table, or use the table argument supplied, and paste to the clipboard in tribble format.
#' @param input_table an optional input `data.frame`. If `input_table` is supplied, then nothing is read from the clipboard.
#' @param output_context an optional output context that defines the target and indentation. Default is console.
#' Table is output as `tribble()` call. Useful for creating reproducible examples.
#' @return Nothing.
#' @export
#'
env.custom$tribble_format <- function(input_table, output_context = env.custom$console_context()){
  if(!interactive()) stop("Cannot write to clipboard in non-interactive sessions.")
  output <- env.custom$tribble_construct(input_table, oc = output_context)
  clipr::write_clip(output)
}

#' env.custom$tribble_construct
#' @description Parse the current clipboard as a table, or use the table argument supplied, and return as a character string.
#' @param input_table an optional input `data.frame`. If `input_table` is supplied, then nothing is read from the clipboard.
#' @param oc an optional output context that defines the target and indentation. Default is console.
#' Table is output as `tribble()` call. Useful for creating reproducible examples.
#' @return The parsed table text.
#' @export
#'
env.custom$tribble_construct <- function(input_table, oc = env.custom$console_context()){
  # Determine input. Either clipboard or supplied table.
  if(missing(input_table)){
    input_table <- env.custom$read_clip_tbl_guess()

    if(is.null(input_table)){
      message("Could not paste clipboard as tibble. Text could not be parsed as table.")
      return(NULL)
    }
    # Parse data types from string using readr::guess_parser
    input_table_types <- attr(input_table, "col_types")
  }else{
    if(!is.data.frame(input_table) && !is_tibble(input_table)){
      message("Could not format input_table as table. Unexpected class.")
      return(NULL)
    }
    if(nrow(input_table) >= env.custom$.global_datapasta_env$max_rows){
      message(paste0("Supplied large input_table (>= ",env.custom$.global_datapasta_env$max_rows," rows). Was this a mistake? Use env.custom$dp_set_max_rows(n) to increase the limit."))
      return(NULL)
    }
    input_table_types <- lapply(input_table, class)
    #Store types as characters so the char lengths can be computed
    input_table <- as.data.frame(lapply(input_table, as.character), stringsAsFactors = FALSE)
  }
  # Warn if there is any factors, they will be converted to strings.
  factor_cols <- which(input_table_types == "factor")
  if( length(factor_cols > 0) ){
    warning("Column(s) ", paste0(factor_cols, collapse = ","), " have been converted from factor to character in tribble output.")
  }

  # Find the max length of data as string in each column
  col_widths <- mapply(input_table,
                       FUN = env.custom$column_width,
                       column_type = input_table_types
                       )

  # Create the vector of names, surrounded by `` if it does not start with a latin character
  input_names <- names(input_table)
  input_names_valid <- ifelse(make.names(input_names) == input_names, input_names, paste0("`", input_names, "`"))

  # Set the column width depending on the max length of data as string or the header, whichever is longer.
  col_widths <- mapply(max,
                       col_widths,
                       nchar(input_names_valid)+1) #+1 for "~"

  # if col_widths contains NAs these represent completely blank columns. Drop these.
  NA_cols <- which(is.na(col_widths))
  if (length(NA_cols) != 0){
    input_table <- input_table[-NA_cols]
    input_names_valid <- input_names_valid[-NA_cols]
    input_table_types <- input_table_types[-NA_cols]
    col_widths <- col_widths[-NA_cols]
  }



  if(nrow(input_table) > 0) {
    ## Header
    header <- paste0(ifelse(oc$indent_head, yes = strrep(" ", oc$indent_context), no = ""), "tibble::tribble(\n")

    ## Column names
    names_row <- paste0(
      paste0(strrep(" ",oc$indent_context+oc$nspc),
             paste0(
               paste0(
                 mapply(
                   env.custom$pad_to,
                   paste0("~",input_names_valid),
                   col_widths
                 ),
                 ","
               ),
               collapse = " "
             )
             ), "\n"
    )

    body_rows <- lapply(X = as.data.frame(t(input_table), stringsAsFactors = FALSE),
                        FUN =
                          function(col){
                            paste0(strrep(" ",oc$indent_context+oc$nspc),
                                   paste0(
                                     paste0(
                                       mapply(
                                         env.custom$render_type_pad_to,
                                         col,
                                         input_table_types,
                                         col_widths
                                       ),
                                       ","
                                     ),
                                     collapse = " "
                                   ),
                                   "\n",
                                   collapse = ""
                                   )

                          }
                        )
    # Need to remove the final comma that will break everything.
    body_rows <- paste0(as.vector(body_rows),collapse = "")
    body_rows <- gsub(pattern = ",\n$", replacement = "\n", x = body_rows)
  } else {
    header <- paste0(ifelse(oc$indent_head, yes = strrep(" ", oc$indent_context), no = ""), "tibble::tibble(\n")

    names_row <- ""

    body_rows <-
    paste0(
      paste0(
        strrep(" ",oc$indent_context+oc$nspc),
        input_names_valid,
        " = ",
        mapply(env.custom$deparse_as,
               input_table,
               input_table_types),
        collapse = ",\n"
      ),
      "\n"
    )
  }

  # Footer
  footer <- paste0(strrep(" ",oc$indent_context+oc$nspc),")\n")
  output <- paste0(header, names_row, body_rows, footer)

  return(output)
}

env.custom$deparse_as <- function(column, column_type) {
  deparse(methods::as(column, column_type))
}

env.custom$column_width <- function(column, column_type) {

  if (length(column) == 0)
    return(nchar(deparse(column)))
  else
    return(
      suppressWarnings(
        max(vapply(X = column,
                   FUN = env.custom$nchar_type,
                   FUN.VALUE = numeric(1),
                   df_col_type = column_type
                   ),
            na.rm = TRUE
            ) # blank cols will be all NA
      )
    )
}



#' env.custom$nchar_type
#'
#' @param df_col_row a character string
#' @param df_col_type the type the string will be converted to.
#'
#' @return The number of characters wide this data would be in when rendered in text
env.custom$nchar_type <- function(df_col_row, df_col_type){
  n_chars <- nchar(df_col_row)

  if(length(df_col_type) > 1) df_col_type <- "complex" # We can't really handle it.

  add_chars <- switch(df_col_type,
                      "integer" = 1, #for the "L",
                      "character" = 2 + env.custom$nquote_str(df_col_row) + env.custom$nslash_str(df_col_row), #2 for outer quotes +1 "\" for each quote and slash in string
                      "date" = 2 + env.custom$nquote_str(df_col_row) + env.custom$nslash_str(df_col_row), #2 for outer quotes +1 "\" for each quote and slash in string
                      "datetime" = 2 + env.custom$nquote_str(df_col_row) + env.custom$nslash_str(df_col_row), #2 for outer quotes +1 "\" for each quote and slash in string
                      "factor" = 2 + env.custom$nquote_str(df_col_row) + env.custom$nslash_str(df_col_row),
                      "complex" = 2 + env.custom$nquote_str(df_col_row) + env.custom$nslash_str(df_col_row), #Assume we print as a quoted char
                      0) #0 for other types
  return(n_chars + add_chars)

}

#' Count the number of quotes in a string
#'
#' @param char_vec the string to count quotes in
#'
#' @return a number, possibly 0.
env.custom$nquote_str <- function(char_vec){
  sum(gregexpr(pattern = "(\"|\')", text = char_vec)[[1]] > 0)
}

env.custom$nslash_str <- function(char_vec){
  sum(gregexpr(pattern = "\\\\", text = char_vec)[[1]] > 0)
}
#' env.custom$pad_to
#' @description Left pad string to a certain size. A helper function for getting spacing in table correct.
#' @param char_vec character vector.
#' @param char_length length to pad to.
#'
#' @return char_vec left-padded with spaces to char_length.
#'
env.custom$pad_to <-function(char_vec, char_length){
  paste0(strrep(" ",char_length - nchar(char_vec)),char_vec)
}

#' env.custom$render_type
#'
#' @description Renders a character vector as R types for pasting into Rstudio.
#' Strings are quoted. Numbers, NA, logicals etc are not.
#'
#' @param char_vec a character vector containing text to be rendered as the type indicated by type_str
#' @param char_type a string describing the type of char_vec
#'
#' @return A vector parsed from the clipboard as ether a character string or a
#' character vector. The type attribute contains the type guessed by `readr`.
#'
#'
env.custom$render_type <- function(char_vec, char_type){

  if(length(char_type) > 1) char_type <- "complex"
  # We can't handle special classes. Just fall through defaults.

  if(is.na(char_vec)){
    output <- switch(char_type,
                     "integer" = "NA",
                     "double" = "NA",
                     "logical" = "NA",
                     "numeric" = "NA",
                     "character" = "NA",
                     "NA"
    )
  }else{
    output <- switch(char_type,
                     "integer" = paste0(as.integer(char_vec),"L"),
                     "double" = as.double(char_vec),
                     "number" = readr::parse_number(char_vec, locale = readr::locale(decimal_mark = env.custom$.global_datapasta_env$decimal_mark)),
                     "numeric" = as.double(char_vec),
                     "logical" = as.logical(char_vec),
                     "factor" = ifelse(nchar(char_vec)!=0, deparse(char_vec), "NA"),
                     "character" = ifelse(nchar(char_vec)!=0, deparse(char_vec), "NA"),
                     "list" = char_vec,
                     paste0('"',char_vec,'"')
    )
  }
  output
}


#' env.custom$render_type_pad_to
#' @description Based on a type and length, render a character string as the type in text.
#' Pad to the desired length.
#'
#' @param char_vec a character vector
#' @param char_type a string type from readr::guess_parser
#' @param char_length a string length to pad to.
#'
#' @return a string containing the representation of char_vec as char_type in the RStudio source editor,
#' left-padded with spaces to char_length.
#'
env.custom$render_type_pad_to <- function(char_vec, char_type, char_length){
    env.custom$pad_to(env.custom$render_type(char_vec, char_type), char_length)
}

#' env.custom$guess_sep
#'
#' @param char_vec a table from the clipboard in character vector form.
#'
#' @description Guesses the separator based on a simple heuristic over the first 10 or less rows:
#' The separator chosen is the one that leads to the most columns, whilst parsing the same number of columns for each line (var=0).
#' The guessing algorithm ignores blank lines - which are lines that contain only the separator.
#' Options are in `c(",","\\t","\\|",";")`
#
#'
#' @return the separator selected to parse char_vec as a table
#'
env.custom$guess_sep <- function(char_vec){
  candidate_seps <- c(",","\t","\\|",";")
  candidate_seps_pattern <- paste0("([", paste0(candidate_seps, collapse = ""),"])$", collapse = "")
  table_sample <- char_vec[1:min(length(char_vec),10)]

  #handle seps at end of line. A sep at the end of line is effectively an NA in the last column.
  table_sample <- gsub(candidate_seps_pattern, "\\1 ", table_sample)

 splits <-
      lapply(
        lapply(candidate_seps,
           function(sep, table_sample){
            blank_lines <- grepl(paste0("^",sep,"*$"), table_sample)
            filtered_sample <- table_sample[!blank_lines]
            line_splits <- strsplit(filtered_sample, split = sep)
            split_lengths <- lapply(X = line_splits, FUN = length)
           },
           table_sample
        ),
      unlist)
 sep_scores <- ( !as.logical( unlist( lapply(splits, stats::var) ) ) ) * unlist( lapply(splits, max) )
 #Seps that have cols with any variance get score 0.
 sep <- candidate_seps[which.max(sep_scores)]
 if(sep == "\\|") sep <- "|"
 sep
}

#' read_clip_table_guess
#'
#' @param x contents of the clipboard
#' @param ... arguments passed to read.table
#' @description Similar to read_clip_tbl from clipr,
#' however it will error if there are less than 2 rows
#' and it tries to guess the separator.
#'
#' @return a parsed table from the clipboard. Separator is guessed.
env.custom$read_clip_tbl_guess <- function (x = NULL, ...)
{
  if (is.null(x)) {
    # if no text is provided, look in clipboard or RStudio editor
    x <- read_clip_or_editor()
  }
  if (is.null(x))
    return(NULL)
  if(length(x) < 2)  #You're just a header row, get outta here!
    return(NULL)
  .dots <- list(...)
  .dots$file <- textConnection(x)
  if (is.null(.dots$header))
    .dots$header <- FALSE
  if (is.null(.dots$sep)){
    .dots$sep <- env.custom$guess_sep(x)
  }
  if (is.null(.dots$colClasses))
    .dots$colClasses <- "character"
  if (is.null(.dots$stringsAsFactors))
    .dots$stringsAsFactors <- FALSE
  if (is.null(.dots$na.strings))
    .dots$na.strings <- c("NA", "")
  if (is.null(.dots$strip.white))
    .dots$strip.white <- TRUE
    .dots$quote <-  ""
  x_table <- do.call(utils::read.table, args = .dots)

  # Determine if row 1 a header
  types_header <- lapply(x_table[1, , drop = FALSE], readr::guess_parser, guess_integer = TRUE)
  types_body <- lapply(x_table[-1, , drop = FALSE], readr::guess_parser, guess_integer = TRUE)
  if( !identical(types_header, types_body) ){
    # Row 1 is a header
    x_table <- first_row_to_header(x_table)
  } else {
    if( all(c(types_body, types_header) == "character") ){
      # Row 1 is again a header
      x_table <- first_row_to_header(x_table)
    }
    else{
      # Row 1 is data
      # Nothing to do.
    }
  }
  attr(x_table, "col_types") <- types_body
  x_table
}



#' env.custom$dp_set_decimal_mark
#'
#' @param mark The decimal mark to use when parsing "number" type data, as guessed by readr::guess_parser.
#' @description A function to optionally set the decimal mark if in a locale where it is not `.`. Will allow "3,14" to be parsed as 3.14, normally would be parsed as 314.
#' Will also handle spaces in numbers.
#'
#' @return NULL.
#' @export
env.custom$dp_set_decimal_mark <- function(mark){
  env.custom$.global_datapasta_env$decimal_mark <- mark
  invisible(NULL)
}

#' env.custom$dp_set_max_rows
#'
#' @param num_rows The number of rows of an input at which any of env.custom$tribble_construct() or df_construct() will abort parsing. Datapasta is untested on large tables. Use at own risk.
#'
#' @return NULL
#' @export
env.custom$dp_set_max_rows <- function(num_rows){
  env.custom$.global_datapasta_env$max_rows <- num_rows
  invisible(NULL)
}

#' env.custom$guess_output_context
#'
#' @description Return the a list containing the guessed output target context, either rstudio or the console.
#'
#' @return a list containing the output target, space size of indent, and number of indents at context.
env.custom$guess_output_context <- function(){
  if(requireNamespace("rstudioapi", quietly = TRUE) && rstudioapi::isAvailable()){
    output_context <- env.custom$rstudio_context()
  }else{
    # rstudioapi unavailable. fallback to console
    output_context <- env.custom$console_context()
  }
  output_context
}

#' @rdname env.custom$custom_context
#' @export
#'
env.custom$clipboard_context <- function(){
  output_context <- list(output_mode = "clipboard", nspc = 2, indent_context = 0, indent_head = FALSE)
  output_context
}

#' @rdname env.custom$custom_context
#' @export
#'
env.custom$rstudio_context <- function(){
  output_context <- list()
  output_context$indent_head <- FALSE #head already at cursor
  output_context$output_mode <- "rstudioapi"
  output_context$nspc <- .rs.readUiPref('num_spaces_for_tab')
  context <- rstudioapi::getActiveDocumentContext()
  context_row <- context$selection[[1]]$range$start["row"]
  if(all(context$selection[[1]]$range$start == context$selection[[1]]$range$end)){
    output_context$indent_context <- nchar(context$contents[context_row])
  } else{
    output_context$indent_context <- attr(regexpr("^\\s+", context$contents[context_row]),"match.length")+1 #first pos = 1 not 0
  }
  output_context
}

#' @rdname env.custom$custom_context
#' @export
#'
env.custom$console_context <- function(){
  output_context <- list(output_mode = "console", nspc = 2, indent_context = 0, indent_head = FALSE)
  output_context
}

#' @rdname env.custom$custom_context
#' @export
#'
env.custom$markdown_context <- function(){
  output_context <- list(output_mode = "console", nspc = 2, indent_context = 4, indent_head = TRUE)
  output_context
}

#' env.custom$custom_context
#'
#' @description the _context functions define lists of parameters for text formatting.
#' The specific contexts return hard-coded values appropriate to the context they describe, while env.custom$custom_context allows definition of new contexts for custom formatting.
#' @param output_mode A named output mode, controls the target of the _paste functions options are "rstudioapi" or "console"
#' @param nspc The number of spaces for each indent level in the output context
#' @param indent_context The number of spaces applied initially to all lines in the output context
#' @param indent_head Logical. Apply the indent_context to the to the header row? Use FALSE if targeting cursor location.
#' @return an output context. An input to _paste, _format, _construct functions used to format whitespace.
#' @export
#'
env.custom$custom_context <- function(output_mode = "console", nspc = 2, indent_context = 0, indent_head = TRUE){
  output_context <- list(output_mode = output_mode, nspc = nspc, indent_context = indent_context, indent_head = indent_head)
  output_context
}


#@ global functions ----
# fun.tribble_paste = env.custom$tribble_paste
# fun.t.tribble_paste = function(df) {df %>% t %>% as.data.frame %>% rownames_to_column("varname") %>% fun.tribble_paste}
fun.tribble_construct = function(df) {
    out = env.custom$tribble_construct(df)
    cat(out)
}
fun.t.tribble_construct = function(df) {
    out = df %>% t %>% as.data.frame %>% rownames_to_column("varname")
    out = env.custom$tribble_construct(out)
    cat(out)
}


#@ end -----
save.image(file = "env.custom.fun.t.tribble_construct.RData")

# library(tidyverse)
# df = 
# tibble::tribble(
#              ~varname,        ~V1,        ~V2,
#              "STND_Y",     "2014",     "2014",
#           "PERSON_ID", "67877095", "67877095",
#                 "SEX",        "1",        "1",
#                 "AGE",       "59",       "59",
#             "DTH_MDY", "20141001", "20141001",
#           "DTH_CODE1",      "I21",      "I21",
#           "DTH_CODE2",         NA,         NA,
#                "SIDO",       "41",       "41",
#        "IPSN_TYPE_CD",        "6",        "6",
#     "CTRB_PT_TYPE_CD",        "8",        "8",
#         "DFAB_GRD_CD",        "0",        "0",
#         "DFAB_PTN_CD",        "0",        "0",
#         "DFAB_REG_YM",         NA,         NA
#     )
# df %>% fun.tribble_construct #----
# df %>% fun.t.tribble_construct #----
# # > df %>% fun.tribble_construct #----
# # tibble::tribble(
# #            ~varname,        ~V1,        ~V2,
# #            "STND_Y",     "2014",     "2014",
# #         "PERSON_ID", "67877095", "67877095",
# #               "SEX",        "1",        "1",
# #               "AGE",       "59",       "59",
# #           "DTH_MDY", "20141001", "20141001",
# #         "DTH_CODE1",      "I21",      "I21",
# #         "DTH_CODE2",         NA,         NA,
# #              "SIDO",       "41",       "41",
# #      "IPSN_TYPE_CD",        "6",        "6",
# #   "CTRB_PT_TYPE_CD",        "8",        "8",
# #       "DFAB_GRD_CD",        "0",        "0",
# #       "DFAB_PTN_CD",        "0",        "0",
# #       "DFAB_REG_YM",         NA,         NA
# #   )
# # > df %>% fun.t.tribble_construct #----
# # tibble::tribble(
# #    ~varname,      ~V1,         ~V2,   ~V3,   ~V4,        ~V5,         ~V6,         ~V7,    ~V8,            ~V9,              ~V10,          ~V11,          ~V12,          ~V13,
# #   "varname", "STND_Y", "PERSON_ID", "SEX", "AGE",  "DTH_MDY", "DTH_CODE1", "DTH_CODE2", "SIDO", "IPSN_TYPE_CD", "CTRB_PT_TYPE_CD", "DFAB_GRD_CD", "DFAB_PTN_CD", "DFAB_REG_YM",
# #        "V1",   "2014",  "67877095",   "1",  "59", "20141001",       "I21",          NA,   "41",            "6",               "8",           "0",           "0",            NA,
# #        "V2",   "2014",  "67877095",   "1",  "59", "20141001",       "I21",          NA,   "41",            "6",               "8",           "0",           "0",            NA
# #   )
