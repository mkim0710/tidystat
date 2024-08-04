.sourcename = "f_df.t.tribble_construct" |> paste0(".source.r")  
if(Sys.getenv("print.intermediate")==TRUE) { print(paste0('Sourcing: "',.sourcename,'"')) }  
# # f_df.t.tribble_construct.source.r
# # f_df.t.tribble_construct.source.r
# # f_df.transpose.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/f_df.t.tribble_construct.dev.r
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/f_df.t.tribble_construct.source.r")
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
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
if (requireNamespace("rstudioapi")) {
    if(Sys.getenv("print.intermediate")==TRUE) {.CodeText2Print = 'requireNamespace("rstudioapi")'; print(ifelse(is.null(eval(parse(text=.CodeText2Print))), paste0("is.null(",.CodeText2Print,") == TRUE"), paste0(.CodeText2Print," == ",eval(parse(text=.CodeText2Print)))))}  
    if (rstudioapi::isAvailable()) {
        env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
    } else { if(Sys.getenv("print.intermediate")==TRUE) print('rstudioapi::isAvailable() == FALSE') }
    if(Sys.getenv("print.intermediate")==TRUE) {.CodeText2Print = 'env1$path$CurrentSource.path.filename.ext'; print(ifelse(is.null(eval(parse(text=.CodeText2Print))), paste0("is.null(",.CodeText2Print,") == TRUE"), paste0(.CodeText2Print," == ",eval(parse(text=.CodeText2Print)))))}  
} else { if(Sys.getenv("print.intermediate")==TRUE) print('requireNamespace("rstudioapi") == FALSE') }
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) source -----  
### @ .subpath, .sourcename ======  
.subpath = r"()" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(.subpath!="") utils::browseURL(normalizePath(.subpath))
.sourcename = "f_df.t.tribble_construct" |> paste0(".source.r")
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


library(tidyverse)
if(!exists(".tmp", envir=.GlobalEnv)) { assign(".tmp", list(), envir=.GlobalEnv) }  
if(!exists("env1", envir=.GlobalEnv)) { assign("env1", new.env(), envir=.GlobalEnv) }
if(!"env.internal" %in% names(.GlobalEnv$env1)) { .GlobalEnv$env1$env.internal <- new.env() }
if(!"f" %in% names(.GlobalEnv$env1)) { .GlobalEnv$env1$f <- list() }


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@ env1$env.internal functions ----  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## \$ .tmp\$objectname = "f_df.t.tribble_construct" ----  


env1$env.internal$custom_context <- function(output_mode = "console", nspc = 2, indent_context = 0, indent_head = TRUE){
  output_context <- list(output_mode = output_mode, nspc = nspc, indent_context = indent_context, indent_head = indent_head)
  output_context
}
.tmp$objectname = "f_df.t.tribble_construct"
.tmp$object = function(df) {
    out = env1$env.internal$tribble_construct(df)
    cat(out)
}
if(!.tmp$objectname %in% names(.GlobalEnv$env1$f)) {
    packageStartupMessage(paste0("Loading: ", ".GlobalEnv$env1$f$", .tmp$objectname))
    .GlobalEnv$env1$f[[.tmp$objectname]] = .tmp$object
    # cat("> .GlobalEnv$env1$f$",.tmp$objectname,"()\n",sep=""); get(f[[.tmp$objectname]], envir=.GlobalEnv$env1)() # Run the loaded function by default
}

env1$env.internal$f_function.load2env.internal = function(function_object, function_name, env1_subenv_name = "env.internal") {
    if(!function_name %in% names(.GlobalEnv$env1[[env1_subenv_name]])) {
        packageStartupMessage(paste0("Loading: ", ".GlobalEnv$env1$",env1_subenv_name,"$", function_name))
        .GlobalEnv$env1[[env1_subenv_name]][[function_name]] = function_object
        # cat("> .GlobalEnv$env1$",env1_subenv_name,"$",function_name,"()\n",sep=""); get(.GlobalEnv$env1[[env1_subenv_name]][[function_name]], envir=.GlobalEnv$env1)() # Run the loaded function by default
    }
}


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@ env1$f functions ----  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## \$ .tmp\$objectname = "f_df.t.tribble_construct" ----  
# fun.tribble_paste = env1$env.internal$tribble_paste
# fun.t.tribble_paste = function(df) {df %>% t |> as.data.frame() %>% rownames_to_column("varname") %>% fun.tribble_paste}
.tmp$objectname = "f_df.t.tribble_construct"
.tmp$object = function(df) {
    out = env1$env.internal$tribble_construct(df)
    cat(out)
}
if(!.tmp$objectname %in% names(.GlobalEnv$env1$f)) {
    packageStartupMessage(paste0("Loading: ", ".GlobalEnv$env1$f$", .tmp$objectname))
    .GlobalEnv$env1$f[[.tmp$objectname]] = .tmp$object
    # cat("> .GlobalEnv$env1$f$",.tmp$objectname,"()\n",sep=""); get(f[[.tmp$objectname]], envir=.GlobalEnv$env1)() # Run the loaded function by default
}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/f_df.transpose.dev.r
## \$ .tmp\$objectname = "f_df.transpose" ----  
.tmp$objectname = "f_df.transpose"
.tmp$object = function(df, varname4rowname = "varname") {
    if(varname4rowname %in% colnames(df)) df = df %>% column_to_rownames(var = varname4rowname)
    out = df %>% t |> as.data.frame() %>% rownames_to_column(varname4rowname) |> as_tibble()
    out
}                                    
if(!.tmp$objectname %in% names(.GlobalEnv$env1$f)) {
    packageStartupMessage(paste0("Loading: ", ".GlobalEnv$env1$f$", .tmp$objectname))
    .GlobalEnv$env1$f[[.tmp$objectname]] = .tmp$object
    # cat("> .GlobalEnv$env1$f$",.tmp$objectname,"()\n",sep=""); get(f[[.tmp$objectname]], envir=.GlobalEnv$env1)() # Run the loaded function by default
}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## \$ .tmp\$objectname = "f_df.t.tribble_construct" ----  
.tmp$objectname = "f_df.t.tribble_construct"
.tmp$object = function(df) {
    out = env1$f$f_df.transpose(df)
    out = env1$env.internal$tribble_construct(out)
    cat(out)
}
if(!.tmp$objectname %in% names(.GlobalEnv$env1$f)) {
    packageStartupMessage(paste0("Loading: ", ".GlobalEnv$env1$f$", .tmp$objectname))
    .GlobalEnv$env1$f[[.tmp$objectname]] = .tmp$object
    # cat("> .GlobalEnv$env1$f$",.tmp$objectname,"()\n",sep=""); get(f[[.tmp$objectname]], envir=.GlobalEnv$env1)() # Run the loaded function by default
}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_vec.dput_line_by_line.dev.r
## \$ .tmp\$objectname = "f_vec.dput_line_by_line" ----  
.tmp$objectname = "f_vec.dput_line_by_line"
# .tmp$object = function(vec) {
#     vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") |> paste0(collapse='",\n  "') |> paste0('c("',.,'")\n') |> cat("  \n", sep="")
# }
.tmp$object = function(vec, space_between_vec_elements="  \n  ", sep_parentheses = FALSE, end_of_text = "  \n") {
    if(space_between_vec_elements=="  \n  " && sep_parentheses == FALSE && end_of_text == "  \n") {
        vec |> paste0(collapse='",  \n  "') %>% {cat('c("',.,'")  \n', sep="")}  # env1$f$f_vec.dput_line_by_line(); |> paste0(collapse='",  \n  "') %>% {cat('c("',.,'")  \n', sep="")} ----
    } else {
        env1$env.internal$f_vec.format_line_by_line(vec, space_between_vec_elements, sep_parentheses, end_of_text) |> cat("  \n", sep="")
    }
}
if(!.tmp$objectname %in% names(.GlobalEnv$env1$f)) {
    packageStartupMessage(paste0("Loading: ", ".GlobalEnv$env1$f$", .tmp$objectname))
    .GlobalEnv$env1$f[[.tmp$objectname]] = .tmp$object
    # cat("> .GlobalEnv$env1$f$",.tmp$objectname,"()\n",sep=""); get(f[[.tmp$objectname]], envir=.GlobalEnv$env1)() # Run the loaded function by default
}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
env1$env.internal$f_vec.format_line_by_line <- function(vec, space_between_vec_elements="\n  ", sep_parentheses = FALSE, end_of_text = "\n") {
    # vec |> paste0(collapse='",  \n  "') %>% {cat('c("',.,'")  \n', sep="")}  # env1$f$f_vec.dput_line_by_line(); |> paste0(collapse='",  \n  "') %>% {cat('c("',.,'")  \n', sep="")} ----
    # vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c("',paste0(., collapse='",\n  "'),'")\n')} |> cat("  \n", sep="")
    if (is.null(vec)) {
        return("NULL")
    } else {
        vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% {paste0('c(',ifelse(sep_parentheses,space_between_vec_elements,""),'"',paste0(., collapse=paste0('",',space_between_vec_elements,'"')),'"',ifelse(sep_parentheses,str_extract(space_between_vec_elements,"\n"),""),')',end_of_text)}
    }
}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_list.dput_line_by_line.dev.r
## \$ .tmp\$objectname = "f_list.dput_line_by_line" ----  
.tmp$objectname = "f_list.dput_line_by_line"
.tmp$object = function(list_vec, space_between_vec_elements="\n         ", space_between_list_elements = "\n     ", sep_parentheses = FALSE, end_of_text = "\n") {
    env1$env.internal$f_list.format_line_by_line(list_vec, space_between_vec_elements, space_between_list_elements, sep_parentheses, end_of_text) |> cat("  \n", sep="")
}
if(!.tmp$objectname %in% names(.GlobalEnv$env1$f)) {
    packageStartupMessage(paste0("Loading: ", ".GlobalEnv$env1$f$", .tmp$objectname))
    .GlobalEnv$env1$f[[.tmp$objectname]] = .tmp$object
    # cat("> .GlobalEnv$env1$f$",.tmp$objectname,"()\n",sep=""); get(f[[.tmp$objectname]], envir=.GlobalEnv$env1)() # Run the loaded function by default
}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#
env1$env.internal$f_list.format_line_by_line <- function(list_vec, space_between_vec_elements="\n         ", space_between_list_elements = "\n     ", sep_parentheses = FALSE, end_of_text = "\n") {
    .f_vec.paste_collapse <- function(vec, space_between_vec_elements="\n") {
        if (is.null(vec)) {
            return("NULL")
        } else {
            vec |> str_replace_all("\\\\","\\\\\\\\") |> str_replace_all("\"","\\\\\"") %>% paste0('"',.,'"') |> paste0(collapse=paste0(",",space_between_vec_elements))
        }
    }
    
    list_vec.formatted <- map(names(list_vec), function(name) {
        paste0('"', name, '" = c(', space_between_vec_elements, .f_vec.paste_collapse(list_vec[[name]], space_between_vec_elements), ")")
    })
    paste0("list(", ifelse(sep_parentheses,space_between_list_elements,""), paste0(list_vec.formatted, collapse = paste0(",",space_between_list_elements)), ifelse(sep_parentheses,str_extract(space_between_list_elements,"\n"),""), ")", end_of_text)
}


#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## \$ .tmp\$objectname = "f_vec1_vec2.setdiff" ----  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/f_vec1_vec2.setdiff.dev.r
.tmp$objectname = "f_vec1_vec2.setdiff"
.tmp$object = function(vec1, vec2) {
    out = list()
    out$vec1.character = vec1 = as.character(vec1)
    out$vec2.character = vec2 = as.character(vec2)
    out$union = union(vec1, vec2)
    out$intersect = intersect(vec1, vec2)
    out$setdiff_1_2 = setdiff(vec1, vec2)
    out$setdiff_2_1 = setdiff(vec2, vec1)
    out$identical = all.equal(vec1, vec2)
    out
}
if(!.tmp$objectname %in% names(.GlobalEnv$env1$f)) {
    packageStartupMessage(paste0("Loading: ", ".GlobalEnv$env1$f$", .tmp$objectname))
    .GlobalEnv$env1$f[[.tmp$objectname]] = .tmp$object
    # cat("> .GlobalEnv$env1$f$",.tmp$objectname,"()\n",sep=""); get(f[[.tmp$objectname]], envir=.GlobalEnv$env1)() # Run the loaded function by default
}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## \$ .tmp\$objectname = "f_df.print_byVar" ----  
# https://github.com/mkim0710/tidystat/blob/master/Rdev/60_communicate_report_export/f_df.print_byVar.dev.r  
.tmp$objectname = "f_df.print_byVar"
.tmp$object = function(df, byVar, n = NULL) {
    byVar <- enquo(byVar)
    df = df |> as_tibble()
    if(!"Num" %in% names(df)) df = df |> rownames_to_column("Num") |> mutate(Num = Num |> as.integer())
    df |>
        mutate(!!quo_name(byVar) := as.character(!!byVar) |> replace_na("N/A")) %>% 
        by(INDICES = .[[quo_name(byVar)]], function(df_subset) {df_subset |> dplyr::select(-!!quo_name(byVar))}) |> 
        print(n = n)
}
if(!.tmp$objectname %in% names(.GlobalEnv$env1$f)) {
    packageStartupMessage(paste0("Loading: ", ".GlobalEnv$env1$f$", .tmp$objectname))
    .GlobalEnv$env1$f[[.tmp$objectname]] = .tmp$object
    # cat("> .GlobalEnv$env1$f$",.tmp$objectname,"()\n",sep=""); get(f[[.tmp$objectname]], envir=.GlobalEnv$env1)() # Run the loaded function by default
}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@ for (.dependancy in c("")) { -----  
for (.dependancy in c("f_path.size_files")) {
    if(!.dependancy %in% names(.GlobalEnv$env1)) {
        if(Sys.getenv("print.intermediate")==TRUE) { print(paste0("sys.nframe() = ", sys.nframe())) }
        .sourcename = .dependancy |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
    }
}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----  
# cat("* To revert to the last commited file, run the following terminal command:\n", 
#     '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# ls.str(env1) #-----  
# ls.str(env1$env.internal) #-----  
