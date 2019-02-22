# function.rz_transformation.source.r

function.Fisher_rz_Transform = function(r) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.rz_transformation.source.r")
    .5 * log ( (1+r)/(1-r) )
}

function.rz_diff = function(r1, r2, n1, n2 = NULL) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.rz_transformation.source.r")
    if(is.null(n2)) {
        n2 = n1
    }
    rz1 = .5 * log ( (1+r1)/(1-r1) )
    rz2 = .5 * log ( (1+r2)/(1-r2) )
    rz_diff = (rz1 - rz2) / ( 1/(n1-3) + 1/(n2-3) )^.5
}


function.artanh = function(r) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.rz_transformation.source.r")
    .5 * log ( (1+r)/(1-r) )
}

function.r1_r2.zstat = function(r1, r2, n1, n2 = NULL) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.rz_transformation.source.r")
    if(is.null(n2)) {
        n2 = n1
    }
    r1.artanh = .5 * log ( (1+r1)/(1-r1) )
    r2.artanh = .5 * log ( (1+r2)/(1-r2) )
    zstat = (r1.artanh - r2.artanh) / ( 1/(n1-3) + 1/(n2-3) )^.5
}


n1 = n2 = 10^2
1/(n1-3)
( 1/(n1-3) + 1/(n2-3) )^.5
1/( 1/(n1-3) + 1/(n2-3) )^.5
# > n1 = n2 = 10^2
# > 1/(n1-3)
# [1] 0.01030928
# > ( 1/(n1-3) + 1/(n2-3) )^.5
# [1] 0.1435916
# > 1/( 1/(n1-3) + 1/(n2-3) )^.5
# [1] 6.964194

n1 = n2 = 10^3
1/(n1-3)
( 1/(n1-3) + 1/(n2-3) )^.5
1/( 1/(n1-3) + 1/(n2-3) )^.5
# > n1 = n2 = 10^3
# > 1/(n1-3)
# [1] 0.001003009
# > ( 1/(n1-3) + 1/(n2-3) )^.5
# [1] 0.04478859
# > 1/( 1/(n1-3) + 1/(n2-3) )^.5
# [1] 22.32711

n1 = n2 = 10^4
1/(n1-3)
( 1/(n1-3) + 1/(n2-3) )^.5
1/( 1/(n1-3) + 1/(n2-3) )^.5
# > n1 = n2 = 10^4
# > 1/(n1-3)
# [1] 0.00010003
# > ( 1/(n1-3) + 1/(n2-3) )^.5
# [1] 0.01414426
# > 1/( 1/(n1-3) + 1/(n2-3) )^.5
# [1] 70.70007

n1 = n2 = 10^5
1/(n1-3)
( 1/(n1-3) + 1/(n2-3) )^.5
1/( 1/(n1-3) + 1/(n2-3) )^.5
# > n1 = n2 = 10^5
# > 1/(n1-3)
# [1] 1.00003e-05
# > ( 1/(n1-3) + 1/(n2-3) )^.5
# [1] 0.004472203
# > 1/( 1/(n1-3) + 1/(n2-3) )^.5
# [1] 223.6034


