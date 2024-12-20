# ->> Now included in env1$env.internal.source.r ----

# Rdev/00_base_program/f_CodeText.ECHO.dev.r
# Rdev/00_base_program/f_TerminalFromRCodeText.ECHO.dev.r
# Rdev/00_base_terminal/f_file.git_lfs_track_add_f.dev.r
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

# f_file.git_lfs_track_add_f = function(.path_file, EXECUTE = FALSE) {
#     list_TerminalCodeText = list(
#         paste0( "git lfs track ",shQuote(.path_file) )
#         , paste0( "git add -f ",shQuote(.path_file) )
#     )
# 
#     list_TerminalCodeText |> 
#         map(function(.TerminalCodeText) .TerminalCodeText |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep=""))
#     if(EXECUTE) {
#         list_TerminalCodeText |> 
#             map(function(.TerminalCodeText) .TerminalCodeText |> system(intern=TRUE))
#     } 
#     invisible(        
#         list_TerminalCodeText |> map(function(.TerminalCodeText) .TerminalCodeText |> deparse() |> paste0(" |> system(intern=TRUE)  \n", sep=""))
#     )
# }



# f_TerminalFromRCodeText.ECHO = function(.TerminalCodeText, EXECUTE = FALSE) {
#     .TerminalCodeText |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
#     if(EXECUTE) {
#         .TerminalCodeText |> system(intern=TRUE)
#     }
#     invisible(        
#         .TerminalCodeText |> deparse() |> paste0(" |> system(intern=TRUE)  \n", sep="")
#     )
# }

# f_file.git_lfs_track_add_f = function(.path_file, EXECUTE = FALSE) {
#     list_TerminalCodeText = list(
#         paste0( "git lfs track ",shQuote(.path_file) )
#         , paste0( "git add -f ",shQuote(.path_file) )
#     )
#     invisible(        
#         list_TerminalCodeText |> map(f_TerminalFromRCodeText.ECHO, EXECUTE)
#     )
# }






##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## \$f_TerminalFromRCodeText.ECHO ====  
env1$f$f_TerminalFromRCodeText.ECHO = function(.TerminalCodeText, EXECUTE = FALSE) {
    .TerminalCodeText |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
    if(EXECUTE) {
        .TerminalCodeText |> system(intern=TRUE)
    }
    invisible(        
        .TerminalCodeText |> deparse() |> paste0(" |> system(intern=TRUE)  \n", sep="")
    )
}


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## \$f_file.git_lfs_track_add_f ====  
# Rdev/00_base_terminal/f_file.git_lfs_track_add_f.dev.r
env1$f$f_file.git_lfs_track_add_f = function(.path_file, EXECUTE = FALSE) {
    git_lfs_available = try(system2("git", args = "lfs version", stdout = TRUE, stderr = TRUE) == 0, silent = TRUE)    # https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a  # https://gemini.google.com/app/6d9de55c5c7085c6
    
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
    
    invisible(
        list(
            paste0( "git lfs track ",shQuote(.path_file) )
            , paste0( "git add -f ",shQuote(.path_file) )
        ) |> map(env1$f$f_TerminalFromRCodeText.ECHO, EXECUTE)
    )
}

# ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ## \$f_file.git_add_f ====  
# env1$f$f_file.git_add_f = function(.path_file, EXECUTE = FALSE) {
#     invisible(
#         paste0( "git add -f ",shQuote(.path_file) ) |> env1$f$f_TerminalFromRCodeText.ECHO(EXECUTE = EXECUTE)
#     )
# }


