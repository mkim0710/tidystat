sourcename = "f_df.t.tribble_construct" |> paste0(".source.r")
if(Sys.getenv("print.intermediate")==TRUE) print(paste0('Sourcing: "',sourcename,'"'))
# # f_df.t.tribble_construct.source.r
# # f_df.tribble_construct.source.r
# # f_df.transpose.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/f_df.t.tribble_construct.dev.r
# # source("https://github.com/mkim0710/tidystat/raw/master/f_df.t.tribble_construct.source.r")
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  ----
#| Ctrl(+Shift)+1: Move focus (zoom) to Source Editor 
#| Ctrl+Shift+.[period]: Switch to tab (Show List of Open Tabs~!!!)
#| Ctrl+Alt+Shift+Left/Right: First/Last tab
#| Ctrl+Alt+D: Show diff between current and last commit
#| Ctrl+Alt+M: Commit changes to Git
#| Ctrl+Shift+O: Show/Hide Document Outline
#| Alt+Shift+Drag: Multiline Cursor
#| Ctrl+Shift+F10: Restart R Session 
#| Ctrl+Alt+B: Run from start to current line 
#| Shift+F9: Toggle Breakpoint 
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# paste0("[Working Files List] ",basename(getwd()),".r") |> file.edit()
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# "https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R" %>% paste0("if (.Platform$OS.type == 'windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }") %>% {eval(parse(text=.))}  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R"  
# "https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd" %>% paste0("if (.Platform$OS.type == 'windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }") %>% {eval(parse(text=.))}  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd"  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(.GlobalEnv$env1$source[[sourcename]])}
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# "https://github.com/mkim0710/tidystat/blob/master/.Rprofile" %>% paste0("if (.Platform$OS.type == 'windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }") %>% {eval(parse(text=.))}  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/.Rprofile"    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile"); .First()}
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile"); .First()}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## env1\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  \n", sep="  \n")
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
if (requireNamespace("rstudioapi")) {
    if(Sys.getenv("print.intermediate")==TRUE) {CodeText2Print = 'requireNamespace("rstudioapi")'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}; 
    if (rstudioapi::isAvailable()) {
        env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "");
    } else { if(Sys.getenv("print.intermediate")==TRUE) print('rstudioapi::isAvailable() == FALSE') }
    if(Sys.getenv("print.intermediate")==TRUE) {CodeText2Print = 'env1$path$CurrentSource.path.filename.ext'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}; 
} else { if(Sys.getenv("print.intermediate")==TRUE) print('requireNamespace("rstudioapi") == FALSE') }
file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)})
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) source -----
### \$ subpath, sourcename ======
subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "f_df.t.tribble_construct" |> paste0(".source.r")
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# env1$path$subpath = subpath
# sourcename_root = sourcename |> str_replace("\\.source\\.r$", "")
# env1$path$sourcename_root = sourcename_root  
# env1$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.r")
# env1$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.Rmd")
# env1$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename)
# cat("# ",'sourcename_root = "',sourcename_root,'"', "  \n",
#     "# ",sourcename_root,".dev.r", "  \n",
#     "# ",sourcename_root,".dev.Rmd", "  \n",
#     "# ",sourcename_root,".source.r", "  \n",
#     '# # source("',env1$path$source_base,"/",env1$path$subpath.filename.source.r,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'"); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'"); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'"); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});', "  \n",
#     sep="")
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# # \% source( file.path(env1$path$source_base,subpath.filename.source.r) ) ----
# subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); 
# if(!sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(.GlobalEnv$env1$source[[sourcename]])}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ RUN ALL ABOVE: CTRL+ALT+B -----
#| RUN ALL ABOVE: CTRL+ALT+B |#
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  



library(tidyverse)



if(!exists("env1", envir=.GlobalEnv)) assign("env1", new.env(), envir=.GlobalEnv)
if(!"env.internal" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$env.internal <- new.env()
if(!"path" %in% names(.GlobalEnv$env1)) {
    env1$path = list()
    objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); .GlobalEnv$env1$path[[objectname]] = object;
    objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; .GlobalEnv$env1$path[[objectname]] = object;
    if(!"source_base" %in% names(.GlobalEnv$env1$path)) {env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)}  
} 


# https://github.com/cran/datapasta/blob/master/R/tribble_paste.R
# globalVariables(c(".rs.readUiPref","env1$env.internal$.global_datapasta_env"), "datapasta") #ignore this function in R CMD checks, since it is part of RStudio runtime
# env.internal.objectname = ".global_datapasta_env"
# packageStartupMessage(paste0("Loading: ", "env1$env.internal$", env.internal.objectname)); 
env1$env.internal$.global_datapasta_env <- new.env()
env1$env.internal$.global_datapasta_env$decimal_mark <- "."
env1$env.internal$.global_datapasta_env$max_rows <- 200
env1$env.internal$.global_datapasta_env$no_clip_msg <- "Clipboard is not available. Is xsel or xclip installed? Is DISPLAY set?"
#' tribble_paste
#' @description Parse the current clipboard as a table, or use the table argument supplied, and paste in at the cursor location in tribble format.
#' @param input_table an optional input `data.frame`. If `input_table` is supplied, then nothing is read from the clipboard.
#' @param output_context an optional output context that defines the target and indentation. Default is to guess between rstudio and console.
#' Table is output as `tribble()` call. Useful for creating reproducible examples.
#' @return Nothing.
#' @export
#'
# env.internal.objectname = "tribble_paste"
# packageStartupMessage(paste0("Loading: ", "env1$env.internal$", env.internal.objectname)); 
env1$env.internal$tribble_paste <- function(input_table, output_context = env1$env.internal$guess_output_context()){
  output <- env1$env.internal$tribble_construct(input_table, oc = output_context)

  switch(output_context$output_mode,
         rstudioapi = rstudioapi::insertText(output),
         console = cat(output))
}

#' env1$env.internal$tribble_format
#' @description Parse the current clipboard as a table, or use the table argument supplied, and paste to the clipboard in tribble format.
#' @param input_table an optional input `data.frame`. If `input_table` is supplied, then nothing is read from the clipboard.
#' @param output_context an optional output context that defines the target and indentation. Default is console.
#' Table is output as `tribble()` call. Useful for creating reproducible examples.
#' @return Nothing.
#' @export
#'
# env.internal.objectname = "tribble_format"
# packageStartupMessage(paste0("Loading: ", "env1$env.internal$", env.internal.objectname)); 
env1$env.internal$tribble_format <- function(input_table, output_context = env1$env.internal$console_context()){
  if(!interactive()) stop("Cannot write to clipboard in non-interactive sessions.")
  output <- env1$env.internal$tribble_construct(input_table, oc = output_context)
  clipr::write_clip(output)
}

#' env1$env.internal$tribble_construct
#' @description Parse the current clipboard as a table, or use the table argument supplied, and return as a character string.
#' @param input_table an optional input `data.frame`. If `input_table` is supplied, then nothing is read from the clipboard.
#' @param oc an optional output context that defines the target and indentation. Default is console.
#' Table is output as `tribble()` call. Useful for creating reproducible examples.
#' @return The parsed table text.
#' @export
#'
env1$env.internal$tribble_construct <- function(input_table, oc = env1$env.internal$console_context()){
  # Determine input. Either clipboard or supplied table.
  if(missing(input_table)){
    input_table <- env1$env.internal$read_clip_tbl_guess()

    if(is.null(input_table)){
      cat("Could not paste clipboard as tibble. Text could not be parsed as table.")
      return(NULL)
    }
    # Parse data types from string using readr::guess_parser
    input_table_types <- attr(input_table, "col_types")
  }else{
    if(!is.data.frame(input_table) && !is_tibble(input_table)){
      cat("Could not format input_table as table. Unexpected class.")
      return(NULL)
    }
    if(nrow(input_table) >= env1$env.internal$.global_datapasta_env$max_rows){
      cat(paste0("Supplied large input_table (>= ",env1$env.internal$.global_datapasta_env$max_rows," rows). Was this a mistake? Use env1$env.internal$dp_set_max_rows(n) to increase the limit."))
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
                       FUN = env1$env.internal$column_width,
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
                   env1$env.internal$pad_to,
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
                                         env1$env.internal$render_type_pad_to,
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
        mapply(env1$env.internal$deparse_as,
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

env1$env.internal$deparse_as <- function(column, column_type) {
  deparse(methods::as(column, column_type))
}

env1$env.internal$column_width <- function(column, column_type) {

  if (length(column) == 0)
    return(nchar(deparse(column)))
  else
    return(
      suppressWarnings(
        max(vapply(X = column,
                   FUN = env1$env.internal$nchar_type,
                   FUN.VALUE = numeric(1),
                   df_col_type = column_type
                   ),
            na.rm = TRUE
            ) # blank cols will be all NA
      )
    )
}



#' env1$env.internal$nchar_type
#'
#' @param df_col_row a character string
#' @param df_col_type the type the string will be converted to.
#'
#' @return The number of characters wide this data would be in when rendered in text
env1$env.internal$nchar_type <- function(df_col_row, df_col_type){
  n_chars <- nchar(df_col_row)

  if(length(df_col_type) > 1) df_col_type <- "complex" # We can't really handle it.

  add_chars <- switch(df_col_type,
                      "integer" = 1, #for the "L",
                      "character" = 2 + env1$env.internal$nquote_str(df_col_row) + env1$env.internal$nslash_str(df_col_row), #2 for outer quotes +1 "\" for each quote and slash in string
                      "date" = 2 + env1$env.internal$nquote_str(df_col_row) + env1$env.internal$nslash_str(df_col_row), #2 for outer quotes +1 "\" for each quote and slash in string
                      "datetime" = 2 + env1$env.internal$nquote_str(df_col_row) + env1$env.internal$nslash_str(df_col_row), #2 for outer quotes +1 "\" for each quote and slash in string
                      "factor" = 2 + env1$env.internal$nquote_str(df_col_row) + env1$env.internal$nslash_str(df_col_row),
                      "complex" = 2 + env1$env.internal$nquote_str(df_col_row) + env1$env.internal$nslash_str(df_col_row), #Assume we print as a quoted char
                      0) #0 for other types
  return(n_chars + add_chars)

}

#' Count the number of quotes in a string
#'
#' @param char_vec the string to count quotes in
#'
#' @return a number, possibly 0.
env1$env.internal$nquote_str <- function(char_vec){
  sum(gregexpr(pattern = "(\"|\')", text = char_vec)[[1]] > 0)
}

env1$env.internal$nslash_str <- function(char_vec){
  sum(gregexpr(pattern = "\\\\", text = char_vec)[[1]] > 0)
}
#' env1$env.internal$pad_to
#' @description Left pad string to a certain size. A helper function for getting spacing in table correct.
#' @param char_vec character vector.
#' @param char_length length to pad to.
#'
#' @return char_vec left-padded with spaces to char_length.
#'
env1$env.internal$pad_to <-function(char_vec, char_length){
  paste0(strrep(" ",char_length - nchar(char_vec)),char_vec)
}

#' env1$env.internal$render_type
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
env1$env.internal$render_type <- function(char_vec, char_type){

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
                     "number" = readr::parse_number(char_vec, locale = readr::locale(decimal_mark = env1$env.internal$.global_datapasta_env$decimal_mark)),
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


#' env1$env.internal$render_type_pad_to
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
env1$env.internal$render_type_pad_to <- function(char_vec, char_type, char_length){
    env1$env.internal$pad_to(env1$env.internal$render_type(char_vec, char_type), char_length)
}

#' env1$env.internal$guess_sep
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
env1$env.internal$guess_sep <- function(char_vec){
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
env1$env.internal$read_clip_tbl_guess <- function (x = NULL, ...)
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
    .dots$sep <- env1$env.internal$guess_sep(x)
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



#' env1$env.internal$dp_set_decimal_mark
#'
#' @param mark The decimal mark to use when parsing "number" type data, as guessed by readr::guess_parser.
#' @description A function to optionally set the decimal mark if in a locale where it is not `.`. Will allow "3,14" to be parsed as 3.14, normally would be parsed as 314.
#' Will also handle spaces in numbers.
#'
#' @return NULL.
#' @export
env1$env.internal$dp_set_decimal_mark <- function(mark){
  env1$env.internal$.global_datapasta_env$decimal_mark <- mark
  invisible(NULL)
}

#' env1$env.internal$dp_set_max_rows
#'
#' @param num_rows The number of rows of an input at which any of env1$env.internal$tribble_construct() or df_construct() will abort parsing. Datapasta is untested on large tables. Use at own risk.
#'
#' @return NULL
#' @export
env1$env.internal$dp_set_max_rows <- function(num_rows){
  env1$env.internal$.global_datapasta_env$max_rows <- num_rows
  invisible(NULL)
}

#' env1$env.internal$guess_output_context
#'
#' @description Return the a list containing the guessed output target context, either rstudio or the console.
#'
#' @return a list containing the output target, space size of indent, and number of indents at context.
env1$env.internal$guess_output_context <- function(){
  if(requireNamespace("rstudioapi", quietly = TRUE) && rstudioapi::isAvailable()){
    output_context <- env1$env.internal$rstudio_context()
  }else{
    # rstudioapi unavailable. fallback to console
    output_context <- env1$env.internal$console_context()
  }
  output_context
}

#' @rdname env1$env.internal$custom_context
#' @export
#'
env1$env.internal$clipboard_context <- function(){
  output_context <- list(output_mode = "clipboard", nspc = 2, indent_context = 0, indent_head = FALSE)
  output_context
}

#' @rdname env1$env.internal$custom_context
#' @export
#'
env1$env.internal$rstudio_context <- function(){
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

#' @rdname env1$env.internal$custom_context
#' @export
#'
env1$env.internal$console_context <- function(){
  output_context <- list(output_mode = "console", nspc = 2, indent_context = 0, indent_head = FALSE)
  output_context
}

#' @rdname env1$env.internal$custom_context
#' @export
#'
env1$env.internal$markdown_context <- function(){
  output_context <- list(output_mode = "console", nspc = 2, indent_context = 4, indent_head = TRUE)
  output_context
}

#' env1$env.internal$custom_context
#'
#' @description the _context functions define lists of parameters for text formatting.
#' The specific contexts return hard-coded values appropriate to the context they describe, while env1$env.internal$custom_context allows definition of new contexts for custom formatting.
#' @param output_mode A named output mode, controls the target of the _paste functions options are "rstudioapi" or "console"
#' @param nspc The number of spaces for each indent level in the output context
#' @param indent_context The number of spaces applied initially to all lines in the output context
#' @param indent_head Logical. Apply the indent_context to the to the header row? Use FALSE if targeting cursor location.
#' @return an output context. An input to _paste, _format, _construct functions used to format whitespace.
#' @export
#'
env1$env.internal$custom_context <- function(output_mode = "console", nspc = 2, indent_context = 0, indent_head = TRUE){
  output_context <- list(output_mode = output_mode, nspc = nspc, indent_context = indent_context, indent_head = indent_head)
  output_context
}



#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@ global functions ----
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## \$ objectname = "f_df.tribble_construct" ----
# fun.tribble_paste = env1$env.internal$tribble_paste
# fun.t.tribble_paste = function(df) {df %>% t %>% as.data.frame %>% rownames_to_column("varname") %>% fun.tribble_paste}
objectname = "f_df.tribble_construct"
object = function(df) {
    out = env1$env.internal$tribble_construct(df)
    cat(out)
}
packageStartupMessage(paste0("Loading: ", "env1$", objectname)); 
.GlobalEnv$env1[[objectname]] = object
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/f_df.transpose.dev.r
## \$ objectname = "f_df.transpose" ----
objectname = "f_df.transpose"
object = function(df, varname4rowname = "varname") {
    if(varname4rowname %in% colnames(df)) df = df %>% column_to_rownames(var = varname4rowname)
    out = df %>% t %>% as.data.frame %>% rownames_to_column(varname4rowname) |> as_tibble()
    out
}                                    
packageStartupMessage(paste0("Loading: ", "env1$", objectname)); 
.GlobalEnv$env1[[objectname]] = object
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## \$ objectname = "f_df.t.tribble_construct" ----
objectname = "f_df.t.tribble_construct"
object = function(df) {
    out = env1$f_df.transpose(df)
    out = env1$env.internal$tribble_construct(out)
    cat(out)
}
packageStartupMessage(paste0("Loading: ", "env1$", objectname)); 
.GlobalEnv$env1[[objectname]] = object
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_vec.dput_line_by_line.dev.r
## \$ objectname = "f_vec.dput_line_by_line" ----
objectname = "f_vec.dput_line_by_line"
# object = function(vec) {
#     vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") |> paste0(collapse='",\n  "') |> paste0('c("',.,'")\n') |> cat("  \n", sep="")
# }
object = function(vec, space_between_vec_elements="\n  ", sep_parentheses = FALSE, end_of_text = "\n") {
    env1$env.internal$f_vec.format_line_by_line(vec, space_between_vec_elements, sep_parentheses, end_of_text) |> cat("  \n", sep="")
}
packageStartupMessage(paste0("Loading: ", "env1$", objectname)); 
.GlobalEnv$env1[[objectname]] = object
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
env1$env.internal$f_vec.format_line_by_line <- function(vec, space_between_vec_elements="\n  ", sep_parentheses = FALSE, end_of_text = "\n") {
    # vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c("',paste0(., collapse='",\n  "'),'")\n')} |> cat("  \n", sep="")
    if (is.null(vec)) {
        return("NULL")
    } else {
        vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c(',ifelse(sep_parentheses,space_between_vec_elements,""),'"',paste0(., collapse=paste0('",',space_between_vec_elements,'"')),'"',ifelse(sep_parentheses,str_extract(space_between_vec_elements,"\n"),""),')',end_of_text)}
    }
}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_list.dput_line_by_line.dev.r
## \$ objectname = "f_list.dput_line_by_line" ----
objectname = "f_list.dput_line_by_line"
object = function(list_vec, space_between_vec_elements="\n         ", space_between_list_elements = "\n     ", sep_parentheses = FALSE, end_of_text = "\n") {
    env1$env.internal$f_list.format_line_by_line(list_vec, space_between_vec_elements, space_between_list_elements, sep_parentheses, end_of_text) |> cat("  \n", sep="")
}
packageStartupMessage(paste0("Loading: ", "env1$", objectname)); 
.GlobalEnv$env1[[objectname]] = object
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#
env1$env.internal$f_list.format_line_by_line <- function(list_vec, space_between_vec_elements="\n         ", space_between_list_elements = "\n     ", sep_parentheses = FALSE, end_of_text = "\n") {
    .f_vec.paste_collapse <- function(vec, space_between_vec_elements="\n") {
        if (is.null(vec)) {
            return("NULL")
        } else {
            vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% paste0('"',.,'"') |> paste0(collapse=paste0(",",space_between_vec_elements))
        }
    }
    
    list_vec.formatted <- map(names(list_vec), function(name) {
        paste0('"', name, '" = c(', space_between_vec_elements, .f_vec.paste_collapse(list_vec[[name]], space_between_vec_elements), ")")
    })
    paste0("list(", ifelse(sep_parentheses,space_between_list_elements,""), paste0(list_vec.formatted, collapse = paste0(",",space_between_list_elements)), ifelse(sep_parentheses,str_extract(space_between_list_elements,"\n"),""), ")", end_of_text)
}


#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## \$ objectname = "f_vec1_vec2.setdiff" ----
# https://github.com/mkim0710/tidystat/blob/master/Rdev/f_vec1_vec2.setdiff.dev.r
objectname = "f_vec1_vec2.setdiff"
object = function(vec1, vec2) {
    out = list()
    out$vec1.character = vec1 = as.character(vec1)
    out$vec2.character = vec2 = as.character(vec2)
    out$union = union(vec1, vec2)
    out$intersect = intersect(vec1, vec2)
    out$setdiff_1_2 = setdiff(vec1, vec2)
    out$setdiff_2_1 = setdiff(vec2, vec1)
    out$identical = all.equal(vec1, vec2)
    out
}
packageStartupMessage(paste0("Loading: ", "env1$", objectname)); 
.GlobalEnv$env1[[objectname]] = object
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@ for (env1.dependancy in c("")) { -----
for (env1.dependancy in c("f_path.size_files")) {
    if(!env1.dependancy %in% names(.GlobalEnv$env1)) {
        if(exists("print.intermediate")) {if(print.intermediate) cat(paste0("sys.nframe() = ", sys.nframe(), "\n"))}
        sourcename = env1.dependancy |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(.GlobalEnv$env1$source[[sourcename]])}
    }
}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----  
# cat("* To revert to the last commited file, run the following terminal command:\n", 
#     '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# ls.str(env1) #-----
# ls.str(env1$env.internal) #-----
# # > ls.str(env1) #-----
# # env.internal : <environment: 0x000001d6104168f8> 
# # f_df.transpose : function (df, varname4rowname = "varname")  
# # f_path.size_files : function (path4read = getwd(), regex4filename = "\\.(rdata|rda|rds)$")  
# # f_df.t.tribble_construct : function (df)  
# # f_df.tribble_construct : function (df)  
# # > ls.str(env1$env.internal) #-----
# # clipboard_context : function ()  
# # column_width : function (column, column_type)  
# # console_context : function ()  
# # custom_context : function (output_mode = "console", nspc = 2, indent_context = 0, indent_head = TRUE)  
# # deparse_as : function (column, column_type)  
# # dp_set_decimal_mark : function (mark)  
# # dp_set_max_rows : function (num_rows)  
# # guess_output_context : function ()  
# # guess_sep : function (char_vec)  
# # markdown_context : function ()  
# # nchar_type : function (df_col_row, df_col_type)  
# # nquote_str : function (char_vec)  
# # nslash_str : function (char_vec)  
# # pad_to : function (char_vec, char_length)  
# # read_clip_tbl_guess : function (x = NULL, ...)  
# # render_type : function (char_vec, char_type)  
# # render_type_pad_to : function (char_vec, char_type, char_length)  
# # rstudio_context : function ()  
# # tribble_construct : function (input_table, oc = env1$env.internal$console_context())  
# # tribble_format : function (input_table, output_context = env1$env.internal$console_context())  
# # tribble_paste : function (input_table, output_context = env1$env.internal$guess_output_context())  



