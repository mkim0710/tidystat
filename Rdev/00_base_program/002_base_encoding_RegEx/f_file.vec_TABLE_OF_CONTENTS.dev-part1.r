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
## :: f_file.vec_TABLE_OF_CONTENTS.old =                           ...180
# @@ START) function                                                  ...233
## ->> Now included in env1$env.internal.source.r                      ...239
## :: f_file.vec_TABLE_OF_CONTENTS =                               ...246
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
## :: f_file.vec_TABLE_OF_CONTENTS.old =    
# @@ START) function   
## ->> Now included in env1$env.internal.source.r 
## :: f_file.vec_TABLE_OF_CONTENTS.edit_windows_notepad.or_browseURL =    
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
# @@ START) data example ----  

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
RegEx4heading = paste0("^#{1,",level4TOC,"}[^#].*(-{4}|={4}) *$")
RegEx4heading
# > RegEx4heading
# [1] "^#{1,2}[^#].*(-{4}|={4}) *$"
add_line_numbers = TRUE
remove_lines_with_no_alphabet = TRUE
output_path_file = NULL
replace_input_path_file = FALSE

## :: input_vec_chr ====
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


### input_vec_chr.list_SECTION_nonSECTION ====
input_vec_chr.list_SECTION_nonSECTION = env1$env.internal$f_vec_chr.list_SECTION_nonSECTION(input_vec_chr)
input_vec_chr.list_SECTION_nonSECTION %>% str
# > input_vec_chr.list_SECTION_nonSECTION %>% str
# List of 2
#  $ SECTION   : chr [1:34] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS ----  " "#@@ Heading 1                                                         ...60" "##@ Heading 1.1                                                       ...63" ...
#  $ nonSECTION: chr [1:290] "" "" "" "# --> Now included in \"env1$env.internal.source.r\"" ...


## \% 1nd iteration: vec_TABLE_OF_CONTENTS_without_line_numbers ====
## :: input_vec_chr.except_TOC ====
input_vec_chr.except_TOC = input_vec_chr.list_SECTION_nonSECTION$nonSECTION
input_vec_chr.except_TOC %>% str
# > input_vec_chr.except_TOC %>% str
#  chr [1:290] "" "" "" "# --> Now included in \"env1$env.internal.source.r\"" ...


# RegEx4heading %>% str_replace("^\\^", "") %>% str_replace("\\$$", "") %>% {paste0("^(",.,")?.*$")}
# # > RegEx4heading %>% str_replace("^\\^", "") %>% str_replace("\\$$", "") %>% {paste0("^(",.,")?.*$")}
# # [1] "^(#{1,2}[^#].*(-{4}|={4}) *)?.*"
#
#
# ### input_vec_chr.except_TOC.na_if_NotMatching.trim ====
# input_vec_chr.except_TOC.na_if_NotMatching.trim <- str_replace_all(
#     string = input_vec_chr.except_TOC,
#     pattern = RegEx4heading %>% str_replace("^\\^", "") %>% str_replace("\\$$", "") %>% {paste0("^(",.,")?.*$")},
#     replacement = "\\1"
# )
# input_vec_chr.except_TOC.na_if_NotMatching.trim %>% str
# # > input_vec_chr.except_TOC.na_if_NotMatching.trim %>% str
# #  chr [1:290] "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ...


input_vec_chr.except_TOC %>% str_detect(RegEx4heading) %>% str
input_vec_chr.except_TOC %>% str_detect(RegEx4heading) %>% summary
input_vec_chr.except_TOC %>% str_detect(RegEx4heading) %>% `!`() %>% str
input_vec_chr.except_TOC %>% str_detect(RegEx4heading) %>% `!`() %>% summary
# > input_vec_chr.except_TOC %>% str_detect(RegEx4heading) %>% str
#  logi [1:433] FALSE FALSE FALSE FALSE FALSE FALSE ...
# > input_vec_chr.except_TOC %>% str_detect(RegEx4heading) %>% summary
#    Mode   FALSE    TRUE 
# logical     397      36 
# > input_vec_chr.except_TOC %>% str_detect(RegEx4heading) %>% `!`() %>% str
#  logi [1:433] TRUE TRUE TRUE TRUE TRUE TRUE ...
# > input_vec_chr.except_TOC %>% str_detect(RegEx4heading) %>% `!`() %>% summary
#    Mode   FALSE    TRUE 
# logical      36     397 


### |> env1$f$f_vec_chr.na_if_NotMatching(RegEx4heading) ----
input_vec_chr.except_TOC %>% env1$f$f_vec_chr.na_if_NotMatching(RegEx4heading) %>% str
input_vec_chr.except_TOC %>% env1$f$f_vec_chr.na_if_NotMatching(RegEx4heading) %>% na.omit %>% str
input_vec_chr.except_TOC %>% env1$f$f_vec_chr.na_if_NotMatching(RegEx4heading) %>% na.omit %>% paste0(collapse = "\n") %>% cat("\n")
# > input_vec_chr.except_TOC %>% env1$f$f_vec_chr.na_if_NotMatching(RegEx4heading) %>% str
#  chr [1:453] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA ...

# input_vec_chr.except_TOC.na_if_NotMatching = input_vec_chr.except_TOC %>% env1$f$f_vec_chr.na_if_NotMatching(RegEx4heading)

## :: vec_TABLE_OF_CONTENTS ====
# vec_TABLE_OF_CONTENTS = input_vec_chr.except_TOC.na_if_NotMatching.trim %>% na_if("") %>% na.omit()
vec_TABLE_OF_CONTENTS = input_vec_chr.except_TOC %>% env1$f$f_vec_chr.na_if_NotMatching(RegEx4heading) %>% na.omit()
vec_TABLE_OF_CONTENTS %>% str
vec_TABLE_OF_CONTENTS %>% paste0(collapse = "\n") %>% cat("\n")
# > vec_TABLE_OF_CONTENTS %>% str
#  chr [1:31] "#_________________________________________________________________________________|----  " "# @@ REFERENCES) ----  " ...
#  - attr(*, "na.action")= 'omit' int [1:259] 1 2 3 4 5 6 7 8 9 10 ...

vec_TABLE_OF_CONTENTS = vec_TABLE_OF_CONTENTS %>% str_replace_all("(-{4,}|={4,})( *)$", "\\2")    # Remove the trailing "----" or "====", but keep the trailing spaces. This step should be done before applying env1$env.internal$f_vec_chr.add_line_numbers(). 
vec_TABLE_OF_CONTENTS %>% str
vec_TABLE_OF_CONTENTS %>% paste0(collapse = "\n") %>% cat("\n")
# > vec_TABLE_OF_CONTENTS = vec_TABLE_OF_CONTENTS %>% str_replace_all("(-{4,}|={4,})( *)$", "\\2")    # Remove the trailing "----" or "====", but keep the trailing spaces. This step should be done before applying env1$env.internal$f_vec_chr.add_line_numbers(). 
# > vec_TABLE_OF_CONTENTS %>% str
#  chr [1:31] "#_________________________________________________________________________________|  " "# @@ REFERENCES)   " ...

### |> str_subset("[a-zA-Z]")    # remove_lines_with_no_alphabet ----  
if (remove_lines_with_no_alphabet) vec_TABLE_OF_CONTENTS = vec_TABLE_OF_CONTENTS |> str_subset("[a-zA-Z]")    # remove_lines_with_no_alphabet  
vec_TABLE_OF_CONTENTS %>% str
vec_TABLE_OF_CONTENTS %>% paste0(collapse = "\n") %>% cat("\n")
# > vec_TABLE_OF_CONTENTS %>% str
#  chr [1:22] "# @@ REFERENCES)   " "# @@ START) data example   " "#@@ Heading 1 " "##@ Heading 1.1 " "# @@ Heading 2 " ...

vec_TABLE_OF_CONTENTS = vec_TABLE_OF_CONTENTS %>% 
    str_subset("^# TABLE OF CONTENTS", negate = TRUE)
vec_TABLE_OF_CONTENTS = vec_TABLE_OF_CONTENTS %>% 
    str_subset("^# @@ END", negate = TRUE)
vec_TABLE_OF_CONTENTS %>% str
# > vec_TABLE_OF_CONTENTS %>% str
#  chr [1:21] "# @@ REFERENCES)   " "# @@ START) data example   " "#@@ Heading 1 " "##@ Heading 1.1 " "# @@ Heading 2 " ...

vec_TABLE_OF_CONTENTS = 
    c(
        "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  ",
        "# TABLE OF CONTENTS ----  ", 
        vec_TABLE_OF_CONTENTS,
        "##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  "
    )
vec_TABLE_OF_CONTENTS %>% str
vec_TABLE_OF_CONTENTS %>% paste0(collapse = "\n") %>% cat("\n")
# > vec_TABLE_OF_CONTENTS %>% str
#  chr [1:24] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS ----  " ...
# > vec_TABLE_OF_CONTENTS %>% paste0(collapse = "\n") %>% cat("\n")
# ##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# # TABLE OF CONTENTS ----  
# # @@ REFERENCES)   
# # @@ START) data example   
# #@@ Heading 1 
# ##@ Heading 1.1 
# # @@ Heading 2 
# ## @ Heading 2.1 
# #  chr [1:348] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS   
# # https://chatgpt.com/g/g-p-6765276504708191bde554c8d2095b8b-r-project/c/67658d76-9448-800e-bb66-6257dd27e7b5 
# # https://chatgpt.com/g/g-p-6765276504708191bde554c8d2095b8b-r-project/c/67658de1-d780-800e-ab6e-ca18fc2fa627 
# # @@ START) dev   
# ## env0 = env1 
# #  $ SECTION   : chr [1:13] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS ----  " "#| ------------------------- < To be covered at .Rprofile >                 ...128" "#|  
# #  chr [1:23] "#|________________________________________________________________________________|#  ----  " "#@@ Heading 1 
# #  chr [1:17] "#@@ Heading 1 ----" "##@ Heading 1.1 ----" "# @@ Heading 2 ====" "## @ Heading 2.1 
# #  chr [1:14] "#@@ Heading 1 ----" "##@ Heading 1.1 ----" "# @@ Heading 2 ====" "## @ Heading 2.1 
# #  chr [1:17] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS   
# #  chr [1:405] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS   
# # @@ START) function   
# ## ->> Now included in env1$env.internal.source.r 
# ## :: f_file.vec_TABLE_OF_CONTENTS.edit_windows_notepad.or_browseURL =    
# # @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B   
# ##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  



## \% 2nd iteration: vec_TABLE_OF_CONTENTS_with_line_numbers ====
### input_vec_chr.except_TOC.add_new_TOC_as_blank ====
input_vec_chr.except_TOC.add_new_TOC_as_blank = c(rep("", length(vec_TABLE_OF_CONTENTS)), input_vec_chr.except_TOC)
input_vec_chr.except_TOC.add_new_TOC_as_blank %>% str
# > input_vec_chr.except_TOC.add_new_TOC_as_blank %>% str
#  chr [1:314] "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ...

input_vec_chr.except_TOC.add_new_TOC_as_blank.add_line_numbers = input_vec_chr.except_TOC.add_new_TOC_as_blank |> env1$env.internal$f_vec_chr.add_line_numbers()    # trim before add_line_number~!!
input_vec_chr.except_TOC.add_new_TOC_as_blank.add_line_numbers %>% str
# > input_vec_chr.except_TOC.add_new_TOC_as_blank.add_line_numbers %>% str
#  chr [1:314] "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ...



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
## :: f_vec_chr.vec_TABLE_OF_CONTENTS =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.str_replace_all.old.ObjectName.dev.r
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.vec_TABLE_OF_CONTENTS.dev.r
.tmp$env1_subenv_name = "env.internal"
.tmp$objectname = "f_vec_chr.vec_TABLE_OF_CONTENTS"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
        input_vec_chr.except_TOC = env1$env.internal$f_vec_chr.list_SECTION_nonSECTION(readLines(rstudioapi::getSourceEditorContext()$path, warn = FALSE))$nonSECTION, 
        RegEx4heading = "^#{1,2}[^#].*(-{4}|={4}) *$", 
        remove_lines_with_no_alphabet = TRUE, cat2console = FALSE) {
    
    library(stringr)
    
    vec_TABLE_OF_CONTENTS = input_vec_chr.except_TOC %>% env1$f$f_vec_chr.na_if_NotMatching(RegEx4heading) %>% na.omit()
    vec_TABLE_OF_CONTENTS = vec_TABLE_OF_CONTENTS %>% str_replace_all("(-{4,}|={4,})( *)$", "\\2")    # Remove the trailing "----" or "====", but keep the trailing spaces. This step should be done before applying env1$env.internal$f_vec_chr.add_line_numbers(). 
    
    ### |> str_subset("[a-zA-Z]")    # remove_lines_with_no_alphabet ----  
if (remove_lines_with_no_alphabet) vec_TABLE_OF_CONTENTS = vec_TABLE_OF_CONTENTS |> str_subset("[a-zA-Z]")    # remove_lines_with_no_alphabet  
    
    vec_TABLE_OF_CONTENTS = vec_TABLE_OF_CONTENTS %>% 
        str_subset("^# TABLE OF CONTENTS", negate = TRUE)
    vec_TABLE_OF_CONTENTS = vec_TABLE_OF_CONTENTS %>% 
        str_subset("^# @@ END", negate = TRUE)
    
    vec_TABLE_OF_CONTENTS = 
        c(
            "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  ",
            "# TABLE OF CONTENTS ----  ", 
            vec_TABLE_OF_CONTENTS,
            "##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  "
        )
    
    invisible(vec_TABLE_OF_CONTENTS)
}


input_path_file %>% readLines(warn = FALSE) %>% {env1$env.internal$f_vec_chr.list_SECTION_nonSECTION(.)$nonSECTION} %>% env1$env.internal$f_vec_chr.vec_TABLE_OF_CONTENTS() %>% str
input_path_file %>% readLines(warn = FALSE) %>% {env1$env.internal$f_vec_chr.list_SECTION_nonSECTION(.)$nonSECTION} %>% env1$env.internal$f_vec_chr.vec_TABLE_OF_CONTENTS() %>% paste0(collapse = "\n") %>% cat("\n")
# > input_path_file %>% readLines(warn = FALSE) %>% {env1$env.internal$f_vec_chr.list_SECTION_nonSECTION(.)$nonSECTION} %>% env1$env.internal$f_vec_chr.vec_TABLE_OF_CONTENTS() %>% str
#  chr [1:8] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS ----  " ...
# > input_path_file %>% readLines(warn = FALSE) %>% {env1$env.internal$f_vec_chr.list_SECTION_nonSECTION(.)$nonSECTION} %>% env1$env.internal$f_vec_chr.vec_TABLE_OF_CONTENTS() %>% paste0(collapse = "\n") %>% cat("\n")
# ##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# # TABLE OF CONTENTS ----  
# # @@ START) dev   
# ## env0 = env1 
# # @@ START) function   
# ## ->> Not Yet included in env1$env.internal.source.r 
# ## ->> Not Yet included in f_df.t.tribble_construct.source.r 
# ##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  

env1$env.internal$f_vec_chr.vec_TABLE_OF_CONTENTS() %>% str
env1$env.internal$f_vec_chr.vec_TABLE_OF_CONTENTS() %>% paste0(collapse = "\n") %>% cat("\n")
# > env1$env.internal$f_vec_chr.vec_TABLE_OF_CONTENTS() %>% str
#  chr [1:36] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS ----  " ...

