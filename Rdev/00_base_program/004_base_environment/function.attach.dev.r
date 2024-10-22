search()
ls()
function.attach = function(Parametmer.list) {
    for (v in 1:length(Parametmer.list)) assign(names(Parametmer.list)[v], Parametmer.list[[v]], envir=.GlobalEnv)
}
search()
ls()
