# f_vec_lgl.all_not.dev.r

f_vec_lgl.all_not = function(vec_lgl) {
    all(!vec_lgl)
}

# vec_candidate4ID = c("ID", "var1", "var2", "var3", "var4")
# LETTERS
# vec_candidate4ID %in% LETTERS
# vec_lgl = vec_candidate4ID %in% LETTERS
vec_lgl = rep(TRUE, 3)
vec_lgl
!vec_lgl
any(vec_lgl)
any(!vec_lgl)
!any(vec_lgl)
!any(!vec_lgl)
all(vec_lgl)
all(!vec_lgl)
!all(vec_lgl)
!all(!vec_lgl)
# > vec_lgl
# [1] TRUE TRUE TRUE
# > !vec_lgl
# [1] FALSE FALSE FALSE
# > any(vec_lgl)
# [1] TRUE
# > any(!vec_lgl)
# [1] FALSE
# > !any(vec_lgl)
# [1] FALSE
# > !any(!vec_lgl)
# [1] TRUE
# > all(vec_lgl)
# [1] TRUE
# > all(!vec_lgl)
# [1] FALSE
# > !all(vec_lgl)
# [1] FALSE
# > !all(!vec_lgl)
# [1] TRUE


# vec_lgl = c(vec_candidate4ID, "A") %in% LETTERS
vec_lgl = c(TRUE, TRUE, FALSE)
vec_lgl
!vec_lgl
any(vec_lgl)
any(!vec_lgl)
!any(vec_lgl)
!any(!vec_lgl)
all(vec_lgl)
all(!vec_lgl)
!all(vec_lgl)
!all(!vec_lgl)
# > vec_lgl
# [1]  TRUE  TRUE FALSE
# > !vec_lgl
# [1] FALSE FALSE  TRUE
# > any(vec_lgl)
# [1] TRUE
# > any(!vec_lgl)
# [1] TRUE
# > !any(vec_lgl)
# [1] FALSE
# > !any(!vec_lgl)
# [1] FALSE
# > all(vec_lgl)
# [1] FALSE
# > all(!vec_lgl)
# [1] FALSE
# > !all(vec_lgl)
# [1] TRUE
# > !all(!vec_lgl)
# [1] TRUE


# @ !any(vec_lgl) and all(!vec_lgl) are identical in the sense that both return TRUE when all elements in vec_lgl are FALSE.  
# @ !any(!vec_lgl) and all(vec_lgl) are identical because both return TRUE when all elements in vec_lgl are TRUE.  

