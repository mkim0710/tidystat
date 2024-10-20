# @@ Now included in env1$env.internal.source.r ----

# Rdev/00_base_program/f_CodeText.echo.dev.r
# Rdev/00_base_program/f_TerminalFromRCodeText.echo.dev.r
# Rdev/00_base_program/f_file.git_lfs_track_add_f.dev.r
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

# f_file.git_lfs_track_add_f = function(.path_file, Execute = FALSE) {
#     list_TerminalCodeText = list(
#         paste0( "git lfs track ",shQuote(.path_file) )
#         , paste0( "git add -f ",shQuote(.path_file) )
#     )
# 
#     list_TerminalCodeText |> 
#         map(function(.TerminalCodeText) .TerminalCodeText |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep=""))
#     if(Execute) {
#         list_TerminalCodeText |> 
#             map(function(.TerminalCodeText) .TerminalCodeText |> system(intern=TRUE))
#     } 
#     invisible(        
#         list_TerminalCodeText |> map(function(.TerminalCodeText) .TerminalCodeText |> deparse() |> paste0(" |> system(intern=TRUE)  \n", sep=""))
#     )
# }



# f_TerminalFromRCodeText.echo = function(.TerminalCodeText, Execute = FALSE) {
#     .TerminalCodeText |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
#     if(Execute) {
#         .TerminalCodeText |> system(intern=TRUE)
#     }
#     invisible(        
#         .TerminalCodeText |> deparse() |> paste0(" |> system(intern=TRUE)  \n", sep="")
#     )
# }

# f_file.git_lfs_track_add_f = function(.path_file, Execute = FALSE) {
#     list_TerminalCodeText = list(
#         paste0( "git lfs track ",shQuote(.path_file) )
#         , paste0( "git add -f ",shQuote(.path_file) )
#     )
#     invisible(        
#         list_TerminalCodeText |> map(f_TerminalFromRCodeText.echo, Execute)
#     )
# }






##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## \$f_TerminalFromRCodeText.echo ====  
env1$f$f_TerminalFromRCodeText.echo = function(.TerminalCodeText, Execute = FALSE) {
    .TerminalCodeText |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
    if(Execute) {
        .TerminalCodeText |> system(intern=TRUE)
    }
    invisible(        
        .TerminalCodeText |> deparse() |> paste0(" |> system(intern=TRUE)  \n", sep="")
    )
}


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## \$f_file.git_lfs_track_add_f ====  
# Rdev/00_base_program/f_file.git_lfs_track_add_f.dev.r
env1$f$f_file.git_lfs_track_add_f = function(.path_file, Execute = FALSE) {
    git_lfs_available = try(system2("git", args = "lfs version", stdout = TRUE, stderr = TRUE) == 0, silent = TRUE)    # https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a  # https://gemini.google.com/app/6d9de55c5c7085c6
    
    # if(git_lfs_available) {
    #     invisible(
    #         list(
    #             paste0( "git lfs track ",shQuote(.path_file) )
    #             , paste0( "git add -f ",shQuote(.path_file) )
    #         ) |> map(env1$f$f_TerminalFromRCodeText.echo, Execute)
    #     )
    # } else {
    #     warning("git lfs is not available  \n")
    #     invisible(
    #         paste0( "git add -f ",shQuote(.path_file) ) |> env1$f$f_TerminalFromRCodeText.echo(Execute = Execute)
    #     )
    # }
    
    if(!git_lfs_available) warning("git lfs is not available  \n")
    
    invisible(
        list(
            paste0( "git lfs track ",shQuote(.path_file) )
            , paste0( "git add -f ",shQuote(.path_file) )
        ) |> map(env1$f$f_TerminalFromRCodeText.echo, Execute)
    )
}

# ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ## \$f_file.git_add_f ====  
# env1$f$f_file.git_add_f = function(.path_file, Execute = FALSE) {
#     invisible(
#         paste0( "git add -f ",shQuote(.path_file) ) |> env1$f$f_TerminalFromRCodeText.echo(Execute = Execute)
#     )
# }


