##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 1) ----  
# ⸿ SOURCE)                                                                #L229
# ⸿ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B                   #L260
# ⸿ env1\$f\$f_object                                                      #L283
# ⸿ env1\$f\$f_str                                                         #L283
# ⸿ env1\$f\$f_vec                                                         #L395
# ⸿ env1\$f\$f_list                                                        #L396
# ⸿ env1\$f\$f_list_list                                                   #L796
# ⸿ env1\$f\$f_matrix                                                      #L797
# ⸿ env1\$f\$f_array                                                       #L798
# ⸿ env1\$f\$f_formula                                                     #L887
# ⸿ env1\$f\$f_df                                                          #L966
# ⸿ env1\$env.internal functions                                           #L1155
# ⸿ source()                                                               #L1631
# ls.str(env1) #                                                            #L1700
# ls.str(env1$env.internal) #                                               #L1701
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
##HHHHHHHHHHHHHHHHHH BEGINNING OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  
# TABLE OF CONTENTS (level 2) ----  

# ⸿ env1\$f\$f_object                                                      #L283
# ⸿ env1\$f\$f_str                                                         #L283
## :: str_max_level1 =                                                      #L285
## :: str_max_level2 =                                                      #L290
## :: str_give_attr_F =                                                     #L295
## :: str_max_level1.give_attr_F =                                          #L300
## :: str_max_level2.give_attr_F =                                          #L308
## :: paste0_collapse0 =                                                    #L316
## :: paste0_collapse0.print =                                              #L340
## :: cat0 =                                                                #L351
## :: catLF =                                                               #L365
## :: deparse.cat0 =                                                        #L384
##HHHHHHHHHHHHHHHHHHHH THE END OF TABLE OF CONTENTS HHHHHHHHHHHHHHHHHHHHHH##  


##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ⸿ env1\$f\$f_object ----  
# ⸿ env1\$f\$f_str ----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: str_max_level1 =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "str_max_level1"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(object, ...) {  str(object, ..., max.level = 1)  }
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: str_max_level2 =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "str_max_level2"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(object, ...) {  str(object, ..., max.level = 2)  }
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: str_give_attr_F =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "str_give_attr_F"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(object, ...) {  str(object, ..., give.attr = FALSE)  }
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: str_max_level1.give_attr_F =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "str_max_level1.give_attr_F"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(object, ...) {  str(object, ..., max.level = 1, give.attr = FALSE)  }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) str_give_attr_F.max_level1  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "str_give_attr_F.max_level1")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: str_max_level2.give_attr_F =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "str_max_level2.give_attr_F"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(object, ...) {  str(object, ..., max.level = 2, give.attr = FALSE)  }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) str_give_attr_F.max_level2  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "str_give_attr_F.max_level2")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: paste0_collapse0 =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "paste0_collapse0"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(..., collapse = "", DEBUGMODE = isTRUE(getOption("DEBUGMODE"))) {  
    # options(DEBUGMODE = TRUE)
    # options(DEBUGMODE = FALSE)
    if(DEBUGMODE) browser()
    # Browse[1]> ls(all.names = TRUE)
    # [1] "..."       "collapse"  "DEBUGMODE"
    # Browse[1]> list(...) %>% str
    # List of 3
    #  $ : chr "a"
    #  $ : chr "b"
    #  $ : int [1:3] 1 2 3
    if(any(list(...) %>% map_lgl(function(Element) length(Element) > 1))) {
        warning("Some elements have length > 1. Be cautious about recycled vector term-by-term paste!")
    }
    paste0(..., collapse = collapse)
}
## *** Example Usage:  
# paste("a", "b", 1:3, collapse = "")  # "a b 1a b 2a b 3"
# paste0("a", "b", 1:3, collapse = "")  # "ab1ab2ab3"
# paste0_collapse0("a", "b", 1:3)  # "ab1ab2ab3"
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: paste0_collapse0.print =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "paste0_collapse0.print"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(..., collapse = "") {  
    # print(paste0(..., collapse = collapse))
    print(env1$env.internal.attach$paste0_collapse0(..., collapse = collapse))
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) print.paste0_collapse0  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "print.paste0_collapse0")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: cat0 =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "cat0"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(...) {  
    # paste0(..., collapse = "") |> cat("  \n", sep="")
    cat(..., "  \n", sep="")
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) print.paste0_collapse0.cat0  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "print.paste0_collapse0.cat0")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) paste0_collapse0.cat0  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "paste0_collapse0.cat0")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: catLF =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "catLF"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(..., trailing_double_spaces = TRUE) {  
    # input_vec_chr |> paste0(collapse = "  \n") |> cat("  \n", sep="")
    # paste0(..., collapse = "  \n") |> cat("  \n", sep="")
    if (trailing_double_spaces) {
        cat(..., sep="  \n"); cat("  \n")
    } else {
        cat(..., sep="\n"); cat("\n")
    }
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) print.paste0_collapseLF.cat0  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "print.paste0_collapseLF.cat0")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) paste0_collapseLF.cat0  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "paste0_collapseLF.cat0")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: deparse.cat0 =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "deparse.cat0"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(object, width.cutoff = 500L) {  object |> deparse(width.cutoff = width.cutoff) |> cat("  \n", sep="")  }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) dput.deparse.cat0  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "dput.deparse.cat0")












##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: fObject.DfObjectSize_IEC ====  
#' IEC‑unit size summary — wide columns (GiB / MiB / KiB / B)
#'
#' @description
#' `fObject.DfObjectSize_IEC()` reports the memory footprint of one object *or*
#' a set of objects supplied by name.  
#' • **Direct mode**  – pass an object.  
#' • **Name mode**    – pass a character vector of names; they are looked‑up in
#'   `env` (default `parent.frame()`).
#'
#' The default return is a **wide tibble** with **exactly** these columns  
#' `ObjectName`, `Size_GiB`, `Size_MiB`, `Size_KiB`, `Size_B` (numeric).  
#' For users who prefer the “named‑list of formatted strings” style from the
#' alternative implementation, set `return = "list"`.
#'
#' @param inputObjects  An R object **or** a character vector of object names.
#' @param digits        Decimal places for GiB/MiB/KiB columns (default `2L`).
#' @param env           Environment in which to resolve names
#'                      (default `parent.frame()`).
#' @param return        `"tibble"` *(default)* or `"list"` (see Details).
#' @param verbose       Logical; prints diagnostics when `TRUE`
#'                      (default honours `getOption("verbose")`).
#'
#' @details
#' * When `return = "tibble"` the table is numeric‑friendly for downstream
#'   calculations or sorting. `Size_B` is left un‑rounded for full precision.  
#' * When `return = "list"` each element is a character vector of formatted
#'   sizes (`"0.01 MiB"`, etc.) exactly as produced by
#'   `format(object.size(), standard = "IEC")`, matching the other model’s API.
#'
#' @return A tibble (default) or named list, depending on `return`.
#'
#' @examples
#' a <- 1:10
#' b <- matrix(runif(1e4), 100)
#' fObject.DfObjectSize_IEC(a)                       # direct object
#' fObject.DfObjectSize_IEC(c("a","b"))              # names, tibble
#' fObject.DfObjectSize_IEC(c("a","b"), return="list")  # names, list
#'
#' @export
.tmp$env1_subenv_name = "f"
.tmp$objectname = "fObject.DfObjectSize_IEC"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(inputObjects,
                                     digits   = 2L,
                                     env      = parent.frame(),
                                     return   = c("tibble", "list"),
                                     verbose  = isTRUE(getOption("verbose"))) {

    return <- match.arg(return)

    ## divisors (powers of 1024)
    divs <- c(GiB = 1024^3, MiB = 1024^2, KiB = 1024, B = 1)

    ## helper: build one row or one formatted vector --------------------- ##
    size_one <- function(obj, obj_name, want_list = FALSE) {

        bytes <- as.numeric(object.size(obj))

        if (want_list) {
            vapply(names(divs),
                   \(u) format(bytes, units = u, standard = "IEC"),
                   character(1))
        } else {
            sizes <- round(bytes / divs, digits)
            tibble::tibble(
                ObjectName = obj_name,
                Size_GiB   = sizes["GiB"],
                Size_MiB   = sizes["MiB"],
                Size_KiB   = sizes["KiB"],
                Size_B     = bytes       # keep exact bytes
            )
        }
    }

    ## resolve names vs direct object ------------------------------------ ##
    build_result <- function(objs, labels) {
        if (return == "list") {
            setNames(lapply(seq_along(objs),
                            \(i) size_one(objs[[i]], labels[i],
                                          want_list = TRUE)),
                     labels)
        } else {                               # tibble
            purrr::map_dfr(seq_along(objs),
                           \(i) size_one(objs[[i]], labels[i]))
        }
    }

    if (is.character(inputObjects)) {                       # NAME MODE
        if (verbose)
            message("Processing object names: ",
                    paste(inputObjects, collapse = ", "))

        missing <- inputObjects[!vapply(inputObjects,
                                         exists, logical(1),
                                         envir = env, inherits = FALSE)]
        if (length(missing))
            stop("Objects not found: ", paste(missing, collapse = ", "))

        objs    <- lapply(inputObjects,
                          \(nm) get(nm, envir = env, inherits = FALSE))
        result  <- build_result(objs, inputObjects)

    } else {                                                # DIRECT MODE
        label   <- deparse(substitute(inputObjects), n = 1L)
        result  <- build_result(list(inputObjects), label)
    }

    if (verbose) {
        if (return == "tibble") print(result) else str(result)
    }
    result
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) object.size.DfObjectSize_IEC  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "object.size.DfObjectSize_IEC")





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
# cat("* To revert to the last commited file, run the following terminal command:\n", 
#     '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
