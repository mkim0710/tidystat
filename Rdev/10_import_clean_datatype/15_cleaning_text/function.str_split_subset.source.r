# function.str_split_subset.source.r


"a/b" %>% str_split("/") %>% str #----
c("a/b", "c/a", "b", "a") %>% str_split("/") %>% str #----
c("a/b", "c/a", "b", "a") %>% str_split("/") %>% map(str_match,"a") %>% str #----
c("a/b", "c/a", "b", "a") %>% str_split("/") %>% map(str_match_all,"a") %>% str #----
c("a/b", "c/a", "b", "a") %>% str_split("/") %>% map(str_match_all,"a") %>% map(unlist) %>% str #----
c("a/b", "c/a", "b", "a") %>% str_split("/") %>% map(str_subset,"a") %>% str #----
c("a/b", "c/a", "b", "a") %>% str_split("/") %>% map(str_subset,"^(?!.*a)") %>% str #----
# > "a/b" %>% str_split("/") %>% str #----
# List of 1
#  $ : chr [1:2] "a" "b"
# > c("a/b", "c/a", "b", "a") %>% str_split("/") %>% str #----
# List of 4
#  $ : chr [1:2] "a" "b"
#  $ : chr [1:2] "c" "a"
#  $ : chr "b"
#  $ : chr "a"
# > c("a/b", "c/a", "b", "a") %>% str_split("/") %>% map(str_match,"a") %>% str #----
# List of 4
#  $ : chr [1:2, 1] "a" NA
#  $ : chr [1:2, 1] NA "a"
#  $ : chr [1, 1] NA
#  $ : chr [1, 1] "a"
# > c("a/b", "c/a", "b", "a") %>% str_split("/") %>% map(str_subset,"a") %>% str #----
# List of 4
#  $ : chr "a"
#  $ : chr "a"
#  $ : chr(0) 
#  $ : chr "a"
# > c("a/b", "c/a", "b", "a") %>% str_split("/") %>% map(str_subset,"^(?!.*a)") %>% str #----
# List of 4
#  $ : chr "b"
#  $ : chr "c"
#  $ : chr "b"
#  $ : chr(0) 


#@ end ----
