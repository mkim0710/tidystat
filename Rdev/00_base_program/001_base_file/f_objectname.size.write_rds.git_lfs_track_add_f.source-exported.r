# @@ Now included in env1$env.internal.source.r ----

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
        .filename.ext4write = paste0(.objectname,".rds",ifelse(CompressionMethod == "xz", ".xz", "")), 
        .path4write = env1$path$.path4write,
        .path_file = if(is.null(.path4write) || is.null(.filename.ext4write)) {NULL} else {  paste0(.path4write,ifelse(.path4write=="","","/"),.filename.ext4write)  }, 
        createBackup = FALSE, 
        .backup_to_path="-backup", 
        Execute = FALSE, 
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
    #  $ .filename.ext4write: chr "df_NewDMv3.CensorEND.n8845.select971.rds.xz"
    #  $ .path4write        : chr "."
    #  $ .path_file         : NULL
    #  $ createBackup       : logi FALSE
    #  $ .backup_to_path    : chr "-backup"
    #  $ Execute            : logi FALSE
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
    if(exists("MetaData")) {
        if("DataSetNames" %in% names(MetaData)) {
            if(.objectname %in% names(MetaData$DataSetNames)) {
                # assign(.objectname, structure(get(.objectname, envir = .GlobalEnv), MetaData = as.environment(MetaData)), envir = .GlobalEnv)
                assign(.objectname, structure(get(.objectname), MetaData = as.environment(MetaData)))
                assign(".object", structure(.object, MetaData = as.environment(MetaData)))
            }
        } 
    }
    ##________________________________________________________________________________  
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    if (.object.size >= 1e8) {
        paste0(".object.size == ",.object.size|>format(units="GiB",standard="IEC")," GiB(IEC) >= 1e8 bytes (100 MB(SI)) --> The object is too large to compress in R. Consider compressing the file in a dedicated compression software after saving an uncompressed rds file.") |> warning(call. = FALSE, immediate. = TRUE)
    }
    ##________________________________________________________________________________  
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    ##@ If .path_file is provided, it determines the .filename.ext4write (& CompressionMethod). 
    ## Caution) when .objectname is provided, .filename.ext4write & .path_file could have been auto-generated. 
    
    if(!is.null(.path_file)) {
        .filename.ext4write = basename(.path_file)
    }
    ##________________________________________________________________________________  
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    ##@ If .filename.ext4write is provided, it may determine the CompressionMethod. 
    ## Caution) When .filename.ext4write & .path4write is provided, .path_file can be auto-generated, so .path_file may not be NULL. 
    if(!is.null(.filename.ext4write)) {
        if(grepl("\\.xz$", .filename.ext4write)) {
            CompressionMethod = "xz"
        } else if(grepl("\\.gz$", .filename.ext4write)) {
            CompressionMethod = "gz"
        # } else {
        #     CompressionMethod = "none" | "gz"  # gz compression may be done without ".gz" extension. 
        }
    }

    ##________________________________________________________________________________  
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    ##@ .path4write may still be NULL if env1$path$.path4write was NULL.
    # if(is.null(.path4write))            .path4write = env1$path$.path4write
    if(is.null(.path4write))            .path4write = ""
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
    ##@ .path_file may still be NULL if either .path4write or .filename.ext4write was NULL.
    if(is.null(.path_file))             .path_file = if(is.null(.path4write) || is.null(.filename.ext4write)) {NULL} else {  paste0(.path4write,ifelse(.path4write=="","","/"),.filename.ext4write)  }
    ##________________________________________________________________________________  
    ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    if(createBackup) cat(LinePrefix4CodeText, 'env1$env.internal.attach$f_filename.ext.createBackup(backup_from_path_filename.ext = ',deparse(.path_file),', .backup_to_path=',deparse(.backup_to_path),', timeFormat="%y%m%d_%H", overwrite=TRUE)', "  \n", sep="")
    cat("\t", .objectname, ' |> write_rds(',shQuote(.path_file),', compress = ',shQuote(CompressionMethod),', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\\n")', "  \n", sep="")
    if(path.size_files) cat(LinePrefix4CodeText, 'env1$f$f_path.size_files(.path4read = ',shQuote(.path4write),', regex4filename = ',shQuote(.objectname),")  \n", sep="")
    
    if(Execute) {
        if(createBackup) env1$env.internal.attach$f_filename.ext.createBackup(backup_from_path_filename.ext = .path_file, .backup_to_path=.backup_to_path, timeFormat="%y%m%d_%H", overwrite=TRUE) 
        if (.object.size >= 1e8) {
            paste0(".object.size == ",.object.size|>format(units="GiB",standard="IEC")," GiB(IEC) >= 1e8 bytes (100 MB(SI)) --> No Auto-execution.") |> warning(call. = FALSE, immediate. = TRUE)
        } else { 
            .object |> write_rds( .path_file, compress = CompressionMethod, compression = 9L ) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
            if(path.size_files) env1$f$f_path.size_files(.path4read = .path4write, regex4filename = .objectname)
        }
    }
    
    if(git_add_f) {
        if (git_lfs_track == "determine based on object size") {
            if(.object.size > 1e7) {
                env1$f$f_file.git_lfs_track_add_f(.path_file = .path_file, SkipIfAlreadyAdded = SkipIfAlreadyAdded, Execute = FALSE); if(Execute) warning("Caution: halting auto-execution of glt lfs track.  \n") 
            } else {
                env1$f$f_TerminalFromRCodeText.echo(.TerminalCodeText = paste0( "git add -f ",shQuote(.path_file) ), Execute = Execute)
            }
        } else if (git_lfs_track == TRUE) {
                env1$f$f_file.git_lfs_track_add_f(.path_file = .path_file, SkipIfAlreadyAdded = SkipIfAlreadyAdded, Execute = FALSE); if(Execute) warning("Caution: halting auto-execution of glt lfs track.  \n") 
        } else {
            env1$f$f_TerminalFromRCodeText.echo(.TerminalCodeText = paste0( "git add -f ",shQuote(.path_file) ), Execute = Execute)
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
# ## :: f_objectname.size.write_rds.git_lfs_track_add_f ====  
# # Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.dev.r
# # Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.source-exported.r
# # https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a 
# # https://gemini.google.com/app/6d9de55c5c7085c6 
# env1$f$f_objectname.size.write_rds.git_lfs_track_add_f = function(
#         .object = NULL, .objectname = NULL, 
#         CompressionMethod = {  if(is.null(.object)) {.object = get(.objectname)}; case_when(object.size(.object) >= 1e8 ~ "none", object.size(.object) >= 1e6 ~ "xz", TRUE ~ "gz")  }, 
#         .filename.ext4write = if(is.null(.objectname)) {NULL} else {  paste0(.objectname,".rds",ifelse(CompressionMethod == "xz", ".xz", ""))  }, 
#         .path4write = env1$path$.path4write,
#         .path_file = if(is.null(.path4write) || is.null(.filename.ext4write)) {NULL} else {  paste0(.path4write,ifelse(.path4write=="","","/"),.filename.ext4write)  }, 
#         createBackup = FALSE, 
#         .backup_to_path="-backup", 
#         Execute = FALSE, 
#         path.size_files = TRUE, 
#         git_lfs_track = "determine based on object size", 
#         git_add_f = TRUE, 
#         SkipIfAlreadyAdded = TRUE, 
#         LinePrefix4CodeText = "\t", 
#         VERBOSE = isTRUE(getOption("verbose")),
#         DEBUGMODE = isTRUE(getOption("DEBUGMODE"))) {
#     
#     # options(DEBUGMODE = TRUE)
#     # options(DEBUGMODE = FALSE)
#     if(DEBUGMODE) browser()
#     # Browse[1]> environment() %>% as.list(all.names = TRUE) %>% str()
#     # List of 15
#     #  $ .object            : NULL
#     #  $ .objectname        : chr "df_NewDMv3.CensorEND.n8845.select971"
#     #  $ .filename.ext4write: chr "df_NewDMv3.CensorEND.n8845.select971.rds.xz"
#     #  $ .path4write        : chr "."
#     #  $ .path_file         : NULL
#     #  $ createBackup       : logi FALSE
#     #  $ .backup_to_path    : chr "-backup"
#     #  $ Execute            : logi FALSE
#     #  $ path.size_files    : logi TRUE
#     #  $ git_lfs_track      : logi TRUE
#     #  $ git_add_f          : logi TRUE
#     #  $ SkipIfAlreadyAdded : logi TRUE
#     #  $ CompressionMethod  : chr "xz"
#     #  $ LinePrefix4CodeText: chr "\t"
#     #  $ VERBOSE            : logi FALSE
#     
#     # Browse[1]> environment() %>% as.list(all.names = TRUE) %>% str()
#     # debug at #3: NULL
#     # Browse[3]> environment() %>% as.list(all.names = TRUE) %>% str()
#     # Error in as.list.environment(., all.names = TRUE) : 
#     #   promise already under evaluation: recursive default argument reference or earlier problems?
#     # Browse[3]> ls(all.names = TRUE) |> dput()
#     # c(".backup_to_path", ".filename.ext4write", ".object", ".objectname", 
#     # ".path_file", ".path4write", "CompressionMethod", "createBackup", 
#     # "Execute", "git_add_f", "git_lfs_track", "LinePrefix4CodeText", 
#     # "path.size_files", "SkipIfAlreadyAdded", "VERBOSE")
#     # Browse[3]> .filename.ext4write %>% str()
#     # Error in str(.) : 
#     #   promise already under evaluation: recursive default argument reference or earlier problems?
#     # Browse[3]> .path_file %>% str()
#     # debug at #5: NULL
#     # Browse[4]> .path_file %>% str()
#     # Error in str(.) : 
#     #   promise already under evaluation: recursive default argument reference or earlier problems?
#     
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
#     ##________________________________________________________________________________  
#     ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#     if(is.null(.object) && is.null(.objectname)) {
#         "Both .object and .objectname are NULL. Please provide either .object or .objectname." |> stop(call. = FALSE); return(invisible())
#     }
#     
#     ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
#     ##@ When both .object and .objectname are provided, assign the .object to the .objectname to avoid the problematic cases when .object != get(.objectname).
#     if(!is.null(.object) && !is.null(.objectname)) {
#         assign(.objectname, .object)
#     }
#     
#     ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
#     ##@ If only .objectname is provided, get .object from get(.objectname)
#     if (is.null(.object) && !is.null(.objectname)) {.object <- get(.objectname)}
#     # --> Not necessary to duplicate the .object, because the .object can be retrieved by get(.objectname)? 
# 
#     ##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
#     ##@ Infer .objectname from .object, if .objectname is NULL.
#     if (!is.null(.object) & is.null(.objectname)) { 
#         .objectname <- deparse(substitute(.object))
#         if (.objectname == ".") {
#             warning('.objectname == ',deparse(.objectname),'   #@ sys.nframe() == ', sys.nframe(), "  \n", immediate. = TRUE)
#             # if (VERBOSE) 1:sys.nframe() %>% set_names() %>% map(function(n) { deparse(substitute(.object, parent.frame(n = n)))}) |> str(max.level = 2, give.attr = TRUE)
#             if (VERBOSE) 0:sys.nframe() %>% set_names() %>% map(function(n) { ls(envir = sys.frame(which = n)) }) %>% dput()
#             # message('-> Trying: ','deparse(substitute(.object, parent.frame(n = 2)))')
#             # .objectname <- deparse(substitute(.object, parent.frame(n = 2)))
#             message('-> Trying: ','ls(envir = .GlobalEnv, all.names = TRUE) %>% set_names %>% map(get) %>% keep(function(object) identical(object, .object)) %>% names')
#             .objectname = ls(envir = .GlobalEnv, all.names = TRUE) %>% set_names %>% map(get) %>% keep(function(object) identical(object, .object)) %>% names
#             if (length(.objectname) > 1) {
#                 warning('length(.objectname) > 1', "  \n", immediate. = TRUE)
#                 .objectname %>% dput()
#                 if (any(!.objectname %in% c(".", ".object"))) {
#                     .objectname = .objectname[!.objectname %in% c(".", ".object")][1]
#                 } else {
#                     .objectname = .objectname[1]
#                 }
#             }
#             if (.objectname %in% c(".", ".object")) {
#                 warning('.objectname == ',deparse(.objectname),'   #@ sys.nframe() == ', sys.nframe())
#                 "Try using `|>` instead of` `%>%`, or provide a valid object." |> stop(call. = FALSE) |> tryCatch(error = function(e) message("stop: ", e)); return(invisible())
#             }
#         }
#     } 
# 
#     ##________________________________________________________________________________  
#     ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#     ##@ -> By here, both .object and .objectname are available.
#     .object.size <- object.size(.object)
#     ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#     if(exists("MetaData")) {
#         if("DataSetNames" %in% names(MetaData)) {
#             if(.objectname %in% names(MetaData$DataSetNames)) {
#                 # assign(.objectname, structure(get(.objectname, envir = .GlobalEnv), MetaData = as.environment(MetaData)), envir = .GlobalEnv)
#                 assign(.objectname, structure(get(.objectname), MetaData = as.environment(MetaData)))
#                 assign(".object", structure(.object, MetaData = as.environment(MetaData)))
#             }
#         } 
#     }
#     ##________________________________________________________________________________  
#     ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#     if (.object.size >= 1e8) {
#         paste0(".object.size == ",.object.size|>format(units="GiB",standard="IEC")," GiB(IEC) >= 1e8 bytes (100 MB(SI)) --> The object is too large to compress in R. Consider compressing the file in a dedicated compression software after saving an uncompressed rds file.") |> warning(call. = FALSE, immediate. = TRUE)
#     }
#     ##________________________________________________________________________________  
#     ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#     ##@ If .path_file is provided, it determines the .filename.ext4write (& CompressionMethod). 
#     ## Caution) when .objectname is provided, .filename.ext4write & .path_file could have been auto-generated. 
#     
#     if(!is.null(.path_file)) {
#         .filename.ext4write = basename(.path_file)
#     }
#     ##________________________________________________________________________________  
#     ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#     ##@ If .filename.ext4write is provided, it may determine the CompressionMethod. 
#     ## Caution) When .filename.ext4write & .path4write is provided, .path_file can be auto-generated, so .path_file may not be NULL. 
#     if(!is.null(.filename.ext4write)) {
#         if(grepl("\\.xz$", .filename.ext4write)) {
#             CompressionMethod = "xz"
#         } else if(grepl("\\.gz$", .filename.ext4write)) {
#             CompressionMethod = "gz"
#         # } else {
#         #     CompressionMethod = "none" | "gz"  # gz compression may be done without ".gz" extension. 
#         }
#     }
# 
#     ##________________________________________________________________________________  
#     ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#     ##@ CompressionMethod should not be NULL by now 
#     # if(is.null(CompressionMethod))      CompressionMethod = 
#     #         {
#     #             if(is.null(.object)) {.object = get(.objectname)}; 
#     #             case_when(.object.size >= 1e8 ~ "none",
#     #                       .object.size >= 1e6 ~ "xz",
#     #                       TRUE ~ "gz")  
#     #         }
#     ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#     ##@ .filename.ext4write may still be NULL if .objectname is not provided. But now, .objectname should be auto-generated from deparse(substitute(.object)).  
#     if(is.null(.filename.ext4write))    .filename.ext4write = if(is.null(.objectname)) {NULL} else {  paste0(.objectname,".rds",ifelse(CompressionMethod == "xz", ".xz", ""))  }
#     ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#     ##@ .path4write may still be NULL if env1$path$.path4write was NULL.
#     # if(is.null(.path4write))            .path4write = env1$path$.path4write
#     if(is.null(.path4write))            .path4write = ""
#     ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#     ##@ .path_file may still be NULL if either .path4write or .filename.ext4write was NULL.
#     if(is.null(.path_file))             .path_file = if(is.null(.path4write) || is.null(.filename.ext4write)) {NULL} else {  paste0(.path4write,ifelse(.path4write=="","","/"),.filename.ext4write)  }
#     ##________________________________________________________________________________  
#     ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#     if(createBackup) cat(LinePrefix4CodeText, 'env1$env.internal.attach$f_filename.ext.createBackup(backup_from_path_filename.ext = ',deparse(.path_file),', .backup_to_path=',deparse(.backup_to_path),', timeFormat="%y%m%d_%H", overwrite=TRUE)', "  \n", sep="")
#     cat("\t", .objectname, ' |> write_rds(',shQuote(.path_file),', compress = ',shQuote(CompressionMethod),', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\\n")', "  \n", sep="")
#     if(path.size_files) cat(LinePrefix4CodeText, 'env1$f$f_path.size_files(.path4read = ',shQuote(.path4write),', regex4filename = ',shQuote(.objectname),")  \n", sep="")
#     
#     if(Execute) {
#         if(createBackup) env1$env.internal.attach$f_filename.ext.createBackup(backup_from_path_filename.ext = .path_file, .backup_to_path=.backup_to_path, timeFormat="%y%m%d_%H", overwrite=TRUE) 
#         if (.object.size >= 1e8) {
#             paste0(".object.size == ",.object.size|>format(units="GiB",standard="IEC")," GiB(IEC) >= 1e8 bytes (100 MB(SI)) --> No Auto-execution.") |> warning(call. = FALSE, immediate. = TRUE)
#         } else { 
#             .object |> write_rds( .path_file, compress = CompressionMethod, compression = 9L ) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
#             if(path.size_files) env1$f$f_path.size_files(.path4read = .path4write, regex4filename = .objectname)
#         }
#     }
#     
#     if(git_add_f) {
#         if (git_lfs_track == "determine based on object size") {
#             if(.object.size > 1e7) {
#                 env1$f$f_file.git_lfs_track_add_f(.path_file = .path_file, SkipIfAlreadyAdded = SkipIfAlreadyAdded, Execute = FALSE); if(Execute) warning("Caution: halting auto-execution of glt lfs track.  \n") 
#             } else {
#                 env1$f$f_TerminalFromRCodeText.echo(.TerminalCodeText = paste0( "git add -f ",shQuote(.path_file) ), Execute = Execute)
#             }
#         } else if (git_lfs_track == TRUE) {
#                 env1$f$f_file.git_lfs_track_add_f(.path_file = .path_file, SkipIfAlreadyAdded = SkipIfAlreadyAdded, Execute = FALSE); if(Execute) warning("Caution: halting auto-execution of glt lfs track.  \n") 
#         } else {
#             env1$f$f_TerminalFromRCodeText.echo(.TerminalCodeText = paste0( "git add -f ",shQuote(.path_file) ), Execute = Execute)
#         }
#     }
#     
#     invisible()
# }
# ## *** Example Usage:  
# # env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(fhs.index100le10)
# # env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = "fhs.index100le10")
# # env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(fhs.index100le10, .path_file = "./data/fhs.index100le10.rds.xz")

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
    

