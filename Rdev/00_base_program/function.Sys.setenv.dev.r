# https://github.com/mkim0710/tidystat/blob/master/function.update.Rprofile.dev.r
# https://github.com/mkim0710/tidystat/edit/master/function.Sys.setenv.dev.r
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


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
#  [1] Table1_0.10.0      lubridate_1.7.4      forcats_0.4.0        stringr_1.4.0        dplyr_0.8.0.1        purrr_0.3.2         
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


##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# https://community.rstudio.com/t/rstudio-sys-setenv-does-not-persist/2105/3
R.home()
# > R.home()
# [1] "C:/PROGRA~1/MICROS~4/ROPEN~1/R-35~1.3"
# C:\Program Files\Microsoft\R Open\R-3.5.3
# C:\Program Files\Microsoft\R Open\R-3.5.3\etc\Rconsole
# C:\Program Files\Microsoft\R Open\R-3.5.3\etc\Renviron.site
# C:\Program Files\Microsoft\R Open\R-3.5.3\etc\Rprofile.site


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
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

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://community.rstudio.com/t/how-to-change-rstudio-display-language-into-english/46615
Sys.getlocale()
Sys.getenv()
Sys.getenv("LANGUAGE")
# > Sys.getenv("LANGUAGE")
# [1] ""
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# https://stackoverflow.com/questions/12760491/the-r-console-is-in-my-native-language-how-can-i-set-r-to-english
    
Sys.setenv(LANG = "en")
Sys.setenv(LANGUAGE="en");  # Sys.getenv("LANGUAGE");  

# https://stackoverflow.com/questions/12642651/in-r-how-to-get-error-messages-in-english
Sys.setenv(LANGUAGE='en')
Sys.setenv(lang = "en_US")

if(Sys.info()["sysname"] == "Windows") Sys.setlocale("LC_ALL", "en_US.utf8")

Sys.setlocale("LC_MESSAGES", "en_US.utf8")
Sys.setlocale("LC_MESSAGES", "C")

# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.iconv.dev.r
Sys.setlocale("LC_ALL", "korean") #----


# https://stat.ethz.ch/R-manual/R-devel/library/base/html/locales.html
# 
# The following categories should always be supported: "LC_ALL", "LC_COLLATE", "LC_CTYPE", "LC_MONETARY", "LC_NUMERIC" and "LC_TIME". 
# Some systems (not Windows) will also support "LC_MESSAGES", "LC_PAPER" and "LC_MEASUREMENT". 
# 
# Initially most aspects of the locale of R are set to "C" (which is the default for the C language and reflects North-American usage – also known as "POSIX").
# 
# Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.                                                          


# https://thomasadventure.blog/posts/getting-r-to-print-english-error-messages/
# To make this change persistent add Sys.setenv(lang = "en_US") to your .Rprofile file.

# https://support.rstudio.com/hc/en-us/articles/360047157094-Managing-R-with-Rprofile-Renviron-Rprofile-site-Renviron-site-rsession-conf-and-repos-conf
# .Rprofile
# .Renviron


# Caution) This is only for R, not Rstudio~!!
# C:\Program Files\Microsoft\R Open\R-4.0.2\etc
# LANGUAGE=EN

# Caution) This is only for R, not Rstudio~!!
# "C:\Program Files\Microsoft\R Open\R-4.0.2\bin\x64\rgui.exe" LANGUAGE=EN








##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://stackoverflow.com/questions/39340185/how-to-set-the-default-language-of-date-in-r
Sys.setlocale("LC_TIME", "C")

Sys.setlocale("LC_TIME", "English") # Windows
Sys.setlocale("LC_TIME", "en") # Solaris: details are OS-dependent
Sys.setlocale("LC_TIME", "en_US") # Many Unix-alikes
Sys.setlocale("LC_TIME", "en_US.UTF-8") # Linux, macOS, other Unix-alikes
Sys.setlocale("LC_TIME", "en_US.utf8") # some Linux versions



##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
library("lubridate")
#> 
#> Attaching package: 'lubridate'
#> The following .object is masked from 'package:base':
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

cat(setme,file=file.path(R.home(),'etc/Rprofile.site'),sep="\n")





##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://stackoverflow.com/questions/31707941/how-do-i-change-the-default-library-path-for-r-packages
# See help(Startup) and help(.libPaths) as you have several possibilities where this may have gotten set. Among them are
# setting R_LIBS_USER
# assigning .libPaths() in .Rprofile or Rprofile.site

# https://www.accelebrate.com/library/how-to-articles/r-rstudio-library

# https://medium.com/@ValidScience/how-to-fix-rstudios-package-installation-on-windows-10-c1e602bf3a1f
## Before edit -----  
# > Sys.getenv("R_USER") 
# [1] "C:/Users/mkim0/Documents"
# > Sys.getenv("R_LIBS_USER")
# [1] "C:/Users/mkim0/Documents/R/win-library/4.0"


# Go to ---
# C:\Program Files\Microsoft\R Open\R-4.0.2\library\base\R
# Edit Rprofile 
# 
# if(!nzchar(Sys.getenv("R_LIBS_USER")))
#     Sys.setenv(R_LIBS_USER=
#                file.path(Sys.getenv("R_USER"), "R",
#                          "win-library",
#                          paste(R.version$major,
#                                sub("\\..*$", "", R.version$minor),
#                                sep=".")
#                          ))


if(!nzchar(Sys.getenv("R_LIBS_USER")))
    Sys.setenv(R_LIBS_USER=
#                file.path(Sys.getenv("R_USER"), "R",
               file.path("c:/R packages download", "R",
                         "win-library",
                         paste(R.version$major,
                               sub("\\..*$", "", R.version$minor),
                               sep=".")
                         ))

# > .libPaths()
# [1] "C:/R packages download/R/win-library/4.0"          "C:/Program Files/Microsoft/R Open/R-4.0.2/library"




# https://stackoverflow.com/questions/15170399/change-r-default-library-path-using-libpaths-in-rprofile-site-fails-to-work
# 
# The proper solution is to set environment variable R_LIBS_USER to the value of the file path to your desired library folder as opposed to getting RStudio to recognize a Rprofile.site file.
# To set environment variable R_LIBS_USER in Windows, go to the Control Panel (System Properties -> Advanced system properties -> Environment Variables -> User Variables) to a desired value (the path to your library folder)
# 
# Setting R_LIBS_USER will ensure that the library shows up first in .libPaths() regardless of starting RStudio directly or by right-clicking an file and "Open With" to start RStudio.
# 
# The Rprofile solution can work if RStudio is always started by clicking the RStudio shortcut. In this case, setting the default working directory to the directory that houses your Rprofile will be sufficient.
# The Rprofile solution does not work when clicking on a file to start RStudio because that changes the working directory away from the default working directory.




