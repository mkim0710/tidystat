
# https://www.statology.org/remove-columns-with-na-in-r/
NHID_GJ0910 %>% dim #----
NHID_GJ0910 %>% {.[,colSums(is.na(.))<nrow(.)]} %>% dim #----
NHID_GJ0910 %>% select_if(~ !all(is.na(.))) %>% dim #----
NHID_GJ0910 
# > NHID_GJ0910 %>% dim #----
# [1] 440287     51
# > NHID_GJ0910 %>% {.[,colSums(is.na(.))<nrow(.)]} %>% dim #----
# [1] 440287     41
# > NHID_GJ0910 %>% select_if(~ !all(is.na(.))) %>% dim #----
# [1] 440287     41

