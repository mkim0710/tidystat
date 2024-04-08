
# BiocManager::install() is to install a software library from Bioconductor (www.bioconductor.org) rather than CRAN.
if ("BiocManager" %in% installed.packages()[,"Package"]) print("Already installed") else install.packages("BiocManager") # If that package is not already installed, then install.
if ("multtest" %in% installed.packages()[,"Package"]) print("Already installed") else BiocManager::install("multtest") # If that package is not already installed, then install.  
library(multtest)

# BiocManager::install() is to install a software library from Bioconductor (www.bioconductor.org) rather than CRAN.
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager") # If that package is not already installed, then install.
if (!requireNamespace("multtest", quietly = TRUE)) BiocManager::install("multtest") # If that package is not already installed, then install.
library(multtest)




for (packagename in c("dplyr", "readr")) {
    if(packagename %in% installed.packages()[,"Package"]) {   
        # If that package is already installed, then just load it. (You don't want to re-install if it is already installed.)
        require(packagename, character.only = T)
    } else {  
        # If that package is not already installed, then install first.
        install.packages(packagename, type = "binary")  # I am installing via "binary" because the installed R version is too old.
        require(packagename, character.only = T)
    }
}



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


