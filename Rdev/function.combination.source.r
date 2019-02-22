function.permutation = function(n, x) {
    return(factorial(n) / factorial(n-x))
}

function.combination = function(n, x) {
    return(factorial(n) / (factorial(x) * factorial(n-x)))
}

# #@ test -----
# function.permutation(4,0:4)
# function.combination(4,0:4)
# # > function.permutation(4,0:4)
# # [1]  1  4 12 24 24
# # > function.combination(4,0:4)
# # [1] 1 4 6 4 1
