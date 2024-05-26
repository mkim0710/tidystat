# objectname = "f_path.size_files"
# f_path.size_files.dev.r
# f_path.size_files.source.r
#         https://github.com/mkim0710/tidystat/blob/master/f_path.size_files.dev.r
# source("https://github.com/mkim0710/tidystat/raw/master/f_path.size_files.source.r")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#| Ctrl(+Shift)+1: Move focus (zoom) to Source Editor 
#| Ctrl+Shift+.[period]: Switch to tab (Show List of Open Tabs~!!!)
#| Ctrl+Alt+Shift+Left/Right: First/Last tab
#| Ctrl+Alt+D: Show diff
#| Ctrl+Shift+O: Show/Hide Document Outline
#| Alt+Shift+Drag: Multiline Cursor
#| Ctrl+Shift+F10: Restart R Session 
#| Ctrl+Alt+B: Run from start to current line 
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages"; subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r"); (source( file.path(env.custom$path$source_base,subpath.filename.source.r) ))
if(!exists("env.custom", envir=.GlobalEnv))
    assign("env.custom", new.env(), envir=.GlobalEnv)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
## env.custom\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat(sep="\n")
# path2look = "/"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "~"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
# path2look = "."; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"\n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"\n", sep="");
if(!"path" %in% names(env.custom)) env.custom$path = list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env.custom$path[[objectname]] = object;
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env.custom$path[[objectname]] = object;
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)
objectname = "getwd"; object = getwd(); env.custom$path[[objectname]] = object;
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); env.custom$path[[objectname]] = object;
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @ subpath, sourcename ======
subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "f_path.size_files"
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# env.custom$path$subpath = subpath
# env.custom$path$sourcename = sourcename
# env.custom$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.r")
# env.custom$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".dev.Rmd")
# env.custom$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename,".source.r")
# cat("# ",'sourcename = "',sourcename,'"', "\n",
#     "# ",sourcename,".dev.r", "\n",
#     "# ",sourcename,".source.r", "\n",
#     '# utils::browseURL("',env.custom$path$source_base_local,"/",env.custom$path$subpath,'")', "\n",
#     '# utils::browseURL("',env.custom$path$source_base_github_blob,"/",env.custom$path$subpath.filename.dev.r,'")', "\n",
#     '# source(paste0(env.custom$path$source_base,"/","',env.custom$path$subpath.filename.source.r,'"))', "\n",
#     '# # source("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
#     '# # source("',env.custom$path$source_base_github,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
#     '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.dev.r,'")', "\n",
#     '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.dev.Rmd,'")', "\n",
#     '# file.edit("',env.custom$path$source_base_local,"/",env.custom$path$subpath.filename.source.r,'")', "\n",
#     sep="")
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# env.custom$path$CurrentSource.path.filename.ext=rstudioapi::getSourceEditorContext()$path 
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# if(sourcename == "default.template") { warning('sourcename == "default.template"') } else {
#     # # if(!file.exists(env.custom$path$subpath.filename.dev.r)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","default.R"),to=env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$subpath.filename.dev.r); file.edit(env.custom$path$CurrentSource.path.filename.ext);
#     # if(!file.exists(env.custom$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","templates-00env.custom.minimum.Rmd"),to=env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$subpath.filename.dev.Rmd); file.edit(env.custom$path$CurrentSource.path.filename.ext);
#     # if(!file.exists(env.custom$path$subpath.filename.source.r)) file.copy(from=file.path(env.custom$path$source_base,"rstudio-prefs","templates","default.R"),to=env.custom$path$subpath.filename.source.r); file.edit(env.custom$path$subpath.filename.source.r); file.edit(env.custom$path$CurrentSource.path.filename.ext);
#     file2open = env.custom$path$subpath.filename.dev.Rmd; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); file.edit(env.custom$path$CurrentSource.path.filename.ext);
#     file2open = env.custom$path$subpath.filename.source.r; if(!file.exists(file2open)) file.create(file2open); file.edit(file2open); file.edit(env.custom$path$CurrentSource.path.filename.ext);
# }
# #|________________________________________________________________________________|#  
# #|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  


library(tidyverse)

if(!exists("env.custom", envir=.GlobalEnv))
    assign("env.custom", new.env(), envir=.GlobalEnv)
if(!exists("env.custom", envir=.GlobalEnv))
    assign("env.custom", new.env(), envir=.GlobalEnv)
# env.custom = as.environment(env.custom)
# if(!exists("env.internal", envir = env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir=.GlobalEnv)
if(!"env.internal" %in% names(env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir=.GlobalEnv)

if(!"path" %in% names(env.custom)) {
    env.custom$path = list()
    objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env.custom$path[[objectname]] = object;
    objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env.custom$path[[objectname]] = object;
    env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)  
} 
#@ for (env.custom.dependancy in c("")) { -----
for (env.custom.dependancy in c("f_df.tribble_construct")) {
    if(!env.custom.dependancy %in% names(env.custom)) {
        if(exists("print.intermediate")) {if(print.intermediate) cat(paste0("sys.nframe() = ", sys.nframe(), "\n"))}
        sourcename = env.custom.dependancy
        source(file.path(env.custom$path$source_base,"",paste0(sourcename,".source.r")))
    }
}


objectname = "f_path.size_files"
object = function(path4read = getwd(), literal_filename = NA, regex4filename = "\\.(rdata|rda|rds|csv|sas7bdat)(\\.[gx]z)?$") {
    if (is.na(literal_filename)) {
        # filenames = list.files(path = path4read) %>% {grep(regex4filename, .,  ignore.case = T, value = T)}
        filenames = list.files(path = path4read, pattern = regex4filename, ignore.case = T)
        if (length(filenames) == 0) {
            cat("No files found matching the regex4filename: ", regex4filename, "\n")
            return()
        }
    } else {
        filenames = list.files(path = path4read) %>% {grep(literal_filename, .,  ignore.case = T, value = T, fixed = T)}
        if (length(filenames) == 0) {
            cat("No files found matching the literal_filename: ", literal_filename, "\n")
            return()
        }
    }
    filenames %>% deparse(width.cutoff=120-15) |> cat(sep="\n");cat("\n"); # dput(); %>% deparse(width.cutoff=120-15) |> cat(sep="\n"); # width.cutoff=500 is the max ----
    cat(strrep("~",80),"\n",sep=""); #----
    out = filenames %>% {file.info(file.path(path4read,.))} %>%
        rownames_to_column("filename") %>% select(filename, size) %>%
        mutate(bytes = format(size, digits = 3, big.mark=","), 
               KB = format(size/2^10, digits = 3, big.mark=","), 
               MB = format(size/2^20, digits = 3, big.mark=","), 
               GB = format(size/2^30, digits = 3, big.mark=","))
    out = out %>% mutate(filename = sub(path4read, "", filename, fixed = T) %>% {sub("^/", "", .)})
    env.custom$f_df.tribble_construct(out)
    cat(strrep("~",80),"\n",sep=""); #----
} 
if(!objectname %in% names(env.custom)) {
    packageStartupMessage(paste0("Loading: ", "env.custom$", objectname)); 
    env.custom[[objectname]] = object
    # cat("> env.custom$",objectname,"()\n",sep=""); get(objectname, envir=env.custom)() # Run the loaded function by default
}

# > for (env.custom.dependancy in c("f_df.tribble_construct")) {
# +     if(!env.custom.dependancy %in% names(env.custom)) {
# +         if(exists("print.intermediate")) {if(print.intermediate) cat(paste0("sys.nframe() = ", sys.nframe(), "\n"))}
# +         objectname = env.custom.dependancy
# +         source(file.path(env.custom$path$source_base,"",paste0(objectname,".source.r")))
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


# > env.custom$f_path.size_files(path = "data", literal_filename = "rds")
# c("ATC_RxNorm_NDC.rds", "fhs.index100.rds", "fhs.index100ge11le20.rds", "fhs.index100le10.rds", "Holdings_VT_URTH_VWO.list.rds", "icd10cm2019.rds", "ICD9_3char_sub_chapter.tibble.rds", "icd9_chapters.expand_range.ICD9_3char.rds", "icd9_chapters.expand_range.rds", "icd9_sub_chapters.expand_range.ICD9_3char.rds", "icd9_sub_chapters.expand_range.rds", "jinseob2kim_jinseob2kim.github.io_master_fstexample.rds", "jinseob2kim_lecture-snuhlab_master_data_example_bnc.rds", "jinseob2kim_lecture-snuhlab_master_data_example_g1e.rds", "RDataMining-Tweets-20160212.rds")
# ----
# tibble::tribble(
#                                                   ~filename,    ~size,       ~bytes,         ~KB,        ~MB,        ~GB,
#                                        "ATC_RxNorm_NDC.rds", 79768376, "79,768,376", "77,898.80", "76.07305", "7.43e-02",
#                                          "fhs.index100.rds",   342010, "   342,010", "   333.99", " 0.32617", "3.19e-04",
#                                  "fhs.index100ge11le20.rds",    35515, "    35,515", "    34.68", " 0.03387", "3.31e-05",
#                                      "fhs.index100le10.rds",    35747, "    35,747", "    34.91", " 0.03409", "3.33e-05",
#                             "Holdings_VT_URTH_VWO.list.rds",   387992, "   387,992", "   378.90", " 0.37002", "3.61e-04",
#                                           "icd10cm2019.rds",  1432851, " 1,432,851", " 1,399.27", " 1.36647", "1.33e-03",
#                         "ICD9_3char_sub_chapter.tibble.rds",     8459, "     8,459", "     8.26", " 0.00807", "7.88e-06",
#                 "icd9_chapters.expand_range.ICD9_3char.rds",     2919, "     2,919", "     2.85", " 0.00278", "2.72e-06",
#                            "icd9_chapters.expand_range.rds",    42833, "    42,833", "    41.83", " 0.04085", "3.99e-05",
#             "icd9_sub_chapters.expand_range.ICD9_3char.rds",     5776, "     5,776", "     5.64", " 0.00551", "5.38e-06",
#                        "icd9_sub_chapters.expand_range.rds",    46898, "    46,898", "    45.80", " 0.04473", "4.37e-05",
#   "jinseob2kim_jinseob2kim.github.io_master_fstexample.rds",    86895, "    86,895", "    84.86", " 0.08287", "8.09e-05",
#   "jinseob2kim_lecture-snuhlab_master_data_example_bnc.rds",    24732, "    24,732", "    24.15", " 0.02359", "2.30e-05",
#   "jinseob2kim_lecture-snuhlab_master_data_example_g1e.rds",    51743, "    51,743", "    50.53", " 0.04935", "4.82e-05",
#                           "RDataMining-Tweets-20160212.rds",   282733, "   282,733", "   276.11", " 0.26964", "2.63e-04"
#   )
# ----
# Warning message:
# In grep(literal_filename, ., ignore.case = T, value = T, fixed = T) :
#   argument 'ignore.case = TRUE' will be ignored



#@ end -----



