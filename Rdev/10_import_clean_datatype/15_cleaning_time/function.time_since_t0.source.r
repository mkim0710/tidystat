# function.time_since_t0.source.r






#@ -----
data %>% mutate_if(lubridate::is.Date, function(vec) if_else(is.na(vec), as.Date("9999-12-31"), vec))
data %>% mutate_if(lubridate::is.Date, function(vec) replace(vec, is.na(vec), as.Date("9999-12-31")))
data %>% mutate_if(lubridate::is.Date, function(vec) replace_na(vec, as.Date("9999-12-31")))









#@ -----

as.Date("2000-01-01") %>% str #----
as.Date("2000-01-01") %>% dput #----
structure(0, class = "Date")
structure(10000, class = "Date")
structure(20000, class = "Date")
# > as.Date("2000-01-01") %>% str #----
#  Date[1:1], format: "2000-01-01"
# > as.Date("2000-01-01") %>% dput #----
# structure(10957, class = "Date")
# > structure(0, class = "Date")
# [1] "1970-01-01"
# > structure(10000, class = "Date")
# [1] "1997-05-19"
# > structure(20000, class = "Date")
# [1] "2024-10-04"



is.numeric.Date(structure(0, class = "Date"))
lubridate::is.Date(structure(0, class = "Date"))
class(structure(0, class = "Date")) == "Date"
# > is.numeric.Date(structure(0, class = "Date"))
# [1] FALSE
# > lubridate::is.Date(structure(0, class = "Date"))
# [1] TRUE
# > class(structure(0, class = "Date")) == "Date"
# [1] TRUE






#@ -----

structure(0, class = "Date")
structure(0, class = c("POSIXt", "POSIXct"))
# > structure(0, class = "Date")
# [1] "1970-01-01"
# > structure(0, class = c("POSIXt", "POSIXct"))
# [1] "1969-12-31 19:00:00 EST"








#@ -----

is.numeric(as.Date("2002-01-01"))
is.integer(as.Date("2002-01-01"))
is.character(as.Date("2002-01-01"))
is.POSIXct(as.Date("2002-01-01"))
is.POSIXlt(as.Date("2002-01-01"))
is.POSIXt(as.Date("2002-01-01"))
class(as.Date("2002-01-01"))
lubridate::is.Date(as.Date("2002-01-01"))
is.numeric(999999999L)
is.integer(999999999L)
class(999999999L)
is.numeric(999999999)
is.integer(999999999)
class(999999999)
# > is.numeric(as.Date("2002-01-01"))
# [1] FALSE
# > is.integer(as.Date("2002-01-01"))
# [1] FALSE
# > is.character(as.Date("2002-01-01"))
# [1] FALSE
# > is.POSIXct(as.Date("2002-01-01"))
# [1] FALSE
# > is.POSIXlt(as.Date("2002-01-01"))
# [1] FALSE
# > is.POSIXt(as.Date("2002-01-01"))
# [1] FALSE
# > class(as.Date("2002-01-01"))
# [1] "Date"
# > lubridate::is.Date(as.Date("2002-01-01"))
# [1] TRUE
# > is.numeric(999999999L)
# [1] TRUE
# > is.integer(999999999L)
# [1] TRUE
# > class(999999999L)
# [1] "integer"
# > is.numeric(999999999)
# [1] TRUE
# > is.integer(999999999)
# [1] FALSE
# > class(999999999)
# [1] "numeric"


is(as.Date("2002-01-01"), "Date")
inherits(as.Date("2002-01-01"), "Date")
class(as.Date("2002-01-01")) == "Date"
lubridate::is.Date(as.Date("2002-01-01"))
# > is(as.Date("2002-01-01"), "Date")
# [1] TRUE
# > inherits(as.Date("2002-01-01"), "Date")
# [1] TRUE
# > class(as.Date("2002-01-01")) == "Date"
# [1] TRUE
# > lubridate::is.Date(as.Date("2002-01-01"))
# [1] TRUE

library(tidyverse)
as.Date("2002-01-01") %>% is("Date")
as.Date("2002-01-01") %>% inherits("Date")
as.Date("2002-01-01") %>% class %>% {. == "Date"}
as.Date("2002-01-01") %>% lubridate::is.Date
as.Date("2002-01-01") %>% lubridate::is.Date(.)
# > as.Date("2002-01-01") %>% is("Date")
# [1] TRUE
# > as.Date("2002-01-01") %>% inherits("Date")
# [1] TRUE
# > as.Date("2002-01-01") %>% class %>% {. == "Date"}
# [1] TRUE
# > as.Date("2002-01-01") %>% lubridate::is.Date
# Error in .::lubridate : unused argument (is.Date)
# > as.Date("2002-01-01") %>% lubridate::is.Date(.)
# [1] TRUE



















#@ end -----
