
# https://stackoverflow.com/questions/18746456/simplified-dput-in-r
# https://cran.r-project.org/web/packages/datapasta/
# https://github.com/milesmcbain/datapasta


tribble_paste = datapasta::tribble_paste

# ?datapasta::tribble_paste
datapasta::tribble_paste
datapasta::tribble_construct
# > datapasta::tribble_paste
# function (input_table, output_context = guess_output_context()) 
# {
#     output <- tribble_construct(input_table, oc = output_context)
#     switch(output_context$output_mode, rstudioapi = rstudioapi::insertText(output), 
#         console = cat(output))
# }
# <bytecode: 0x0000017de1f4b0f8>
# <environment: namespace:datapasta>
# > datapasta::tribble_construct
# function (input_table, oc = console_context()) 
# {
#     if (missing(input_table)) {
#         input_table <- tryCatch({
#             read_clip_tbl_guess()
#         }, error = function(e) {
#             return(NULL)
#         })
#         if (is.null(input_table)) {
#             if (!clipr::clipr_available()) 
#                 message(.global_datapasta_env$no_clip_msg)
#             else message("Could not paste clipboard as tibble. Text could not be parsed as table.")
#             return(NULL)
#         }
#         input_table_types <- attr(input_table, "col_types")
#     }
#     else {
#         if (!is.data.frame(input_table) && !tibble::is_tibble(input_table)) {
#             message("Could not format input_table as table. Unexpected class.")
#             return(NULL)
#         }
#         if (nrow(input_table) >= .global_datapasta_env$max_rows) {
#             message(paste0("Supplied large input_table (>= ", 
#                 .global_datapasta_env$max_rows, " rows). Was this a mistake? Use dp_set_max_rows(n) to increase the limit."))
#             return(NULL)
#         }
#         input_table_types <- lapply(input_table, class)
#         input_table <- as.data.frame(lapply(input_table, as.character), 
#             stringsAsFactors = FALSE)
#     }
#     factor_cols <- which(input_table_types == "factor")
#     if (length(factor_cols > 0)) {
#         warning("Column(s) ", paste0(factor_cols, collapse = ","), 
#             " have been converted from factor to character in tribble output.")
#     }
#     col_widths <- mapply(input_table, FUN = function(df_col, 
#         df_col_type) {
#         max(vapply(X = df_col, FUN = nchar_type, FUN.VALUE = numeric(1), 
#             df_col_type = df_col_type), na.rm = TRUE)
#     }, df_col_type = input_table_types)
#     col_widths <- mapply(max, col_widths, nchar(names(input_table)) + 
#         1)
#     header <- paste0(ifelse(oc$indent_head, yes = strrep(" ", 
#         oc$indent_context), no = ""), "tibble::tribble(\n")
#     names_row <- paste0(paste0(strrep(" ", oc$indent_context + 
#         oc$nspc), paste0(paste0(mapply(pad_to, paste0("~", names(input_table)), 
#         col_widths), ","), collapse = " ")), "\n")
#     body_rows <- lapply(X = as.data.frame(t(input_table), stringsAsFactors = FALSE), 
#         FUN = function(col) {
#             paste0(strrep(" ", oc$indent_context + oc$nspc), 
#                 paste0(paste0(mapply(render_type_pad_to, col, 
#                   input_table_types, col_widths), ","), collapse = " "), 
#                 "\n", collapse = "")
#         })
#     body_rows <- paste0(as.vector(body_rows), collapse = "")
#     body_rows <- gsub(pattern = ",\n$", replacement = "\n", x = body_rows)
#     footer <- paste0(strrep(" ", oc$indent_context + oc$nspc), 
#         ")\n")
#     output <- paste0(header, names_row, body_rows, footer)
#     return(invisible(output))
# }
# <bytecode: 0x0000017de9d50bd8>
# <environment: namespace:datapasta>



dput_small1<- function(x,
                       name=as.character(substitute(x)),
                       multiline = TRUE,
                       n=if ('list' %in% class(x)) length(x) else nrow(x),
                       random=FALSE,
                       seed = 1){
  name
  if('tbl_df' %in% class(x)) create_fun <- "tibble::tibble" else
    if('list' %in% class(x)) create_fun <- "list" else
      if('data.table' %in% class(x)) create_fun <- "data.table::data.table" else
        create_fun <- "data.frame"

    if(random) {
      set.seed(seed)
      if(create_fun == "list") x <- x[sample(1:length(x),n)] else 
        x <- x[sample(1:nrow(x),n),]
    } else {
      x <- head(x,n)
    }

    line_sep <- if (multiline) "\n    " else ""
    cat(sep="",name," <- ",create_fun,"(\n  ",
        paste0(unlist(
          Map(function(item,nm) paste0(nm,if(nm=="") "" else " = ",paste(capture.output(dput(item)),collapse=line_sep)),
              x,if(is.null(names(x))) rep("",length(x)) else names(x))),
          collapse=",\n  "),
        if(create_fun == "data.frame") ",\n  stringsAsFactors = FALSE)" else "\n)")
}

dput_small1(list(1,2,c=3,d=4),"my_list",random=TRUE,n=3)
# my_list <- list(
#   2,
#   d = 4,
#   c = 3
# )



dput_small3 <- function(df,
                        name=as.character(substitute(df)),
                        n= nrow(df),
                        random=FALSE,
                        seed = 1){
  name
  if(random) {
    set.seed(seed)
    df <- df[sample(1:nrow(df),n),]
  } else {
    df <- head(df,n)
  }
  df1 <- lapply(df,function(col) if(is.factor(col)) as.character(col) else col)
  dputs   <- sapply(df1,function(col){
    col_dputs <- sapply(col,function(elt) paste(capture.output(dput(elt)),collapse=""))
    max_char <- max(nchar(unlist(col_dputs)))
    sapply(col_dputs,function(elt) paste(c(rep(" ",max_char-nchar(elt)),elt),collapse=""))
  })
  lines   <- paste(apply(dputs,1,paste,collapse=", "),collapse=",\n  ")
  output  <- paste0(name," <- tibble::tribble(\n  ",
                    paste0("~",names(df),collapse=", "),
                    ",\n  ",lines,"\n)")
  cat(output)
  sapply(names(df), function(x) if(is.factor(df[[x]])) cat(sep="","\n",name,'$',x,' <- factor(', name,'$',x,')'))
  invisible(NULL)
}

dput_small3(dplyr::starwars[c(1:3,11)],"sw",n=6,random=TRUE)
# sw <- tibble::tribble(
#   ~name, ~height, ~mass, ~films,
#   "Lando Calrissian", 177L,       79,                     c("Return of the Jedi", "The Empire Strikes Back"),
#      "Finis Valorum", 170L, NA_real_,                                                   "The Phantom Menace",
#       "Ki-Adi-Mundi", 198L,       82, c("Attack of the Clones", "The Phantom Menace", "Revenge of the Sith"),
#           "Grievous", 216L,      159,                                                  "Revenge of the Sith",
#     "Wedge Antilles", 170L,       77,       c("Return of the Jedi", "The Empire Strikes Back", "A New Hope"),
#         "Wat Tambor", 193L,       48,                                                 "Attack of the Clones"
# )





# @@ END-----  


