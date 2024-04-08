
# https://csgillespie.github.io/efficientR/7-4-the-byte-compiler.html


# 7.4 The byte compiler
# 7.4.1 Example: the mean function
# The compiler package comes with R, so we just need to load the package in the usual way

library("compiler")
# Next we create an inefficient function for calculating the mean. This function takes in a vector, calculates the length and then updates the total variable.

my_mean = function(x) {
  total = 0
  n = length(x)
  for(i in 1:n)
    total = total + x[i]/n
  total
}
# This is clearly a bad function and we should just mean function, but it’s a useful comparison. Compiling the function is straightforward

cmp_mean = cmpfun(my_mean)
# Then we use the benchmark function to compare the three variants

## Generate some data
x = rnorm(100)
benchmark(my_mean(x), cmp_mean(x), mean(x), 
          columns=c("test", "elapsed", "relative"),
          order="relative", replications=5000)
# The compiled function is around seven times faster than the uncompiled function. Of course, the native mean function is faster, but the compiling does make a significant difference (figure 7.4).
# 
# Comparsion of mean functions.
# Figure 7.4: Comparsion of mean functions.



# 7.4.2 Compiling code
# There are a number of ways to compile code. The easiest is to compile individual function using cmpfun, but this obviously doesn’t scale. If you create a package, then you automatically compile the package on installation by adding
# 
ByteCompile: true
# to the DESCRIPTION file. Most R packages installed using install.packages are not compiled. We can enable (or force) packages to be compiled by starting R with the environment variable R_COMPILE_PKGS set to a positive integer value.
# 
# A final option to use just-in-time (JIT) compilation. The enableJIT function disables JIT compilation if the argument is 0. Arguments 1, 2, or 3 implement different levels of optimisation. JIT can also be enabled by setting the environment variable R_ENABLE_JIT, to one of these values.


