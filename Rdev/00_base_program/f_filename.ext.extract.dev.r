# f_filename.ext.extract.dev.r

path.filename = path.filename.ext |> basename() |> str_remove("\\.([[:alnum:]]+)$")
ext = path.filename.ext |> basename() |> str_extract("\\.([[:alnum:]]+)$") |> str_remove("^\\.")


