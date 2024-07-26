# function.string.mutate.dev.r





#@ ?nchar ====
# ?nchar
# Usage
# nchar(x, type = "chars", allowNA = FALSE, keepNA = NA)
# nzchar(x, keepNA = FALSE)

x <- c("asfef", "qwerty", "yuiop[", "b", "stuff.blah.yech")
nchar(x)
# 5  6  6  1 15

deparse(mean)
# > deparse(mean)
# [1] "function (x, ...) "  "UseMethod(\"mean\")"
nchar(deparse(mean))
# 18 17  <-- unless mean differs from base::mean

x[3] <- NA; x
# > x[3] <- NA; x
# [1] "asfef"           "qwerty"          NA                "b"               "stuff.blah.yech"
nchar(x, keepNA= TRUE) #  5  6 NA  1 15
nchar(x, keepNA=FALSE) #  5  6  2  1 15
stopifnot(identical(nchar(x     ), nchar(x, keepNA= TRUE)),
          identical(nchar(x, "w"), nchar(x, keepNA=FALSE)),
          identical(is.na(x), is.na(nchar(x))))

##' nchar() for all three types :
nchars <- function(x, ...)
   vapply(c("chars", "bytes", "width"),
          function(tp) nchar(x, tp, ...), integer(length(x)))


nchars("\u200b") # in R versions (>= 2015-09-xx):
## chars bytes width
##     1     3     0

data.frame(x, nchars(x)) ## all three types : same unless for NA
# > data.frame(x, nchars(x)) ## all three types : same unless for NA
#                 x chars bytes width
# 1           asfef     5     5     5
# 2          qwerty     6     6     6
# 3            <NA>    NA    NA     2
# 4               b     1     1     1
# 5 stuff.blah.yech    15    15    15


## force the same by forcing 'keepNA':
(ncT <- nchars(x, keepNA = TRUE)) ## .... NA NA NA ....
(ncF <- nchars(x, keepNA = FALSE))## ....  2  2  2 ....
# > (ncT <- nchars(x, keepNA = TRUE)) ## .... NA NA NA ....
#      chars bytes width
# [1,]     5     5     5
# [2,]     6     6     6
# [3,]    NA    NA    NA
# [4,]     1     1     1
# [5,]    15    15    15
# > (ncF <- nchars(x, keepNA = FALSE))## ....  2  2  2 ....
#      chars bytes width
# [1,]     5     5     5
# [2,]     6     6     6
# [3,]     2     2     2
# [4,]     1     1     1
# [5,]    15    15    15
stopifnot(apply(ncT, 1, function(.) length(unique(.))) == 1,
          apply(ncF, 1, function(.) length(unique(.))) == 1)


#@ ?substr ====
# ?substr
# Usage
# substr(x, start, stop)
# substring(text, first, last = 1000000L)
# substr(x, start, stop) <- value
# substring(text, first, last = 1000000L) <- value

substr("abcdef", 2, 4)
substr("abcdef", 1:6, 1:6)
substring("abcdef", 1:6, 1:6)
substring("abcdef", 1:6, 6:1)
## strsplit is more efficient ...
# > substr("abcdef", 2, 4)
# [1] "bcd"
# > substr("abcdef", 1:6, 1:6)
# [1] "a"
# > substring("abcdef", 1:6, 1:6)
# [1] "a" "b" "c" "d" "e" "f"
# > substring("abcdef", 1:6, 6:1)
# [1] "abcdef" "bcde"   "cd"     ""       ""       ""      

rep("abcdef", 4)
substr(rep("abcdef", 4), 1:4, 4:5)
# > rep("abcdef", 4)
# [1] "abcdef" "abcdef" "abcdef" "abcdef"
# > substr(rep("abcdef", 4), 1:4, 4:5)
# [1] "abcd" "bcde" "cd"   "de"  

x <- c("asfef", "qwerty", "yuiop[", "b", "stuff.blah.yech")
substr(x, 2, 5)
substring(x, 2, 4:6)
# > substr(x, 2, 5)
# [1] "sfef" "wert" "uiop" ""     "tuff"
# > substring(x, 2, 4:6)
# [1] "sfe"   "wert"  "uiop[" ""      "tuff" 

substring(x, 2) <- c("..", "+++")
x
# > x
# [1] "a..ef"           "q+++ty"          "y..op["          "b"               "s..ff.blah.yech"




#@ ?regmatches =====
# ?regmatches
# Usage
# regmatches(x, m, invert = FALSE)
# regmatches(x, m, invert = FALSE) <- value

x <- c("A and B", "A, B and C", "A, B, C and D", "foobar")
pattern <- "[[:space:]]*(,|and)[[:space:]]"

grep(pattern, x)
grep(pattern, x, value = T)
# > grep(pattern, x)
# [1] 1 2 3
# > grep(pattern, x, value = T)
# [1] "A and B"       "A, B and C"    "A, B, C and D"


## Match data from regexpr() ----
m <- regexpr(pattern, x)
m |> str()
m |> dput()
m
# > m |> str()
#  int [1:4] 2 2 2 -1
#  - attr(*, "match.length")= int [1:4] 5 2 2 -1
#  - attr(*, "index.type")= chr "chars"
#  - attr(*, "useBytes")= logi TRUE
# > m |> dput()
# structure(c(2L, 2L, 2L, -1L), match.length = c(5L, 2L, 2L, -1L
# ), index.type = "chars", useBytes = TRUE)
# > m
# [1]  2  2  2 -1
# attr(,"match.length")
# [1]  5  2  2 -1
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE

regmatches(x, m) |> str()
regmatches(x, m, invert = TRUE) |> str()
regmatches(x, m)
regmatches(x, m, invert = TRUE)
# > regmatches(x, m) |> str()
#  chr [1:3] " and " ", " ", "
# > regmatches(x, m, invert = TRUE) |> str()
# List of 4
#  $ : chr [1:2] "A" "B"
#  $ : chr [1:2] "A" "B and C"
#  $ : chr [1:2] "A" "B, C and D"
#  $ : chr "foobar"
# > regmatches(x, m)
# [1] " and " ", "    ", "   
# > regmatches(x, m, invert = TRUE)
# [[1]]
# [1] "A" "B"
# 
# [[2]]
# [1] "A"       "B and C"
# 
# [[3]]
# [1] "A"          "B, C and D"
# 
# [[4]]
# [1] "foobar"


## Match data from gregexpr() ----
m <- gregexpr(pattern, x)
m |> str()
m |> dput()
m
# > m <- gregexpr(pattern, x)
# > m |> str()
# List of 4
#  $ : int 2
#   ..- attr(*, "match.length")= int 5
#   ..- attr(*, "index.type")= chr "chars"
#   ..- attr(*, "useBytes")= logi TRUE
#  $ : int [1:2] 2 5
#   ..- attr(*, "match.length")= int [1:2] 2 5
#   ..- attr(*, "index.type")= chr "chars"
#   ..- attr(*, "useBytes")= logi TRUE
#  $ : int [1:3] 2 5 8
#   ..- attr(*, "match.length")= int [1:3] 2 2 5
#   ..- attr(*, "index.type")= chr "chars"
#   ..- attr(*, "useBytes")= logi TRUE
#  $ : int -1
#   ..- attr(*, "match.length")= int -1
#   ..- attr(*, "index.type")= chr "chars"
#   ..- attr(*, "useBytes")= logi TRUE
# > m |> dput()
# list(structure(2L, match.length = 5L, index.type = "chars", useBytes = TRUE), 
#     structure(c(2L, 5L), match.length = c(2L, 5L), index.type = "chars", useBytes = TRUE), 
#     structure(c(2L, 5L, 8L), match.length = c(2L, 2L, 5L), index.type = "chars", useBytes = TRUE), 
#     structure(-1L, match.length = -1L, index.type = "chars", useBytes = TRUE))
# > m
# [[1]]
# [1] 2
# attr(,"match.length")
# [1] 5
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE
# 
# [[2]]
# [1] 2 5
# attr(,"match.length")
# [1] 2 5
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE
# 
# [[3]]
# [1] 2 5 8
# attr(,"match.length")
# [1] 2 2 5
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE
# 
# [[4]]
# [1] -1
# attr(,"match.length")
# [1] -1
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE

regmatches(x, m) |> str()
regmatches(x, m, invert = TRUE) |> str()
regmatches(x, m)
regmatches(x, m, invert = TRUE)
# > m <- gregexpr(pattern, x)
# > regmatches(x, m) |> str()
# List of 4
#  $ : chr " and "
#  $ : chr [1:2] ", " " and "
#  $ : chr [1:3] ", " ", " " and "
#  $ : chr(0) 
# > regmatches(x, m, invert = TRUE) |> str()
# List of 4
#  $ : chr [1:2] "A" "B"
#  $ : chr [1:3] "A" "B" "C"
#  $ : chr [1:4] "A" "B" "C" "D"
#  $ : chr "foobar"
# > regmatches(x, m)
# [[1]]
# [1] " and "
# 
# [[2]]
# [1] ", "    " and "
# 
# [[3]]
# [1] ", "    ", "    " and "
# 
# [[4]]
# character(0)
# 
# > regmatches(x, m, invert = TRUE)
# [[1]]
# [1] "A" "B"
# 
# [[2]]
# [1] "A" "B" "C"
# 
# [[3]]
# [1] "A" "B" "C" "D"
# 
# [[4]]
# [1] "foobar"



## Consider
x <- "John (fishing, hunting), Paul (hiking, biking)"
## Suppose we want to split at the comma (plus spaces) between the
## persons, but not at the commas in the parenthesized hobby lists.
## One idea is to "blank out" the parenthesized parts to match the
## parts to be used for splitting, and extract the persons as the
## non-matched parts.
## First, match the parenthesized hobby lists.
m <- gregexpr("\\([^)]*\\)", x)
m |> str()
m
# > m |> str()
# List of 4
#  $ : int -1
#   ..- attr(*, "match.length")= int -1
#   ..- attr(*, "index.type")= chr "chars"
#   ..- attr(*, "useBytes")= logi TRUE
#  $ : int -1
#   ..- attr(*, "match.length")= int -1
#   ..- attr(*, "index.type")= chr "chars"
#   ..- attr(*, "useBytes")= logi TRUE
#  $ : int -1
#   ..- attr(*, "match.length")= int -1
#   ..- attr(*, "index.type")= chr "chars"
#   ..- attr(*, "useBytes")= logi TRUE
#  $ : int -1
#   ..- attr(*, "match.length")= int -1
#   ..- attr(*, "index.type")= chr "chars"
#   ..- attr(*, "useBytes")= logi TRUE
# > m
# [[1]]
# [1] -1
# attr(,"match.length")
# [1] -1
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE
# 
# [[2]]
# [1] -1
# attr(,"match.length")
# [1] -1
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE
# 
# [[3]]
# [1] -1
# attr(,"match.length")
# [1] -1
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE
# 
# [[4]]
# [1] -1
# attr(,"match.length")
# [1] -1
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE


## Write a little utility for creating blank strings with given numbers of characters. ----
blanks <- function(n) strrep(" ", n)
## Create a copy of x with the parenthesized parts blanked out.
x <- "John (fishing, hunting), Paul (hiking, biking)"
s <- x
regmatches(s, m) <- Map(blanks, lapply(regmatches(s, m), nchar))
s |> str()
s
# > s |> str()
#  chr "John                   , Paul                 "
# > s
# [1] "John                   , Paul                 "

## Compute the positions of the split matches (note that we cannot call strsplit() on x with match data from s). ----
m <- gregexpr(", *", s)
m |> str()
m
# > m |> str()
# List of 1
#  $ : int 24
#   ..- attr(*, "match.length")= int 2
#   ..- attr(*, "index.type")= chr "chars"
#   ..- attr(*, "useBytes")= logi TRUE
# > m
# [[1]]
# [1] 24
# attr(,"match.length")
# [1] 2
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE

## And finally extract the non-matched parts. ----
regmatches(x, m, invert = TRUE)
# > regmatches(x, m, invert = TRUE)
# [[1]]
# [1] "John (fishing, hunting)" "Paul (hiking, biking)"  





#@@@@ library(stringr) ======
fruit |> str()
sentences |> str()
letters |> str()
LETTERS |> str()
# > fruit |> str()
#  chr [1:80] "apple" "apricot" "avocado" "banana" "bell pepper" "bilberry" "blackberry" "blackcurrant" "blood orange" ...
# > sentences |> str()
#  chr [1:720] "The birch canoe slid on the smooth planks." "Glue the sheet to the dark blue background." ...
# > letters |> str()
#  chr [1:26] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
# > LETTERS |> str()
#  chr [1:26] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"


#@ str_length() == nchar() ====
fruit |> str()
fruit %>% nchar |> str()
fruit |> str_length |> str()
# > fruit |> str()
#  chr [1:80] "apple" "apricot" "avocado" "banana" "bell pepper" "bilberry" "blackberry" "blackcurrant" "blood orange" ...
# > fruit %>% nchar |> str()
#  int [1:80] 5 7 7 6 11 8 10 12 12 9 ...
# > fruit |> str_length |> str()
#  int [1:80] 5 7 7 6 11 8 10 12 12 9 ...


#@ str_sub() == substr() ====

# https://www.rforexcelusers.com/how-to-mid-right-left-r/ =====

left = function(text, num_char) {
  substr(text, 1, num_char)
}
 
mid = function(text, start_num, num_char) {
  substr(text, start_num, start_num + num_char - 1)
}
 
right = function(text, num_char) {
  substr(text, nchar(text) - (num_char-1), nchar(text))
}

"Chicago" %>% left(3)
"New York City" %>% mid(5, 4)
"Los Angeles" %>% right(7)
# > "Chicago" %>% left(3)
# [1] "Chi"
# > "New York City" %>% mid(5, 4)
# [1] "York"
# > "Los Angeles" %>% right(7)
# [1] "Angeles"


left = function(text, num_char) {
  str_sub(text, 1, num_char)
}
 
mid = function(text, start_num, num_char) {
  str_sub(text, start_num, start_num + num_char - 1)
}
 
right = function(text, num_char) {
  str_sub(text, nchar(text) - (num_char-1), nchar(text))
}

"Chicago" %>% left(3)
"New York City" %>% mid(5, 4)
"Los Angeles" %>% right(7)
# > "Chicago" %>% left(3)
# [1] "Chi"
# > "New York City" %>% mid(5, 4)
# [1] "York"
# > "Los Angeles" %>% right(7)
# [1] "Angeles"


#@ |> str_extract("^.{8}") %>%  str_extract(".{4}$") ----
"Chicago" |> str_extract("^.{3}")
"New York City" |> str_extract("^.{8}") %>%  str_extract(".{4}$")
"Los Angeles" %>%  str_extract(".{7}$")
# > "Chicago" |> str_extract("^.{3}")
# [1] "Chi"
# > "New York City" |> str_extract("^.{8}") %>%  str_extract(".{4}$")
# [1] "York"
# > "Los Angeles" %>%  str_extract(".{7}$")
# [1] "Angeles"








#@ str_extract() == {regmatches(., regexpr(pattern, .))} -----

# RegExCheatsheet 2016.09.pdf -----
string <- c("Hiphopopotamus", "Rhymenoceros", "time for bottomless lyrics")
pattern <- "t.m"

regexpr(pattern, string) |> str()
gregexpr(pattern, string) |> str()
regmatches(string, regexpr(pattern, string)) |> str()
regmatches(string, gregexpr(pattern, string)) |> str()
# > regexpr(pattern, string) |> str()
#  int [1:3] 10 -1 1
#  - attr(*, "match.length")= int [1:3] 3 -1 3
#  - attr(*, "index.type")= chr "chars"
#  - attr(*, "useBytes")= logi TRUE
# > gregexpr(pattern, string) |> str()
# List of 3
#  $ : int 10
#   ..- attr(*, "match.length")= int 3
#   ..- attr(*, "index.type")= chr "chars"
#   ..- attr(*, "useBytes")= logi TRUE
#  $ : int -1
#   ..- attr(*, "match.length")= int -1
#   ..- attr(*, "index.type")= chr "chars"
#   ..- attr(*, "useBytes")= logi TRUE
#  $ : int [1:2] 1 13
#   ..- attr(*, "match.length")= int [1:2] 3 3
#   ..- attr(*, "index.type")= chr "chars"
#   ..- attr(*, "useBytes")= logi TRUE
# > regmatches(string, regexpr(pattern, string)) |> str()
#  chr [1:2] "tam" "tim"
# > regmatches(string, gregexpr(pattern, string)) |> str()
# List of 3
#  $ : chr "tam"
#  $ : chr(0) 
#  $ : chr [1:2] "tim" "tom"

regexpr(pattern, string)
gregexpr(pattern, string)
regmatches(string, regexpr(pattern, string))
regmatches(string, gregexpr(pattern, string))
# > regexpr(pattern, string)
# [1] 10 -1  1
# attr(,"match.length")
# [1]  3 -1  3
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE
# > gregexpr(pattern, string)
# [[1]]
# [1] 10
# attr(,"match.length")
# [1] 3
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE
# 
# [[2]]
# [1] -1
# attr(,"match.length")
# [1] -1
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE
# 
# [[3]]
# [1]  1 13
# attr(,"match.length")
# [1] 3 3
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE
# 
# > regmatches(string, regexpr(pattern, string))
# [1] "tam" "tim"
# > regmatches(string, gregexpr(pattern, string))
# [[1]]
# [1] "tam"
# 
# [[2]]
# character(0)
# 
# [[3]]
# [1] "tim" "tom"


stringr::str_extract(string, pattern) |> str()
stringr::str_extract_all(string, pattern) |> str()
stringr::str_extract_all(string, pattern, simplify = TRUE) |> str()
# > stringr::str_extract(string, pattern) |> str()
#  chr [1:3] "tam" NA "tim"
# > stringr::str_extract_all(string, pattern) |> str()
# List of 3
#  $ : chr "tam"
#  $ : chr(0) 
#  $ : chr [1:2] "tim" "tom"
# > stringr::str_extract_all(string, pattern, simplify = TRUE) |> str()
#  chr [1:3, 1:2] "tam" "" "tim" "" "" "tom"

stringr::str_extract(string, pattern)
stringr::str_extract_all(string, pattern)
stringr::str_extract_all(string, pattern, simplify = TRUE)
# > stringr::str_extract(string, pattern)
# [1] "tam" NA    "tim"
# > stringr::str_extract_all(string, pattern)
# [[1]]
# [1] "tam"
# 
# [[2]]
# character(0)
# 
# [[3]]
# [1] "tim" "tom"
# 
# > stringr::str_extract_all(string, pattern, simplify = TRUE)
#      [,1]  [,2] 
# [1,] "tam" ""   
# [2,] ""    ""   
# [3,] "tim" "tom"


stringr::str_match(string, pattern) |> str()
stringr::str_match_all(string, pattern) |> str()
# > stringr::str_match(string, pattern) |> str()
#  chr [1:3, 1] "tam" NA "tim"
# > stringr::str_match_all(string, pattern) |> str()
# List of 3
#  $ : chr [1, 1] "tam"
#  $ : chr[0 , 1] 
#  $ : chr [1:2, 1] "tim" "tom"

stringr::str_match(string, pattern)
stringr::str_match_all(string, pattern)
# > stringr::str_match(string, pattern)
#      [,1] 
# [1,] "tam"
# [2,] NA   
# [3,] "tim"
# > stringr::str_match_all(string, pattern)
# [[1]]
#      [,1] 
# [1,] "tam"
# 
# [[2]]
#      [,1]
# 
# [[3]]
#      [,1] 
# [1,] "tim"
# [2,] "tom"



fruit |> str()
fruit |> str_extract("[aeiou]") |> str()
fruit |> str_extract("[bcd]") |> str()
# > fruit |> str()
#  chr [1:80] "apple" "apricot" "avocado" "banana" "bell pepper" "bilberry" "blackberry" "blackcurrant" "blood orange" ...
# > fruit |> str_extract("[aeiou]") |> str()
#  chr [1:80] "a" "a" "a" "a" "e" "i" "a" "a" "o" "u" "o" "e" "a" "a" "e" "e" "i" "e" "o" "o" "a" "u" "u" "a" "a" "a" ...
# > fruit |> str_extract("[bcd]") |> str()
#  chr [1:80] NA "c" "c" "b" "b" "b" "b" "b" "b" "b" "b" "b" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "d" "d" "d" ...

pattern = "[aeiou]"
fruit %>% {regmatches(., regexpr(pattern, .))} |> str()
pattern = "[bcd]"
fruit %>% {regmatches(., regexpr(pattern, .))} |> str()
# > pattern = "[aeiou]"
# > fruit %>% {regmatches(., regexpr(pattern, .))} |> str()
#  chr [1:80] "a" "a" "a" "a" "e" "i" "a" "a" "o" "u" "o" "e" "a" "a" "e" "e" "i" "e" "o" "o" "a" "u" "u" "a" "a" "a" ...
# > pattern = "[bcd]"
# > fruit %>% {regmatches(., regexpr(pattern, .))} |> str()
#  chr [1:46] "c" "c" "b" "b" "b" "b" "b" "b" "b" "b" "b" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "d" "d" "d" "d" ...


fruit |> str_extract_all("[aeiou]") |> str()
fruit |> str_extract_all("[bcd]") |> str()
# > fruit |> str_extract_all("[aeiou]") |> str()
# List of 80
#  $ : chr [1:2] "a" "e"
#  $ : chr [1:3] "a" "i" "o"
#  $ : chr [1:4] "a" "o" "a" "o"
#  $ : chr [1:3] "a" "a" "a"
#  $ : chr [1:3] "e" "e" "e"
#  $ : chr [1:2] "i" "e"
#  $ : chr [1:2] "a" "e"
#  $ : chr [1:3] "a" "u" "a"
#  $ : chr [1:5] "o" "o" "o" "a" ...
#  $ : chr [1:3] "u" "e" "e"
#  $ : chr [1:3] "o" "e" "e"
#  $ : chr [1:4] "e" "a" "u" "i"
#  $ : chr [1:4] "a" "a" "e" "o"
#  $ : chr [1:5] "a" "a" "o" "u" ...
#  $ : chr [1:4] "e" "i" "o" "a"
#  $ : chr "e"
#  $ : chr [1:4] "i" "i" "e" "e"
#  $ : chr [1:4] "e" "e" "i" "e"
#  $ : chr [1:3] "o" "u" "e"
#  $ : chr [1:3] "o" "o" "u"
#  $ : chr [1:2] "a" "e"
#  $ : chr [1:3] "u" "u" "e"
#  $ : chr [1:2] "u" "a"
#  $ : chr [1:2] "a" "o"
#  $ : chr [1:2] "a" "e"
#  $ : chr [1:4] "a" "o" "u" "i"
#  $ : chr [1:3] "u" "i" "a"
#  $ : chr [1:2] "e" "a"
#  $ : chr [1:3] "e" "e" "e"
#  $ : chr [1:4] "e" "i" "o" "a"
#  $ : chr "i"
#  $ : chr [1:3] "o" "i" "e"
#  $ : chr [1:4] "o" "o" "e" "e"
#  $ : chr [1:2] "a" "e"
#  $ : chr [1:4] "a" "e" "u" "i"
#  $ : chr [1:3] "u" "a" "a"
#  $ : chr [1:3] "o" "e" "e"
#  $ : chr [1:3] "u" "e" "e"
#  $ : chr [1:3] "a" "u" "i"
#  $ : chr [1:2] "a" "u"
#  $ : chr [1:3] "u" "u" "e"
#  $ : chr [1:4] "i" "i" "u" "i"
#  $ : chr [1:3] "u" "u" "a"
#  $ : chr [1:2] "e" "o"
#  $ : chr [1:2] "i" "e"
#  $ : chr [1:3] "o" "u" "a"
#  $ : chr [1:2] "e" "e"
#  $ : chr [1:4] "a" "a" "i" "e"
#  $ : chr [1:2] "a" "o"
#  $ : chr [1:2] "u" "e"
#  $ : chr [1:4] "e" "a" "i" "e"
#  $ : chr "u"
#  $ : chr [1:3] "o" "i" "e"
#  $ : chr [1:3] "o" "a" "e"
#  $ : chr [1:3] "a" "e" "o"
#  $ : chr [1:3] "a" "a" "a"
#  $ : chr [1:5] "a" "i" "o" "u" ...
#  $ : chr [1:2] "e" "a"
#  $ : chr [1:2] "e" "a"
#  $ : chr [1:3] "e" "i" "o"
#  $ : chr [1:2] "a" "i"
#  $ : chr [1:4] "i" "e" "a" "e"
#  $ : chr "u"
#  $ : chr [1:5] "o" "e" "a" "a" ...
#  $ : chr [1:3] "o" "e" "o"
#  $ : chr [1:6] "u" "e" "a" "o" ...
#  $ : chr [1:3] "u" "i" "e"
#  $ : chr [1:3] "a" "i" "i"
#  $ : chr [1:3] "a" "u" "a"
#  $ : chr [1:2] "a" "e"
#  $ : chr [1:3] "e" "u" "a"
#  $ : chr [1:3] "o" "e" "o"
#  $ : chr [1:3] "a" "a" "e"
#  $ : chr [1:3] "a" "u" "a"
#  $ : chr [1:3] "a" "u" "i"
#  $ : chr [1:2] "a" "e"
#  $ : chr [1:4] "a" "a" "i" "o"
#  $ : chr [1:4] "a" "e" "i" "e"
#  $ : chr [1:4] "u" "i" "u" "i"
#  $ : chr [1:4] "a" "e" "e" "o"
# > fruit |> str_extract_all("[bcd]") |> str()
# List of 80
#  $ : chr(0) 
#  $ : chr "c"
#  $ : chr [1:2] "c" "d"
#  $ : chr "b"
#  $ : chr "b"
#  $ : chr [1:2] "b" "b"
#  $ : chr [1:3] "b" "c" "b"
#  $ : chr [1:3] "b" "c" "c"
#  $ : chr [1:2] "b" "d"
#  $ : chr [1:2] "b" "b"
#  $ : chr [1:2] "b" "b"
#  $ : chr [1:2] "b" "d"
#  $ : chr "c"
#  $ : chr "c"
#  $ : chr "c"
#  $ : chr "c"
#  $ : chr "c"
#  $ : chr "c"
#  $ : chr [1:3] "c" "d" "b"
#  $ : chr [1:2] "c" "c"
#  $ : chr [1:2] "c" "b"
#  $ : chr [1:3] "c" "c" "b"
#  $ : chr "c"
#  $ : chr "d"
#  $ : chr "d"
#  $ : chr "d"
#  $ : chr "d"
#  $ : chr(0) 
#  $ : chr [1:2] "d" "b"
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr "b"
#  $ : chr "b"
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr "d"
#  $ : chr [1:2] "c" "b"
#  $ : chr "c"
#  $ : chr "b"
#  $ : chr "b"
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr "c"
#  $ : chr "d"
#  $ : chr(0) 
#  $ : chr "b"
#  $ : chr "c"
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr "c"
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr "c"
#  $ : chr(0) 
#  $ : chr "b"
#  $ : chr "b"
#  $ : chr [1:2] "d" "c"
#  $ : chr "c"
#  $ : chr "b"
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr "b"
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 


pattern = "[aeiou]"
fruit %>% {regmatches(., gregexpr(pattern, .))} |> str()
pattern = "[bcd]"
fruit %>% {regmatches(., gregexpr(pattern, .))} |> str()
# > pattern = "[aeiou]"
# > fruit %>% {regmatches(., gregexpr(pattern, .))} |> str()
# List of 80
#  $ : chr [1:2] "a" "e"
#  $ : chr [1:3] "a" "i" "o"
#  $ : chr [1:4] "a" "o" "a" "o"
#  $ : chr [1:3] "a" "a" "a"
#  $ : chr [1:3] "e" "e" "e"
#  $ : chr [1:2] "i" "e"
#  $ : chr [1:2] "a" "e"
#  $ : chr [1:3] "a" "u" "a"
#  $ : chr [1:5] "o" "o" "o" "a" ...
#  $ : chr [1:3] "u" "e" "e"
#  $ : chr [1:3] "o" "e" "e"
#  $ : chr [1:4] "e" "a" "u" "i"
#  $ : chr [1:4] "a" "a" "e" "o"
#  $ : chr [1:5] "a" "a" "o" "u" ...
#  $ : chr [1:4] "e" "i" "o" "a"
#  $ : chr "e"
#  $ : chr [1:4] "i" "i" "e" "e"
#  $ : chr [1:4] "e" "e" "i" "e"
#  $ : chr [1:3] "o" "u" "e"
#  $ : chr [1:3] "o" "o" "u"
#  $ : chr [1:2] "a" "e"
#  $ : chr [1:3] "u" "u" "e"
#  $ : chr [1:2] "u" "a"
#  $ : chr [1:2] "a" "o"
#  $ : chr [1:2] "a" "e"
#  $ : chr [1:4] "a" "o" "u" "i"
#  $ : chr [1:3] "u" "i" "a"
#  $ : chr [1:2] "e" "a"
#  $ : chr [1:3] "e" "e" "e"
#  $ : chr [1:4] "e" "i" "o" "a"
#  $ : chr "i"
#  $ : chr [1:3] "o" "i" "e"
#  $ : chr [1:4] "o" "o" "e" "e"
#  $ : chr [1:2] "a" "e"
#  $ : chr [1:4] "a" "e" "u" "i"
#  $ : chr [1:3] "u" "a" "a"
#  $ : chr [1:3] "o" "e" "e"
#  $ : chr [1:3] "u" "e" "e"
#  $ : chr [1:3] "a" "u" "i"
#  $ : chr [1:2] "a" "u"
#  $ : chr [1:3] "u" "u" "e"
#  $ : chr [1:4] "i" "i" "u" "i"
#  $ : chr [1:3] "u" "u" "a"
#  $ : chr [1:2] "e" "o"
#  $ : chr [1:2] "i" "e"
#  $ : chr [1:3] "o" "u" "a"
#  $ : chr [1:2] "e" "e"
#  $ : chr [1:4] "a" "a" "i" "e"
#  $ : chr [1:2] "a" "o"
#  $ : chr [1:2] "u" "e"
#  $ : chr [1:4] "e" "a" "i" "e"
#  $ : chr "u"
#  $ : chr [1:3] "o" "i" "e"
#  $ : chr [1:3] "o" "a" "e"
#  $ : chr [1:3] "a" "e" "o"
#  $ : chr [1:3] "a" "a" "a"
#  $ : chr [1:5] "a" "i" "o" "u" ...
#  $ : chr [1:2] "e" "a"
#  $ : chr [1:2] "e" "a"
#  $ : chr [1:3] "e" "i" "o"
#  $ : chr [1:2] "a" "i"
#  $ : chr [1:4] "i" "e" "a" "e"
#  $ : chr "u"
#  $ : chr [1:5] "o" "e" "a" "a" ...
#  $ : chr [1:3] "o" "e" "o"
#  $ : chr [1:6] "u" "e" "a" "o" ...
#  $ : chr [1:3] "u" "i" "e"
#  $ : chr [1:3] "a" "i" "i"
#  $ : chr [1:3] "a" "u" "a"
#  $ : chr [1:2] "a" "e"
#  $ : chr [1:3] "e" "u" "a"
#  $ : chr [1:3] "o" "e" "o"
#  $ : chr [1:3] "a" "a" "e"
#  $ : chr [1:3] "a" "u" "a"
#  $ : chr [1:3] "a" "u" "i"
#  $ : chr [1:2] "a" "e"
#  $ : chr [1:4] "a" "a" "i" "o"
#  $ : chr [1:4] "a" "e" "i" "e"
#  $ : chr [1:4] "u" "i" "u" "i"
#  $ : chr [1:4] "a" "e" "e" "o"
# > pattern = "[bcd]"
# > fruit %>% {regmatches(., gregexpr(pattern, .))} |> str()
# List of 80
#  $ : chr(0) 
#  $ : chr "c"
#  $ : chr [1:2] "c" "d"
#  $ : chr "b"
#  $ : chr "b"
#  $ : chr [1:2] "b" "b"
#  $ : chr [1:3] "b" "c" "b"
#  $ : chr [1:3] "b" "c" "c"
#  $ : chr [1:2] "b" "d"
#  $ : chr [1:2] "b" "b"
#  $ : chr [1:2] "b" "b"
#  $ : chr [1:2] "b" "d"
#  $ : chr "c"
#  $ : chr "c"
#  $ : chr "c"
#  $ : chr "c"
#  $ : chr "c"
#  $ : chr "c"
#  $ : chr [1:3] "c" "d" "b"
#  $ : chr [1:2] "c" "c"
#  $ : chr [1:2] "c" "b"
#  $ : chr [1:3] "c" "c" "b"
#  $ : chr "c"
#  $ : chr "d"
#  $ : chr "d"
#  $ : chr "d"
#  $ : chr "d"
#  $ : chr(0) 
#  $ : chr [1:2] "d" "b"
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr "b"
#  $ : chr "b"
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr "d"
#  $ : chr [1:2] "c" "b"
#  $ : chr "c"
#  $ : chr "b"
#  $ : chr "b"
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr "c"
#  $ : chr "d"
#  $ : chr(0) 
#  $ : chr "b"
#  $ : chr "c"
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr "c"
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr "c"
#  $ : chr(0) 
#  $ : chr "b"
#  $ : chr "b"
#  $ : chr [1:2] "d" "c"
#  $ : chr "c"
#  $ : chr "b"
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr "b"
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 
#  $ : chr(0) 






#@ str_match() -----
# RegExCheatsheet 2016.09.pdf -----
string <- c("Hiphopopotamus", "Rhymenoceros", "time for bottomless lyrics")
pattern <- "t.m"


# stringr::str_extract(string, pattern) |> str()
# stringr::str_extract_all(string, pattern) |> str()
# stringr::str_extract_all(string, pattern, simplify = TRUE) |> str()
# stringr::str_extract(string, pattern)
# stringr::str_extract_all(string, pattern)
# stringr::str_extract_all(string, pattern, simplify = TRUE)
# # > stringr::str_extract(string, pattern) |> str()
# #  chr [1:3] "tam" NA "tim"
# # > stringr::str_extract_all(string, pattern) |> str()
# # List of 3
# #  $ : chr "tam"
# #  $ : chr(0) 
# #  $ : chr [1:2] "tim" "tom"
# # > stringr::str_extract_all(string, pattern, simplify = TRUE) |> str()
# #  chr [1:3, 1:2] "tam" "" "tim" "" "" "tom"
# # > stringr::str_extract(string, pattern)
# # [1] "tam" NA    "tim"
# # > stringr::str_extract_all(string, pattern)
# # [[1]]
# # [1] "tam"
# # 
# # [[2]]
# # character(0)
# # 
# # [[3]]
# # [1] "tim" "tom"
# # 
# # > stringr::str_extract_all(string, pattern, simplify = TRUE)
# #      [,1]  [,2] 
# # [1,] "tam" ""   
# # [2,] ""    ""   
# # [3,] "tim" "tom"
# 
# 
# stringr::str_match(string, pattern) |> str()
# stringr::str_match_all(string, pattern) |> str()
# # > stringr::str_match(string, pattern) |> str()
# #  chr [1:3, 1] "tam" NA "tim"
# # > stringr::str_match_all(string, pattern) |> str()
# # List of 3
# #  $ : chr [1, 1] "tam"
# #  $ : chr[0 , 1] 
# #  $ : chr [1:2, 1] "tim" "tom"
# 
# stringr::str_match(string, pattern)
# stringr::str_match_all(string, pattern)
# # > stringr::str_match(string, pattern)
# #      [,1] 
# # [1,] "tam"
# # [2,] NA   
# # [3,] "tim"
# # > stringr::str_match_all(string, pattern)
# # [[1]]
# #      [,1] 
# # [1,] "tam"
# # 
# # [[2]]
# #      [,1]
# # 
# # [[3]]
# #      [,1] 
# # [1,] "tim"
# # [2,] "tom"

stringr::str_extract(string, pattern) |> str()
stringr::str_extract_all(string, pattern) |> str()
# > stringr::str_extract(string, pattern) |> str()
#  chr [1:3] "tam" NA "tim"
# > stringr::str_extract_all(string, pattern) |> str()
# List of 3
#  $ : chr "tam"
#  $ : chr(0) 
#  $ : chr [1:2] "tim" "tom"

stringr::str_match(string, pattern) |> str()
stringr::str_match_all(string, pattern) |> str()
# > stringr::str_match(string, pattern) |> str()
#  chr [1:3, 1] "tam" NA "tim"
# > stringr::str_match_all(string, pattern) |> str()
# List of 3
#  $ : chr [1, 1] "tam"
#  $ : chr[0 , 1] 
#  $ : chr [1:2, 1] "tim" "tom"



sentences |> str()
pattern = "(a|the) ([^ ]+)"
sentences |> str_extract(pattern) |> str()
sentences |> str_match(pattern) |> str()
# > sentences |> str()
#  chr [1:720] "The birch canoe slid on the smooth planks." "Glue the sheet to the dark blue background." ...
# > pattern = "(a|the) ([^ ]+)"
# > sentences |> str_extract(pattern) |> str()
#  chr [1:720] "the smooth" "the sheet" "the depth" "a chicken" NA NA "the parked" NA NA NA "the sun" NA "the huge" ...
# > sentences |> str_match(pattern) |> str()
#  chr [1:720, 1:3] "the smooth" "the sheet" "the depth" "a chicken" NA NA "the parked" NA NA NA "the sun" NA ...



sentences %>% head
pattern = "(a|the) ([^ ]+)"
sentences |> str_extract(pattern) %>% head
sentences |> str_match(pattern) %>% head
# > sentences %>% head
# [1] "The birch canoe slid on the smooth planks." 
# [2] "Glue the sheet to the dark blue background."
# [3] "It's easy to tell the depth of a well."     
# [4] "These days a chicken leg is a rare dish."   
# [5] "Rice is often served in round bowls."       
# [6] "The juice of lemons makes fine punch."      
# > pattern = "(a|the) ([^ ]+)"
# > sentences |> str_extract(pattern) %>% head
# [1] "the smooth" "the sheet"  "the depth"  "a chicken"  NA           NA          
# > sentences |> str_match(pattern) %>% head
#      [,1]         [,2]  [,3]     
# [1,] "the smooth" "the" "smooth" 
# [2,] "the sheet"  "the" "sheet"  
# [3,] "the depth"  "the" "depth"  
# [4,] "a chicken"  "a"   "chicken"
# [5,] NA           NA    NA       
# [6,] NA           NA    NA       



# https://stackoverflow.com/questions/7963898/extracting-the-last-n-characters-from-a-string-in-r ====
x <- "some text in a string"

substrRight <- function(x, n){
  substr(x, nchar(x)-n+1, nchar(x))
}

substrRight(x, 6)
# [1] "string"

substrRight(x, 8)
# [1] "a string"

x <- c("some text in a string", "I really need to learn how to count")
substrRight(x, 6)
# [1] "string" " count"


# For example, to get the date part from the string ----

substrRightRange <- function(x, m, n){substr(x, nchar(x)-m+1, nchar(x)-m+n)}

value <- "REGNDATE:20170526RN" 
substrRightRange(value, 10, 8)
# [1] "20170526"

stri_sub("abcde",1,3)

#@ ----
substrR <- function(x, n) { 
  if(n > 0) substr(x, (nchar(x)-n+1), nchar(x)) else substr(x, 1, (nchar(x)+n))
}
x <- "moSvmC20F.5.rda"
substrR(x,-4)
# [1] "moSvmC20F.5"

substrL <- function(x, n){ 
  if(n > 0) substr(x, 1, n) else substr(x, -n+1, nchar(x))
}
substrL(substrR(x,-4),-2)
# [1] "SvmC20F.5"



#@ ----
# I use substr too, but in a different way. I want to extract the last 6 characters of "Give me your food." Here are the steps:
# 
# (1) Split the characters

splits <- strsplit("Give me your food.", split = "")
# (2) Extract the last 6 characters

tail(splits[[1]], n=6)
# [1] " " "f" "o" "o" "d" "."
# Each of the character can be accessed by splits[[1]][x], where x is 1 to 6.



#@ -----
x <- "some text in a string"
regmatches(x, regexpr(".{6}$", x))
# > x <- "some text in a string"
# > regmatches(x, regexpr(".{6}$", x))
# [1] "string"

x |> str_extract(".{6}$")
# > x |> str_extract(".{6}$")
# [1] "string"

#@ ----

string |> dput()
# > string |> dput()
# c("Hiphopopotamus", "Rhymenoceros", "time for bottomless lyrics"
# )

# Another reasonably straightforward way is to use regular expressions and sub: ----
sub('.*(?=.$)', "", string, perl=T)  # So, "get rid of everything followed by one character". To grab more characters off the end, add however many dots in the lookahead assertion:
sub('.*(?=.{2}$)', "", string, perl=T)  # where .{2} means .., or "any two characters", so meaning "get rid of everything followed by two characters".
sub('.*(?=.{3}$)', "", string, perl=T)  # for three characters, etc. You can set the number of characters to grab with a variable, but you'll have to paste the variable value into the regular expression string:
# > sub('.*(?=.$)', "", string, perl=T)  # So, "get rid of everything followed by one character". To grab more characters off the end, add however many dots in the lookahead assertion:
# [1] "s" "s" "s"
# > sub('.*(?=.{2}$)', "", string, perl=T)  # where .{2} means .., or "any two characters", so meaning "get rid of everything followed by two characters".
# [1] "us" "os" "cs"
# > sub('.*(?=.{3}$)', "", string, perl=T)  # for three characters, etc. You can set the number of characters to grab with a variable, but you'll have to paste the variable value into the regular expression string:
# [1] "mus" "ros" "ics"

n = 3
sub(paste('.+(?=.{', n, '})', sep=""), "", string, perl=T)
# > n = 3
# > sub(paste('.+(?=.{', n, '})', sep=""), "", string, perl=T)
# [1] "mus" "ros" "ics"





#@ ?boundary ====
# ?boundary
pattern <- "a.b"
strings <- c("abb", "a.b")
str_detect(strings, pattern)
str_detect(strings, fixed(pattern))
str_detect(strings, coll(pattern))
# > str_detect(strings, pattern)
# [1] TRUE TRUE
# > str_detect(strings, fixed(pattern))
# [1] FALSE  TRUE
# > str_detect(strings, coll(pattern))
# [1] FALSE  TRUE



# coll() is useful for locale-aware case-insensitive matching
i <- c("I", "\u0130", "i")
i
str_detect(i, fixed("i", TRUE))
str_detect(i, coll("i", TRUE))
str_detect(i, coll("i", TRUE, locale = "tr"))
# > str_detect(i, fixed("i", TRUE))
# [1]  TRUE FALSE  TRUE
# > str_detect(i, coll("i", TRUE))
# [1]  TRUE FALSE  TRUE
# > str_detect(i, coll("i", TRUE, locale = "tr"))
# [1] FALSE  TRUE  TRUE


# Word boundaries
words <- c("These are   some words.")
str_count(words, boundary("word"))
str_split(words, " ")[[1]]
str_split(words, boundary("word"))[[1]]
# > str_count(words, boundary("word"))
# [1] 4
# > str_split(words, " ")[[1]]
# [1] "These"  "are"    ""       ""       "some"   "words."
# > str_split(words, boundary("word"))[[1]]
# [1] "These" "are"   "some"  "words"


# Regular expression variations
str_extract_all("The Cat in the Hat", "[a-z]+")
str_extract_all("The Cat in the Hat", regex("[a-z]+", TRUE))
# > str_extract_all("The Cat in the Hat", "[a-z]+")
# [[1]]
# [1] "he"  "at"  "in"  "the" "at" 
# 
# > str_extract_all("The Cat in the Hat", regex("[a-z]+", TRUE))
# [[1]]
# [1] "The" "Cat" "in"  "the" "Hat"


str_extract_all("a\nb\nc", "^.")
str_extract_all("a\nb\nc", regex("^.", multiline = TRUE))
# > str_extract_all("a\nb\nc", "^.")
# [[1]]
# [1] "a"
# 
# > str_extract_all("a\nb\nc", regex("^.", multiline = TRUE))
# [[1]]
# [1] "a" "b" "c"


str_extract_all("a\nb\nc", "a.")
str_extract_all("a\nb\nc", regex("a.", dotall = TRUE))
# > str_extract_all("a\nb\nc", "a.")
# [[1]]
# character(0)
# 
# > str_extract_all("a\nb\nc", regex("a.", dotall = TRUE))
# [[1]]
# [1] "a\n"




#@ end -----

