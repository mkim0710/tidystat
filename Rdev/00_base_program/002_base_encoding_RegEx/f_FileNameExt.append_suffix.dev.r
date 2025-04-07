
# https://chatgpt.com/c/673012da-c450-800e-81ad-6a7251d79683
# --> Now included in "env1$env.internal.source.r"


# > tools::file_ext
# function (x) 
# {
#     pos <- regexpr("\\.([[:alnum:]]+)$", x)
#     ifelse(pos > -1L, substring(x, pos + 1L), "")
# }
# <bytecode: 0x000001995fb9da20>
# <environment: namespace:tools>
# > tools::file_path_sans_ext
# function (x, compression = FALSE) 
# {
#     if (compression) 
#         x <- sub("[.](gz|bz2|xz)$", "", x)
#     sub("([^.]+)\\.[[:alnum:]]+$", "\\1", x)
# }
# <bytecode: 0x00000199623e2ee8>
# <environment: namespace:tools>

f_FileNameExt.append_suffix <- function(path_FileNameExt, append_suffix, compression = TRUE, VERBOSE = getOption("verbose")) {
    # Extract the path, FileName, and extension
    if(VERBOSE) "path_FileNameExt" %>% ECHO.dput_get_ObjectName()
    
    path = path_FileNameExt |> dirname()
    if(VERBOSE) "path" %>% ECHO.dput_get_ObjectName()
    FileNameExt = path_FileNameExt |> basename()
    if(VERBOSE) "FileNameExt" %>% ECHO.dput_get_ObjectName()
    if(compression) {
        FileName = FileNameExt |> str_remove("\\.([[:alnum:]]+)(\\.(gz|bz2|xz))?$")
        ext = FileNameExt |> str_extract("\\.([[:alnum:]]+)(\\.(gz|bz2|xz))?$") |> str_remove("^\\.")
    } else {
        FileName = FileNameExt |> str_remove("\\.([[:alnum:]]+)$")
        ext = FileNameExt |> str_extract("\\.([[:alnum:]]+)$") |> str_remove("^\\.")
    }
    if(VERBOSE) "FileName" %>% ECHO.dput_get_ObjectName()
    if(VERBOSE) "ext" %>% ECHO.dput_get_ObjectName()
    
    # Construct the new FileName with appended text
    FileNameExt2 = paste0(FileName, append_suffix, ".", ext)
    if(VERBOSE) "FileNameExt2" %>% ECHO.dput_get_ObjectName()
    
    # Construct the new path with the updated FileName
    path_FileNameExt2 = here::here(path, FileNameExt2)
    
    return(path_FileNameExt2)
}


options(verbose = FALSE);  # getOption("verbose");
# options(verbose = TRUE);  # getOption("verbose");
"path/to/file.txt" |> f_FileNameExt.append_suffix("2") 
"path/to/file.txt.xz" |> f_FileNameExt.append_suffix("2") 
# > "path/to/file.txt" |> f_FileNameExt.append_suffix("2") 
# [1] "path/to/file2.txt"
# > "path/to/file.txt.xz" |> f_FileNameExt.append_suffix("2") 
# [1] "path/to/file2.txt.xz"



