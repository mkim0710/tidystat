# Rdev/00_base_program/007_base_expression/f_ObjectName.get.dput.echo.dev.r
# --> Now included in "env1$env.internal.source.r"

# Rdev/00_base_program/007_base_expression/f_CodeText.parse.eval.dput.echo.dev.r
# Rdev/00_base_program/007_base_expression/f_CodeText.echo.dev.r
# Rdev/00_base_program/007_base_expression/f_CodeText.substitute.echo.dev.r -> incorporated in f_CodeText.echo.dev.r
# Rdev/00_base_program/007_base_expression/f_expression.substitute.echo.dev-pending.Rmd



.objectname = "analyticDF_time2event"

".objectname" |> env1$f$f_CodeText.echo()
".objectname" |> env1$f$f_CodeText.echo(Execute = TRUE)
".objectname" |> env1$f$f_CodeText.echo(substitute_ObjectNames = FALSE)
".objectname" |> env1$f$f_CodeText.echo(substitute_ObjectNames = FALSE, Execute = TRUE)
# > ".objectname" |> env1$f$f_CodeText.echo()
# 	"analyticDF_time2event"  
# > ".objectname" |> env1$f$f_CodeText.echo(Execute = TRUE)
# 	"analyticDF_time2event" == "analyticDF_time2event"  
# > ".objectname" |> env1$f$f_CodeText.echo(substitute_ObjectNames = FALSE)
# 	.objectname  
# > ".objectname" |> env1$f$f_CodeText.echo(substitute_ObjectNames = FALSE, Execute = TRUE)
# 	.objectname == "analyticDF_time2event" 


myObject = LETTERS[1:5]
"myObject" |> env1$f$f_CodeText.echo(substitute_ObjectNames = FALSE, Execute = TRUE)
# > "myObject" |> env1$f$f_CodeText.echo(substitute_ObjectNames = FALSE, Execute = TRUE)
# 	myObject == c("A", "B", "C", "D", "E")  

"myObject" %>% get()
"myObject" %>% get() %>% dput()
"myObject" %>% get() %>% deparse()
"myObject" %>% get() %>% deparse() %>% cat()



# attr(,"alias")
# [1] "env1$env.internal.attach$eval_parse_CodeText.echo = env1$f$f_CodeText.echo"
# [2] "env1$env.internal.attach$echo.eval_parse_CodeText = env1$f$f_CodeText.echo"


# "f_ObjectName.get.dput.echo"
# "f_ObjectName.get.deparse.cat.echo"
# "f_ObjectName.parse.eval.deparse.cat.echo"
# 
# "get_ObjectName.dput.echo"
# "echo.get_ObjectName.dput"
# 
# "Object.dput.echo"
# "echo.Object.dput"

f_ObjectName.get.dput.echo = function(ObjectName, LinePrefix4CodeText = "\t") {
    cat(LinePrefix4CodeText); cat(ObjectName); cat(" == "); 
    ObjectName |> get() |> deparse() |> cat(); cat("  \n")
    invisible()
}

tmp_function = function(input) {
    echo.dput_get_ObjectName("input")
}
tmp_function("test")


f_ObjectName.get.dput.echo = function(ObjectName, envir = parent.frame(), LinePrefix4CodeText = "\t") {
    if (!exists(ObjectName, envir)) stop(paste("Object", ObjectName, "does not exist in the calling environment"))
    cat(LinePrefix4CodeText); cat(ObjectName); cat(" == "); 
    ObjectName |> get(envir = envir) |> deparse() |> cat(); cat("  \n")
    invisible()
}

tmp_function = function(input) {
    echo.dput_get_ObjectName("input")
}
tmp_function("test")

    
"myObject" |> f_ObjectName.get.dput.echo()
# > "myObject" |> f_ObjectName.get.dput.echo()
# 	myObject == c("A", "B", "C", "D", "E")  


