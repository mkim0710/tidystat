# function.weighted.sum.dev.r



# https://stats.idre.ucla.edu/r/faq/how-do-i-analyze-survey-data-with-stratification-after-sampling-poststratification/
# Example 2 =====  
# This example is taken from Lehtonen and Pahkinen’s Practical Methods for Design and Analysis of Complex Surveys.
# 
# Page 97 Table 3.10 A simple random sample drawn without replacement from the Province’91 population with poststratum weights.
# 
# Import the dataset from text directly into R using the read.table function and the text= parameter specifying the entire data set. The syntax n indicates the end of one line of data.



province <-
  read.table( text =
		"id str clu wt ue91 lab91 poststr gwt postwt sruv srcvs
		  1 1 1 4 4123 33786 1 .5833 2.333 .25 .43
		  2 1 4 4 760 5919 1 .5833 2.333 .25 .43
		  3 1 5 4 721 4930 1 .5833 2.333 .25 .43
		  4 1 15 4 142 675 2 1.2500 5.0000 .25 .20
		  5 1 18 4 187 1448 2 1.2500 5.0000 .25 .20
		  6 1 26 4 331 2543 2 1.2500 5.0000 .25 .20
		  7 1 30 4 127 1084 2 1.2500 5.0000 .25 .20
		  8 1 31 4 219 1330 2 1.2500 5.0000 .25 .20" ,
		header = TRUE
	)

province
##   id str clu wt ue91 lab91 poststr    gwt postwt sruv srcvs
## 1  1   1   1  4 4123 33786       1 0.5833  2.333 0.25  0.43
## 2  2   1   4  4  760  5919       1 0.5833  2.333 0.25  0.43
## 3  3   1   5  4  721  4930       1 0.5833  2.333 0.25  0.43
## 4  4   1  15  4  142   675       2 1.2500  5.000 0.25  0.20
## 5  5   1  18  4  187  1448       2 1.2500  5.000 0.25  0.20
## 6  6   1  26  4  331  2543       2 1.2500  5.000 0.25  0.20
## 7  7   1  30  4  127  1084       2 1.2500  5.000 0.25  0.20
## 8  8   1  31  4  219  1330       2 1.2500  5.000 0.25  0.20


province = province %>% mutate(ue91_gt500 = ue91 > 500)

province |> summary()
# > province |> summary()
#        id            str         clu              wt         ue91            lab91          poststr     
#  Min.   :1.00   Min.   :1   Min.   : 1.00   Min.   :4   Min.   : 127.0   Min.   :  675   Min.   :1.000  
#  1st Qu.:2.75   1st Qu.:1   1st Qu.: 4.75   1st Qu.:4   1st Qu.: 175.8   1st Qu.: 1268   1st Qu.:1.000  
#  Median :4.50   Median :1   Median :16.50   Median :4   Median : 275.0   Median : 1996   Median :2.000  
#  Mean   :4.50   Mean   :1   Mean   :16.25   Mean   :4   Mean   : 826.2   Mean   : 6464   Mean   :1.625  
#  3rd Qu.:6.25   3rd Qu.:1   3rd Qu.:27.00   3rd Qu.:4   3rd Qu.: 730.8   3rd Qu.: 5177   3rd Qu.:2.000  
#  Max.   :8.00   Max.   :1   Max.   :31.00   Max.   :4   Max.   :4123.0   Max.   :33786   Max.   :2.000  
#       gwt             postwt           sruv          srcvs             fpc     ue91_gt500     
#  Min.   :0.5833   Min.   :2.333   Min.   :0.25   Min.   :0.2000   Min.   :32   Mode :logical  
#  1st Qu.:0.5833   1st Qu.:2.333   1st Qu.:0.25   1st Qu.:0.2000   1st Qu.:32   FALSE:5        
#  Median :1.2500   Median :5.000   Median :0.25   Median :0.2000   Median :32   TRUE :3        
#  Mean   :1.0000   Mean   :4.000   Mean   :0.25   Mean   :0.2863   Mean   :32                  
#  3rd Qu.:1.2500   3rd Qu.:5.000   3rd Qu.:0.25   3rd Qu.:0.4300   3rd Qu.:32                  
#  Max.   :1.2500   Max.   :5.000   Max.   :0.25   Max.   :0.4300   Max.   :32                  



province.prelim.design.without_fpc =
    svydesign( 
        id = ~1 , 
        data = province ,
        weights = ~wt
    )
province.prelim.design.without_fpc = province.prelim.design.without_fpc %>% update(one = 1)


province.prelim.design.without_fpc %>% svytotal(~one, .)
# > province.prelim.design.without_fpc %>% svytotal(~one, .)
#     total SE
# one    32  0
province$wt %>% sum
# > province$wt %>% sum
# [1] 32



province.prelim.design.without_fpc %>% svytotal(~ue91, .)
sum(province$wt * province$ue91)
# > province.prelim.design.without_fpc %>% svytotal(~ue91, .)
#      total    SE
# ue91 26440 15337
# > sum(province$wt * province$ue91)
# [1] 26440


province.prelim.design.without_fpc %>% svytotal(~ue91, .) |> str()
# > province.prelim.design.without_fpc %>% svytotal(~ue91, .) |> str()
#  'svystat' Named num 26440
#  - attr(*, "names")= chr "ue91"
#  - attr(*, "var")= num [1, 1] 2.35e+08
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : chr "ue91"
#   .. ..$ : chr "ue91"
#  - attr(*, "statistic")= chr "total"


province.prelim.design.without_fpc %>% svymean(~ue91, .)
weighted.mean(province$ue91, province$wt)
sum(province$wt * province$ue91) / sum(province$wt)
# > province.prelim.design.without_fpc %>% svymean(~ue91, .)
#        mean     SE
# ue91 826.25 479.28
# > weighted.mean(province$ue91, province$wt)
# [1] 826.25
# > sum(province$wt * province$ue91) / sum(province$wt)
# [1] 826.25




province.prelim.design.without_fpc %>% svytotal(~ue91_gt500, .)
sum(province$wt * province$ue91_gt500)
# > province.prelim.design.without_fpc %>% svytotal(~ue91_gt500, .)
#                 total     SE
# ue91_gt500FALSE    20 5.8554
# ue91_gt500TRUE     12 5.8554
# > sum(province$wt * province$ue91_gt500)
# [1] 12

province.prelim.design.without_fpc %>% svytotal(~ue91_gt500, .) |> str()
# > province.prelim.design.without_fpc %>% svytotal(~ue91_gt500, .) |> str()
#  'svystat' Named num [1:2] 20 12
#  - attr(*, "names")= chr [1:2] "ue91_gt500FALSE" "ue91_gt500TRUE"
#  - attr(*, "var")= num [1:2, 1:2] 34.3 -34.3 -34.3 34.3
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : chr [1:2] "ue91_gt500FALSE" "ue91_gt500TRUE"
#   .. ..$ : chr [1:2] "ue91_gt500FALSE" "ue91_gt500TRUE"
#  - attr(*, "statistic")= chr "total"

province.prelim.design.without_fpc %>% svytotal(~ue91_gt500, .) %>% {.$ue91_gt500TRUE}
province.prelim.design.without_fpc %>% svytotal(~ue91_gt500, .) |> as.list() %>% {.$ue91_gt500TRUE}
# > province.prelim.design.without_fpc %>% svytotal(~ue91_gt500, .) %>% {.$ue91_gt500TRUE}
# Error in .$ue91_gt500TRUE : $ operator is invalid for atomic vectors
# > province.prelim.design.without_fpc %>% svytotal(~ue91_gt500, .) |> as.list() %>% {.$ue91_gt500TRUE}
# [1] 12

province.prelim.design.without_fpc %>% svytotal(~(ue91_gt500 == T), .)
# > province.prelim.design.without_fpc %>% svytotal(~(ue91_gt500 == T), .)
#                      total     SE
# ue91_gt500 == TFALSE    20 5.8554
# ue91_gt500 == TTRUE     12 5.8554

province.prelim.design.without_fpc %>% update(tmp = as.numeric(ue91_gt500 == T)) %>% svytotal(~tmp, .)
# > province.prelim.design.without_fpc %>% update(tmp = as.numeric(ue91_gt500 == T)) %>% svytotal(~tmp, .)
#     total     SE
# tmp    12 5.8554




sum(province$wt * province$ue91_gt500) / sum(province$wt)
province.prelim.design.without_fpc %>% update(tmp = as.numeric(ue91_gt500 == T)) %>% svymean(~tmp, .)
province.prelim.design.without_fpc %>% svytable(~ue91_gt500, .) %>% prop.table
# > sum(province$wt * province$ue91_gt500) / sum(province$wt)
# [1] 0.375
# > province.prelim.design.without_fpc %>% update(tmp = as.numeric(ue91_gt500 == T)) %>% svymean(~tmp, .)
#      mean    SE
# tmp 0.375 0.183
# > province.prelim.design.without_fpc %>% svytable(~ue91_gt500, .) %>% prop.table
# ue91_gt500
# FALSE  TRUE 
# 0.625 0.375 



#@ end -----  
