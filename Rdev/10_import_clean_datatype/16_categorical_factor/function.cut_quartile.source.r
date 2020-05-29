# function.cut_quartile.source.r






0:10 %>% quantile(probs = 1:4/4) %>% dput #-----
# > 0:10 %>% quantile(probs = 1:4/4) %>% dput #-----
# c(`25%` = 2.5, `50%` = 5, `75%` = 7.5, `100%` = 10)


0:10 %>% {cut(., breaks = quantile(., probs = 1:4/4))} %>% dput #-----
0:10 %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)))} %>% dput #-----
0:10 %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T)} %>% dput #-----
0:10 %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T, right = F)} %>% dput #-----
# > 0:10 %>% {cut(., breaks = quantile(., probs = 1:4/4))} %>% dput #-----
# structure(c(NA, NA, NA, 1L, 1L, 1L, 2L, 2L, 3L, 3L, 3L), .Label = c("(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# > 0:10 %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)))} %>% dput #-----
# structure(c(NA, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("(0,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# > 0:10 %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T)} %>% dput #-----
# structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("[0,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# > 0:10 %>% {cut(., breaks = c(0, quantile(., probs = 1:4/4)), include.lowest = T, right = F)} %>% dput #-----
# structure(c(1L, 1L, 1L, 2L, 2L, 3L, 3L, 3L, 4L, 4L, 4L), .Label = c("[0,2.5)", "[2.5,5)", "[5,7.5)", "[7.5,10]"), class = "factor")



0:10 %>% cut(4) %>% dput #-----
0:10 %>% cut(4, include.lowest = T) %>% dput #-----
0:10 %>% cut(4, include.lowest = T, right = T) %>% dput #-----
0:10 %>% cut(4, include.lowest = T, right = F) %>% dput #-----
0:10 %>% cut(4, include.lowest = T, right = T, dig.lab = 9, ordered_result = T) %>% dput #-----
# > 0:10 %>% cut(4) %>% dput #-----
# structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("(-0.01,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# > 0:10 %>% cut(4, include.lowest = T) %>% dput #-----
# structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("[-0.01,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# > 0:10 %>% cut(4, include.lowest = T, right = T) %>% dput #-----
# structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("[-0.01,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10]"), class = "factor")
# > 0:10 %>% cut(4, include.lowest = T, right = F) %>% dput #-----
# structure(c(1L, 1L, 1L, 2L, 2L, 3L, 3L, 3L, 4L, 4L, 4L), .Label = c("[-0.01,2.5)", "[2.5,5)", "[5,7.5)", "[7.5,10]"), class = "factor")
# > 0:10 %>% cut(4, include.lowest = T, right = T, dig.lab = 9, ordered_result = T) %>% dput #-----
# structure(c(1L, 1L, 1L, 2L, 2L, 2L, 3L, 3L, 4L, 4L, 4L), .Label = c("[-0.01,2.5]", "(2.5,5]", "(5,7.5]", "(7.5,10.01]"), class = c("ordered", "factor"))







#@ end -----


