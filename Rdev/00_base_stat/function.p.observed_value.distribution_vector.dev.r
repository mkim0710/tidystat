

function.n_ext.observed_value.distribution_vector = function(observed_value, distribution_vector, two.tailed = T) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.p.observed_value.distribution_vector.dev.r")
    if (two.tailed == T) {
        n_ext = sum( abs(distribution_vector) > abs(observed_value) )
    } else {
        stop("Sorry, only two tailed test implemented.")
    }
    n_ext
}

function.p.observed_value.distribution_vector = function(observed_value, distribution_vector, two.tailed = T) {
    # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.p.observed_value.distribution_vector.dev.r")
    if (two.tailed == T) {
        n_ext = sum( abs(distribution_vector) > abs(observed_value) )
    } else {
        stop("Sorry, only two tailed test implemented.")
    }
    out = n_ext / length(distribution_vector)
}

# function.p_n_ext.observed_value.distribution_vector = function(observed_value, distribution_vector, two.tailed = T) {
#     source("https://raw.githubusercontent.com/mkim0710/tidystat/master/function.p.observed_value.distribution_vector.dev.r")
#     if (two.tailed == T) {
#         n_ext = sum( abs(distribution_vector) > abs(observed_value) )
#     } else {
#         stop("Sorry, only two tailed test implemented.")
#     }
#     p = n_ext / length(distribution_vector)
#     out = list(p, n_ext)
#     out
# }

