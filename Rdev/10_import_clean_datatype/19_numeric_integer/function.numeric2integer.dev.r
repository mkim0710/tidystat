# function.numeric2integer.dev.r

function.numeric2nearest_integer = function(vec) {
    round(vec + 10^(-9))
}

round_but_ceiling5 = function(x, digits = 0) {
    round(x + 10^(-9), digits = digits)
    # > 5.5550 %>% round(2)
    # [1] 5.55
    # > 5.5550 %>% round_but_ceiling5(2)
    # [1] 5.56
}


sprintf_but_ceiling5 = function(fmt='%#.2f', x, ...) {
    sprintf(fmt = fmt, x + 10^(-9), ...)
    # > 5.5550 %>% sprintf(fmt='%#.2f')
    # [1] "5.55"
    # > 5.5550 %>% sprintf_but_ceiling5(fmt='%#.2f')
    # [1] "5.56"
}



5.5550 %>% round(2)
5.5550 %>% round(2) %>% sprintf(fmt='%#.2f')
5.5550 %>% sprintf(fmt='%#.2f')
5.5550 %>% round_but_ceiling5(2)
5.5550 %>% round_but_ceiling5(2) %>% sprintf(fmt='%#.2f')
5.5550 %>% sprintf(fmt='%#.2f')
5.5550 %>% sprintf_but_ceiling5(fmt='%#.2f')
# > 5.5550 %>% round(2)
# [1] 5.55
# > 5.5550 %>% round(2) %>% sprintf(fmt='%#.2f')
# [1] "5.55"
# > 5.5550 %>% sprintf(fmt='%#.2f')
# [1] "5.55"
# > 5.5550 %>% round_but_ceiling5(2)
# [1] 5.56
# > 5.5550 %>% round_but_ceiling5(2) %>% sprintf(fmt='%#.2f')
# [1] "5.56"
# > 5.5550 %>% sprintf(fmt='%#.2f')
# [1] "5.55"
# > 5.5550 %>% sprintf_but_ceiling5(fmt='%#.2f')
# [1] "5.56"


## @ ?round  
# ?round
# Description
# ceiling takes a single numeric argument x and returns a numeric vector containing the smallest integers not less than the corresponding elements of x.
# floor takes a single numeric argument x and returns a numeric vector containing the largest integers not greater than the corresponding elements of x.
# trunc takes a single numeric argument x and returns a numeric vector containing the integers formed by truncating the values in x toward 0.
# round rounds the values in its first argument to the specified number of decimal places (default 0). See ‘Details’ about “round to even” when rounding off a 5.
# signif rounds the values in its first argument to the specified number of significant digits.
# 
# Usage
# ceiling(x)
# floor(x)
# trunc(x, ...) 
# round(x, digits = 0)
# signif(x, digits = 6)


round(.5 + -2:4) # IEEE / IEC rounding: -2  0  0  2  2  4  4
## (this is *good* behaviour -- do *NOT* report it as bug !)

( x1 <- seq(-2, 4, by = .5) )
round(x1) #-- IEEE / IEC rounding !
x1[trunc(x1) != floor(x1)]
x1[round(x1) != floor(x1 + .5)]
(non.int <- ceiling(x1) != floor(x1))
# > ( x1 <- seq(-2, 4, by = .5) )
#  [1] -2.0 -1.5 -1.0 -0.5  0.0  0.5  1.0  1.5  2.0  2.5  3.0  3.5  4.0
# > round(x1) #-- IEEE / IEC rounding !
#  [1] -2 -2 -1  0  0  0  1  2  2  2  3  4  4
# > x1[trunc(x1) != floor(x1)]
# [1] -1.5 -0.5
# > x1[round(x1) != floor(x1 + .5)]
# [1] -1.5  0.5  2.5
# > (non.int <- ceiling(x1) != floor(x1))
#  [1] FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE

x2 <- pi * 100^(-1:3)
round(x2, 3)
signif(x2, 3)
# > x2 <- pi * 100^(-1:3)
# > round(x2, 3)
# [1]       0.031       3.142     314.159   31415.927 3141592.654
# > signif(x2, 3)
# [1] 3.14e-02 3.14e+00 3.14e+02 3.14e+04 3.14e+06


## @ https://en.wikipedia.org/wiki/Rounding#Comparison_of_approaches_for_rounding_to_an_integer =====  
## @ tibble(vec = c(-1.8, -1.5, -1.2, -0.8, -0.5, -0.2, 0.2, 0.5, 0.8, 1.2, 1.5, 1.8)) %>% ----  
tibble(vec = c(-1.8, -1.5, -1.2, -0.8, -0.5, -0.2, 0.2, 0.5, 0.8, 1.2, 1.5, 1.8)) %>% 
    mutate(
        ceiling(vec)
        , floor(vec)
        , trunc(vec)
        , round(vec)
        , signif(vec, digits = 1)
        , nearest_integer = function.numeric2nearest_integer(vec)    
    )
# > tibble(vec = c(-1.8, -1.5, -1.2, -0.8, -0.5, -0.2, 0.2, 0.5, 0.8, 1.2, 1.5, 1.8)) %>% 
# +     mutate(
# +         ceiling(vec)
# +         , floor(vec)
# +         , trunc(vec)
# +         , round(vec)
# +         , signif(vec, digits = 1)
# +         , nearest_integer = function.numeric2nearest_integer(vec)    
# +     )
# # A tibble: 12 x 7
#      vec `ceiling(vec)` `floor(vec)` `trunc(vec)` `round(vec)` `signif(vec, digits = 1)` nearest_integer
#    <dbl>          <dbl>        <dbl>        <dbl>        <dbl>                     <dbl>           <dbl>
#  1  -1.8             -1           -2           -1           -2                      -2                -2
#  2  -1.5             -1           -2           -1           -2                      -2                -1
#  3  -1.2             -1           -2           -1           -1                      -1                -1
#  4  -0.8              0           -1            0           -1                      -0.8              -1
#  5  -0.5              0           -1            0            0                      -0.5               0
#  6  -0.2              0           -1            0            0                      -0.2               0
#  7   0.2              1            0            0            0                       0.2               0
#  8   0.5              1            0            0            0                       0.5               1
#  9   0.8              1            0            0            1                       0.8               1
# 10   1.2              2            1            1            1                       1                 1
# 11   1.5              2            1            1            2                       2                 2
# 12   1.8              2            1            1            2                       2                 2


## @ tibble(vec = c(-1.51, -1.5, -1.49, -0.51, -0.5, -0.49, 0.49, 0.5, 0.51, 1.49, 1.5, 1.51)) %>%  -----  
tibble(vec = c(-1.51, -1.5, -1.49, -0.51, -0.5, -0.49, 0.49, 0.5, 0.51, 1.49, 1.5, 1.51)) %>% 
    mutate(
        ceiling(vec)
        , floor(vec)
        , trunc(vec)
        , round(vec)
        , signif(vec, digits = 1)
        , nearest_integer = function.numeric2nearest_integer(vec)    
    )
# > tibble(vec = c(-1.51, -1.5, -1.49, -0.51, -0.5, -0.49, 0.49, 0.5, 0.51, 1.49, 1.5, 1.51)) %>% 
# +     mutate(
# +         ceiling(vec)
# +         , floor(vec)
# +         , trunc(vec)
# +         , round(vec)
# +         , signif(vec, digits = 1)
# +        , nearest_integer = function.numeric2nearest_integer(vec)    
# +     )
# # A tibble: 12 x 7
#      vec `ceiling(vec)` `floor(vec)` `trunc(vec)` `round(vec)` `signif(vec, digits = 1)` nearest_integer
#    <dbl>          <dbl>        <dbl>        <dbl>        <dbl>                     <dbl>           <dbl>
#  1 -1.51             -1           -2           -1           -2                      -2                -2
#  2 -1.5              -1           -2           -1           -2                      -2                -1
#  3 -1.49             -1           -2           -1           -1                      -1                -1
#  4 -0.51              0           -1            0           -1                      -0.5              -1
#  5 -0.5               0           -1            0            0                      -0.5               0
#  6 -0.49              0           -1            0            0                      -0.5               0
#  7  0.49              1            0            0            0                       0.5               0
#  8  0.5               1            0            0            0                       0.5               1
#  9  0.51              1            0            0            1                       0.5               1
# 10  1.49              2            1            1            1                       1                 1
# 11  1.5               2            1            1            2                       2                 2
# 12  1.51              2            1            1            2                       2                 2




res1[1:10,] |> dput()
# > res1[1:10,] |> dput()
res10 = 
structure(list(rowname = c("total_ddd_yr_ASPIRIN.cut[0.001,30)",
"total_ddd_yr_ASPIRIN.cut[30,365)", "total_ddd_yr_ASPIRIN.cut[365,730)",
"total_ddd_yr_ASPIRIN.cut[730,1.1e+03)", "total_ddd_yr_ASPIRIN.cut[1.1e+03,1.46e+03)",
"total_ddd_yr_ASPIRIN.cut[1.46e+03,Inf]", "AGE_group50-", "AGE_group60-",
"AGE_group70-", "total_ddd_yr_NSAID.cut[0.001,30)"), `exp(coef)` = c(2.31015112055409e-06,
1.41261804462617e-06, 2.41879129277633e-07, 4.56280954774587,
5.74179648423187e-09, 3.22229442131584e-09, 111699493356.72,
5.23235729576168, 4486328565244.22, 1.02515609698427), `lower .95` = c(0,
0, 0, 0.343719191421198, 0, 0, 0, 5.23235729576168, 0, 0.06668076929983
), `upper .95` = c(Inf, Inf, Inf, 60.5704641714017, Inf, Inf,
Inf, 5.23235729576168, Inf, 15.7608413073107), `Pr(>|z|)` = c(0.995459635124392,
0.992667202010393, 0.996598705230412, 0.249927991970702, 0.998992188874016,
0.999149350866927, 0.999869166285058, 0, 0.999850173222601, 0.985782837945111
)), row.names = c(NA, 10L), class = "data.frame")
res10[c("exp(coef)", "lower .95", "upper .95")] %>%
    map_df(sprintf,  fmt = "%.2f")
res10[c("exp(coef)", "lower .95", "upper .95")] %>%
    map(round, 2) %>% map_df(sprintf,  fmt = "%.2f")
res10[c("exp(coef)", "lower .95", "upper .95")] %>%
    map_df(sprintf_but_ceiling5,  fmt = "%.2f")
res10[c("exp(coef)", "lower .95", "upper .95")] %>%
    signif(digits = digits + 1) %>% map_df(sprintf_but_ceiling5,  fmt = "%.2f")
# > res10[c("exp(coef)", "lower .95", "upper .95")] %>%
# +     map_df(sprintf,  fmt = "%.2f")
# # A tibble: 10 x 3
#    `exp(coef)`      `lower .95` `upper .95`
#    <chr>            <chr>       <chr>      
#  1 0.00             0.00        Inf        
#  2 0.00             0.00        Inf        
#  3 0.00             0.00        Inf        
#  4 4.56             0.34        60.57      
#  5 0.00             0.00        Inf        
#  6 0.00             0.00        Inf        
#  7 111699493356.72  0.00        Inf        
#  8 5.23             5.23        5.23       
#  9 4486328565244.22 0.00        Inf        
# 10 1.03             0.07        15.76      
# > res10[c("exp(coef)", "lower .95", "upper .95")] %>%
# +     map(round, 2) %>% map_df(sprintf,  fmt = "%.2f")
# # A tibble: 10 x 3
#    `exp(coef)`      `lower .95` `upper .95`
#    <chr>            <chr>       <chr>      
#  1 0.00             0.00        Inf        
#  2 0.00             0.00        Inf        
#  3 0.00             0.00        Inf        
#  4 4.56             0.34        60.57      
#  5 0.00             0.00        Inf        
#  6 0.00             0.00        Inf        
#  7 111699493356.72  0.00        Inf        
#  8 5.23             5.23        5.23       
#  9 4486328565244.22 0.00        Inf        
# 10 1.03             0.07        15.76      
# > res10[c("exp(coef)", "lower .95", "upper .95")] %>%
# +     map_df(sprintf_but_ceiling5,  fmt = "%.2f")
# # A tibble: 10 x 3
#    `exp(coef)`      `lower .95` `upper .95`
#    <chr>            <chr>       <chr>      
#  1 0.00             0.00        Inf        
#  2 0.00             0.00        Inf        
#  3 0.00             0.00        Inf        
#  4 4.56             0.34        60.57      
#  5 0.00             0.00        Inf        
#  6 0.00             0.00        Inf        
#  7 111699493356.72  0.00        Inf        
#  8 5.23             5.23        5.23       
#  9 4486328565244.22 0.00        Inf        
# 10 1.03             0.07        15.76      
# > res10[c("exp(coef)", "lower .95", "upper .95")] %>%
# +     signif(digits = digits + 1) %>% map_df(sprintf_but_ceiling5,  fmt = "%.2f")
# # A tibble: 10 x 3
#    `exp(coef)`      `lower .95` `upper .95`
#    <chr>            <chr>       <chr>      
#  1 0.00             0.00        Inf        
#  2 0.00             0.00        Inf        
#  3 0.00             0.00        Inf        
#  4 4.56             0.34        60.60      
#  5 0.00             0.00        Inf        
#  6 0.00             0.00        Inf        
#  7 112000000000.00  0.00        Inf        
#  8 5.23             5.23        5.23       
#  9 4490000000000.00 0.00        Inf        
# 10 1.03             0.07        15.80   





# @@ END-----  
