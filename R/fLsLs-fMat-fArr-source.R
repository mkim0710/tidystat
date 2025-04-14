##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 1) ----  
# @@ SOURCE)                                                                #L229
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B                   #L260
# @@ env1\$f\$f_object                                                      #L283
# @@ env1\$f\$f_vec                                                         #L395
# @@ env1\$f\$f_str                                                         #L283
# @@ env1\$f\$f_list                                                        #L396
# @@ env1\$f\$f_list_list                                                   #L796
# @@ env1\$f\$f_matrix                                                      #L797
# @@ env1\$f\$f_array                                                       #L798
# @@ env1\$f\$f_formula                                                     #L887
# @@ env1\$f\$f_df                                                          #L966
# @@ env1\$env.internal functions                                           #L1155
# @@ source()                                                               #L1631
# ls.str(env1) #                                                            #L1700
# ls.str(env1$env.internal) #                                               #L1701
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 2) ----  

# @@ env1\$f\$f_list_list                                                   #L796
# @@ env1\$f\$f_matrix                                                      #L797
# @@ env1\$f\$f_array                                                       #L798
## :: f_list_list.to_matrix =                                               #L800
## :: f_list_list.to_data_frame =                                           #L819
## :: f_matrix.to_list_list =                                               #L839
## :: f_matrix.set_names.to_vector =                                        #L866
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  



##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ env1\$f\$f_list_list ----  
# @@ env1\$f\$f_matrix ----  
# @@ env1\$f\$f_array ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_list_list.to_matrix =  ----
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/array_list/f_list_list.to_data_frame.dev.r
.tmp$objectname = "f_list_list.to_matrix"
.tmp$object = function(list_list = paste0("C",1:3) %>% set_names() %>% map(function(chr) paste0("R",1:2) %>% set_names() %>% map(paste0, chr)), type = "list_list[[indexColumn]][[indexRow]]") {
    if (type == "list_list[[indexColumn]][[indexRow]]") {
        out = simplify2array(list_list)
    } else if (type == "list_list[[indexRow]][[indexColumn]]") {
        out = t(simplify2array(list_list))
    } else {
        stop("Please specify type: either list_list[[indexColumn]][[indexRow]] or list_list[[indexRow]][[indexColumn]]")
    }
    out2 = unlist(out)
    dim(out2) = dim(out)
    dimnames(out2) = dimnames(out)
    out2
}
### \% |> f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_list_list.to_data_frame =  ----
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/array_list/f_list_list.to_data_frame.dev.r
.tmp$objectname = "f_list_list.to_data_frame"
.tmp$object = function(list_list = paste0("C",1:3) %>% set_names() %>% map(function(chr) paste0("R",1:2) %>% set_names() %>% map(paste0, chr)), type = "list_list[[indexColumn]][[indexRow]]") {
    if (type == "list_list[[indexColumn]][[indexRow]]") {
        out = simplify2array(list_list)
    } else if (type == "list_list[[indexRow]][[indexColumn]]") {
        out = t(simplify2array(list_list))
    } else {
        stop("Please specify type: either list_list[[indexColumn]][[indexRow]] or list_list[[indexRow]][[indexColumn]]")
    }
    out2 = unlist(out)
    dim(out2) = dim(out)
    dimnames(out2) = dimnames(out)
    out2 = out2 |> as.data.frame() |> rownames_to_column() |> as_data_frame()
    out2
}
### \% |> f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_matrix.to_list_list =  ----
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/array_list/f_matrix.to_list_list.dev.r
.tmp$objectname = "f_matrix.to_list_list"
.tmp$object = function(input_matrix = outer(1:2, 1:3, function(i, j) {paste0("R", i, "C", j)}), type = "list_list[[indexColumn]][[indexRow]]") {
    if (length(dim(input_matrix)) != 2) {
        stop("length(dim(input_matrix)) != 2")
    }
    if (is.null(rownames(input_matrix))) {
        rownames(input_matrix) = paste0("R", 1:nrow(input_matrix))
    }
    if (is.null(colnames(input_matrix))) {
        colnames(input_matrix) = paste0("C", 1:ncol(input_matrix))
    }
    
    if (type == "list_list[[indexColumn]][[indexRow]]") {
        
    } else if (type == "list_list[[indexRow]][[indexColumn]]") {
        input_matrix = t(input_matrix)
    } else {
        stop("Please specify type: either list_list[[indexColumn]][[indexRow]] or list_list[[indexRow]][[indexColumn]]")
    }
    out_list_list = input_matrix %>% as.data.frame %>% map(as.list) %>% map(set_names, rownames(input_matrix))
    out_list_list
}
### \% |> f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_matrix.set_names.to_vector =  ----
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/array_list/f_matrix.set_names.to_vector.dev.r
.tmp$objectname = "f_matrix.set_names.to_vector"
.tmp$object = function(input_matrix = matrix(0, nrow = 2, ncol = 3)) {
    if (is.null(rownames(input_matrix))) {
        rownames(input_matrix) = paste0("R", 1:nrow(input_matrix))
    }
    if (is.null(colnames(input_matrix))) {
        colnames(input_matrix) = paste0("C", 1:ncol(input_matrix))
    }
    # input_matrix %>% set_names(outer(rownames(.), colnames(.), paste0)) %>% as.vector()
    input_matrix %>% set_names(outer(rownames(.), colnames(.), paste0)) %>% c()
}
### \% |> f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)


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