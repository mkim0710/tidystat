
dput(unlist(strsplit(Sys.getlocale(), ";"))) #----
dput(l10n_info()) #----
dput(.Platform) #----
dput(Sys.info()) #----
# > dput(unlist(strsplit(Sys.getlocale(), ";"))) #----  
# c("LC_COLLATE=English_United States.1252", "LC_CTYPE=English_United States.1252", 
# "LC_MONETARY=English_United States.1252", "LC_NUMERIC=C", "LC_TIME=English_United States.1252"
# )
# > dput(l10n_info()) #----  
# list(MBCS = FALSE, `UTF-8` = FALSE, `Latin-1` = TRUE, codepage = 1252L)
# > dput(.Platform) #----  
# list(OS.type = "windows", file.sep = "/", dynlib.ext = ".dll", 
#     GUI = "RStudio", endian = "little", pkgType = "win.binary", 
#     path.sep = ";", r_arch = "x64")
# > dput(Sys.info()) #----  
# c(sysname = "Windows", release = ">= 8 x64", version = "build 9200", 
# nodename = "NUC6I7KYK", machine = "x86-64", login = "mkim0", 
# user = "mkim0", effective_user = "mkim0")

Sys.setlocale("LC_ALL", "korean") #----
# 출처: https://using.tistory.com/66 [황군'story]
pdf.options(family = "Batang-Regular")
pdf.options(family = "Korea1deb")





























  
  
# __________|------  
# 〚〛 END----  

