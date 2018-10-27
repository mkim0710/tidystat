# function.numeric2integer.source.r

function.numeric2nearest_integer = function(vec) {
    round(vec + 10^(-9))
}

round_but_ceiling5 = function(x, digits = 0) {
    round(x + 10^(-9), digits = digits)
}


sprintf_but_ceiling5 = function(fmt='%#.2f', x, ...) {
    sprintf(fmt = fmt, x, ...)
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


#@ ?round
?round
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


#@ tibble(vec = c(-1.51, -1.5, -1.49, -0.51, -0.5, -0.49, 0.49, 0.5, 0.51, 1.49, 1.5, 1.51)) %>%  -----
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



#@ end -----
