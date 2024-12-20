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
## :: f_file.str_subset.lines4heading =    
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
input_path_file = rstudioapi::getSourceEditorContext()$path
RegEx4heading = "^#{1,2}[^#].*(-{4}|={4}) *$"
add_line_numbers = TRUE
remove_lines_with_no_alphabet = TRUE
output_path_file = NULL
replace_input_path_file = FALSE

input_path_file.readLines <- readLines(input_path_file, warn = FALSE)
input_path_file.readLines %>% str

vec_lines4heading <- str_subset(
    string = input_path_file.readLines,
    pattern = RegEx4heading,
    negate = FALSE
)
vec_lines4heading %>% str

vec_lines4heading = vec_lines4heading %>% str_replace_all("(-{4,}|={4,})( *)$", "\\2")
vec_lines4heading %>% str

if (remove_lines_with_no_alphabet) vec_lines4heading = vec_lines4heading %>% str_subset("[a-zA-Z]")
vec_lines4heading %>% str

vec_lines4heading = vec_lines4heading %>% 
    str_subset("# TABLE OF CONTENTS", negate = TRUE)
vec_lines4heading = vec_lines4heading %>% 
    str_subset("@@ END", negate = TRUE)
vec_lines4heading %>% str

vec_lines4heading = 
    c(
        "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  ",
        "# TABLE OF CONTENTS ----  ", 
        vec_lines4heading,
        "##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  "
    )
vec_lines4heading %>% str
vec_lines4heading %>% paste0(collapse = "\n") %>% cat("\n")


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

input_path_file.readLines <- readLines(input_path_file, warn = FALSE)
input_path_file.readLines %>% str

vec_lines4heading <- str_replace_all(
    string = input_path_file.readLines,
    pattern = RegEx4heading %>% str_replace("^\\^", "") %>% str_replace("\\$$", "") %>% {paste0("^(",.,")?.*")},
    replacement = "\\1"
)
vec_lines4heading %>% str

vec_lines4heading = vec_lines4heading %>% str_replace_all("(-{4,}|={4,})( *)$", "\\2")
vec_lines4heading %>% str

vec_lines4heading = ifelse(vec_lines4heading == "", "", paste0(vec_lines4heading, strrep(" ",pmax(4, 70-nchar(vec_lines4heading))), "...", 1:length(vec_lines4heading)))
vec_lines4heading %>% str

vec_lines4heading = vec_lines4heading[!vec_lines4heading == ""]
if (remove_lines_with_no_alphabet) vec_lines4heading = vec_lines4heading %>% str_subset("[a-zA-Z]")
vec_lines4heading %>% str

vec_lines4heading = vec_lines4heading %>% 
    str_subset("# TABLE OF CONTENTS", negate = TRUE)
vec_lines4heading = vec_lines4heading %>% 
    str_subset("@@ END", negate = TRUE)
vec_lines4heading %>% str

vec_lines4heading = 
    c(
        "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  ",
        "# TABLE OF CONTENTS ----  ", 
        vec_lines4heading,
        "##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  "
    )
vec_lines4heading %>% str
vec_lines4heading %>% paste0(collapse = "\n") %>% cat("\n")




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
    input_path_file.readLines <- readLines(input_path_file, warn = FALSE)
    
    vec_lines4heading <- str_subset(
        string = input_path_file.readLines,
        pattern = RegEx4heading,
        negate = FALSE
    )
    
    vec_lines4heading = vec_lines4heading %>% str_replace_all("(-{4,}|={4,})( *)$", "\\2")
    
    if (remove_lines_with_no_alphabet) vec_lines4heading = vec_lines4heading %>% str_subset("[a-zA-Z]")
    
    vec_lines4heading = vec_lines4heading %>% 
        str_subset("# TABLE OF CONTENTS", negate = TRUE)
    vec_lines4heading = vec_lines4heading %>% 
        str_subset("@@ END", negate = TRUE)

    vec_lines4heading = 
        c(
            "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  ",
            "# TABLE OF CONTENTS ----  ", 
            vec_lines4heading,
            "##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  "
        )
    
    if(replace_input_path_file) {
        if (!is.null(output_path_file)) {warning("replace_input_path_file == TRUE -> output_path_file will be ignored.")}
        output_path_file <- input_path_file # Overwrite the original file
    } 
    
    if (!is.null(output_path_file)) {
        writeLines(c(vec_lines4heading, input_path_file.readLines), con = output_path_file)
        message(paste0("Added TABLE OF CONTENTS in the beginning of : \n", deparse(input_path_file), "\n and saved to : \n", deparse(output_path_file), "\n"))
    }
    
    vec_lines4heading %>% paste0(collapse = "\n") %>% cat("\n")
    
    invisible(vec_lines4heading)
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
.tmp$objectname = "f_file.str_subset.lines4heading"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = NULL
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_file.str_subset.lines4heading =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_file.str_replace_all.old.ObjectName.dev.r
.tmp$objectname = "f_file.str_subset.lines4heading"
.tmp$object = function(input_path_file = rstudioapi::getSourceEditorContext()$path, RegEx4heading = "^#{1,2}[^#].*(-{4}|={4}) *$", add_line_numbers = TRUE, remove_lines_with_no_alphabet = TRUE, output_path_file = NULL, replace_input_path_file = FALSE) {
    
    library(stringr)

    # Read the file content
    input_path_file.readLines <- readLines(input_path_file, warn = FALSE)

    vec_lines4heading <- str_replace_all(
        string = input_path_file.readLines,
        pattern = RegEx4heading %>% str_replace("^\\^", "") %>% str_replace("\\$$", "") %>% {paste0("^(",.,")?.*")},
        replacement = "\\1"
    )

    vec_lines4heading = vec_lines4heading %>% str_replace_all("(-{4,}|={4,})( *)$", "\\2")

    if(add_line_numbers) vec_lines4heading = ifelse(vec_lines4heading == "", "", paste0(vec_lines4heading, strrep(" ",pmax(4, 70-nchar(vec_lines4heading))), "...", 1:length(vec_lines4heading)))

    vec_lines4heading = vec_lines4heading[!vec_lines4heading == ""]
    if (remove_lines_with_no_alphabet) vec_lines4heading = vec_lines4heading %>% str_subset("[a-zA-Z]")

    vec_lines4heading = vec_lines4heading %>% 
        str_subset("# TABLE OF CONTENTS", negate = TRUE)
    vec_lines4heading = vec_lines4heading %>% 
        str_subset("@@ END", negate = TRUE)

    vec_lines4heading = 
        c(
            "##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  ",
            "# TABLE OF CONTENTS ----  ", 
            vec_lines4heading,
            "##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  "
        )
    
    if(replace_input_path_file) {
        if (!is.null(output_path_file)) {warning("replace_input_path_file == TRUE -> output_path_file will be ignored.")}
        output_path_file <- input_path_file # Overwrite the original file
    } 
    
    if (!is.null(output_path_file)) {
        writeLines(c(vec_lines4heading, input_path_file.readLines), con = output_path_file)
        message(paste0("Added TABLE OF CONTENTS in the beginning of : \n", deparse(input_path_file), "\n and saved to : \n", deparse(output_path_file), "\n"))
    }
    
    vec_lines4heading %>% paste0(collapse = "\n") %>% cat("\n")
    
    invisible(vec_lines4heading)
}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

env1$f$f_file.str_subset.lines4heading()
env1$f$f_file.str_subset.lines4heading(add_line_numbers = FALSE)

# env1$f$f_file.str_subset.lines4heading(replace_input_path_file = TRUE)


### env1$f$f_file.str_subset.lines4heading("env1$env.internal.source.r", RegEx4heading = "^#{1,1}[^#].*(-{4}|={4}) *$") ----
env1$f$f_file.str_subset.lines4heading("env1$env.internal.source.r", RegEx4heading = "^#{1,1}[^#].*(-{4}|={4}) *$")
env1$f$f_file.str_subset.lines4heading("env1$env.internal.source.r", RegEx4heading = "^#{1,2}[^#].*(-{4}|={4}) *$")
# > env1$f$f_file.str_subset.lines4heading("env1$env.internal.source.r", RegEx4heading = "^#{1,1}[^#].*(-{4}|={4}) *$")
##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS ----  
#| ------------------------- < To be covered at .Rprofile >           ...130
#| ------------------------- < If .Rprofile not available >           ...133
# @@ system, environment                                              ...191
# @@ f_function, f_expression, f_CodeText                             ...347
# @@ f_file, f_URL, f_path                                            ...794
# @@ source()                                                         ...2299
# ## @ .filename.source.r = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r")       ...2385
# \% source( file.path(env1$path$source_base,subpath_filename.source.r) )       ...2422
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##   
# > env1$f$f_file.str_subset.lines4heading("env1$env.internal.source.r", RegEx4heading = "^#{1,2}[^#].*(-{4}|={4}) *$")
##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS ----  
#| ------------------------- < To be covered at .Rprofile >           ...130
#| ------------------------- < If .Rprofile not available >           ...133
## .GlobalEnv$.tmp = list()                                           ...150
## .GlobalEnv$env1 = new.env()                                        ...152
# @@ system, environment                                              ...191
## :: get_system_info                                                 ...194
## :: get_software_versions                                           ...227
## :: warnings.summary                                                ...238
## :: warnings.last                                                   ...239
## :: warnings.last10                                                 ...240
## :: message_if_VERBOSE                                              ...245
## :: cat_if_VERBOSE                                                  ...250
## :: f_env1_subenv_objectname.set_alias                              ...255
## :: f_environment.list_objectnames.map_get.str                      ...266
## ::OPTION:: f_environment.list_objectnames_incl_hidden.map_get.str        ...289
## :: f_environment.detach_and_reattach                               ...299
## :: reattach.env1_f_env.internal.attach                             ...313
## :: f_environment.attached_search_path.dput                         ...321
## :: Sys.time.set_t0                                                 ...332
## :: Sys.time.set_t1                                                 ...337
# @@ f_function, f_expression, f_CodeText                             ...347
## :: f_function.load2env.internal                                    ...349
## :: f_text_function_arguments.identity_mapping                      ...375
## :: f_condition1.if_null_condition2                                 ...403
## :: f_expression.eval.withCallingHandlers.attr_warnings.summary     ...415
## :: f_expression.system.time.round.dput                             ...475
## :: f_object.get_objectname -PENDING                                ...503
## :: f_ObjectName.dput.ECHO                                          ...537
## :: f_ObjectName.get.dput.ECHO                                      ...562
## :: f_CodeText.ECHO                                                 ...598
## ::OPTION:: f_CodeText.parse.eval.dput.ECHO                         ...719
## :: f_CodeTexts.parse.eval.identical                                ...735
## :: f_TerminalFromRCodeText.ECHO                                    ...763
## :: f_object.substitute.deparse2objectname                          ...784
# @@ f_file, f_URL, f_path                                            ...794
## :: getSourceEditorContext.path_filename_ext                        ...797
## :: f_path_file.paste0_collapse_if_not_empty                        ...814
## :: f_path.relative                                                 ...834
## :: getSourceEditorContext.update_LastSourceEditorContext.path_filename_ext =        ...848
## :: f_path.file.info                                                ...911
## :: f_list_df.write_xlsx_table                                      ...960
## :: f_path.file.info.xlsx                                           ...1010
## ::OPTION:: f_path.documents.file.info.xlsx                         ...1068
## :: f_path.DOCs_Rcode.file.info.xlsx                                ...1081
## :: f_path.size_files =                                             ...1145
## :: f_path0.list_path_hierarchy =                                   ...1197
## :: f_vec_path.vec_filename_sans_ext_extended =                     ...1236
## :: f_vec_path.vec_ext_extended =                                   ...1259
## :: f_path.df_filename_ext_extended =                               ...1278
## :: f_path_fileRegEX.rename =                                       ...1317
## :: f_path.list.files_orphan_nb_html.remove                         ...1388
## :: f_filename_ext.append_suffix =                                  ...1450
## :: f_file.str_subset.lines4heading =                               ...1484
## ::OPTION:: f_file.str_subset.lines4heading.add_TABLE_OF_CONTENTS        ...1540
## :: f_file.str_replace_all.old.ObjectName =                         ...1551
## ::OPTION:: f_CurrentSourceEditorContext.str_replace_all.old.ObjectName        ...1595
## @ f_file.edit, f_file.open, f_URL.open                             ...1617
## :: f_file.system_switch_open                                       ...1756
## @ f_file.backup, f_path.backup                                     ...1787
## :: f_filename_ext.createBackup                                     ...1789
## :: f_path_path.backup.overwrite                                    ...1828
## @ f_git                                                            ...1843
## :: f_path.is_git_tracked                                           ...1846
## :: f_file.git_lfs_track_add_f                                      ...1897
## :: function_name = f_gitattributes.split()                         ...1939
## @ f_file.save                                                      ...1976
## :: f_objectname.size.write_rds.git_lfs_track_add_f                 ...1979
## :: f_object.get_objectname.size.write_rds.git_lfs_track_add_f  - PENDING       ...2114
## @ f_file.update                                                    ...2138
## :: env.internal\$f_file2.compare                                   ...2141
## :: env.internal\$f_url_destfile.DownloadIfDifferent                ...2178
# @@ source()                                                         ...2299
## :: f_sourcePath.execute_if_not_sourced =                           ...2302
## ::OPTION:: f_sourcePath.execute.force_reload                       ...2361
# ## @ .filename.source.r = "internal.f_path0.list_path_hierarchy" |> paste0(".source.r")       ...2385
## @ .filename.source.r = "f_expression.substitute_echo_and_dput" |> paste0(".source.r")       ...2403
# \% source( file.path(env1$path$source_base,subpath_filename.source.r) )       ...2422
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##   


### env1$f$f_file.str_subset.lines4heading("f_df.t.tribble_construct.source.r", RegEx4heading = "^#{1,1}[^#].*(-{4}|={4}) *$") ----
env1$f$f_file.str_subset.lines4heading("f_df.t.tribble_construct.source.r", RegEx4heading = "^#{1,1}[^#].*(-{4}|={4}) *$")
env1$f$f_file.str_subset.lines4heading("f_df.t.tribble_construct.source.r", RegEx4heading = "^#{1,2}[^#].*(-{4}|={4}) *$")
# > env1$f$f_file.str_subset.lines4heading("f_df.t.tribble_construct.source.r", RegEx4heading = "^#{1,1}[^#].*(-{4}|={4}) *$")
##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS ----  
#| ------------------------- < To be covered at .Rprofile >           ...122
# @@ START) source                                                    ...139
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B             ...170
# @@ env1\$f\$f_object                                                ...193
# @@ env1\$f\$f_vec                                                   ...285
# @@ env1\$f\$f_list                                                  ...286
# @@ env1\$f\$f_list_list                                             ...446
# @@ env1\$f\$f_matrix                                                ...447
# @@ env1\$f\$f_array                                                 ...448
# @@ env1\$f\$f_formula                                               ...537
# @@ env1\$f\$f_df                                                    ...616
# @@ env1\$env.internal functions                                     ...790
# @@ source()                                                         ...1266
# ls.str(env1) #                                                      ...1335
# ls.str(env1$env.internal) #                                         ...1336
# # > ls.str(env1) #                                                  ...1337
# # > ls.str(env1$env.internal) #                                     ...1343
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##   
# > env1$f$f_file.str_subset.lines4heading("f_df.t.tribble_construct.source.r", RegEx4heading = "^#{1,2}[^#].*(-{4}|={4}) *$")
##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS ----  
#| ------------------------- < To be covered at .Rprofile >           ...122
## env1\$path                                                         ...127
# @@ START) source                                                    ...139
## @ .subpath, .filename.source.r                                     ...140
## env1 = env0                                                        ...164
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B             ...170
## .GlobalEnv$.tmp = list()                                           ...177
## .GlobalEnv$env1 = new.env()                                        ...179
# @@ env1\$f\$f_object                                                ...193
## :: str_max_level1 =                                                ...195
## :: str_max_level2 =                                                ...200
## :: str_give_attr_F =                                               ...205
## :: str_max_level1.give_attr_F =                                    ...210
## :: str_max_level2.give_attr_F =                                    ...218
## :: paste0_collapse0 =                                              ...226
## :: paste0_collapse0.print =                                        ...250
## :: cat0 =                                                          ...261
## :: deparse.cat0 =                                                  ...274
# @@ env1\$f\$f_vec                                                   ...285
# @@ env1\$f\$f_list                                                  ...286
## :: env.internal\$f_vec.format_line_by_line =                       ...288
## :: f_vec.dput_line_by_line =                                       ...299
## :: env.internal\$f_list.format_line_by_line =                      ...317
## :: f_list.dput_line_by_line =                                      ...333
## :: f_list.str_by_element =                                         ...346
## :: f_list.print_by_element =                                       ...367
## :: f_list_tibble.print_by_element =                                ...388
## :: f_chrNameValuePairs2vector =                                    ...409
## :: f_vec1_vec2.setdiff_list =                                      ...422
# @@ env1\$f\$f_list_list                                             ...446
# @@ env1\$f\$f_matrix                                                ...447
# @@ env1\$f\$f_array                                                 ...448
## :: f_list_list.to_matrix =                                         ...450
## :: f_list_list.to_data_frame =                                     ...469
## :: f_matrix.to_list_list =                                         ...489
## :: f_matrix.set_names.to_vector =                                  ...516
# @@ env1\$f\$f_formula                                               ...537
## :: f_formula.lhs_rhs_vars =                                        ...539
## :: f_list_formula.append_lhs_rhs_vars =                            ...574
# @@ env1\$f\$f_df                                                    ...616
## :: f_df.tribble_construct =                                        ...618
## :: f_df.transpose =                                                ...630
## :: f_df.t.tribble_construct =                                      ...640
## :: f_df.print_byVar =                                              ...650
## :: f_df.add_VarNameT.deltaT0 =                                     ...665
## :: f_df.add_VarNameT.pdeltaT0 =                                    ...680
## :: f_df.add_RegExVars.kbins =                                      ...695
## :: f_df.add_RegExVars.quintile_factor =                            ...724
## :: f_df.add_RegExVars.quartile_factor =                            ...755
# @@ env1\$env.internal functions                                     ...790
# @@ source()                                                         ...1266
## @ for (.dependancy in c("")) {                                     ...1268
## @ "f_DataSetName.Search.read.checkEntity" |> paste0(".source.r") |> source()       ...1277
## @ "f_df.NotNA_p_df" |> paste0(".source.r") |> source()             ...1283
## @ "f_df.printVars_byMainOutcome" |> paste0(".source.r") |> source()       ...1290
## @ "f_df.Table1byExposure.xlsx" |> paste0(".source.r") |> source()       ...1296
## @ "f_df.cv.glmnet" |> paste0(".source.r") |> source()              ...1302
## *** Caution) convert lbl to fct (quite deterministic step) before select or recode or filter_n ~!!!       ...1309
## @ "f_CodeBook_DataSet.lbl" |> paste0(".source.r") |> source()       ...1311
# ls.str(env1) #                                                      ...1335
# ls.str(env1$env.internal) #                                         ...1336
# # > ls.str(env1) #                                                  ...1337
# # > ls.str(env1$env.internal) #                                     ...1343
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  

