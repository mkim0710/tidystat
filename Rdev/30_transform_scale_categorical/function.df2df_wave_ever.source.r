





















#@ debugged - NA if all NAs ----------
# as1_7.na.Date.fct.select971 %>% select(A01_GLU60_TR) %>% summary
# # > as1_7.na.Date.fct.select971 %>% select(A01_GLU60_TR) %>% summary
# #   A01_GLU60_TR  
# #  Min.   : 14.0  
# #  1st Qu.:115.0  
# #  Median :144.0  
# #  Mean   :151.7  
# #  3rd Qu.:179.0  
# #  Max.   :637.0  
# #  NA's   :515    

tmp.df_wave = list_df_wave$GLU60_TR
# tmp.df_wave
# # # A tibble: 10,030 × 7
# #    A01_GLU60_TR_ge200 V2    V3    V4    V5    A06_GLU60_TR_ge200 A07_GLU60_TR_ge200
# #    <lgl>              <lgl> <lgl> <lgl> <lgl> <lgl>              <lgl>             
# #  1 FALSE              NA    NA    NA    NA    FALSE              NA                
# #  2 FALSE              NA    NA    NA    NA    NA                 NA                
# #  3 FALSE              NA    NA    NA    NA    FALSE              FALSE             
# #  4 NA                 NA    NA    NA    NA    NA                 NA                
# #  5 FALSE              NA    NA    NA    NA    FALSE              FALSE             
# #  6 FALSE              NA    NA    NA    NA    FALSE              NA                
# #  7 TRUE               NA    NA    NA    NA    NA                 NA                
# #  8 FALSE              NA    NA    NA    NA    FALSE              FALSE             
# #  9 FALSE              NA    NA    NA    NA    NA                 NA                
# # 10 FALSE              NA    NA    NA    NA    NA                 NA                
# # # ℹ 10,020 more rows
# # # ℹ Use `print(n = ...)` to see more rows
tmp.df_wave[,1] %>% table(useNA = "always") %>% addmargins
tmp.df_wave[,1] %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") %>% addmargins
tmp.df_wave[,1:5] %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") %>% addmargins
tmp.df_wave[,1:6] %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") %>% addmargins
tmp.df_wave[,1:7] %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") %>% addmargins
tmp.df_wave %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") %>% addmargins 
tmp.df_wave %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% str
# > tmp.df_wave[,1] %>% table(useNA = "always") %>% addmargins
# A01_GLU60_TR_ge200
# FALSE  TRUE  <NA>   Sum 
#  8077  1438   515 10030 
# > tmp.df_wave[,1] %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") %>% addmargins
# .
#     0     1  <NA>   Sum 
#  8077  1438   515 10030 
# > tmp.df_wave[,1:5] %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") %>% addmargins
# .
#     0     1  <NA>   Sum 
#  8077  1438   515 10030 
# > tmp.df_wave[,1:6] %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") %>% addmargins
# .
#     0     1     2  <NA>   Sum 
#  7257  2009   283   481 10030 
# > tmp.df_wave[,1:7] %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") %>% addmargins
# .
#     0     1     2     3  <NA>   Sum 
#  6801  2001   604   150   474 10030 
# > tmp.df_wave %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% table(useNA = "always") %>% addmargins 
# .
#     0     1     2     3  <NA>   Sum 
#  6801  2001   604   150   474 10030 
# > tmp.df_wave %>% {rowSums(., na.rm=TRUE) * ifelse(rowSums(is.na(.)) == ncol(.), NA, 1)} %>% str
#  Named num [1:10030] 0 0 0 NA 0 0 1 0 0 0 ...
#  - attr(*, "names")= chr [1:10030] "99 >=200" "139 >=200" "176 >=200" "NA >=200" ...




#@ void2) ----------
sum(c(NA,NA), na.rm = T)
# [1] 0
tmp.df_wave[,1] %>% rowwise %>% mutate(colSums = sum(c_across(everything()), na.rm=TRUE)) %>% table(useNA = "always") %>% addmargins
# > tmp.df_wave[,1] %>% rowwise %>% mutate(colSums = sum(c_across(everything()), na.rm=TRUE)) %>% table(useNA = "always") %>% addmargins
#                   colSums
# A01_GLU60_TR_ge200     0     1  <NA>   Sum
#              FALSE  8077     0     0  8077
#              TRUE      0  1438     0  1438
#              <NA>    515     0     0   515
#              Sum    8592  1438     0 10030





#@ void) should make NA if all NAs ---------------
# https://stackoverflow.com/questions/33672059/rowsums-with-all-na

# as1_7.na.Date.fct.select971 %>% select(A01_GLU60_TR) %>% summary
# # > as1_7.na.Date.fct.select971 %>% select(A01_GLU60_TR) %>% summary
# #   A01_GLU60_TR  
# #  Min.   : 14.0  
# #  1st Qu.:115.0  
# #  Median :144.0  
# #  Mean   :151.7  
# #  3rd Qu.:179.0  
# #  Max.   :637.0  
# #  NA's   :515    

tmp.df_wave = list_df_wave$GLU60_TR
# tmp.df_wave
# # # A tibble: 10,030 × 7
# #    A01_GLU60_TR_ge200 V2    V3    V4    V5    A06_GLU60_TR_ge200 A07_GLU60_TR_ge200
# #    <lgl>              <lgl> <lgl> <lgl> <lgl> <lgl>              <lgl>             
# #  1 FALSE              NA    NA    NA    NA    FALSE              NA                
# #  2 FALSE              NA    NA    NA    NA    NA                 NA                
# #  3 FALSE              NA    NA    NA    NA    FALSE              FALSE             
# #  4 NA                 NA    NA    NA    NA    NA                 NA                
# #  5 FALSE              NA    NA    NA    NA    FALSE              FALSE             
# #  6 FALSE              NA    NA    NA    NA    FALSE              NA                
# #  7 TRUE               NA    NA    NA    NA    NA                 NA                
# #  8 FALSE              NA    NA    NA    NA    FALSE              FALSE             
# #  9 FALSE              NA    NA    NA    NA    NA                 NA                
# # 10 FALSE              NA    NA    NA    NA    NA                 NA                
# # # ℹ 10,020 more rows
# # # ℹ Use `print(n = ...)` to see more rows
tmp.df_wave[,1] %>% table(useNA = "always") %>% addmargins
tmp.df_wave[,1] %>% rowSums(na.rm = T) %>% table(useNA = "always") %>% addmargins
tmp.df_wave[,1:5] %>% rowSums(na.rm = T) %>% table(useNA = "always") %>% addmargins
tmp.df_wave[,1:6] %>% rowSums(na.rm = T) %>% table(useNA = "always") %>% addmargins
tmp.df_wave[,1:7] %>% rowSums(na.rm = T) %>% table(useNA = "always") %>% addmargins
tmp.df_wave %>% rowSums(na.rm = T) %>% table(useNA = "always") %>% addmargins
tmp.df_wave %>% rowSums(na.rm = T) %>% str
# > tmp.df_wave[,1] %>% table(useNA = "always") %>% addmargins
# A01_GLU60_TR_ge200
# FALSE  TRUE  <NA>   Sum 
#  8077  1438   515 10030 
# > tmp.df_wave[,1] %>% rowSums(na.rm = T) %>% table(useNA = "always") %>% addmargins
# .
#     0     1  <NA>   Sum 
#  8592  1438     0 10030 
# > tmp.df_wave[,1:5] %>% rowSums(na.rm = T) %>% table(useNA = "always") %>% addmargins
# .
#     0     1  <NA>   Sum 
#  8592  1438     0 10030 
# > tmp.df_wave[,1:6] %>% rowSums(na.rm = T) %>% table(useNA = "always") %>% addmargins
# .
#     0     1     2  <NA>   Sum 
#  7738  2009   283     0 10030 
# > tmp.df_wave[,1:7] %>% rowSums(na.rm = T) %>% table(useNA = "always") %>% addmargins
# .
#     0     1     2     3  <NA>   Sum 
#  7275  2001   604   150     0 10030 
# > tmp.df_wave %>% rowSums(na.rm = T) %>% table(useNA = "always") %>% addmargins
# .
#     0     1     2     3  <NA>   Sum 
#  7275  2001   604   150     0 10030 
# > tmp.df_wave %>% rowSums(na.rm = T) %>% str
#  num [1:10030] 0 0 0 0 0 0 1 0 0 0 ...

