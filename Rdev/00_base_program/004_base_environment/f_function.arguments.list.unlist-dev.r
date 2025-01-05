# https://chatgpt.com/c/677abf75-ede0-800e-a5df-0ea2502c564c



# Function using c(...)
f.c <- function(...) {
  c(...)
}

# Function using list(...)
f.list <- function(...) {
  list(...)
}

# Function using unlist(list(...))
f.list.unlist <- function(...) {
  unlist(list(...))
}


f.list.do.call <- function(...) {
  do.call(paste, list(...))
}


# Function using ...
f. <- function(...) {
  return(...)
}


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# 1. Pass simple character vectors ----
f.c(c("a", "b"), "c") %>% dput
f.list(c("a", "b"), "c") %>% dput
f.list.unlist(c("a", "b"), "c") %>% dput
f.list.do.call(c("a", "b"), "c") %>% dput
f.(c("a", "b"), "c") %>% dput
# > f.c(c("a", "b"), "c") %>% dput
# c("a", "b", "c")
# > f.list(c("a", "b"), "c") %>% dput
# list(c("a", "b"), "c")
# > f.list.unlist(c("a", "b"), "c") %>% dput
# c("a", "b", "c")
# > f.list.do.call(c("a", "b"), "c") %>% dput
# c("a c", "b c")
# > f.(c("a", "b"), "c") %>% dput
# Error in f.(c("a", "b"), "c") : '...' used in an incorrect context


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# 2. Passing a list as one argument -----
# Note: The first argument is a list with elements "a" and "b"
f.c(list("a", "b"), "c") %>% dput
f.list(list("a", "b"), "c") %>% dput
f.list.unlist(list("a", "b"), "c") %>% dput
f.list.do.call(list("a", "b"), "c") %>% dput
f.(list("a", "b"), "c") %>% dput
# > f.c(list("a", "b"), "c") %>% dput
# list("a", "b", "c")
# > f.list(list("a", "b"), "c") %>% dput
# list(list("a", "b"), "c")
# > f.list.unlist(list("a", "b"), "c") %>% dput
# c("a", "b", "c")
# > f.list.do.call(list("a", "b"), "c") %>% dput
# c("a c", "b c")
# > f.(list("a", "b"), "c") %>% dput
# Error in f.(list("a", "b"), "c") : '...' used in an incorrect context


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# 3. Multiple list arguments ----
f.c(list("a", "b"), list("x", "y")) %>% dput
f.list(list("a", "b"), list("x", "y")) %>% dput
f.list.unlist(list("a", "b"), list("x", "y")) %>% dput
f.list.do.call(list("a", "b"), list("x", "y")) %>% dput
f.(list("a", "b"), list("x", "y")) %>% dput
# > f.c(list("a", "b"), list("x", "y")) %>% dput
# list("a", "b", "x", "y")
# > f.list(list("a", "b"), list("x", "y")) %>% dput
# list(list("a", "b"), list("x", "y"))
# > f.list.unlist(list("a", "b"), list("x", "y")) %>% dput
# c("a", "b", "x", "y")
# > f.list.do.call(list("a", "b"), list("x", "y")) %>% dput
# c("a x", "b y")
# > f.(list("a", "b"), list("x", "y")) %>% dput
# Error in f.(list("a", "b"), list("x", "y")) : 
#   '...' used in an incorrect context
