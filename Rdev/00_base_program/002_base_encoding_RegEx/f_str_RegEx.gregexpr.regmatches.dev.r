# Rdev/00_base_program/f_RegEx.gregexpr.regmatches.dev.r
# install.packages.zip.r


## :: install.packages.zip.warnings = ====
# install.packages.zip.warnings = names(warnings())[[length(warnings())]] 
# install.packages.zip.warnings |> dput()
# "problem copying C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\00LOCK\\cli\\libs\\x64\\cli.dll to C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\cli\\libs\\x64\\cli.dll: Permission denied"
install.packages.zip.warnings = "problem copying C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\00LOCK\\cli\\libs\\x64\\cli.dll to C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\cli\\libs\\x64\\cli.dll: Permission denied"


## :: regex4path_letters = ==== 
## :: regex4winpath = ==== 
regex4path_letters = "A-Za-z0-9./\\-"
regex4winpath = paste0("[A-Z]:[", regex4path_letters, "]*")




##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### |> f_chr.split.grep(split.sep, grep.pattern) -void ----

regex4path_letters = "A-Za-z0-9./\\-"
regex4winpath = paste0("[A-Z]:[", regex4path_letters, "]*")
regex4winpath
install.packages.zip.warnings.split = strsplit(install.packages.zip.warnings, " ") |> unlist()
grep(paste0("^", regex4winpath), install.packages.zip.warnings.split, value = TRUE) |> deparse(width.cutoff = 500) |> cat("\n")
gsub(paste0("[^", regex4path_letters, "]*"), "", grep(paste0("^", regex4winpath), install.packages.zip.warnings.split, value = TRUE)) |> deparse(width.cutoff = 500) |> cat("\n")
# > regex4winpath
# [1] "[A-Z]:[A-Za-z0-9. /\\-]*"
# > install.packages.zip.warnings.split = strsplit(install.packages.zip.warnings, " ") |> unlist()
# > grep(paste0("^", regex4winpath), install.packages.zip.warnings.split, value = TRUE) |> deparse(width.cutoff = 500) |> cat("\n")
# c("C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\00LOCK\\cli\\libs\\x64\\cli.dll", "C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\cli\\libs\\x64\\cli.dll:")
# > gsub(paste0("[^", regex4path_letters, "]*"), "", grep(paste0("^", regex4winpath), install.packages.zip.warnings.split, value = TRUE)) |> deparse(width.cutoff = 500) |> cat("\n")
# c("C\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\00LOCK\\cli\\libs\\x64\\cli.dll", "C\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\cli\\libs\\x64\\cli.dll")

# f_chr.split.grep = function(input_string, split.sep, grep.pattern) {
#     input_string.split = strsplit(input_string, split.sep)[[1]]
#     grep(grep.pattern, input_string.split, value = TRUE)
# }




##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### |> f_chr_RegEx4extract.gsub(split.sep, grep.pattern) -void ----
regex4path_letters = "A-Za-z0-9./\\-"
regex4winpath = paste0("[A-Z]:[", regex4path_letters, "]*")
install.packages.zip.warnings |> (function(str) gsub(".*(C\\:[^ ]*) .*", "\\1", str))()
install.packages.zip.warnings |> (function(str) gsub(paste0(".*(", regex4winpath, ") .*"), "\\1", str))()
# > install.packages.zip.warnings |> (function(str) gsub(".*(C\\:[^ ]*) .*", "\\1", str))()
# [1] "C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\cli\\libs\\x64\\cli.dll:"
# > install.packages.zip.warnings |> (function(str) gsub(paste0(".*(", regex4winpath, ") .*"), "\\1", str))()
# [1] "C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\00LOCK\\cli\\libs\\x64\\cli.dll"




##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### |> str_extract_all(str_replace_all(regex4winpath, "\\\\", "\\\\\\\\")) ----
install.packages.zip.warnings |> str_extract_all(str_replace_all(regex4winpath, "\\\\", "\\\\\\\\")) |> deparse(width.cutoff = 500) |> cat("\n")
# > install.packages.zip.warnings |> str_extract_all(str_replace_all(regex4winpath, "\\\\", "\\\\\\\\")) |> deparse(width.cutoff = 500) |> cat("\n")
# list(c("C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\00LOCK\\cli\\libs\\x64\\cli.dll", "C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\cli\\libs\\x64\\cli.dll")) 


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### |> f_chr_RegEx.gregexpr.regmatches(regex4winpath) ----
# Rdev/00_base_program/f_RegEx.gregexpr.regmatches.dev.r
regmatches(install.packages.zip.warnings, gregexpr(regex4winpath, install.packages.zip.warnings)) |> deparse(width.cutoff = 500) |> cat("\n")
# > regmatches(install.packages.zip.warnings, gregexpr(regex4winpath, install.packages.zip.warnings)) |> deparse(width.cutoff = 500) |> cat("\n")
# list(c("C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\00LOCK\\cli\\libs\\x64\\cli.dll", "C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\cli\\libs\\x64\\cli.dll")) 


f_chr_RegEx.gregexpr.regmatches = function(input_string, RegEx) {
    regmatches(input_string, gregexpr(RegEx, input_string)) |> unlist()
}

vec.path_file = install.packages.zip.warnings |> f_chr_RegEx.gregexpr.regmatches(regex4winpath) 
vec.path_file |> deparse(width.cutoff = 500) |> cat("\n")
# > vec.path_file |> deparse(width.cutoff = 500) |> cat("\n")
# c("C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\00LOCK\\cli\\libs\\x64\\cli.dll", "C:\\Users\\mkim0\\AppData\\Local\\R\\win-library\\4.3\\cli\\libs\\x64\\cli.dll") 




