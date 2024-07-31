# function.df_nTotal_nEvent.append_CI.dev.r



#@ ?prop.test =====
# ?prop.test
prop.test(10, 100)
prop.test(10, 100) |> str() #-----
# > prop.test(10, 100)
# 
# 	1-sample proportions test with continuity correction
# 
# data:  10 out of 100, null probability 0.5
# X-squared = 62.41, df = 1, p-value = 2.789e-15
# alternative hypothesis: true p is not equal to 0.5
# 95 percent confidence interval:
#  0.0516301 0.1803577
# sample estimates:
#   p 
# 0.1 
# 
# > prop.test(10, 100) |> str()
# List of 9
#  $ statistic  : Named num 62.4
#   ..- attr(*, "names")= chr "X-squared"
#  $ parameter  : Named int 1
#   ..- attr(*, "names")= chr "df"
#  $ p.value    : num 2.79e-15
#  $ estimate   : Named num 0.1
#   ..- attr(*, "names")= chr "p"
#  $ null.value : Named num 0.5
#   ..- attr(*, "names")= chr "p"
#  $ conf.int   : num [1:2] 0.0516 0.1804
#   ..- attr(*, "conf.level")= num 0.95
#  $ alternative: chr "two.sided"
#  $ method     : chr "1-sample proportions test with continuity correction"
#  $ data.name  : chr "10 out of 100, null probability 0.5"
#  - attr(*, "class")= chr "htest"




#@ ?binom.test =====
# ?binom.test
binom.test(10, 100)
binom.test(10, 100) |> str() #-----
# > binom.test(10, 100)
# 
# 	Exact binomial test
# 
# data:  10 and 100
# number of successes = 10, number of trials = 100, p-value < 2.2e-16
# alternative hypothesis: true probability of success is not equal to 0.5
# 95 percent confidence interval:
#  0.04900469 0.17622260
# sample estimates:
# probability of success 
#                    0.1 
# 
# > binom.test(10, 100) |> str() #-----
# List of 9
#  $ statistic  : Named num 10
#   ..- attr(*, "names")= chr "number of successes"
#  $ parameter  : Named num 100
#   ..- attr(*, "names")= chr "number of trials"
#  $ p.value    : num 3.06e-17
#  $ conf.int   : num [1:2] 0.049 0.176
#   ..- attr(*, "conf.level")= num 0.95
#  $ estimate   : Named num 0.1
#   ..- attr(*, "names")= chr "probability of success"
#  $ null.value : Named num 0.5
#   ..- attr(*, "names")= chr "probability of success"
#  $ alternative: chr "two.sided"
#  $ method     : chr "Exact binomial test"
#  $ data.name  : chr "10 and 100"
#  - attr(*, "class")= chr "htest"




binom.test(10, 100)$conf.int #-----
prop.test(10, 100, correct = T)$conf.int #-----
prop.test(10, 100, correct = F)$conf.int #-----
# > binom.test(10, 100)$conf.int #-----
# [1] 0.04900469 0.17622260
# attr(,"conf.level")
# [1] 0.95
# > prop.test(10, 100, correct = T)$conf.int #-----
# [1] 0.0516301 0.1803577
# attr(,"conf.level")
# [1] 0.95
# > prop.test(10, 100, correct = F)$conf.int #-----
# [1] 0.05522914 0.17436566
# attr(,"conf.level")
# [1] 0.95






# https://www.r-bloggers.com/calculating-confidence-intervals-for-proportions/

simpasym <- function(n, p, z=qnorm(0.975), cc=TRUE){
  out <- list()
  if(cc){
    out$lb <- p - z*sqrt((p*(1-p))/n) - 0.5/n
    out$ub <- p + z*sqrt((p*(1-p))/n) + 0.5/n
  } else {
    out$lb <- p - z*sqrt((p*(1-p))/n)
    out$ub <- p + z*sqrt((p*(1-p))/n)
  }
  out
}
simpasym(100, 0.1) |> unlist()
simpasym(100, 0.1, cc=F) |> unlist()
# > simpasym(100, 0.1) |> unlist()
#         lb         ub 
# 0.03620108 0.16379892 
# > simpasym(100, 0.1, cc=F) |> unlist()
#         lb         ub 
# 0.04120108 0.15879892 


scoreint <- function(n, p, z=qnorm(0.975), cc=TRUE){
  out <- list()
  q <- 1-p
  zsq <- z^2
  denom <- (2*(n+zsq))
  if(cc){ 
    numl <- (2*n*p)+zsq-1-(z*sqrt(zsq-2-(1/n)+4*p*((n*q)+1)))
    numu <- (2*n*p)+zsq+1+(z*sqrt(zsq+2-(1/n)+4*p*((n*q)-1)))
    out$lb <- numl/denom
    out$ub <- numu/denom
    if(p==1) out$ub <- 1
    if(p==0) out$lb <- 0
  } else {
    out$lb <- ((2*n*p)+zsq-(z*sqrt(zsq+(4*n*p*q))))/denom
    out$ub <- ((2*n*p)+zsq+(z*sqrt(zsq+(4*n*p*q))))/denom
  }
  out
}
scoreint(100, 0.1) |> unlist()
scoreint(100, 0.1, cc=F) |> unlist()
# > scoreint(100, 0.1) |> unlist()
#        lb        ub 
# 0.0516301 0.1803577 
# > scoreint(100, 0.1, cc=F) |> unlist()
#         lb         ub 
# 0.05522914 0.17436566 





# https://stats.stackexchange.com/questions/207807/95-confidence-interval-for-proportions-in-r/207808
# p_hat +/- z * sqrt(p_hat * (1-p_hat)/n)

# # Set CI alpha level (1-alpha/2)*100%
# alpha = 0.05
# 
# # Load Data
# vehicleType = c("suv", "suv", "minivan", "car", "suv", "suv", "car", "car", "car", "car", "minivan", "car", "truck", "car", "car", "car", "car", "car", "car", "car", "minivan", "car", "suv", "minivan", "car", "minivan", "suv", "suv", "suv", "car", "suv", "car", "car", "suv", "truck", "truck", "minivan", "suv", "car", "truck", "suv", "suv", "car", "car", "car", "car", "suv", "car", "car", "car", "suv", "car", "car", "car", "truck", "car", "car", "suv", "suv", "minivan", "suv", "car", "car", "car", "car", "car", "minivan", "suv", "car", "car", "suv", "minivan", "car", "car", "car", "minivan", "minivan", "minivan", "car", "truck", "car", "car", "car", "suv", "suv", "suv", "car", "suv", "suv", "car", "suv", "car", "minivan", "car", "car", "car", "car", "car", "car", "car")
# 
# # Convert from string to factor
# vehicleType = factor(vehicleType)
# 
# # Find the number of obs
# n = length(vehicleType)
# 
# # Find number of obs per type
# vtbreakdown = table(vehicleType)
# 
# # Get the proportion
# p_hat = vtbreakdown['suv']/n
# 
# # Calculate the critical z-score
# z = qnorm(1-alpha/2)
# 
# # Compute the CI
# p_hat + c(-1,1)*z*sqrt(p_hat*(1-p_hat)/n)



function.n_p.CI = function(n, p_hat, alpha = 0.05) {
    # Set CI alpha level (1-alpha/2)*100%
    # alpha = 0.05

    # Calculate the critical z-score
    z = qnorm(1-alpha/2)
    
    SE = sqrt(p_hat*(1-p_hat)/n)
    
    # Compute the CI
    p_hat + c(-1,1) * z * SE
}


# > function.n_p.CI(100, 0.1)
# [1] 0.04120108 0.15879892



#@ library(binom) -----
library(binom)
# ?binom.confint
binom.confint(10, 100)
# > binom.confint(10, 100)
#           method  x   n      mean      lower     upper
# 1  agresti-coull 10 100 0.1000000 0.05348475 0.1761100
# 2     asymptotic 10 100 0.1000000 0.04120108 0.1587989
# 3          bayes 10 100 0.1039604 0.04837031 0.1640981
# 4        cloglog 10 100 0.1000000 0.05117680 0.1680207
# 5          exact 10 100 0.1000000 0.04900469 0.1762226
# 6          logit 10 100 0.1000000 0.05465311 0.1759686
# 7         probit 10 100 0.1000000 0.05298326 0.1719438
# 8        profile 10 100 0.1000000 0.05142278 0.1687820
# 9            lrt 10 100 0.1000000 0.05141274 0.1687797
# 10     prop.test 10 100 0.1000000 0.05163010 0.1803577
# 11        wilson 10 100 0.1000000 0.05522914 0.1743657




#@ library(Hmisc) ====
library(Hmisc)
# ?binconf
binconf(10, 100, method = "all")
# > binconf(10, 100, method = "all")
#            PointEst      Lower     Upper
# Exact           0.1 0.04900469 0.1762226
# Wilson          0.1 0.05522914 0.1743657
# Asymptotic      0.1 0.04120108 0.1587989






#@@@ -----
binom.test(10, 100)$conf.int |> as.vector() #-----
# > binom.test(10, 100)$conf.int |> as.vector() #-----
# [1] 0.04900469 0.17622260

prop.test(10, 100, correct = T)$conf.int |> as.vector() #-----
scoreint(100, 0.1) |> unlist() |> unname()
# > prop.test(10, 100, correct = T)$conf.int |> as.vector() #-----
# [1] 0.0516301 0.1803577
# > scoreint(100, 0.1) |> unlist() |> unname()
# [1] 0.0516301 0.1803577

prop.test(10, 100, correct = F)$conf.int |> as.vector() #-----
scoreint(100, 0.1, cc=F) |> unlist() |> unname()
# > prop.test(10, 100, correct = F)$conf.int |> as.vector() #-----
# [1] 0.05522914 0.17436566
# > scoreint(100, 0.1, cc=F) |> unlist() |> unname()
# [1] 0.05522914 0.17436566

simpasym(100, 0.1) |> unlist() |> unname()
simpasym(100, 0.1, cc=F) |> unlist() |> unname()
function.n_p.CI(100, 0.1)
# > simpasym(100, 0.1) |> unlist() |> unname()
# [1] 0.03620108 0.16379892
# > simpasym(100, 0.1, cc=F) |> unlist() |> unname()
# [1] 0.04120108 0.15879892
# > function.n_p.CI(100, 0.1)
# [1] 0.04120108 0.15879892









#@@@ -----

# tribble_paste = datapasta::tribble_paste
# read.table(file = "clipboard", sep = "\t", header=T) |> tribble_paste() #----
df_nTotal_nEvent = tibble::tribble(
  ~Stage, ~nTotal, ~nEvent,
    "IA",   6303L,   1119L,
    "IB",   2492L,    768L,
   "IIA",   1008L,    424L,
   "IIB",    824L,    382L,
  "IIIA",   3344L,   2139L,
  "IIIB",   2624L,   2101L,
    "IV",    882L,    664L
  )

prop.test(df_nTotal_nEvent$nEvent, df_nTotal_nEvent$nTotal, correct = F)
# > prop.test(df_nTotal_nEvent$nEvent, df_nTotal_nEvent$nTotal, correct = F)
# 
# 	7-sample test for equality of proportions without continuity correction
# 
# data:  df_nTotal_nEvent$nEvent out of df_nTotal_nEvent$nTotal
# X-squared = 4227.4, df = 6, p-value < 2.2e-16
# alternative hypothesis: two.sided
# sample estimates:
#    prop 1    prop 2    prop 3    prop 4    prop 5    prop 6    prop 7 
# 0.1775345 0.3081862 0.4206349 0.4635922 0.6396531 0.8006860 0.7528345 


1:nrow(df_nTotal_nEvent) %>% map(function(i) prop.test(df_nTotal_nEvent$nEvent[i], df_nTotal_nEvent$nTotal[i], correct = F)$conf.int) %>% reduce(rbind) |> unname() #----
# > 1:nrow(df_nTotal_nEvent) %>% map(function(i) prop.test(df_nTotal_nEvent$nEvent[i], df_nTotal_nEvent$nTotal[i], correct = F)$conf.int) %>% reduce(rbind) |> unname() #----
#           [,1]      [,2]
# [1,] 0.1682982 0.1871636
# [2,] 0.2903639 0.3265989
# [3,] 0.3905174 0.4513550
# [4,] 0.4297912 0.4977312
# [5,] 0.6232292 0.6557566
# [6,] 0.7849662 0.8155266
# [7,] 0.7233107 0.7801654

1:nrow(df_nTotal_nEvent) %>% map(function(i) {
    out = c(
        df_nTotal_nEvent$nEvent[i] / df_nTotal_nEvent$nTotal[i]
        , prop.test(df_nTotal_nEvent$nEvent[i], df_nTotal_nEvent$nTotal[i], correct = F)$conf.int
    )
}) %>% reduce(rbind) |> unname() |> as_tibble() %>% set_names(c("p", "ll", "ul")) #----
# > 1:nrow(df_nTotal_nEvent) %>% map(function(i) {
# +     out = c(
# +         df_nTotal_nEvent$nEvent[i] / df_nTotal_nEvent$nTotal[i]
# +         , prop.test(df_nTotal_nEvent$nEvent[i], df_nTotal_nEvent$nTotal[i], correct = F)$conf.int
# +     )
# + }) %>% reduce(rbind) |> unname() |> as_tibble() %>% set_names(c("p", "ll", "ul")) #----
# # A tibble: 7 x 3
#       p    ll    ul
#   <dbl> <dbl> <dbl>
# 1 0.178 0.168 0.187
# 2 0.308 0.290 0.327
# 3 0.421 0.391 0.451
# 4 0.464 0.430 0.498
# 5 0.640 0.623 0.656
# 6 0.801 0.785 0.816
# 7 0.753 0.723 0.780




function.df_nTotal_nEvent.append_CI = function(df_nTotal_nEvent, method=c("wilson","exact","asymptotic")) {
    method = method[1]
    if (method == "wilson") {
        out = 1:nrow(df_nTotal_nEvent) %>% map(function(i) {
            c(
                df_nTotal_nEvent$nEvent[i] / df_nTotal_nEvent$nTotal[i]
                , prop.test(df_nTotal_nEvent$nEvent[i], df_nTotal_nEvent$nTotal[i], correct = F)$conf.int
            )
        }) %>% reduce(rbind) |> unname() |> as_tibble() %>% set_names(c("p", paste0(c("ll", "ul"), ".wilson") )) #----
    }
    if (method == "exact") {
        out = 1:nrow(df_nTotal_nEvent) %>% map(function(i) {
            c(
                df_nTotal_nEvent$nEvent[i] / df_nTotal_nEvent$nTotal[i]
                , binom.test(df_nTotal_nEvent$nEvent[i], df_nTotal_nEvent$nTotal[i])$conf.int
            )
        }) %>% reduce(rbind) |> unname() |> as_tibble() %>% set_names(c("p", paste0(c("ll", "ul"), ".exact") )) #----
    }
    if (method == "asymptotic") {
        alpha = 0.05
        z = qnorm(1-alpha/2)
        out = 1:nrow(df_nTotal_nEvent) %>% map(function(i) {
            p_hat = df_nTotal_nEvent$nEvent[i] / df_nTotal_nEvent$nTotal[i]
            n = df_nTotal_nEvent$nTotal[i]
            p_hat + c(0,-1,1)*z*sqrt(p_hat*(1-p_hat)/n)
        }) %>% reduce(rbind) |> unname() |> as_tibble() %>% set_names(c("p", paste0(c("ll", "ul"), ".asymptotic") )) #----
    }
    out = bind_cols(df_nTotal_nEvent, out)
    out
}

function.df_nTotal_nEvent.append_CI(df_nTotal_nEvent) #----
function.df_nTotal_nEvent.append_CI(df_nTotal_nEvent, method = "wilson") #----
function.df_nTotal_nEvent.append_CI(df_nTotal_nEvent, method = "exact") #----
function.df_nTotal_nEvent.append_CI(df_nTotal_nEvent, method = "asymptotic") #----
# > function.df_nTotal_nEvent.append_CI(df_nTotal_nEvent) #----
# # A tibble: 7 x 6
#   Stage nTotal nEvent     p ll.wilson ul.wilson
#   <chr>  <int>  <int> <dbl>     <dbl>     <dbl>
# 1 IA      6303   1119 0.178     0.168     0.187
# 2 IB      2492    768 0.308     0.290     0.327
# 3 IIA     1008    424 0.421     0.391     0.451
# 4 IIB      824    382 0.464     0.430     0.498
# 5 IIIA    3344   2139 0.640     0.623     0.656
# 6 IIIB    2624   2101 0.801     0.785     0.816
# 7 IV       882    664 0.753     0.723     0.780
# > function.df_nTotal_nEvent.append_CI(df_nTotal_nEvent, method = "wilson") #----
# # A tibble: 7 x 6
#   Stage nTotal nEvent     p ll.wilson ul.wilson
#   <chr>  <int>  <int> <dbl>     <dbl>     <dbl>
# 1 IA      6303   1119 0.178     0.168     0.187
# 2 IB      2492    768 0.308     0.290     0.327
# 3 IIA     1008    424 0.421     0.391     0.451
# 4 IIB      824    382 0.464     0.430     0.498
# 5 IIIA    3344   2139 0.640     0.623     0.656
# 6 IIIB    2624   2101 0.801     0.785     0.816
# 7 IV       882    664 0.753     0.723     0.780
# > function.df_nTotal_nEvent.append_CI(df_nTotal_nEvent, method = "exact") #----
# # A tibble: 7 x 6
#   Stage nTotal nEvent     p ll.exact ul.exact
#   <chr>  <int>  <int> <dbl>    <dbl>    <dbl>
# 1 IA      6303   1119 0.178    0.168    0.187
# 2 IB      2492    768 0.308    0.290    0.327
# 3 IIA     1008    424 0.421    0.390    0.452
# 4 IIB      824    382 0.464    0.429    0.498
# 5 IIIA    3344   2139 0.640    0.623    0.656
# 6 IIIB    2624   2101 0.801    0.785    0.816
# 7 IV       882    664 0.753    0.723    0.781
# > function.df_nTotal_nEvent.append_CI(df_nTotal_nEvent, method = "asymptotic") #----
# # A tibble: 7 x 6
#   Stage nTotal nEvent     p ll.asymptotic ul.asymptotic
#   <chr>  <int>  <int> <dbl>         <dbl>         <dbl>
# 1 IA      6303   1119 0.178         0.168         0.187
# 2 IB      2492    768 0.308         0.290         0.326
# 3 IIA     1008    424 0.421         0.390         0.451
# 4 IIB      824    382 0.464         0.430         0.498
# 5 IIIA    3344   2139 0.640         0.623         0.656
# 6 IIIB    2624   2101 0.801         0.785         0.816
# 7 IV       882    664 0.753         0.724         0.781






#@ end -----
