# f_path.size_files.source.r
# f_path.size_files.dev.r
#         https://github.com/mkim0710/tidystat/blob/master/f_path.size_files.dev.r
# source("https://github.com/mkim0710/tidystat/raw/master/f_path.size_files.source.r")

library(tidyverse)

# if(!exists("env.custom", envir = .GlobalEnv)) assign("env.custom", new.env(), envir = .GlobalEnv)
if(!exists("env.custom", envir = .GlobalEnv)) assign("env.custom", new.env(), envir = .GlobalEnv)
# env.custom = as.environment(env.custom)
# if(!exists("env.internal", envir = env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir = .GlobalEnv)
if(!"env.internal" %in% names(env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir = .GlobalEnv)

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
#@ for (env.custom.dependancy in c("")) { -----
for (env.custom.dependancy in c("f_df.tribble_construct")) {
    if(!env.custom.dependancy %in% names(env.custom)) {
        cat(paste0("sys.nframe() = ", sys.nframe(), "\n"))
        objectname = env.custom.dependancy
        source(file.path(file.path(env.custom$path$source_base_local, ""), paste0(objectname, ".source.r")))
    }
}


objectname = "f_path.size_files"
object = function(path4read = getwd(), regex4filename = "\\.(rdata|rda|rds|csv|sas7bdat)(\\.[gx]z)?$") {
    # filenames = list.files(path = path4read) %>% {grep(regex4filename, .,  ignore.case = T, value = T)}
    filenames = list.files(path = path4read, pattern = regex4filename, ignore.case = T)
    if (length(filenames) == 0) {
        cat("No files found matching the regex4filename: ", regex4filename, "\n")
        return()
    }
    filenames %>% {cat(deparse(., width.cutoff=120), '\n', sep='')} # dput() cat(deparse(., width.cutoff=120)), width.cutoff=500 is the max ----
    cat("----\n"); #----
    out = filenames %>% {file.info(file.path(path4read,.))} %>%
        rownames_to_column("filename") %>% select(filename, size) %>%
        mutate(bytes = format(size, digits = 3, big.mark=","), 
               KB = format(size/2^10, digits = 3, big.mark=","), 
               MB = format(size/2^20, digits = 3, big.mark=","), 
               GB = format(size/2^30, digits = 3, big.mark=","))
    out = out %>% mutate(filename = sub(path4read, "", filename, fixed = T) %>% {sub("^/", "", .)})
    env.custom$f_df.tribble_construct(out)
    cat("----\n"); #----
} 
if(!objectname %in% names(env.custom)) {
    cat("Loading: ", "env.custom$", objectname, "\n", sep = ""); 
    env.custom[[objectname]] = object
    cat("> env.custom$", objectname, "()\n", sep = ""); get(objectname, envir = env.custom)() # Run the loaded function by default
}


# > for (env.custom.dependancy in c("f_df.tribble_construct")) {
# +     if(!env.custom.dependancy %in% names(env.custom)) {
# +         cat(paste0("sys.nframe() = ", sys.nframe(), "\n"))
# +         objectname = env.custom.dependancy
# +         source(file.path(file.path(env.custom$path$source_base_local, ""), paste0(objectname, ".source.r")))
# +     }
# + }
# sys.nframe() = 0
# sys.nframe() = 4
# Loading:  env.custom$env.internal$.global_datapasta_env 
# Loading:  env.custom$f_df.tribble_construct 
# Loading:  env.custom$f_df.transpose 
# Loading:  env.custom$f_df.t.tribble_construct 
# sys.nframe() = 8
# Loading: env.custom$f_path.size_files
# > env.custom$f_path.size_files()
# "env.custom.fun.t.tribble_construct.RData.xz"
# ----
# tibble::tribble(
#                                       ~filename, ~size,   ~bytes,    ~KB,      ~MB,        ~GB,
#   "env.custom.fun.t.tribble_construct.RData.xz", 14792, "14,792", "14.4", "0.0141", "1.38e-05"
#   )
# ----


#@ end -----



