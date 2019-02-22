# list_list.to.data_frame.source.r

# cf) https://github.com/mkim0710/tidystat/blob/master/R/function.pairwise.data_frame.source.r
# cf) https://github.com/mkim0710/tidystat/blob/master/R/list_list.to.data_frame.source.r


list_list.to.matrix = function(list_list, type = "list_list[[Col.index]][[Row.index]]") {
    # source("https://github.com/mkim0710/tidystat/raw/master/list_list.to.data_frame.source.r")
    if (type == "list_list[[Col.index]][[Row.index]]") {
        out = simplify2array(list_list)
    } else if (type == "list_list[[Row.index]][[Col.index]]") {
        out = t(simplify2array(list_list))
    } else {
        stop("Please specify type: either list_list[[Col.index]][[Row.index]] or list_list[[Row.index]][[Col.index]]")
    }
    out2 = unlist(out)
    dim(out2) = dim(out)
    dimnames(out2) = dimnames(out)
    out2
}


# #@ test) list_list.to.matrix() ----------
# list_list = map(1:3, function(j) {
#     out = map(1:2, function(i) {
#         paste0("R", i, "C", j)
#     })
#     # names(out) = paste0("Row", 1:length(out))
#     names(out) = paste0("Child", 1:length(out))
#     out
# })
# # names(list_list) = paste0("Col", 1:length(list_list))
# names(list_list) = paste0("Parent", 1:length(list_list))
# list_list
# # > list_list
# # $Parent1
# # $Parent1$Child1
# # [1] "R1C1"
# # 
# # $Parent1$Child2
# # [1] "R2C1"
# # 
# # 
# # $Parent2
# # $Parent2$Child1
# # [1] "R1C2"
# # 
# # $Parent2$Child2
# # [1] "R2C2"
# # 
# # 
# # $Parent3
# # $Parent3$Child1
# # [1] "R1C3"
# # 
# # $Parent3$Child2
# # [1] "R2C3"
# 
# 
# list_list.to.matrix(list_list)
# list_list.to.matrix(list_list, type = "list_list[[Row.index]][[Col.index]]")
# # > list_list.to.matrix(list_list)
# #        Parent1 Parent2 Parent3
# # Child1 "R1C1"  "R1C2"  "R1C3" 
# # Child2 "R2C1"  "R2C2"  "R2C3" 
# # > list_list.to.matrix(list_list, type = "list_list[[Row.index]][[Col.index]]")
# #         Child1 Child2
# # Parent1 "R1C1" "R2C1"
# # Parent2 "R1C2" "R2C2"
# # Parent3 "R1C3" "R2C3"


list_list.to.data_frame = function(list_list, type = "list_list[[Col.index]][[Row.index]]") {
    # source("https://github.com/mkim0710/tidystat/raw/master/list_list.to.data_frame.source.r")
    if (type == "list_list[[Col.index]][[Row.index]]") {
        out = simplify2array(list_list)
    } else if (type == "list_list[[Row.index]][[Col.index]]") {
        out = t(simplify2array(list_list))
    } else {
        stop("Please specify type: either list_list[[Col.index]][[Row.index]] or list_list[[Row.index]][[Col.index]]")
    }
    out2 = unlist(out)
    dim(out2) = dim(out)
    dimnames(out2) = dimnames(out)
    out2 = out2 %>% as.data.frame %>% rownames_to_column %>% as_data_frame
    out2
}

# #@ test) list_list.to.data_frame() ----------
# list_list.to.data_frame(list_list)
# list_list.to.data_frame(list_list, type = "list_list[[Row.index]][[Col.index]]")
# # > list_list.to.data_frame(list_list)
# # # A tibble: 2 x 4
# #   rowname Parent1 Parent2 Parent3
# #     <chr>  <fctr>  <fctr>  <fctr>
# # 1  Child1    R1C1    R1C2    R1C3
# # 2  Child2    R2C1    R2C2    R2C3
# # > list_list.to.data_frame(list_list, type = "list_list[[Row.index]][[Col.index]]")
# # # A tibble: 3 x 3
# #   rowname Child1 Child2
# #     <chr> <fctr> <fctr>
# # 1 Parent1   R1C1   R2C1
# # 2 Parent2   R1C2   R2C2
# # 3 Parent3   R1C3   R2C3





#@ outer(i, j, function(i, j) {}) ============
library(tidyverse)
outer(c("A","B"), 1:3, paste0)
outer(c("A","B"), 1:3, paste0) %>% as.vector
# > outer(c("A","B"), 1:3, paste0)
#      [,1] [,2] [,3]
# [1,] "A1" "A2" "A3"
# [2,] "B1" "B2" "B3"
# > outer(c("A","B"), 1:3, paste0) %>% as.vector
# [1] "A1" "B1" "A2" "B2" "A3" "B3"

outer(1:2, 1:3, function(i, j) {paste0("R", i, "C", j)})
outer(1:2, 1:3, function(i, j) {paste0("R", i, "C", j)}) %>% as.vector
# > outer(1:2, 1:3, function(i, j) {
# +     paste0("R", i, "C", j)
# + })
#      [,1]   [,2]   [,3]
# [1,] "R1C1" "R1C2" "R1C3"
# [2,] "R2C1" "R2C2" "R2C3"
# > outer(1:2, 1:3, function(i, j) {paste0("R", i, "C", j)}) %>% as.vector
# [1] "R1C1" "R2C1" "R1C2" "R2C2" "R1C3" "R2C3"



#@ end -----



