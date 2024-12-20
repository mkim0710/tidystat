# ->> Now included in env1$env.internal.source.r ----

# Rdev/00_base_program/f_CodeText.ECHO.dev.r
# Rdev/00_base_program/f_CodeText.substitute.ECHO.dev.r -> incorporated in f_CodeText.ECHO.dev.r
# Rdev/00_base_program/f_expression.substitute.ECHO.dev-pending.Rmd
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



f_TerminalFromRCodeText.ECHO = function(.TerminalCodeText, EXECUTE = FALSE) {
    .TerminalCodeText |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
    if(EXECUTE) {
        .TerminalCodeText |> system(intern=TRUE)
    }
    invisible(        
        .TerminalCodeText |> deparse() |> paste0(" |> system(intern=TRUE)  \n", sep="")
    )
}



f_file.git_lfs_track_add_f = function(.path_file, EXECUTE = FALSE) {
    list_TerminalCodeText = list(
        paste0( "git lfs track ",shQuote(.path_file) )
        , paste0( "git add -f ",shQuote(.path_file) )
    )
    invisible(        
        list_TerminalCodeText |> map(f_TerminalFromRCodeText.ECHO, EXECUTE)
    )
}


