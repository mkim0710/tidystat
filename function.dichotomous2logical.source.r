
# function.binary2numeric = function(x, binary2logical = F) {
#     # source("https://github.com/mkim0710/tidystat/raw/master/function.binary2numeric.source.r")
#     # caution) as.numeric(CategoricalVariable_3MoreLevels)
#     if (is.character(x)) {
#         x = as.factor(x)
#     }
#     if (length(levels(x)) == 2) {
#         if (binary2logical == T) {
#             warning(paste0(levels(x)[1], " is coded to FALSE & ", levels(x)[2], " is coded to TRUE"))
#         } else {
#             warning(paste0(levels(x)[1], " is coded to 0 & ", levels(x)[2], " is coded to 1"))
#         }
#         x = as.numeric(x) - 1
#     } else if (length(levels(x)) > 2) {
#         stop("length(levels(x)) > 2")
#     }
#     if (is.logical(x)) {
#         x = as.numeric(x)
#     }
#     if (binary2logical == T) {
#         x = as.logical(x)
#     }
#     x
# }
# 
# #@ test) function.binary2numeric() ----
# function.binary2numeric(c(T, F ,T))
# function.binary2numeric(c("A", "A", "B", "B", "A"))
# function.binary2numeric(c("A", "A", "B", "C", "A"))
# function.binary2numeric(c(T, F ,T), binary2logical = T)
# function.binary2numeric(c("A", "A", "B", "B", "A"), binary2logical = T)
# function.binary2numeric(c("A", "A", "B", "C", "A"), binary2logical = T)
# # > function.binary2numeric(c(T, F ,T))
# # [1] 1 0 1
# # > function.binary2numeric(c("A", "A", "B", "B", "A"))
# # [1] 0 0 1 1 0
# # Warning message:
# # In function.binary2numeric(c("A", "A", "B", "B", "A")) :
# #   A is coded to 0 & B is coded to 1
# # > function.binary2numeric(c("A", "A", "B", "C", "A"))
# # Error in function.binary2numeric(c("A", "A", "B", "C", "A")) : 
# #   length(levels(x)) > 2
# # > function.binary2numeric(c(T, F ,T), binary2logical = T)
# # [1]  TRUE FALSE  TRUE
# # > function.binary2numeric(c("A", "A", "B", "B", "A"), binary2logical = T)
# # [1] FALSE FALSE  TRUE  TRUE FALSE
# # Warning message:
# # In function.binary2numeric(c("A", "A", "B", "B", "A"), binary2logical = T) :
# #   A is coded to FALSE & B is coded to TRUE
# # > function.binary2numeric(c("A", "A", "B", "C", "A"), binary2logical = T)
# # Error in function.binary2numeric(c("A", "A", "B", "C", "A"), binary2logical = T) : 
# #   length(levels(x)) > 2




function.dichotomous2logical = function(x, dichotomous2integer = F) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.dichotomous2logical.source.r")
    # caution) as.numeric(CategoricalVariable_3MoreLevels)
    if (is.numeric(x)) {
        x = as.character(x)
    } 
    if (is.character(x)) {
        x = as.factor(x)
    }
    if (length(levels(x)) == 2) {
        if (dichotomous2integer == T) {
            warning(paste0(levels(x)[1], " is coded to 0 & ", levels(x)[2], " is coded to 1"))
        } else {
            warning(paste0(levels(x)[1], " is coded to FALSE & ", levels(x)[2], " is coded to TRUE"))
        }
        x = as.integer(x) - 1
    } else if (length(levels(x)) > 2) {
        stop("length(levels(x)) > 2")
    }
    if (dichotomous2integer == T) {
        x = as.integer(x)
    } else {
        x = as.logical(x) 
    }
    x
}

#@ test) function.binary2numeric() ----
function.dichotomous2logical(c(T, F ,T))
function.dichotomous2logical(c("A", "A", "B", "B", "A"))
function.dichotomous2logical(c("A", "A", "B", "C", "A"))
function.dichotomous2logical(c(T, F ,T), dichotomous2integer = T)
function.dichotomous2logical(c("A", "A", "B", "B", "A"), dichotomous2integer = T)
function.dichotomous2logical(c("A", "A", "B", "C", "A"), dichotomous2integer = T)
# > function.dichotomous2logical(c(T, F ,T))
# [1]  TRUE FALSE  TRUE
# > function.dichotomous2logical(c("A", "A", "B", "B", "A"))
# [1] FALSE FALSE  TRUE  TRUE FALSE
# Warning message:
# In function.dichotomous2logical(c("A", "A", "B", "B", "A")) :
#   A is coded to FALSE & B is coded to TRUE
# > function.dichotomous2logical(c("A", "A", "B", "C", "A"))
# Error in function.dichotomous2logical(c("A", "A", "B", "C", "A")) : 
#   length(levels(x)) > 2
# > function.dichotomous2logical(c(T, F ,T), dichotomous2integer = T)
# [1] 1 0 1
# > function.dichotomous2logical(c("A", "A", "B", "B", "A"), dichotomous2integer = T)
# [1] 0 0 1 1 0
# Warning message:
# In function.dichotomous2logical(c("A", "A", "B", "B", "A"), dichotomous2integer = T) :
#   A is coded to 0 & B is coded to 1
# > function.dichotomous2logical(c("A", "A", "B", "C", "A"), dichotomous2integer = T)
# Error in function.dichotomous2logical(c("A", "A", "B", "C", "A"), dichotomous2integer = T) : 
#   length(levels(x)) > 2


