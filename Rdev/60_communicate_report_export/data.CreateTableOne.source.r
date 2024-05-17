# sourcename = "data.CreateTableOne"
# data.CreateTableOne.dev.r
# data.CreateTableOne.source.r
# utils::browseURL("/Rdev/60_communicate_report_export/data.CreateTableOne.dev.r")
# source(paste0(env.custom$path$source_base,"/","Rdev/60_communicate_report_export/data.CreateTableOne.source.r"))
# # source("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export/data.CreateTableOne.source.r")
# # source("https://github.com/mkim0710/tidystat/raw/master/Rdev/60_communicate_report_export/data.CreateTableOne.source.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export/data.CreateTableOne.dev.r")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export/data.CreateTableOne.dev.Rmd")
# file.edit("D:/OneDrive/[][Rproject]/github_tidystat/Rdev/60_communicate_report_export/data.CreateTableOne.source.r")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
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
for(packagename in c("tidyverse")){if(!require(packagename,character.only=TRUE))install.packages(packagename) else library(packagename,character.only=TRUE)}
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
## env.custom\$path ====
# path2look = "/"; normalizePath(path2look,winslash="/"); dir(path2look,all.files=TRUE,include.dirs=TRUE);
# path2look = "~"; normalizePath(path2look,winslash="/"); dir(path2look,all.files=TRUE,include.dirs=TRUE);
# path2look = "."; normalizePath(path2look,winslash="/"); dir(path2look,all.files=TRUE,include.dirs=TRUE);
if(!"path" %in% names(env.custom)) env.custom$path = list()
objectname = "source_base_local"; object = ifelse(.Platform$OS.type == "windows", "D:/OneDrive/[][Rproject]/github_tidystat", "~/github_tidystat"); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
env.custom$path$source_base = ifelse(dir.exists(env.custom$path$source_base_local), env.custom$path$source_base_local, env.custom$path$source_base_github)
objectname = "getwd"; object = getwd(); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
objectname = "path0"; object = c(file.path("D:", "OneDrive", "[][Rproject]"), "/home/rstudio", "/cloud") |> keep(dir.exists) |> first(default = dirname(getwd())); if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object};
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ START) source -----
# \$ subpath, sourcename ======
subpath = r"(Rdev/60_communicate_report_export)" |> str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
# if(subpath!="") utils::browseURL(normalizePath(subpath))
sourcename = "data.CreateTableOne"
# % source( file.path(env.custom$path$source_base,subpath,paste0(sourcename,".source.r")) ) ----
# source( file.path(env.custom$path$source_base,subpath,paste0(sourcename,".source.r")) )
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  


function.DataSet.TableOne_byExposure.xlsx = function(DataSet.select, ObjectName = "DataSet", VarNames4Exposure =  c("InterventionGroup")) {
    library(tidyverse)
    library(tableone)
    
    ObjectName.select = paste0(objectname,".select")
    ObjectName.TableOne_byExposure = paste0(objectname,".TableOne_by", VarNames4Exposure)
    ObjectName.is.na.TableOne_byExposure = paste0(objectname,".is.na.TableOne_by", VarNames4Exposure)
    ObjectName.select |> cat();cat("\n") ###### |> cat() ----
    ObjectName.TableOne_byExposure |> cat();cat("\n") ###### |> cat() ----
    ObjectName.is.na.TableOne_byExposure |> cat();cat("\n") ###### |> cat() ----
    # > ObjectName.select |> cat();cat("\n") ###### |> cat() ----
    # CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.select
    # > ObjectName.TableOne_byExposure |> cat();cat("\n") ###### |> cat() ----
    # CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.TableOne_bySEX
    # > ObjectName.is.na.TableOne_byExposure |> cat();cat("\n") ###### |> cat() ----
    # CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.is.na.TableOne_bySEX
    
    # CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.TableOne_by_SEX = CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds %>% select(-rowname, -PERSON_ID) %>% as.data.frame %>% 
    #     CreateTableOne(strata = VarNames4Exposure, data = ., test = T, includeNA = T, addOverall = T)
    
    # browser()
    assign(ObjectName.TableOne_byExposure, 
           DataSet.select %>% 
               {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 10) )]} %>% as.data.frame %>%  # debug181115 not to remove numeric 
               CreateTableOne(strata = VarNames4Exposure, data = ., test = T, includeNA = T, addOverall = T)
    )
    assign(ObjectName.is.na.TableOne_byExposure, 
           DataSet.select %>% 
               {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 10) )]} %>%
               map_df(is.na) %>% setNames(paste0(names(.), ".is.na") |> str_replace_all("\\`", "")) %>%  # debug) Error in parse(text = x, keep.source = FALSE)
               # mutate( !!rlang::sym(VarNames4Exposure) := CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds.select[[VarNames4Exposure]]) %>%
               cbind(DataSet.select[VarNames4Exposure]) %>%
               as.data.frame %>%
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
    # # openxlsx::openXL(paste0(ObjectName.TableOne_byExposure, " -clean.xlsx"))
    # DataSet.TableOne_byExposure.print_showAllLevels %>% writexl::write_xlsx(paste0(ObjectName.TableOne_byExposure, " -AllLevels -clean.xlsx"))
    # # openxlsx::openXL(paste0(ObjectName.TableOne_byExposure, " -AllLevels -clean.xlsx"))
    # DataSet.TableOne_byExposure.print_showAllLevels.IQR %>% writexl::write_xlsx(paste0(ObjectName.TableOne_byExposure, " -AllLevels -IQR -clean.xlsx"))
    # # openxlsx::openXL(paste0(ObjectName.TableOne_byExposure, " -IQR -clean.xlsx"))
    
    
    function.DataSet.TableOne_byExposure.print.addCols = function(DataSet.TableOne_byExposure.print) {
        DataSet.TableOne_byExposure.print %>% add_column(level = as.character(NA), .after = "Variable") %>% add_row(.before = 1) %>% 
            as.data.frame %>% {.[1,]=paste0(names(.), " (N = ", .[2,], ")");.[1,1]=VarNames4Exposure;.[1,c("p","test","SMD")]=c("p-value", "test", "SMD");.} %>% 
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
        DataSet.TableOne_byExposure.print_showAllLevels %>% add_row(.before = 1) %>% 
            as.data.frame %>% {.[1,]=paste0(names(.), " (N = ", .[2,], ")");.[1,1]=VarNames4Exposure;.[1,c("p","test","SMD")]=c("p-value", "test", "SMD");.} %>% 
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
    openxlsx::openXL(paste0(ObjectName.TableOne_byExposure, ".xlsx"))
    
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
