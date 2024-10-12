##@ now included in env1$env.internal.source.r ----


# f_file.git_lfs_track_add_f = function(.path.file, execute_code = FALSE) {
#     list_TerminalCodeText = list(
#         paste0( "git lfs track ",shQuote(.path.file) )
#         , paste0( "git add -f ",shQuote(.path.file) )
#     )
# 
#     list_TerminalCodeText |> 
#         map(function(.TerminalCodeText) .TerminalCodeText |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep=""))
#     if(execute_code) {
#         list_TerminalCodeText |> 
#             map(function(.TerminalCodeText) .TerminalCodeText |> system(intern=TRUE))
#     } 
#     invisible(        
#         list_TerminalCodeText |> map(function(.TerminalCodeText) .TerminalCodeText |> deparse() |> paste0(" |> system(intern=TRUE)  \n", sep=""))
#     )
# }



# f_TerminalCodeText2RCode = function(.TerminalCodeText, execute_code = FALSE) {
#     .TerminalCodeText |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
#     if(execute_code) {
#         .TerminalCodeText |> system(intern=TRUE)
#     }
#     invisible(        
#         .TerminalCodeText |> deparse() |> paste0(" |> system(intern=TRUE)  \n", sep="")
#     )
# }

# f_file.git_lfs_track_add_f = function(.path.file, execute_code = FALSE) {
#     list_TerminalCodeText = list(
#         paste0( "git lfs track ",shQuote(.path.file) )
#         , paste0( "git add -f ",shQuote(.path.file) )
#     )
#     invisible(        
#         list_TerminalCodeText |> map(f_TerminalCodeText2RCode, execute_code)
#     )
# }


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## \$f_TerminalCodeText2RCode ====  
env1$f$f_TerminalCodeText2RCode = function(.TerminalCodeText, execute_code = FALSE) {
    .TerminalCodeText |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
    if(execute_code) {
        .TerminalCodeText |> system(intern=TRUE)
    }
    invisible(        
        .TerminalCodeText |> deparse() |> paste0(" |> system(intern=TRUE)  \n", sep="")
    )
}


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## \$f_file.git_lfs_track_add_f ====  
env1$f$f_file.git_lfs_track_add_f = function(.path.file, execute_code = FALSE) {
    list_TerminalCodeText = list(
        paste0( "git lfs track ",shQuote(.path.file) )
        , paste0( "git add -f ",shQuote(.path.file) )
    )
    invisible(
        list_TerminalCodeText |> map(env1$f$f_TerminalCodeText2RCode, execute_code)
    )
}


