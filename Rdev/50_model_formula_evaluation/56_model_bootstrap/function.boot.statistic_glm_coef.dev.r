# function.boot.statistic_glm_coef.dev.r

# https://www.statmethods.net/advstats/bootstrapping.html
# https://www.datacamp.com/community/tutorials/bootstrap-r
# https://stats.idre.ucla.edu/r/library/r-library-introduction-to-bootstrapping/


function.boot.statistic_glm_coef = function(data, index, glm.formula, glm.weights = NULL, coef.exp = F, ...) {
    # https://github.com/mkim0710/tidystat/blob/master/Rdev/50_model_formula_evaluation/56_model_bootstrap/function.boot.statistic_glm_coef.dev.r
    
    # The boot() function calls the statistic function R times. (The first argument should be data & the second argument should be indices?)
    # A function that produces the k statistics to be bootstrapped (k=1 if bootstrapping a single statistic). 
    # The function should include an indices parameter that the boot() function can use to select cases for each replication (see the examples in the text).
    # If there is a set of statistics (for example, a set of regression coefficients), the function should return a vector.
    
    data.resampled = data[index, ]  # allows boot to select sample 
    
    fit = glm(formula = glm.formula, family = binomial, data = data.resampled, weights = glm.weights)

    if (coef.exp) {
        out = exp(coef(fit))
    } else {
        out = coef(fit)
    }
    out
}


library(boot)
data = analyticDF2797.ipw.PersonTime7 %>% select(Dk_plus1, Exposure, k, StabilizedWeight)
glm.formula = Dk_plus1 ~ Exposure * (k + I(k^2))
glm.weights = data$StabilizedWeight
nIteration = 1000  # 4Mb for 10 iterations -> 400Mb for 1000 iterations?
set.seed(1)
.t0 = Sys.time()
boot.output = boot(
    data = data
    , statistic = function.boot.statistic_glm_coef, glm.formula = glm.formula,  glm.weights = glm.weights, coef.exp = T
    , R = nIteration
)
Sys.time() - .t0  # 9 sec for 10 iterations -> 9000/60/60 sec = 2.5 hrs for 1000 iterations? 
warnings()
# There were 50 or more warnings (use warnings() to see the first 50)
# > Sys.time() - .t0
# Time difference of 7.798909 mins
# > warnings()
# Warning messages:
# 1: In eval(family$initialize) : non-integer #successes in a binomial glm!


boot.output$t0
boot.output %>% {set_names(as_tibble(.$t), nm = names(.$t0))} %>% map_dbl(mean)
boot.output
boot.output |> str() #----
# > boot.output$t0
#     (Intercept)        Exposure               k          I(k^2)      Exposure:k Exposure:I(k^2) 
#     0.009855443     0.332824553     0.895475841     1.004014857     1.038979833     0.999527466 
# > boot.output %>% {set_names(as_tibble(.$t), nm = names(.$t0))} %>% map_dbl(mean)
#     (Intercept)        Exposure               k          I(k^2)      Exposure:k Exposure:I(k^2) 
#     0.009775713     0.356738876     0.895381173     1.004016970     1.042598056     0.999451570
# > boot.output
# 
# ORDINARY NONPARAMETRIC BOOTSTRAP
# 
# 
# Call:
# boot(data = data, statistic = function.boot.statistic_glm_coef, 
#     R = nIteration, glm.formula = glm.formula, glm.weights = glm.weights, 
#     coef.exp = T)
# 
# 
# Bootstrap Statistics :
#        original        bias     std. error
# t1* 0.009855443 -7.972915e-05 0.0007487581
# t2* 0.332824553  2.391432e-02 0.1027704698
# t3* 0.895475841 -9.466814e-05 0.0044124618
# t4* 1.004014857  2.112864e-06 0.0001328992
# t5* 1.038979833  3.618223e-03 0.0203703832
# t6* 0.999527466 -7.589608e-05 0.0003991006
# > boot.output |> str() #----  
# List of 11
#  $ t0       : Named num [1:6] 0.00986 0.33282 0.89548 1.00401 1.03898 ...
#   ..- attr(*, "names")= chr [1:6] "(Intercept)" "Exposure" "k" "I(k^2)" ...
#  $ t        : num [1:1000, 1:6] 0.0098 0.00833 0.00996 0.00873 0.00927 ...
#  $ R        : num 1000
#  $ data     :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	95932 obs. of  4 variables:
#   ..$ Dk_plus1        : logi [1:95932] FALSE FALSE FALSE FALSE FALSE FALSE ...
#   ..$ Exposure        : num [1:95932] 0 0 0 0 0 0 0 0 0 0 ...
#   ..$ k               : num [1:95932] 0 1 2 3 4 5 6 7 8 9 ...
#   ..$ StabilizedWeight: num [1:95932] 0.95 0.95 0.95 0.95 0.95 ...
#  $ seed     : int [1:626] 403 624 -169270483 -442010614 -603558397 -222347416 1489374793 865871222 1734802815 98005428 ...
#  $ statistic:function (data, index, glm.formula, glm.weights = NULL, coef.exp = F, ...)  
#   ..- attr(*, "srcref")=Class 'srcref'  atomic [1:8] 1 36 16 1 36 1 1 16
#   .. .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0xe4ffe38> 
#  $ sim      : chr "ordinary"
#  $ call     : language boot(data = data, statistic = function.boot.statistic_glm_coef, R = nIteration, glm.formula = glm.formula,      g| __truncated__
#  $ stype    : chr "i"
#  $ strata   : num [1:95932] 1 1 1 1 1 1 1 1 1 1 ...
#  $ weights  : num [1:95932] 1.04e-05 1.04e-05 1.04e-05 1.04e-05 1.04e-05 ...
#  - attr(*, "class")= chr "boot"
#  - attr(*, "boot_type")= chr "boot"



# boot.output.ci = boot.output %>% boot.ci(type = "bca", index = 2) #----  
# # > boot.out %>% boot.ci(type = "bca") #----  
# # Error: cannot allocate vector of size 68.6 Gb

boot.output.ci = boot.output %>% boot.ci(type = "perc", index = 2) #----
boot.output.ci
# > boot.output.ci
# BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
# Based on 1000 bootstrap replicates
# 
# CALL : 
# boot.ci(boot.out = ., type = "perc", index = 2)
# 
# Intervals : 
# Level     Percentile     
# 95%   ( 0.1826,  0.5773 )  
# Calculations and Intervals on Original Scale


boot.output.ci |> str(max.level = 2, give.attr = TRUE)
# > boot.output.ci |> str(max.level = 2, give.attr = TRUE)
# List of 4
#  $ R      : int 1000
#  $ t0     : Named num 0.333
#   ..- attr(*, "names")= chr "Exposure"
#  $ call   : language boot.ci(boot.out = ., type = "perc", index = 2)
#  $ percent: num [1, 1:5] 0.95 25.03 975.98 0.183 0.577
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : NULL
#   .. ..$ : chr [1:5] "conf" "" "" "" ...
#  - attr(*, "class")= chr "bootci"



# boot_bootfuns.q at master · cran_boot.pdf ====  

# boot.ci <- function(boot.out,conf = 0.95,type = "all",
#                     index = 1L:min(2L, length(boot.out$t0)),
#                     var.t0 = NULL ,var.t = NULL, t0 = NULL, t = NULL,
#                     L = NULL, h = function(t) t,
#                     hdot = function(t) rep(1, length(t)),
#                     hinv = function(t) t, ...)
# (...)
# if (is.null(t)) {
#     if (length(index) == 1L) {
#         t0 <- boot.out$t0[index]
#         t <- boot.out$t[,index]
#     }
#     else if (ncol(boot.out$t)<max(index)) {
#         warning("index out of bounds; minimum index only used.")
#         index <- min(index)
#         t0 <- boot.out$t0[index]
#         t <- boot.out$t[,index]
#     }
#     else {
#         t0 <- boot.out$t0[index[1L]]
#         t <- boot.out$t[,index[1L]]
#         if (is.null(var.t0)) var.t0 <- boot.out$t0[index[2L]]
#         if (is.null(var.t)) var.t <- boot.out$t[,index[2L]]
#     }
# }
# (...)
# if (any(type == "all" | type == "perc"))
#     output <- c(output, list(percent=perc.ci(t,conf,hinv=hinv)))
# if (any(type == "all" | type == "bca")) {
#     if (find_type(boot.out) == "tsboot")
#         warning("BCa intervals not defined for time series bootstraps")
#     else
#         output <- c(output, list(bca=bca.ci(boot.out,conf,
#                                             index[1L],L=L,t=t.o, t0=t0.o,
#                                             h=h,hdot=hdot, hinv=hinv, ...)))
# }


perc.ci <- function(t, conf = 0.95, hinv = function(t) t)
    # #   Bootstrap Percentile Confidence Interval Method
{
    alpha <- (1+c(-conf,conf))/2
    qq <- norm.inter(t,alpha)
    cbind(conf,matrix(qq[,1L],ncol=2L),matrix(hinv(qq[,2]),ncol=2L))
}

norm.inter <- function(t,alpha)
    # Interpolation on the normal quantile scale. 
    # For a non-integer order statistic this function interpolates between the surrounding order statistics using the normal quantile scale. 
    # See equation 5.8 of Davison and Hinkley (1997)
{
    t <- t[is.finite(t)]
    R <- length(t)
    rk <- (R+1)*alpha
    if (!all(rk>1 & rk<R))
        warning("extreme order statistics used as endpoints")
    k <- trunc(rk)
    inds <- seq_along(k)
    out <- inds
    kvs <- k[k>0 & k<R]
    tstar <- sort(t, partial = sort(union(c(1, R), c(kvs, kvs+1))))
    ints <- (k == rk)
    if (any(ints)) out[inds[ints]] <- tstar[k[inds[ints]]]
    out[k == 0] <- tstar[1L]
    out[k == R] <- tstar[R]
    not <- function(v) xor(rep(TRUE,length(v)),v)
    temp <- inds[not(ints) & k != 0 & k != R]
    temp1 <- qnorm(alpha[temp])
    temp2 <- qnorm(k[temp]/(R+1))
    temp3 <- qnorm((k[temp]+1)/(R+1))
    tk <- tstar[k[temp]]
    tk1 <- tstar[k[temp]+1L]
    out[temp] <- tk + (temp1-temp2)/(temp3-temp2)*(tk1 - tk)
    cbind(round(rk, 2), out)
}


norm.inter <- function(t,alpha)
    # Interpolation on the normal quantile scale. 
    # For a non-integer order statistic this function interpolates between the surrounding order statistics using the normal quantile scale. 
    # See equation 5.8 of Davison and Hinkley (1997)
{
    t <- t[is.finite(t)]
    R <- length(t)
    rk <- (R+1)*alpha
    if (!all(rk>1 & rk<R))
        warning("extreme order statistics used as endpoints")
    k <- trunc(rk)
    inds <- seq_along(k)
    out <- inds
    kvs <- k[k>0 & k<R]
    tstar <- sort(t, partial = sort(union(c(1, R), c(kvs, kvs+1))))
    ints <- (k == rk)
    if (any(ints)) out[inds[ints]] <- tstar[k[inds[ints]]]
    out[k == 0] <- tstar[1L]
    out[k == R] <- tstar[R]
    not <- function(v) xor(rep(TRUE,length(v)),v)
    temp <- inds[not(ints) & k != 0 & k != R]
    temp1 <- qnorm(alpha[temp])
    temp2 <- qnorm(k[temp]/(R+1))
    temp3 <- qnorm((k[temp]+1)/(R+1))
    tk <- tstar[k[temp]]
    tk1 <- tstar[k[temp]+1L]
    out[temp] <- tk + (temp1-temp2)/(temp3-temp2)*(tk1 - tk)
    cbind(round(rk, 2), out)
}









boot.output %>% {rbind( as_tibble(as.list(.$t0)), map_df( {set_names(as_tibble(.$t), nm = names(.$t0))}, function(vec) norm.inter(vec, alpha = c(0.025, 0.975))[,2] ) )} %>% t |> as.data.frame() |> rownames_to_column() %>% transmute(rowname = rowname, `estimate (95% CI)` = paste0(sprintf("%.2f",round(V1,2)), " (", sprintf("%.2f",round(V2,2)), ", ", sprintf("%.2f",round(V3,2)), ")"), `exp(coef(.))` = V1,  `2.5 %` = V2, `97.5 %` = V3) |> as_tibble() #----
# > boot.output %>% {rbind( as_tibble(as.list(.$t0)), map_df( {set_names(as_tibble(.$t), nm = names(.$t0))}, function(vec) norm.inter(vec, alpha = c(0.025, 0.975))[,2] ) )} %>% t |> as.data.frame() |> rownames_to_column() %>% transmute(rowname = rowname, `estimate (95% CI)` = paste0(sprintf("%.2f",round(V1,2)), " (", sprintf("%.2f",round(V2,2)), ", ", sprintf("%.2f",round(V3,2)), ")"), `exp(coef(.))` = V1,  `2.5 %` = V2, `97.5 %` = V3) |> as_tibble() #----  
# # A tibble: 6 x 5
#   rowname         `estimate (95% CI)` `exp(coef(.))` `2.5 %` `97.5 %`
#   <chr>           <chr>                        <dbl>   <dbl>    <dbl>
# 1 (Intercept)     0.01 (0.01, 0.01)          0.00986 0.00833   0.0113
# 2 Exposure        0.33 (0.18, 0.58)          0.333   0.183     0.577 
# 3 k               0.90 (0.89, 0.90)          0.895   0.887     0.904 
# 4 I(k^2)          1.00 (1.00, 1.00)          1.00    1.00      1.00  
# 5 Exposure:k      1.04 (1.00, 1.08)          1.04    1.00      1.08  
# 6 Exposure:I(k^2) 1.00 (1.00, 1.00)          1.000   0.999     1.00 
  
  
# __________|------  
# @@ END-----  
write_rds(boot.output, "analyticDF2797.ipw.PersonTime7.SWglmOutcome_Exposure_k.boot.rds", "xz", compression=9)
openxlsx2::write_xlsx(
    boot.output %>% {rbind( as_tibble(as.list(.$t0)), map_df( {set_names(as_tibble(.$t), nm = names(.$t0))}, function(vec) norm.inter(vec, alpha = c(0.025, 0.975))[,2] ) )} %>% t |> as.data.frame() |> rownames_to_column() %>% transmute(rowname = rowname, `estimate (95% CI)` = paste0(sprintf("%.2f",round(V1,2)), " (", sprintf("%.2f",round(V2,2)), ", ", sprintf("%.2f",round(V3,2)), ")"), `exp(coef(.))` = V1,  `2.5 %` = V2, `97.5 %` = V3) |> as_tibble() #----
    , "analyticDF2797.ipw.PersonTime7.SWglmOutcome_Exposure_k.boot.ci.xlsx", as_table=TRUE
)


