
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_file.BACKUP, f_path.BACKUP ====  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_FileNameExt.createBACKUP ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_FileNameExt.createBACKUP"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(BACKUP_from_path_FileNameExt, BACKUP_from_ext = NA, .BACKUP_to_path = file.path(env1$path$path0, "-BACKUP"), timeFormat = "%y%m%dT%H%M", overwrite=TRUE) {
    # Wrap the main BACKUP logic in a tryCatch for error handling
    tryCatch({
        # Determine the FileName and extension if not provided
        if(is.na(BACKUP_from_ext)) {
            BACKUP_from_path_FileName = basename(BACKUP_from_path_FileNameExt) |> str_remove("\\.([[:alnum:]]+)$")
            BACKUP_from_ext = basename(BACKUP_from_path_FileNameExt) |> str_extract("\\.([[:alnum:]]+)$") |> str_remove("^\\.")
        } else {
            BACKUP_from_path_FileName = basename(BACKUP_from_path_FileNameExt) |> str_remove(paste0("\\.",BACKUP_from_ext|>str_replace_all("\\.","\\\\."),"$"))
        }
        
        # Construct the destination BACKUP path with timestamp
        .BACKUP_to_path_FileNameExt = file.path( .BACKUP_to_path, paste0(BACKUP_from_path_FileName,"-",format(Sys.time(),timeFormat),".",BACKUP_from_ext) )
        
        # Create the BACKUP directory if it doesn't exist
        if(!dir.exists(.BACKUP_to_path)) dir.create(.BACKUP_to_path, recursive = TRUE)
        

        if(!file.exists(BACKUP_from_path_FileNameExt)) stop(paste0("File to BACKUP does not exist: ", BACKUP_from_path_FileNameExt))
        if(file.exists(.BACKUP_to_path_FileNameExt) && !overwrite) stop(paste0("BACKUP file already exists: ", .BACKUP_to_path_FileNameExt))
        
        # Copy the file to the BACKUP location; if successful, print a message. Otherwise, stop with an error. 
        if (file.copy(from=BACKUP_from_path_FileNameExt, to=.BACKUP_to_path_FileNameExt, overwrite=overwrite)) {message(paste0("- BACKUP file created: ", .BACKUP_to_path_FileNameExt))} else {stop("File copy failed for unknown reasons.")}
    }, error = function(e) {
        # Error handling block to catch any issues during the BACKUP process
        message(paste("Failed to create BACKUP for:", BACKUP_from_path_FileNameExt))
        message("Error:", e$message)
    })
}
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) file.BACKUP  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file.BACKUP")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) file.copy_createBACKUP  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "file.copy_createBACKUP")
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: f_path_path.BACKUP.overwrite ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_path_path.BACKUP.overwrite"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(.overwrite_from_path_FileNameExt, .destination_path_FileNameExt, .BACKUP_to_path = dirname(.destination_path_FileNameExt), timeFormat = "%y%m%d", createFile = FALSE) {
    if(createFile || file.exists(.destination_path_FileNameExt)) {
        if(!is.null(.BACKUP_to_path)) {
            env1$env.internal.attach$f_FileNameExt.createBACKUP(BACKUP_from_path_FileNameExt = .destination_path_FileNameExt, .BACKUP_to_path=.BACKUP_to_path, timeFormat=timeFormat)
        }
        if(file.copy(from=.overwrite_from_path_FileNameExt, to=.destination_path_FileNameExt, overwrite=TRUE)) message(paste0("Update successful: ", .destination_path_FileNameExt)) else warning(paste0("Update failed: ", .destination_path_FileNameExt))
    } else {warning(paste0("File does not exist: ", .destination_path_FileNameExt))}
}




##////////////////////////////////////////////////////////////////////////////////  
##::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##********************************************************************************  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  
# ⸿ END -----  
# cat("* To revert to the last commited file, run the following terminal command:\n", 
#     '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

