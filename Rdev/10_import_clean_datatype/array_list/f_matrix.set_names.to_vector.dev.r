# f_matrix.set_names.to_vector.dev.r
# --> Now included in "f_df.t.tribble_construct.source.r"

matrix(1:6, nrow = 2)
# > matrix(1:6, nrow = 2)
#      [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

matrix(nrow = 2, ncol = 3)
matrix(0, nrow = 2, ncol = 3)
# > matrix(nrow = 2, ncol = 3)
#      [,1] [,2] [,3]
# [1,]   NA   NA   NA
# [2,]   NA   NA   NA
# > matrix(0, nrow = 2, ncol = 3)
#      [,1] [,2] [,3]
# [1,]    0    0    0
# [2,]    0    0    0

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

input_matrix %>% as.vector
# > input_matrix %>% as.vector
# [1] "R1C1" "R2C1" "R1C2" "R2C2" "R1C3" "R2C3"


input_matrix = matrix(0, nrow = 2, ncol = 3)
if (is.null(rownames(input_matrix))) {
    rownames(input_matrix) = paste0("R", 1:nrow(input_matrix))
}
if (is.null(colnames(input_matrix))) {
    colnames(input_matrix) = paste0("C", 1:ncol(input_matrix))
}
input_matrix
input_matrix %>% str
# > input_matrix
#    C1 C2 C3
# R1  0  0  0
# R2  0  0  0
# > input_matrix %>% str
#  num [1:2, 1:3] 0 0 0 0 0 0
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:2] "R1" "R2"
#   ..$ : chr [1:3] "C1" "C2" "C3"


input_matrix %>% set_names(outer(rownames(.), colnames(.), paste0))
input_matrix %>% set_names(outer(rownames(.), colnames(.), paste0)) %>% str
# > input_matrix %>% set_names(outer(rownames(.), colnames(.), paste0))
#    C1 C2 C3
# R1  0  0  0
# R2  0  0  0
# attr(,"names")
# [1] "R1C1" "R2C1" "R1C2" "R2C2" "R1C3" "R2C3"
# > input_matrix %>% set_names(outer(rownames(.), colnames(.), paste0)) %>% str
#  num [1:2, 1:3] 0 0 0 0 0 0
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:2] "R1" "R2"
#   ..$ : chr [1:3] "C1" "C2" "C3"
#  - attr(*, "names")= chr [1:6] "R1C1" "R2C1" "R1C2" "R2C2" ...


f_matrix.set_names = function(input_matrix) {
    if (is.null(rownames(input_matrix))) {
        rownames(input_matrix) = paste0("R", 1:nrow(input_matrix))
    }
    if (is.null(colnames(input_matrix))) {
        colnames(input_matrix) = paste0("C", 1:ncol(input_matrix))
    }
    input_matrix %>% set_names(outer(rownames(.), colnames(.), paste0))
}

matrix(0, nrow = 2, ncol = 3) %>% f_matrix.set_names()
# > matrix(0, nrow = 2, ncol = 3) %>% f_matrix.set_names()
#    C1 C2 C3
# R1  0  0  0
# R2  0  0  0
# attr(,"names")
# [1] "R1C1" "R2C1" "R1C2" "R2C2" "R1C3" "R2C3"

matrix(0, nrow = 2, ncol = 3) %>% f_matrix.set_names() %>% dput.deparse.cat0()
# > matrix(0, nrow = 2, ncol = 3) %>% f_matrix.set_names() %>% dput.deparse.cat0()
# structure(c(R1C1 = 0, R2C1 = 0, R1C2 = 0, R2C2 = 0, R1C3 = 0, R2C3 = 0), dim = 2:3, dimnames = list(c("R1", "R2"), c("C1", "C2", "C3")))  

matrix(0, nrow = 2, ncol = 3) %>% f_matrix.set_names() %>% as.vector
matrix(0, nrow = 2, ncol = 3) %>% f_matrix.set_names() %>% c
# > matrix(0, nrow = 2, ncol = 3) %>% f_matrix.set_names() %>% as.vector
# [1] 0 0 0 0 0 0
# > matrix(0, nrow = 2, ncol = 3) %>% f_matrix.set_names() %>% c
# R1C1 R2C1 R1C2 R2C2 R1C3 R2C3 
#    0    0    0    0    0    0 


f_matrix.set_names.to_vector = function(input_matrix) {
    if (is.null(rownames(input_matrix))) {
        rownames(input_matrix) = paste0("R", 1:nrow(input_matrix))
    }
    if (is.null(colnames(input_matrix))) {
        colnames(input_matrix) = paste0("C", 1:ncol(input_matrix))
    }
    # input_matrix %>% set_names(outer(rownames(.), colnames(.), paste0)) %>% as.vector()
    input_matrix %>% set_names(outer(rownames(.), colnames(.), paste0)) %>% c()
}


matrix(0, nrow = 2, ncol = 3) %>% f_matrix.set_names.to_vector()
# > matrix(0, nrow = 2, ncol = 3) %>% f_matrix.set_names.to_vector()
# R1C1 R2C1 R1C2 R2C2 R1C3 R2C3 
#    0    0    0    0    0    0 


