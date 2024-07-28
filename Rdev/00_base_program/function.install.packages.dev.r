
# BiocManager::install() is to install a software library from Bioconductor (www.bioconductor.org) rather than CRAN.
if ("BiocManager" %in% installed.packages()[,"Package"]) print("Already installed") else install.packages("BiocManager") # If that package is not already installed, then install.
if ("multtest" %in% installed.packages()[,"Package"]) print("Already installed") else BiocManager::install("multtest") # If that package is not already installed, then install.  
library(multtest)

# BiocManager::install() is to install a software library from Bioconductor (www.bioconductor.org) rather than CRAN.
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager") # If that package is not already installed, then install.
if (!requireNamespace("multtest", quietly = TRUE)) BiocManager::install("multtest") # If that package is not already installed, then install.
library(multtest)




for(.packagename in c("dplyr", "readr")) {if(!require(.packagename,character.only=TRUE))install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}  



# # install.packages("tidyverse")
# .tmp$packagename = "tidyverse"
# if(!.tmp$packagename %in% installed.packages()[,"Package"]) install.packages(.tmp$packagename)
# 
# install.packages(c("tidyverse", "RODBC", "maps", "jsonlite"))
for(.packagename in c("tidyverse", "RODBC", "maps", "jsonlite")) {if(!require(.packagename,character.only=TRUE))install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}
# 
# 
# # https://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them
# .tmp$packagenames = c("tidyverse", "RODBC", "maps", "jsonlite")
# .tmp$packagenames2install = .tmp$packagenames[!.tmp$packagenames %in% installed.packages()[,"Package"]]
# if(length(.tmp$packagenames2install)) install.packages(.tmp$packagenames2install)
c("tidyverse", "RODBC", "maps", "jsonlite") %>% 
{.[!. %in% installed.packages()[,"Package"]]} %>% {ifelse(length(.) > 0, install.packages(.), .)}
detach("package:maps", unload=TRUE) # package:maps conflicts with some other packages, so load only when you need it, detach when you are done with it.


c("devtools") %>% 
    {.[!. %in% installed.packages()[,"Package"]]} %>% {ifelse(length(.) > 0, install.packages(.), .)}
c("moonBook") %>% 
    {.[!. %in% installed.packages()[,"Package"]]} %>% {ifelse(length(.) > 0, devtools::install_github("cardiomoon/moonBook"), .)}


.tmp$packagename = "devtools"
if(!require(.tmp$packagename,character.only=TRUE))install.packages(.tmp$packagename) else library(.tmp$packagename,character.only=TRUE)
.tmp$packagename = "moonBook"
if(!require(.tmp$packagename,character.only=TRUE)) {devtools::install_github("cardiomoon/moonBook"); require(.tmp$packagename,character.only=TRUE)}


