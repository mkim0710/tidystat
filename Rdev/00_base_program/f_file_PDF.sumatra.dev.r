# sourcename = "f_file_PDF.sumatra" |> paste0(".source.r")
# f_file_PDF.sumatra.dev.r
# f_file_PDF.sumatra.source.r
# utils::browseURL("https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_file_PDF.sumatra.dev.r")
# source(paste0(env1$path$source_base,"/","Rdev/00_base_program/f_file_PDF.sumatra.source.r"))
# # source("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_base_program/f_file_PDF.sumatra.source.r")
# # source("https://github.com/mkim0710/tidystat/raw/master/Rdev/00_base_program/f_file_PDF.sumatra.source.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_base_program/f_file_PDF.sumatra.dev.r")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_base_program/f_file_PDF.sumatra.dev.Rmd")
# # file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/00_base_program/f_file_PDF.sumatra.source.r")
# "D:/OneDrive/[][Rproject]/github_tidystat/env1$env.internal.source.r" %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)})
#|________________________________________________________________________________|#  
# https://github.com/rstudio/rstudio/issues/14370
# https://stackoverflow.com/questions/77447391/how-to-set-sumatra-as-default-pdf-viewer-in-rstudio
# https://github.com/brry/berryFunctions/blob/master/R/sumatraInitialize.R
# https://github.com/brry/berryFunctions/blob/master/R/f_file_PDF.sumatra.R
# https://github.com/brry/berryFunctions/blob/master/R/pdfpng.R
# https://github.com/brry/berryFunctions/blob/master/inst/extdata/sumatrapdfrestrict.ini
# https://github.com/brry/berryFunctions/blob/master/inst/extdata/SumatraPDF-settings.txt
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
# paste0("[Working Files List] ",basename(getwd()),".r") |> file.edit()
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# "https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R" %>% paste0("if (.Platform$OS.type == 'windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }") %>% {eval(parse(text=.))}  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R"  
# "https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd" %>% paste0("if (.Platform$OS.type == 'windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }") %>% {eval(parse(text=.))}  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd"  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# sourcename = "function.detachAllPackages" |> paste0(".source.r"); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); if(!sourcename %in% names(env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(env1$source[[sourcename]])}
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# "https://github.com/mkim0710/tidystat/blob/master/.Rprofile" %>% paste0("if (.Platform$OS.type == 'windows') { '\"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe\" --app=\"",.,"\"' |> system(intern=TRUE) } else { utils::browseURL('",.,"') }") %>% {eval(parse(text=.))}  
# cmd /C "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="https://github.com/mkim0710/tidystat/blob/master/.Rprofile"    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile"); .First()}
if(!".Rprofile" %in% names(env1$source)) {source("https://github.com/mkim0710/tidystat/raw/master/.Rprofile"); .First()}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## env1\$path ====
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  \n", sep="  \n")
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
if (requireNamespace("rstudioapi")) {
    if(env1$print.intermediate) {CodeText2Print = 'requireNamespace("rstudioapi")'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}; 
    if (rstudioapi::isAvailable()) {
        env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(env1$path$path1|>normalizePath(winslash="/")), "") |> str_replace("^/", "");
    } else { if(env1$print.intermediate) print('rstudioapi::isAvailable() == FALSE') }
    if(env1$print.intermediate) {CodeText2Print = 'env1$path$CurrentSource.path.filename.ext'; print(ifelse(is.null(eval(parse(text=CodeText2Print))), paste0("is.null(",CodeText2Print,") == TRUE"), paste0(CodeText2Print," == ",eval(parse(text=CodeText2Print)))))}; 
} else { if(env1$print.intermediate) print('requireNamespace("rstudioapi") == FALSE') }
file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)})
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) source -----
### \$ subpath, sourcename ======




subpath=r"(Rdev/00_base_program)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "f_file_PDF.sumatra" |> paste0(".source.r")
# \% source( file.path(env1$path$source_base,subpath.filename.source.r) ) ----
subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename); 
if(!sourcename %in% names(env1$source)) {cat('> source("',file.path(env1$path$source_base,subpath.filename.source.r),'")', "  \n", sep=""); env1$source[[sourcename]] = file.path(env1$path$source_base,subpath.filename.source.r); source(env1$source[[sourcename]])}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
env1$path$subpath = subpath
sourcename_root = sourcename |> str_replace("\\.source\\.r$", "")
env1$path$sourcename_root = sourcename_root  
env1$path$subpath.filename.dev.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.r")
env1$path$subpath.filename.dev.Rmd = paste0(subpath,ifelse(subpath=="","","/"),sourcename_root,".dev.Rmd")
env1$path$subpath.filename.source.r = paste0(subpath,ifelse(subpath=="","","/"),sourcename)
cat("# ",'sourcename_root = "',sourcename_root,'"', "  \n",
    "# ",sourcename_root,".dev.r", "  \n",
    "# ",sourcename_root,".source.r", "  \n",
    '# utils::browseURL("',env1$path$source_base_github_blob,"/",env1$path$subpath.filename.dev.r,'")', "  \n",
    '# source(paste0(env1$path$source_base,"/","',env1$path$subpath.filename.source.r,'"))', "  \n",
    '# # source("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "  \n",
    '# # source("',env1$path$source_base_github,"/",env1$path$subpath.filename.source.r,'")', "  \n",
    '# # file.copy(from = "',file.path(env1$path$source_base_github,"rstudio-prefs","templates","default.R"), '",  \n# #           to = "',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'")', "  \n",
    '# # file.copy(from = "',file.path(env1$path$source_base_github,"rstudio-prefs","templates","templates-00env1.minimum.Rmd"), '",  \n# #           to = "',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'")', "  \n",
    '# # file.copy(from = "',file.path(env1$path$source_base_github,"rstudio-prefs","templates","default.R"), '",  \n# #           to = "',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.dev.Rmd,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$subpath.filename.source.r,'")', "  \n",
    sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ RUN ALL ABOVE: CTRL+ALT+B -----
#| RUN ALL ABOVE: CTRL+ALT+B |#
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# #@@ START -----


# Function to open PDF with Sumatra PDF
env1$env.internal$f_file_PDF.sumatra <- function(
        file,
        path.SumatraPDF.exe = NULL,
        ...
) {
    potentialPaths <- c(
        file.path(Sys.getenv("LOCALAPPDATA"), "SumatraPDF", "SumatraPDF.exe"),
        file.path(Sys.getenv("APPDATA"), "SumatraPDF", "SumatraPDF.exe"),
        file.path(sub("rstudio.exe$", "", Sys.getenv("RSTUDIO_DESKTOP_EXE")), "resources/app/bin/sumatra/SumatraPDF.exe")
    )
    # If path.SumatraPDF.exe is not provided, find the first existing path from the list
    if (is.null(path.SumatraPDF.exe)) { path.SumatraPDF.exe <- potentialPaths[which(file.exists(potentialPaths))[1]] }
    # If no valid Sumatra executable found, use the system default application
    if (is.null(path.SumatraPDF.exe) || !file.exists(path.SumatraPDF.exe)) {
        warning("SumatraPDF.exe not found. Opening file with the system default viewer instead.", call. = FALSE)
        return(invisible(env1$env.internal$f_file.systemStart(file)))
    }
    file <- normalizePath(file, winslash = "/", mustWork = FALSE)
    path.SumatraPDF.exe <- normalizePath(path.SumatraPDF.exe, winslash = "/", mustWork = FALSE)
    if (!file.exists(file)) {
        stop(paste("The following file doesn't exist:", file))
    }
    # Ignore non-PDF files
    pdf <- grepl(".pdf$", file)
    if (any(!pdf)) {
        warning("Ignoring non-PDF file", paste(file[!pdf], collapse = ", "))
        file <- file[pdf]
    }
    if (length(file) < 1) return("No files were left to open with SumatraPDF.exe")
    # Construct the command to open SumatraPDF
    sumafile <- paste(shQuote(c(path.SumatraPDF.exe, file)), collapse = " ")
    out <- try(system(sumafile, wait = FALSE, ...), silent = TRUE)
    return(invisible(out))
}

# Function to open files with the system's default application (fallback)
env1$env.internal$f_file.systemStart <- function(file) {
    system(paste("start", shQuote(file)), wait = FALSE, ignore.stdout = TRUE, ignore.stderr = TRUE)
}


# Example usage:
# render_and_open_sumatra <- function(file) {
#   output_file <- rmarkdown::render(file)
#   f_file_PDF.sumatra(output_file)
# }

# render_and_open_sumatra("your_document.Rmd")


# f_file_PDF.sumatra("D:/OneDrive/[Note]/[Note] Stat/[[Stat]] CRAN R/[[[[R]]]] Cheatsheets/[[[[Cheat Sheets]]]] RStudio/data-import & transformation cheatsheet 2017.01.pdf")





filename.r = "env1$env.internal" |> paste0(c(".source.r",".dev.r")); subpath=r"()"|>str_replace_all("\\\\","/"); subpath.filename.r = paste0(subpath,ifelse(subpath=="","","/"),filename.r); file.path(env1$path$source_base, subpath.filename.r) %>% {.[file.exists(.)]} |> file.edit(); file.edit(env1$path$CurrentSource.path.filename.ext %>% {paste0(env1$path$path1,"/",.)})







#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:\n", 
    '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"  \n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
