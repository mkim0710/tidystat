# # install.packages("tidyverse")
# packagename = "tidyverse"
# if(!packagename %in% installed.packages()[,"Package"]) install.packages(packagename)
# 
# install.packages(c("tidyverse", "RODBC", "maps", "jsonlite"))
# for (packagename in c("tidyverse", "RODBC", "maps", "jsonlite")) {
#     if(!packagename %in% installed.packages()[,"Package"]) install.packages(packagename)
# }
for (packagename in c("tidyverse", "RODBC", "maps", "jsonlite")) {
    if(!require(packagename, character.only = T)) {install.packages(packagename); require(packagename, character.only = T)}
}
# 
# for (packagename in c("tidyverse", "RODBC", "maps", "jsonlite")) {
#     if(!require(packagename, character.only = T)) install.packages(packagename)
# }
# 
# # https://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them
# packagenames = c("tidyverse", "RODBC", "maps", "jsonlite")
# packagenames2install = packagenames[!packagenames %in% installed.packages()[,"Package"]]
# if(length(packagenames2install)) install.packages(packagenames2install)
c("tidyverse", "RODBC", "maps", "jsonlite") %>% 
{.[!. %in% installed.packages()[,"Package"]]} %>% {ifelse(length(.) > 0, install.packages(.), .)}
detach("package:maps", unload=TRUE) # package:maps conflicts with some other packages, so load only when you need it, detach when you are done with it.


c("devtools") %>% 
    {.[!. %in% installed.packages()[,"Package"]]} %>% {ifelse(length(.) > 0, install.packages(.), .)}
c("moonBook") %>% 
    {.[!. %in% installed.packages()[,"Package"]]} %>% {ifelse(length(.) > 0, devtools::install_github("cardiomoon/moonBook"), .)}


packagename = "devtools"
if(!require(packagename, character.only = T)) {install.packages(packagename); require(packagename, character.only = T)}
packagename = "moonBook"
if(!require(packagename, character.only = T)) {devtools::install_github("cardiomoon/moonBook"); require(packagename, character.only = T)}

