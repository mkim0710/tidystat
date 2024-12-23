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
## :: f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.old =                           ...180
# @@ START) function                                                  ...233
## ->> Now included in env1$env.internal.source.r                      ...239
## :: f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers =                               ...246
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
## :: f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.old =    
# @@ START) function   
## ->> Now included in env1$env.internal.source.r 
## :: f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT =    
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


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ REFERENCES) ----  
##  ----  
## 
## 
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ DATA) example ----  

#|________________________________________________________________________________|#  ----  
#@@ Heading 1 ----


##@ Heading 1.1 ----

# @@ Heading 2 ====

## @ Heading 2.1 ----

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: input_path_file = "Rdev/00_base_program/002_base_encoding_RegEx/FileSample_with_TABLE_OF_CONTENTS.r" ----  
# "Rdev/00_base_program/002_base_encoding_RegEx/FileSample_with_TABLE_OF_CONTENTS.r" |> env1$env.internal.attach$f_file.edit_windows_notepad.or_browseURL()

# input_path_file = rstudioapi::getSourceEditorContext()$path
input_path_file = "Rdev/00_base_program/002_base_encoding_RegEx/FileSample_with_TABLE_OF_CONTENTS.r"
level4TOC = 2
RegEx4heading = paste0("^(?!# #)#{1,",level4TOC,"}[^#].*(?:-{4}|={4}) *$")
RegEx4heading
# > RegEx4heading
# [1] "^(?!# #)#{1,2}[^#].*(?:-{4}|={4}) *$"
add_line_numbers = TRUE
merge_with_input_vec_chr.except_TOC = FALSE
remove_lines_with_no_2alphabet_word = TRUE
output_path_file = NULL
replace_input_path_file = FALSE

input_vec_chr <- readLines(input_path_file, warn = FALSE)
input_vec_chr %>% str
# > input_vec_chr %>% str
#  chr [1:324] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS ----  " ...


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) dev-part1 -----  
# https://chatgpt.com/g/g-p-6765276504708191bde554c8d2095b8b-r-project/c/67658d76-9448-800e-bb66-6257dd27e7b5 ----
# https://chatgpt.com/g/g-p-6765276504708191bde554c8d2095b8b-r-project/c/67658de1-d780-800e-ab6e-ca18fc2fa627 ----

## env0 = env1 ----

# Rdev\00_base_program\002_base_encoding_RegEx\f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.dev-part1.r

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function-part1 -----  
# .sourcename_root = .filename.source.r |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.sourcename_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## ->> Now included in env1$env.internal.source.r ----

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_vec_chr.vec_TABLE_OF_CONTENTS.trim =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.str_replace_all.old.ObjectName.dev.r
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.dev.r
.tmp$env1_subenv_name = "env.internal"
.tmp$objectname = "f_vec_chr.vec_TABLE_OF_CONTENTS.trim"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
        input_vec_chr.except_TOC = env1$env.internal$f_vec_chr.list_SECTION_nonSECTION(readLines(rstudioapi::getSourceEditorContext()$path, warn = FALSE))$nonSECTION, 
        level4TOC = 2, RegEx4heading = paste0("^(?!# #)#{1,",level4TOC,"}[^#].*(?:-{4}|={4}) *$"), 
        remove_lines_with_no_2alphabet_word = TRUE, cat2console = FALSE) {
    
    library(stringr)
    
    vec_TABLE_OF_CONTENTS.trim = input_vec_chr.except_TOC %>% env1$f$f_vec_chr.na_if_NotMatching(RegEx4heading) %>% na.omit()
    vec_TABLE_OF_CONTENTS.trim = vec_TABLE_OF_CONTENTS %>% str_replace_all("(-{4,}|={4,})( *)$", "\\2")    # Remove the trailing "----" or "====", but keep the trailing spaces. This step should be done before applying env1$env.internal$f_vec_chr.add_line_numbers(). 
    
    ### |> str_subset("[a-zA-Z]{2,}")    # remove_lines_with_no_2alphabet_word ----  
if (remove_lines_with_no_2alphabet_word) vec_TABLE_OF_CONTENTS.trim = vec_TABLE_OF_CONTENTS.trim |> str_subset("[a-zA-Z]{2,}")    # remove_lines_with_no_2alphabet_word  
    
    vec_TABLE_OF_CONTENTS.trim = vec_TABLE_OF_CONTENTS.trim %>% 
        str_subset("^# TABLE OF CONTENTS", negate = TRUE)
    vec_TABLE_OF_CONTENTS.trim = vec_TABLE_OF_CONTENTS.trim %>% 
        str_subset("^# @@ END", negate = TRUE)
    
    vec_TABLE_OF_CONTENTS.trim = 
        c(
            "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  ",
            "# TABLE OF CONTENTS ----  ", 
            vec_TABLE_OF_CONTENTS.trim,
            "##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  "
        )
    
    invisible(vec_TABLE_OF_CONTENTS.trim)
}


input_path_file %>% readLines(warn = FALSE) %>% {env1$env.internal$f_vec_chr.list_SECTION_nonSECTION(.)$nonSECTION} %>% env1$env.internal$f_vec_chr.vec_TABLE_OF_CONTENTS.trim() %>% str
input_path_file %>% readLines(warn = FALSE) %>% {env1$env.internal$f_vec_chr.list_SECTION_nonSECTION(.)$nonSECTION} %>% env1$env.internal$f_vec_chr.vec_TABLE_OF_CONTENTS.trim() %>% paste0(collapse = "\n") %>% cat("\n")
# > input_path_file %>% readLines(warn = FALSE) %>% {env1$env.internal$f_vec_chr.list_SECTION_nonSECTION(.)$nonSECTION} %>% env1$env.internal$f_vec_chr.vec_TABLE_OF_CONTENTS.trim() %>% str
#  chr [1:8] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS ----  " ...
# > input_path_file %>% readLines(warn = FALSE) %>% {env1$env.internal$f_vec_chr.list_SECTION_nonSECTION(.)$nonSECTION} %>% env1$env.internal$f_vec_chr.vec_TABLE_OF_CONTENTS.trim() %>% paste0(collapse = "\n") %>% cat("\n")
# ##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# # TABLE OF CONTENTS ----  
# # @@ START) dev   
# ## env0 = env1 
# # @@ START) function   
# ## ->> Not Yet included in env1$env.internal.source.r 
# ## ->> Not Yet included in f_df.t.tribble_construct.source.r 
# ##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  

env1$env.internal$f_vec_chr.vec_TABLE_OF_CONTENTS.trim() %>% str
env1$env.internal$f_vec_chr.vec_TABLE_OF_CONTENTS.trim() %>% paste0(collapse = "\n") %>% cat("\n")
# > env1$env.internal$f_vec_chr.vec_TABLE_OF_CONTENTS.trim() %>% str
#  chr [1:36] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS ----  " ...


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) dev-part2 -----  
## env0 = env1 ----





### input_vec_chr.list_SECTION_nonSECTION ====
input_vec_chr.list_SECTION_nonSECTION = env1$env.internal$f_vec_chr.list_SECTION_nonSECTION(input_vec_chr)
input_vec_chr.list_SECTION_nonSECTION %>% str
# > input_vec_chr.list_SECTION_nonSECTION %>% str
# List of 2
#  $ SECTION   : chr [1:8] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS ----  " "# @@ START) dev                                                             ...4" "## env0 = env1                                                              ...5" ...
#  $ nonSECTION: chr [1:29] "" "#_________________________________________________________________________________|----  " "##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  " "# @@ START) dev -----  " ...


## \% 1nd iteration: vec_TABLE_OF_CONTENTS.trim_without_line_numbers ====
## :: input_vec_chr.except_TOC ====
input_vec_chr.except_TOC = input_vec_chr.list_SECTION_nonSECTION$nonSECTION
input_vec_chr.except_TOC %>% str
# > input_vec_chr.except_TOC %>% str
#  chr [1:29] "" "#_________________________________________________________________________________|----  " ...

vec_TABLE_OF_CONTENTS.trim_without_line_numbers = 
    input_vec_chr.except_TOC %>% env1$env.internal$f_vec_chr.vec_TABLE_OF_CONTENTS.trim() 
vec_TABLE_OF_CONTENTS.trim_without_line_numbers %>% str
vec_TABLE_OF_CONTENTS.trim_without_line_numbers %>% paste0(collapse = "\n") %>% cat("\n")
# > vec_TABLE_OF_CONTENTS.trim_without_line_numbers %>% str
#  chr [1:8] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS ----  " ...
# > vec_TABLE_OF_CONTENTS.trim_without_line_numbers %>% paste0(collapse = "\n") %>% cat("\n")
# ##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# # TABLE OF CONTENTS ----  
# # @@ START) dev   
# ## env0 = env1 
# # @@ START) function   
# ## ->> Not Yet included in env1$env.internal.source.r 
# ## ->> Not Yet included in f_df.t.tribble_construct.source.r 
# ##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##   



## \% 2nd iteration: vec_TABLE_OF_CONTENTS.trim_with_line_numbers ====
### input_vec_chr.except_TOC.add_new_TOC_as_blank ====
input_vec_chr.except_TOC.add_new_TOC_as_blank = 
    c(
        rep("", length(vec_TABLE_OF_CONTENTS.trim_without_line_numbers)), 
        input_vec_chr.except_TOC
    )
input_vec_chr.except_TOC.add_new_TOC_as_blank %>% str
input_vec_chr.except_TOC.add_new_TOC_as_blank %>% paste0(collapse = "\n") %>% cat("\n")
# > input_vec_chr.except_TOC.add_new_TOC_as_blank %>% str
#  chr [1:37] "" "" "" "" "" "" "" "" "" ...

# input_vec_chr.except_TOC.add_new_TOC_as_blank.add_line_numbers = 
#     input_vec_chr.except_TOC.add_new_TOC_as_blank |> env1$env.internal$f_vec_chr.add_line_numbers()    # trim before add_line_number~!!
# input_vec_chr.except_TOC.add_new_TOC_as_blank.add_line_numbers %>% str
# input_vec_chr.except_TOC.add_new_TOC_as_blank.add_line_numbers %>% paste0(collapse = "\n") %>% cat("\n")


input_vec_chr.except_TOC.add_new_TOC_as_blank %>% str_which(RegEx4heading) %>% dput
# > input_vec_chr.except_TOC.add_new_TOC_as_blank %>% str_which(RegEx4heading) %>% dput
# c(10L, 12L, 13L, 15L, 17L, 18L, 19L, 36L, 37L)

#_________________________________________________________________________________|----  
#@@ PENDING -----
#_________________________________________________________________________________|----  

# vec_TABLE_OF_CONTENTS.trim_with_line_numbers =
#     input_vec_chr.except_TOC.add_new_TOC_as_blank.add_line_numbers %>% 
#     env1$env.internal$f_vec_chr.vec_TABLE_OF_CONTENTS.trim()
# 
# vec_TABLE_OF_CONTENTS.trim_with_line_numbers %>% str




## \% Final: add vec_TABLE_OF_CONTENTS.trim_with_line_numbers to input_vec_chr.except_TOC ====

input_vec_chr.except_TOC.add_new_TOC.add_line_numbers = 
    c(vec_TABLE_OF_CONTENTS.trim_with_line_numbers, input_vec_chr.except_TOC)
input_vec_chr.except_TOC.add_new_TOC.add_line_numbers %>% str


output_path_file = tempfile(paste0(basename(input_path_file),"-TableOfContents-"), fileext = ".txt")
output_path_file %>% str
# > output_path_file %>% str
#  chr "C:\\Users\\mkim0\\AppData\\Local\\Temp\\RtmpuCsi3f\\f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.dev.r-TableOfContents-11874623757f.txt"

writeLines(output_vec_chr, con = output_path_file)
env1$env.internal.attach$f_file.edit_windows_notepad.or_browseURL(output_path_file)







#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function-part2 -----  
# .sourcename_root = .filename.source.r |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.sourcename_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## ->> Now included in env1$env.internal.source.r ----

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = NULL
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.str_replace_all.old.ObjectName.dev.r
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.dev.r
.tmp$env1_subenv_name = "env.internal"
.tmp$objectname = "f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
        input_path_file = rstudioapi::getSourceEditorContext()$path, 
        level4TOC = 2, RegEx4heading = paste0("^(?!# #)#{1,",level4TOC,"}[^#].*(?:-{4}|={4}) *$"), 
        remove_lines_with_no_2alphabet_word = TRUE, cat2console = (level4TOC == 1), 
        add_line_numbers = TRUE, width.cutoff = 80L-4L, URL4line_numbers = FALSE, prefix4line_numbers = ifelse(!URL4line_numbers, "#L",  paste0("https://github.com/mkim0710/tidystat/blob/master/", env1$f$f_path.relative(rstudioapi::getSourceEditorContext()$path)), merge_with_input_vec_chr.except_TOC = FALSE, 
        output_path_file = NULL, replace_input_path_file = FALSE, browseTXT = !cat2console) {
    
    library(stringr)

    # Read the file content
    input_vec_chr <- readLines(input_path_file, warn = FALSE)
    
    vec_index4TOC = min(input_vec_chr %>% str_which("^##H+ BEGINNING OF TABLE OF CONTENTS H+## *$")):max(input_vec_chr %>% str_which("^##H+ THE END OF TABLE OF CONTENTS H+## *$"))
    
    input_vec_chr.except_TOC = input_vec_chr[!1:length(input_vec_chr) %in% vec_index4TOC] 

    input_vec_chr.except_TOC.na_if_NotMatching.trim <- str_replace_all(
        string = input_vec_chr.except_TOC,
        pattern = RegEx4heading %>% str_replace("^\\^", "") %>% str_replace("\\$$", "") %>% {paste0("^(",.,")?.*$")},
        replacement = "\\1"
    )

    vec_TABLE_OF_CONTENTS.trim = vec_TABLE_OF_CONTENTS %>% str_replace_all("(-{4,}|={4,})( *)$", "\\2")    # Remove the trailing "----" or "====", but keep the trailing spaces. This step should be done before applying env1$env.internal$f_vec_chr.add_line_numbers(). 

    vec_TABLE_OF_CONTENTS.trim = input_vec_chr.except_TOC.na_if_NotMatching.trim[!input_vec_chr.except_TOC.na_if_NotMatching.trim == ""]
    ### |> str_subset("[a-zA-Z]{2,}")    # remove_lines_with_no_2alphabet_word ----  
if (remove_lines_with_no_2alphabet_word) vec_TABLE_OF_CONTENTS.trim = vec_TABLE_OF_CONTENTS.trim |> str_subset("[a-zA-Z]{2,}")    # remove_lines_with_no_2alphabet_word  

    vec_TABLE_OF_CONTENTS.trim = vec_TABLE_OF_CONTENTS.trim %>% 
        str_subset("^# TABLE OF CONTENTS", negate = TRUE)
    vec_TABLE_OF_CONTENTS.trim = vec_TABLE_OF_CONTENTS.trim %>% 
        str_subset("^# @@ END", negate = TRUE)

    vec_TABLE_OF_CONTENTS.trim = 
        c(
            "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  ",
            "# TABLE OF CONTENTS ----  ", 
            vec_TABLE_OF_CONTENTS.trim,
            "##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  "
        )
    
    input_vec_chr.except_TOC.add_new_TOC_as_blank = c(rep("", length(vec_TABLE_OF_CONTENTS.trim)), input_vec_chr.except_TOC.na_if_NotMatching.trim)
    
    if(add_line_numbers) {
        input_vec_chr.except_TOC.add_new_TOC_as_blank = input_vec_chr.except_TOC.add_new_TOC_as_blank |> env1$env.internal$f_vec_chr.add_line_numbers()    # trim before add_line_number~!!
        vec_TABLE_OF_CONTENTS.trim.add_line_numbers = input_vec_chr.except_TOC.add_new_TOC_as_blank[min(input_vec_chr.except_TOC.add_new_TOC_as_blank %>% str_which("^##H+ BEGINNING OF TABLE OF CONTENTS H+## *$")):max(input_vec_chr.except_TOC.add_new_TOC_as_blank %>% str_which("^##H+ THE END OF TABLE OF CONTENTS H+## *$"))]
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
    
    if(!add_line_numbers) vec_TABLE_OF_CONTENTS.trim.add_line_numbers = vec_TABLE_OF_CONTENTS.trim

    if(merge_with_input_vec_chr.except_TOC) output_vec_chr = c(vec_TABLE_OF_CONTENTS.trim.add_line_numbers, input_vec_chr.except_TOC) else output_vec_chr = vec_TABLE_OF_CONTENTS.trim.add_line_numbers
    writeLines(output_vec_chr, con = output_path_file)
    # env1$env.internal.attach$f_file.edit_windows_notepad.or_browseURL(output_path_file)
    
    if(cat2console) vec_TABLE_OF_CONTENTS.trim.add_line_numbers %>% paste0(collapse = "\n") %>% cat("\n")
    
    invisible(vec_TABLE_OF_CONTENTS.trim.add_line_numbers)
}
# ### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
# .tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
# ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ### (ALIAS) f_file.TableOfContents.browseTXT  ----
# env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "f_file.TableOfContents.browseTXT")
# ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ### (ALIAS) CurrentSourceEditorContext.TableOfContents.browseTXT  ----
# env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "CurrentSourceEditorContext.TableOfContents.browseTXT")
# ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ### (ALIAS) TableOfContents_CurrentSourceEditorContext.browseTXT  ----
# env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "TableOfContents_CurrentSourceEditorContext.browseTXT")
# 
# # ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# # ## ::OPTION:: f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.merge_with_input_vec_chr.except_TOC  ----
# # .tmp$env1_subenv_name = "f"
# # .tmp$objectname = "f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.merge_with_input_vec_chr.except_TOC"
# # env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(...) {
# #     env1$env.internal$f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT(replace_input_path_file = TRUE, ...)
# # }
# # ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # ### (ALIAS) CurrentSourceEditorContext.str_subset.lines4heading.add_TABLE_OF_CONTENTS  ----
# # env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "CurrentSourceEditorContext.str_subset.lines4heading.add_TABLE_OF_CONTENTS")


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

env1$env.internal$f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT(cat2console = TRUE)
env1$env.internal$f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT(cat2console = TRUE, add_line_numbers = FALSE)

# env1$env.internal$f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT(replace_input_path_file = TRUE)


### "env1$env.internal.source.r" |> env1$env.internal$f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT() ----
"env1$env.internal.source.r" |> env1$env.internal$f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT(cat2console = TRUE, level4TOC = 1)
"env1$env.internal.source.r" |> env1$env.internal$f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT(cat2console = FALSE, level4TOC = 2)

### "f_df.t.tribble_construct.source.r" |> env1$env.internal$f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT() ----
"f_df.t.tribble_construct.source.r" |> env1$env.internal$f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT(cat2console = TRUE, level4TOC = 1)
"f_df.t.tribble_construct.source.r" |> env1$env.internal$f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT(cat2console = FALSE, level4TOC = 2)


### "Rdev/00_base_program/002_base_encoding_RegEx/FileSample_with_TABLE_OF_CONTENTS.r" |> env1$env.internal$f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT() ----
env1$env.internal$f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.browseTXT("Rdev/00_base_program/002_base_encoding_RegEx/FileSample_with_TABLE_OF_CONTENTS.r")

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


