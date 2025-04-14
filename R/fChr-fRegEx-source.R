##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 1) ----  
# @@ system, environment                                                    #L312
# @@ f_function, f_expression, f_CodeText                                   #L555
# @@ f_file, f_URL, f_path                                                  #L1006
# @@ f_RegEx                                                                #L2928
# @@ source()                                                               #L2990
# \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) )       #L3118
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 2) ----  
# @@ f_RegEx                                                                #L2928
## :: constant_vec.SpecialChars32KeyboardLayout                             #L2931
## :: f_RegExChrClass1_RegExChrClass2.setdiff_list = function()             #L2937
## :: f_list_RegExChrClass.union_df() = function()                          #L2964
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ f_RegEx ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: constant_vec.SpecialChars32KeyboardLayout ====
## Rdev/00_base_program/002_base_encoding_RegEx/f_RegExChrClass1_RegExChrClass2.setdiff_list.dev.Rmd
env1$env.internal.attach$constant_vec.SpecialChars32KeyboardLayout = "`~!@#$%^&*()-=_+[]\\{}|;':\",./<>?" |> str_split_1("")  # no unique() no sort()

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_RegExChrClass1_RegExChrClass2.setdiff_list = function() ====
## Rdev/00_base_program/002_base_encoding_RegEx/f_RegExChrClass1_RegExChrClass2.setdiff_list.dev.Rmd
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_RegExChrClass1_RegExChrClass2.setdiff_list" 
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(RegExChrClass1, 
                                                            RegExChrClass2, 
                                                            output_as_data_frame = FALSE, 
                                                            VERBOSE = isTRUE(getOption("verbose"))) {
    
    # 1) Remove leading '[' and trailing ']' (if present)
    RegExChrClass1.removeBracket <- str_remove_all(RegExChrClass1, "^\\[|\\]$")
    RegExChrClass2.removeBracket <- str_remove_all(RegExChrClass2, "^\\[|\\]$")
    
    # 2) Split into individual characters and keep them unique
    RegExChrClass1.as_vector <- RegExChrClass1.removeBracket %>%
        str_split(pattern = "", n = Inf) %>%
        unlist() %>%
        unique()
    
    RegExChrClass2.as_vector <- RegExChrClass2.removeBracket %>%
        str_split(pattern = "", n = Inf) %>%
        unlist() %>%
        unique()

    env1$f$f_vec1_vec2.setdiff_list(vec1 = RegExChrClass1.as_vector, vec2 = RegExChrClass2.as_vector, output_as_data_frame = output_as_data_frame)
}
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_list_RegExChrClass.union_df() = function() ====
## Rdev/00_base_program/002_base_encoding_RegEx/f_RegExChrClass1_RegExChrClass2.setdiff_list.dev.Rmd
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_list_RegExChrClass.union_df" 
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(input_list_RegExChrClass, 
                                                            print_str = TRUE, 
                                                            VERBOSE = isTRUE(getOption("verbose"))) {
    
    # 1) Remove leading '[' and trailing ']' (if present)
    input_list_RegExChrClass.removeBracket <- input_list_RegExChrClass %>% map(~str_remove_all(.x, "^\\[|\\]$"))

    # 2) Split into individual characters and keep them unique
    input_list_RegExChrClass.map_as_vector = input_list_RegExChrClass.removeBracket %>%
        map(~str_split(.x, pattern = "", n = Inf) %>%
            unlist() %>%
            unique())

    env1$f$f_list_vecs.union_df(input_list_vecs = input_list_RegExChrClass.map_as_vector, print_str = print_str, VERBOSE = VERBOSE)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) f_RegExChrClassList.union_df  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "f_RegExChrClassList.union_df")





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
# cat("* To revert to the last commited file, run the following terminal command:\n", 
#     '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
