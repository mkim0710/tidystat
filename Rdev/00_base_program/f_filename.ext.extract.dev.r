# f_filename.ext.extract.dev.r

path.filename = basename(path.filename.ext) |> str_remove("\\.([[:alnum:]]+)$")
ext = basename(path.filename.ext) |> str_extract("\\.([[:alnum:]]+)$") |> str_remove("^\\.")


