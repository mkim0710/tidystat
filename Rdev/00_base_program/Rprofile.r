

# https://community.rstudio.com/t/how-to-change-rstudio-display-language-into-english/46615
Sys.getlocale()
Sys.getenv()

# https://stackoverflow.com/questions/12642651/in-r-how-to-get-error-messages-in-english
Sys.setenv(LANGUAGE='en')
Sys.setenv(lang = "en_US")
Sys.setlocale("LC_ALL", "en_US.utf8")

# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.iconv.source.r
Sys.setlocale("LC_ALL", "korean") #----


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







#@ --------------
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


