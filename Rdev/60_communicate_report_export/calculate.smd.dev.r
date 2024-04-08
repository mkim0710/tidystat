
# https://en.wikipedia.org/wiki/Strictly_standardized_mean_difference


## https://en.wikipedia.org/wiki/Strictly_standardized_mean_difference
[@SMD_manual]
= ([@Group2mean]-[@Group1mean]) / ([@Group2sd]^2+[@Group1sd]^2) ^0.5

## https://en.wikipedia.org/wiki/Strictly_standardized_mean_difference
[@SMD_manual2]
= ([@Group2mean]-[@Group1mean]) / 
(
    (
        ([@n2]-1) * [@Group2sd]^2 + 
        ([@n1]-1) * [@Group1sd]^2
    ) * 2 / ([@n2]+[@n1]-3.48)
)^0.5


# https://en.wikipedia.org/wiki/Effect_size#Cohen's_d
[@Cohen_d]
= ([@Group2mean]-[@Group1mean]) / 
(
    (
        ([@n2]-1) * [@Group2sd]^2 + 
        ([@n1]-1) * [@Group1sd]^2
    ) 
    / ([@n2]+[@n1]-2)
)^0.5



# https://github.com/kaz-yos/tableone/blob/48edcec1998969774e1b9349bd4528689fe1b2ee/R/modules-smd.R
### Continuous/binary standardized mean differences
## Expects continuous or 0,1 binary variable
StdDiff <- function(variable, group, binary = FALSE, na.rm = TRUE) {

    ## Check strata for all NA strata
    logiAllNaStrata <- CheckNaOnlyStrata(variable, group)
    ## If ANY strata have only NA's do not remove NA's
    if (any(logiAllNaStrata)) {
        warning("Variable has only NA's in at least one stratum. na.rm turned off.")
        na.rm = FALSE
    }

    ## Proportion of 1 is the mean of variable
    means <- tapply(variable, group, mean, na.rm = na.rm)

    ## Variance is p(1-p)
    if (binary) {
        vars  <- means * (1 - means)
    } else {
        vars  <- tapply(variable, group, var, na.rm = na.rm)
    }

    ## Outer to obtain all pairwise differences
    meanDiffs  <- outer(X = means, Y = means, FUN = "-")
    ## Outer to obtain all pairwise variance mean
    varMeans   <- outer(X = vars, Y = vars, FUN = "+") / 2

    out <- meanDiffs / sqrt(varMeans)

    ## If mean difference is zero and variance is zero,
    ## only one constant exists across two groups.
    ## In this case, the SMD can be defined zero, rather than NaN from 0/0.
    out[is.na(out) & !is.na(meanDiffs) & (meanDiffs == 0) & !is.na(varMeans) & (varMeans == 0)] <- 0

    ## This lower.tri() approach is actually giving 2vs1, 3vs1, etc
    ## opposite of stated 1vs2, 1vs3. Only correct if abs() is used.
    abs(out[lower.tri(out)])
}



