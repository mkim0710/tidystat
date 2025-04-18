#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ f_file.save ----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: constant_outputDirPath ====
env1$env.internal.attach$constant_outputDirPath = "./output/"
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: dir.create.outputDirPath =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "dir.create.outputDirPath"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(outputDirPath = env1$env.internal.attach$constant_outputDirPath) {  
    # Ensure output directory exists
    if (!dir.exists(outputDirPath)) {
        dir.create(outputDirPath, recursive = TRUE)
    }
}

#________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: template.yymmddThhmm =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "template.yymmddThhmm"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function() {  format(Sys.time(), "%y%m%dT%H%M")  }
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) template.TimeStamp  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "template.TimeStamp")
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) TimeStamp  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "TimeStamp")

#________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: outputFilenamePrefix =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "outputFilenamePrefix"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function() {  tools::file_path_sans_ext(  basename(rstudioapi::getSourceEditorContext()$path)  )  }


#________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: outputFilenamePath =  ----  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "outputFilenamePath"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function() {  file.path(  outputDirPath,  paste0(env1$env.internal.attach$outputFilenamePrefix(), "-", env1$env.internal.attach$template.yymmddThhmm(), ".rds")  )  }

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_objectname.size.write_rds.git_lfs_track_add_f ====  
# Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.dev.r
# Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.source-exported.r
# https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a 
# https://gemini.google.com/app/6d9de55c5c7085c6 
env1$f$f_objectname.size.write_rds.git_lfs_track_add_f = function(
        .objectname, 
        CompressionMethod = case_when(object.size(get(.objectname)) >= 1e8 ~ "none", object.size(get(.objectname)) >= 1e6 ~ "xz", TRUE ~ "gz"), 
        .FileNameExt4write = paste0(.objectname,".rds",ifelse(CompressionMethod == "xz", ".xz", "")), 
        .path4write = env1$path$path4write,
        .path_file = if(is.null(.path4write) || is.null(.FileNameExt4write)) {NULL} else {  paste0(.path4write,ifelse(.path4write=="","","/"),.FileNameExt4write)  }, 
        createBACKUP = FALSE, 
        .BACKUP_to_path="-BACKUP", 
        EXECUTE = FALSE, 
        path.size_files = TRUE, 
        git_lfs_track = "determine based on object size", 
        git_add_f = TRUE, 
        SkipIfAlreadyAdded = TRUE, 
        LinePrefix4CodeText = "\t", 
        VERBOSE = isTRUE(getOption("verbose")),
        DEBUGMODE = isTRUE(getOption("DEBUGMODE"))) {
    
    # options(DEBUGMODE = TRUE)
    # options(DEBUGMODE = FALSE)
    if(DEBUGMODE) browser()
    # Browse[1]> environment() %>% as.list(all.names = TRUE) %>% str()
    # List of 15
    #  $ .objectname        : chr "df_NewDMv3.CensorEND.n8845.select971"
    #  $ .FileNameExt4write: chr "df_NewDMv3.CensorEND.n8845.select971.rds.xz"
    #  $ .path4write        : chr "."
    #  $ .path_file         : NULL
    #  $ createBACKUP       : logi FALSE
    #  $ .BACKUP_to_path    : chr "-BACKUP"
    #  $ EXECUTE            : logi FALSE
    #  $ path.size_files    : logi TRUE
    #  $ git_lfs_track      : logi TRUE
    #  $ git_add_f          : logi TRUE
    #  $ SkipIfAlreadyAdded : logi TRUE
    #  $ CompressionMethod  : chr "xz"
    #  $ LinePrefix4CodeText: chr "\t"
    #  $ VERBOSE            : logi FALSE
    
    
    ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
    ##@ If only .objectname is provided, get .object from get(.objectname)
    .object <- get(.objectname)

    ##________________________________________________________________________________  
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    ##@ -> By here, both .object and .objectname are available.
    .object.size <- object.size(.object)
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    if(exists("MetaData") && !is.null(unlist(MetaData))) {
        if("DSnames" %in% names(MetaData)) {
            if(.objectname %in% names(MetaData$DSnames)) {
                # assign(.objectname, structure(get(.objectname, envir = .GlobalEnv), MetaData = as.environment(MetaData)), envir = .GlobalEnv)
                assign(.objectname, structure(get(.objectname), MetaData = as.environment(MetaData)))
                assign(".object", structure(.object, MetaData = as.environment(MetaData)))
            }
        } 
    }
    ##________________________________________________________________________________  
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    if (.object.size >= 1e8) {
        paste0(".object.size == ",.object.size|>format(units="GiB",standard="IEC"),"(IEC) >= 1e8 bytes (100 MB(SI)) --> The object is too large to compress in R. Consider compressing the file in a dedicated compression software after saving an uncompressed rds file.") |> warning(call. = FALSE, immediate. = TRUE)
    }
    ##________________________________________________________________________________  
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    ##@ If .path_file is provided, it determines the .FileNameExt4write (& CompressionMethod). 
    ## Caution) when .objectname is provided, .FileNameExt4write & .path_file could have been auto-generated. 
    
    if(!is.null(.path_file)) {
        .FileNameExt4write = basename(.path_file)
    }
    ##________________________________________________________________________________  
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    ##@ If .FileNameExt4write is provided, it may determine the CompressionMethod. 
    ## Caution) When .FileNameExt4write & .path4write is provided, .path_file can be auto-generated, so .path_file may not be NULL. 
    if(!is.null(.FileNameExt4write)) {
        if(grepl("\\.xz$", .FileNameExt4write)) {
            CompressionMethod = "xz"
        } else if(grepl("\\.gz$", .FileNameExt4write)) {
            CompressionMethod = "gz"
        # } else {
        #     CompressionMethod = "none" | "gz"  # gz compression may be done without ".gz" extension. 
        }
    }

    ##________________________________________________________________________________  
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    ##@ .path4write may still be NULL if env1$path$path4write was NULL.
    # if(is.null(.path4write))            .path4write = env1$path$path4write
    if(is.null(.path4write))            .path4write = ""
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
    ##@ .path_file may still be NULL if either .path4write or .FileNameExt4write was NULL.
    if(is.null(.path_file))             .path_file = if(is.null(.path4write) || is.null(.FileNameExt4write)) {NULL} else {  paste0(.path4write,ifelse(.path4write=="","","/"),.FileNameExt4write)  }
    ##________________________________________________________________________________  
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    if(createBACKUP) cat(LinePrefix4CodeText, 'env1$env.internal.attach$f_FileNameExt.createBACKUP(BACKUP_from_path_FileNameExt = ',deparse(.path_file),', .BACKUP_to_path=',deparse(.BACKUP_to_path),', timeFormat="%y%m%dT%H", overwrite=TRUE)', "  \n", sep="")
    cat("\t", .objectname, ' |> write_rds(',shQuote(.path_file),', compress = ',shQuote(CompressionMethod),', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\\n")', "  \n", sep="")
    if(path.size_files) cat(LinePrefix4CodeText, 'env1$f$f_path.size_files(.path4read = ',shQuote(.path4write),', regex4FileName = ',shQuote(.objectname),")  \n", sep="")
    
    if(EXECUTE) {
        if(createBACKUP) env1$env.internal.attach$f_FileNameExt.createBACKUP(BACKUP_from_path_FileNameExt = .path_file, .BACKUP_to_path=.BACKUP_to_path, timeFormat="%y%m%dT%H", overwrite=TRUE) 
        if (.object.size >= 1e8) {
            paste0(".object.size == ",.object.size|>format(units="GiB",standard="IEC"),"(IEC) >= 1e8 bytes (100 MB(SI)) --> No Auto-execution.") |> warning(call. = FALSE, immediate. = TRUE)
        } else { 
            .object |> write_rds( .path_file, compress = CompressionMethod, compression = 9L ) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
            if(path.size_files) env1$f$f_path.size_files(.path4read = .path4write, regex4FileName = .objectname)
        }
    }
    
    if(git_add_f) {
        if (git_lfs_track == "determine based on object size") {
            if(.object.size > 1e7) {
                env1$f$f_file.git_lfs_track_add_f(.path_file = .path_file, SkipIfAlreadyAdded = SkipIfAlreadyAdded, EXECUTE = FALSE); if(EXECUTE) warning("Caution: halting auto-execution of glt lfs track.  \n") 
            } else {
                env1$f$f_TerminalFromRCodeText.ECHO(.TerminalCodeText = paste0( "git add -f ",shQuote(.path_file) ), EXECUTE = EXECUTE)
            }
        } else if (git_lfs_track == TRUE) {
                env1$f$f_file.git_lfs_track_add_f(.path_file = .path_file, SkipIfAlreadyAdded = SkipIfAlreadyAdded, EXECUTE = FALSE); if(EXECUTE) warning("Caution: halting auto-execution of glt lfs track.  \n") 
        } else {
            env1$f$f_TerminalFromRCodeText.ECHO(.TerminalCodeText = paste0( "git add -f ",shQuote(.path_file) ), EXECUTE = EXECUTE)
        }
    }
    
    invisible()
}
## *** Example Usage:  
# env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(fhs.index100le10)
# env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = "fhs.index100le10")
# env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(fhs.index100le10, .path_file = "./data/fhs.index100le10.rds.xz")

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_object.get_objectname.size.write_rds.git_lfs_track_add_f  - PENDING ====  
# Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.dev.r
# Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.source-exported.r
# https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a 
# https://gemini.google.com/app/6d9de55c5c7085c6 

# env1$f$f_object.get_objectname.size.write_rds.git_lfs_track_add_f = function(.object, ...) {
#     ##________________________________________________________________________________  
#     ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#     ##@ Check if the .object and .objectname are confused.
#     if (!is.null(.object)) {
#         if(is.character(.object) && length(.object) == 1) {
#             # .objectname <- .object
#             # .object <- get(.object)
#             "is.character(.object) && length(.object) == 1 --> Did you provide an object name instead of the object itself?" |> stop(call. = FALSE) |> tryCatch(error = function(e) message("stop: ", e)); return(invisible())
#         } 
#     }
#     
#     env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = env1$env.internal.attach$f_object.get_objectname(.object), ...)
# }




##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: write_rds.ECHO.CodeText ====  
.tmp$env1_subenv_name = "env.internal.attach"
.tmp$objectname = "write_rds.ECHO.CodeText"
env1[[.tmp$env1_subenv_name]][[.tmp$objectname]] = function(.objectname){
    'write_rds(get(.objectname), paste0(.objectname,".rds"))' %>% ECHO.CodeText(substitute_ObjectNames = TRUE)
}
    
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#### (ALIAS) ECHO.CodeText.write_rds  ----  
env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS(subenv_name4object = .tmp$env1_subenv_name, objectname = .tmp$objectname, subenv_name4ALIAS = "env.internal.attach", ALIASname = "ECHO.CodeText.write_rds")
Template.env1.env.internal.attach("write_rds.ECHO.CodeText")


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
