# f_matrix.to_list_list.dev.r
# --> Now included in "f_df.t.tribble_construct.source.r"

# cf) https://github.com/mkim0710/tidystat/blob/master/R/function.pairwise.data_frame.dev.r
# cf) https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/array_list/f_list_list.to_data_frame.dev.r
# cf) https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/array_list/f_matrix.to_list_list.dev.r


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
input_matrix %>% str
# > input_matrix
#    C1     C2     C3    
# R1 "R1C1" "R1C2" "R1C3"
# R2 "R2C1" "R2C2" "R2C3"
# > input_matrix %>% str
#  chr [1:2, 1:3] "R1C1" "R2C1" "R1C2" "R2C2" "R1C3" "R2C3"
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:2] "R1" "R2"
#   ..$ : chr [1:3] "C1" "C2" "C3"

input_matrix %>% as.data.frame %>% map(as.list) %>% map(set_names, rownames(input_matrix)) %>% str
# > input_matrix %>% as.data.frame %>% map(as.list) %>% map(set_names, rownames(input_matrix)) %>% str
# List of 3
#  $ C1:List of 2
#   ..$ R1: chr "R1C1"
#   ..$ R2: chr "R2C1"
#  $ C2:List of 2
#   ..$ R1: chr "R1C2"
#   ..$ R2: chr "R2C2"
#  $ C3:List of 2
#   ..$ R1: chr "R1C3"
#   ..$ R2: chr "R2C3"

f_matrix.to_list_list = function(input_matrix = outer(1:2, 1:3, function(i, j) {paste0("R", i, "C", j)}), type = "list_list[[indexColumn]][[indexRow]]") {
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

input_matrix %>% f_matrix.to_list_list %>% str
input_matrix %>% f_matrix.to_list_list(type = "list_list[[indexRow]][[indexColumn]]") %>% str
# > input_matrix %>% f_matrix.to_list_list %>% str
# List of 3
#  $ C1:List of 2
#   ..$ R1: chr "R1C1"
#   ..$ R2: chr "R2C1"
#  $ C2:List of 2
#   ..$ R1: chr "R1C2"
#   ..$ R2: chr "R2C2"
#  $ C3:List of 2
#   ..$ R1: chr "R1C3"
#   ..$ R2: chr "R2C3"
# > input_matrix %>% f_matrix.to_list_list(type = "list_list[[indexRow]][[indexColumn]]") %>% str
# List of 2
#  $ R1:List of 3
#   ..$ C1: chr "R1C1"
#   ..$ C2: chr "R1C2"
#   ..$ C3: chr "R1C3"
#  $ R2:List of 3
#   ..$ C1: chr "R2C1"
#   ..$ C2: chr "R2C2"
#   ..$ C3: chr "R2C3"
