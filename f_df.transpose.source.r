# f_df.t.tribble_construct.source.r
# f_df.tribble_construct.source.r
# f_df.transpose.source.r

if(!exists("env1", envir=.GlobalEnv))
    assign("env1", new.env(), envir=.GlobalEnv)
# env1 = env1 %>% as.environment
# if(!exists("env.internal", envir = env1)) eval(parse(text = "env1$env.internal = new.env()"), envir=.GlobalEnv)
# if(!"env.internal" %in% names(env1)) eval(parse(text = "env1$env.internal = new.env()"), envir=.GlobalEnv)
if(!"env.internal" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$env.internal <- new.env()
if(!"path" %in% names(env1)) {
    env1$path = list()
    objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env1$path[[objectname]] = object;
    objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env1$path[[objectname]] = object;
    env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)  
} 
#@ for (env1.dependancy in c("")) { -----
for (env1.dependancy in c("f_df.t.tribble_construct")) {
    if(!env1.dependancy %in% names(env1)) {
        if(exists("print.intermediate")) {if(print.intermediate) cat(paste0("sys.nframe() = ", sys.nframe(), "\n"))}
        sourcename = env1.dependancy
        source(file.path(env1$path$source_base,"",paste0(sourcename,".source.r")))
    }
}


