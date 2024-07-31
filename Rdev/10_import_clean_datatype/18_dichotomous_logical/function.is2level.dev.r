function.is2level = function(x) {
    # caution) as.numeric(CategoricalVariable_3MoreLevels)
    if (is.logical(x)) {
        x = as.numeric(x)
    } 
    if (is.numeric(x)) {
        x = as.character(x)
    }
    if (is.character(x)) {
        x = as.factor(x)
    }
    out = F
    if (length(levels(x)) == 2) {
        out = T
    } else if (length(levels(x)) > 2) {
        print("error - length(levels(x)) > 2")
    } else if (length(levels(x)) < 2) {
        print("error - length(levels(x)) < 2")
    }
    out
}

#@ test) function.is2level() ----  
# > function.is2level(T)
# [1] "error - length(levels(x)) < 2"
# [1] FALSE
# > function.is2level(c(T, F ,T))
# [1] TRUE
# > function.is2level(c("A", "A", "B", "B", "A"))
# [1] TRUE
# > function.is2level(c("A", "A", "B", "C", "A"))
# [1] "error - length(levels(x)) > 2"
# [1] FALSE
