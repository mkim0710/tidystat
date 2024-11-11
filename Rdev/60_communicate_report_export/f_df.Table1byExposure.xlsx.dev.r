# .sourcename = "f_df.Table1byExposure.xlsx" |> paste0(".source.r")
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
# file.edit( paste0("[Working Files List] ",basename(getwd()),".r") )  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .sourcename = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath_filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(isTRUE(options()$function.reload) || !.sourcename %in% names(.GlobalEnv$env1$source)) {message('> source("',file.path(env1$path$source_base,.subpath_filename.source.r),'")'); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath_filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$LastSourceEditorContext.path_filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal$setLastSourceEditorContext.path_filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$LastSourceEditorContext.path_filename.ext)) if(env1$path$LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename.ext))




#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) source -----  
## @ .subpath, .sourcename ======  
.subpath = r"(Rdev/60_communicate_report_export)" |> str_replace_all("\\\\","/")  
.sourcename = "f_df.Table1byExposure.xlsx" |> paste0(".source.r")
### \% source( file.path(env1$path$source_base,.subpath_filename.source.r) ) ----  
.subpath_filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); 
message('> source("',file.path(env1$path$source_base,.subpath_filename.source.r),'")'); source( file.path(env1$path$source_base,.subpath_filename.source.r) ); .GlobalEnv$env1$source[[.sourcename]] = TRUE
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
env1$path$.subpath = .subpath
.sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
env1$path$.sourcename_root = .sourcename_root  
env1$path$.subpath_filename.dev.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.r")
env1$path$.subpath_filename.dev.Rmd = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.Rmd")
env1$path$.subpath_filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
cat("# ",'.sourcename_root = "',.sourcename_root,'"  \n',
    "#### ",env1$path$.subpath_filename.dev.r, "----  \n",
    "#### ",env1$path$.subpath_filename.dev.Rmd, "----  \n",
    "#### ",env1$path$.subpath_filename.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.subpath_filename.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath_filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath_filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.r,'"); if(!is.null(env1$path$LastSourceEditorContext.path_filename.ext)) if(env1$path$LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath_filename.dev.Rmd,'"); if(!is.null(env1$path$LastSourceEditorContext.path_filename.ext)) if(env1$path$LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath_filename.source.r,'"); if(!is.null(env1$path$LastSourceEditorContext.path_filename.ext)) if(env1$path$LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename.ext));', "  \n",
    sep="")
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) data -----  
# \$ assign( DataSetName, read_rds(paste0(.path4read,"/",DataSetName,".rds")) ) ====  
# .path4read = file.path(env1$path$path0,"Rproject_KNHIS.CohortGJ0910 NoHx")
# DataSetName = "CohortGJ0910.BaselineJKGJ2085NoHx.drop_na.MetS_NoMeds"
.path4read = paste0(env1$path$path1,"/data")
DataSetName = "CohortGJ0910.BaselineJKGJ2085NoHx...01" |> str_replace("\\.rds$", "")
assign( DataSetName, read_rds(paste0(.path4read,"/",DataSetName,".rds")) )

CohortGJ0910.BaselineJKGJ2085NoHx...01 |> names() |> paste0(collapse = ", ") |> cat("  \n", sep="") ###### |> cat("  \n", sep="") 
# > CohortGJ0910.BaselineJKGJ2085NoHx...01 |> names() |> paste0(collapse = ", ") |> cat("  \n", sep="") ###### |> cat("  \n", sep="")   
# PERSON_ID, EnrollYear, SEX, AGE_GROUP, DTH_YM, DTH_CODE1, DTH_CODE2, SIDO, SGG, IPSN_TYPE_CD, CTRB_PT_TYPE_CD, DFAB_GRD_CD, DFAB_PTN_CD, DFAB_REG_YM, YKIHO_GUBUN_CD, 
# HEIGHT, WEIGHT, 
# BP_HIGH, BP_LWST, BLDS, 
# TOT_CHOLE, 
# HMG, OLIG_PROTE_CD, SGOT_AST, SGPT_ALT, GAMMA_GTP, FMLY_HPRTS_PATIEN_YN, FMLY_APOP_PATIEN_YN, FMLY_HDISE_PATIEN_YN, FMLY_DIABML_PATIEN_YN, FMLY_CANCER_PATIEN_YN, SMK_STAT_TYPE_RSPS_CD, DRNK_HABIT_RSPS_CD, TM1_DRKQTY_RSPS_CD, 
# WAIST, TRIGLYCERIDE, HDL_CHOLE, LDL_CHOLE, 
# CREATININE, HCHK_APOP_PMH_YN, HCHK_HDISE_PMH_YN, HCHK_HPRTS_PMH_YN, HCHK_DIABML_PMH_YN, HCHK_HPLPDM_PMH_YN, HCHK_ETCDSE_PMH_YN, PAST_SMK_TERM_RSPS_CD, PAST_DSQTY_RSPS_CD, CUR_SMK_TERM_RSPS_CD, CUR_DSQTY_RSPS_CD, MOV20_WEK_FREQ_ID, MOV30_WEK_FREQ_ID, WLK30_WEK_FREQ_ID, HCHK_PHSS_PMH_YN, n.ICD_E0814, minDate.ICD_E0814, maxDate.ICD_E0814, diffDate.ICD_E0814, n.ICD_I1016, minDate.ICD_I1016, maxDate.ICD_I1016, diffDate.ICD_I1016, n.ICD_I2025, minDate.ICD_I2025, maxDate.ICD_I2025, diffDate.ICD_I2025, n.ICD_I3052, minDate.ICD_I3052, maxDate.ICD_I3052, diffDate.ICD_I3052, n.ICD_I6069, minDate.ICD_I6069, maxDate.ICD_I6069, diffDate.ICD_I6069, n.ICD_I7079, minDate.ICD_I7079, maxDate.ICD_I7079, diffDate.ICD_I7079, Female, BMI, BMI_lt185, BMI_ge185lt230, BMI_ge230lt250, BMI_ge185lt250, BMI_ge250lt300, BMI_ge300, BMI_ge350, BMI_ge400, 
# BMI.cut4, FPG, 
# FPG_ge100, FPG_ge126, 
# SBP, DBP, BP_ESCESH2018, 
# FPG_ge100lt126, 
# TRIGLYCERIDE_ge150, HDL_CHOLE_lt4050, WAIST_ge9080, WAIST_ge9085, BP_ge130_85, 
# nMetS_NoMeds_WAIST_ge9080, nMetS_NoMeds_WAIST_ge9080.ge3, 
# nMetS_NoMeds_WAIST_ge9085, nMetS_NoMeds_WAIST_ge9085.ge3

DataSet.Date.NA.rmAllNA = CohortGJ0910.BaselineJKGJ2085NoHx...01 %>% 
    rownames_to_column() 

DataSet.Date.NA.rmAllNA %>% 
    select(
        SEX,
        HEIGHT, WEIGHT, 
        BMI.cut4, 
        WAIST, 
        WAIST_ge9080, WAIST_ge9085, 
        SBP, DBP, BP_ESCESH2018, 
        BP_ge130_85, 
        FPG, 
        FPG_ge100, FPG_ge126, 
        TOT_CHOLE, 
        TRIGLYCERIDE, 
        HDL_CHOLE, LDL_CHOLE, 
        TRIGLYCERIDE_ge150, HDL_CHOLE_lt4050, 
        nMetS_NoMeds_WAIST_ge9080, nMetS_NoMeds_WAIST_ge9080.ge3, 
        nMetS_NoMeds_WAIST_ge9085, nMetS_NoMeds_WAIST_ge9085.ge3
    ) |> env1$f$f_df.Table1byExposure.xlsx(DataSetName4output = "CohortGJ0910.BaselineJKGJ2085NoHx...01.select_MetS", VarNames4Exposure =  c("SEX"))
















.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
.packagename = "tableone"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}

##@ DataSet.Table1 -----  
# # DataSet.Table1 = DataSet.Date.NA.rmAllNA %>% select(-rowname, -PERSON_ID) |> as.data.frame() %>% 
# #     CreateTableOne(data = ., test = T, includeNA = T, addOverall = T)
# DataSet.Table1 = DataSet.Date.NA.rmAllNA %>% 
#     {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 19) )]} |> as.data.frame() %>%  # debug181115 not to remove numeric 
#     CreateTableOne(data = ., test = T, includeNA = T, addOverall = T)
# DataSet.is.na.Table1 = DataSet.Date.NA.rmAllNA %>% 
#     map_df(is.na) %>% setNames(paste0(names(.), ".is.na")) %>% 
#     as.data.frame %>%  # debug181115 not to remove numeric 
#     CreateTableOne(data = ., test = T, includeNA = T, addOverall = T)

# Vars4IQR = names(DataSet.Date.NA.rmAllNA %>%)[DataSet.Date.NA.rmAllNA %>% map_lgl(is.numeric)]

# sink(paste0(.path4write,"/","DataSet.Table1.txt"), append = FALSE)
# DataSet.Table1 |> print(showAllLevels = F, smd = T) ###### |> print(showAllLevels = F, smd = T) ---  
# sink()
# sink(paste0(.path4write,"/","DataSet.Table1.IQR.txt"), append = FALSE)
# DataSet.Table1 |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) ###### |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) ---  
# sink()


# # =NUMBERVALUE(MID(B2,1,SEARCH("(",B2,1)-1)) ---  
# DataSet.Table1 |> print(showAllLevels = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% 
#     write.csv("DataSet.Table1 -clean.csv")
# DataSet.is.na.Table1 |> print(showAllLevels = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% 
#     write.csv("DataSet.is.na.Table1 -clean.csv")
# # if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open("DataSet.Table1 -clean.csv")

# list(
#     Table1 = DataSet.Table1 |> print(showAllLevels = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) |> rownames_to_column()
#     , Table1.IQR = DataSet.Table1 |> print(showAllLevels = F, nonnormal = Vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) |> rownames_to_column()
#     , is.na.Table1 = DataSet.is.na.Table1 |> print(showAllLevels = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) |> rownames_to_column()
# ) %>% openxlsx2::write_xlsx("DataSet.Table1.xlsx")
# # if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open("DataSet.Table1.xlsx")



## @ DataSet.Table1.byExposure -----  
DataSet.Date.NA.rmAllNA %>% summarise_all(function(x) sum(is.na(x))) %>% t #---
DataSet.Date.NA.rmAllNA.select = DataSet.Date.NA.rmAllNA |> as.data.frame() %>% select(-rowname, -PERSON_ID) %>% 
    mutate(Intervention.ge1 = !BMI_ge300) %>% 
    # mutate(Intervention = ifelse(Intervention.ge1 == T, "Intervention", "Control") %>% as.factor)
    # mutate(Intervention = ifelse(Intervention.ge1 == T, "Intervention >= 1", "Intervention == 0") %>% as.factor)
    mutate(InterventionGroup = ifelse(Intervention.ge1 == T, "Group 1", "Group 0") %>% as.factor)
DataSet.Date.NA.rmAllNA.select %>% summarise_all(function(x) sum(is.na(x))) %>% t #---
# DataSet.Date.NA.rmAllNA.select %>% mutate_if(is.numeric, replace_na, 0)
                          
VarNames4Exposure =  c("InterventionGroup")
DataSetName = "DataSet.Date.NA.rmAllNA"
DataSetName.select = paste0(DataSetName,".select")
DataSetName.Table1byExposure = paste0(DataSetName,".Table1by", VarNames4Exposure)
DataSetName.is.na.Table1byExposure = paste0(DataSetName,".is.na.Table1by", VarNames4Exposure)
DataSetName.select |> cat("  \n", sep="") ###### |> cat("  \n", sep="") 
DataSetName.Table1byExposure |> cat("  \n", sep="") ###### |> cat("  \n", sep="") 
DataSetName.is.na.Table1byExposure |> cat("  \n", sep="") ###### |> cat("  \n", sep="") 
                              
assign(DataSetName.Table1byExposure, 
       get(DataSetName.select) %>% 
           {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 10) )]} |> as.data.frame() %>%  # debug181115 not to remove numeric 
           CreateTableOne(strata = VarNames4Exposure, data = ., test = T, includeNA = T, addOverall = T)
)
assign(DataSetName.is.na.Table1byExposure, 
       get(DataSetName.select) %>% 
           {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 10) )]} %>%
           map_df(is.na) %>% setNames(paste0(names(.), ".is.na") |> str_replace_all("\\`", "")) %>%  # debug) Error in parse(text = x, keep.source = FALSE)
           # mutate( !!rlang::sym(VarNames4Exposure) :=get(DataSetName.select)[[VarNames4Exposure]]) %>%
           cbind(get(DataSetName.select)[VarNames4Exposure]) |>
           as.data.frame() %>%
           CreateTableOne(strata = VarNames4Exposure, data = ., test = T, includeNA = T, addOverall = T)
)

Vars4IQR = names(get(DataSetName.select))[get(DataSetName.select) %>% map_lgl(is.numeric)]
# get(DataSetName.Table1byExposure) |> print(showAllLevels = F, smd = T) ###### |> print(showAllLevels = F, smd = T) ---  
# get(DataSetName.Table1byExposure) |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) ###### |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) ---  
# get(DataSetName.is.na.Table1byExposure) |> print(showAllLevels = F, smd = T) ###### |> print(showAllLevels = F, smd = T) ---  
sink(paste0(env1$path$LastSourceEditorContext.path,"/",DataSetName.Table1byExposure, " -AllLevels.txt"), append = FALSE)
get(DataSetName.Table1byExposure) |> print(showAllLevels = F, smd = T) ###### |> print(showAllLevels = F, smd = T) ---
sink()
sink(paste0(env1$path$LastSourceEditorContext.path,"/",DataSetName.Table1byExposure, " -AllLevels -IQR.txt"), append = FALSE)
get(DataSetName.Table1byExposure) |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) ###### |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) ---
sink()
sink(paste0(env1$path$LastSourceEditorContext.path,"/",DataSetName.is.na.Table1byExposure, " -AllLevels(is.na).txt"), append = FALSE)
get(DataSetName.is.na.Table1byExposure) |> print(showAllLevels = F, smd = T) ###### |> print(showAllLevels = F, smd = T) ---
sink()


# =NUMBERVALUE(MID(B2,1,SEARCH("(",B2,1)-1)) ---            
DataSet.is.na.Table1byExposure.print = get(DataSetName.is.na.Table1byExposure) |> print(showAllLevels = F, smd = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) |> as_tibble(rownames = "Variable")
DataSet.is.na.Table1byExposure.print |> print(n=5) ###### |> print(n=5) ---

DataSet.Table1byExposure.print = get(DataSetName.Table1byExposure) |> print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) |> as_tibble(rownames = "Variable")
DataSet.Table1byExposure.print_showAllLevels = get(DataSetName.Table1byExposure) |> print(showAllLevels = T, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) |> as_tibble(rownames = "Variable")
DataSet.Table1byExposure.print_showAllLevels.IQR = get(DataSetName.Table1byExposure) |> print(showAllLevels = T, smd = T, nonnormal = Vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) |> as_tibble(rownames = "Variable")
DataSet.Table1byExposure.print |> print(n=5) ###### |> print(n=5) ---
DataSet.Table1byExposure.print_showAllLevels |> print(n=5) ###### |> print(n=5) ---
DataSet.Table1byExposure.print_showAllLevels.IQR |> print(n=5) ###### |> print(n=5) ---
              
# DataSet.Table1byExposure.print %>% writexl::write_xlsx(paste0(DataSetName.Table1byExposure, " -clean.xlsx"))
# # if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open(paste0(DataSetName.Table1byExposure, " -clean.xlsx"))
# DataSet.Table1byExposure.print_showAllLevels %>% writexl::write_xlsx(paste0(DataSetName.Table1byExposure, " -AllLevels -clean.xlsx"))
# # if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open(paste0(DataSetName.Table1byExposure, " -AllLevels -clean.xlsx"))
# DataSet.Table1byExposure.print_showAllLevels.IQR %>% writexl::write_xlsx(paste0(DataSetName.Table1byExposure, " -AllLevels -IQR -clean.xlsx"))
# # if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open(paste0(DataSetName.Table1byExposure, " -IQR -clean.xlsx"))

  
  
# __________|------  
# @@ START) function -----  
function.DataSet.Table1byExposure.print.addCols = function(DataSet.Table1byExposure.print) {
    DataSet.Table1byExposure.print %>% add_column(level = as.character(NA), .after = "Variable") %>% add_row(.before = 1) |> 
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

function.DataSet.Table1byExposure.print_showAllLevels.addCols = function(DataSet.Table1byExposure.print_showAllLevels) {
    DataSet.Table1byExposure.print_showAllLevels %>% add_row(.before = 1) |> 
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
    byExposure = DataSet.Table1byExposure.print %>% function.DataSet.Table1byExposure.print.addCols %>% function.df.edit_Label_Level
    , byExposure.AllLevels = DataSet.Table1byExposure.print_showAllLevels %>% function.DataSet.Table1byExposure.print_showAllLevels.addCols %>% function.df.edit_Label_Level %>% mutate(Level = level)
    , byExposure.IQR = DataSet.Table1byExposure.print_showAllLevels.IQR
    # , is.na.byExposure = DataSet.is.na.Table1byExposure.print
) %>% writexl::write_xlsx(paste0(DataSetName.Table1byExposure, "(list).xlsx"))
if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open(paste0(DataSetName.Table1byExposure, "(list).xlsx"))












## @ dev -----------  
function.DataSet.Table1byExposure.print.addCols = function(DataSet.Table1byExposure.print) {
    DataSet.Table1byExposure.print %>% add_column(level = as.character(NA), .after = "Variable") %>% add_row(.before = 1) |> 
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

DataSet.Table1byExposure.print.addCols = DataSet.Table1byExposure.print %>% function.DataSet.Table1byExposure.print.addCols
DataSet.Table1byExposure.print.addCols |> print(n=999) #---
# > DataSet.Table1byExposure.print.addCols = DataSet.Table1byExposure.print %>% function.DataSet.Table1byExposure.print.addCols
# Warning messages:
# 1: Expected 2 pieces. Additional pieces discarded in 21 rows [26, 27, 28, 29, 30, 31, 32, 41, 42, 43, 79, 80, 81, 82, 83, 122, 136, 139, 140, 154, ...]. 
# 2: Expected 2 pieces. Additional pieces discarded in 21 rows [26, 27, 28, 29, 30, 31, 32, 41, 42, 43, 79, 80, 81, 82, 83, 122, 136, 139, 140, 154, ...]. 
# 3: Expected 2 pieces. Additional pieces discarded in 118 rows [3, 4, 6, 7, 8, 9, 10, 11, 13, 14, 15, 17, 18, 19, 20, 21, 22, 23, 24, 25, ...]. 
# 4: Expected 2 pieces. Missing pieces filled with `NA` in 16 rows [5, 12, 16, 33, 44, 48, 52, 56, 60, 64, 69, 90, 100, 110, 131, 141]. 
# 5: Expected 2 pieces. Additional pieces discarded in 118 rows [3, 4, 6, 7, 8, 9, 10, 11, 13, 14, 15, 17, 18, 19, 20, 21, 22, 23, 24, 25, ...]. 
# 6: Expected 2 pieces. Missing pieces filled with `NA` in 16 rows [5, 12, 16, 33, 44, 48, 52, 56, 60, 64, 69, 90, 100, 110, 131, 141]. 
# 7: Problem with `mutate()` input `p`.
# i NAs introduced by coercion
# i Input `p` is `as.numeric(if_else(p == "<0.001", "0", p))`. 
# 8: Problem with `mutate()` input `smd`.
# i NAs introduced by coercion
# i Input `smd` is `as.numeric(SMD)`. 
# > DataSet.Table1byExposure.print.addCols |> print(n=999) #---  
# # A tibble: 157 x 28
#       `#` `#2`  Class VarType Variable                               level          Label Level Overall                `Group 1`           `Group 2`             SMD      `p-value` star      smd       p test   greatest G1geG2 G1leG2 G1mean   G1sd G2mean  G2sd    G1n G1prop    G2n G2prop
#     <int> <chr> <chr> <chr>   <chr>                                  <chr>          <chr> <chr> <chr>                  <chr>               <chr>                 <chr>    <chr>     <chr>   <dbl>   <dbl> <chr>  <chr>    <lgl>  <lgl>   <dbl>  <dbl>  <dbl> <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
#   1     1 ""    ""    NA      "SEX"                                  level (N = NA) ""    ""    "Overall (N = 283798)" "Male (N = 148042)" "Female (N = 135756)" "SMD"    "p-value" "   "  NA      NA     "test" NANA     NA     NA      NA     NA     NA    NA        NA   NA       NA   NA  
#   2     2 ""    ""    NA      "n"                                    NA             ""    ""    "283798"               "148042"            "135756"              ""       ""        "   "  NA      NA     ""     NANA     NA     NA      NA     NA     NA    NA        NA   NA       NA   NA  
#   3     3 ""    ""    factor  "EnrollYear = 2010"                    NA             ""    ""    "110979 (39.1)"        "51627 (34.9)"      "59352 (43.7)"        "0.182"  "<0.001"  "***"   0.182   0     ""     G2       FALSE  TRUE    NA     NA     NA    NA     51627   34.9  59352   43.7
#   4     4 ""    ""    factor  "SEX = Female"                         NA             ""    ""    "135756 (47.8)"        "0 (0.0)"           "135756 (100.0)"      "NaN"    "<0.001"  "***" NaN       0     ""     G2       FALSE  TRUE    NA     NA     NA    NA         0    0   135756  100  
#   5     5 ""    ""    factor  "IPSN_TYPE_CD"                         NA             ""    ""    ""                     ""                  ""                    "0.803"  "<0.001"  "***"   0.803   0     ""     NANA     NA     NA      NA     NA     NA    NA        NA   NA       NA   NA  
#   6     6 ""    ""    level   "   1"                                 NA             ""    ""    "37132 (13.1)"         "24839 (16.8)"      "12293 (9.1)"         ""       ""        "   "  NA      NA     ""     G1       TRUE   FALSE   NA     NA     NA    NA     24839   16.8  12293    9.1
#   7     7 ""    ""    level   "   2"                                 NA             ""    ""    "24730 (8.7)"          "2617 (1.8)"        "22113 (16.3)"        ""       ""        "   "  NA      NA     ""     G2       FALSE  TRUE    NA     NA     NA    NA      2617    1.8  22113   16.3
               
#  26    26 ""    ""    numeric "HEIGHT"                               NA             ""    ""    "163.91 (9.09)"        "170.23 (6.40)"     "157.02 (6.09)"       "2.112"  "<0.001"  "***"   2.11    0     ""     G1       TRUE   FALSE  170.     6.4  157.    6.09     NA   NA       NA   NA  
#  27    27 ""    ""    numeric "WEIGHT"                               NA             ""    ""    "63.58 (11.68)"        "70.00 (10.55)"     "56.59 (8.35)"        "1.410"  "<0.001"  "***"   1.41    0     ""     G1       TRUE   FALSE   70     10.6   56.6   8.35     NA   NA       NA   NA  
               

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

DataSet.Table1byExposure.print.addCols.edit = DataSet.Table1byExposure.print.addCols %>% function.df.edit_Label_Level
DataSet.Table1byExposure.print.addCols.edit %>% select(1:`Group 2`) |> print(n=999) #---
# > DataSet.Table1byExposure.print.addCols.edit %>% select(1:`Group 2`) |> print(n=999) #---  
# # A tibble: 157 x 11
#       `#` `#2`  Class VarType Variable                               level          Label                              Level                Overall                `Group 1`           `Group 2`            
#     <int> <chr> <chr> <chr>   <chr>                                  <chr>          <chr>                              <chr>                <chr>                  <chr>               <chr>                
#   1     1 ""    ""    NA      "SEX"                                  level (N = NA) ""                                  NA                  "Overall (N = 283798)" "Male (N = 148042)" "Female (N = 135756)"
#   2     2 ""    ""    NA      "n"                                    NA             ""                                  NA                  "283798"               "148042"            "135756"             
#   3     3 ""    ""    factor  "EnrollYear = 2010"                    NA             "Enroll Year"                      "2010"               "110979 (39.1)"        "51627 (34.9)"      "59352 (43.7)"       
#   4     4 ""    ""    factor  "SEX = Female"                         NA             "SEX"                              "Female"             "135756 (47.8)"        "0 (0.0)"           "135756 (100.0)"     
#   5     5 ""    ""    factor  "IPSN_TYPE_CD"                         NA             "IPSN TYPE CD"                     ""                   ""                     ""                  ""                   
#   6     6 ""    ""    level   "   1"                                 NA             ""                                 "1"                  "37132 (13.1)"         "24839 (16.8)"      "12293 (9.1)"        
#   7     7 ""    ""    level   "   2"                                 NA             ""                                 "2"                  "24730 (8.7)"          "2617 (1.8)"        "22113 (16.3)"       
         
#  44    44 ""    ""    factor  "FMLY_HPRTS_PATIEN_YN"                 NA             "FMLY HPRTS PATIEN YN"             ""                   ""                     ""                  ""                   
#  45    45 ""    ""    level   "   0"                                 NA             ""                                 "0"                  "160165 (56.4)"        "87169 (58.9)"      "72996 (53.8)"       
#  46    46 ""    ""    level   "   1"                                 NA             ""                                 "1"                  "30294 (10.7)"         "13745 (9.3)"       "16549 (12.2)"       
#  47    47 ""    ""    level   "   NA"                                NA             ""                                 "N/A"                "93339 (32.9)"         "47128 (31.8)"      "46211 (34.0)"                    

#  86    86 ""    ""    factor  "HCHK_HPRTS_PMH_YN = 1"                NA             "HCHK HPRTS PMH YN"                "1"                  "30626 (10.8)"         "15360 (10.4)"      "15266 (11.2)"                      
               
# 121   121 ""    ""    factor  "Female = TRUE"                        NA             "Female"                           ""                   "135756 (47.8)"        "0 (0.0)"           "135756 (100.0)"     
# 122   122 ""    ""    numeric "BMI"                                  NA             "BMI"                              ""                   "23.57 (3.22)"         "24.11 (3.06)"      "22.97 (3.29)"       
# 123   123 ""    ""    factor  "BMI_lt185 = TRUE"                     NA             "BMI <185"                         ""                   "11948 (4.2)"          "3598 (2.4)"        "8350 (6.2)"         
# 124   124 ""    ""    factor  "BMI_ge185lt230 = TRUE"                NA             "BMI [185~,230)"                   ""                   "116245 (41.0)"        "50610 (34.2)"      "65635 (48.3)"       
# 125   125 ""    ""    factor  "BMI_ge230lt250 = TRUE"                NA             "BMI [230~,250)"                   ""                   "69395 (24.5)"         "40004 (27.0)"      "29391 (21.6)"       
# 126   126 ""    ""    factor  "BMI_ge185lt250 = TRUE"                NA             "BMI [185~,250)"                   ""                   "185640 (65.4)"        "90614 (61.2)"      "95026 (70.0)"       
# 127   127 ""    ""    factor  "BMI_ge250lt300 = TRUE"                NA             "BMI [250~,300)"                   ""                   "76940 (27.1)"         "48558 (32.8)"      "28382 (20.9)"       
# 128   128 ""    ""    factor  "BMI_ge300 = TRUE"                     NA             "BMI >=300"                        ""                   "9270 (3.3)"           "5272 (3.6)"        "3998 (2.9)"         
# 129   129 ""    ""    factor  "BMI_ge350 = TRUE"                     NA             "BMI >=350"                        ""                   "768 (0.3)"            "368 (0.2)"         "400 (0.3)"          
# 130   130 ""    ""    factor  "BMI_ge400 = TRUE"                     NA             "BMI >=400"                        ""                   "101 (0.0)"            "44 (0.0)"          "57 (0.0)"           
# 131   131 ""    ""    factor  "BMI.cut4"                             NA             "BMI cut4"                         ""                   ""                     ""                  ""                   
# 132   132 ""    ""    level   "   [0,18.5)"                          NA             ""                                 "[0,18.5)"           "11948 (4.2)"          "3598 (2.4)"        "8350 (6.2)"         
# 133   133 ""    ""    level   "   [18.5,25)"                         NA             ""                                 "[18.5,25)"          "185640 (65.4)"        "90614 (61.2)"      "95026 (70.0)"       
# 134   134 ""    ""    level   "   [25,30)"                           NA             ""                                 "[25,30)"            "76940 (27.1)"         "48558 (32.8)"      "28382 (20.9)"       
# 135   135 ""    ""    level   "   [30,Inf]"                          NA             ""                                 "[30,Inf]"           "9270 (3.3)"           "5272 (3.6)"        "3998 (2.9)"         
               
# 141   141 ""    ""    factor  "BP_ESCESH2018"                        NA             "BP ESCESH2018"                    ""                   ""                     ""                  ""                   
# 142   142 ""    ""    level   "   (1) Optimal BP"                    NA             ""                                 "(1) Optimal BP"     "111610 (39.3)"        "44231 (29.9)"      "67379 (49.6)"       
# 143   143 ""    ""    level   "   (2) Normal BP"                     NA             ""                                 "(2) Normal BP"      "71381 (25.2)"         "40275 (27.2)"      "31106 (22.9)"       
# 144   144 ""    ""    level   "   (3) High Normal BP"                NA             ""                                 "(3) High Normal BP" "62210 (21.9)"         "39531 (26.7)"      "22679 (16.7)"       
# 145   145 ""    ""    level   "   (4) HTN Grade 1"                   NA             ""                                 "(4) HTN Grade 1"    "28045 (9.9)"          "17119 (11.6)"      "10926 (8.0)"        
# 146   146 ""    ""    level   "   (5) HTN Grade 2"                   NA             ""                                 "(5) HTN Grade 2"    "8548 (3.0)"           "5556 (3.8)"        "2992 (2.2)"         
# 147   147 ""    ""    level   "   (6) HTN Grade 3"                   NA             ""                                 "(6) HTN Grade 3"    "2004 (0.7)"           "1330 (0.9)"        "674 (0.5)"                         
               
               


DataSet.Table1byExposure.print_showAllLevels |> print(n=9) #---
# > DataSet.Table1byExposure.print_showAllLevels |> print(n=9) #---  
# # A tibble: 168 x 8
#   Variable           level    Overall       Male           Female         p        test  SMD    
#   <chr>              <chr>    <chr>         <chr>          <chr>          <chr>    <chr> <chr>  
# 1 "n"                ""       283798        148042         135756         ""       ""    ""     
# 2 "EnrollYear (%)"   "2009"   172819 (60.9) 96415 (65.1)   76404 (56.3)   "<0.001" ""    "0.182"
# 3 ""                 "2010"   110979 (39.1) 51627 (34.9)   59352 (43.7)   ""       ""    ""     
# 4 "SEX (%)"          "Male"   148042 (52.2) 148042 (100.0) 0 (0.0)        "<0.001" ""    "NaN"  
# 5 ""                 "Female" 135756 (47.8) 0 (0.0)        135756 (100.0) ""       ""    ""     
# 6 "IPSN_TYPE_CD (%)" "1"      37132 (13.1)  24839 (16.8)   12293 (9.1)    "<0.001" ""    "0.803"
# 7 ""                 "2"      24730 (8.7)   2617 (1.8)     22113 (16.3)   ""       ""    ""     
# 8 ""                 "5"      161426 (56.9) 102231 (69.1)  59195 (43.6)   ""       ""    ""     
# 9 ""                 "6"      59620 (21.0)  18044 (12.2)   41576 (30.6)   ""       ""    ""     
# # ... with 159 more rows

function.DataSet.Table1byExposure.print_showAllLevels.addCols = function(DataSet.Table1byExposure.print_showAllLevels) {
    DataSet.Table1byExposure.print_showAllLevels %>% add_row(.before = 1) |> 
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
DataSet.Table1byExposure.print_showAllLevels.addCols = DataSet.Table1byExposure.print_showAllLevels %>% function.DataSet.Table1byExposure.print_showAllLevels.addCols %>% function.df.edit_Label_Level %>% mutate(Level = level)
DataSet.Table1byExposure.print_showAllLevels.addCols |> print(n=999) #---
# > DataSet.Table1byExposure.print_showAllLevels.addCols = DataSet.Table1byExposure.print_showAllLevels %>% function.DataSet.Table1byExposure.print_showAllLevels.addCols %>% function.df.edit_Label_Level %>% mutate(Level = level)
# Warning messages:
# 1: Expected 2 pieces. Additional pieces discarded in 21 rows [25, 26, 27, 28, 29, 30, 31, 39, 40, 41, 70, 71, 72, 73, 74, 118, 139, 144, 145, 164, ...]. 
# 2: Expected 2 pieces. Additional pieces discarded in 21 rows [25, 26, 27, 28, 29, 30, 31, 39, 40, 41, 70, 71, 72, 73, 74, 118, 139, 144, 145, 164, ...]. 
# 3: Expected 2 pieces. Additional pieces discarded in 44 rows [3, 5, 7, 13, 16, 32, 42, 45, 48, 51, 54, 57, 61, 75, 77, 79, 81, 83, 85, 87, ...]. 
# 4: Expected 2 pieces. Additional pieces discarded in 44 rows [3, 5, 7, 13, 16, 32, 42, 45, 48, 51, 54, 57, 61, 75, 77, 79, 81, 83, 85, 87, ...]. 
# 5: Problem with `mutate()` input `p`.
# i NAs introduced by coercion
# i Input `p` is `as.numeric(if_else(p == "<0.001", "0", p))`. 
# 6: Problem with `mutate()` input `smd`.
# i NAs introduced by coercion
# i Input `smd` is `as.numeric(SMD)`. 
# > DataSet.Table1byExposure.print_showAllLevels.addCols |> print(n=999) #---  
# # A tibble: 169 x 28
#       `#` `#2`  Class VarType Variable                level           Label                    Level           Overall          `Group 1`      `Group 2`       SMD    `p-value` star      smd       p test  greatest G1geG2 G1leG2 G1mean   G1sd G2mean  G2sd    G1n G1prop    G2n G2prop
#     <int> <chr> <chr> <chr>   <chr>                   <chr>           <chr>                    <chr>           <chr>            <chr>          <chr>           <chr>  <chr>     <chr>   <dbl>   <dbl> <chr> <chr>    <lgl>  <lgl>   <dbl>  <dbl>  <dbl> <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
#   1     1 ""    ""    NA      "SEX"                   "level (N = )"  ""                       "level (N = )"  Overall (N = 28~ Male (N = 148~ Female (N = 13~ "SMD"  "p-value" "   "  NA      NA     "tes~ NANA     NA     NA      NA     NA     NA    NA        NA   NA       NA   NA  
#   2     2 ""    ""    NA      "n"                     ""              ""                       ""              283798           148042         135756          ""     ""        "   "  NA      NA     ""    NANA     NA     NA      NA     NA     NA    NA        NA   NA       NA   NA  
#   3     3 ""    ""    factor  "EnrollYear"            "2009"          "Enroll Year"            "2009"          172819 (60.9)    96415 (65.1)   76404 (56.3)    "0.18~ "<0.001"  "***"   0.182   0     ""    G1       TRUE   FALSE   NA     NA     NA    NA     96415   65.1  76404   56.3
#   4     4 ""    ""    NA      ""                      "2010"          ""                       "2010"          110979 (39.1)    51627 (34.9)   59352 (43.7)    ""     ""        "   "  NA      NA     ""    NANA     NA     NA      NA     NA     NA    NA        NA   NA       NA   NA  
#   5     5 ""    ""    factor  "SEX"                   "Male"          "SEX"                    "Male"          148042 (52.2)    148042 (100.0) 0 (0.0)         "NaN"  "<0.001"  "***" NaN       0     ""    G1       TRUE   FALSE   NA     NA     NA    NA    148042  100        0    0  
#   6     6 ""    ""    NA      ""                      "Female"        ""                       "Female"        135756 (47.8)    0 (0.0)        135756 (100.0)  ""     ""        "   "  NA      NA     ""    NANA     NA     NA      NA     NA     NA    NA        NA   NA       NA   NA  
#   7     7 ""    ""    factor  "IPSN_TYPE_CD"          "1"             "IPSN TYPE CD"           "1"             37132 (13.1)     24839 (16.8)   12293 (9.1)     "0.80~ "<0.001"  "***"   0.803   0     ""    G1       TRUE   FALSE   NA     NA     NA    NA     24839   16.8  12293    9.1
#   8     8 ""    ""    NA      ""                      "2"             ""                       "2"             24730 (8.7)      2617 (1.8)     22113 (16.3)    ""     ""        "   "  NA      NA     ""    NANA     NA     NA      NA     NA     NA    NA        NA   NA       NA   NA  
#   9     9 ""    ""    NA      ""                      "5"             ""                       "5"             161426 (56.9)    102231 (69.1)  59195 (43.6)    ""     ""        "   "  NA      NA     ""    NANA     NA     NA      NA     NA     NA    NA        NA   NA       NA   NA  
#               
               
               
               
               
           















# DataSet.Date.NA.rmAllNA = n1_2016_withlabels_EPI522_merge_n2_recode1026.factor.mutate %>% dplyr::filter(!is.na(Cigar)) %>% dplyr::filter(!n1ah0287 %in% c(1, 3, 9)) %>% select(-seqnum:-`_merge`, -matches("^count"))
DataSet.Date.NA.rmAllNA = n1_2016_withlabels_EPI522_merge_n2_recode1026.factor.mutate %>% select(-seqnum:-`_merge`, -matches("^count"))
DataSet.Date.NA.rmAllNA = DataSet.Date.NA.rmAllNA %>% mutate(
    Male.lgl = Male |> as.logical()
    , RaceWhite.lgl = RaceWhite |> as.logical()
    , HighSchoolLastYear.lgl = HighSchoolLastYear |> as.logical()
    , College1Year.lgl = College1Year |> as.logical()
    , CollegeGraduate.lgl = CollegeGraduate |> as.logical()
    , FamilyIncome_ge7000.lgl = FamilyIncome_ge7000 |> as.logical()
    , FamilyIncome_ge8000.lgl = FamilyIncome_ge8000 |> as.logical()
    , PMHx_diabetes.lgl = PMHx_diabetes |> as.logical()
    , PMHx_highBP.lgl = PMHx_highBP |> as.logical()
)

DataSet.Date.NA.rmAllNA %>% select(N1GM0392_recode, N1GM0394_recode, Cigar) |> summary() #---
# > DataSet.Date.NA.rmAllNA %>% select(N1GM0392_recode, N1GM0394_recode, Cigar) |> summary() #---  
#  N1GM0392_recode  N1GM0394_recode      Cigar        
#  Min.   : 0.000   Min.   : 0.000   Min.   :  24.99  
#  1st Qu.: 0.214   1st Qu.: 0.000   1st Qu.:  24.99  
#  Median : 0.643   Median : 0.500   Median :  24.99  
#  Mean   : 2.030   Mean   : 5.121   Mean   :  34.07  
#  3rd Qu.: 2.500   3rd Qu.: 7.000   3rd Qu.:  24.99  
#  Max.   :20.000   Max.   :50.000   Max.   :3910.71  
#  NA's   :13960    NA's   :13857    NA's   :7502 

DataSet.Date.NA.rmAllNA = DataSet.Date.NA.rmAllNA %>% mutate(
    MissingPattern = is.na(Cigar) * 100 + is.na(N1GM0392_recode) * 10 + is.na(N1GM0394_recode)
    , MissingPattern = as.factor(MissingPattern)
)


## @ DataSet.Table1byMissingPattern -----  
VarNames4MissingPattern =  c("MissingPattern")
# DataSet.Table1by_MissingPattern = DataSet.Date.NA.rmAllNA %>% select(-rowname, -PERSON_ID) |> as.data.frame() %>% 
#     CreateTableOne(strata = VarNames4MissingPattern, data = ., test = T, includeNA = T, addOverall = T)
DataSet.Table1by_MissingPattern = DataSet.Date.NA.rmAllNA %>% 
    {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 10) )]} |> as.data.frame() %>%  # debug181115 not to remove numeric 
    CreateTableOne(strata = VarNames4MissingPattern, data = ., test = T, includeNA = T, addOverall = T)
Vars4IQR = names(DataSet.Date.NA.rmAllNA)[DataSet.Date.NA.rmAllNA %>% map_lgl(is.numeric)]

sink(paste0(.path4write,"/","DataSet.Table1by_MissingPattern.txt"), append = FALSE)
DataSet.Table1by_MissingPattern |> print(showAllLevels = F, smd = T) ###### |> print(showAllLevels = F, smd = T) ---
sink(paste0(.path4write,"/","DataSet.Table1by_MissingPattern.IQR.txt"), append = FALSE)
DataSet.Table1by_MissingPattern |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) ###### |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) ---
sink()


# =NUMBERVALUE(MID(B2,1,SEARCH("(",B2,1)-1)) ---  
DataSet.Table1by_MissingPattern |> print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>%
    write.csv("DataSet.Table1by_MissingPattern -clean.csv")
if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open("DataSet.Table1by_MissingPattern -clean.csv")
# DataSet.Table1by_MissingPattern |> print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) |> rownames_to_column() %>%
#     openxlsx2::write_xlsx("DataSet.Table1by_MissingPattern -clean.xlsx")
# if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open("DataSet.Table1by_MissingPattern -clean.xlsx")
DataSet.Table1by_MissingPattern |> print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) |> rownames_to_column() %>% {.[1, 6]="=NUMBERVALUE(MID(B2,1,SEARCH(\"(\",B2,1)-1))"; .} %>% 
    mutate(Group0 = `Group 0`, Group1 = `Group 1`) %>% separate(Group0, into = paste0("Group0", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% separate(Group1, into = paste0("Group1", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% mutate(Group0mean = Group0mean %>% as.numeric, Group1mean = Group1mean %>% as.numeric, Group0sd = Group0sd %>% as.numeric, Group1sd = Group1sd %>% as.numeric, Group0larger = ifelse(Group0mean>Group1mean, 1, 0), Group1larger = ifelse(Group0mean<Group1mean, 1, 0)) %>%  # debug181115 mutate(Group0 = `Group 0`, Group1 = `Group 1`)
    openxlsx2::write_xlsx("DataSet.Table1by_MissingPattern.xlsx")
# if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open("DataSet.Table1by_MissingPattern.xlsx")
DataSet.Table1by_MissingPattern |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) |> as.data.frame() |> rownames_to_column() %>% 
    openxlsx2::write_xlsx("DataSet.Table1by_MissingPattern.IQR.xlsx")
# if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open("DataSet.Table1by_MissingPattern.IQR.xlsx")























## @ library(survey) =====  
.packagename = "survey"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
# ?svydesign
#   data(api)
# # stratified sample
# dstrat<-svydesign(id=~1,strata=~stype, weights=~pw, data=apistrat, fpc=~fpc)
# # one-stage cluster sample
# dclus1<-svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)
# # two-stage cluster sample: weights computed from population sizes.
# dclus2<-svydesign(id=~dnum+snum, fpc=~fpc1+fpc2, data=apiclus2)
# 
# ## multistage sampling has no effect when fpc is not given, so
# ## these are equivalent.
# dclus2wr<-svydesign(id=~dnum+snum, weights=weights(dclus2), data=apiclus2)
# dclus2wr2<-svydesign(id=~dnum, weights=weights(dclus2), data=apiclus2)
# 
# ## syntax for stratified cluster sample
# ##(though the data weren't really sampled this way)
# svydesign(id=~dnum, strata=~stype, weights=~pw, data=apistrat,
# nest=TRUE)
# 
# ## PPS sampling without replacement
# data(election)
# dpps<- svydesign(id=~1, fpc=~p, data=election_pps, pps="brewer")
# 
# ##database example: requires RSQLite
# ## Not run: 
# library(RSQLite)
# dbclus1<-svydesign(id=~dnum, weights=~pw, fpc=~fpc,
# data="apiclus1",dbtype="SQLite", dbname=system.file("api.db",package="survey"))
# 
# ## End(Not run)


DataSet.svydesign = DataSet.Date.NA.rmAllNA %>% svydesign(id = ~PrimarySamplingUnit, strata = ~SamplingStrata, weights = ~SamplingWeight, nest = TRUE, data = . , pps="brewer")
# DataSet.svydesign = DataSet.Date.NA.rmAllNA %>% svydesign(id = ~PSUNEST, strata = ~BOROSTRATUM, weights = ~CAPI_WT, nest = TRUE, data = . , pps="brewer")



## @ DataSet.svydesign.svyCreateTable1 -----  
DataSet.svydesign.Table1 = DataSet.svydesign %>% select(-rowname, -PERSON_ID) %>%
    {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 10) )]} |> as.data.frame() %>%  # debug181115 not to remove numeric 
    svyCreateTableOne(data = ., test = T, includeNA = T, addOverall = T)
Vars4IQR = names(DataSet.svydesign)[DataSet.svydesign %>% map_lgl(is.numeric)]

sink(paste0(.path4write,"/","DataSet.svydesign.Table1.txt"), append = FALSE)
DataSet.svydesign.Table1 |> print(showAllLevels = F, smd = T) ###### |> print(showAllLevels = F, smd = T) ---
sink(paste0(.path4write,"/","DataSet.svydesign.Table1.IQR.txt"), append = FALSE)
DataSet.svydesign.Table1 |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) ###### |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) ---
sink()

# =NUMBERVALUE(MID(B2,1,SEARCH("(",B2,1)-1))
DataSet.svydesign.Table1 |> print(showAllLevels = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% 
    write.csv("DataSet.svydesign.Table1 -clean.csv")
if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open("DataSet.svydesign.Table1 -clean.csv")
# DataSet.svydesign.Table1 |> print(showAllLevels = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) |> rownames_to_column() %>% 
#     openxlsx2::write_xlsx("DataSet.svydesign.Table1 -clean.xlsx")
# if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open("DataSet.svydesign.Table1 -clean.xlsx")
DataSet.svydesign.Table1 |> print(showAllLevels = F, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) |> rownames_to_column() %>% 
    openxlsx2::write_xlsx("DataSet.svydesign.Table1.xlsx")
if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open("DataSet.svydesign.Table1.xlsx")
DataSet.svydesign.Table1 |> print(showAllLevels = F, nonnormal = Vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) |> as.data.frame() |> rownames_to_column() %>% 
    openxlsx2::write_xlsx("DataSet.svydesign.Table1.IQR.xlsx")
if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open("DataSet.svydesign.Table1.IQR.xlsx")


## @ DataSet.svydesign.svyTable1byExposure -----  
VarNames4Exposure =  c("treatment")
# DataSet.svydesign.Table1byExposure = DataSet.svydesign %>% select(-rowname, -PERSON_ID) %>%
#     svyCreateTableOne(strata = VarNames4Exposure, data = ., test = T, includeNA = T, addOverall = T)
# # Error in dimnames(x) <- dn : 
# #   length of 'dimnames' [2] not equal to array extent
DataSet.svydesign.Table1byExposure = DataSet.svydesign %>% select(-rowname, -PERSON_ID) %>%
    {.[map_lgl(., function(vec) if_else(is.numeric(vec), T, n_distinct(vec) <= 10) )]} |> as.data.frame() %>%  # debug181115 not to remove numeric 
    svyCreateTableOne(strata = VarNames4Exposure, data = ., test = T)
Vars4IQR = names(DataSet.svydesign)[DataSet.svydesign %>% map_lgl(is.numeric)]

sink(paste0(.path4write,"/","DataSet.svydesign.Table1byExposure.txt"), append = FALSE)
DataSet.svydesign.Table1byExposure |> print(showAllLevels = F, smd = T) ###### |> print(showAllLevels = F, smd = T) ---
sink(paste0(.path4write,"/","DataSet.svydesign.Table1byExposure.IQR.txt"), append = FALSE)
DataSet.svydesign.Table1byExposure |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) ###### |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR) ---
sink()
               

# =NUMBERVALUE(MID(B2,1,SEARCH("(",B2,1)-1))
DataSet.svydesign.Table1byExposure |> print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>%
    write.csv("DataSet.svydesign.Table1byExposure -clean.csv")
if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open("DataSet.svydesign.Table1byExposure -clean.csv")
# DataSet.svydesign.Table1byExposure |> print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) |> rownames_to_column() %>%
#     openxlsx2::write_xlsx("DataSet.svydesign.Table1byExposure -clean.xlsx")
# if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open("DataSet.svydesign.Table1byExposure -clean.xlsx")
DataSet.svydesign.Table1byExposure |> print(showAllLevels = F, smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) %>% as.data.frame(stringsAsFactors = F) |> rownames_to_column() %>% {.[1, 6]="=NUMBERVALUE(MID(B2,1,SEARCH(\"(\",B2,1)-1))"; .} %>% 
    mutate(Group0 = `Group 0`, Group1 = `Group 1`) %>% separate(Group0, into = paste0("Group0", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% separate(Group1, into = paste0("Group1", c("mean", "sd", "larger")), sep = "[\\(\\)]") %>% mutate(Group0mean = Group0mean %>% as.numeric, Group1mean = Group1mean %>% as.numeric, Group0sd = Group0sd %>% as.numeric, Group1sd = Group1sd %>% as.numeric, Group0larger = ifelse(Group0mean>Group1mean, 1, 0), Group1larger = ifelse(Group0mean<Group1mean, 1, 0)) %>%  # debug181115 mutate(Group0 = `Group 0`, Group1 = `Group 1`)
    openxlsx2::write_xlsx("DataSet.svydesign.Table1byExposure.xlsx")
if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open("DataSet.svydesign.Table1byExposure.xlsx")
DataSet.svydesign.Table1byExposure |> print(showAllLevels = F, smd = T, nonnormal = Vars4IQR, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) |> as.data.frame() |> rownames_to_column() %>% 
    openxlsx2::write_xlsx("DataSet.svydesign.Table1byExposure.IQR.xlsx")
if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open("DataSet.svydesign.Table1byExposure.IQR.xlsx")



## @ ------  
df = JK02.2079.CCW.MIN_Date.ge365_EndTime.is.Case.confirm.365.Match.TimeFrame1$LookBackWindow.gt.1y %>% 
  dplyr::filter(MatchingCtrlNum %in% c(0, 1)) %>%
  select(AcquiredHypothyroidism: VisualImpairment, EndTime.is.Case.confirm.365)
df
df %>% 
  CreateTableOne(strata = treatment, data = ., test=FALSE) %>% 
  print(showAllLevels = F, smd = T)



## @ Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1 -----  
Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1 |> str(max.level = 1)
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1 |> str(max.level = 1)
# List of 5
#  $ _3yr:List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ _4yr:List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ _5yr:List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ _6yr:List of 3
#   ..- attr(*, "class")= chr "tableone"
#  $ _7yr:List of 3
#   ..- attr(*, "class")= chr "tableone"

Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1$`_5yr`$CatTable$`TRUE`$enddate.is
Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1$`_5yr`$CatTable$`TRUE`$enddate.is |> str()
Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1$`_5yr`$CatTable$`TRUE`$enddate.is %>% dplyr::filter(level == "DTH_MDY")
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1$`_5yr`$CatTable$`TRUE`$enddate.is
#       n miss p.miss          level  freq   percent cum.percent
# 1 53377    0      0     2013-12-31  1163  2.178841    2.178841
# 2 53377    0      0        DTH_MDY  4920  9.217453   11.396294
# 3 53377    0      0   RECU_FR_DT_C 40873 76.574180   87.970474
# 4 53377    0      0 RECU_FR_DT_C16  6421 12.029526  100.000000
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1$`_5yr`$CatTable$`TRUE`$enddate.is |> str()
# 'data.frame':	4 obs. of  7 variables:
#  $ n          : int  53377 53377 53377 53377
#  $ miss       : int  0 0 0 0
#  $ p.miss     : num  0 0 0 0
#  $ level      : Factor w/ 4 levels "2013-12-31","DTH_MDY",..: 1 2 3 4
#  $ freq       : 'table' int [1:4(1d)] 1163 4920 40873 6421
#   ..- attr(*, "dimnames")=List of 1
#   .. ..$ x: chr  "2013-12-31" "DTH_MDY" "RECU_FR_DT_C" "RECU_FR_DT_C16"
#  $ percent    : table [1:4(1d)] 2.18 9.22 76.57 12.03
#   ..- attr(*, "dimnames")=List of 1
#   .. ..$ x: chr  "2013-12-31" "DTH_MDY" "RECU_FR_DT_C" "RECU_FR_DT_C16"
#  $ cum.percent: num  2.18 11.4 87.97 100
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1$`_5yr`$CatTable$`TRUE`$enddate.is %>% dplyr::filter(level == "DTH_MDY")
#       n miss p.miss   level freq  percent cum.percent
# 1 53377    0      0 DTH_MDY 4920 9.217453    11.39629

attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1$`_5yr`$CatTable,"xtabs")$enddate.is
attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1$`_5yr`$CatTable,"xtabs")$enddate.is |> str()
attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1$`_5yr`$CatTable,"xtabs")$enddate.is %>% sum
# > attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1$`_5yr`$CatTable,"xtabs")$enddate.is
#                 is.dropped_5yr
# enddate.is        FALSE   TRUE
#   2013-12-31     385578   1163
#   DTH_MDY         12341   4920
#   RECU_FR_DT_C    56833  40873
#   RECU_FR_DT_C16   6737   6421
# > attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1$`_5yr`$CatTable,"xtabs")$enddate.is |> str()
#  'xtabs' int [1:4, 1:2] 385578 12341 56833 6737 1163 4920 40873 6421
#  - attr(*, "dimnames")=List of 2
#   ..$ enddate.is    : chr [1:4] "2013-12-31" "DTH_MDY" "RECU_FR_DT_C" "RECU_FR_DT_C16"
#   ..$ is.dropped_5yr: chr [1:2] "FALSE" "TRUE"
#  - attr(*, "call")= language xtabs(formula = formula, data = dat)
# > attr(Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1$`_5yr`$CatTable,"xtabs")$enddate.is %>% sum
# [1] 514866


Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1 %>% map(function(ob) {
    ob$CatTable$`TRUE`$enddate.is %>% dplyr::filter(level %in% c("DTH_MDY", "RECU_FR_DT_C16") )
})
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1 %>% map(function(ob) {
# +     ob$CatTable$`TRUE`$enddate.is %>% dplyr::filter(level %in% c("DTH_MDY", "RECU_FR_DT_C16") )
# + })
# $`_3yr`
#       n miss p.miss          level freq   percent cum.percent
# 1 33330    0      0        DTH_MDY 2090  6.270627    9.177918
# 2 33330    0      0 RECU_FR_DT_C16 4317 12.952295  100.000000
# 
# $`_4yr`
#       n miss p.miss          level freq   percent cum.percent
# 1 43643    0      0        DTH_MDY 3471  7.953165    10.41862
# 2 43643    0      0 RECU_FR_DT_C16 5430 12.441858   100.00000
# 
# $`_5yr`
#       n miss p.miss          level freq   percent cum.percent
# 1 53377    0      0        DTH_MDY 4920  9.217453    11.39629
# 2 53377    0      0 RECU_FR_DT_C16 6421 12.029526   100.00000
# 
# $`_6yr`
#       n miss p.miss          level freq  percent cum.percent
# 1 63438    0      0        DTH_MDY 6552 10.32819    12.36325
# 2 63438    0      0 RECU_FR_DT_C16 7333 11.55932   100.00000
# 
# $`_7yr`
#       n miss p.miss          level freq  percent cum.percent
# 1 74397    0      0        DTH_MDY 8120 10.91442    12.76127
# 2 74397    0      0 RECU_FR_DT_C16 8312 11.17249   100.00000


Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1 %>% map(function(ob) {
    # Codes to insert inside in the beginning annonymous function for map
    parent.x = get(".x", envir = parent.frame())
    i = which(map_lgl(parent.x, function(children_from_parent.x) { identical(children_from_parent.x, ob) } ))

    # Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) 
    ###### |> print(Sys.time())
    #  print(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #---" ))
    cat(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #--- \n" ))

    out = ob$CatTable$`TRUE`$enddate.is %>% dplyr::filter(level %in% c("DTH_MDY", "RECU_FR_DT_C16") )
    out = out |> rownames_to_column()
    names(out)[1] = "parent"
    out$parent = names(parent.x)[i]
    out
}) %>% reduce(rbind)
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1 %>% map(function(ob) {
# +     # Codes to insert inside in the beginning annonymous function for map
# +     parent.x = get(".x", envir = parent.frame())
# +     i = which(map_lgl(parent.x, function(children_from_parent.x) { identical(children_from_parent.x, ob) } ))
# + 
# +     # Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) 
# +     ###### |> print(Sys.time())
# +     #  print(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #---" ))
# +     cat(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #--- \n" ))
# + 
# +     out = ob$CatTable$`TRUE`$enddate.is %>% dplyr::filter(level %in% c("DTH_MDY", "RECU_FR_DT_C16") )
# +     out = out |> rownames_to_column()
# +     names(out)[1] = "parent"
# +     out$parent = names(parent.x)[i]
# +     out
# + }) %>% reduce(rbind)
# Beginning .f() map from list element [[1]] named: _3yr  #---  
# Beginning .f() map from list element [[2]] named: _4yr  #---  
# Beginning .f() map from list element [[3]] named: _5yr  #---  
# Beginning .f() map from list element [[4]] named: _6yr  #---  
# Beginning .f() map from list element [[5]] named: _7yr  #---  
#    parent     n miss p.miss          level freq   percent cum.percent
# 1    _3yr 33330    0      0        DTH_MDY 2090  6.270627    9.177918
# 2    _3yr 33330    0      0 RECU_FR_DT_C16 4317 12.952295  100.000000
# 3    _4yr 43643    0      0        DTH_MDY 3471  7.953165   10.418624
# 4    _4yr 43643    0      0 RECU_FR_DT_C16 5430 12.441858  100.000000
# 5    _5yr 53377    0      0        DTH_MDY 4920  9.217453   11.396294
# 6    _5yr 53377    0      0 RECU_FR_DT_C16 6421 12.029526  100.000000
# 7    _6yr 63438    0      0        DTH_MDY 6552 10.328194   12.363252
# 8    _6yr 63438    0      0 RECU_FR_DT_C16 7333 11.559318  100.000000
# 9    _7yr 74397    0      0        DTH_MDY 8120 10.914419   12.761267
# 10   _7yr 74397    0      0 RECU_FR_DT_C16 8312 11.172494  100.000000


Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1.TRUE_enddate.is = Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1 %>% map(function(ob) {
    # Codes to insert inside in the beginning annonymous function for map
    parent.x = get(".x", envir = parent.frame())
    i = which(map_lgl(parent.x, function(children_from_parent.x) { identical(children_from_parent.x, ob) } ))

    # Sys.time_1 <- Sys.time() ; print(paste0("Sys.time_1 : ", Sys.time() )) 
    ###### |> print(Sys.time())
    #  print(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #---" ))
    cat(paste0("Beginning .f() map from list element [[", i, "]] named: ", ifelse ( is.null(names(parent.x)[i]), "NULL", names(parent.x)[i] ), "  #--- \n" ))

    # out = ob$CatTable$`TRUE`$enddate.is %>% dplyr::filter(level %in% c("DTH_MDY", "RECU_FR_DT_C16") )
    out = ob$CatTable$`TRUE`$enddate.is
    out = out |> rownames_to_column()
    names(out)[1] = "parent"
    out$parent = names(parent.x)[i]
    out
}) %>% reduce(rbind)
Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1.TRUE_enddate.is
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1.TRUE_enddate.is
#    parent     n miss p.miss          level  freq   percent cum.percent
# 1    _3yr 33330    0      0     2013-12-31   969  2.907291    2.907291
# 2    _3yr 33330    0      0        DTH_MDY  2090  6.270627    9.177918
# 3    _3yr 33330    0      0   RECU_FR_DT_C 25954 77.869787   87.047705
# 4    _3yr 33330    0      0 RECU_FR_DT_C16  4317 12.952295  100.000000
# 5    _4yr 43643    0      0     2013-12-31  1076  2.465458    2.465458
# 6    _4yr 43643    0      0        DTH_MDY  3471  7.953165   10.418624
# 7    _4yr 43643    0      0   RECU_FR_DT_C 33666 77.139518   87.558142
# 8    _4yr 43643    0      0 RECU_FR_DT_C16  5430 12.441858  100.000000
# 9    _5yr 53377    0      0     2013-12-31  1163  2.178841    2.178841
# 10   _5yr 53377    0      0        DTH_MDY  4920  9.217453   11.396294
# 11   _5yr 53377    0      0   RECU_FR_DT_C 40873 76.574180   87.970474
# 12   _5yr 53377    0      0 RECU_FR_DT_C16  6421 12.029526  100.000000
# 13   _6yr 63438    0      0     2013-12-31  1291  2.035058    2.035058
# 14   _6yr 63438    0      0        DTH_MDY  6552 10.328194   12.363252
# 15   _6yr 63438    0      0   RECU_FR_DT_C 48262 76.077430   88.440682
# 16   _6yr 63438    0      0 RECU_FR_DT_C16  7333 11.559318  100.000000
# 17   _7yr 74397    0      0     2013-12-31  1374  1.846849    1.846849
# 18   _7yr 74397    0      0        DTH_MDY  8120 10.914419   12.761267
# 19   _7yr 74397    0      0   RECU_FR_DT_C 56591 76.066239   88.827506
# 20   _7yr 74397    0      0 RECU_FR_DT_C16  8312 11.172494  100.000000


Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1.TRUE_enddate.is %>% dplyr::filter(level == "DTH_MDY") %>% mutate(n.increased = n - dplyr::lag(n), freq.increased = freq - dplyr::lag(freq), cancer.increased = n.increased - freq.increased)
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1.TRUE_enddate.is %>% dplyr::filter(level == "DTH_MDY") %>% mutate(n.increased = n - dplyr::lag(n), freq.increased = freq - dplyr::lag(freq), cancer.increased = n.increased - freq.increased)
#   parent     n miss p.miss   level freq   percent cum.percent n.increased freq.increased cancer.increased
# 1   _3yr 33330    0      0 DTH_MDY 2090  6.270627    9.177918          NA             NA               NA
# 2   _4yr 43643    0      0 DTH_MDY 3471  7.953165   10.418624       10313           1381             8932
# 3   _5yr 53377    0      0 DTH_MDY 4920  9.217453   11.396294        9734           1449             8285
# 4   _6yr 63438    0      0 DTH_MDY 6552 10.328194   12.363252       10061           1632             8429
# 5   _7yr 74397    0      0 DTH_MDY 8120 10.914419   12.761267       10959           1568             9391

Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1.TRUE_enddate.is %>% dplyr::filter(level == "RECU_FR_DT_C16") %>% mutate(n.increased = n - dplyr::lag(n), freq.increased = freq - dplyr::lag(freq))
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1.TRUE_enddate.is %>% dplyr::filter(level == "RECU_FR_DT_C16") %>% mutate(n.increased = n - dplyr::lag(n), freq.increased = freq - dplyr::lag(freq))
#   parent     n miss p.miss          level freq  percent cum.percent n.increased freq.increased
# 1   _3yr 33330    0      0 RECU_FR_DT_C16 4317 12.95230         100          NA             NA
# 2   _4yr 43643    0      0 RECU_FR_DT_C16 5430 12.44186         100       10313           1113
# 3   _5yr 53377    0      0 RECU_FR_DT_C16 6421 12.02953         100        9734            991
# 4   _6yr 63438    0      0 RECU_FR_DT_C16 7333 11.55932         100       10061            912
# 5   _7yr 74397    0      0 RECU_FR_DT_C16 8312 11.17249         100       10959            979

Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1.TRUE_enddate.is |> str()
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1.TRUE_enddate.is |> str()
# 'data.frame':	20 obs. of  8 variables:
#  $ parent     : chr  "_3yr" "_3yr" "_3yr" "_3yr" ...
#  $ n          : int  33330 33330 33330 33330 43643 43643 43643 43643 53377 53377 ...
#  $ miss       : int  0 0 0 0 0 0 0 0 0 0 ...
#  $ p.miss     : num  0 0 0 0 0 0 0 0 0 0 ...
#  $ level      : Factor w/ 4 levels "2013-12-31","DTH_MDY",..: 1 2 3 4 1 2 3 4 1 2 ...
#  $ freq       :Class 'table'  Named int [1:20] 969 2090 25954 4317 1076 3471 33666 5430 1163 4920 ...
#   .. ..- attr(*, "names")= chr [1:20] "2013-12-31" "DTH_MDY" "RECU_FR_DT_C" "RECU_FR_DT_C16" ...
#  $ percent    :Class 'table'  Named num [1:20] 2.91 6.27 77.87 12.95 2.47 ...
#   .. ..- attr(*, "names")= chr [1:20] "2013-12-31" "DTH_MDY" "RECU_FR_DT_C" "RECU_FR_DT_C16" ...
#  $ cum.percent: num  2.91 9.18 87.05 100 2.47 ...


Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1.TRUE_enddate.is %>% 
    ggplot(aes(x = parent, y = freq, color = level)) + geom_point()
Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1.TRUE_enddate.is %>% 
    ggplot(aes(x = as.factor(parent), y = freq, color = level)) + geom_point()
Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1.TRUE_enddate.is %>% 
    ggplot(aes(x = as.numeric(as.factor(parent)), y = freq, color = level)) + geom_point()
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1.TRUE_enddate.is %>% 
# +     ggplot(aes(x = parent, y = freq, color = level)) + geom_point()
# Don't know how to automatically pick scale for .object of type table. Defaulting to continuous.
# Error in dimnames(x) <- dnx : 'dimnames' applied to non-array
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1.TRUE_enddate.is %>% 
# +     ggplot(aes(x = as.factor(parent), y = freq, color = level)) + geom_point()
# Don't know how to automatically pick scale for .object of type table. Defaulting to continuous.
# Error in dimnames(x) <- dnx : 'dimnames' applied to non-array
# > Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1.TRUE_enddate.is %>% 
# +     ggplot(aes(x = as.numeric(as.factor(parent)), y = freq, color = level)) + geom_point()
# Don't know how to automatically pick scale for .object of type table. Defaulting to continuous.
# Error in dimnames(x) <- dnx : 'dimnames' applied to non-array

Heals_FinalCohortFile_161022do.dta_nan_as_factor_droplevels.is.dropped_34567yr.Table1.TRUE_enddate.is %>% 
    ggplot(aes(x = parent, y = as.numeric(freq), group = level, color = level)) + geom_point() + geom_smooth(method = lm)
  
  
# __________|------  
# @@ END------  
analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_Vars23.Table1.list = list()
analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_Vars23.Table1.list$by.evnttrth_C16_r =
    analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_Vars23.Table1by.evnttrth_C16_r
analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_Vars23.Table1.list$by.total_ddd_yr_ASPIRIN.dyd.gt0 =
    analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_Vars23.Table1by.total_ddd_yr_ASPIRIN.dyd.gt0
analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_Vars23.Table1.list$by.total_ddd_yr_ASPIRIN.bin30 =
    analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_Vars23.Table1by.total_ddd_yr_ASPIRIN.bin30
analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_Vars23.Table1.list$by.total_ddd_yr_ASPIRIN.dyd.gt1 =
    analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_Vars23.Table1by.total_ddd_yr_ASPIRIN.dyd.gt1
analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_Vars23.Table1.list$by.total_ddd_yr_ASPIRIN.dyd.gt4 =
    analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_Vars23.Table1by.total_ddd_yr_ASPIRIN.dyd.gt4
analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_Vars23.Table1.list$by.total_ddd_yr_ASPIRIN.cut365 =
    analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_Vars23.Table1by.total_ddd_yr_ASPIRIN.cut365
save(analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_Vars23.Table1.list, file = "analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_Vars23.Table1.list.rda")

analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_Vars23.Table1.list %>% map(function(ob) {
    ob |> print(smd = T, nonnormal = NULL, exact = NULL, quote = FALSE, noSpaces = TRUE, printToggle = FALSE) |> as.data.frame() |> rownames_to_column()
}) %>% openxlsx2::write_xlsx("analyticDF.AddVar.pmhx_negativetime.excluded.list.bin_5yr_Vars23.Table1.list.xlsx")


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
