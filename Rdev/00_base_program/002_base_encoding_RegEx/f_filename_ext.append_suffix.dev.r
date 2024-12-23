
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

f_filename_ext.append_suffix <- function(path_filename_ext, append_suffix, compression = TRUE, VERBOSE = getOption("verbose")) {
    # Extract the path, filename, and extension
    if(VERBOSE) "path_filename_ext" %>% ECHO.dput_get_ObjectName()
    
    path = path_filename_ext |> dirname()
    if(VERBOSE) "path" %>% ECHO.dput_get_ObjectName()
    filename_ext = path_filename_ext |> basename()
    if(VERBOSE) "filename_ext" %>% ECHO.dput_get_ObjectName()
    if(compression) {
        filename = filename_ext |> str_remove("\\.([[:alnum:]]+)(\\.(gz|bz2|xz))?$")
        ext = filename_ext |> str_extract("\\.([[:alnum:]]+)(\\.(gz|bz2|xz))?$") |> str_remove("^\\.")
    } else {
        filename = filename_ext |> str_remove("\\.([[:alnum:]]+)$")
        ext = filename_ext |> str_extract("\\.([[:alnum:]]+)$") |> str_remove("^\\.")
    }
    if(VERBOSE) "filename" %>% ECHO.dput_get_ObjectName()
    if(VERBOSE) "ext" %>% ECHO.dput_get_ObjectName()
    
    # Construct the new filename with appended text
    filename_ext2 = paste0(filename, append_suffix, ".", ext)
    if(VERBOSE) "filename_ext2" %>% ECHO.dput_get_ObjectName()
    
    # Construct the new path with the updated filename
    path_filename_ext2 = file.path(path, filename_ext2)
    
    return(path_filename_ext2)
}


options(verbose = FALSE);  # getOption("verbose");
# options(verbose = TRUE);  # getOption("verbose");
"path/to/file.txt" |> f_filename_ext.append_suffix("2") 
"path/to/file.txt.xz" |> f_filename_ext.append_suffix("2") 
# > "path/to/file.txt" |> f_filename_ext.append_suffix("2") 
# [1] "path/to/file2.txt"
# > "path/to/file.txt.xz" |> f_filename_ext.append_suffix("2") 
# [1] "path/to/file2.txt.xz"



