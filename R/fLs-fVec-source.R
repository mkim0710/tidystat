##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 1) ----  
# 〚〛 SOURCE)                                                                #L229
# 〚〛 Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B                   #L260
# 〚〛 env1\$f\$f_object                                                      #L283
# 〚〛 env1\$f\$f_str                                                         #L283
# 〚〛 env1\$f\$f_vec                                                         #L395
# 〚〛 env1\$f\$f_list                                                        #L396
# 〚〛 env1\$f\$f_list_list                                                   #L796
# 〚〛 env1\$f\$f_matrix                                                      #L797
# 〚〛 env1\$f\$f_array                                                       #L798
# 〚〛 env1\$f\$f_formula                                                     #L887
# 〚〛 env1\$f\$f_df                                                          #L966
# 〚〛 env1\$env.internal functions                                           #L1155
# 〚〛 source()                                                               #L1631
# ls.str(env1) #                                                            #L1700
# ls.str(env1$env.internal) #                                               #L1701
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 2) ----  

# 〚〛 env1\$f\$f_vec                                                         #L395
# 〚〛 env1\$f\$f_list                                                        #L396
## :: env.internal\$f_vec.format_line_by_line =                             #L398
## :: f_vec.dput_line_by_line =                                             #L409
## :: env.internal\$f_list.format_line_by_line =                            #L430
## :: f_list.dput_line_by_line =                                            #L446
## :: f_list.str_by_element =                                               #L459
## :: f_list.print_by_element =                                             #L480
## :: f_list_tibble.print_by_element =                                      #L501
## :: f_chrNameValuePairs2vector =                                          #L522
## :: f_vec1_vec2.setdiff_list =                                            #L536
## ::OPTION:: f_vec1_vec2.setdiff_df                                        #L572
## :: f_list_vecs.union_df = function()                                     #L582
## :: f_vec_chr.strsplit0_as_list_vec =                                     #L666
## :: f_chr1.strsplit0_as_vec                                               #L677
## :: f_chr1.strsplit0_as_vec.unique.sort                                   #L689
## :: f_vec_chr.na_if_NotMatching =                                         #L702
## :: f_vec_chr.add_line_numbers =                                          #L724
## :: f_vec_chr.add_line_numbers.paste_collapse_LF_cat =                    #L742
## :: f_vec_chr.list_SECTION_nonSECTION =                                   #L753
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  


##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# 〚〛 env1\$f\$f_vec ----  
# 〚〛 env1\$f\$f_list ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  # https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_vec.dput_line_by_line.dev.r
## :: env.internal\$f_vec.format_line_by_line =  ----  
env1$env.internal$f_vec.format_line_by_line <- function(vec, space_between_vec_elements="\n  ", sep_parentheses = FALSE, end_of_text = "\n") {
    # vec |> paste0(collapse='",  \n  "') %>% {cat('c("',.,'")  \n', sep="")}  # env1$f$f_vec.dput_line_by_line(); |> paste0(collapse='",  \n  "') %>% {cat('c("',.,'")  \n', sep="")} ----
    # vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c("',paste0(., collapse='",\n  "'),'")\n')} |> cat("  \n", sep="")
    if (is.null(vec)) {
        return("NULL")
    } else {
        vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c(',ifelse(sep_parentheses,space_between_vec_elements,""),'"',paste0(., collapse=paste0('",',space_between_vec_elements,'"')),'"',ifelse(sep_parentheses,str_extract(space_between_vec_elements,"\n"),""),')',end_of_text)}
    }
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
## :: f_vec.dput_line_by_line =  ----  
.tmp$objectname = "f_vec.dput_line_by_line"
# .tmp$object = function(vec) {
#     vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") |> paste0(collapse='",\n  "') |> paste0('c("',.,'")\n') |> cat("  \n", sep="")
# }
.tmp$object = function(vec, space_between_vec_elements="  \n  ", sep_parentheses = FALSE, end_of_text = "  \n") {
    if(space_between_vec_elements=="  \n  " && sep_parentheses == FALSE && end_of_text == "  \n") {
        # paste0('"',vec,'"  \n') |> cat(sep="")
        # paste0('"',vec,'"') |> paste0(collapse=', ') %>% {cat('c(',.,')  \n', sep="")}
        # paste0('"',vec,'"') |> paste0(collapse=',  \n  ') %>% {cat('c(',.,')  \n', sep="")}
        vec |> paste0(collapse='",  \n  "') %>% {cat('c("',.,'")  \n', sep="")}  # env1$f$f_vec.dput_line_by_line(); |> paste0(collapse='",  \n  "') %>% {cat('c("',.,'")  \n', sep="")} ----
    } else {
        env1$env.internal$f_vec.format_line_by_line(vec, space_between_vec_elements, sep_parentheses, end_of_text) |> cat("  \n", sep="")
    }
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = .tmp$env1_subenv_name == "f", RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) dput.vec.line_by_line  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "dput.vec.line_by_line")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  # https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_list.dput_line_by_line.dev.r
## :: env.internal\$f_list.format_line_by_line =  ----  
env1$env.internal$f_list.format_line_by_line <- function(list_vec, space_between_vec_elements="\n         ", space_between_list_elements = "\n     ", sep_parentheses = FALSE, end_of_text = "\n") {
    .f_vec.paste_collapse <- function(vec, space_between_vec_elements="\n") {
        if (is.null(vec)) {
            return("NULL")
        } else {
            vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% paste0('"',.,'"') |> paste0(collapse=paste0(",",space_between_vec_elements))
        }
    }
    
    list_vec.formatted <- map(names(list_vec), function(name) {
        paste0('"', name, '" = c(', space_between_vec_elements, .f_vec.paste_collapse(list_vec[[name]], space_between_vec_elements), ")")
    })
    paste0("list(", ifelse(sep_parentheses,space_between_list_elements,""), paste0(list_vec.formatted, collapse = paste0(",",space_between_list_elements)), ifelse(sep_parentheses,str_extract(space_between_list_elements,"\n"),""), ")", end_of_text)
}
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_list.dput_line_by_line =  ----  
.tmp$objectname = "f_list.dput_line_by_line"
.tmp$object = function(list_vec, space_between_vec_elements="\n         ", space_between_list_elements = "\n     ", sep_parentheses = FALSE, end_of_text = "\n") {
    env1$env.internal$f_list.format_line_by_line(list_vec, space_between_vec_elements, space_between_list_elements, sep_parentheses, end_of_text) |> cat("  \n", sep="")
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = .tmp$env1_subenv_name == "f", RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) dput.list.line_by_line  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "dput.list.line_by_line")


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_list.str_by_element =  ----  
# Rdev/00_base_program/f_list.str_by_element.dev.r
.tmp$objectname = "f_list.str_by_element"
.tmp$object = function(ls, max.level = 2, give.attr = FALSE, tabInsteadOfSpace = FALSE, width = getOption("width") - 4, strict.width = strO$strict.width, ...) {
    cat("# List of ",length(ls),"  \n", sep="")
    for(i in names(ls)) {
        cat("# $ ",i,"\t\t:", sep="")
        if (tabInsteadOfSpace) {
            str(ls[[i]], max.level = max.level-1, give.attr = give.attr, width = width - 4, ...) |> capture.output() |> str_replace_all(" {4,}","\t") |> cat(sep="\n##") # ; cat("\n")
        } else {
            str(ls[[i]], max.level = max.level-1, give.attr = give.attr, width = width - 4, ...) |> capture.output() |> cat(sep="\n##") # ; cat("\n")
        }
        cat("# ________________________________________________________________________________    \n")
    }
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = .tmp$env1_subenv_name == "f", RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) str.list_by_element  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "str.list_by_element")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_list.print_by_element =  ----  
.tmp$objectname = "f_list.print_by_element"
.tmp$object = function(ls, tabInsteadOfSpace = FALSE, width = getOption("width") - 4, strict.width = strO$strict.width, ...) {
    cat("# List of ",length(ls),"  \n", sep="")
    for(i in names(ls)) {
        cat("# print(. $ ",i,")", sep=""); cat("\n")
        cat("##")
        if (tabInsteadOfSpace) {
            ls[[i]] |> print(...) |> capture.output() |> str_replace_all(" {4,}","\t") |> cat(sep="\n##") # ; cat("\n")
        } else {
            ls[[i]] |> print(...) |> capture.output() |> cat(sep="\n##") # ; cat("\n")
        }
        cat("# ________________________________________________________________________________    \n")
    }
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = .tmp$env1_subenv_name == "f", RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) print.list.by_element  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "print.list.by_element")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_list_tibble.print_by_element =  ----  
.tmp$objectname = "f_list_tibble.print_by_element"
.tmp$object = function(ls, n = 99, tabInsteadOfSpace = FALSE, width = getOption("width") - 4, strict.width = strO$strict.width, ...) {
    cat("# List of ",length(ls),"  \n", sep="")
    for(i in names(ls)) {
        cat("# print(. $ ",i,")", sep=""); cat("\n")
        cat("##")
        if (tabInsteadOfSpace) {
            as_tibble(ls[[i]]) |> print(n = n, ...) |> capture.output() |> str_replace_all(" {4,}","\t") |> cat(sep="\n##") # ; cat("\n")
        } else {
            as_tibble(ls[[i]]) |> print(n = n, ...) |> capture.output() |> cat(sep="\n##") # ; cat("\n")
        }
        cat("# ________________________________________________________________________________    \n")
    }
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = .tmp$env1_subenv_name == "f", RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) print.list_tibble.by_element  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "print.list_tibble.by_element")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_chrNameValuePairs2vector =  ----  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/11_metadata/f_chrNameValuePairs2vector.dev.Rmd
.tmp$objectname = "f_chrNameValuePairs2vector"
.tmp$object = function(chrNameValuePairs, NameValuePair_separator = ",", Name_Value_separator = "=", vecNamed.swap = FALSE) {
    vec.NameValuePair = chrNameValuePairs %>% str_split(paste0("\\s*", NameValuePair_separator, "\\s*")) |> unlist() 
    list.vec.Name_Value = vec.NameValuePair %>% str_split(paste0("\\s*", Name_Value_separator, "\\s*"))
    vecNamed = list.vec.Name_Value %>% map(~ set_names(c(.x[2]), .x[1])) |> unlist()
    if (vecNamed.swap) vecNamed = names(vecNamed) |> setNames(vecNamed)
    return(vecNamed)    
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = .tmp$env1_subenv_name == "f", RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_vec1_vec2.setdiff_list =  ----  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/f_vec1_vec2.setdiff_list.dev.r
.tmp$objectname = "f_vec1_vec2.setdiff_list"
.tmp$object = function(vec1, vec2, print_str = TRUE, output_as_data_frame = FALSE) {
    vec1 = as.character(vec1)
    vec2 = as.character(vec2)
    output_list = list(
        vec1.character = vec1, 
        vec2.character = vec2, 
        union = union(vec1, vec2), 
        intersect = intersect(vec1, vec2), 
        setdiff_1_2 = setdiff(vec1, vec2), 
        setdiff_2_1 = setdiff(vec2, vec1), 
        identical = all.equal(vec1, vec2)
    )
    if (output_as_data_frame) {
        output_df = data.frame(
            union         = output_list$union,
            vec1          = output_list$union %in% output_list$vec1.character,
            vec2          = output_list$union %in% output_list$vec2.character,
            intersect     = output_list$union %in% output_list$intersect,
            setdiff_1_2   = output_list$union %in% output_list$setdiff_1_2,
            setdiff_2_1   = output_list$union %in% output_list$setdiff_2_1
        )
        if (print_str) {str(output_df); print(summary(output_df))}
        return(output_df)
    }
    if (print_str) str(output_list)
    invisible(output_list)
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = .tmp$env1_subenv_name == "f", RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) setdiff_list.vec1_vec2  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "setdiff_list.vec1_vec2")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## ::OPTION:: f_vec1_vec2.setdiff_df  ----  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_vec1_vec2.setdiff_df"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(vec1, vec2, print_str = TRUE) {
    env1$f$f_vec1_vec2.setdiff_list(vec1 = vec1, vec2 = vec2, print_str = print_str, output_as_data_frame = TRUE)
} 
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) setdiff_df.vec1_vec2  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "setdiff_df.vec1_vec2")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_list_vecs.union_df = function() ====
## Rdev/00_base_program/009_base_computation/f_list_vecs.union_df.dev.Rmd
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_list_vecs.union_df" 
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(input_list_vecs, print_str = TRUE, VERBOSE = isTRUE(getOption("verbose"))) {
    # 1. If verbose, print the function call
    if (VERBOSE) {
        cat("[DEBUG] Entering f_list_vecs.union_df()\n")
    }

    # 2. Check that the input is indeed a list
    if (!is.list(input_list_vecs)) {
        stop("The input must be a list of vectors.")
    }
    
    # 3. Handle unnamed vectors by assigning default names only where needed
    originalNames_vec <- names(input_list_vecs)
    
    # If no names exist at all, create them:
    if (is.null(originalNames_vec)) {
        defaultNames_vec <- paste0("vec", seq_along(input_list_vecs))
        names(input_list_vecs) <- defaultNames_vec
        if (VERBOSE) {
            cat("[DEBUG] All vectors were unnamed. Assigned default names:\n")
            print(defaultNames_vec)
        }
    } else {
        # If some are named and others are empty, only replace the empty ones
        for (i in seq_along(originalNames_vec)) {
            if (is.na(originalNames_vec[i]) || originalNames_vec[i] == "") {
                originalNames_vec[i] <- paste0("Vec", i)
            }
        }
        names(input_list_vecs) <- originalNames_vec
        if (VERBOSE) {
            cat("[DEBUG] Some vectors were unnamed. Assigned default names for those only:\n")
            print(originalNames_vec)
        }
    }
    
    # 4. Convert all vectors to character
    input_list_vecs.as_character <- purrr::map(
        .x = input_list_vecs,
        .f = function(single_vec) {
            as.character(single_vec)
        }
    )

    # 5. Compute the union of all elements (sorted, unique)
    union_vec <- sort(unique(unlist(input_list_vecs.as_character)))
    if (VERBOSE) {
        cat("[DEBUG] union_vec (all unique elements):\n")
        print(union_vec)
    }

    # 6. Initialize output tibble
    output_df <- tibble::tibble(UNION = union_vec)

    # 7. Create logical indicator columns
    for (vec_name in names(input_list_vecs.as_character)) {
        membership_vec <- output_df[["UNION"]] %in% input_list_vecs.as_character[[vec_name]]
        output_df[[vec_name]] <- membership_vec
        if (VERBOSE) {
            cat("[DEBUG] Processed membership for:", vec_name, "\n")
        }
    }

    # 8. Print final output if requested
    if (print_str) {str(output_df); print(summary(output_df))}

    # 9. Return the tibble
    return(output_df)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) f_vecsList.union_df  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "f_vecsList.setdiff_df")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) setdiff_df.list_vecs  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "setdiff_df.list_vecs")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) union_df.list_vecs  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "union_df.list_vecs")

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_vec_chr.strsplit0_as_list_vec =  ----
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_vec_chr.strsplit0_as_list_vec"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(input_vec_chr, split = "", n = Inf, simplify = FALSE) {
    # output_list = input_vec_chr %>% strsplit(split)
    output_list = stringr::str_split(string = input_vec_chr, pattern = split, n = n, simplify = simplify)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) strsplit0_as_list_vec  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "strsplit0_as_list_vec")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_chr1.strsplit0_as_vec  ----  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_chr1.strsplit0_as_vec"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(input_chr1, split = "") {
    # if(length(input_chr1) > 1) warning("length(input_chr1) > 1")
    # output_vec_chr = input_chr1 |> str_split(pattern = split) |> unlist()
    stringr::str_split_1(string = input_chr1, pattern = split)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) strsplit0.unlist_as_vec  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "strsplit0.unlist_as_vec")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_chr1.strsplit0_as_vec.unique.sort  ----  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_chr1.strsplit0_as_vec.unique.sort"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(input_chr1, split = "") {
    # if(length(input_chr1) > 1) warning("length(input_chr1) > 1")
    # output_vec_chr = input_chr1 |> str_split(pattern = split) |> unlist() |> unique() |> sort()
    stringr::str_split_1(string = input_chr1, pattern = split) |> unique() |> sort()
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) strsplit0.unlist_as_vec.unique.sort  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "strsplit0.unlist_as_vec.unique.sort")

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_vec_chr.na_if_NotMatching =  ----
# https://github.com/mkim0710/blob/main/Rdev/00_base_program/009_base_computation/f_vec_chr.na_if_NotMatching.dev.r
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_vec_chr.na_if_NotMatching"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(input_vec_chr, RegEx4keep) {
    # RegEx4keep.modified = RegEx4keep
    # if(!str_detect(RegEx4keep, "^\\^")) RegEx4keep.modified = paste0("^.*",RegEx4keep)
    # if(!str_detect(RegEx4keep, "\\$$")) RegEx4keep.modified = paste0(RegEx4keep,".*$")
    # input_vec_chr |> str_extract(RegEx4keep.modified)
    ifelse(str_detect(input_vec_chr, RegEx4keep), input_vec_chr, NA)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) str_subset.keep_vector_length.na_if_NotMatching  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "str_subset.keep_vector_length.na_if_NotMatching")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) str_replace.na_if_NotMatching  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "str_replace.na_if_NotMatching")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) str_extract.na_if_NotMatching.return_whole_element_if_Matching  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "str_extract.na_if_NotMatching.return_whole_element_if_Matching")

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_vec_chr.add_line_numbers =  ----
# https://github.com/mkim0710/blob/main/Rdev/00_base_program/009_base_computation/f_vec_chr.add_line_numbers.dev.r
.tmp$env1_subenv_name = "env.internal"
.tmp$objectname = "f_vec_chr.add_line_numbers"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(input_vec_chr, width.cutoff = 80L-4L, URL4line_numbers = FALSE, prefix4line_numbers = ifelse(!URL4line_numbers, "#L",  paste0("# https://github.com/mkim0710/tidystat/blob/master/", env1$f$f_path.relative(rstudioapi::getSourceEditorContext()$path), "#L"))) {
    input_vec_chr = 
        ifelse(
            is.na(input_vec_chr) | input_vec_chr == "", input_vec_chr, 
            paste0(
                input_vec_chr, 
                strrep(" ",pmax(4, width.cutoff - nchar(input_vec_chr))),
                prefix4line_numbers, 
                1:length(input_vec_chr)
            )
        )
    input_vec_chr
}
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_vec_chr.add_line_numbers.paste_collapse_LF_cat =  ----
# https://github.com/mkim0710/blob/main/Rdev/00_base_program/009_base_computation/f_vec_chr.add_line_numbers.dev.r
.tmp$env1_subenv_name = "env.internal"
.tmp$objectname = "f_vec_chr.add_line_numbers.paste_collapse_LF_cat"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(input_vec_chr, width.cutoff = 80L-4L) {
    out = env1$env.internal$f_vec_chr.add_line_numbers(input_vec_chr, width.cutoff)
    out %>% paste(collapse = "\n") %>% cat("\n", sep="")
    invisible(out)
}

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_vec_chr.list_SECTION_nonSECTION =  ----
# https://github.com/mkim0710/blob/main/Rdev/00_base_program/009_base_computation/f_vec_chr.list_SECTION_nonSECTION.dev.r
.tmp$env1_subenv_name = "env.internal"
.tmp$objectname = "f_vec_chr.list_SECTION_nonSECTION"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(input_vec_chr, RegEx4SECTION_start = "^##H+ BEGINNING OF TABLE OF CONTENTS H+## *$", RegEx4SECTION_end = "^##H+ THE END OF TABLE OF CONTENTS H+## *$") {
    # Validate input
    if (!is.character(input_vec_chr) || length(input_vec_chr) == 0) {
        stop("Input 'input_vec_chr' must be a non-empty character vector.")
    }
    
    # Reference: https://cran.r-project.org/web/packages/stringr/stringr.pdf
    library(stringr)
    
    # Locate all start and end markers
    vec_indices.SECTION_start <- which(str_detect(input_vec_chr, RegEx4SECTION_start))
    vec_indices.SECTION_end   <- which(str_detect(input_vec_chr, RegEx4SECTION_end))
    
    if (length(vec_indices.SECTION_start) == 0 || length(vec_indices.SECTION_end) == 0) {
        # No existing SECTION_extracted markers found
        warning("No existing SECTION_extracted markers found. The entire content will be considered non-SECTION_extracted.")
        return(list(
            SECTION = character(0),
            nonSECTION = input_vec_chr
        ))
    } else {
        # Create a range from the first start marker to the last end marker
        SECTION_range <- min(vec_indices.SECTION_start):max(vec_indices.SECTION_end)
        # Extract lines belonging to the SECTION_extracted
        input_vec_chr.SECTION_extracted <- input_vec_chr[SECTION_range]
        # All other lines are non-SECTION_extracted
        input_vec_chr.SECTION_removed <- input_vec_chr[-SECTION_range]
        
        return(list(
            SECTION    = input_vec_chr.SECTION_extracted,
            nonSECTION = input_vec_chr.SECTION_removed
        ))
    }
}





##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: fVec.na.locf =  ----
#' Fill NA Gaps Using Last Observation Carried Forward (LOCF)
#' 
#' @description 
#' Replaces NA values with previous non-NA value, handling leading NAs and 
#' preserving vector type. Works with any atomic vector type including
#' numeric, character, logical, and factors.
#'
#' @param x Input atomic vector (numeric, character, logical, factor)
#' @param fillLeadingNA Replace leading NAs with first non-NA? (default: FALSE)
#' @param defaultValue Value used when fillLeadingNA=TRUE and all values are NA
#' @param verbose Show processing messages? (default: FALSE)
#'
#' @return Vector with NAs replaced, preserving original type
#'
#' @examples
#' # Basic usage with a numeric vector
#' vec_with_na = c(1, NA, NA, 2, NA, 3, NA, NA)
#' fVec.na.locf(vec_with_na)
#' # Returns: [1, 1, 1, 2, 2, 3, 3, 3]
#'
#' # Clinical lab values example
#' lab_results = c(NA, 8.2, NA, 8.5, NA, NA, 9.0)
#' fVec.na.locf(lab_results)  
#' # Returns: [NA, 8.2, 8.2, 8.5, 8.5, 8.5, 9.0]
#' 
#' # Example with character vector (e.g., diagnostic codes)
#' diagnosis_codes = c("R50.9", NA, NA, "E11.9", NA)
#' fVec.na.locf(diagnosis_codes)  
#' # Returns: ["R50.9", "R50.9", "R50.9", "E11.9", "E11.9"]
#'
#' # Vector with leading NAs
#' y = c(NA, NA, 1, NA, 2)
#' fVec.na.locf(y, fillLeadingNA = TRUE)
#' # Returns: [1, 1, 1, 1, 2]
#'
#' # Example with all NAs
#' z = c(NA, NA, NA)
#' fVec.na.locf(z, fillLeadingNA = TRUE, defaultValue = 0)
#' # Returns: [0, 0, 0]
#'
#' # Using with real dataset
#' data("airquality")
#' summary(airquality$Ozone)  # Contains NAs
#' filledOzone = fVec.na.locf(airquality$Ozone)
#' summary(filledOzone)  # Fewer NAs after filling
#'
#' @export
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fVec.na.locf"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(x, fillLeadingNA = FALSE, defaultValue = NA, verbose = FALSE) {
  # Input validation
  if (!is.atomic(x) || !is.null(dim(x))) {
    stop("Input must be atomic vector (numeric/character/logical/factor)")
  }
  
  # Handle empty vector edge case
  if (length(x) == 0) {
    if (verbose) message("Empty vector input")
    return(x)
  }
  
  # Initialize tracking variables
  resultVec = x
  lastValue = NA
  firstNonNAIndex = NA_integer_
  
  # Single-pass processing
  for (indexInt in seq_along(resultVec)) {
    currentVal = resultVec[indexInt]
    
    if (!is.na(currentVal)) {
      lastValue = currentVal
      if (is.na(firstNonNAIndex)) {
        firstNonNAIndex = indexInt
        if (verbose) message("First non-NA at position ", indexInt)
      }
    } else if (!is.na(lastValue)) {
      resultVec[indexInt] = lastValue
      if (verbose) message("Filled position ", indexInt, " with ", lastValue)
    }
  }
  
  # Handle leading NAs if requested
  if (fillLeadingNA && !is.na(firstNonNAIndex) && firstNonNAIndex > 1) {
    fillValue = resultVec[firstNonNAIndex]
    resultVec[1:(firstNonNAIndex - 1)] = fillValue
    if (verbose) message("Filled ", firstNonNAIndex - 1, " leading NAs with ", fillValue)
  } else if (fillLeadingNA && is.na(firstNonNAIndex)) {
    # All values are NA, use default value
    resultVec[] = defaultValue
    if (verbose) message("All NA - using default value")
  }
  
  return(resultVec)
}




# __________|------  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://chatgpt.com/g/g-p-6765276504708191bde554c8d2095b8b-coderdevelopment/c/681b7135-2474-800e-96ef-510e74ae9989
## :: fLs.map_keepAttrs =  ----
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fLs.map_keepAttrs"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(inputList,
                             funCallback,
                             drop_env_objects = FALSE,
                             verbose = isTRUE(getOption("verbose"))) {

    if (!is.list(inputList))   stop("'inputList' must be a list")
    if (!is.function(funCallback)) stop("'funCallback' must be a function")

    original_attrs = attributes(inputList)
    if (length(original_attrs) == 0L)
        return(lapply(inputList, funCallback))

    newList = lapply(inputList, funCallback)

    if (drop_env_objects) {
        core = c("names", "row.names", "class", "dim", "dimnames")
        env_idx = vapply(original_attrs, is.environment, logical(1))
        env_idx[names(original_attrs) %in% core] = FALSE
        original_attrs[env_idx] = replicate(sum(env_idx), list(), FALSE)
    }

    mostattributes(newList) = original_attrs
    newList
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) map_keepAttrs  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "map_keepAttrs")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) lapply_keepAttrs  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "lapply_keepAttrs")


# __________|------  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## 1. Core cleaner  ---------------------------------------------------------
#' Remove all `.Environment` attributes (and, optionally, raw environments)
#' from a nested list.
#'
#' @param inputList         A list (may be deeply nested).
#' @param drop_env_objects  If TRUE, bare environments appearing as list
#'                          elements / attributes are replaced by NULL.
#' @param verbose           Logical; print a short summary.
#' @return                  The cleaned list.
#' @export
## :: fLs.removeEnvAttr =  ----
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fLs.removeEnvAttr"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(inputList,
                             drop_env_objects    = FALSE,
                             convert_env_to_list = FALSE,
                             verbose             = FALSE) {

  stopifnot(is.list(inputList))
  if (isTRUE(drop_env_objects) && isTRUE(convert_env_to_list))
    stop("Choose *either* drop_env_objects=TRUE or convert_env_to_list=TRUE.")

  removedAttrCountInt = 0L
  replacedEnvCountInt = 0L
  convertedEnvCountInt = 0L

  ## :: internal recursive worker --------------------------------------------
  fObj.recursive_clean_attr = function(inputObj) {

    ## (A) tidy formula environments --------------------------------------
    if (inherits(inputObj, "formula")) {
      environment(inputObj) = baseenv()
      inputObj.attr_terms = attr(inputObj, "terms")
      if (!is.null(inputObj.attr_terms) &&
          !is.null(attr(inputObj.attr_terms, ".Environment"))) {
        attr(inputObj.attr_terms, ".Environment") = NULL
        attr(inputObj, "terms") = inputObj.attr_terms
        removedAttrCountInt <<- removedAttrCountInt + 1L
      }
    }

    ## (B) strip direct .Environment attribute ----------------------------
    if (!is.null(attr(inputObj, ".Environment"))) {
      attr(inputObj, ".Environment") = NULL
      removedAttrCountInt <<- removedAttrCountInt + 1L
    }

    ## (C) handle raw environments ----------------------------------------
    if (is.environment(inputObj)) {
      if (convert_env_to_list) {
        convertedEnvCountInt <<- convertedEnvCountInt + 1L
        inputObj = lapply(as.list.environment(inputObj, all.names = TRUE), fObj.recursive_clean_attr)
      } else if (drop_env_objects) {
        replacedEnvCountInt <<- replacedEnvCountInt + 1L
        return(list())                # keep placeholder so structure remains
      } else {
        return(inputObj)              # leave untouched
      }
    }

    ## (D) recurse through attributes -------------------------------------
    attrNames.ToKeep = c("names", "row.names", "class", "dim", "dimnames")
    inputObjAttributesList = attributes(inputObj)
    if (!is.null(inputObjAttributesList)) {
      for (attrNames.NotToKeep in setdiff(names(inputObjAttributesList),
                                          attrNames.ToKeep)) {

        attrValueObj = inputObjAttributesList[[attrNames.NotToKeep]]

        if (is.environment(attrValueObj)) {
          if (convert_env_to_list) {
            cleanedAttrValue = lapply(
              as.list.environment(attrValueObj, all.names = TRUE),
              fObj.recursive_clean_attr
            )
            attr(inputObj, attrNames.NotToKeep) = cleanedAttrValue
            convertedEnvCountInt <<- convertedEnvCountInt + 1L
          } else if (drop_env_objects) {
            attr(inputObj, attrNames.NotToKeep) = list()
            replacedEnvCountInt <<- replacedEnvCountInt + 1L
          }
        } else if (is.list(attrValueObj)) {
          attr(inputObj, attrNames.NotToKeep) =
            fObj.recursive_clean_attr(attrValueObj)
        }
      }
    }

    ## (E) recurse through list elements *in place* -----------------------
    if (is.list(inputObj)) {
      for (elementIndexInt in seq_along(inputObj)) {
        inputObj[[elementIndexInt]] =
          fObj.recursive_clean_attr(inputObj[[elementIndexInt]])
      }
    }

    inputObj
  }

  cleanedList = fObj.recursive_clean_attr(inputList)

  if (verbose) {
    msgText = sprintf("→ Removed %d .Environment attribute(s)",
                      removedAttrCountInt)
    if (drop_env_objects)
      msgText = sprintf("%s; replaced %d env object(s)", msgText,
                        replacedEnvCountInt)
    if (convert_env_to_list)
      msgText = sprintf("%s; converted %d env object(s) to list(s)",
                        msgText, convertedEnvCountInt)
    message(msgText, ".")
  }
  cleanedList
}

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## 2. Environment detector ----------------------------------------------------
#' Check whether any environments remain inside a list.
#'
#' Prints up to \code{max_paths} offending locations.
#'
#' @param inputList  The list to inspect.
#' @param max_paths  Maximum number of paths to display.
#' @return           TRUE if any environment found, FALSE otherwise.
#' @export
## :: fLs.hasEnvAttr =  ----
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "fLs.hasEnvAttr"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(inputList, max_paths = 5) {
  offendingPathsVec = character(0)

  fObj.walk_check_env = function(inputObj, currentPathText = "inputList") {
    if (length(offendingPathsVec) >= max_paths) return()

    if (is.environment(inputObj))
      offendingPathsVec <<- c(offendingPathsVec, currentPathText)

    if (!is.null(attr(inputObj, ".Environment")))
      offendingPathsVec <<- c(offendingPathsVec,
                              paste0(currentPathText, " attr(.Environment)"))

    if (inherits(inputObj, "formula")) {
      inputObj.attr_terms = attr(inputObj, "terms")
      if (!is.null(inputObj.attr_terms) &&
          !is.null(attr(inputObj.attr_terms, ".Environment")))
        offendingPathsVec <<- c(offendingPathsVec,
                                paste0(currentPathText,
                                       " attr(terms).Environment"))
    }

    if (is.list(inputObj)) {
      for (elementIndexInt in seq_along(inputObj)) {
        elementNameText = names(inputObj)[elementIndexInt]
        if (is.null(elementNameText) || elementNameText == "")
          elementNameText = elementIndexInt
        fObj.walk_check_env(inputObj[[elementIndexInt]],
                            paste0(currentPathText, "$", elementNameText))
      }
    }
  }

  fObj.walk_check_env(inputList)

  if (length(offendingPathsVec)) {
    cat("→ Found environment reference(s): ", length(offendingPathsVec), "\n",
        paste(" •", head(offendingPathsVec, max_paths), "\n"), sep = "")
    TRUE
  } else FALSE
}

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## 3  Convenience wrappers  --------------------------------------------------
#' Print a tidy `str()` after cleaning (no pointer noise).
#' @export
## :: fLs.removeEnvAttr.str =  ----
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fLs.removeEnvAttr.str"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(inputList, ...) {
  utils::str(env1$f$fLs.removeEnvAttr(inputList), ...)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) fLs.str_clean  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "fLs.str_clean")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) str.Ls_clean  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "str.Ls_clean")


##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
#' Clean a list and save it to an .rds file (fail-fast if anything remains).
#' @export
## :: fLs.removeEnvAttr.saveRDS =  ----
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fLs.removeEnvAttr.saveRDS"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(inputList, file_path,
                                     compression      = "xz",
                                     drop_env_objects = FALSE,
                                     convert_env_to_list = FALSE,
                                     verbose          = FALSE) {
  dir.create(dirname(file_path), recursive = TRUE, showWarnings = FALSE)

  cleanedList = env1$f$fLs.removeEnvAttr(inputList,
                                  drop_env_objects    = drop_env_objects,
                                  convert_env_to_list = convert_env_to_list,
                                  verbose             = verbose)
  
  if (env1$env.internal.attach$fLs.hasEnvAttr(cleanedList))
    stop("Cleaning incomplete: environment references remain.")

  saveRDS(cleanedList, file = file_path, compress = compression)
  invisible(file_path)
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) fLs.saveRDS_clean  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "fLs.saveRDS_clean")


##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## 4  Quick demo -------------------------------------------------------------
if (interactive() && FALSE) {
  library(survival)
  demoFormulaObj = Surv(time, status) + 0 ~ age + sex   # captures env

  demoEnv = new.env(); demoEnv$foo = 1; demoEnv$bar = letters[1:3]

  demoList = list(modelInfo   = demoFormulaObj,
                  nestedList  = list(myEnv = demoEnv, valNum = 42),
                  message   = "hello")
  attr(demoList, "myEnvAttr") = demoEnv       

  cat("⟡ Before cleaning\n")
  demoList %>% str
    #   demoList %>% str
    # List of 3
    #  $ modelInfo :Class 'formula'  language Surv(time, status) + 0 ~ age + sex
    #   .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
    #  $ nestedList:List of 2
    #   ..$ myEnv :<environment: 0x558254a64e80> 
    #   ..$ valNum: num 42
    #  $ message   : chr "hello"
    #  - attr(*, "myEnvAttr")=<environment: 0x558254a64e80> 
  
    env1$env.internal.attach$fLs.hasEnvAttr(demoList)
    # → Found environment reference(s): 2
    #  • inputList$modelInfo attr(.Environment) 
    #  • inputList$nestedList$myEnv 
    # [1] TRUE

  cleanedDemoList = env1$f$fLs.removeEnvAttr(demoList, verbose = TRUE)
  # → Removed 1 .Environment attribute(s).

  cat("\n⟡ After cleaning\n")
  env1$env.internal.attach$fLs.hasEnvAttr(cleanedDemoList)
    # → Found environment reference(s): 1
    #  • inputList$nestedList$myEnv 
    # [1] TRUE
  
  cat("\n⟡ Compact structure\n")
  demoList %>% env1$f$fLs.removeEnvAttr() %>% str(max.level = 2)
  demoList %>% env1$f$fLs.removeEnvAttr.str(max.level = 2)
    # >   demoList %>% env1$f$fLs.removeEnvAttr.str(max.level = 2)
    # List of 3
    #  $ modelInfo :Class 'formula'  language Surv(time, status) + 0 ~ age + sex
    #  $ nestedList:List of 2
    #   ..$ myEnv :<environment: 0x558254a64e80> 
    #   ..$ valNum: num 42
    #  $ message   : chr "hello"
  
  cleanedDemoList2 = fLs.removeEnvAttr(demoList,
                                     drop_env_objects = TRUE,
                                     verbose = TRUE)
  # → Removed 1 .Environment attribute(s); replaced 1 bare env(s).
  
  fLs.hasEnvAttr(cleanedDemoList2)   # → FALSE  (no environments left)
  
  demoList %>% fLs.removeEnvAttr(drop_env_objects = TRUE) %>% str(max.level = 2)
    # >   demoList %>% fLs.removeEnvAttr(drop_env_objects = TRUE) %>% str(max.level = 2)
    # List of 3
    #  $ modelInfo :Class 'formula'  language Surv(time, status) + 0 ~ age + sex
    #  $ nestedList:List of 2
    #   ..$ myEnv : NULL
    #   ..$ valNum: num 42
    #  $ message   : chr "hello"

  demoList %>% fLs.removeEnvAttr(convert_env_to_list  = TRUE) %>% str(max.level = 3)
    # >   demoList %>% fLs.removeEnvAttr(convert_env_to_list  = TRUE) %>% str(max.level = 3)
    # List of 3
    #  $ modelInfo :Class 'formula'  language Surv(time, status) + 0 ~ age + sex
    #  $ nestedList:List of 2
    #   ..$ myEnv :List of 2
    #   .. ..$ foo: num 1
    #   .. ..$ bar: chr [1:3] "a" "b" "c"
    #   ..$ valNum: num 42
    #  $ message   : chr "hello"
    #  - attr(*, "myEnvAttr")=List of 2
    #   ..$ foo: num 1
    #   ..$ bar: chr [1:3] "a" "b" "c"
  
  # .tmpFilePath = tempfile(fileext = ".rds")
  .tmpFilePath = "/tmp/Rtmpu5qk48/file13c661a47c2fc.rds"
  env1$f$fLs.removeEnvAttr.saveRDS(cleanedDemoList, .tmpFilePath, verbose = TRUE)
    # Removed 1 .Environment attribute(s).
    # → Found environment reference(s): 1
    #  • inputList$nestedList$myEnv 
    # Error in env1$f$fLs.removeEnvAttr.saveRDS(cleanedDemoList, .tmpFilePath,  : 
    #   Cleaning incomplete: environment references remain.  
  cat("\nSaved cleaned object to:", .tmpFilePath, "\n")
}








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
# 〚〛 END -----  
# cat("* To revert to the last commited file, run the following terminal command:\n", 
#     '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
