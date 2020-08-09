
sessionInfo()
# > sessionInfo()
# R version 3.5.3 (2019-03-11)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 18362)
# 
# Matrix products: default
# 
# locale:
# [1] LC_COLLATE=Korean_Korea.949  LC_CTYPE=Korean_Korea.949    LC_MONETARY=Korean_Korea.949 LC_NUMERIC=C                
# [5] LC_TIME=Korean_Korea.949    
# 
# attached base packages:
# [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# other attached packages:
#  [1] tableone_0.10.0      lubridate_1.7.4      forcats_0.4.0        stringr_1.4.0        dplyr_0.8.0.1        purrr_0.3.2         
#  [7] readr_1.3.1          tidyr_0.8.3          tibble_2.1.1         ggplot2_3.1.1        tidyverse_1.2.1      RevoUtils_11.0.3    
# [13] RevoUtilsMath_11.0.0
# 
# loaded via a namespace (and not attached):
#  [1] tinytex_0.12     zoo_1.8-5        tidyselect_0.2.5 xfun_0.6         splines_3.5.3    haven_2.1.0      lattice_0.20-38 
#  [8] labelled_2.1.0   colorspace_1.4-1 generics_0.0.2   survival_2.43-3  utf8_1.1.4       rlang_0.3.4      e1071_1.7-1     
# [15] pillar_1.3.1     glue_1.3.1       withr_2.1.2      modelr_0.1.4     readxl_1.3.1     plyr_1.8.4       munsell_0.5.0   
# [22] gtable_0.3.0     cellranger_1.1.0 rvest_0.3.3      zip_2.0.1        class_7.3-15     fansi_0.4.0      broom_0.5.2     
# [29] Rcpp_1.0.1       scales_1.0.0     backports_1.1.4  jsonlite_1.6     hms_0.4.2        packrat_0.5.0    stringi_1.4.3   
# [36] openxlsx_4.1.0   survey_3.35-1    grid_3.5.3       cli_1.1.0        tools_3.5.3      magrittr_1.5     lazyeval_0.2.2  
# [43] crayon_1.3.4     pkgconfig_2.0.2  MASS_7.3-51.3    Matrix_1.2-15    rsconnect_0.8.13 xml2_1.2.0       datapasta_3.0.0 
# [50] assertthat_0.2.1 httr_1.4.0       rstudioapi_0.10  R6_2.4.0         nlme_3.1-137     compiler_3.5.3 



# https://cran.r-project.org/web/packages/startup/vignettes/startup-intro.html

Sys.getenv("R_ENVIRON_USER")
Sys.getenv("R_PROFILE_USER")
# > Sys.getenv("R_ENVIRON_USER")
# [1] ""
# > Sys.getenv("R_PROFILE_USER")
# [1] ""

paste0(Sys.getenv("R_ENVIRON_USER"), ".d")
paste0(Sys.getenv("R_PROFILE_USER"), ".d")
# > paste0(Sys.getenv("R_ENVIRON_USER"), ".d")
# [1] ".d"
# > paste0(Sys.getenv("R_PROFILE_USER"), ".d")
# [1] ".d"


# https://stackoverflow.com/questions/12760491/the-r-console-is-in-my-native-language-how-can-i-set-r-to-english
    
Sys.setenv(LANG = "en")
Sys.setenv(LANGUAGE="en")



# https://community.rstudio.com/t/rstudio-sys-setenv-does-not-persist/2105/3
R.home()
# > R.home()
# [1] "C:/PROGRA~1/MICROS~4/ROPEN~1/R-35~1.3"
# C:\Program Files\Microsoft\R Open\R-3.5.3
# C:\Program Files\Microsoft\R Open\R-3.5.3\etc\Rconsole
# C:\Program Files\Microsoft\R Open\R-3.5.3\etc\Renviron.site
# C:\Program Files\Microsoft\R Open\R-3.5.3\etc\Rprofile.site


library("lubridate")
#> 
#> Attaching package: 'lubridate'
#> The following object is masked from 'package:base':
#> 
#>     date
lubridate::tz(lubridate::ymd("2016-03-26"))
#> Warning in as.POSIXlt.POSIXct(x, tz): unknown timezone 'default/America/
#> New_York'
#> [1] "UTC"
lubridate::tz(lubridate::ymd("2016-03-26"))
#> [1] "UTC"

Sys.setenv(TZ = "America/New_York")





setme <- 
"Sys.setenv(TZ='America/New_York') #some default not get any errors
invisible(loadNamespace('rgeolocate'))
invisible(loadNamespace('httr'))
mytz <- rgeolocate::ip_api(httr::content(httr::GET('https://api.ipify.org?format=json'))[1])[['timezone']]
Sys.setenv(TZ=mytz)"

cat(setme,file=file.path(R.home(),'etc/Rprofile.site'),sep='\n')









# https://stackoverflow.com/questions/13575180/how-to-change-language-settings-in-r
Sys.getenv()


Sys.setlocale("LC_MESSAGES", "en_US.utf8")
Sys.setlocale("LC_MESSAGES", "C")


#@ end -----
