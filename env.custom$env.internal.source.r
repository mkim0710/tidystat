#@ env.custom$env.internal.source.r

# if(!exists("env.custom", envir = .GlobalEnv)) assign("env.custom", new.env(), envir = .GlobalEnv)
if(!exists("env.custom", envir = .GlobalEnv)) assign("env.custom", new.env(), envir = .GlobalEnv)
# env.custom = env.custom %>% as.environment
# if(!exists("env.internal", envir = env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir = .GlobalEnv)
if(!"env.internal" %in% names(env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir = .GlobalEnv)
if(!exists("env.custom$info")) env.custom$info = list()
# if(!exists("env.custom$source")) env.custom$source = list()
if(!"path" %in% names(env.custom)) {
    env.custom$path = list()
    if(!"source_base_local" %in% names(env.custom$path)) {
        env.custom$path$source_base_local = "D:/OneDrive/[][Rproject]/github_tidystat"
        cat("env.custom$path$source_base_local: ", env.custom$path$source_base_local, "\n")
    }
    if(!"source_base_github" %in% names(env.custom$path)) {
        env.custom$path$source_base_github = "https://github.com/mkim0710/tidystat/raw/master"
        cat("env.custom$path$source_base_github: ", env.custom$path$source_base_github, "\n")
    }
}

#@ end -----
# source(file.path("D:/OneDrive/[][Rproject]/github_tidystat", "env.custom$env.internal.source.r"))
# # source(file.path("https://github.com/mkim0710/tidystat/raw/master", "env.custom$env.internal.source.r"))

# #@ source(file.path(file.path(env.custom$path$source_base_local, ""), paste0(objectname, ".source.r")))----
# objectname = "get_system_info"
# source(file.path(file.path(env.custom$path$source_base_local, ""), paste0(objectname, ".source.r")))


