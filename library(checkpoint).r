# library(checkpoint).r


sessionInfo() # LIVAi7-8700 ----
sessionInfo() # MKIM-15ZD980-HX70K ----
sessionInfo() # RStudio.Cloud ----
# > sessionInfo() # LIVAi7-8700 ----
# R version 4.0.2 (2020-06-22)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 18362)
# 
# Matrix products: default
# 
# Random number generation:
#  RNG:     Mersenne-Twister 
#  Normal:  Inversion 
#  Sample:  Rounding 
#  
# locale:
# [1] LC_COLLATE=Korean_Korea.949  LC_CTYPE=Korean_Korea.949    LC_MONETARY=Korean_Korea.949 LC_NUMERIC=C                
# [5] LC_TIME=Korean_Korea.949    
# 
# attached base packages:
# [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# other attached packages:
# [1] RevoUtils_11.0.2     RevoUtilsMath_11.0.0
# 
# loaded via a namespace (and not attached):
#  [1] fansi_0.4.1      dplyr_1.0.0      crayon_1.3.4     assertthat_0.2.1 grid_4.0.2       R6_2.3.0        
#  [7] lifecycle_0.2.0  gtable_0.3.0     magrittr_1.5     scales_1.1.1     pillar_1.4.6     ggplot2_3.3.2   
# [13] rlang_0.4.7      cli_2.0.2        rstudioapi_0.11  generics_0.0.2   vctrs_0.3.2      ellipsis_0.3.1  
# [19] tools_4.0.2      glue_1.4.1       purrr_0.3.4      munsell_0.5.0    compiler_4.0.2   pkgconfig_2.0.3 
# [25] colorspace_1.4-1 datapasta_3.1.0  tidyselect_1.1.0 tibble_3.0.3    
# > sessionInfo() # RStudio.Cloud ----
# R version 4.0.2 (2020-06-22)
# Platform: x86_64-pc-linux-gnu (64-bit)
# Running under: Ubuntu 16.04.6 LTS
# 
# Matrix products: default
# BLAS:   /usr/lib/atlas-base/atlas/libblas.so.3.0
# LAPACK: /usr/lib/atlas-base/atlas/liblapack.so.3.0
# 
# locale:
#  [1] LC_CTYPE=C.UTF-8       LC_NUMERIC=C           LC_TIME=C.UTF-8        LC_COLLATE=C.UTF-8    
#  [5] LC_MONETARY=C.UTF-8    LC_MESSAGES=C.UTF-8    LC_PAPER=C.UTF-8       LC_NAME=C             
#  [9] LC_ADDRESS=C           LC_TELEPHONE=C         LC_MEASUREMENT=C.UTF-8 LC_IDENTIFICATION=C   
# 
# attached base packages:
# [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# loaded via a namespace (and not attached):
# [1] compiler_4.0.2 tools_4.0.2 



# # https://mran.microsoft.com/documents/rro/reproducibility
# # https://mran.microsoft.com/timemachine
# # https://cran.r-project.org/web/packages/checkpoint/vignettes/checkpoint.html
# 
# 
# library(checkpoint)
# t0 = Sys.time()
# checkpoint("2020-07-16") # Microsoft R Open 4.0.2 -----
# Sys.time() - t0
# q()



# https://community.rstudio.com/t/using-library-checkpoint-in-rstudio-cloud/
# https://packagemanager.rstudio.com/client/#/repos/2/overview
# options(repos = c(CRAN= "https://packagemanager.rstudio.com/cran/302"))  # snapshot for 2020-07-16
options(repos = c(CRAN= "https://packagemanager.rstudio.com/cran/__linux__/xenial/302"))  # snapshot for 2020-07-16, binary for Ubuntu 16.04 (Xenial)

for (packagename in c("icd")) {
    if(packagename %in% installed.packages()[,"Package"]) {   
        # If that package is already installed, then just load it. (You don't want to re-install if it is already installed.)
        warning(paste0(packagename, ' %in% installed.packages()[,"Package"])'))
        require(packagename,character.only=TRUE)
    } else {  
        # If that package is not already installed, then install first.
        install.packages(packagename)
        # install.packages(packagename, type = "binary")  # I am installing via "binary" because the installed R version is too old.
        require(packagename,character.only=TRUE)
    }
}
# https://packagemanager.rstudio.com/client/#/repos/1/packages/icd

#@ end -----
