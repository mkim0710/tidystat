

# restarted = rstudioapi::restartSession()  # ctrl+shift+f10
# for (i in 1:10) {
#     if (exists("restarted")) {message("R session restarted"); break} 
#     Sys.sleep(0.5)
#     if (i == 10) {warning("R session restart failed")}
# }




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


#@ 
detach_packages_safely <- function() {
  library(tools)  # For parsing package dependencies

  # Get list of currently loaded namespaces
  pkgs <- names(sessionInfo()$otherPkgs)

  # Determine the dependency tree
  dep_list <- sapply(pkgs, function(pkg) {
    deps <- package_dependencies(pkg, db = available.packages(), which = c("Depends", "Imports", "LinkingTo"), recursive = TRUE)
    return(unlist(deps))
  }, simplify = FALSE)

  # Flatten the list if nested and count dependencies
  dep_counts <- sapply(dep_list, function(deps) {
    length(unique(deps))
  })

  # Sort packages by the number of other packages that depend on them
  pkg_order <- order(dep_counts, decreasing = TRUE)
  sorted_pkgs <- pkgs[pkg_order]

  # Detach packages in the order determined, from least dependent to most dependent
  results <- sapply(sorted_pkgs, function(pkg) {
    package_name <- paste0("package:", pkg)
    if (package_name %in% search()) {
      tryCatch({
        detach(name = package_name, unload = TRUE, character.only = TRUE)
        paste("Detached", pkg)
      }, error = function(e) {
        paste("Failed to detach", pkg, ":", e$message)
      })
    } else {
      paste("Package not loaded:", pkg)
    }
  }, simplify = FALSE)

  return(results)
}

# Run the function
invisible(detach_packages_safely())


