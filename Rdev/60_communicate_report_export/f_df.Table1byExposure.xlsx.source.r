# .FileName.source.r = "f_df.Table1byExposure.xlsx" |> paste0(".source.r")
# f_df.Table1byExposure.xlsx.dev.r
# f_df.Table1byExposure.xlsx.source.r
# utils::browseURL("/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.dev.r")
# source(paste0(env1$path$source_base,"/","Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.source.r"))
# # source("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.source.r")
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.dev.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.dev.Rmd")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.source.r")
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
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
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# paste0("[Working Files List] ",basename(getwd()),".r") %>% {paste0(env1$path$path1,"/",.)} |> env1$env.internal.attach$f_file.edit_if_exists.return2LastSourceEditorContext()  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/",mustWork=NA) ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (Sys.info()['sysname'] == 'Windows') { "." |> normalizePath(winslash="/",mustWork=NA) |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_FileNameExt ====  
# # *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# # .tmp$LastSourceEditorContext.path_FileNameExt = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA)    # Caution) not a relative path~!  
# env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_FileNameExt(check_rstudioapi = TRUE, overwrite = TRUE)
# if(env1$f$f_object.is_not_null.nor_na.nor_blank(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  




##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# https://chatgpt.com/c/8aa3dbae-b089-410e-8f06-54dcfea1a0af
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  
## @ .RelativeSubPath, .FileName.source.r ======  
.RelativeSubPath = r"(Rdev/60_communicate_report_export)" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(.RelativeSubPath!="") .RelativeSubPath |> normalizePath(winslash="/",mustWork=TRUE) |> utils::browseURL() |> try()
.FileName.source.r = "f_df.Table1byExposure.xlsx" |> paste0(".source.r")
### \% source( file.path(env1$path$source_base,.RelativeSubPath_FileName.source.r) ) ----  
# env1$f$f_sourcePath.execute_if_not_sourced(.RelativeSubPath_FileName.source.r = list(.RelativeSubPath, .FileName.source.r) %>% {.[nzchar(.)]} %>% c(fsep = "/") %>% {do.call(file.path, .)})
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  


env1$f$f_df.Table1byExposure.xlsx = function(DS.DNR.select, DSN4output = "DS", VarNames4Exposure =  c("InterventionGroup"), output.sink = FALSE, output.xlsx = TRUE, Table1byExposure.print = TRUE) {
    # for(.packagename in c("tidyverse", "tableone")) {if(!require(.packagename,character.only=TRUE)) install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}  
    .packagename = "tableone"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}

    DSN4output.select = paste0(DSN4output,".select")
    DSN4output.Table1byExposure = paste0(DSN4output,".Table1by", VarNames4Exposure)
    DSN4output.is.na.Table1byExposure = paste0(DSN4output,".is.na.Table1by", VarNames4Exposure)
    .objectname = "DSN4output.select"; cat("> ", .objectname, " = ", deparse(get(.objectname)), "  \n", sep="") 
    .objectname = "DSN4output.Table1byExposure"; cat("> ", .objectname, " = ", deparse(get(.objectname)), "  \n", sep="") 
    .objectname = "DSN4output.is.na.Table1byExposure"; cat("> ", .objectname, " = ", deparse(get(.objectname)), "  \n", sep="") 
    # > DSN4output.select |> cat("  \n", sep="") ###### |> cat("  \n", sep="") ----
    # CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.select
    # > DSN4output.Table1byExposure |> cat("  \n", sep="") ###### |> cat("  \n", sep="") ----
    # CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.Table1bySEX
    # > DSN4output.is.na.Table1byExposure |> cat("  \n", sep="") ###### |> cat("  \n", sep="") ----
    # CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.is.na.Table1bySEX
    
    # CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.Table1by_SEX = CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds %>% select(-rowname, -PERSON_ID) |> as.data.frame() %>% 
    #     CreateTableOne(strata = VarNames4Exposure, data = ., test = T, includeNA = T, addOverall = T)
    
    # browser()
    assign(DSN4output.Table1byExposure, 
           DS.DNR.select %>% 
               {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 10) )]} |> as.data.frame() %>%  # debug181115 not to remove numeric 
               CreateTableOne(strata = VarNames4Exposure, data = ., test = T, includeNA = T, addOverall = T)
    )
    assign(DSN4output.is.na.Table1byExposure, 
           DS.DNR.select %>% 
               {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 10) )]} %>%
               map_df(is.na) %>% setNames(paste0(names(.), ".is.na") |> str_replace_all("\\`", "")) %>%  # debug) Error in parse(text = x, keep.source = FALSE)
               # mutate( !!rlang::sym(VarNames4Exposure) := CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.select[[VarNames4Exposure]]) %>%
               cbind(DS.DNR.select[VarNames4Exposure]) |>
               as.data.frame() %>%
               CreateTableOne(strata = VarNames4Exposure, data = ., test = T, includeNA = T, addOverall = T)
    )
    
    Vars4IQR = names(DS.DNR.select)[DS.DNR.select %>% map_lgl(is.numeric)]
    # get(DSN4output.Table1byExposure) |> print(showAllLevels = F, smd = T) # |> print(showAllLevels = F, smd = T) ----
    # get(DSN4output.Table1byExposure) |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) # |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) ----
    # get(DSN4output.is.na.Table1byExposure) |> print(showAllLevels = F, smd = T) # |> print(showAllLevels = F, smd = T) ----

    if(output.sink) {
        sink(paste0(env1$path$LastSourceEditorContext.path,"/",DSN4output.Table1byExposure, " -AllLevels.txt"), append = FALSE)
        get(DSN4output.Table1byExposure) |> print(showAllLevels = F, smd = T) # |> print(showAllLevels = F, smd = T) ----
        sink()
        sink(paste0(env1$path$LastSourceEditorContext.path,"/",DSN4output.Table1byExposure, " -AllLevels -IQR.txt"), append = FALSE)
        get(DSN4output.Table1byExposure) |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) # |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) ----
        sink()
        sink(paste0(env1$path$LastSourceEditorContext.path,"/",DSN4output.is.na.Table1byExposure, " -AllLevels(is.na).txt"), append = FALSE)
        get(DSN4output.is.na.Table1byExposure) |> print(showAllLevels = F, smd = T) # |> print(showAllLevels = F, smd = T) ----
        sink()
    }
    
    # =NUMBERVALUE(MID(B2,1,SEARCH("(",B2,1)-1)) ----            
    DS.is.na.Table1byExposure.print = get(DSN4output.is.na.Table1byExposure) |> print(showAllLevels = F, smd = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) |> as_tibble(rownames = "Variable")
    # DS.is.na.Table1byExposure.print |> print(n=99) ###### |> print(n=99) ----
    
    DS.Table1byExposure.print = get(DSN4output.Table1byExposure) |> print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) |> as_tibble(rownames = "Variable")
    DS.Table1byExposure.print_showAllLevels = get(DSN4output.Table1byExposure) |> print(showAllLevels = T, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) |> as_tibble(rownames = "Variable")
    DS.Table1byExposure.print_showAllLevels.IQR = get(DSN4output.Table1byExposure) |> print(showAllLevels = T, smd = T, nonnormal = Vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) |> as_tibble(rownames = "Variable")
    # DS.Table1byExposure.print |> print(n=99) ###### |> print(n=99) ----
    if(Table1byExposure.print) DS.Table1byExposure.print |> as.data.frame() |> print()
    # DS.Table1byExposure.print_showAllLevels |> print(n=5) ###### |> print(n=5) ----
    # DS.Table1byExposure.print_showAllLevels.IQR |> print(n=5) ###### |> print(n=5) ----
    
    # DS.Table1byExposure.print %>% writexl::write_xlsx(paste0(DSN4output.Table1byExposure, " -clean.xlsx"))
    # # if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open(paste0(DSN4output.Table1byExposure, " -clean.xlsx"))
    # DS.Table1byExposure.print_showAllLevels %>% writexl::write_xlsx(paste0(DSN4output.Table1byExposure, " -AllLevels -clean.xlsx"))
    # # if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open(paste0(DSN4output.Table1byExposure, " -AllLevels -clean.xlsx"))
    # DS.Table1byExposure.print_showAllLevels.IQR %>% writexl::write_xlsx(paste0(DSN4output.Table1byExposure, " -AllLevels -IQR -clean.xlsx"))
    # # if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open(paste0(DSN4output.Table1byExposure, " -IQR -clean.xlsx"))
    
    
    function.DS.Table1byExposure.print.addCols = function(DS.Table1byExposure.print) {
        DS.Table1byExposure.print %>% add_column(level = as.character(NA), .after = "Variable") %>% add_row(.before = 1) |> 
            as.data.frame() %>% {.[1,]=paste0(names(.), " (N = ", .[2,], ")");.[1,1]=VarNames4Exposure;.[1,c("p","test","SMD")]=c("p-value", "test", "SMD");.} %>% 
            select(-p, -test, p, test) %>%
            {names(.)[!names(.) %in% c("Variable", "level", "Overall", "SMD", "p", "test")] = paste0("Group ", 1:(ncol(.)-6));.} %>% 
            add_column(VarType = as.character(NA), .before = "Variable") %>%
            mutate(VarType = if_else(Variable |> str_detect("%"), "factor", VarType), Variable = Variable |> str_replace_all(" \\(%\\)", "")) %>% 
            mutate(VarType = if_else(Variable |> str_detect("^   "), "level", VarType), Variable = Variable |> str_replace_all(" \\(%\\)", "")) %>% 
            mutate(VarType = if_else(Variable |> str_detect("mean"), "numeric", VarType), Variable = Variable |> str_replace_all(" \\(mean \\(SD\\)\\)", "")) %>% 
            mutate(greatest = as.character(NA), G1geG2 = as.logical(NA), G1leG2 = as.logical(NA)) %>% 
            mutate(G1numeric = if_else(VarType == "numeric", `Group 1`, as.character(NA)), G2numeric = if_else(VarType == "numeric", `Group 2`, as.character(NA))) %>% separate(G1numeric, into = paste0("G1", c("mean", "sd")), sep = "[\\(\\)]") %>% separate(G2numeric, into = paste0("G2", c("mean", "sd")), sep = "[\\(\\)]") %>% 
            mutate(G1categorical = if_else(VarType %in% c("factor", "level"), `Group 1`, as.character(NA)), G2categorical = if_else(VarType %in% c("factor", "level"), `Group 2`, as.character(NA))) %>% separate(G1categorical, into = paste0("G1", c("n", "prop")), sep = "[\\(\\)]") %>% separate(G2categorical, into = paste0("G2", c("n", "prop")), sep = "[\\(\\)]") %>% 
            mutate_at(vars(matches("mean$"), matches("sd$"), matches("G[0-9]n$"), matches("prop$")), as.numeric) %>%
            mutate(G1geG2 = if_else(VarType == "numeric", G1mean >= G2mean, G1geG2), G1leG2 = if_else(VarType == "numeric", G1mean <= G2mean, G1leG2)) %>% 
            mutate(G1geG2 = if_else(VarType %in% c("factor", "level"), G1prop >= G2prop, G1geG2), G1leG2 = if_else(VarType %in% c("factor", "level"), G1prop <= G2prop, G1leG2)) %>% 
            mutate(greatest = paste0(if_else(G1geG2, "G1", ""), if_else(G1leG2, "G2", ""))) %>% 
            {add_column(., `#` = 1:nrow(.), `#2` = "", Class = "", .before = 1)} %>%    
            add_column(`p-value` = "", star = "   ", .before = "p") %>% mutate(`p-value` = p, p = as.numeric(if_else(p == "<0.001", "0", p))) %>% 
            mutate(star = case_when(p<0.001~"***", p<0.01~"** ", p<0.05~"*  ", p<0.1~".  ", is.na(p)~"   ", TRUE~"   ")) %>% 
            add_column(smd = as.numeric(NA), .before = "p") %>% mutate(smd = as.numeric(SMD)) %>% 
            add_column(Label = "", Level = "", .before = "Overall") %>% 
            as_tibble
    }
    
    function.df.edit_Label_Level = function(df) {
        df = df %>% 
            mutate(Level = if_else(VarType  == "level", Variable |> str_replace_all("^   ", ""), Level)) %>% 
            mutate(Level = if_else(Variable |> str_detect(" = "), Variable |> str_extract(" = .*$") |> str_replace_all("^ = ", ""), Level)) %>% 
            mutate(Level = if_else(Level == "TRUE", "", Level)) %>% 
            mutate(Level = if_else(Level == "NA", "N/A", Level)) %>% 
            mutate(Label = if_else(VarType  %in% c("factor", "numeric"), Variable, Label)) %>% 
            mutate(Label = if_else(Variable |> str_detect(" = "), Label |> str_extract("^.* = ") |> str_replace_all(" = $", ""), Label)) %>% 
            mutate(Label = Label |> str_replace_all("[_\\.]", " ")) %>%
            mutate(Label = Label |> str_replace_all("ge([0-9]+)lt([0-9]+)", "[\\1~,\\2)")) %>%
            mutate(Label = Label |> str_replace_all("gt([0-9]+)le([0-9]+)", "(\\1~,\\2]")) %>%
            mutate(Label = Label |> str_replace_all("gt([0-9]+)", ">\\1")) %>%
            mutate(Label = Label |> str_replace_all("ge([0-9]+)", ">=\\1")) %>%
            mutate(Label = Label |> str_replace_all("lt([0-9]+)", "<\\1")) %>%
            mutate(Label = Label |> str_replace_all("le([0-9]+)", "<=\\1")) %>%
            mutate(Label = Label |> str_replace_all("([a-z]+)([A-Z])", "\\1 \\2")) %>%
            as_tibble
        df
    }
    
    function.DS.Table1byExposure.print_showAllLevels.addCols = function(DS.Table1byExposure.print_showAllLevels) {
        DS.Table1byExposure.print_showAllLevels %>% add_row(.before = 1) |> 
            as.data.frame() %>% {.[1,]=paste0(names(.), " (N = ", .[2,], ")");.[1,1]=VarNames4Exposure;.[1,c("p","test","SMD")]=c("p-value", "test", "SMD");.} %>% 
            select(-p, -test, p, test) %>%
            {names(.)[!names(.) %in% c("Variable", "level", "Overall", "SMD", "p", "test")] = paste0("Group ", 1:(ncol(.)-6));.} %>% 
            add_column(VarType = as.character(NA), .before = "Variable") %>%
            mutate(VarType = if_else(Variable |> str_detect("%"), "factor", VarType), Variable = Variable |> str_replace_all(" \\(%\\)", "")) %>% 
            mutate(VarType = if_else(Variable |> str_detect("^   "), "level", VarType), Variable = Variable |> str_replace_all(" \\(%\\)", "")) %>% 
            mutate(VarType = if_else(Variable |> str_detect("mean"), "numeric", VarType), Variable = Variable |> str_replace_all(" \\(mean \\(SD\\)\\)", "")) %>% 
            mutate(greatest = as.character(NA), G1geG2 = as.logical(NA), G1leG2 = as.logical(NA)) %>% 
            mutate(G1numeric = if_else(VarType == "numeric", `Group 1`, as.character(NA)), G2numeric = if_else(VarType == "numeric", `Group 2`, as.character(NA))) %>% separate(G1numeric, into = paste0("G1", c("mean", "sd")), sep = "[\\(\\)]") %>% separate(G2numeric, into = paste0("G2", c("mean", "sd")), sep = "[\\(\\)]") %>% 
            mutate(G1categorical = if_else(VarType %in% c("factor", "level"), `Group 1`, as.character(NA)), G2categorical = if_else(VarType %in% c("factor", "level"), `Group 2`, as.character(NA))) %>% separate(G1categorical, into = paste0("G1", c("n", "prop")), sep = "[\\(\\)]") %>% separate(G2categorical, into = paste0("G2", c("n", "prop")), sep = "[\\(\\)]") %>% 
            mutate_at(vars(matches("mean$"), matches("sd$"), matches("G[0-9]n$"), matches("prop$")), as.numeric) %>%
            mutate(G1geG2 = if_else(VarType == "numeric", G1mean >= G2mean, G1geG2), G1leG2 = if_else(VarType == "numeric", G1mean <= G2mean, G1leG2)) %>% 
            mutate(G1geG2 = if_else(VarType %in% c("factor", "level"), G1prop >= G2prop, G1geG2), G1leG2 = if_else(VarType %in% c("factor", "level"), G1prop <= G2prop, G1leG2)) %>% 
            mutate(greatest = paste0(if_else(G1geG2, "G1", ""), if_else(G1leG2, "G2", ""))) %>% 
            {add_column(., `#` = 1:nrow(.), `#2` = "", Class = "", .before = 1)} %>%    
            add_column(`p-value` = "", star = "   ", .before = "p") %>% mutate(`p-value` = p, p = as.numeric(if_else(p == "<0.001", "0", p))) %>% 
            mutate(star = case_when(p<0.001~"***", p<0.01~"** ", p<0.05~"*  ", p<0.1~".  ", is.na(p)~"   ", TRUE~"   ")) %>% 
            add_column(smd = as.numeric(NA), .before = "p") %>% mutate(smd = as.numeric(SMD)) %>% 
            add_column(Label = "", Level = "", .before = "Overall") %>% 
            as_tibble
    }
    
    if(output.xlsx) {
        list(
            byExposure = DS.Table1byExposure.print %>% function.DS.Table1byExposure.print.addCols %>% function.df.edit_Label_Level
            , byExposure.AllLevels = DS.Table1byExposure.print_showAllLevels %>% function.DS.Table1byExposure.print_showAllLevels.addCols %>% function.df.edit_Label_Level %>% mutate(Level = level)
            , byExposure.IQR = DS.Table1byExposure.print_showAllLevels.IQR
            # , is.na.byExposure = DS.is.na.Table1byExposure.print
            # ) %>% writexl::write_xlsx(paste0(DSN4output.Table1byExposure, "(list).xlsx"))
        ) %>% writexl::write_xlsx(paste0(DSN4output.Table1byExposure, ".xlsx"))
        if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open(paste0(DSN4output.Table1byExposure, ".xlsx"))
    }
    
    return.list = list(
        DS.DNR.select = DS.DNR.select
        , DSN4output = DSN4output
        , VarNames4Exposure = VarNames4Exposure
        , DSN4output.Table1byExposure = DSN4output.Table1byExposure
        , DSN4output.is.na.Table1byExposure = DSN4output.is.na.Table1byExposure
        , Vars4IQR = Vars4IQR
        , DS.is.na.Table1byExposure.print = DS.is.na.Table1byExposure.print
        , DS.Table1byExposure.print = DS.Table1byExposure.print
        , DS.Table1byExposure.print_showAllLevels = DS.Table1byExposure.print_showAllLevels
        , DS.Table1byExposure.print_showAllLevels.IQR = DS.Table1byExposure.print_showAllLevels.IQR
        , xlsx = list(
            byExposure = DS.Table1byExposure.print %>% function.DS.Table1byExposure.print.addCols %>% function.df.edit_Label_Level
            , byExposure.AllLevels = DS.Table1byExposure.print_showAllLevels %>% function.DS.Table1byExposure.print_showAllLevels.addCols %>% function.df.edit_Label_Level %>% mutate(Level = level)
            , byExposure.IQR = DS.Table1byExposure.print_showAllLevels.IQR
            # , is.na.byExposure = DS.is.na.Table1byExposure.print
        )
    )
    
}

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) data -----  














  
  
# __________|------  
# @@ END -----  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
