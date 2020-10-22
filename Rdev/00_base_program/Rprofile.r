

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

