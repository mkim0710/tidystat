# function.rz_transformation.source.r


function.Fisher_rz_Transform = function(r) {
    .5 * log ( (1+r)/(1-r) )
}

function.rz_diff = function(r1, r2, n1, n2 = NULL) {
    if(is.null(n2)) {
        n2 = n1
    }
    rz1 = .5 * log ( (1+r1)/(1-r1) )
    rz2 = .5 * log ( (1+r2)/(1-r2) )
    rz_diff = (rz1 - rz2) / ( 1/(n1-3) + 1/(n2-3) )^.5
}

