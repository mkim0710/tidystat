# f_filename.ext.extract.dev.r

# > tools::file_ext
# function (x) 
# {
#     pos <- regexpr("\\.([[:alnum:]]+)$", x)
#     ifelse(pos > -1L, substring(x, pos + 1L), "")
# }
# <bytecode: 0x00000255055edf68>
# <environment: namespace:tools>

# > tools::file_path_sans_ext
# function (x, compression = FALSE) 
# {
#     if (compression) 
#         x <- sub("[.](gz|bz2|xz)$", "", x)
#     sub("([^.]+)\\.[[:alnum:]]+$", "\\1", x)
# }
# <bytecode: 0x559e08932778>
# <environment: namespace:tools>


path_filename = path_filename.ext |> basename() |> str_remove("\\.([[:alnum:]]+)$")
# ext = path_filename.ext |> basename() |> str_extract("\\.([[:alnum:]]+)$") |> str_replace("^\\.", "")
ext = path_filename.ext |> basename() |> str_extract("\\.([[:alnum:]]+)$") |> str_remove("^\\.")

#@@ https://github.com/search?q=repo%3Amkim0710%2Ftidystat+%3Aalnum%3A&type=code

##@ https://github.com/mkim0710/tidystat/blob/e73c5da0bad1901a9c2421da1351238fec8c0d00/env1%24env.internal.source.r#L828
## :: f_filename.ext.append_suffix =  ----  
# Rdev/00_base_program/002_base_encoding_RegEx/f_filename.ext.append_suffix.dev.r
    if(compression) {
        filename = filename.ext |> str_remove("\\.([[:alnum:]]+)(\\.(gz|bz2|xz))?$")
        ext = filename.ext |> str_extract("\\.([[:alnum:]]+)(\\.(gz|bz2|xz))?$") |> str_remove("^\\.")
    } else {
        filename = filename.ext |> str_remove("\\.([[:alnum:]]+)$")
        ext = filename.ext |> str_extract("\\.([[:alnum:]]+)$") |> str_remove("^\\.")
    }


