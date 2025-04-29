##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS ----  
#@@ Heading 1                                                         ...60
##@ Heading 1.1                                                       ...63
# ⸿ Heading 2                                                        ...65
## @ Heading 2.1                                                      ...67
# ⸿ START) dev.old                                                   ...73
## env0 = env1                                                        ...74
# ⸿ START) dev                                                       ...117
## env0 = env1                                                        ...118
# ⸿ START) function.old                                              ...167
## ->> Now included in env1$env.internal.source.r                      ...173
## :: f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.old =                           ...180
# ⸿ START) function                                                  ...233
## ->> Now included in env1$env.internal.source.r                      ...239
## :: f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers =                               ...246
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##
##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS ----  
#@@ Heading 1 
##@ Heading 1.1 
# ⸿ Heading 2 
## @ Heading 2.1 
# ⸿ START) dev.old   
## env0 = env1 
# ⸿ START) dev   
## env0 = env1 
# ⸿ START) function.old   
## ->> Now included in env1$env.internal.source.r 
## :: f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.old =    
# ⸿ START) function   
## ->> Now included in env1$env.internal.source.r 
## :: f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.old =    
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##   


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://chatgpt.com/g/g-p-676526fc1c848191a84f233bacf2df34-RegEx/c/67651b58-d21c-800e-9f60-b8d16e9a13a7
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
# ⸿ REFERENCES) ----  
## ^(?!NegativeLookahead)MainPatternToMatch ----  
## https://chatgpt.com/g/g-p-676526fc1c848191a84f233bacf2df34-RegEx/c/67651b58-d21c-800e-9f60-b8d16e9a13a7
## e.g.) remove all non-heading lines, when heading lines starts with "# @" 
## ^(?!# @).*
## DOES match all lines that DOES NOT start with "# @", because when looking at the point of "(", which is at the beginning of a line (^), there should be no "# @" ahead (after) "(".
## Alternative:
## Search: ^(# @.*)?.*
## Replace to: $1
## 
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ DATA) example ----  

#|________________________________________________________________________________|#  ----  
#@@ Heading 1 ----


##@ Heading 1.1 ----

# ⸿ Heading 2 ====

## @ Heading 2.1 ----

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: input_path_file = "Rdev/00_base_program/002_base_encoding_RegEx/FileSample_with_TABLE_OF_CONTENTS.r" |> env1$f$f_path_relative.path_normalized_based_on_path1()  # input_path_file = paste0(env1$path$path1,ifelse(env1$path$path1=="","","/"),input_path_file)|> env1$path$f_path_relative.path_normalized_based_on_path1()  # input_path_file = paste0(env1$path$path1,ifelse(env1$path$path1=="","","/"),input_path_file) ----  
# "Rdev/00_base_program/002_base_encoding_RegEx/FileSample_with_TABLE_OF_CONTENTS.r" |> env1$env.internal.attach$f_file.edit_windows_notepad.or_browseURL()

# input_path_file = rstudioapi::getSourceEditorContext()$path
input_path_file = "Rdev/00_base_program/002_base_encoding_RegEx/FileSample_with_TABLE_OF_CONTENTS.r" |> env1$f$f_path_relative.path_normalized_based_on_path1()  # input_path_file = paste0(env1$path$path1,ifelse(env1$path$path1=="","","/"),input_path_file)|> env1$path$f_path_relative.path_normalized_based_on_path1()  # input_path_file = paste0(env1$path$path1,ifelse(env1$path$path1=="","","/"),input_path_file)
level4TOC = 2
RegEx4heading = paste0("^(?!# #)#{1,",level4TOC,"}[^#].*(?:-{4}|={4}) *$")
RegEx4heading
# > RegEx4heading
# [1] "^(?!# #)#{1,2}[^#].*(?:-{4}|={4}) *$"

## :: input_vec_chr ====  
input_vec_chr <- readLines(input_path_file, warn = FALSE)  
input_vec_chr |> str()  
input_vec_chr |> paste(collapse = "\n") |> cat("\n")  
# > input_vec_chr |> str()  
#  chr [1:37] "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  " "# TABLE OF CONTENTS ----  " ...


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ START) dev-MH -----  
## env0 = env1 ----

## :: input_vec_chr.except_TOC ====
input_vec_chr.except_TOC <- input_vec_chr  # input_vec_chr.except_TOC is actually implemented in "f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.dev-part1.r". Here, just changing the variable name to input_vec_chr.except_TOC so that the code can be interchangeable with "f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.dev-part1.r".


# RegEx4heading %>% str_replace("^\\^", "") %>% str_replace("\\$$", "") %>% {paste0("^(",.,")?.*$")}
# # > RegEx4heading %>% str_replace("^\\^", "") %>% str_replace("\\$$", "") %>% {paste0("^(",.,")?.*$")}
# # [1] "^(#{1,2}[^#].*(?:-{4}|={4}) *)?.*"
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
#  logi [1:37] FALSE TRUE FALSE FALSE FALSE FALSE ...
# > input_vec_chr.except_TOC %>% str_detect(RegEx4heading) %>% summary
#    Mode   FALSE    TRUE 
# logical      27      10 
# > input_vec_chr.except_TOC %>% str_detect(RegEx4heading) %>% `!`() %>% str
#  logi [1:37] TRUE FALSE TRUE TRUE TRUE TRUE ...
# > input_vec_chr.except_TOC %>% str_detect(RegEx4heading) %>% `!`() %>% summary
#    Mode   FALSE    TRUE 
# logical      10      27 


### |> str_extract_all(RegEx4heading) ----
input_vec_chr.except_TOC %>% str_extract(RegEx4heading) %>% str
input_vec_chr.except_TOC %>% str_extract(RegEx4heading) %>% na.omit() %>% paste(collapse = "\n") %>% cat()









#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ START) dev-GPT -----  
# https://chatgpt.com/c/6767d118-9118-800e-ad40-890f04e7c0a1 ----
## env0 = env1 ----

## test_lines ====
test_lines <- c(
  "# Section Title ----",          # Valid level 1 heading
  "## Subsection Title ====",      # Valid level 2 heading
  "# # Section Title ----",        # Commented-out level 1 heading (should NOT match)
  "# ## Subsection Title ====",    # Commented-out level 2 heading (should NOT match)
  "Random text ----",              # Not a valid heading (should NOT match)
  "# Another Title ===="           # Valid level 1 heading
)


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### if (grepl("^#", line) && !grepl("^# #", line)) ----- 
# Filter out invalid matches
results <- sapply(test_lines, function(line) {
    if (grepl("^#", line) && !grepl("^# #", line)) { # Ensure it's not a commented-out line
        grepl("^#{1,2}[^#].*(?:-{4}|={4}) *$", line)
    } else {
        FALSE
    }
})

# Combine results and print
output <- data.frame(
    Line = test_lines,
    Matches = results
)
print(output)
# > print(output)
#                                                  Line Matches
# # Section Title ----             # Section Title ----    TRUE
# ## Subsection Title ====     ## Subsection Title ====    TRUE
# # # Section Title ----         # # Section Title ----   FALSE
# # ## Subsection Title ==== # ## Subsection Title ====   FALSE
# Random text ----                     Random text ----   FALSE
# # Another Title ====             # Another Title ====    TRUE



##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
test_lines <- c(
  "# Section Title ----",      
  "## Subsection Title ====",  
  "# # Section Title ----",
  "# ## Subsection Title ====",
  "Random text ----",
  "# Another Title ===="
)

RegEx <-           "^#{1,2}[^#].*(?:-{4}|={4}) *$"
RegEx <- "^(?!#\\s+#)#{1,2}[^#].*(?:-{4}|={4})\\s*$"
RegEx <- "^(?!#\\s+#)#{1,2}\\s+.*(?:-{4}|={4})\\s*$"
RegEx <-   "^(?!# +#)#{1,2} +.*(?:-{4}|={4}) *$"
RegEx <-    "^(?!# #)#{1,2}[^#].*(?:-{4}|={4})\\s*$"
RegEx <-    "^(?!# #)#{1,2}[^#].*(?:-{4}|={4}) *$"

results <- sapply(test_lines, function(line) {
  grepl(RegEx, line, perl = TRUE)
})

data.frame(Line = test_lines, Matches = results)
# > data.frame(Line = test_lines, Matches = results)
#                                                  Line Matches
# # Section Title ----             # Section Title ----    TRUE
# ## Subsection Title ====     ## Subsection Title ====   FALSE
# # # Section Title ----         # # Section Title ----   FALSE
# # ## Subsection Title ==== # ## Subsection Title ====   FALSE
# Random text ----                     Random text ----   FALSE
# # Another Title ====             # Another Title ====    TRUE

















#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ START) function -----  
# .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.SourceName_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## ->> Now included in env1$env.internal.source.r ----

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_chr_RegEx4heading"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = NULL
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_chr_RegEx4heading =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.str_replace_all.old.ObjectName.dev.r
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.old2.r
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.vec_TABLE_OF_CONTENTS.trim.add_line_numbers.dev.r
.tmp$objectname = "f_chr_RegEx4heading"
.tmp$object = function(
        ) {
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ EXAMPLES) function use -----  

input_path_file %>% env1$f$f_chr_RegEx4heading()


env1$f$f_chr_RegEx4heading()


### "env1$env.internal.source.r" |> env1$f$f_chr_RegEx4heading() ----
"env1$env.internal.source.r" |> env1$f$f_chr_RegEx4heading()

### "f_df.t.tribble_construct.source.r" |> env1$f$f_chr_RegEx4heading() ----
"f_df.t.tribble_construct.source.r" |> env1$f$f_chr_RegEx4heading()


### "Rdev/00_base_program/002_base_encoding_RegEx/FileSample_with_TABLE_OF_CONTENTS.r" |> env1$f$f_chr_RegEx4heading() ----
env1$f$f_chr_RegEx4heading("Rdev/00_base_program/002_base_encoding_RegEx/FileSample_with_TABLE_OF_CONTENTS.r")





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
env1$f$showCodeText2openSourceInGitHub()
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


