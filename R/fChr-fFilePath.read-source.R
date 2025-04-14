
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_file.read ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_objectname.read_rds_or_xz ====  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_objectname.read_rds_or_xz"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
        .objectname, 
        .path4read = env1$path$path4read,
        vec.folder = paste0(.path4read,c("", paste0("/",.objectname))),
        vec.extension = paste0(".rds",c("", ".xz")),
        VERBOSE = isTRUE(getOption("verbose")),
        DEBUGMODE = isTRUE(getOption("DEBUGMODE"))) {
    .objectpath = outer(
        vec.folder, 
        vec.extension, 
        function(.objectfolder, .objectextension) {paste0(.objectfolder,"/",.objectname,.objectextension)}
    ) |> keep(file.exists) |> first()
    if (VERBOSE) {
        cat("  .objectpath == ",deparse(.objectpath),"  \n", sep="")
    }
    assign(.objectname, read_rds(.objectpath), envir = .GlobalEnv)
    cat(" length(",.objectname,") == ",deparse(length(get(.objectname))),"  \n", sep="")
    cat(" dim(",.objectname,") == ",deparse(dim(get(.objectname))),"  \n", sep="")
    invisible(get(.objectname, envir = .GlobalEnv))
}
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_FileNameExt.read_rds_or_xz ====  
.tmp$env1_subenv_name = "f"
.tmp$objectname = "f_FileNameExt.read_rds_or_xz"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
        .FileNameExt = NA, 
        .objectname = .FileNameExt |> str_remove("\\.xz$") |> str_remove("\\.rds$"),
        .path4read = env1$path$path4read,
        vec.folder = paste0(.path4read,c("", paste0("/",.objectname))),
        vec.extension = paste0(".rds",c("", ".xz")),
        VERBOSE = isTRUE(getOption("verbose")),
        DEBUGMODE = isTRUE(getOption("DEBUGMODE"))) {
    env1$f$f_objectname.read_rds_or_xz(
        .objectname = .objectname, 
        .path4read = .path4read,
        vec.folder = vec.folder,
        vec.extension = vec.extension,
        VERBOSE = VERBOSE,
        DEBUGMODE = DEBUGMODE
    )
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) read_rds_or_xz  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "read_rds_or_xz")
