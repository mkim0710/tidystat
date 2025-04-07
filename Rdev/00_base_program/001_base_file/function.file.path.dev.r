# https://stackoverflow.com/questions/4216753/check-existence-of-directory-and-create-if-doesnt-exist


mainDir <- getwd()
subDir <- "function.MK.output.nest_sigungu.Seoul11 -output"
here::here(mainDir, subDir)
dir.create(here::here(mainDir, subDir))
here::here(mainDir, subDir, "FileName")
for (i in names(function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows)) {
    for (j in names(function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows[[i]])) {
        for (k in names(function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows[[i]][[j]])) {
            openxlsx2::write_xlsx(
                list(
                    CodeDF.bind_rows = function.MK.output.nest_sigungu.Seoul11.list3_CodeDF.bind_rows[[i]][[j]][[k]]
                    , Cluster.tbl.bind_rows = function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows[[i]][[j]][[k]]
                    , Cluster.tbl.bind_rows.Korean = function.MK.output.nest_sigungu.Seoul11.list3_Cluster.tbl.bind_rows.Korean[[i]][[j]][[k]]
                    , kormaps2014_kormap321.codebook = kormaps2014_kormap321.codebook
                )
                , here::here(mainDir, subDir, paste0("function.MK.output.nest_sigungu.Seoul11", "$", i, "$", j, "$", k, "[CodeDF, Cluster.tbl]", ".xlsx"))
                , as_table=TRUE
            )
        }
    }
}

