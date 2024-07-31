# data.nproptable.dev.r



mscan_pregcohort_r4.sas7bdat %>% select(final_type) %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.)[[1]] = c("n", "prop");.} %>% addmargins(margin = 2) #----
# > mscan_pregcohort_r4.sas7bdat %>% select(final_type) %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.)[[1]] = c("n", "prop");.} %>% addmargins(margin = 2) #----
#             1           2          3          4        5        6     Sum
# n    2521.000 2179192.000 415110.000 124556.000 8434.000 8974.000 2738787
# prop    0.001       0.796      0.152      0.045    0.003    0.003       1



mscan_pregcohort_r4.sas7bdat$enrolid_inf1 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
mscan_pregcohort_r4.sas7bdat$enrolid_inf2 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
mscan_pregcohort_r4.sas7bdat$enrolid_inf3 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
mscan_pregcohort_r4.sas7bdat$enrolid_inf4 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
# > mscan_pregcohort_r4.sas7bdat$enrolid_inf1 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
#           !is.na       is.na     Sum
# n    1501597.000 1237190.000 2738787
# prop       0.548       0.452       1
# > mscan_pregcohort_r4.sas7bdat$enrolid_inf2 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
#         !is.na       is.na     Sum
# n    15320.000 2723467.000 2738787
# prop     0.006       0.994       1
# > mscan_pregcohort_r4.sas7bdat$enrolid_inf3 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
#      !is.na   is.na     Sum
# n         4 2738783 2738787
# prop      0       1       1
# > mscan_pregcohort_r4.sas7bdat$enrolid_inf4 %>% is.na %>% {rbind(round(table(.), 0), round(prop.table(table(.)), 3))} %>% {dimnames(.) = list(c("n", "prop"), c("!is.na", "is.na"));.} %>% addmargins(margin = 2) #----
#      !is.na   is.na     Sum
# n         1 2738786 2738787
# prop      0       1       1





#@ end ----  

