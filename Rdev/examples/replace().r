# replace().r


.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"), z = list(1:5, NULL, 10:20))
df %>% replace_na(list(x = 0, y = "unknown"))
df$x %>% replace_na(0)
df %>% mutate(x = x %>% replace_na(0), y = y %>% replace_na("unknown"))
# > df %>% replace_na(list(x = 0, y = "unknown"))
# # A tibble: 3 x 3
#       x y       z         
#   <dbl> <chr>   <list>    
# 1     1 a       <int [5]> 
# 2     2 unknown <NULL>    
# 3     0 b       <int [11]>
# > df$x %>% replace_na(0)
# [1] 1 2 0
# > df %>% mutate(x = x %>% replace_na(0), y = y %>% replace_na("unknown"))
# # A tibble: 3 x 3
#       x y       z         
#   <dbl> <chr>   <list>    
# 1     1 a       <int [5]> 
# 2     2 unknown <NULL>    
# 3     0 b       <int [11]>







# https://stackoverflow.com/questions/20105015/summing-lots-of-vectors-row-wise-or-elementwise-but-ignoring-na-values?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
df2 = data.frame(
    col1 = c(NA,1,2,3)
    , col2 = c(1,2,3,NA)
    , col3 = c(NA,NA,2,3)
)

df2 %>% mutate(sum = rowSums(cbind(col1,col2,col3), na.rm=TRUE))
# > df2 %>% mutate(col4 = rowSums(cbind(col1,col2,col3), na.rm=TRUE))
#   col1 col2 col3 col4
# 1   NA    1   NA    1
# 2    1    2   NA    3
# 3    2    3    2    7
# 4    3   NA    3    6






# https://rickpackblog.wordpress.com/2017/11/20/replace-na-in-all-columns-with-dplyr-rstats/
df2 %>% replace(., is.na(.), 0) %>% mutate(sum = col1 + col2 + col3)
# > df2 %>% replace(., is.na(.), 0) %>% mutate(sum = col1 + col2 + col3)
#   col1 col2 col3 sum
# 1    0    1    0   1
# 2    1    2    0   3
# 3    2    3    2   7
# 4    3    0    3   6






# ?addmargins
df2 |> as.matrix() %>% addmargins(margin = 2, FUN = function(x) sum(x, na.rm = T))
# > df2 |> as.matrix() %>% addmargins(margin = 2, FUN = function(x) sum(x, na.rm = T))
#      col1 col2 col3 function(x) sum(x, na.rm = T)
# [1,]   NA    1   NA                             1
# [2,]    1    2   NA                             3
# [3,]    2    3    2                             7
# [4,]    3   NA    3                             6





\
# ⸿ END-----  
