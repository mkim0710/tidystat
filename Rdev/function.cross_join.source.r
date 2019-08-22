# function.cross_join.source.r

# https://github.com/mkim0710/tidystat/new/master/Rdev/function.cross_join.source.r
# https://stackoverflow.com/questions/35406535/cross-join-in-dplyr-in-r
# https://github.com/mkim0710/tidystat/blob/master/Rdev/function.pairwise.data_frame.source.r


expand.grid(c("A","B"), 1:3)
# > expand.grid(c("A","B"), 1:3)
#   Var1 Var2
# 1    A    1
# 2    B    1
# 3    A    2
# 4    B    2
# 5    A    3
# 6    B    3


x = data.frame(Var1 = c("A","B"))
y = data.frame(Var2 = 1:3)

merge(x, y, by = NULL)
# > merge(x, y, by = NULL)
#   Var1 Var2
# 1    A    1
# 2    B    1
# 3    A    2
# 4    B    2
# 5    A    3
# 6    B    3

x %>% mutate(tmp = 1) %>% 
    full_join(y %>% mutate(tmp = 1)) %>% 
    select(-tmp)
# > x %>% mutate(tmp = 1) %>% 
# +     full_join(y %>% mutate(tmp = 1)) %>% 
# +     select(-tmp)
# Joining, by = "tmp"
#   Var1 Var2
# 1    A    1
# 2    A    2
# 3    A    3
# 4    B    1
# 5    B    2
# 6    B    3



#@ end ----
