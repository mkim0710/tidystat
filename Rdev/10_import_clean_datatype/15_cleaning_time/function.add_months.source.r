# function.add_months.source.r


# https://stackoverflow.com/questions/22628863/add-subtract-6-months-bond-time-in-r-using-lubridate
as.Date("2014-12-31") %m+% months(6)
# [1] "2015-06-30"
ceiling_date(as.Date("2014-02-28") %m+% months(6), unit = "month") - days(1)
# [1] "2014-08-31"
















#@ end -----
