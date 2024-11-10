
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

f_filename.ext.append_suffix <- function(path_filename.ext, append_suffix, compression = TRUE, VERBOSE = getOption("verbose")) {
    # Extract the path, filename, and extension
    if(VERBOSE) "path_filename.ext" %>% echo.dput_get_ObjectName()
    
    path = path_filename.ext |> dirname()
    if(VERBOSE) "path" %>% echo.dput_get_ObjectName()
    filename.ext = path_filename.ext |> basename()
    if(VERBOSE) "filename.ext" %>% echo.dput_get_ObjectName()
    if(compression) {
        filename = filename.ext |> str_remove("\\.([[:alnum:]]+)(\\.(gz|bz2|xz))?$")
        ext = filename.ext |> str_extract("\\.([[:alnum:]]+)(\\.(gz|bz2|xz))?$") |> str_remove("^\\.")
    } else {
        filename = filename.ext |> str_remove("\\.([[:alnum:]]+)$")
        ext = filename.ext |> str_extract("\\.([[:alnum:]]+)$") |> str_remove("^\\.")
    }
    if(VERBOSE) "filename" %>% echo.dput_get_ObjectName()
    if(VERBOSE) "ext" %>% echo.dput_get_ObjectName()
    
    # Construct the new filename with appended text
    filename.ext2 = paste0(filename, append_suffix, ".", ext)
    if(VERBOSE) "filename.ext2" %>% echo.dput_get_ObjectName()
    
    # Construct the new path with the updated filename
    path_filename.ext2 = file.path(path, filename.ext2)
    
    return(path_filename.ext2)
}


options(verbose = FALSE);  # getOption("verbose");
# options(verbose = TRUE);  # getOption("verbose");
"path/to/file.txt" |> f_filename.ext.append_suffix("2") 
"path/to/file.txt.xz" |> f_filename.ext.append_suffix("2") 
# > "path/to/file.txt" |> f_filename.ext.append_suffix("2") 
# [1] "path/to/file2.txt"
# > "path/to/file.txt.xz" |> f_filename.ext.append_suffix("2") 
# [1] "path/to/file2.txt.xz"



