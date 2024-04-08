# function.check.integer.dev.r



#@ -----
function.check.integer = function(x) x %% 1 == 0
function.check.integer.tolerance = function(x, tolerance = .Machine$double.eps^0.5)  abs(x - round(x)) < tolerance



#@ -----
NHID_GJ_0213.bind_rows.factor %>% map_lgl(function(vec) any(as.numeric(levels(vec)) %% 1 != 0)) %>% as.data.frame
# > NHID_GJ_0213.bind_rows.factor %>% map_lgl(function(vec) any(as.numeric(levels(vec)) %% 1 != 0)) %>% as.data.frame
#                               .
# HCHK_YEAR                 FALSE
# PERSON_ID                 FALSE
# YKIHO_GUBUN_CD            FALSE
# HEIGHT                    FALSE
# WEIGHT                    FALSE
# BP_HIGH                   FALSE
# BP_LWST                   FALSE
# BLDS                      FALSE
# TOT_CHOLE                 FALSE
# HMG                        TRUE
# GLY_CD                    FALSE
# OLIG_OCCU_CD              FALSE
# OLIG_PH                    TRUE
# OLIG_PROTE_CD             FALSE
# SGOT_AST                  FALSE
# SGPT_ALT                  FALSE
# GAMMA_GTP                 FALSE
# HCHK_PMH_CD1              FALSE
# HCHK_PMH_CD2              FALSE
# HCHK_PMH_CD3              FALSE
# FMLY_LIVER_DISE_PATIEN_YN FALSE
# FMLY_HPRTS_PATIEN_YN      FALSE
# FMLY_APOP_PATIEN_YN       FALSE
# FMLY_HDISE_PATIEN_YN      FALSE
# FMLY_DIABML_PATIEN_YN     FALSE
# FMLY_CANCER_PATIEN_YN     FALSE
# SMK_STAT_TYPE_RSPS_CD     FALSE
# SMK_TERM_RSPS_CD          FALSE
# DSQTY_RSPS_CD             FALSE
# DRNK_HABIT_RSPS_CD        FALSE
# TM1_DRKQTY_RSPS_CD         TRUE
# EXERCI_FREQ_RSPS_CD       FALSE
# WAIST                     FALSE
# TRIGLYCERIDE              FALSE
# HDL_CHOLE                  TRUE
# LDL_CHOLE                  TRUE
# CREATININE                 TRUE
# HCHK_APOP_PMH_YN          FALSE
# HCHK_HDISE_PMH_YN         FALSE
# HCHK_HPRTS_PMH_YN         FALSE
# HCHK_DIABML_PMH_YN        FALSE
# HCHK_HPLPDM_PMH_YN        FALSE
# HCHK_ETCDSE_PMH_YN        FALSE
# PAST_SMK_TERM_RSPS_CD     FALSE
# PAST_DSQTY_RSPS_CD        FALSE
# CUR_SMK_TERM_RSPS_CD      FALSE
# CUR_DSQTY_RSPS_CD          TRUE
# MOV20_WEK_FREQ_ID         FALSE
# MOV30_WEK_FREQ_ID         FALSE
# WLK30_WEK_FREQ_ID         FALSE
# HCHK_PHSS_PMH_YN          FALSE


NHID_GJ_0213.bind_rows.integer = NHID_GJ_0213.bind_rows.factor %>% map_df(function(vec) {
    if(any( as.numeric(levels(vec)) %% 1 != 0 )) {
        out = as.numeric(as.character(vec))
    } else if(any( as.numeric(levels(vec)) > 2 ^ .Machine$double.digits)) {
        # .Machine$double.digits
        # 2 ^ .Machine$double.digits
        # # > .Machine$double.digits
        # # [1] 53
        # # > 2 ^ .Machine$double.digits
        # # [1] 9.007199e+15
        out = as.factor(vec)
    } else if(any( as.numeric(levels(vec)) > .Machine$integer.max)) {
        # .Machine$integer.max
        # .Machine$integer.max / 10^9
        # # > .Machine$integer.max
        # # [1] 2147483647
        # # > .Machine$integer.max / 10^9
        # # [1] 2.147484
        out = as.numeric(as.character(vec))
    } else {
        out = as.integer(as.character(vec))
    }
    out
})


#@ https://cran.r-project.org/doc/FAQ/R-FAQ.html#Why-doesn_0027t-R-think-these-numbers-are-equal_003f -----
# 7.31 Why doesn’t R think these numbers are equal?
# The only numbers that can be represented exactly in R’s numeric type are integers and fractions whose denominator is a power of 2. All other numbers are internally rounded to (typically) 53 binary digits accuracy. As a result, two floating point numbers will not reliably be equal unless they have been computed by the same algorithm, and not always even then. For example
# 
# R> a <- sqrt(2)
# R> a * a == 2
# [1] FALSE
# R> a * a - 2
# [1] 4.440892e-16
# R> print(a * a, digits = 18)
# [1] 2.00000000000000044
# The function all.equal() compares two objects using a numeric tolerance of .Machine$double.eps ^ 0.5. If you want much greater accuracy than this you will need to consider error propagation carefully.
# 
# A discussion with many easily followed examples is in Appendix G “Computational Precision and Floating Point Arithmetic”, pages 753–771 of Statistical Analysis and Data Display: An Intermediate Course with Examples in R, Richard M. Heiberger and Burt Holland (Springer 2015, second edition). This appendix is a free download from http://link.springer.com/content/pdf/bbm%3A978-1-4939-2122-5%2F1.pdf.
# 
# For more information, see e.g. David Goldberg (1991), “What Every Computer Scientist Should Know About Floating-Point Arithmetic”, ACM Computing Surveys, 23/1, 5–48, also available via http://www.validlab.com/goldberg/paper.pdf.
# 
# Here is another example, this time using addition:
# 
# R> .3 + .6 == .9
# [1] FALSE
# R> .3 + .6 - .9
# [1] -1.110223e-16
# R> print(matrix(c(.3,  .6,  .9, .3 + .6)), digits = 18)
#                      [,1]
# [1,] 0.299999999999999989
# [2,] 0.599999999999999978
# [3,] 0.900000000000000022
# [4,] 0.899999999999999911


.Machine$double.eps
.Machine$double.eps^0.5
# > .Machine$double.eps
# [1] 2.220446e-16
# > .Machine$double.eps^0.5
# [1] 1.490116e-08


a = sqrt(2)
a * a == 2
all.equal(a * a, 2)
identical(a * a, 2)
# > a = sqrt(2)
# > a * a == 2
# [1] FALSE
# > all.equal(a * a, 2)
# [1] TRUE
# > identical(a * a, 2)
# [1] FALSE


.1 + 1 == 1.1
.1 + 1.2 == 1.3
1.1 + 1.2 == 2.3
.1 + .2 == .3
.3 + .6 == .9
.5 + .7 == 1.2
.9 + .7 == 1.6
# > .1 + 1 == 1.1
# [1] TRUE
# > .1 + 1.2 == 1.3
# [1] TRUE
# > 1.1 + 1.2 == 2.3
# [1] TRUE
# > .1 + .2 == .3
# [1] FALSE
# > .3 + .6 == .9
# [1] FALSE
# > .5 + .7 == 1.2
# [1] TRUE
# > .9 + .7 == 1.6
# [1] TRUE



#@ https://stackoverflow.com/questions/3476782/check-if-the-number-is-integer =====


-8.9 %>% dput
-0.5 %>% dput
-0.1 %>% dput
0 %>% dput
0.1 %>% dput
0.5 %>% dput
8.9 %>% dput
9.0 %>% dput
# > -8.9 %>% dput
# -8.9
# > -0.5 %>% dput
# -0.5
# > -0.1 %>% dput
# -0.1
# > 0 %>% dput
# 0
# > 0.1 %>% dput
# 0.1
# > 0.5 %>% dput
# 0.5
# > 8.9 %>% dput
# 8.9
# > 9.0 %>% dput
# 9


-8.9 %>% round %>% dput
-0.5 %>% round %>% dput
-0.1 %>% round %>% dput
0 %>% round %>% dput
0.1 %>% round %>% dput
0.5 %>% round %>% dput
8.9 %>% round %>% dput
9.0 %>% round %>% dput
# > -8.9 %>% round %>% dput
# -9
# > -0.5 %>% round %>% dput
# 0
# > -0.1 %>% round %>% dput
# 0
# > 0 %>% round %>% dput
# 0
# > 0.1 %>% round %>% dput
# 0
# > 0.5 %>% round %>% dput
# 0
# > 8.9 %>% round %>% dput
# 9
# > 9.0 %>% round %>% dput
# 9



-8.9 %>% {.%%1} %>% dput
-0.5 %>% {.%%1} %>% dput
-0.1 %>% {.%%1} %>% dput
0 %>% {.%%1} %>% dput
0.1 %>% {.%%1} %>% dput
0.5 %>% {.%%1} %>% dput
8.9 %>% {.%%1} %>% dput
9.0 %>% {.%%1} %>% dput
# > -8.9 %>% {.%%1} %>% dput
# 0.0999999999999996
# > -0.5 %>% {.%%1} %>% dput
# 0.5
# > -0.1 %>% {.%%1} %>% dput
# 0.9
# > 0 %>% {.%%1} %>% dput
# 0
# > 0.1 %>% {.%%1} %>% dput
# 0.1
# > 0.5 %>% {.%%1} %>% dput
# 0.5
# > 8.9 %>% {.%%1} %>% dput
# 0.9
# > 9.0 %>% {.%%1} %>% dput
# 0


-8.9%%1 == 0.1
identical(-8.9%%1, 0.1)
all.equal(-8.9%%1, 0.1)
# > -8.9%%1 == 0.1
# [1] FALSE
# > identical(-8.9%%1, 0.1)
# [1] FALSE
# > all.equal(-8.9%%1, 0.1)
# [1] TRUE

help("==")
# Do not use == and != for tests, such as in if expressions, where you must get a single TRUE or FALSE. Unless you are absolutely sure that nothing unusual can happen, you should use the identical function instead.
# These operators are sometimes called as functions as e.g. `<`(x, y): see the description of how argument-matching is done in Ops.




#@ -----
# https://stat.ethz.ch/pipermail/r-help/2012-January/300250.html ====
.Machine$integer.max
as.integer(2147483647)
as.integer(2147483648)
2147483648/2^24
2147483647/10^9
# > .Machine$integer.max
# [1] 2147483647
# > as.integer(2147483647)
# [1] 2147483647
# > as.integer(2147483648)
# [1] NA
# Warning message:
# NAs introduced by coercion to integer range 
# > 2147483648/2^24
# [1] 128
# > 2147483647/10^9
# [1] 2.1474836470000001

.Machine$double.digits
# > .Machine$double.digits
# [1] 53
2^5
2^6
# > 2^5
# [1] 32
# > 2^6
# [1] 64
2 ^ .Machine$double.digits
# > 2 ^ .Machine$double.digits
# [1] 9007199254740992

9007199254740992 / 10^15
# > 9007199254740992 / 10^15
# [1] 9.007199

options(digits = 22)
print(max.num <- 2 ^ .Machine$double.digits)
(max.num) - (max.num - 1)
(max.num + 1) - (max.num)
(max.num + 2) - (max.num + 1)
# > print(max.num <- 2 ^ .Machine$double.digits)
# [1] 9007199254740992
# > (max.num) - (max.num - 1)
# [1] 1
# > (max.num + 1) - (max.num)
# [1] 0
# > (max.num + 2) - (max.num + 1)
# [1] 2




#@ end ----
