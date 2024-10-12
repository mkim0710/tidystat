

?exists
.objectname
get(.objectname) %>% str(max.level = 2)
f_objectname.size.write_rds.git_lfs_track_add_f = function(.objectname, .path4write = env1$path$.path4write, execute_code = FALSE, git_add_f = TRUE, CompressionMethod = NULL) {
    if(exists("MetaData")) {
        if("DataSetNames" %in% names(MetaData)) {
            if(.objectname %in% names(MetaData$DataSetNames)) {
                assign(.objectname, structure(get(.objectname), MetaData = MetaData))
            }
        } 
    }
    if(is.null(CompressionMethod)) CompressionMethod = ifelse(object.size(.objectname) > 1e6, "xz", "gz")
    .path.file = paste0(.path4write,"/",.objectname,".rds",ifelse(CompressionMethod == "xz", ".xz", ""))
    cat(.objectname, ' |> write_rds(',shQuote(.path.file),', compress = ',shQuote(CompressionMethod),', compression = 9) |> system.time()', "  \n", sep="")
    cat('env1$f$f_path.size_files(.path4read = ',shQuote(.path4write),', regex4filename = ',shQuote(.objectname),")  \n", sep="")
    if(execute_code) {
        system.time(write_rds( get(.objectname), .path.file, compress = CompressionMethod, compression = 9 ))
        env1$f$f_path.size_files(.path4read = .path4write, regex4filename = .objectname)
    }
    if(git_add_f) {
        if(object.size(.objectname) > 1e7) {
            env1$f$f_file.git_lfs_track_add_f(.path.file = .path.file, execute_code = execute_code) 
        } else {
            env1$f$f_TerminalCodeText2RCodeText.cat(.TerminalCodeText = paste0( "git add -f ",shQuote(.path.file) ), execute_code = execute_code)
        }
    }
    invisible()
}

	
.objectname %>% f_objectname.size.write_rds.git_lfs_track_add_f
