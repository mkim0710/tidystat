# https://stackoverflow.com/questions/44169164/dplyr-filter-on-a-vector-rather-than-a-dataframe-in-r?rq=1

c("A", "B", "C", "D") %>% as.tibble %>% filter(grepl("[^AB]", value)) %>% {.$value}
c("A", "B", "C", "D") %>% .[matches("[^AB]", vars=.)]
c("A", "B", "C", "D") %>% .[.!="A"]
# > c("A", "B", "C", "D") %>% as.tibble %>% filter(grepl("[^AB]", value)) %>% {.$value}
# [1] "C" "D"
# > c("A", "B", "C", "D") %>% .[matches("[^AB]", vars=.)]
# [1] "C" "D"
# > c("A", "B", "C", "D") %>% .[.!="A"]
# [1] "B" "C" "D"





#@ end -----
