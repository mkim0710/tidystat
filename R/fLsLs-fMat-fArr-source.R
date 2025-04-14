
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
