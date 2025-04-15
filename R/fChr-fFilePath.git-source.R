
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_git ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_path.is_git_tracked  =======  
# Function to check if the current project or any of its parent directories are tracked by Git
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_path.is_git_tracked"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(path = getwd(), check_parents = TRUE) {
    # Normalize the path
    path <- normalizePath(path, winslash = "/", mustWork = TRUE)
    
    # Traverse up the directory tree if check_parents is TRUE
    while (TRUE) {
        # Check if the .git directory exists in the current path
        git_dir <- file.path(path, ".git")
        if (dir.exists(git_dir)) {
            return(git_dir)
        }
        
        # If not checking parent directories, return NA
        if (!check_parents) {
            return(NA)
        }
        
        # Move to the parent directory
        parent_path <- dirname(path)
        
        # If the parent directory is the same as the current directory, we've reached the root
        if (parent_path == path) {
            return(NA)
        }
        
        # Update the current path to the parent path
        path <- parent_path
    }
}

# # Usage example: Check if the current working directory or its parent directories are tracked by Git
# git_path <- is_git_tracked(check_parents = TRUE)
# if (!is.na(git_path)) {
#   message("The current project is tracked by Git at: ", git_path)
# } else {
#   message("The current project is not tracked by Git.")
# }

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
### :: env1\$path\$git_path =  =======  
env1$path$git_path = env1$env.internal.attach$f_path.is_git_tracked()
# env1$path$no_git = is.na(env1$path$git_path)



##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_file.git_lfs_track_add_f ====  

# Rdev/00_base_terminal/f_file.git_lfs_track_add_f.dev.r
# https://chatgpt.com/c/6719a3d0-9a2c-800e-8651-2ae6901ae573
# https://gemini.google.com/app/c1606939ea272140
env1$f$f_file.git_lfs_track_add_f = function(.path_file, EXECUTE = FALSE, SkipIfAlreadyAdded = TRUE) {
     stopifnot(
        !missing(.path_file), is.character(.path_file), length(.path_file) == 1,
        is.logical(EXECUTE), length(EXECUTE) == 1,
        is.logical(SkipIfAlreadyAdded), length(SkipIfAlreadyAdded) == 1
    )
    git_lfs_available = try(system2("git", args = "lfs version", stdout = FALSE, stderr = FALSE) == 0, silent = TRUE)    # https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a  # https://gemini.google.com/app/6d9de55c5c7085c6
    
    # if(git_lfs_available) {
    #     invisible(
    #         list(
    #             paste0( "git lfs track ",shQuote(.path_file) )
    #             , paste0( "git add -f ",shQuote(.path_file) )
    #         ) |> map(env1$f$f_TerminalFromRCodeText.ECHO, EXECUTE)
    #     )
    # } else {
    #     warning("git lfs is not available  \n")
    #     invisible(
    #         paste0( "git add -f ",shQuote(.path_file) ) |> env1$f$f_TerminalFromRCodeText.ECHO(EXECUTE = EXECUTE)
    #     )
    # }
    
    if(!git_lfs_available) warning("git lfs is not available  \n")
    
    # Check if the file is already tracked by git without lfs
    git_ls_files_output = system2("git", args = c("ls-files", shQuote(.path_file)), stdout = TRUE, stderr = TRUE)

    is.AlreadyAdded = length(git_ls_files_output) > 0

    if (SkipIfAlreadyAdded && is.AlreadyAdded) {
        message(paste(.path_file, "is already added to git. Skipping git lfs track."))
        return(invisible())
    } else {
        return(invisible(
            list(
                paste0( "git lfs track ",shQuote(.path_file) )
                , paste0( "git add -f ",shQuote(.path_file) )
            ) |> map(env1$f$f_TerminalFromRCodeText.ECHO, EXECUTE)
        ))
    }
}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: function_name = f_gitattributes.split() ====
## git/f_gitattributes.split_lfs.dev.Rmd
## git/f_gitattributes.update_non_lfs.dev.Rmd
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "f_gitattributes.split" 
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(
        input_path = paste0(env1$path$path1,"/.gitattributes"), 
        output_path.lfs = paste0(env1$path$path1,"/.lfs.gitattributes"), 
        split_non_lfs = TRUE,
        output_path.non_lfs = paste0(env1$path$path1,"/.non_lfs.gitattributes"), 
        OPEN_OUTPUT = FALSE) {
    # Read the .gitattributes file
    input_path.lines <- readLines(input_path)

    # Separate input_path.lines into LFS and non-LFS groups
    
    if(TRUE) {
        input_path.lines.lfs <- input_path.lines %>% str_subset("\\blfs\\b")
        # Write LFS input_path.lines to a new file
        writeLines(input_path.lines.lfs, output_path.lfs)
        cat("LFS lines extracted to \t:", deparse(output_path.lfs), "  \n", sep="")
        if(OPEN_OUTPUT) env1$env.internal.attach$f_file.edit_windows_notepad.or_browseURL(output_path.lfs)
    }

    if(split_non_lfs) {
        input_path.lines.non_lfs <- input_path.lines %>% str_subset("\\blfs\\b", negate = TRUE)
        # Write non-LFS input_path.lines to another new file
        writeLines(input_path.lines.non_lfs, output_path.non_lfs)
        cat("Non-LFS lines extracted to \t:", deparse(output_path.non_lfs), "  \n", sep="")
        if(OPEN_OUTPUT) env1$env.internal.attach$f_file.edit_windows_notepad.or_browseURL(output_path.non_lfs)
    }
    
    invisible()
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
