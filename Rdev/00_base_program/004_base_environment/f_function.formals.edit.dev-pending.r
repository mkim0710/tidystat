# https://chatgpt.com/c/6741a483-6904-800e-b4b2-f90232fb4563

# Original function
my_func <- function(a = 1, b = 2) {
  a + b
}

# View original defaults
formals(my_func)
# Output:
# $a
# [1] 1
#
# $b
# [1] 2

# Modify the default value of 'a' to 10
pl <- formals(my_func)
pl$a <- 10
formals(my_func) <- pl

# Verify the change
formals(my_func)
# Output:
# $a
# [1] 10
#
# $b
# [1] 2

# Test the modified function
my_func()  # Returns 12 (10 + 2)


formals(my_func)$b = 20
my_func()  



