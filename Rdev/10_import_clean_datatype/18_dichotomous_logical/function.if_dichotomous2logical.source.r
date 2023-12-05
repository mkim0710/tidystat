
# http://adv-r.had.co.nz/Data-structures.html
# https://adv-r.hadley.nz/vectors-chap.html
list(
    1:3,
    c(1, 2, 1), 
    c(F, T, F), 
    c("F", "T", "F"), 
    factor(c("no", "yes", "no")),
    c(as.Date("2024-01-01"), as.Date("2024-01-02"), as.Date("2024-01-03"))
    ) %>% dput
# > list(
# +     1:3,
# +     c(1, 2, 1), 
# +     c(F, T, F), 
# +     c("F", "T", "F"), 
# +     factor(c("no", "yes", "no")),
# +     c(as.Date("2024-01-01"), as.Date("2024-01-02"), as.Date("2024-01-03"))
# +     ) %>% dput
# list(1:3, c(1, 2, 1), c(FALSE, TRUE, FALSE), c("F", "T", "F"), 
#     structure(c(1L, 2L, 1L), levels = c("no", "yes"), class = "factor"), 
#     structure(c(19723, 19724, 19725), class = "Date"))

list(
    1:3,
    c(1, 2, 1), 
    c(F, T, F), 
    c("F", "T", "F"), 
    factor(c("no", "yes", "no")),
    c(as.Date("2024-01-01"), as.Date("2024-01-02"), as.Date("2024-01-03"))
    )  %>% {tibble(value = .)} %>% mutate(class = value %>% map_chr(class), typeof = value %>% map_chr(typeof), is.logical = value %>% map_lgl(is.logical), is.numeric = value %>% map_lgl(is.numeric), is.character = value %>% map_lgl(is.character), is.factor = value %>% map_lgl(is.factor), is.Date = value %>% map_lgl(is.Date), is.integer = value %>% map_lgl(is.integer), is.double = value %>% map_lgl(is.double), is.atomic = value %>% map_lgl(is.atomic))
# > list(
# +     1:3,
# +     c(1, 2, 1), 
# +     c(F, T, F), 
# +     c("F", "T", "F"), 
# +     factor(c("no", "yes", "no")),
# +     c(as.Date("2024-01-01"), as.Date("2024-01-02"), as.Date("2024-01-03"))
# +     )  %>% {tibble(value = .)} %>% mutate(class = value %>% map_chr(class), typeof = value %>% map_chr(typeof), is.logical = value %>% map_lgl(is.logical), is.numeric = value %>% map_lgl(is.numeric), is.character = value %>% map_lgl(is.character), is.factor = value %>% map_lgl(is.factor), is.Date = value %>% map_lgl(is.Date), is.integer = value %>% map_lgl(is.integer), is.double = value %>% map_lgl(is.double), is.atomic = value %>% map_lgl(is.atomic))
# # A tibble: 6 × 11
#   value      class     typeof    is.logical is.numeric is.character is.factor is.Date is.integer is.double is.atomic
#   <list>     <chr>     <chr>     <lgl>      <lgl>      <lgl>        <lgl>     <lgl>   <lgl>      <lgl>     <lgl>    
# 1 <int [3]>  integer   integer   FALSE      TRUE       FALSE        FALSE     FALSE   TRUE       FALSE     TRUE     
# 2 <dbl [3]>  numeric   double    FALSE      TRUE       FALSE        FALSE     FALSE   FALSE      TRUE      TRUE     
# 3 <lgl [3]>  logical   logical   TRUE       FALSE      FALSE        FALSE     FALSE   FALSE      FALSE     TRUE     
# 4 <chr [3]>  character character FALSE      FALSE      TRUE         FALSE     FALSE   FALSE      FALSE     TRUE     
# 5 <fct [3]>  factor    integer   FALSE      FALSE      FALSE        TRUE      FALSE   FALSE      FALSE     TRUE     
# 6 <date [3]> Date      double    FALSE      FALSE      FALSE        FALSE     TRUE    FALSE      TRUE      TRUE 

factor(c("no", "yes")) %>% {data.frame(value = .)} %>% mutate(class = class(value), typeof = typeof(value), is.logical = is.logical(value), is.numeric = is.numeric(value), is.character = is.character(value), is.factor = is.factor(value), is.Date = is.Date(value), is.integer = is.integer(value), is.double = is.double(value)) 
as.Date("2024-01-01") %>% {data.frame(value = .)} %>% mutate(class = class(value), typeof = typeof(value), is.logical = is.logical(value), is.numeric = is.numeric(value), is.character = is.character(value), is.factor = is.factor(value), is.Date = is.Date(value), is.integer = is.integer(value), is.double = is.double(value)) 
# > factor(c("no", "yes")) %>% {data.frame(value = .)} %>% mutate(class = class(value), typeof = typeof(value), is.logical = is.logical(value), is.numeric = is.numeric(value), is.character = is.character(value), is.factor = is.factor(value), is.Date = is.Date(value), is.integer = is.integer(value), is.double = is.double(value)) 
#   value  class  typeof is.logical is.numeric is.character is.factor is.Date is.integer is.double
# 1    no factor integer      FALSE      FALSE        FALSE      TRUE   FALSE      FALSE     FALSE
# 2   yes factor integer      FALSE      FALSE        FALSE      TRUE   FALSE      FALSE     FALSE
# > as.Date("2024-01-01") %>% {data.frame(value = .)} %>% mutate(class = class(value), typeof = typeof(value), is.logical = is.logical(value), is.numeric = is.numeric(value), is.character = is.character(value), is.factor = is.factor(value), is.Date = is.Date(value), is.integer = is.integer(value), is.double = is.double(value)) 
#        value class typeof is.logical is.numeric is.character is.factor is.Date is.integer is.double
# 1 2024-01-01  Date double      FALSE      FALSE        FALSE     FALSE    TRUE      FALSE      TRUE

factor(c("no", "yes", "no")) %>% {cat("class:",class(.), "|typeof:",typeof(.), "|is.logical:",is.logical(.), "|is.numeric:",is.numeric(.), "|is.character:",is.character(.), "|is.factor:",is.factor(.), "|is.Date:",is.Date(.), "\n", sep = ""); str(.)}
# > factor(c("no", "yes", "no")) %>% {cat("class:",class(.), "|typeof:",typeof(.), "|is.logical:",is.logical(.), "|is.numeric:",is.numeric(.), "|is.character:",is.character(.), "|is.factor:",is.factor(.), "|is.Date:",is.Date(.), "\n", sep = ""); str(.)}
# class:factor|typeof:integer|is.logical:FALSE|is.numeric:FALSE|is.character:FALSE|is.factor:TRUE|is.Date:FALSE
#  Factor w/ 2 levels "no","yes": 1 2 1




function.dichotomous2logical = function(vec, dichotomous2integer = F) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.dichotomous2logical.source.r")
    # caution) as.numeric(CategoricalVariable_3MoreLevels)
    text4warning = ""
    coding0 = ifelse(dichotomous2integer == T, 0, "FALSE")
    coding1 = ifelse(dichotomous2integer == T, 1, "TRUE")
    
    if (is.numeric(vec)) {vec.as_character.as_factor = as.factor(as.character(vec))} 
    if (is.character(vec)) {vec.as_character.as_factor = as.factor(vec)}
    if (is.logical(vec)) {vec.as_character.as_factor = vec}
    if (is.factor(vec)) {vec.as_character.as_factor = vec}
    if (is.Date(vec)) {return(vec)}
    
    if (!is.null(levels(vec.as_character.as_factor))) {
        if (length(levels(vec.as_character.as_factor)) == 1) {
            text4warning = paste0("length(unique(vec.as_character.as_factor)) == 1 --> coded to ", coding0)
            vec.as_character.as_factor = as.integer(vec.as_character.as_factor) - 1L
        } else if (length(levels(vec.as_character.as_factor)) == 2) {
            text4warning = paste0(ifelse(is.null(levels(vec.as_character.as_factor)[1]), "NULL", levels(vec.as_character.as_factor)[1]), " is coded to ", coding0, " & ", ifelse(is.null(levels(vec.as_character.as_factor)[2]), "NULL", levels(vec.as_character.as_factor)[2]), " is coded to ", coding1)
            vec.as_character.as_factor = as.integer(vec.as_character.as_factor) - 1L
        } else if (length(levels(vec.as_character.as_factor)) > 2) {
            # stop("length(levels(vec.as_character.as_factor)) > 2")
            text4warning = "length(levels(vec.as_character.as_factor)) > 2"
            warning(text4warning); cat('\n')
            attributes(vec)$function.dichotomous2logical = text4warning
            return(vec)
        }
    }
    rm(vec)
    
    if (dichotomous2integer == T) {
        # if (is.logical(vec.as_character.as_factor)) {vec.as_character.as_factor = as.integer(vec.as_character.as_factor)}
        vec.out = as.integer(vec.as_character.as_factor)
    } else {
        vec.out = as.logical(vec.as_character.as_factor) 
    }
    rm(vec.as_character.as_factor)
    
    if (!is.null(levels(vec.out))) {
        print(levels(vec.out))
        levels(vec.out) = c("FALSE", "TRUE")
    }
    
    if(text4warning != "") {warning(text4warning); cat('\n'); attributes(vec.out)$function.dichotomous2logical = text4warning}
    vec.out
}
c(1, 2, 1) %>% function.dichotomous2logical %>% str %>% try
c(1, 2, 1) %>% function.dichotomous2logical(dichotomous2integer = TRUE) %>% str %>% try
c(F, T, F) %>% function.dichotomous2logical %>% str %>% try
c(F, T, F) %>% function.dichotomous2logical(dichotomous2integer = TRUE) %>% str %>% try
c("F", "T", "F") %>% function.dichotomous2logical %>% str %>% try
c("F", "T", "F") %>% function.dichotomous2logical(dichotomous2integer = TRUE) %>% str %>% try
c("No", "Yes", "No") %>% function.dichotomous2logical %>% str %>% try
c("No", "Yes", "No") %>% function.dichotomous2logical(dichotomous2integer = TRUE) %>% str %>% try
factor(c("no", "yes", "no")) %>% function.dichotomous2logical %>% str %>% try
factor(c("no", "yes", "no")) %>% function.dichotomous2logical(dichotomous2integer = TRUE) %>% str %>% try
factor(c("No", "Yes", "NA")) %>% function.dichotomous2logical %>% str %>% try
factor(c("No", "Yes", "NA")) %>% function.dichotomous2logical(dichotomous2integer = TRUE) %>% str %>% try
c(1, 2, 3) %>% function.dichotomous2logical %>% str %>% try
c(1, 2, 3) %>% function.dichotomous2logical(dichotomous2integer = TRUE) %>% str %>% try
c(1, 1, 1) %>% function.dichotomous2logical %>% str %>% try
c(1, 1, 1) %>% function.dichotomous2logical(dichotomous2integer = TRUE) %>% str %>% try
c(as.Date("2024-01-01"), as.Date("2024-01-02"), as.Date("2024-01-03")) %>% function.dichotomous2logical %>% str %>% try
# > c(1, 2, 1) %>% function.dichotomous2logical %>% str %>% try
# 경고: 1 is coded to FALSE & 2 is coded to TRUE
#  logi [1:3] FALSE TRUE FALSE
#  - attr(*, "function.dichotomous2logical")= chr "1 is coded to FALSE & 2 is coded to TRUE"
# > c(1, 2, 1) %>% function.dichotomous2logical(dichotomous2integer = TRUE) %>% str %>% try
# 경고: 1 is coded to 0 & 2 is coded to 1
#  int [1:3] 0 1 0
#  - attr(*, "function.dichotomous2logical")= chr "1 is coded to 0 & 2 is coded to 1"
# > c(F, T, F) %>% function.dichotomous2logical %>% str %>% try
#  logi [1:3] FALSE TRUE FALSE
# > c(F, T, F) %>% function.dichotomous2logical(dichotomous2integer = TRUE) %>% str %>% try
#  int [1:3] 0 1 0
# > c("F", "T", "F") %>% function.dichotomous2logical %>% str %>% try
# 경고: F is coded to FALSE & T is coded to TRUE
#  logi [1:3] FALSE TRUE FALSE
#  - attr(*, "function.dichotomous2logical")= chr "F is coded to FALSE & T is coded to TRUE"
# > c("F", "T", "F") %>% function.dichotomous2logical(dichotomous2integer = TRUE) %>% str %>% try
# 경고: F is coded to 0 & T is coded to 1
#  int [1:3] 0 1 0
#  - attr(*, "function.dichotomous2logical")= chr "F is coded to 0 & T is coded to 1"
# > c("No", "Yes", "No") %>% function.dichotomous2logical %>% str %>% try
# 경고: No is coded to FALSE & Yes is coded to TRUE
#  logi [1:3] FALSE TRUE FALSE
#  - attr(*, "function.dichotomous2logical")= chr "No is coded to FALSE & Yes is coded to TRUE"
# > c("No", "Yes", "No") %>% function.dichotomous2logical(dichotomous2integer = TRUE) %>% str %>% try
# 경고: No is coded to 0 & Yes is coded to 1
#  int [1:3] 0 1 0
#  - attr(*, "function.dichotomous2logical")= chr "No is coded to 0 & Yes is coded to 1"
# > factor(c("no", "yes", "no")) %>% function.dichotomous2logical %>% str %>% try
# 경고: no is coded to FALSE & yes is coded to TRUE
#  logi [1:3] FALSE TRUE FALSE
#  - attr(*, "function.dichotomous2logical")= chr "no is coded to FALSE & yes is coded to TRUE"
# > factor(c("no", "yes", "no")) %>% function.dichotomous2logical(dichotomous2integer = TRUE) %>% str %>% try
# 경고: no is coded to 0 & yes is coded to 1
#  int [1:3] 0 1 0
#  - attr(*, "function.dichotomous2logical")= chr "no is coded to 0 & yes is coded to 1"
# > factor(c("No", "Yes", "NA")) %>% function.dichotomous2logical %>% str %>% try
# 경고: length(levels(vec.as_character.as_factor)) > 2
#  Factor w/ 3 levels "NA","No","Yes": 2 3 1
#  - attr(*, "function.dichotomous2logical")= chr "length(levels(vec.as_character.as_factor)) > 2"
# > factor(c("No", "Yes", "NA")) %>% function.dichotomous2logical(dichotomous2integer = TRUE) %>% str %>% try
# 경고: length(levels(vec.as_character.as_factor)) > 2
#  Factor w/ 3 levels "NA","No","Yes": 2 3 1
#  - attr(*, "function.dichotomous2logical")= chr "length(levels(vec.as_character.as_factor)) > 2"
# > c(1, 2, 3) %>% function.dichotomous2logical %>% str %>% try
# 경고: length(levels(vec.as_character.as_factor)) > 2
#  num [1:3] 1 2 3
#  - attr(*, "function.dichotomous2logical")= chr "length(levels(vec.as_character.as_factor)) > 2"
# > c(1, 2, 3) %>% function.dichotomous2logical(dichotomous2integer = TRUE) %>% str %>% try
# 경고: length(levels(vec.as_character.as_factor)) > 2
#  num [1:3] 1 2 3
#  - attr(*, "function.dichotomous2logical")= chr "length(levels(vec.as_character.as_factor)) > 2"
# > c(1, 1, 1) %>% function.dichotomous2logical %>% str %>% try
# 경고: length(unique(vec.as_character.as_factor)) == 1 --> coded to FALSE
#  logi [1:3] FALSE FALSE FALSE
#  - attr(*, "function.dichotomous2logical")= chr "length(unique(vec.as_character.as_factor)) == 1 --> coded to FALSE"
# > c(1, 1, 1) %>% function.dichotomous2logical(dichotomous2integer = TRUE) %>% str %>% try
# 경고: length(unique(vec.as_character.as_factor)) == 1 --> coded to 0
#  int [1:3] 0 0 0
#  - attr(*, "function.dichotomous2logical")= chr "length(unique(vec.as_character.as_factor)) == 1 --> coded to 0"
# > c(as.Date("2024-01-01"), as.Date("2024-01-02"), as.Date("2024-01-03")) %>% function.dichotomous2logical %>% str %>% try
#  Date[1:3], format: "2024-01-01" "2024-01-02" "2024-01-03"













#@ test) function.binary2numeric() ----
library(tidyverse)
c(T, F, T) %>% is.numeric
c(T, F, T) %>% is.character
c(T, F, T) %>% levels
c(T, F, T) %>% levels %>% length
c(T, F, T) %>% unique %>% length
function.dichotomous2logical(c(T, T, T)) %>% str %>% try
function.dichotomous2logical(c(F, F, F)) %>% str %>% try
function.dichotomous2logical(c(T, F, T)) %>% str %>% try
function.dichotomous2logical(c("A", "A", "B", "B", "A")) %>% str %>% try
function.dichotomous2logical(c("A", "A", "B", "C", "A")) %>% str %>% try
function.dichotomous2logical(c(T, T, T), dichotomous2integer = T) %>% str %>% try
function.dichotomous2logical(c(F, F, F), dichotomous2integer = T) %>% str %>% try
function.dichotomous2logical(c(T, F, T), dichotomous2integer = T) %>% str %>% try
function.dichotomous2logical(c("A", "A", "B", "B", "A"), dichotomous2integer = T) %>% str %>% try
function.dichotomous2logical(c("A", "A", "B", "C", "A"), dichotomous2integer = T) %>% str %>% try
# > c(T, F, T) %>% is.numeric
# [1] FALSE
# > c(T, F, T) %>% is.character
# [1] FALSE
# > c(T, F, T) %>% levels
# NULL
# > c(T, F, T) %>% levels %>% length
# [1] 0
# > c(T, F, T) %>% unique %>% length
# [1] 2
# > function.dichotomous2logical(c(T, T, T)) %>% str %>% try
# 경고: length(unique(x)) == 1 logi [1:3] TRUE TRUE TRUE
# > function.dichotomous2logical(c(F, F, F)) %>% str %>% try
# 경고: length(unique(x)) == 1 logi [1:3] FALSE FALSE FALSE
# > function.dichotomous2logical(c(T, F, T)) %>% str %>% try
#  logi [1:3] TRUE FALSE TRUE
# > function.dichotomous2logical(c("A", "A", "B", "B", "A")) %>% str %>% try
# 경고: A is coded to FALSE & B is coded to TRUE logi [1:5] FALSE FALSE TRUE TRUE FALSE
#  - attr(*, "warning")= chr "A is coded to FALSE & B is coded to TRUE"
# > function.dichotomous2logical(c("A", "A", "B", "C", "A")) %>% str %>% try
# Error in function.dichotomous2logical(c("A", "A", "B", "C", "A")) : 
#   length(levels(x)) > 2
# > function.dichotomous2logical(c(T, T, T), dichotomous2integer = T) %>% str %>% try
# 경고: length(unique(x)) == 1 int [1:3] 1 1 1
# > function.dichotomous2logical(c(F, F, F), dichotomous2integer = T) %>% str %>% try
# 경고: length(unique(x)) == 1 int [1:3] 0 0 0
# > function.dichotomous2logical(c(T, F, T), dichotomous2integer = T) %>% str %>% try
#  int [1:3] 1 0 1
# > function.dichotomous2logical(c("A", "A", "B", "B", "A"), dichotomous2integer = T) %>% str %>% try
# 경고: A is coded to 0 & B is coded to 1 int [1:5] 0 0 1 1 0
#  - attr(*, "warning")= chr "A is coded to 0 & B is coded to 1"
# > function.dichotomous2logical(c("A", "A", "B", "C", "A"), dichotomous2integer = T) %>% str %>% try
# Error in function.dichotomous2logical(c("A", "A", "B", "C", "A"), dichotomous2integer = T) : 
#   length(levels(x)) > 2








#@ ------
# function.binary2numeric = function(x, binary2logical = F) {
#     # source("https://github.com/mkim0710/tidystat/raw/master/function.binary2numeric.source.r")
#     # caution) as.numeric(CategoricalVariable_3MoreLevels)
#     if (is.character(x)) {
#         x = as.factor(x)
#     }
#     if (length(levels(x)) == 2) {
#         if (binary2logical == T) {
#             warning(paste0(levels(x)[1], " is coded to FALSE & ", levels(x)[2], " is coded to TRUE"))
#         } else {
#             warning(paste0(levels(x)[1], " is coded to 0 & ", levels(x)[2], " is coded to 1"))
#         }
#         x = as.numeric(x) - 1
#     } else if (length(levels(x)) > 2) {
#         stop("length(levels(x)) > 2")
#     }
#     if (is.logical(x)) {
#         x = as.numeric(x)
#     }
#     if (binary2logical == T) {
#         x = as.logical(x)
#     }
#     x
# }
# 
# #@ test) function.binary2numeric() ----
# function.binary2numeric(c(T, F ,T))
# function.binary2numeric(c("A", "A", "B", "B", "A"))
# function.binary2numeric(c("A", "A", "B", "C", "A"))
# function.binary2numeric(c(T, F ,T), binary2logical = T)
# function.binary2numeric(c("A", "A", "B", "B", "A"), binary2logical = T)
# function.binary2numeric(c("A", "A", "B", "C", "A"), binary2logical = T)
# # > function.binary2numeric(c(T, F ,T))
# # [1] 1 0 1
# # > function.binary2numeric(c("A", "A", "B", "B", "A"))
# # [1] 0 0 1 1 0
# # Warning message:
# # In function.binary2numeric(c("A", "A", "B", "B", "A")) :
# #   A is coded to 0 & B is coded to 1
# # > function.binary2numeric(c("A", "A", "B", "C", "A"))
# # Error in function.binary2numeric(c("A", "A", "B", "C", "A")) : 
# #   length(levels(x)) > 2
# # > function.binary2numeric(c(T, F ,T), binary2logical = T)
# # [1]  TRUE FALSE  TRUE
# # > function.binary2numeric(c("A", "A", "B", "B", "A"), binary2logical = T)
# # [1] FALSE FALSE  TRUE  TRUE FALSE
# # Warning message:
# # In function.binary2numeric(c("A", "A", "B", "B", "A"), binary2logical = T) :
# #   A is coded to FALSE & B is coded to TRUE
# # > function.binary2numeric(c("A", "A", "B", "C", "A"), binary2logical = T)
# # Error in function.binary2numeric(c("A", "A", "B", "C", "A"), binary2logical = T) : 
# #   length(levels(x)) > 2





#@ ------
df$FamilyIncome_ge7000 %>% head(10) %>% dput
# > df$FamilyIncome_ge7000 %>% head(10) %>% dput
# c(0, 1, 0, 1, 1, 0, NA, 1, 0, 0)
df$FamilyIncome_ge7000 %>% str
df$FamilyIncome_ge7000 %>% unique
df$FamilyIncome_ge7000 %>% unique %>% length
df$FamilyIncome_ge7000 %>% na.omit %>% unique
df$FamilyIncome_ge7000 %>% na.omit %>% unique %>% length
# > df$FamilyIncome_ge7000 %>% str
#  num [1:14407] 0 1 0 1 1 0 NA 1 0 0 ...
#  - attr(*, "format.stata")= chr "%9.0g"
# > df$FamilyIncome_ge7000 %>% unique
# [1]  0  1 NA
# > df$FamilyIncome_ge7000 %>% unique %>% length
# [1] 3
# > df$FamilyIncome_ge7000 %>% na.omit %>% unique
# [1] 0 1
# > df$FamilyIncome_ge7000 %>% na.omit %>% unique %>% length
# [1] 2



function.if_dichotomous2logical = function(x, dichotomous2integer = F) {
    # source("https://github.com/mkim0710/tidystat/raw/master/function.dichotomous2logical.source.r")
    # caution) as.numeric(CategoricalVariable_3MoreLevels)

    x.na.omit.unique.length = length(unique(na.omit(x)))
    if (x.na.omit.unique.length == 1) {
        warning("length(unique(x)) == 1")
    } 
    if (x.na.omit.unique.length %in% 1:2) {
        if (is.numeric(x)) {
            x = as.character(x)
        } 
        if (is.character(x)) {
            x = as.factor(x)
        }
        if (dichotomous2integer == T) {
            warning(paste0(ifelse(is.null(levels(x)[1]), "NULL", levels(x)[1]), " is coded to 0 & ", ifelse(is.null(levels(x)[2]), "NULL", levels(x)[2]), " is coded to 1"))
        } else {
            warning(paste0(ifelse(is.null(levels(x)[1]), "NULL", levels(x)[1]), " is coded to FALSE & ", ifelse(is.null(levels(x)[2]), "NULL", levels(x)[2]), " is coded to TRUE"))
        }
        x = as.integer(x) - 1
        
        if (dichotomous2integer == T) {
            x = as.integer(x)
        } else {
            x = as.logical(x) 
        }
        # } else if (length(levels(x)) > 2) {
        #     stop("length(levels(x)) > 2")
    }
    x
}
    
#@ data4FullModel.by_varname_level.list_list ====
# data = analyticDF_C24.drop_pmhx_negativetime.list.cut[[name4MainData]]
data = n1_2016_withlabels_EPI522_merge_n2_recode1026.factor.mutate
data = data[, varnames4FullModel] %>% map_df(function.if_dichotomous2logical)
data = data %>% mutate_if(is.logical, as.factor)

data4FullModel.by_varname_level.list_list <- list()
data4FullModel.by_varname_level.list_list$AllSubjects = list()
data4FullModel.by_varname_level.list_list$AllSubjects$AllSubjects = data[, varnames4FullModel]
for (i in varnames4FullModel) {
    if (i %in% c(varname4time, varname4event)) {
        data4FullModel.by_varname_level.list_list[[i]] = NULL
    } else if (is.logical(data[[i]])) {
        temp.data <- data[!is.na(data[[i]]), varnames4FullModel]
        
        data4FullModel.by_varname_level.list_list[[i]] <- list()
        for (j in c("FALSE", "TRUE") ) {
            data4FullModel.by_varname_level.list_list[[i]][[j]] <- temp.data[ temp.data[[i]] == j , ]
        }
        
    } else {
        temp.data <- data[!is.na(data[[i]]), varnames4FullModel]
        
        data4FullModel.by_varname_level.list_list[[i]] <- list()
        for (j in levels(data[[i]]) ) {
            data4FullModel.by_varname_level.list_list[[i]][[j]] <- temp.data[ temp.data[[i]] == j , ]
        }
    }
}
attributes(data4FullModel.by_varname_level.list_list)$attributes =
    list(
        name4MainData = name4MainData
        , varnames4FullModel = varnames4FullModel
        , varname4event = varname4event
        , varname4time = varname4time
        , divide_time = divide_time
        , data.dim = dim(data)
        , data.colnames = colnames(data)
        , data.object.size = object.size(data)
        , data.map.typeof = data %>% map(typeof)
        , data.map.class = data %>% map(class)
        , data.map.levels = data %>% map(levels)
    )

data4FullModel.by_varname_level.list_list %>% str(max.level = 1) #----
data4FullModel.by_varname_level.list_list %>% str(max.level = 2) #----
# data4FullModel.by_varname_level.list_list$SEX$Male %>% str(max.level = 1) #----
data4FullModel.by_varname_level.list_list$Male$`TRUE` %>% str(max.level = 1) #----
# > data4FullModel.by_varname_level.list_list %>% str(max.level = 1) #----
# List of 14
#  $ AllSubjects        :List of 1
#  $ Cigar.cut100       :List of 3
#  $ CigarettePackYear  : list()
#  $ Age.cut2575        :List of 5
#  $ Male               :List of 2
#  $ RaceWhite          :List of 2
#  $ bmi4category       :List of 4
#  $ Alcohol_3cat       :List of 3
#  $ HighSchoolLastYear :List of 2
#  $ FamilyIncome_ge7000:List of 2
#  $ nutrition_calories : list()
#  $ nutrition_protein  : list()
#  $ nutrition_fat      : list()
#  $ nutrition_carb     : list()
#  - attr(*, "attributes")=List of 11
# > data4FullModel.by_varname_level.list_list %>% str(max.level = 2) #----
# List of 14
#  $ AllSubjects        :List of 1
#   ..$ AllSubjects:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	14407 obs. of  15 variables:
#  $ Cigar.cut100       :List of 3
#   ..$ [0,50)   :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	5703 obs. of  15 variables:
#   ..$ [50,100) :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1165 obs. of  15 variables:
#   ..$ [100,Inf]:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	37 obs. of  15 variables:
#  $ CigarettePackYear  : list()
#  $ Age.cut2575        :List of 5
#   ..$ [25,35):Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	3538 obs. of  15 variables:
#   ..$ [35,45):Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2942 obs. of  15 variables:
#   ..$ [45,55):Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2281 obs. of  15 variables:
#   ..$ [55,65):Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1803 obs. of  15 variables:
#   ..$ [65,75]:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	3843 obs. of  15 variables:
#  $ Male               :List of 2
#   ..$ FALSE:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	8597 obs. of  15 variables:
#   ..$ TRUE :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	5810 obs. of  15 variables:
#  $ RaceWhite          :List of 2
#   ..$ FALSE:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2354 obs. of  15 variables:
#   ..$ TRUE :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	12053 obs. of  15 variables:
#  $ bmi4category       :List of 4
#   ..$ [0,18.5) :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	531 obs. of  15 variables:
#   ..$ [18.5,25):Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	6757 obs. of  15 variables:
#   ..$ [25,30)  :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	4711 obs. of  15 variables:
#   ..$ [30,Inf] :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	2408 obs. of  15 variables:
#  $ Alcohol_3cat       :List of 3
#   ..$ Alcohol_le1pwk   :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	6694 obs. of  15 variables:
#   ..$ Alcohol_ge2le3pwk:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1722 obs. of  15 variables:
#   ..$ Alcohol_ge4pwk   :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1820 obs. of  15 variables:
#  $ HighSchoolLastYear :List of 2
#   ..$ FALSE:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	6387 obs. of  15 variables:
#   ..$ TRUE :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	7915 obs. of  15 variables:
#  $ FamilyIncome_ge7000:List of 2
#   ..$ FALSE:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	5378 obs. of  15 variables:
#   ..$ TRUE :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	8482 obs. of  15 variables:
#  $ nutrition_calories : list()
#  $ nutrition_protein  : list()
#  $ nutrition_fat      : list()
#  $ nutrition_carb     : list()
#  - attr(*, "attributes")=List of 11
#   ..$ name4MainData     : NULL
#   ..$ varnames4FullModel: chr [1:15] "ihd" "timeihd" "Cigar.cut100" "CigarettePackYear" ...
#   ..$ varname4event     : chr "ihd"
#   ..$ varname4time      : chr "timeihd"
#   ..$ divide_time       : num 12
#   ..$ data.dim          : int [1:2] 14407 15
#   ..$ data.colnames     : chr [1:15] "ihd" "timeihd" "Cigar.cut100" "CigarettePackYear" ...
#   ..$ data.object.size  : 'object_size' num 1218120
#   ..$ data.map.typeof   :List of 15
#   ..$ data.map.class    :List of 15
#   ..$ data.map.levels   :List of 15
# > # data4FullModel.by_varname_level.list_list$SEX$Male %>% str(max.level = 1) #----
# > data4FullModel.by_varname_level.list_list$Male$`TRUE` %>% str(max.level = 1) #----
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	5810 obs. of  15 variables:
#  $ ihd                : Factor w/ 2 levels "FALSE","TRUE": 2 1 1 1 1 2 1 1 1 1 ...
#  $ timeihd            : num  59 253 0 94 253 104 253 253 196 54 ...
#  $ Cigar.cut100       : Factor w/ 3 levels "[0,50)","[50,100)",..: NA NA NA NA NA NA NA NA NA NA ...
#  $ CigarettePackYear  : num  NA NA NA NA NA NA NA NA NA NA ...
#  $ Age.cut2575        : Factor w/ 5 levels "[25,35)","[35,45)",..: 4 3 1 5 3 3 1 2 5 5 ...
#  $ Male               : Factor w/ 2 levels "FALSE","TRUE": 2 2 2 2 2 2 2 2 2 2 ...
#  $ RaceWhite          : Factor w/ 2 levels "FALSE","TRUE": 2 1 1 1 2 2 2 2 2 1 ...
#  $ bmi4category       : Factor w/ 4 levels "[0,18.5)","[18.5,25)",..: 3 3 2 3 2 4 3 2 3 3 ...
#  $ Alcohol_3cat       : Factor w/ 3 levels "Alcohol_le1pwk",..: 1 1 2 NA 2 1 1 3 3 NA ...
#  $ HighSchoolLastYear : Factor w/ 2 levels "FALSE","TRUE": 2 1 1 1 2 2 1 2 2 1 ...
#  $ FamilyIncome_ge7000: Factor w/ 2 levels "FALSE","TRUE": 2 1 1 1 2 2 2 2 1 2 ...
#  $ nutrition_calories : num  1452 1974 4578 1385 2541 ...
#  $ nutrition_protein  : num  67.9 75.7 245.6 53.7 134.9 ...
#  $ nutrition_fat      : num  55 81.8 150.1 78.3 66.3 ...
#  $ nutrition_carb     : num  160.7 182 414 80.2 244.6 ...

