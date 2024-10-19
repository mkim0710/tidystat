# install.packages.zip.r





# > available.packages() |> str() ----
# available.packages() |> str()
# #  chr [1:21465, 1:17] "A3" "AalenJohansen" "AATtools" "ABACUS" "abasequence" "abbreviate" "abc" "abc.data" "ABC.RAP" "ABCanalysis" "abclass" "ABCoptim" ...
# #  - attr(*, "dimnames")=List of 2
# #   ..$ : chr [1:21465] "A3" "AalenJohansen" "AATtools" "ABACUS" ...
# #   ..$ : chr [1:17] "Package" "Version" "Priority" "Depends" ...


#@ package_name =  ----
package_name = "cli"

# Retrieve CRAN mirror URL ----
cranmi
cran_mirror <- "https://cran.r-project.org"
getOption("pkgType")
# > getOption("pkgType")
# [1] "both"

# cran_mirror.available.packages = available.packages(contriburl = contrib.url(repos = cran_mirror, type = getOption("pkgType"))) |> str()
cran_mirror.available.packages = available.packages(contriburl = contrib.url(repos = cran_mirror, type = "win.binary")) 
cran_mirror.available.packages |> str()
cran_mirror.available.packages |> colnames() |> deparse(width.cutoff = 500) |> cat("\n")
# > cran_mirror.available.packages |> str()
#  chr [1:21487, 1:17] "A3" "AATtools" "ABACUS" "ABC.RAP" "ABCanalysis" "ABCoptim" "ABCp2" "ABHgenotypeR" "ABM" "ABPS" "ABSurvTDC" "ACA" "ACDm" "ACE.CoCo" ...
#  - attr(*, "dimnames")=List of 2
#   ..$ : chr [1:21487] "A3" "AATtools" "ABACUS" "ABC.RAP" ...
#   ..$ : chr [1:17] "Package" "Version" "Priority" "Depends" ...
# > cran_mirror.available.packages |> colnames() |> deparse(width.cutoff = 500) |> cat("\n")
# c("Package", "Version", "Priority", "Depends", "Imports", "LinkingTo", "Suggests", "Enhances", "License", "License_is_FOSS", "License_restr()icts_use", "OS_type", "Archs", "MD5sum", "NeedsCompilation", "File", "Repository") 


## > cran_mirror.available.packages[package_name, ] |> as.list |> str() ----
cran_mirror.available.packages[package_name, ] |> as.list |> str()
cran_mirror.available.packages[package_name, "Repository"]
cran_mirror.available.packages[package_name, "Version"]
# List of 17
#  $ Package              : chr "cli"
#  $ Version              : chr "3.6.3"
#  $ Priority             : chr NA
#  $ Depends              : chr "R (>= 3.4)"
#  $ Imports              : chr "utils"
#  $ LinkingTo            : chr NA
#  $ Suggests             : chr "callr, covr, crayon, digest, glue (>= 1.6.0), grDevices,\nhtmltools, htmlwidgets, knitr, methods, mockery, proc"| __truncated__
#  $ Enhances             : chr NA
#  $ License              : chr "MIT + file LICENSE"
#  $ License_is_FOSS      : chr NA
#  $ License_restr()icts_use: chr NA
#  $ OS_type              : chr NA
#  $ Archs                : chr "x64"
#  $ MD5sum               : chr NA
#  $ NeedsCompilation     : chr NA
#  $ File                 : chr NA
#  $ Repository           : chr "https://cran.r-project.org/bin/windows/contrib/4.3"
# > cran_mirror.available.packages[package_name, "Repository"]
# [1] "https://cran.r-project.org/src/contrib"
# > cran_mirror.available.packages[package_name, "Repository"]
# [1] "https://cran.r-project.org/bin/windows/contrib/4.3"
# > cran_mirror.available.packages[package_name, "Version"]
# [1] "3.6.3"



## # > packageDescription(package_name) |> str() ----
packageDescription(package_name) |> str()
# List of 23
#  $ Package                : chr "cli"
#  $ Title                  : chr "Helpers for Developing Command Line Interfaces"
#  $ Version                : chr "3.6.2"
#  $ Authors@R              : chr "c(\n    person(\"Gábor\", \"Csárdi\", , \"csardi.gabor@gmail.com\", role = c(\"aut\", \"cre\")),\n    person(\""| __truncated__
#  $ Description            : chr "A suite of tools to build attractive command line interfaces\n    ('CLIs'), from semantic elements: headings, l"| __truncated__
#  $ License                : chr "MIT + file LICENSE"
#  $ URL                    : chr "https://cli.r-lib.org, https://github.com/r-lib/cli"
#  $ BugReports             : chr "https://github.com/r-lib/cli/issues"
#  $ Depends                : chr "R (>= 3.4)"
#  $ Imports                : chr "utils"
#  $ Suggests               : chr "callr, covr, crayon, digest, glue (>= 1.6.0), grDevices,\nhtmltools, htmlwidgets, knitr, methods, mockery, proc"| __truncated__
#  $ Config/Needs/website   : chr "r-lib/asciicast, bench, brio, cpp11, decor, desc,\nfansi, prettyunits, sessioninfo, tidyverse/tidytemplate,\nusethis, vctrs"
#  $ Config/testthat/edition: chr "3"
#  $ Encoding               : chr "UTF-8"
#  $ RoxygenNote            : chr "7.2.3"
#  $ NeedsCompilation       : chr "yes"
#  $ Packaged               : chr "2023-12-10 22:38:10 UTC; gaborcsardi"
#  $ Author                 : chr "Gábor Csárdi [aut, cre],\n  Hadley Wickham [ctb],\n  Kirill Müller [ctb],\n  Salim Brüggemann [ctb] (<https://o"| __truncated__
#  $ Maintainer             : chr "Gábor Csárdi <csardi.gabor@gmail.com>"
#  $ Repository             : chr "CRAN"
#  $ Date/Publication       : chr "2023-12-11 07:40:13 UTC"
#  $ Built                  : chr "R 4.3.3; x86_64-w64-mingw32; 2024-03-12 01:27:49 UTC; windows"
#  $ Archs                  : chr "x64"
#  - attr(*, "class")= chr "packageDescription"
#  - attr(*, "file")= chr "C:/Users/mkim0/AppData/Local/R/win-library/4.3/cli/Meta/package.rds"



#@ installr::install.packages.zip() ----
# Constr()uct the URL for the latest version dynamically
package_url <- sprintf("%s/bin/windows/contrib/r-release/cli_%s.zip", cran_mirror, latest_version)

# Install the package using the dynamically generated URL
installr::install.packages.zip(package_url)
install.packages.zip.warnings = names(warnings())[[length(warnings())]] 
install.packages.zip.warnings |> dput()
"problem copying C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\00LOCK\\cli\\libs\\x64\\cli.dll to C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\cli\\libs\\x64\\cli.dll: Permission denied"
install.packages.zip.warnings |> (function(ls) gsub(".*(C\\:[^ ]*) *", "$1", ls[[length(ls)]]))()

# regex4path_letters = "A-Za-z0-9./\\-"
# regex4winpath = paste0("[A-Z]:[", regex4path_letters, "]*")
# regex4winpath
# install.packages.zip.warnings.split = strsplit(install.packages.zip.warnings, " ")[[1]]
# grep(paste0("^", regex4winpath), install.packages.zip.warnings.split, value = TRUE) |> deparse(width.cutoff = 500) |> cat("\n")
# gsub(paste0("[^", regex4path_letters, "]*"), "", grep(paste0("^", regex4winpath), install.packages.zip.warnings.split, value = TRUE)) |> deparse(width.cutoff = 500) |> cat("\n")
# # > regex4winpath
# # [1] "[A-Z]:[A-Za-z0-9. /\\-]*"
# # > install.packages.zip.warnings.split = strsplit(install.packages.zip.warnings, " ")[[1]]
# # > grep(paste0("^", regex4winpath), install.packages.zip.warnings.split, value = TRUE) |> deparse(width.cutoff = 500) |> cat("\n")
# # c("C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\00LOCK\\cli\\libs\\x64\\cli.dll", "C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\cli\\libs\\x64\\cli.dll:") 
# # > gsub(paste0("[^", regex4path_letters, "]*"), "", grep(paste0("^", regex4winpath), install.packages.zip.warnings.split, value = TRUE)) |> deparse(width.cutoff = 500) |> cat("\n")
# # c("C\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\00LOCK\\cli\\libs\\x64\\cli.dll", "C\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\cli\\libs\\x64\\cli.dll") 

regex4path_letters = "A-Za-z0-9./\\-"
regex4winpath = paste0("[A-Z]:[", regex4path_letters, "]*")
vec.path_file = regmatches(install.packages.zip.warnings, gregexpr(regex4winpath, install.packages.zip.warnings))[[1]] 
vec.path_file |> deparse(width.cutoff = 500) |> cat("\n")
vec.path_file[length(vec.path_file)] |> file.remove()
# > vec.path_file |> deparse(width.cutoff = 500) |> cat("\n")
# c("C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\00LOCK\\cli\\libs\\x64\\cli.dll", "C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\cli\\libs\\x64\\cli.dll") 
# > vec.path_file[length(vec.path_file)] |> file.remove()
# [1] FALSE
# Warning message:
# In file.remove(vec.path_file[length(vec.path_file)]) :
#   cannot remove file 'C:\Users\mkim0\AppData\Local\R\win-library\4.3\cli\libs\x64\cli.dll', reason 'Permission denied'

vec.path


vec.path_file[length(vec.path_file)] |> dirname() |> browseURL()
vec.path_file[length(vec.path_file)] |> 
# > vec.path_file[length(vec.path_file)] |> file.remove()
# [1] FALSE
# Warning message:
# In file.remove(vec.path_file[length(vec.path_file)]) :
#   cannot remove file 'C:\Users\mkim0\AppData\Local\R\win-library\4.3\cli\libs\x64\cli.dll', reason 'Permission denied'

package_name

