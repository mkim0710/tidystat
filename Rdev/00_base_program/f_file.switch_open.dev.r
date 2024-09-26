##@ now included in env1$env.internal.source.r ----


f_file.switch_open <- function(file) {
    stopifnot(file.exists(file))
    
    file <- normalizePath(file, mustWork = TRUE)
    
    switch(Sys.info()["sysname"], 
        Linux = {
            app <- Sys.getenv("BROWSER", "xdg-open")
            system2(app, file)
        }, 
        Windows = {
            shell.exec(file)
        }, 
        Darwin = {
            system2("open", shQuote(file))
        }, 
        stop("Operating system not handled: ", toString(userSystem))
    )
}
