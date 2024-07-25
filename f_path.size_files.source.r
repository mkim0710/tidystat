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
# "." |> normalizePath(winslash="/") |> browseURL()
# paste0("[Working Files List] ",basename(getwd()),".r") |> file.edit()
# "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> shQuote(type="cmd") |> shell.exec()
# "D:/OneDrive/[][Rproject]/Rproject_Rmd/templates-00env1.minimum.Rmd" |> shQuote(type="cmd") |> (\(.) shell( paste0('cmd /c ""', file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe")|>normalizePath(winslash="/"), '" "', ., '""') ) )()
#|________________________________________________________________________________|#  ----
#| Ctrl(+Shift)+1: Move focus (zoom) to Source Editor 
#| Ctrl+Shift+.[period]: Switch to tab (Show List of Open Tabs~!!!)
#| Ctrl+Alt+Shift+Left/Right: First/Last tab
#| Ctrl+Alt+D: Show diff between current and last commit
#| Ctrl+Alt+M: Commit changes to Git
#| Ctrl+Shift+O: Show/Hide Document Outline
#| Alt+Shift+Drag: Multiline Cursor
#| Ctrl+Shift+F10: Restart R Session 
#| Ctrl+Alt+B: Run from start to current line 
#| Shift+F9: Toggle Breakpoint 
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% names(env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(env1$source[[sourcename]])}
if(!exists("env1", envir=.GlobalEnv))
    assign("env1", new.env(), envir=.GlobalEnv)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
if(.Platform$OS.type == "windows") Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(packagename in c("tidyverse")) {if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
## env1\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  \n", sep="  \n")
# path2look = "/"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"  \n", sep="");
# path2look = "~"; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"  \n", sep="");
# path2look = "."; cat('"',path2look,'" |> normalizePath(winslash="/") = "',normalizePath(path2look,winslash="/"),'"  \n', sep=""); cat('"',path2look,'" |> dir(all.files=TRUE) |> dput() = ',deparse(dir(path2look,all.files=TRUE)),"  \n", sep="");
if(!"path" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$path <- list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env1$path[[objectname]] = object;
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env1$path[[objectname]] = object;
if(!"source_base" %in% names(env1$path)) {env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)}
objectname = "getwd"; object = getwd(); env1$path[[objectname]] = object;
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); env1$path[[objectname]] = object;
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @ subpath, sourcename ======
subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "f_path.size_files" |> paste0(".source.r")
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# env1$path$subpath = subpath
# sourcename_root = sourcename |> str_replace("\\.source\\.r$", "")
# env1$path$sourcename_root = sourcename_root  
# env1$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.r")
# env1$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.Rmd")
# env1$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename)
# cat("# ",'sourcename_root = "',sourcename_root,'"', "\n",
#     "# ",sourcename_root,".dev.r", "\n",
#     "# ",sourcename_root,".source.r", "\n",
#     '# utils::browseURL("',env1$path$source_base_local,"/",env1$path$subpath,'")', "\n",
#     '# utils::browseURL("',env1$path$source_base_github_blob,"/",env1$path$subpath.filename.dev.r,'")', "\n",
#     '# source(paste0(env1$path$source_base,"/","',env1$path$subpath.filename.source.r,'"))', "\n",
#     '# # source("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     '# # source("',env1$path$source_base_github,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'")', "\n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "\n",
#     sep="")
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
if (requireNamespace("rstudioapi")) {
    if(env1$print.intermediate) {CodeText2Print = 'requireNamespace("rstudioapi")'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}; 
    if (rstudioapi::isAvailable()) {
        env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "");
    } else { if(env1$print.intermediate) print('rstudioapi::isAvailable() == FALSE') }
    if(env1$print.intermediate) {CodeText2Print = 'env1$path$CurrentSource.path.filename.ext'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}; 
} else { if(env1$print.intermediate) print('requireNamespace("rstudioapi") == FALSE') }
# #|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# if(sourcename == "default.template") { warning('sourcename == "default.template"') } else {
#     # # if(!file.exists(env1$path$subpath.filename.dev.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.dev.r); env1$path$subpath.filename.dev.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
#     # if(!file.exists(env1$path$subpath.filename.dev.Rmd)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","templates-00env1.minimum.Rmd"),to=env1$path$subpath.filename.dev.Rmd); env1$path$subpath.filename.dev.Rmd %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
#     # if(!file.exists(env1$path$subpath.filename.source.r)) file.copy(from=file.path(env1$path$source_base,"rstudio-prefs","templates","default.R"),to=env1$path$subpath.filename.source.r); env1$path$subpath.filename.source.r %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
#     file2create = env1$path$subpath.filename.dev.Rmd; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
#     file2create = env1$path$subpath.filename.source.r; if(!file.exists(file2create)) file.create(file2create); file.edit(file2create); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)});
# }
# #|________________________________________________________________________________|#  
# #|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  


library(tidyverse)

if(!exists("env1", envir=.GlobalEnv))
    assign("env1", new.env(), envir=.GlobalEnv)
# env1 = as.environment(env1)
# if(!exists("env.internal", envir = env1)) eval(parse(text = "env1$env.internal = new.env()"), envir=.GlobalEnv)
# if(!"env.internal" %in% names(env1)) eval(parse(text = "env1$env.internal = new.env()"), envir=.GlobalEnv)
if(!"env.internal" %in% names(.GlobalEnv$env1)) .GlobalEnv$env1$env.internal <- new.env()

if(!"path" %in% names(env1)) {
    env1$path = list()
    objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); env1$path[[objectname]] = object;
    objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; env1$path[[objectname]] = object;
    if(!"source_base" %in% names(env1$path)) {env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github)}  
} 
#@ for (env1.dependancy in c("")) { -----
for (env1.dependancy in c("f_df.tribble_construct")) {
    if(!env1.dependancy %in% names(env1)) {
        if(exists("print.intermediate")) {if(print.intermediate) cat(paste0("sys.nframe() = ", sys.nframe(), "\n"))}
        sourcename = env1.dependancy |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% names(env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(env1$source[[sourcename]])}
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
    filenames |> deparse(width.cutoff=120-15) |> cat("  \n", sep="  \n"); # dput(); |> deparse(width.cutoff=120-15) |> cat("  \n", sep="  \n"); # width.cutoff=500 is the max ----
    cat(strrep("~",80),"\n",sep=""); #----
    out = filenames %>% {file.info(file.path(path4read,.))} %>%
        rownames_to_column("filename") %>% select(filename, size) %>%
        mutate(bytes = format(size, digits = 3, big.mark=","), 
               KB = format(size/2^10, digits = 3, big.mark=","), 
               MB = format(size/2^20, digits = 3, big.mark=","), 
               GB = format(size/2^30, digits = 3, big.mark=","))
    out = out %>% mutate(filename = sub(path4read, "", filename, fixed = T) %>% {sub("^/", "", .)})
    env1$f_df.tribble_construct(out)
    cat(strrep("~",80),"\n",sep=""); #----
} 
if(!objectname %in% names(env1)) {
    packageStartupMessage(paste0("Loading: ", "env1$", objectname)); 
    env1[[objectname]] = object
    # cat("> env1$",objectname,"()\n",sep=""); get(objectname, envir=env1)() # Run the loaded function by default
}

# > for (env1.dependancy in c("f_df.tribble_construct")) {
# +     if(!env1.dependancy %in% names(env1)) {
# +         if(exists("print.intermediate")) {if(print.intermediate) cat(paste0("sys.nframe() = ", sys.nframe(), "\n"))}
# +         objectname = env1.dependancy
# +         source(file.path(env1$path$source_base,"",paste0(objectname,".source.r")))
# +     }
# + }
# sys.nframe() = 0
# sys.nframe() = 4
# Loading:  env1$env.internal$.global_datapasta_env 
# Loading:  env1$f_df.tribble_construct 
# Loading:  env1$f_df.transpose 
# Loading:  env1$f_df.t.tribble_construct 
# sys.nframe() = 8
# Loading: env1$f_path.size_files
# > env1$f_path.size_files()
# "env1.fun.t.tribble_construct.RData.xz"
# ----
# tibble::tribble(
#                                       ~filename, ~size,   ~bytes,    ~KB,      ~MB,        ~GB,
#   "env1.fun.t.tribble_construct.RData.xz", 14792, "14,792", "14.4", "0.0141", "1.38e-05"
#   )
# ----


# > env1$f_path.size_files(path = "data", literal_filename = "rds")
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



