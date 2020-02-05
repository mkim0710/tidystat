# http://adv-r.had.co.nz/C-interface.html


# Finding the C source code for a function
# In the base package, R doesn’t use .Call(). Instead, it uses two special functions: .Internal() and .Primitive(). Finding the source code for these functions is an arduous task: you first need to look for their C function name in src/main/names.c and then search the R source code. pryr::show_c_source() automates this task using GitHub code search:

tabulate
#> function (bin, nbins = max(1L, bin, na.rm = TRUE)) 
#> {
#>     if (!is.numeric(bin) && !is.factor(bin)) 
#>         stop("'bin' must be numeric or a factor")
#>     if (typeof(bin) != "integer") 
#>         bin <- as.integer(bin)
#>     if (nbins > .Machine$integer.max) 
#>         stop("attempt to make a table with >= 2^31 elements")
#>     nbins <- as.integer(nbins)
#>     if (is.na(nbins)) 
#>         stop(gettextf("invalid value of %s", "'nbins'"), domain = NA)
#>     .Internal(tabulate(bin, nbins))
#> }
#> <bytecode: 0x55cbd4044d30>
#> <environment: namespace:base>
pryr::show_c_source(.Internal(tabulate(bin, nbins)))
#> tabulate is implemented by do_tabulate with op = 0



# This reveals the following C source code (slightly edited for clarity):
SEXP attribute_hidden do_tabulate(SEXP call, SEXP op, SEXP args, 
                                  SEXP rho) {
  checkArity(op, args);
  SEXP in = CAR(args), nbin = CADR(args);
  if (TYPEOF(in) != INTSXP)  error("invalid input");

  R_xlen_t n = XLENGTH(in);
  /* FIXME: could in principle be a long vector */
  int nb = asInteger(nbin);
  if (nb == NA_INTEGER || nb < 0)
    error(_("invalid '%s' argument"), "nbin");
  
  SEXP ans = allocVector(INTSXP, nb);
  int *x = INTEGER(in), *y = INTEGER(ans);
  memset(y, 0, nb * sizeof(int));
  for(R_xlen_t i = 0 ; i < n ; i++) {
    if (x[i] != NA_INTEGER && x[i] > 0 && x[i] <= nb) {
      y[x[i] - 1]++;
    }
  }
     
  return ans;
}


# Internal and primitive functions have a somewhat different interface than .Call() functions. They always have four arguments:
# 
# SEXP call: the complete call to the function. CAR(call) gives the name of the function (as a symbol); CDR(call) gives the arguments.
# 
# SEXP op: an “offset pointer”. This is used when multiple R functions use the same C function. For example do_logic() implements &, |, and !. show_c_source() prints this out for you.
# 
# SEXP args: a pairlist containing the unevaluated arguments to the function.
# 
# SEXP rho: the environment in which the call was executed.
# 
# This gives internal functions an incredible amount of flexibility as to how and when the arguments are evaluated. For example, internal S3 generics call DispatchOrEval() which either calls the appropriate S3 method or evaluates all the arguments in place. This flexibility come at a price, because it makes the code harder to understand. However, evaluating the arguments is usually the first step and the rest of the function is straightforward.
# 
# The following code shows do_tabulate() converted into standard a .Call() interface:

tabulate2 <- cfunction(c(bin = "SEXP", nbins = "SEXP"), '
  if (TYPEOF(bin) != INTSXP)  error("invalid input");
  
  R_xlen_t n = XLENGTH(bin);
  /* FIXME: could in principle be a long vector */
  int nb = asInteger(nbins);
  if (nb == NA_INTEGER || nb < 0)
    error("invalid \'%s\' argument", "nbin");

  SEXP ans = allocVector(INTSXP, nb);
  int *x = INTEGER(bin), *y = INTEGER(ans);
  memset(y, 0, nb * sizeof(int));
  for(R_xlen_t i = 0 ; i < n ; i++) {
    if (x[i] != NA_INTEGER && x[i] > 0 && x[i] <= nb) {
      y[x[i] - 1]++;
    }
  }
     
  return ans;
')
tabulate2(c(1L, 1L, 1L, 2L, 2L), 3)
#> [1] 3 2 0

# To get this to compile, I also removed the call to _() which is an internal R function used to translate error messages between different languages.
# 
# The final version below moves more of the coercion logic into an accompanying R function, and does some minor restructuring to make the code a little easier to understand. I also added a PROTECT(); this is probably missing in the original because the author knew that it would be safe.

tabulate_ <- cfunction(c(bin = "SEXP", nbins = "SEXP"), '  
  int nb = asInteger(nbins);

  // Allocate vector for output - assumes that there are 
  // less than 2^32 bins, and that each bin has less than 
  // 2^32 elements in it.
  SEXP out = PROTECT(allocVector(INTSXP, nb));
  int *pbin = INTEGER(bin), *pout = INTEGER(out);
  memset(pout, 0, nb * sizeof(int));

  R_xlen_t n = xlength(bin);
  for(R_xlen_t i = 0; i < n; i++) {
    int val = pbin[i];
    if (val != NA_INTEGER && val > 0 && val <= nb) {
      pout[val - 1]++; // C is zero-indexed
    }
  }
  UNPROTECT(1);   
  
  return out;
')

tabulate3 <- function(bin, nbins) {
  bin <- as.integer(bin)
  if (length(nbins) != 1 || nbins <= 0 || is.na(nbins)) {
    stop("nbins must be a positive integer", call. = FALSE)
  }
  tabulate_(bin, nbins)
}
tabulate3(c(1, 1, 1, 2, 2), 3)
#> [1] 3 2 0

