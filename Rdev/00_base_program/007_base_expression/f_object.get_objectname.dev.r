# https://chatgpt.com/c/6742ec9a-396c-800e-886b-4396cd60e050



#@ Base R ====
## :: f_object.get_objectname <- function(input_object) deparse(substitute(input_object)) ----
f_object.get_objectname <- function(input_object) {
  input_object.name <- deparse(substitute(input_object))
  return(input_object.name)
}

tmp <- 42
tmp_object <- 42
f_object.get_objectname(tmp_object)
tmp_object |> f_object.get_objectname()
tmp_object %>% f_object.get_objectname()
# > f_object.get_objectname(tmp_object)
# [1] "tmp_object"
# > tmp_object |> f_object.get_objectname()
# [1] "tmp_object"
# > tmp_object %>% f_object.get_objectname()
# [1] "."


## :: f_object.get_objectname <- function(input_object) as.character(match.call()$input_object) ----
f_object.get_objectname <- function(input_object) {
  input_object.name <- as.character(match.call()$input_object)
  return(input_object.name)
}

tmp_object <- 42
f_object.get_objectname(tmp_object)
tmp_object |> f_object.get_objectname()
tmp_object %>% f_object.get_objectname()
# > tmp_object <- 42
# > f_object.get_objectname(tmp_object)
# [1] "tmp_object"
# > tmp_object |> f_object.get_objectname()
# [1] "tmp_object"
# > tmp_object %>% f_object.get_objectname()
# [1] "."


## :: f_object.get_objectname <- function(input_object) { ----
f_object.get_objectname <- function(input_object) {
  call <- match.call()
  input_object.name <- deparse(substitute(input_object))
  
  # Handle magrittr pipe (%>%) case where input becomes "."
  if (input_object.name == ".") {
    input_object.name <- as.character(call$input_object)
  }
  
  return(input_object.name)
}

tmp_object <- 42
f_object.get_objectname(tmp_object)
tmp_object |> f_object.get_objectname()
tmp_object %>% f_object.get_objectname()
# > tmp_object <- 42
# > f_object.get_objectname(tmp_object)
# [1] "tmp_object"
# > tmp_object |> f_object.get_objectname()
# [1] "tmp_object"
# > tmp_object %>% f_object.get_objectname()
# [1] "."


## :: f_object.get_objectname <- function(input_object) { ----
f_object.get_objectname <- function(input_object) {
  expr <- substitute(input_object)
  obj_name <- deparse(expr)
  
  if (obj_name == ".") {
    # Retrieve the parent call
    parent_call <- sys.call(-1)
    
    # Check if the parent call is a pipe operator
    if (is.call(parent_call) && (parent_call[[1]] == `%>%` || parent_call[[1]] == `|>`)) {
      # Extract the left-hand side of the pipe
      lhs <- parent_call[[2]]
      obj_name <- deparse(lhs)
    } else {
      obj_name <- "."
    }
  }
  
  return(obj_name)
}
tmp_object <- 42
f_object.get_objectname(tmp_object)
tmp_object |> f_object.get_objectname()
tmp_object %>% f_object.get_objectname()
# > f_object.get_objectname(tmp_object)
# [1] "tmp_object"
# > tmp_object |> f_object.get_objectname()
# [1] "tmp_object"
# > tmp_object %>% f_object.get_objectname()
# Error in parent_call[[1]] == `%>%` : 
#   comparison (==) is possible only for atomic and list types



## :: f_object.get_objectname <- function(input_object) { ----
f_object.get_objectname <- function(input_object) {
  # Capture the expression passed to the function
  obj_expr <- substitute(input_object)
  obj_name <- deparse(obj_expr)
  
  # Check if the function was called using the magrittr pipe (%>%)
  if (identical(obj_expr, quote(.))) {
    # Retrieve the parent call (the call to the pipe)
    parent_call <- sys.call(-1)
    
    # Extract the first argument from the parent call, which is the original object
    if (!is.null(parent_call)) {
      original_obj <- parent_call[[2]]
      obj_name <- deparse(original_obj)
    } else {
      obj_name <- "."
    }
  }
  
  return(obj_name)
}
tmp_object <- 42
f_object.get_objectname(tmp_object)
tmp_object |> f_object.get_objectname()
tmp_object %>% f_object.get_objectname()
# > f_object.get_objectname(tmp_object)
# [1] "tmp_object"
# > tmp_object |> f_object.get_objectname()
# [1] "tmp_object"
# > tmp_object %>% f_object.get_objectname()
# [1] "tmp_object"




##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#@ library(rlang) ====
## :: f_object.get_objectname_rlang <- function(input_object) { ----
f_object.get_objectname_rlang <- function(input_object) {
  # Capture the expression using rlang
  expr <- enquo(input_object)
  obj_name <- as_label(expr)
  
  # If the object is the placeholder '.', attempt to retrieve the original name
  if (obj_name == ".") {
    # Capture the parent frame's expression
    expr <- rlang::get_expr(enquo(input_object), parent = 1)
    obj_name <- as_label(expr)
  }
  
  return(obj_name)
}
tmp_object <- 42
f_object.get_objectname_rlang(tmp_object)
tmp_object |> f_object.get_objectname_rlang()
tmp_object %>% f_object.get_objectname_rlang()
# > f_object.get_objectname_rlang(tmp_object)
# [1] "tmp_object"
# > tmp_object |> f_object.get_objectname_rlang()
# [1] "tmp_object"
# > tmp_object %>% f_object.get_objectname_rlang()
# Error in rlang::get_expr(enquo(input_object), parent = 1) : 
#   unused argument (parent = 1)


## :: f_object.get_objectname_rlang <- function(input_object) { ----
f_object.get_objectname_rlang <- function(input_object) {
  # Capture the expression using rlang
  expr <- enquo(input_object)
  obj_name <- as_label(expr)
  
  # If the object is the placeholder '.', attempt to retrieve the original name
  if (obj_name == ".") {
    # Retrieve the caller's call (the piping call)
    parent_call <- rlang::caller_call()
    
    if (!is.null(parent_call)) {
      # Extract the first argument from the parent call, which is the original object
      original_obj <- parent_call[[2]]
      obj_name <- as_label(original_obj)
    } else {
      obj_name <- "."
    }
  }
  
  return(obj_name)
}
tmp_object <- 42
f_object.get_objectname_rlang(tmp_object)
tmp_object |> f_object.get_objectname_rlang()
tmp_object %>% f_object.get_objectname_rlang()
# > tmp_object <- 42
# > f_object.get_objectname_rlang(tmp_object)
# [1] "tmp_object"
# > tmp_object |> f_object.get_objectname_rlang()
# [1] "tmp_object"
# > tmp_object %>% f_object.get_objectname_rlang()
# [1] "."




## :: f_object.get_objectname_rlang <- function(input_object) { ----
f_object.get_objectname_rlang <- function(input_object) {
  # Capture the expression using rlang
  expr <- enquo(input_object)
  obj_name <- as_label(expr)
  
  # If the object is the placeholder '.', attempt to retrieve the original name
  if (obj_name == ".") {
    # Retrieve the caller's call (the piping call)
    parent_call <- rlang::caller_call()
    
    if (!is.null(parent_call)) {
      # Extract the first argument from the parent call, which is the original object
      original_obj <- parent_call[[2]]
      obj_name <- as_label(original_obj)
    } else {
      obj_name <- "."
    }
  }
  
  return(obj_name)
}

tmp_object <- 42
f_object.get_objectname_rlang(tmp_object)
tmp_object |> f_object.get_objectname_rlang()
tmp_object %>% f_object.get_objectname_rlang()
# > f_object.get_objectname_rlang(tmp_object)
# [1] "tmp_object"
# > tmp_object |> f_object.get_objectname_rlang()
# [1] "tmp_object"
# > tmp_object %>% f_object.get_objectname_rlang()
# [1] "."



#@ env1$env.internal.source.r ====
## :: f_objectname.size.write_rds.git_lfs_track_add_f ====  
# Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.dev.r
# Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.source-exported.r
# https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a 
# https://gemini.google.com/app/6d9de55c5c7085c6 



## :: f_object.get_objectname <- function(input_object, VERBOSE = isTRUE(getOption("verbose"))) { ----
f_object.get_objectname <- function(input_object, VERBOSE = isTRUE(getOption("verbose"))) {
    input_object.name <- deparse(substitute(input_object))
    if (input_object.name == ".") {
        warning('input_object.name == ',deparse(input_object.name),'   #@ sys.nframe() == ', sys.nframe(), "  \n", immediate. = TRUE)
        # if (VERBOSE) 1:sys.nframe() %>% set_names() %>% map(function(n) { deparse(substitute(input_object, parent.frame(n = n)))}) |> str(max.level = 2, give.attr = TRUE)
        if (VERBOSE) 0:sys.nframe() %>% set_names() %>% map(function(n) { ls(envir = sys.frame(which = n)) }) %>% dput()
        # message('-> Trying: ','deparse(substitute(input_object, parent.frame(n = 2)))')
        # input_object.name <- deparse(substitute(input_object, parent.frame(n = 2)))
        message('-> Trying: ','ls(envir = .GlobalEnv, all.names = TRUE) %>% set_names %>% map(get) %>% keep(function(object) identical(object, input_object)) %>% names')
        input_object.name = ls(envir = .GlobalEnv, all.names = TRUE) %>% set_names %>% map(get) %>% keep(function(object) identical(object, input_object)) %>% names
        if (length(input_object.name) > 1) {
            warning('length(input_object.name) > 1', "  \n", immediate. = TRUE)
            input_object.name %>% dput()
            if (any(!input_object.name %in% c(".", "input_object"))) {
                input_object.name = input_object.name[!input_object.name %in% c(".", "input_object")][1]
            } else {
                input_object.name = input_object.name[1]
            }
        }
        if (input_object.name %in% c(".", "input_object")) {
            warning('input_object.name == ',deparse(input_object.name),'   #@ sys.nframe() == ', sys.nframe())
            "Try using `|>` instead of` `%>%`, or provide a valid object." |> stop(call. = FALSE) |> tryCatch(error = function(e) message("stop: ", e)); return(invisible())
        }
    }
    return(input_object.name)
}
tmp <- 42
tmp_object <- 42
f_object.get_objectname(tmp_object)
tmp_object |> f_object.get_objectname()
tmp_object %>% f_object.get_objectname()

