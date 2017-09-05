# data.CreateTableOne.source.r

library(tidyverse)
library(tableone)

#@ data.CreateTableOne -----
data.CreateTableOne = data %>% as.data.frame %>% 
    CreateTableOne(data = ., test=F)
data.CreateTableOne %>% print

data.CreateTableOne %>% print(nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame %>% rownames_to_column %>% 
    openxlsx::write.xlsx("data.CreateTableOne.xlsx")
vars4IQR = names(data)[data %>% map_lgl(is.numeric)]
data.CreateTableOne %>% print(nonnormal = vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame %>% rownames_to_column %>% 
    openxlsx::write.xlsx("data.CreateTableOne.IQR.xlsx")


#@ data.CreateTableOne.by_exposure -----
varnames4exposure =  c("treatment")
data.CreateTableOne.by_exposure = data %>% as.data.frame %>% 
    CreateTableOne(strata = varnames4exposure, data = ., test=T)
data.CreateTableOne.by_exposure %>% print(smd = T)

data.CreateTableOne.by_exposure %>% print(smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame %>% rownames_to_column %>% 
    openxlsx::write.xlsx("data.CreateTableOne.by_exposure.xlsx")
vars4IQR = names(data)[data %>% map_lgl(is.numeric)]
data.CreateTableOne.by_exposure %>% print(smd = T, nonnormal = vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame %>% rownames_to_column %>% 
    openxlsx::write.xlsx("data.CreateTableOne.IQR.by_exposure.xlsx")





