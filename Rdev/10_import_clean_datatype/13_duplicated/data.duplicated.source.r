# data.duplicated.source.r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/10_import_clean_datatype/13_duplicated/data.duplicated.source.r







library(tidyverse)

# https://stackoverflow.com/questions/22959635/remove-duplicated-rows-using-dplyr
set.seed(1234)
df.example = data.frame(x=sample(0:1,10,replace=T),y=sample(0:1,10,replace=T)) %>% rownames_to_column
# df.example %>% tribble_paste #----
tibble::tribble(
    ~rowname, ~x, ~y,
         "1", 0L, 1L,
         "2", 1L, 1L,
         "3", 1L, 0L,
         "4", 1L, 1L,
         "5", 1L, 0L,
         "6", 1L, 1L,
         "7", 0L, 0L,
         "8", 0L, 0L,
         "9", 1L, 0L,
        "10", 1L, 0L
    )


df.example %>% group_by(x,y) %>% summarize(n())
# > df.example %>% group_by(x,y) %>% summarize(n())
# # A tibble: 4 x 3
# # Groups:   x [2]
#       x     y `n()`
#   <int> <int> <int>
# 1     0     0     2
# 2     0     1     1
# 3     1     0     4
# 4     1     1     3


df.example %>% 
    (function(df) {
        df %>% group_by(x,y) %>% summarize(n()) %>% 
            left_join(df)
    })
# > df.example %>% 
# +     (function(df) {
# +         df %>% group_by(x,y) %>% summarize(n()) %>% 
# +             left_join(df)
# +     })
# Joining, by = c("x", "y")
# # A tibble: 10 x 4
# # Groups:   x [2]
#        x     y `n()` rowname
#    <int> <int> <int> <chr>  
#  1     0     0     2 7      
#  2     0     0     2 8      
#  3     0     1     1 1      
#  4     1     0     4 3      
#  5     1     0     4 5      
#  6     1     0     4 9      
#  7     1     0     4 10     
#  8     1     1     3 2      
#  9     1     1     3 4      
# 10     1     1     3 6  




df.example %>% 
    (function(df.example) {
        df.example %>% group_by(x,y) %>% summarize(n()) %>% 
            left_join(df.example)
    }) %>% group_by(x, y, `n()`) %>% nest
# > df.example %>% 
# +     (function(df.example) {
# +         df.example %>% group_by(x,y) %>% summarize(n()) %>% 
# +             left_join(df.example)
# +     }) %>% group_by(x, y, `n()`) %>% nest
# Joining, by = c("x", "y")
# # A tibble: 4 x 4
#       x     y `n()` data            
#   <int> <int> <int> <list>          
# 1     0     0     2 <tibble [2 x 1]>
# 2     0     1     1 <tibble [1 x 1]>
# 3     1     0     4 <tibble [4 x 1]>
# 4     1     1     3 <tibble [3 x 1]>


df.example %>% group_by(x, y) %>% nest %>% 
    mutate(nrow = data %>% map_dbl(nrow))
df.example %>% group_by(x, y) %>% nest %>% arrange(x, y) %>% 
    mutate(nrow = data %>% map_dbl(nrow))
# > df.example %>% group_by(x, y) %>% nest %>% 
# +     mutate(nrow = data %>% map_dbl(nrow))
# # A tibble: 4 x 4
#       x     y data              nrow
#   <int> <int> <list>           <dbl>
# 1     0     1 <tibble [1 x 1]>     1
# 2     1     1 <tibble [3 x 1]>     3
# 3     1     0 <tibble [4 x 1]>     4
# 4     0     0 <tibble [2 x 1]>     2
# > df.example %>% group_by(x, y) %>% nest %>% arrange(x, y) %>% 
# +     mutate(nrow = data %>% map_dbl(nrow))
# # A tibble: 4 x 4
#       x     y data              nrow
#   <int> <int> <list>           <dbl>
# 1     0     0 <tibble [2 x 1]>     2
# 2     0     1 <tibble [1 x 1]>     1
# 3     1     0 <tibble [4 x 1]>     4
# 4     1     1 <tibble [3 x 1]>     3


df.example %>% group_by(x, y) %>% nest %>% arrange(x, y) %>% 
    mutate(data = data %>% map_chr(paste0, collapse = "|"))
# > df.example %>% group_by(x, y) %>% nest %>% arrange(x, y) %>% 
# +     mutate(data = data %>% map_chr(paste0, collapse = "|"))
# # A tibble: 4 x 3
#       x     y data                            
#   <int> <int> <chr>                           
# 1     0     0 "c(\"7\", \"8\")"               
# 2     0     1 1                               
# 3     1     0 "c(\"3\", \"5\", \"9\", \"10\")"
# 4     1     1 "c(\"2\", \"4\", \"6\")" 





# https://stackoverflow.com/questions/22959635/remove-duplicated-rows-using-dplyr
set.seed(1234)
df.example = data.frame(x=sample(0:1,10,replace=T),y=sample(0:1,10,replace=T)) %>% rownames_to_column
# df.example %>% tribble_paste #----
tibble::tribble(
    ~rowname, ~x, ~y,
         "1", 0L, 1L,
         "2", 1L, 1L,
         "3", 1L, 0L,
         "4", 1L, 1L,
         "5", 1L, 0L,
         "6", 1L, 1L,
         "7", 0L, 0L,
         "8", 0L, 0L,
         "9", 1L, 0L,
        "10", 1L, 0L
    )



df.example[!duplicated(df.example[,c("x", "y")]),]
df.example %>% group_by(x, y) %>% filter(row_number(rowname) == 1)
df.example %>% group_by(x, y) %>% slice(1)
df.example %>% group_by(x, y) %>% do(head(.,1))
df.example %>% distinct(x, y)
df.example %>% distinct(x, y, .keep_all = TRUE)
df.example %>% group_by(x) %>% filter (! duplicated(y))
# > df.example[!duplicated(df.example[,c("x", "y")]),]
#   rowname x y
# 1       1 0 1
# 2       2 1 1
# 3       3 1 0
# 7       7 0 0
# > df.example %>% group_by(x, y) %>% filter(row_number(rowname) == 1)
# # A tibble: 4 x 3
# # Groups:   x, y [4]
#   rowname     x     y
#   <chr>   <int> <int>
# 1 1           0     1
# 2 2           1     1
# 3 7           0     0
# 4 10          1     0
# > df.example %>% group_by(x, y) %>% slice(1)
# # A tibble: 4 x 3
# # Groups:   x, y [4]
#   rowname     x     y
#   <chr>   <int> <int>
# 1 7           0     0
# 2 1           0     1
# 3 3           1     0
# 4 2           1     1
# > df.example %>% group_by(x, y) %>% do(head(.,1))
# # A tibble: 4 x 3
# # Groups:   x, y [4]
#   rowname     x     y
#   <chr>   <int> <int>
# 1 7           0     0
# 2 1           0     1
# 3 3           1     0
# 4 2           1     1
# > df.example %>% distinct(x, y)
#   x y
# 1 0 1
# 2 1 1
# 3 1 0
# 4 0 0
# > df.example %>% distinct(x, y, .keep_all = TRUE)
#   rowname x y
# 1       1 0 1
# 2       2 1 1
# 3       3 1 0
# 4       7 0 0
# > df.example %>% group_by(x) %>% filter (! duplicated(y))
# # A tibble: 4 x 3
# # Groups:   x [2]
#   rowname     x     y
#   <chr>   <int> <int>
# 1 1           0     1
# 2 2           1     1
# 3 3           1     0
# 4 7           0     0





#@ end -----


