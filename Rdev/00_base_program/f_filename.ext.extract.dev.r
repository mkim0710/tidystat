# f_filename.ext.extract.dev.r

path_filename = path_filename.ext |> basename() |> str_remove("\\.([[:alnum:]]+)$")
ext = path_filename.ext |> basename() |> str_extract("\\.([[:alnum:]]+)$") |> str_remove("^\\.")


