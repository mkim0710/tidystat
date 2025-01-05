# ->> Now included in env1$env.internal.source.r ----
# Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.dev.r
# Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.source-exported.r

##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# paste0("[Working Files List] ",basename(getwd()),".r") %>% {paste0(env1$path$path1,"/",.)} |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()
##________________________________________________________________________________  
"ls(all.names = TRUE, envir = .GlobalEnv) |> set_names() |> map(get) |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
".tmp |> str(max.level = 1, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
cat("    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    \n")
"env1 |> as.list() |> env1$f$f_list.str_by_element(max.level = 2, give.attr = FALSE)" |> env1$f$f_CodeText.ECHO(EXECUTE = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) dev -----  

# https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a ----
# https://gemini.google.com/app/6d9de55c5c7085c6 ----

## env0 = env1 ----
env0 = env1

#@ ```{r writeRDS-EvalNoEchoNoMsgNoResults, eval=TRUE, echo=FALSE, warning=TRUE, message=NA, results="hide"} ----
# ```{r writeRDS-EvalNoEchoNoMsgNoResults, eval=TRUE, echo=FALSE, warning=TRUE, message=NA, results="hide"}
# ##________________________________________________________________________________  
# ##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# ## @ write_rds( get(.objectname), paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".rds",".xz"), compress = "xz", compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
# .path4write = env1$path$.path4write
# # MetaData$DSNs |> names() |> paste0(collapse = "\n") |> cat("\n", sep="")
# cat("    ________________________________________________________________________    \n")
# for (.objectname in names(MetaData$DSNs)) {
#     assign(.objectname, structure(get(.objectname, envir = .GlobalEnv), MetaData = as.environment(MetaData)), envir = .GlobalEnv)
#     .path_file = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".rds",".xz")
#     cat(.objectname, ' |> write_rds(',shQuote(.path_file),', compress = "xz", compression = 9L) |> system.time()', "  \n", sep="")
#     # system.time(write_rds( get(.objectname), .path_file, compress = "xz", compression = 9L ))
#     cat('env1$f$f_path.size_files(.path4read = ',shQuote(.path4write),', regex4FileName = ',shQuote(.objectname),")  \n", sep="")
#     env1$f$f_file.git_lfs_track_add_f(.path_file = .path_file, EXECUTE = FALSE)
#     cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
# }
# # #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# # .path_FileName.xlsx = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".xlsx")
# # openxlsx2::write_xlsx(get(.objectname), file = .path_FileName.xlsx, as_table=TRUE, table_style="none", row_names=TRUE, col_widths="auto", first_active_row=2, first_active_col=2) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n") 
# # if (Sys.info()["sysname"] == "Linux") browseURL(FileName) else openxlsx2::xl_open(FileName)
# ```


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function -----  
# .SourceName_root = .FileName.source.r |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.SourceName_root]] = "Sourcing..." 


MetaData <- readRDS("rstudio-prefs/templates/templates-00env1.minimum.MetaData.rds")
.objectname = "MetaData"
get(.objectname) |> str(max.level = 2, give.attr = TRUE)
# > get(.objectname) |> str(max.level = 2, give.attr = TRUE)
# List of 5
#  $ tblVarName     : list()
#  $ DSNs   :List of 2
#   ..$ ADS_time2event.NA        :List of 1
#   ..$ ADS_time2event.DNR:List of 1
#  $ VarNames       :List of 11
#   ..$ Event       :List of 4
#   ..$ Mediator    :List of 2
#   ..$ Exposure    :List of 4
#   ..$ PMHx        : list()
#   ..$ Tx          : list()
#   ..$ FHx         : list()
#   ..$ Exam        : list()
#   ..$ Social      :List of 6
#   ..$ Behavioral  : list()
#   ..$ Unclassified: list()
#   ..$ Calculated  : list()
#  $ VarNames.select: list()
#  $ ModelList      : list()



##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  
## :: f_objectname.size.write_rds.git_lfs_track_add_f ====  
# Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.dev.r
# Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.source-exported.r
# https://chatgpt.com/c/670e6d4b-ea28-800e-87fe-85897601601a 
# https://gemini.google.com/app/6d9de55c5c7085c6 


options(DEVMODE = TRUE)
options(DEBUGMODE = TRUE)
options(DEBUGMODE = FALSE)
if(isTRUE(getOption("DEVMODE"))) source.force_reload(file.path.paste0_collapse_if_not_empty(env1$path$source_base, "Rdev/00_base_program/001_base_file/f_objectname.size.write_rds.git_lfs_track_add_f.source-exported.r"))


fhs.index100le10 = read_rds("data/fhs.index100le10.rds")
## *** Example Usage:  
env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(fhs.index100le10)
env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = "fhs.index100le10")
env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(fhs.index100le10, .path_file = "./data/fhs.index100le10.rds.xz")
# > env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(fhs.index100le10)
# 	fhs.index100le10 |> write_rds('NANAfhs.index100le10.rds', compress = 'gz', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	env1$f$f_path.size_files(.path4read = 'NA', regex4FileName = 'fhs.index100le10')  
# 	"git add -f 'NANAfhs.index100le10.rds'" |> system(intern=TRUE)  
# > env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = "fhs.index100le10")
# 	fhs.index100le10 |> write_rds('NANAfhs.index100le10.rds', compress = 'gz', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	env1$f$f_path.size_files(.path4read = 'NA', regex4FileName = 'fhs.index100le10')  
# 	"git add -f 'NANAfhs.index100le10.rds'" |> system(intern=TRUE)  
# > env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(fhs.index100le10, .path_file = "./data/fhs.index100le10.rds.xz")
# 	fhs.index100le10 |> write_rds('./data/fhs.index100le10.rds.xz', compress = 'xz', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	env1$f$f_path.size_files(.path4read = 'NA', regex4FileName = 'fhs.index100le10')  
# 	"git add -f './data/fhs.index100le10.rds.xz'" |> system(intern=TRUE)

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
MetaData %>% env1$f$f_objectname.size.write_rds.git_lfs_track_add_f()
# > MetaData %>% env1$f$f_objectname.size.write_rds.git_lfs_track_add_f()
# Warning in env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.) :
#   .objectname == "."   #@ sys.nframe() == 2  
# 
# -> Trying: ls(envir = .GlobalEnv, all.names = TRUE) %>% set_names %>% map(get) %>% keep(function(object) identical(object, .object)) %>% names
# 	MetaData |> write_rds('Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds', compress = 'gz', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	env1$f$f_path.size_files(.path4read = 'Rdev/10_import_clean_datatype/16_categorical_labelled', regex4FileName = 'MetaData')  
# 	"git add -f 'Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds'" |> system(intern=TRUE)  

MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f()
MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(createBACKUP = TRUE)
MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# > MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f()
# 	MetaData |> write_rds('Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds', compress = 'gz', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	env1$f$f_path.size_files(.path4read = 'Rdev/10_import_clean_datatype/16_categorical_labelled', regex4FileName = 'MetaData')  
# 	"git add -f 'Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds'" |> system(intern=TRUE)  
# > MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(createBACKUP = TRUE)
# 	env1$env.internal.attach$f_FileNameExt.createBACKUP(BACKUP_from_path_FileNameExt = "Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds", .BACKUP_to_path="-BACKUP", timeFormat="%y%m%d_%H", overwrite=TRUE)  
# 	MetaData |> write_rds('Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds', compress = 'gz', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	env1$f$f_path.size_files(.path4read = 'Rdev/10_import_clean_datatype/16_categorical_labelled', regex4FileName = 'MetaData')  
# 	"git add -f 'Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds'" |> system(intern=TRUE)  
# > MetaData |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# 	MetaData |> write_rds('Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds', compress = 'gz', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	"git add -f 'Rdev/10_import_clean_datatype/16_categorical_labelled/MetaData.rds'" |> system(intern=TRUE)  

.objectname |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f()
# > .objectname |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f()
# stop: Error: is.character(.object) && length(.object) == 1 --> Did you provide an object name instead of the object itself?
# 

env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = .objectname, path.size_files = FALSE)
env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = "MetaData", path.size_files = FALSE)
# > env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = .objectname, path.size_files = FALSE)
# MetaData |> write_rds('/home/rstudio/github_tidystat/MetaData.rds', compress = 'gz', compression = 9L) |> system.time()  
# "git add -f '/home/rstudio/github_tidystat/MetaData.rds'" |> system(intern=TRUE)  
# > env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = "MetaData", path.size_files = FALSE)
# MetaData |> write_rds('/home/rstudio/github_tidystat/MetaData.rds', compress = 'gz', compression = 9L) |> system.time()  
# "git add -f '/home/rstudio/github_tidystat/MetaData.rds'" |> system(intern=TRUE)  







##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#@ Rdev/00_base_program/f_objectsize_unit.create.dev.r ----
## f_objectsize_in_bytes.create = function(objectsize_in_bytes = 1 * 1024^2) ----
f_objectsize_in_bytes.create = function(objectsize_in_bytes = 1 * 1024^2) { 
    .object = numeric(objectsize_in_bytes/8) 
}
2^20
f_objectsize_in_bytes.create(2^20) |> object.size()
# > 2^20
# [1] 1048576
# > f_objectsize_in_bytes.create(2^20) |> object.size()
# 1048624 bytes


# f_objectsize_in_bytes.create(2^20) |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# # > f_objectsize_in_bytes.create(2^20) |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# # Error in get(.objectname) : 
# #   object 'f_objectsize_in_bytes.create(2^20)' not found
# # Called from: get(.objectname)



tmp.object = f_objectsize_in_bytes.create(2^19); tmp.object |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
tmp.object = f_objectsize_in_bytes.create(2^20); tmp.object |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
tmp.object = f_objectsize_in_bytes.create(10 * 2^20); tmp.object |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
tmp.object = f_objectsize_in_bytes.create(100 * 2^20); tmp.object |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# > tmp.object = f_objectsize_in_bytes.create(2^19); tmp.object |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# 	tmp.object |> write_rds('/home/rstudio/github_tidystat/tmp.object.rds', compress = 'gz', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	"git add -f '/home/rstudio/github_tidystat/tmp.object.rds'" |> system(intern=TRUE)  
# > tmp.object = f_objectsize_in_bytes.create(2^20); tmp.object |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# 	tmp.object |> write_rds('/home/rstudio/github_tidystat/tmp.object.rdsNA', compress = 'xz', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	"git add -f '/home/rstudio/github_tidystat/tmp.object.rdsNA'" |> system(intern=TRUE)  
# > tmp.object = f_objectsize_in_bytes.create(10 * 2^20); tmp.object |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# 	tmp.object |> write_rds('/home/rstudio/github_tidystat/tmp.object.rdsNA', compress = 'xz', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	"git lfs track '/home/rstudio/github_tidystat/tmp.object.rdsNA'" |> system(intern=TRUE)  
# 	"git add -f '/home/rstudio/github_tidystat/tmp.object.rdsNA'" |> system(intern=TRUE)  
# > tmp.object = f_objectsize_in_bytes.create(100 * 2^20); tmp.object |> env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(path.size_files = FALSE)
# Warning: object.size(get(.objectname)) >= 1e8 --> The object is too large to compress in R. Consider compressing the file in a dedicated compression software after saving an uncompressed rds file.
# 	tmp.object |> write_rds('/home/rstudio/github_tidystat/tmp.object.rds', compress = '', compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")  
# 	"git lfs track '/home/rstudio/github_tidystat/tmp.object.rds'" |> system(intern=TRUE)  
# 	"git add -f '/home/rstudio/github_tidystat/tmp.object.rds'" |> system(intern=TRUE)  







