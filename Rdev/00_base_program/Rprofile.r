

# https://community.rstudio.com/t/how-to-change-rstudio-display-language-into-english/46615
Sys.getlocale()
Sys.getenv()
Sys.getenv("LANGUAGE")
# > Sys.getenv("LANGUAGE")
# [1] ""

# https://stackoverflow.com/questions/12642651/in-r-how-to-get-error-messages-in-english
Sys.setenv(LANGUAGE='en')
Sys.setenv(lang = "en_US")
Sys.setlocale("LC_ALL", "en_US.utf8")

# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/function.iconv.source.r
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







#@ --------------
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




