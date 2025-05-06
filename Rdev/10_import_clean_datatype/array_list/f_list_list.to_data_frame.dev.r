# f_list_list.to_data_frame.dev.r
# --> Now included in "f_df.t.tribble_construct.source.r"

# cf) https://github.com/mkim0710/tidystat/blob/master/R/function.pairwise.data_frame.dev.r
# cf) https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/array_list/f_list_list.to_data_frame.dev.r
# cf) https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/array_list/f_matrix.to_list_list.dev.r

f_list_list.to_matrix = function(list_list, type = "list_list[[indexColumn]][[indexRow]]") {
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


# #@ test) f_list_list.to_matrix() ----------  
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
# f_list_list.to_matrix(list_list)
# f_list_list.to_matrix(list_list, type = "list_list[[indexRow]][[indexColumn]]")
# # > f_list_list.to_matrix(list_list)
# #        Parent1 Parent2 Parent3
# # Child1 "R1C1"  "R1C2"  "R1C3" 
# # Child2 "R2C1"  "R2C2"  "R2C3" 
# # > f_list_list.to_matrix(list_list, type = "list_list[[indexRow]][[indexColumn]]")
# #         Child1 Child2
# # Parent1 "R1C1" "R2C1"
# # Parent2 "R1C2" "R2C2"
# # Parent3 "R1C3" "R2C3"


f_list_list.to_data_frame = function(list_list, type = "list_list[[indexColumn]][[indexRow]]") {
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

# #@ test) f_list_list.to_data_frame() ----------  
# f_list_list.to_data_frame(list_list)
# f_list_list.to_data_frame(list_list, type = "list_list[[indexRow]][[indexColumn]]")
# # > f_list_list.to_data_frame(list_list)
# # # A tibble: 2 x 4
# #   rowname Parent1 Parent2 Parent3
# #     <chr>  <fctr>  <fctr>  <fctr>
# # 1  Child1    R1C1    R1C2    R1C3
# # 2  Child2    R2C1    R2C2    R2C3
# # > f_list_list.to_data_frame(list_list, type = "list_list[[indexRow]][[indexColumn]]")
# # # A tibble: 3 x 3
# #   rowname Child1 Child2
# #     <chr> <fctr> <fctr>
# # 1 Parent1   R1C1   R2C1
# # 2 Parent2   R1C2   R2C2
# # 3 Parent3   R1C3   R2C3





## @ outer(i, j, function(i, j) {}) ============  
.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
outer(1:2, c("A","B","C"), function(.x, .y) paste0(.y, .x))
outer(1:2, c("A","B","C"), function(.x, .y) paste0(.y, .x)) |> as.vector()
# > outer(1:2, c("A","B","C"), function(.x, .y) paste0(.y, .x))
#      [,1] [,2] [,3]
# [1,] "A1" "B1" "C1"
# [2,] "A2" "B2" "C2"
# > outer(1:2, c("A","B","C"), function(.x, .y) paste0(.y, .x)) |> as.vector()
# [1] "A1" "A2" "B1" "B2" "C1" "C2"

outer(1:2, 1:3, function(i, j) {paste0("R", i, "C", j)})
outer(1:2, 1:3, function(i, j) {paste0("R", i, "C", j)}) |> as.vector()
# > outer(1:2, 1:3, function(i, j) {
# +     paste0("R", i, "C", j)
# + })
#      [,1]   [,2]   [,3]
# [1,] "R1C1" "R1C2" "R1C3"
# [2,] "R2C1" "R2C2" "R2C3"
# > outer(1:2, 1:3, function(i, j) {paste0("R", i, "C", j)}) |> as.vector()
# [1] "R1C1" "R2C1" "R1C2" "R2C2" "R1C3" "R2C3"


input_matrix = outer(1:2, 1:3, function(i, j) {paste0("R", i, "C", j)})
if (is.null(rownames(input_matrix))) {
    rownames(input_matrix) = paste0("R", 1:nrow(input_matrix))
}
if (is.null(colnames(input_matrix))) {
    colnames(input_matrix) = paste0("C", 1:ncol(input_matrix))
}
input_matrix
input_matrix |> str(max.level = 2, give.attr = TRUE)
# > input_matrix
#    C1     C2     C3    
# R1 "R1C1" "R1C2" "R1C3"
# R2 "R2C1" "R2C2" "R2C3"
# > input_matrix |> str(max.level = 2, give.attr = TRUE)
#  chr [1:2, 1:3] "R1C1" "R2C1" "R1C2" "R2C2" "R1C3" "R2C3"
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:2] "R1" "R2"
#   ..$ : chr [1:3] "C1" "C2" "C3"
  
# __________|------  
# 〚〛 END-----  



