# objectname = "f_path.size_files"
# f_path.size_files.dev.r
# f_path.size_files.source.r
#         https://github.com/mkim0710/tidystat/blob/master/f_path.size_files.dev.r
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/f_path.size_files.source.r")
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
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
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# file.edit( paste0("[Working Files List] ",basename(getwd()),".r") )  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## \$ env1\$path\$CurrentSource.path.filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal$f_path.CurrentSource.path.filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) source -----  
### @ .subpath, .sourcename ======  
.subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(.subpath!="") utils::browseURL(normalizePath(.subpath))
.sourcename = "f_path.size_files" |> paste0(".source.r")
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# env1$path$.subpath = .subpath
# .sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
# env1$path$.sourcename_root = .sourcename_root  
# env1$path$.subpath.filename.dev.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.r")
# env1$path$.subpath.filename.dev.Rmd = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.Rmd")
# env1$path$.subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# cat("# ",'.sourcename_root = "',.sourcename_root,'"', "  \n",
#     "# ",env1$path$.subpath.filename.dev.r, "  \n",
#     "# ",env1$path$.subpath.filename.dev.Rmd, "  \n",
#     "# ",env1$path$.subpath.filename.source.r, "  \n",
#     '# # source("',env1$path$source_base,"/",env1$path$.subpath.filename.source.r,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")', "  \n",
#     '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
#     '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
#     sep="")
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
# # \% source( file.path(env1$path$source_base,.subpath.filename.source.r) ) ----  
# .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ RUN ALL ABOVE: CTRL+ALT+B -----  
#| RUN ALL ABOVE: CTRL+ALT+B |#
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  


#@ for (.dependancy in c("")) { -----  
for (.dependancy in c("f_df.t.tribble_construct")) {
    if(!.dependancy %in% names(.GlobalEnv$env1)) {
        if(Sys.getenv("print.intermediate")==TRUE) { print(paste0("sys.nframe() = ", sys.nframe())) }
        .sourcename = .dependancy |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
    }
}


.tmp$objectname = "f_path.size_files"
.tmp$object = function(.path4read = getwd(), literal_filename = NA, regex4filename = "\\.(rdata|rda|rds|csv|sas7bdat)(\\.[gx]z)?$", print.intermediate = FALSE) {
    if (is.na(literal_filename)) {
        # filenames = list.files(path = .path4read) %>% {grep(regex4filename, .,  ignore.case = TRUE, value = TRUE)}
        filenames = list.files(path = .path4read, pattern = regex4filename, ignore.case = TRUE)
        if (length(filenames) == 0) {
            cat("No files found matching the regex4filename: ", regex4filename, "\n")
            return()
        }
    } else {
        # # filenames = list.files(path = .path4read) %>% {grep(literal_filename, .,  ignore.case = TRUE, value = TRUE, fixed = TRUE)}
        # filenames = list.files(path = .path4read) %>% {grep(literal_filename, ., value = TRUE, fixed = TRUE)}
        filenames = list.files(path = .path4read) |> str_subset(fixed(literal_filename))
        if (length(filenames) == 0) {
            cat("No files found matching the literal_filename: ", literal_filename, "\n")
            return()
        }
    }
    if(print.intermediate) filenames |> deparse(width.cutoff=120-15) |> paste0(collapse="  \n") |> cat("  \n", sep=""); # dput(); |> deparse(width.cutoff=120-15) |> paste0(collapse="  \n") |> cat("  \n", sep=""); # width.cutoff=500 is the max ----
    cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); #----
    out = filenames %>% {file.info(file.path(.path4read,.))} %>%
        rownames_to_column("filename") %>% select(filename, size) %>%
        mutate(bytes = format(size, digits = 3, big.mark=","), 
               KB = format(size/2^10, digits = 3, big.mark=","), 
               MB = format(size/2^20, digits = 3, big.mark=","), 
               GB = format(size/2^30, digits = 3, big.mark=","))
    # out = out %>% mutate(filename = sub(.path4read, "", filename, fixed = TRUE) %>% {sub("^/", "", .)})
    out = out %>% mutate(filename = filename |> env1$f$f_path.relative()) 
    env1$f$f_df.tribble_construct(out)
    cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n"); #----
    return(out)
} 
env1$env.internal$f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name = "f", show_packageStartupMessage = TRUE)

# > for (.dependancy in c("f_df.t.tribble_construct")) {
# +     if(!.dependancy %in% names(.GlobalEnv$env1)) {
# +         if(Sys.getenv("print.intermediate")==TRUE) { print(paste0("sys.nframe() = ", sys.nframe())) }
# +         objectname = .dependancy
# +         source(file.path(env1$path$source_base,"",paste0(objectname,".source.r")))
# +     }
# + }
# sys.nframe() = 0
# sys.nframe() = 4
# Loading:  env1$env.internal$.global_datapasta_env 
# Loading:  env1$f$f_df.tribble_construct 
# Loading:  env1$f$f_df.transpose 
# Loading:  env1$f$f_df.t.tribble_construct 
# sys.nframe() = 8
# Loading: env1$f$f_path.size_files
# > env1$f$f_path.size_files()
# "env1.fun.t.tribble_construct.RData.xz"
# ----  
# tibble::tribble(
#                                       ~filename, ~size,   ~bytes,    ~KB,      ~MB,        ~GB,
#   "env1.fun.t.tribble_construct.RData.xz", 14792, "14,792", "14.4", "0.0141", "1.38e-05"
#   )
# ----  


# > env1$f$f_path.size_files(path = "data", literal_filename = "rds")
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
# In grep(literal_filename, ., ignore.case = TRUE, value = TRUE, fixed = TRUE) :
#   argument 'ignore.case = TRUE' will be ignored



#@ end -----  



