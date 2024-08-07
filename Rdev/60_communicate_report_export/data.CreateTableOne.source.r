# .sourcename = "f_df.CreateTableOne" |> paste0(".source.r")
# f_df.CreateTableOne.dev.r
# f_df.CreateTableOne.source.r
# utils::browseURL("/Rdev/60_communicate_report_export/f_df.CreateTableOne.dev.r")
# source(paste0(env1$path$source_base,"/","Rdev/60_communicate_report_export/f_df.CreateTableOne.source.r"))
# # source("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export/f_df.CreateTableOne.source.r")
# # source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/60_communicate_report_export/f_df.CreateTableOne.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export/f_df.CreateTableOne.dev.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export/f_df.CreateTableOne.dev.Rmd")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export/f_df.CreateTableOne.source.r")
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




#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .sourcename = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
# \$ .GlobalEnv$.tmp = list() ====  
.listname = ".tmp"; if(!exists(.listname, envir=.GlobalEnv)) { assign(.listname, list(), envir=.GlobalEnv) }  
# \$ .GlobalEnv$env1 = new.env() ====  
.envname = "env1"; if(!exists(.envname, envir=.GlobalEnv)) { assign(.envname, new.env(), envir=.GlobalEnv) }
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
if(.Platform$OS.type == "windows") Sys.setlocale("LC_ALL", "en_US.utf8")  # Note that setting category "LC_ALL" sets only categories "LC_COLLATE", "LC_CTYPE", "LC_MONETARY" and "LC_TIME".
# Sys.setlocale("LC_MESSAGES", "en_US.utf8")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.  # LC_MESSAGES does not exist in Windows
Sys.setenv(LANGUAGE="en")  # Note that the LANGUAGE environment variable has precedence over "LC_MESSAGES" in selecting the language for message translation on most R platforms.
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
for(.packagename in c("tidyverse")) {if(!require(.packagename,character.only=TRUE))install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }  
# \$ .GlobalEnv$env1$path = list() ====  
.sublistname = "path"; .parentname = "env1"; if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() } 
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); .GlobalEnv$env1$path[[objectname]] = object
objectname = "source_base_github"; object = "https://raw.githubusercontent.com/mkim0710/tidystat/master"; .GlobalEnv$env1$path[[objectname]] = object
if(!"source_base" %in% names(.GlobalEnv$env1$path)) { env1$path$source_base = ifelse(dir.exists(env1$path$source_base_local), env1$path$source_base_local, env1$path$source_base_github) }  
objectname = "getwd"; object = getwd(); .GlobalEnv$env1$path[[objectname]] = object
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); .GlobalEnv$env1$path[[objectname]] = object
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) source -----  
### @ .subpath, .sourcename ======  
.subpath = r"(Rdev/60_communicate_report_export)" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(.subpath!="") utils::browseURL(normalizePath(.subpath))
.sourcename = "f_df.CreateTableOne" |> paste0(".source.r")
# \% source( file.path(env1$path$source_base,.subpath.filename.source.r) ) ----  
# .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% .GlobalEnv$env1$source) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); source( file.path(env1$path$source_base,.subpath.filename.source.r) ); .GlobalEnv$env1$source[[.sourcename]] = TRUE}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  


function.DataSet.TableOne_byExposure.xlsx = function(DataSet.select, ObjectName = "DataSet", VarNames4Exposure =  c("InterventionGroup")) {
    library(tidyverse)
    library(tableone)
    
    ObjectName.select = paste0(objectname,".select")
    ObjectName.TableOne_byExposure = paste0(objectname,".TableOne_by", VarNames4Exposure)
    ObjectName.is.na.TableOne_byExposure = paste0(objectname,".is.na.TableOne_by", VarNames4Exposure)
    ObjectName.select |> cat("  \n", sep="") ###### |> cat("  \n", sep="") ----
    ObjectName.TableOne_byExposure |> cat("  \n", sep="") ###### |> cat("  \n", sep="") ----
    ObjectName.is.na.TableOne_byExposure |> cat("  \n", sep="") ###### |> cat("  \n", sep="") ----
    # > ObjectName.select |> cat("  \n", sep="") ###### |> cat("  \n", sep="") ----
    # CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.select
    # > ObjectName.TableOne_byExposure |> cat("  \n", sep="") ###### |> cat("  \n", sep="") ----
    # CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.TableOne_bySEX
    # > ObjectName.is.na.TableOne_byExposure |> cat("  \n", sep="") ###### |> cat("  \n", sep="") ----
    # CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.is.na.TableOne_bySEX
    
    # CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.TableOne_by_SEX = CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds %>% select(-rowname, -PERSON_ID) |> as.data.frame() %>% 
    #     CreateTableOne(strata = VarNames4Exposure, data = ., test = T, includeNA = T, addOverall = T)
    
    # browser()
    assign(ObjectName.TableOne_byExposure, 
           DataSet.select %>% 
               {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 10) )]} |> as.data.frame() %>%  # debug181115 not to remove numeric 
               CreateTableOne(strata = VarNames4Exposure, data = ., test = T, includeNA = T, addOverall = T)
    )
    assign(ObjectName.is.na.TableOne_byExposure, 
           DataSet.select %>% 
               {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 10) )]} %>%
               map_df(is.na) %>% setNames(paste0(names(.), ".is.na") |> str_replace_all("\\`", "")) %>%  # debug) Error in parse(text = x, keep.source = FALSE)
               # mutate( !!rlang::sym(VarNames4Exposure) := CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.select[[VarNames4Exposure]]) %>%
               cbind(DataSet.select[VarNames4Exposure]) |>
               as.data.frame() %>%
               CreateTableOne(strata = VarNames4Exposure, data = ., test = T, includeNA = T, addOverall = T)
    )
    
    Vars4IQR = names(DataSet.select)[DataSet.select %>% map_lgl(is.numeric)]
    # eval(parse(text = ObjectName.TableOne_byExposure)) |> print(showAllLevels = F, smd = T) # |> print(showAllLevels = F, smd = T) ----
    # eval(parse(text = ObjectName.TableOne_byExposure)) |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) # |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) ----
    # eval(parse(text = ObjectName.is.na.TableOne_byExposure)) |> print(showAllLevels = F, smd = T) # |> print(showAllLevels = F, smd = T) ----
    sink(paste0(ObjectName.TableOne_byExposure, " -AllLevels.txt"), append = FALSE)
    eval(parse(text = ObjectName.TableOne_byExposure)) |> print(showAllLevels = F, smd = T) # |> print(showAllLevels = F, smd = T) ----
    sink()
    sink(paste0(ObjectName.TableOne_byExposure, " -AllLevels -IQR.txt"), append = FALSE)
    eval(parse(text = ObjectName.TableOne_byExposure)) |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) # |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) ----
    sink()
    sink(paste0(ObjectName.is.na.TableOne_byExposure, " -AllLevels(is.na).txt"), append = FALSE)
    eval(parse(text = ObjectName.is.na.TableOne_byExposure)) |> print(showAllLevels = F, smd = T) # |> print(showAllLevels = F, smd = T) ----
    sink()
    
    
    # =NUMBERVALUE(MID(B2,1,SEARCH("(",B2,1)-1)) ----            
    DataSet.is.na.TableOne_byExposure.print = eval(parse(text = ObjectName.is.na.TableOne_byExposure)) |> print(showAllLevels = F, smd = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) |> as_tibble(rownames = "Variable")
    DataSet.is.na.TableOne_byExposure.print |> print(n=5) ###### |> print(n=5) ----
    
    DataSet.TableOne_byExposure.print = eval(parse(text = ObjectName.TableOne_byExposure)) |> print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) |> as_tibble(rownames = "Variable")
    DataSet.TableOne_byExposure.print_showAllLevels = eval(parse(text = ObjectName.TableOne_byExposure)) |> print(showAllLevels = T, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) |> as_tibble(rownames = "Variable")
    DataSet.TableOne_byExposure.print_showAllLevels.IQR = eval(parse(text = ObjectName.TableOne_byExposure)) |> print(showAllLevels = T, smd = T, nonnormal = Vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) |> as_tibble(rownames = "Variable")
    DataSet.TableOne_byExposure.print |> print(n=5) ###### |> print(n=5) ----
    DataSet.TableOne_byExposure.print_showAllLevels |> print(n=5) ###### |> print(n=5) ----
    DataSet.TableOne_byExposure.print_showAllLevels.IQR |> print(n=5) ###### |> print(n=5) ----
    
    # DataSet.TableOne_byExposure.print %>% writexl::write_xlsx(paste0(ObjectName.TableOne_byExposure, " -clean.xlsx"))
    # # if (.Platform$OS.type == "windows") openxlsx::openXL(paste0(ObjectName.TableOne_byExposure, " -clean.xlsx"))
    # DataSet.TableOne_byExposure.print_showAllLevels %>% writexl::write_xlsx(paste0(ObjectName.TableOne_byExposure, " -AllLevels -clean.xlsx"))
    # # if (.Platform$OS.type == "windows") openxlsx::openXL(paste0(ObjectName.TableOne_byExposure, " -AllLevels -clean.xlsx"))
    # DataSet.TableOne_byExposure.print_showAllLevels.IQR %>% writexl::write_xlsx(paste0(ObjectName.TableOne_byExposure, " -AllLevels -IQR -clean.xlsx"))
    # # if (.Platform$OS.type == "windows") openxlsx::openXL(paste0(ObjectName.TableOne_byExposure, " -IQR -clean.xlsx"))
    
    
    function.DataSet.TableOne_byExposure.print.addCols = function(DataSet.TableOne_byExposure.print) {
        DataSet.TableOne_byExposure.print %>% add_column(level = as.character(NA), .after = "Variable") %>% add_row(.before = 1) |> 
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
    
    function.DataSet.TableOne_byExposure.print_showAllLevels.addCols = function(DataSet.TableOne_byExposure.print_showAllLevels) {
        DataSet.TableOne_byExposure.print_showAllLevels %>% add_row(.before = 1) |> 
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
    
    list(
        byExposure = DataSet.TableOne_byExposure.print %>% function.DataSet.TableOne_byExposure.print.addCols %>% function.df.edit_Label_Level
        , byExposure.AllLevels = DataSet.TableOne_byExposure.print_showAllLevels %>% function.DataSet.TableOne_byExposure.print_showAllLevels.addCols %>% function.df.edit_Label_Level %>% mutate(Level = level)
        , byExposure.IQR = DataSet.TableOne_byExposure.print_showAllLevels.IQR
        # , is.na.byExposure = DataSet.is.na.TableOne_byExposure.print
        # ) %>% writexl::write_xlsx(paste0(ObjectName.TableOne_byExposure, "(list).xlsx"))
    ) %>% writexl::write_xlsx(paste0(ObjectName.TableOne_byExposure, ".xlsx"))
    if (.Platform$OS.type == "windows") openxlsx::openXL(paste0(ObjectName.TableOne_byExposure, ".xlsx"))
    
    return.list = list(
        DataSet.select = DataSet.select
        , ObjectName = ObjectName
        , VarNames4Exposure = VarNames4Exposure
        , ObjectName.TableOne_byExposure = ObjectName.TableOne_byExposure
        , ObjectName.is.na.TableOne_byExposure = ObjectName.is.na.TableOne_byExposure
        , Vars4IQR = Vars4IQR
        , DataSet.is.na.TableOne_byExposure.print = DataSet.is.na.TableOne_byExposure.print
        , DataSet.TableOne_byExposure.print = DataSet.TableOne_byExposure.print
        , DataSet.TableOne_byExposure.print_showAllLevels = DataSet.TableOne_byExposure.print_showAllLevels
        , DataSet.TableOne_byExposure.print_showAllLevels.IQR = DataSet.TableOne_byExposure.print_showAllLevels.IQR
        , xlsx = list(
            byExposure = DataSet.TableOne_byExposure.print %>% function.DataSet.TableOne_byExposure.print.addCols %>% function.df.edit_Label_Level
            , byExposure.AllLevels = DataSet.TableOne_byExposure.print_showAllLevels %>% function.DataSet.TableOne_byExposure.print_showAllLevels.addCols %>% function.df.edit_Label_Level %>% mutate(Level = level)
            , byExposure.IQR = DataSet.TableOne_byExposure.print_showAllLevels.IQR
            # , is.na.byExposure = DataSet.is.na.TableOne_byExposure.print
        )
    )
    
}

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) data -----  
















#@@ END -----  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
