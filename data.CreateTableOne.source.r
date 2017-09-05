# data.CreateTableOne.source.r


data.CreateTableOne = data %>% as.data.frame %>% 
    CreateTableOne(data = ., test=F)
data.CreateTableOne %>% print

data.CreateTableOne %>% print(nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame %>% rownames_to_column %>% 
    openxlsx::write.xlsx("data.CreateTableOne.xlsx")


data.CreateTableOne.by_exposure = data %>% as.data.frame %>% 
    CreateTableOne(strata = c("exposure"), data = ., test=T)
data.CreateTableOne.by_exposure %>% print(smd = T)

data.CreateTableOne.by_exposure %>% print(smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame %>% rownames_to_column %>% 
    openxlsx::write.xlsx("data.CreateTableOne.by_exposure.xlsx")





