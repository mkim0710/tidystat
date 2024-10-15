##@ now included in env1$env.internal.source.r ----

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

# f_file.git_lfs_track_add_f = function(.path.file, Execute = FALSE) {
#     list_TerminalCodeText = list(
#         paste0( "git lfs track ",shQuote(.path.file) )
#         , paste0( "git add -f ",shQuote(.path.file) )
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

# f_file.git_lfs_track_add_f = function(.path.file, Execute = FALSE) {
#     list_TerminalCodeText = list(
#         paste0( "git lfs track ",shQuote(.path.file) )
#         , paste0( "git add -f ",shQuote(.path.file) )
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
env1$f$f_file.git_lfs_track_add_f = function(.path.file, Execute = FALSE) {
    list_TerminalCodeText = list(
        paste0( "git lfs track ",shQuote(.path.file) )
        , paste0( "git add -f ",shQuote(.path.file) )
    )
    invisible(
        list_TerminalCodeText |> map(env1$f$f_TerminalFromRCodeText.echo, Execute)
    )
}

# ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ## \$f_file.git_add_f ====  
# env1$f$f_file.git_add_f = function(.path.file, Execute = FALSE) {
#     invisible(
#         paste0( "git add -f ",shQuote(.path.file) ) |> env1$f$f_TerminalFromRCodeText.echo(Execute = Execute)
#     )
# }


