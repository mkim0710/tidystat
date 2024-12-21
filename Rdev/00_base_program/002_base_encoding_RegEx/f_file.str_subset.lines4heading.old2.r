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
## ->> Now included in env1$env.internal.source.r                      ...173
## :: f_file.make_TABLE_OF_CONTENTS.old =                           ...180
# @@ START) function                                                  ...233
## ->> Now included in env1$env.internal.source.r                      ...239
## :: f_file.make_TABLE_OF_CONTENTS =                               ...246
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
## ->> Now included in env1$env.internal.source.r 
## :: f_file.make_TABLE_OF_CONTENTS.old =    
# @@ START) function   
## ->> Now included in env1$env.internal.source.r 
## :: f_file.make_TABLE_OF_CONTENTS.old =    
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


# https://chatgpt.com/g/g-p-6765276504708191bde554c8d2095b8b-r-project/c/67658d76-9448-800e-bb66-6257dd27e7b5 ----
# https://chatgpt.com/g/g-p-6765276504708191bde554c8d2095b8b-r-project/c/67658de1-d780-800e-ab6e-ca18fc2fa627 ----

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

input.readLines.except_TOC.str_replace_all <- str_replace_all(
    string = input.readLines,
    pattern = RegEx4heading %>% str_replace("^\\^", "") %>% str_replace("\\$$", "") %>% {paste0("^(",.,")?.*")},
    replacement = "\\1"
)
input.readLines.except_TOC.str_replace_all %>% str

input.readLines.except_TOC.str_replace_all = input.readLines.except_TOC.str_replace_all %>% str_replace_all("(-{4,}|={4,})( *)$", "\\2")
input.readLines.except_TOC.str_replace_all %>% str

input.readLines.except_TOC.str_replace_all = input.readLines.except_TOC.str_replace_all |> env1$env.internal$f_vec_chr.add_line_numbers()
input.readLines.except_TOC.str_replace_all %>% str

vec_new_TOC = input.readLines.except_TOC.str_replace_all |> na_if("") |> na.omit()
vec_new_TOC %>% str

if (remove_lines_with_no_alphabet) vec_new_TOC = vec_new_TOC %>% str_subset("[a-zA-Z]")
vec_new_TOC %>% str

vec_new_TOC = vec_new_TOC %>% 
    str_subset("# TABLE OF CONTENTS", negate = TRUE)
vec_new_TOC = vec_new_TOC %>% 
    str_subset("@@ END", negate = TRUE)
vec_new_TOC %>% str

vec_new_TOC = 
    c(
        "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  ",
        "# TABLE OF CONTENTS ----  ", 
        vec_new_TOC,
        "##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  "
    )
vec_new_TOC %>% str
vec_new_TOC %>% paste0(collapse = "\n") %>% cat("\n")


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function -----  
# .sourcename_root = .filename.source.r |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.sourcename_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## ->> Now included in env1$env.internal.source.r ----

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_file.make_TABLE_OF_CONTENTS.edit_windows_notepad.or_browseURL"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = NULL
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_file.make_TABLE_OF_CONTENTS.edit_windows_notepad.or_browseURL =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.str_replace_all.old.ObjectName.dev.r
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.make_TABLE_OF_CONTENTS.old2.r
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.make_TABLE_OF_CONTENTS.dev.r
.tmp$objectname = "f_file.make_TABLE_OF_CONTENTS.edit_windows_notepad.or_browseURL"
.tmp$object = function(input_path_file = rstudioapi::getSourceEditorContext()$path, RegEx4heading = "^#{1,2}[^#].*(-{4}|={4}) *$", add_line_numbers = TRUE, remove_lines_with_no_alphabet = TRUE, output_path_file = NULL, replace_input_path_file = FALSE, cat2console = FALSE) {
    
    library(stringr)

    # Read the file content
    input.readLines <- readLines(input_path_file, warn = FALSE)

    input.readLines.except_TOC.str_replace_all <- str_replace_all(
        string = input.readLines,
        pattern = RegEx4heading %>% str_replace("^\\^", "") %>% str_replace("\\$$", "") %>% {paste0("^(",.,")?.*")},
        replacement = "\\1"
    )

    input.readLines.except_TOC.str_replace_all = input.readLines.except_TOC.str_replace_all %>% str_replace_all("(-{4,}|={4,})( *)$", "\\2")

    if(add_line_numbers) input.readLines.except_TOC.str_replace_all = input.readLines.except_TOC.str_replace_all |> env1$env.internal$f_vec_chr.add_line_numbers()

    vec_new_TOC = input.readLines.except_TOC.str_replace_all |> na_if("") |> na.omit()
    if (remove_lines_with_no_alphabet) vec_new_TOC = vec_new_TOC %>% str_subset("[a-zA-Z]")

    vec_new_TOC = vec_new_TOC %>% 
        str_subset("# TABLE OF CONTENTS", negate = TRUE)
    vec_new_TOC = vec_new_TOC %>% 
        str_subset("@@ END", negate = TRUE)

    vec_new_TOC = 
        c(
            "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  ",
            "# TABLE OF CONTENTS ----  ", 
            vec_new_TOC,
            "##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  "
        )
    
    if(replace_input_path_file) {
        if (!is.null(output_path_file)) {warning("replace_input_path_file == TRUE -> output_path_file will be ignored.")}
        output_path_file <- input_path_file # Overwrite the original file
    } 
    
    if (!is.null(output_path_file)) {
        message(paste0("Adding TABLE OF CONTENTS in the beginning of : \n", deparse(input_path_file), "\n and saving to : \n", deparse(output_path_file), "\n"))
    } else {
        output_path_file = tempfile(paste0(basename(input_path_file),"-TableOfContents-"), fileext = ".txt")
    }
    writeLines(c(vec_new_TOC, input.readLines), con = output_path_file)
    env1$env.internal.attach$f_file.edit_windows_notepad.or_browseURL(output_path_file)
    
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
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

env1$f$f_file.make_TABLE_OF_CONTENTS.edit_windows_notepad.or_browseURL()
env1$f$f_file.make_TABLE_OF_CONTENTS.edit_windows_notepad.or_browseURL(add_line_numbers = FALSE)

# env1$f$f_file.make_TABLE_OF_CONTENTS.edit_windows_notepad.or_browseURL(replace_input_path_file = TRUE)


### env1$f$f_file.make_TABLE_OF_CONTENTS.edit_windows_notepad.or_browseURL("env1$env.internal.source.r", RegEx4heading = "^#{1,1}[^#].*(-{4}|={4}) *$") ----
env1$f$f_file.make_TABLE_OF_CONTENTS.edit_windows_notepad.or_browseURL("env1$env.internal.source.r", RegEx4heading = "^#{1,1}[^#].*(-{4}|={4}) *$")
env1$f$f_file.make_TABLE_OF_CONTENTS.edit_windows_notepad.or_browseURL("env1$env.internal.source.r", RegEx4heading = "^#{1,2}[^#].*(-{4}|={4}) *$")

### env1$f$f_file.make_TABLE_OF_CONTENTS.edit_windows_notepad.or_browseURL("f_df.t.tribble_construct.source.r", RegEx4heading = "^#{1,1}[^#].*(-{4}|={4}) *$") ----
env1$f$f_file.make_TABLE_OF_CONTENTS.edit_windows_notepad.or_browseURL("f_df.t.tribble_construct.source.r", RegEx4heading = "^#{1,1}[^#].*(-{4}|={4}) *$")
env1$f$f_file.make_TABLE_OF_CONTENTS.edit_windows_notepad.or_browseURL("f_df.t.tribble_construct.source.r", RegEx4heading = "^#{1,2}[^#].*(-{4}|={4}) *$")



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


