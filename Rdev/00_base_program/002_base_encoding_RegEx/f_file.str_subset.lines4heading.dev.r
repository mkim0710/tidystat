##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS ----  
#@@ Heading 1                                                         ...60
##@ Heading 1.1                                                       ...63
# @@ Heading 2                                                        ...65
## @ Heading 2.1                                                      ...67
# @@ START) dev.old                                                   ...73
## env0 = env1                                                        ...74
# @@ START) dev                                                       ...117
## env0 = env1                                                        ...118
# @@ START) function.old                                              ...167
# ->> Now included in env1$env.internal.source.r                      ...173
## :: f_file.str_subset.lines4heading.old =                           ...180
# @@ START) function                                                  ...233
# ->> Now included in env1$env.internal.source.r                      ...239
## :: f_file.str_subset.lines4heading =                               ...246
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##
##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS ----  
#@@ Heading 1 
##@ Heading 1.1 
# @@ Heading 2 
## @ Heading 2.1 
# @@ START) dev.old   
## env0 = env1 
# @@ START) dev   
## env0 = env1 
# @@ START) function.old   
# ->> Now included in env1$env.internal.source.r 
## :: f_file.str_subset.lines4heading.old =    
# @@ START) function   
# ->> Now included in env1$env.internal.source.r 
## :: f_file.str_subset.lines4heading.edit_windows_notepad.or_browseURL =    
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##   



# --> Now included in "env1$env.internal.source.r"
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://chatgpt.com/g/g-p-676526fc1c848191a84f233bacf2df34-regex/c/67651b58-d21c-800e-9f60-b8d16e9a13a7
# Cf) (?!NegativeLookahead)MainPatternToMatch
# e.g.) (?!abc)XYZ DOES match "abcXYZ", because when looking at the point of "(", there was no "abc" ahead (after) "(".  → rarely makes sense???
# e.g.) remove all non-heading lines, when heading lines starts with "# @" 
# ^(?!# @).*: DOES match all lines that DOES NOT start with "# @", because when looking at the point of "(", which is at the beginning of a line (^), there should be no "# @" ahead (after) "(".
# Alternative:
# Search: ^(# @.*)?.*
# Replace to: $1

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

#|________________________________________________________________________________|#  ----  
#@@ Heading 1 ----


##@ Heading 1.1 ----

# @@ Heading 2 ====

## @ Heading 2.1 ----



#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) dev.old -----  
## env0 = env1 ----
# input_path_file = rstudioapi::getSourceEditorContext()$path
# RegEx4heading = "^#{1,2}[^#].*(-{4}|={4}) *$"
# add_line_numbers = TRUE
# remove_lines_with_no_alphabet = TRUE
# output_path_file = NULL
# replace_input_path_file = FALSE
# 
# input.readLines <- readLines(input_path_file, warn = FALSE)
# input.readLines %>% str
# 
# input.readLines.except_TOC.str_replace_all <- str_subset(
#     string = input.readLines,
#     pattern = RegEx4heading,
#     negate = FALSE
# )
# input.readLines.except_TOC.str_replace_all %>% str
# 
# input.readLines.except_TOC.str_replace_all = input.readLines.except_TOC.str_replace_all %>% str_replace_all("(-{4,}|={4,})( *)$", "\\2")
# input.readLines.except_TOC.str_replace_all %>% str
# 
# if (remove_lines_with_no_alphabet) input.readLines.except_TOC.str_replace_all = input.readLines.except_TOC.str_replace_all %>% str_subset("[a-zA-Z]")
# input.readLines.except_TOC.str_replace_all %>% str
# 
# input.readLines.except_TOC.str_replace_all = input.readLines.except_TOC.str_replace_all %>% 
#     str_subset("^# TABLE OF CONTENTS", negate = TRUE)
# input.readLines.except_TOC.str_replace_all = input.readLines.except_TOC.str_replace_all %>% 
#     str_subset("^# @@ END", negate = TRUE)
# input.readLines.except_TOC.str_replace_all %>% str
# 
# input.readLines.except_TOC.str_replace_all = 
#     c(
#         "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  ",
#         "# TABLE OF CONTENTS ----  ", 
#         input.readLines.except_TOC.str_replace_all,
#         "##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  "
#     )
# input.readLines.except_TOC.str_replace_all %>% str
# input.readLines.except_TOC.str_replace_all %>% paste0(collapse = "\n") %>% cat("\n")


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) dev -----  
## env0 = env1 ----
input_path_file = rstudioapi::getSourceEditorContext()$path
RegEx4heading = "^#{1,2}[^#].*(-{4}|={4}) *$"
add_line_numbers = TRUE
remove_lines_with_no_alphabet = TRUE
output_path_file = NULL
replace_input_path_file = FALSE

input.readLines <- readLines(input_path_file, warn = FALSE)
input.readLines %>% str
# > input.readLines %>% str
#  chr [1:422] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS ----  " ...

input.readLines %>% str_which("^##H+ BEGINNING OF TABLE OF CONTENTS") %>% min
input.readLines %>% str_which("^##H+ THE END OF TABLE OF CONTENTS") %>% max

min(input.readLines %>% str_which("^##H+ BEGINNING OF TABLE OF CONTENTS")):max(input.readLines %>% str_which("^##H+ THE END OF TABLE OF CONTENTS")) %>% dput
-min(input.readLines %>% str_which("^##H+ BEGINNING OF TABLE OF CONTENTS")):-max(input.readLines %>% str_which("^##H+ THE END OF TABLE OF CONTENTS")) %>% dput
# > min(input.readLines %>% str_which("^##H+ BEGINNING OF TABLE OF CONTENTS")):max(input.readLines %>% str_which("^##H+ THE END OF TABLE OF CONTENTS")) %>% dput
# 1:34
# > -min(input.readLines %>% str_which("^##H+ BEGINNING OF TABLE OF CONTENTS")):-max(input.readLines %>% str_which("^##H+ THE END OF TABLE OF CONTENTS")) %>% dput
# -1:-34

vec_index4TOC = min(input.readLines %>% str_which("^##H+ BEGINNING OF TABLE OF CONTENTS")):max(input.readLines %>% str_which("^##H+ THE END OF TABLE OF CONTENTS"))
vec_index4TOC %>% dput
# > vec_index4TOC %>% dput
# 1:34

input.readLines[-min(input.readLines %>% str_which("^##H+ BEGINNING OF TABLE OF CONTENTS")):-max(input.readLines %>% str_which("^##H+ THE END OF TABLE OF CONTENTS"))] %>% str
str(!1:length(input.readLines) %in% vec_index4TOC)
summary(!1:length(input.readLines) %in% vec_index4TOC)
# > input.readLines[-min(input.readLines %>% str_which("^##H+ BEGINNING OF TABLE OF CONTENTS")):-max(input.readLines %>% str_which("^##H+ THE END OF TABLE OF CONTENTS"))] %>% str
#  chr [1:388] "" "" "" "# --> Now included in \"env1$env.internal.source.r\"" ...
# > str(!1:length(input.readLines) %in% vec_index4TOC)
#  logi [1:422] FALSE FALSE FALSE FALSE FALSE FALSE ...
# > summary(!1:length(input.readLines) %in% vec_index4TOC)
#    Mode   FALSE    TRUE 
# logical      34     388 

input.readLines[!1:length(input.readLines) %in% vec_index4TOC] %>% str
# > input.readLines[!1:length(input.readLines) %in% vec_index4TOC] %>% str
#  chr [1:388] "" "" "" "# --> Now included in \"env1$env.internal.source.r\"" ...

input.readLines.except_TOC = input.readLines[-min(input.readLines %>% str_which("^##H+ BEGINNING OF TABLE OF CONTENTS")):-max(input.readLines %>% str_which("^##H+ THE END OF TABLE OF CONTENTS"))]
input.readLines.except_TOC %>% str
# > input.readLines.except_TOC %>% str
#  chr [1:388] "" "" "" "# --> Now included in \"env1$env.internal.source.r\"" ...

input.readLines.except_TOC.str_replace_all <- str_replace_all(
    string = input.readLines.except_TOC,
    pattern = RegEx4heading %>% str_replace("^\\^", "") %>% str_replace("\\$$", "") %>% {paste0("^(",.,")?.*")},
    replacement = "\\1"
)
input.readLines.except_TOC.str_replace_all %>% str
# > input.readLines.except_TOC.str_replace_all %>% str
#  chr [1:340] "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ...

input.readLines.except_TOC.str_replace_all = input.readLines.except_TOC.str_replace_all %>% str_replace_all("(-{4,}|={4,})( *)$", "\\2")
input.readLines.except_TOC.str_replace_all %>% str
# > input.readLines.except_TOC.str_replace_all %>% str
#  chr [1:388] "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ...

vec_new_TOC = input.readLines.except_TOC.str_replace_all[!input.readLines.except_TOC.str_replace_all == ""]
vec_new_TOC %>% str
# > vec_new_TOC %>% str
#  chr [1:23] "#|________________________________________________________________________________|#  ----  " "#@@ Heading 1 ----" ...

if (remove_lines_with_no_alphabet) vec_new_TOC = vec_new_TOC %>% str_subset("[a-zA-Z]")
vec_new_TOC %>% str
# > vec_new_TOC %>% str
#  chr [1:17] "#@@ Heading 1 ----" "##@ Heading 1.1 ----" "# @@ Heading 2 ====" "## @ Heading 2.1 ----" ...

vec_new_TOC = vec_new_TOC %>% 
    str_subset("^# TABLE OF CONTENTS", negate = TRUE)
vec_new_TOC = vec_new_TOC %>% 
    str_subset("^# @@ END", negate = TRUE)
vec_new_TOC %>% str
# > vec_new_TOC %>% str
#  chr [1:14] "#@@ Heading 1 ----" "##@ Heading 1.1 ----" "# @@ Heading 2 ====" "## @ Heading 2.1 ----" ...

vec_new_TOC = 
    c(
        "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  ",
        "# TABLE OF CONTENTS ----  ", 
        vec_new_TOC,
        "##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  "
    )
vec_new_TOC %>% str
vec_new_TOC %>% paste0(collapse = "\n") %>% cat("\n")
# > vec_new_TOC %>% str
#  chr [1:17] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS ----  " ...

input.readLines.except_TOC.add_new_TOC =
    c(vec_new_TOC, input.readLines.except_TOC)
input.readLines.except_TOC.add_new_TOC %>% str
# > input.readLines.except_TOC.add_new_TOC %>% str
#  chr [1:405] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS ----  " ...

input.readLines.except_TOC.add_new_TOC = 
            ifelse(
                input.readLines.except_TOC.add_new_TOC == "", "", 
                paste0(
                    input.readLines.except_TOC.add_new_TOC, 
                    strrep(" ",pmax(4, 70-nchar(input.readLines.except_TOC.add_new_TOC))),
                    "...", 
                    1:length(input.readLines.except_TOC.add_new_TOC)
                )
            )
input.readLines.except_TOC.add_new_TOC %>% str
# > input.readLines.except_TOC.add_new_TOC %>% str
#  chr [1:405] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##      ...1" ...

output_path_file = tempfile(paste0(basename(input_path_file),"-TableOfContents-"), fileext = ".txt")
output_path_file %>% str
# > output_path_file %>% str
#  chr "C:\\Users\\mkim0\\AppData\\Local\\Temp\\RtmpuCsi3f\\f_file.str_subset.lines4heading.dev.r-TableOfContents-11874623757f.txt"

writeLines(input.readLines.except_TOC.add_new_TOC, con = output_path_file)
env1$env.internal.attach$f_file.edit_windows_notepad.or_browseURL(output_path_file)
    
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function.old -----  
# .sourcename_root = .filename.source.r |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.sourcename_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ->> Now included in env1$env.internal.source.r ----

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_file.str_subset.lines4heading.old"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = NULL
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_file.str_subset.lines4heading.old =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.str_replace_all.old.ObjectName.dev.r
.tmp$objectname = "f_file.str_subset.lines4heading.old"
.tmp$object = function(input_path_file = rstudioapi::getSourceEditorContext()$path, RegEx4heading = "^#{1,2}[^#].*(-{4}|={4}) *$", remove_lines_with_no_alphabet = TRUE, output_path_file = NULL, replace_input_path_file = FALSE) {
    
    library(stringr)

    # Read the file content
    input.readLines <- readLines(input_path_file, warn = FALSE)
    
    input.readLines.except_TOC.str_replace_all <- str_subset(
        string = input.readLines,
        pattern = RegEx4heading,
        negate = FALSE
    )
    
    input.readLines.except_TOC.str_replace_all = input.readLines.except_TOC.str_replace_all %>% str_replace_all("(-{4,}|={4,})( *)$", "\\2")
    
    if (remove_lines_with_no_alphabet) input.readLines.except_TOC.str_replace_all = input.readLines.except_TOC.str_replace_all %>% str_subset("[a-zA-Z]")
    
    input.readLines.except_TOC.str_replace_all = input.readLines.except_TOC.str_replace_all %>% 
        str_subset("^# TABLE OF CONTENTS", negate = TRUE)
    input.readLines.except_TOC.str_replace_all = input.readLines.except_TOC.str_replace_all %>% 
        str_subset("^# @@ END", negate = TRUE)

    input.readLines.except_TOC.str_replace_all = 
        c(
            "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  ",
            "# TABLE OF CONTENTS ----  ", 
            input.readLines.except_TOC.str_replace_all,
            "##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  "
        )
    
    if(replace_input_path_file) {
        if (!is.null(output_path_file)) {warning("replace_input_path_file == TRUE -> output_path_file will be ignored.")}
        output_path_file <- input_path_file # Overwrite the original file
    } 
    
    if (!is.null(output_path_file)) {
        writeLines(c(input.readLines.except_TOC.str_replace_all, input.readLines), con = output_path_file)
        message(paste0("Added TABLE OF CONTENTS in the beginning of : \n", deparse(input_path_file), "\n and saved to : \n", deparse(output_path_file), "\n"))
    }
    
    input.readLines.except_TOC.str_replace_all %>% paste0(collapse = "\n") %>% cat("\n")
    
    invisible(input.readLines.except_TOC.str_replace_all)
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function -----  
# .sourcename_root = .filename.source.r |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.sourcename_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ->> Now included in env1$env.internal.source.r ----

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_file.str_subset.lines4heading.edit_windows_notepad.or_browseURL"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = NULL
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_file.str_subset.lines4heading.edit_windows_notepad.or_browseURL =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.str_replace_all.old.ObjectName.dev.r
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.str_subset.lines4heading.dev.r
.tmp$objectname = "f_file.str_subset.lines4heading.edit_windows_notepad.or_browseURL"
.tmp$object = function(input_path_file = rstudioapi::getSourceEditorContext()$path, RegEx4heading = "^#{1,2}[^#].*(-{4}|={4}) *$", add_line_numbers = TRUE, remove_lines_with_no_alphabet = TRUE, output_path_file = NULL, replace_input_path_file = FALSE, cat2console = FALSE) {
    
    library(stringr)

    # Read the file content
    input.readLines <- readLines(input_path_file, warn = FALSE)
    
    vec_index4TOC = min(input.readLines %>% str_which("^##H+ BEGINNING OF TABLE OF CONTENTS")):max(input.readLines %>% str_which("^##H+ THE END OF TABLE OF CONTENTS"))
    
    input.readLines.except_TOC = input.readLines[!1:length(input.readLines) %in% vec_index4TOC] 

    input.readLines.except_TOC.str_replace_all <- str_replace_all(
        string = input.readLines.except_TOC,
        pattern = RegEx4heading %>% str_replace("^\\^", "") %>% str_replace("\\$$", "") %>% {paste0("^(",.,")?.*")},
        replacement = "\\1"
    )

    input.readLines.except_TOC.str_replace_all = input.readLines.except_TOC.str_replace_all %>% str_replace_all("(-{4,}|={4,})( *)$", "\\2")

    vec_new_TOC = input.readLines.except_TOC.str_replace_all[!input.readLines.except_TOC.str_replace_all == ""]
    if (remove_lines_with_no_alphabet) vec_new_TOC = vec_new_TOC %>% str_subset("[a-zA-Z]")

    vec_new_TOC = vec_new_TOC %>% 
        str_subset("^# TABLE OF CONTENTS", negate = TRUE)
    vec_new_TOC = vec_new_TOC %>% 
        str_subset("^# @@ END", negate = TRUE)

    vec_new_TOC = 
        c(
            "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  ",
            "# TABLE OF CONTENTS ----  ", 
            vec_new_TOC,
            "##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  "
        )
    
    input.readLines.except_TOC.add_new_TOC =
        c(vec_new_TOC, input.readLines.except_TOC.str_replace_all)
    
    if(add_line_numbers) {
        input.readLines.except_TOC.add_new_TOC = 
            ifelse(
                input.readLines.except_TOC.add_new_TOC == "", "", 
                paste0(
                    input.readLines.except_TOC.add_new_TOC, 
                    strrep(" ",pmax(4, 70-nchar(input.readLines.except_TOC.add_new_TOC))),
                    "...", 
                    1:length(input.readLines.except_TOC.add_new_TOC)
                )
            )
        vec_new_TOC.add_line_numbers = input.readLines.except_TOC.add_new_TOC[min(input.readLines.except_TOC.add_new_TOC %>% str_which("^##H+ BEGINNING OF TABLE OF CONTENTS")):max(input.readLines.except_TOC.add_new_TOC %>% str_which("^##H+ THE END OF TABLE OF CONTENTS"))]
    }
    
    if(replace_input_path_file) {
        if (!is.null(output_path_file)) {warning("replace_input_path_file == TRUE -> output_path_file will be ignored.")}
        output_path_file <- input_path_file # Overwrite the original file
    } 
    
    if (!is.null(output_path_file)) {
        message(paste0("Adding TABLE OF CONTENTS in the beginning of : \n", deparse(input_path_file), "\n and saving to : \n", deparse(output_path_file), "\n"))
    } else {
        output_path_file = tempfile(paste0(basename(input_path_file),"-TableOfContents-"), fileext = ".txt")
    }
    writeLines(input.readLines.except_TOC.add_new_TOC, con = output_path_file)
    # env1$env.internal.attach$f_file.edit_windows_notepad.or_browseURL(output_path_file)
    
    if(add_line_numbers) vec_new_TOC = vec_new_TOC.add_line_numbers
    if(cat2console) vec_new_TOC %>% paste0(collapse = "\n") %>% cat("\n")
    
    invisible(vec_new_TOC)
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

env1$f$f_file.str_subset.lines4heading.edit_windows_notepad.or_browseURL(cat2console = TRUE)
env1$f$f_file.str_subset.lines4heading.edit_windows_notepad.or_browseURL(cat2console = TRUE, add_line_numbers = FALSE)

# env1$f$f_file.str_subset.lines4heading.edit_windows_notepad.or_browseURL(replace_input_path_file = TRUE)


### env1$f$f_file.str_subset.lines4heading.edit_windows_notepad.or_browseURL("env1$env.internal.source.r", RegEx4heading = "^#{1,1}[^#].*(-{4}|={4}) *$") ----
env1$f$f_file.str_subset.lines4heading.edit_windows_notepad.or_browseURL("env1$env.internal.source.r", RegEx4heading = "^#{1,1}[^#].*(-{4}|={4}) *$")
env1$f$f_file.str_subset.lines4heading.edit_windows_notepad.or_browseURL("env1$env.internal.source.r", RegEx4heading = "^#{1,2}[^#].*(-{4}|={4}) *$")

### env1$f$f_file.str_subset.lines4heading.edit_windows_notepad.or_browseURL("f_df.t.tribble_construct.source.r", RegEx4heading = "^#{1,1}[^#].*(-{4}|={4}) *$") ----
env1$f$f_file.str_subset.lines4heading.edit_windows_notepad.or_browseURL("f_df.t.tribble_construct.source.r", RegEx4heading = "^#{1,1}[^#].*(-{4}|={4}) *$")
env1$f$f_file.str_subset.lines4heading.edit_windows_notepad.or_browseURL("f_df.t.tribble_construct.source.r", RegEx4heading = "^#{1,2}[^#].*(-{4}|={4}) *$")


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
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


