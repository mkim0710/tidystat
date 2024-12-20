# Rdev/00_base_program/007_base_expression/f_ObjectName.get.dput.ECHO.dev.r
# --> Now included in "env1$env.internal.source.r"

# Rdev/00_base_program/007_base_expression/f_CodeText.parse.eval.dput.ECHO.dev.r
# Rdev/00_base_program/007_base_expression/f_CodeText.ECHO.dev.r
# Rdev/00_base_program/007_base_expression/f_CodeText.substitute.echo.dev.r -> incorporated in f_CodeText.ECHO.dev.r
# Rdev/00_base_program/007_base_expression/f_expression.substitute.echo.dev-pending.Rmd



.objectname = "analyticDF_time2event"

".objectname" |> env1$f$f_CodeText.ECHO()
".objectname" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
".objectname" |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
".objectname" |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE, EXECUTE = TRUE)
# > ".objectname" |> env1$f$f_CodeText.ECHO()
# 	"analyticDF_time2event"  
# > ".objectname" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE)
# 	"analyticDF_time2event" == "analyticDF_time2event"  
# > ".objectname" |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE)
# 	.objectname  
# > ".objectname" |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE, EXECUTE = TRUE)
# 	.objectname == "analyticDF_time2event" 


myObject = LETTERS[1:5]
"myObject" |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE, EXECUTE = TRUE)
# > "myObject" |> env1$f$f_CodeText.ECHO(substitute_ObjectNames = FALSE, EXECUTE = TRUE)
# 	myObject == c("A", "B", "C", "D", "E")  

"myObject" %>% get()
"myObject" %>% get() %>% dput()
"myObject" %>% get() %>% deparse()
"myObject" %>% get() %>% deparse() %>% cat()



# attr(,"alias")
# [1] "env1$env.internal.attach$eval_parse_CodeText.ECHO = env1$f$f_CodeText.ECHO"
# [2] "env1$env.internal.attach$echo.eval_parse_CodeText = env1$f$f_CodeText.ECHO"


# "f_ObjectName.get.dput.ECHO"
# "f_ObjectName.get.deparse.cat.echo"
# "f_ObjectName.parse.eval.deparse.cat.echo"
# 
# "get_ObjectName.dput.ECHO"
# "echo.get_ObjectName.dput"
# 
# "Object.dput.ECHO"
# "echo.Object.dput"

f_ObjectName.get.dput.ECHO = function(ObjectName, LinePrefix4CodeText = "\t") {
    cat(LinePrefix4CodeText); cat(ObjectName); cat(" == "); 
    ObjectName |> get() |> deparse() |> cat(); cat("  \n")
    invisible()
}

tmp_function = function(input) {
    ECHO.dput_get_ObjectName("input")
}
tmp_function("test")


f_ObjectName.get.dput.ECHO = function(ObjectName, envir = parent.frame(), LinePrefix4CodeText = "\t") {
    if (!exists(ObjectName, envir)) stop(paste("Object", ObjectName, "does not exist in the calling environment"))
    cat(LinePrefix4CodeText); cat(ObjectName); cat(" == "); 
    ObjectName |> get(envir = envir) |> deparse() |> cat(); cat("  \n")
    invisible()
}

tmp_function = function(input) {
    ECHO.dput_get_ObjectName("input")
}
tmp_function("test")

    
"myObject" |> f_ObjectName.get.dput.ECHO()
# > "myObject" |> f_ObjectName.get.dput.ECHO()
# 	myObject == c("A", "B", "C", "D", "E")  


