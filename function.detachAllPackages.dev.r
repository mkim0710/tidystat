# function.detachAllPackages <- function() {
#   # Get the names of all loaded packages
#   loadedPackages <- search()
#   # Detach all loaded packages
#   for (package in loadedPackages) {
#     if (package != "package:base") {
#       detach(package, unload = TRUE)
#     }
#   }
# }


# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r

# invisible(suppressMessages(suppressWarnings(lapply(c("gsl","fBasics","stringr","stringi","Rmpfr"), require, character.only = TRUE))))
# invisible(suppressMessages(suppressWarnings(lapply(names(sessionInfo()$loadedOnly), require, character.only = TRUE))))
# sessionInfo()
# 
# #the above is a test
# 
# invisible(lapply(paste0('package:', c("stringr","fBasics")), detach, character.only=TRUE,unload=TRUE))
# #In the line above, I have inserted by hand what I know the package dependencies to be. A user must know this a priori or have their own automated
# #method to discover it. Without removing dependencies first, the user will have to cycle through loading namespaces and then detaching otherPkgs a
# #second time through.
# invisible(lapply(paste0('package:', names(sessionInfo()$otherPkgs)), detach, character.only=TRUE,unload=TRUE))
# 
# bspkgs.nb<-sessionInfo()$basePkgs[sessionInfo()$basePkgs!="base"]
# bspkgs.nbu<-bspkgs.nb[bspkgs.nb!="utils"]
# names(bspkgs.nbu)<-bspkgs.nbu
# suppressMessages(invisible(lapply(paste0('package:', names(bspkgs.nbu)), detach, character.only=TRUE,unload=TRUE)))
# 
# #again this thoroughly removes all packages and loaded namespaces except for base packages "base" and "utils" (which is highly not recommended).





# @ MH =====
# invisible(lapply(search()[search() %in% paste0("package:",names(sessionInfo()$otherPkgs))], detach, character.only=TRUE, unload=TRUE))

