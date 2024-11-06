# @@ Now included in f_df.t.tribble_construct.source.r ----


# Rproject_Infertility\00env1-NationalFamilyAndFertiltySurvey2021_230314.Rmd

# ## \$ MetaData\$tblVarName[[.filename.xlsx]]\$qryCodebookSelect ----  
# ```{r qryCodebookSelect-NoEcho, echo=FALSE, results="markup", collapse=TRUE, paged.print=FALSE, comment="", R.options=list(width=120)}
# options(width=120)  
# if(!"ProjectDocuments" %in% names(.GlobalEnv$env1$path)) env1$path$ProjectDocuments = "ProjectDocuments"  
# ##________________________________________________________________________________  
# .filename.xlsx = "NationalFamilyAndFertiltySurvey2021_230314_CodeBookQuery.xlsx"  
# cat(" excel_sheets(",.filename.xlsx,") == ",deparse(readxl::excel_sheets(file.path(env1$path$ProjectDocuments,.filename.xlsx))),"  \n", sep="")  
#   
# MetaData$tblVarName[[.filename.xlsx]] = readxl::excel_sheets(file.path(env1$path$ProjectDocuments,.filename.xlsx)) |> set_names() |> map(function(SheetName) {readxl::read_excel(file.path(env1$path$ProjectDocuments,.filename.xlsx), sheet=SheetName)})  
# MetaData$tblVarName[[.filename.xlsx]] = MetaData$tblVarName[[.filename.xlsx]] |> map(function(df) {if(!"Num" %in% names(df)) {df = df |> rownames_to_column("Num")} ; return(df) })  
# cat(" > str(MetaData$tblVarName$",.filename.xlsx,")","  \n", sep=""); str(MetaData$tblVarName[[.filename.xlsx]])  
# cat("    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    \n")  
# if("qryCodebookSelect" %in% names (MetaData$tblVarName[[.filename.xlsx]])) { 
#     cat(" > print(MetaData$tblVarName$",.filename.xlsx,"$qryCodebookSelect, n=99)", "  \n", sep="")
#         print(MetaData$tblVarName[[.filename.xlsx]]$qryCodebookSelect, n=99)
# } else {
#     cat(" > print(MetaData$tblVarName$",.filename.xlsx,", n=99)","\n", "List of ",length(MetaData$tblVarName[[.filename.xlsx]]),"  \n", sep=""); for(i in names(MetaData$tblVarName[[.filename.xlsx]])) {cat("  $ ",i,"  \n", sep=""); print(MetaData$tblVarName[[.filename.xlsx]][[i]], n=99);cat(" \n")}  
#     cat(" > print(MetaData$tblVarName$",.filename.xlsx,", n=99)","\n", "List of ",length(MetaData$tblVarName[[.filename.xlsx]]),"  \n", sep=""); for(i in names(MetaData$tblVarName[[.filename.xlsx]])) {cat("  $ ",i,"  \n", sep=""); print(MetaData$tblVarName[[.filename.xlsx]][[i]], n=99);cat(" \n")}  
# }
# ```



## env1 |> as.list() |> str(max.level = 2, give.attr = FALSE) ----
env1 |> as.list() |> str(max.level = 2, give.attr = FALSE)  
env1 |> as.list() |> str(max.level = 2, give.attr = FALSE, width = 80)  
env1 |> as.list() |> str(max.level = 2, give.attr = FALSE, strict.width = "cut")  
env1 |> as.list() |> str(max.level = 2, give.attr = FALSE, strict.width = "cut", width = 80)  
env1 |> as.list() |> str(max.level = 2, give.attr = FALSE, strict.width = "wrap")  
env1 |> as.list() |> str(max.level = 2, give.attr = FALSE, strict.width = "wrap", width = 80)  
# > env1 |> as.list() |> str(max.level = 2, give.attr = FALSE)  
# List of 5
#  $ env.internal:<environment: 0x55fff4433250> 
#  $ info        :List of 9
#   ..$ GUI             : chr "X11"
#   ..$ os_type         : chr "unix"
#   ..$ os_sysname      : chr "Linux"
#   ..$ os_version      : chr "#1 SMP Fri Mar 29 23:14:13 UTC 2024"
#   ..$ machine_type    : chr "x86_64"
#   ..$ machine_nodename: chr "059a785fbdc6"
#   ..$ machine_cpu     : chr "13th Gen Intel(R) Core(TM) i7-13700KF"
#   ..$ Sys.getlocale   :List of 4
#   ..$ l10n_info       :List of 5
#  $ f           :List of 29
#   ..$ f_CodeText.echo                             :function (.CodeText, Execute = FALSE, deparse_cat = TRUE, LinePrefix4CodeText = "\t", LinePrefix4Output = "\t## ", 
#     substitute_ObjectNames = TRUE, ObjectNames4substitute = NULL, VERBOSE = FALSE)  
#   ..$ f_TerminalFromRCodeText.echo                :function (.TerminalCodeText, Execute = FALSE)  
#   ..$ f_file.switch_open                          :function (file)  
#   ..$ f_URL.open_in_edge_app                      :function (URL)  
#   ..$ f_URL.open_in_edge_app.printPowerShellCode  :function (URL)  
#   ..$ f_path.relative                             :function (path, basepath = env1$path$path1)  
#   ..$ f_file.git_lfs_track_add_f                  :function (.path_file, Execute = FALSE)  
#   ..$ f.updateTemplates                           :function (.path4APPDATA_RStudio = NULL)  
#   ..$ f_expression.substitute_echo_and_dput       :function (expr_text, expression_equals_evaluation = FALSE, .VERBOSE = FALSE)  
#   ..$ f_df.tribble_construct                      :function (df)  
#   ..$ f_df.transpose                              :function (df, varname4rowname = "varname")  
#   ..$ f_df.t.tribble_construct                    :function (df)  
#   ..$ f_vec.dput_line_by_line                     :function (vec, space_between_vec_elements = "  \n  ", sep_parentheses = FALSE, end_of_text = "  \n")  
#   ..$ f_list.dput_line_by_line                    :function (list_vec, space_between_vec_elements = "\n         ", space_between_list_elements = "\n     ", 
#     sep_parentheses = FALSE, end_of_text = "\n")  
#   ..$ f_vec1_vec2.setdiff_list                         :function (vec1, vec2)  
#   ..$ f_df.print_byVar                            :function (df, byVar, n = NULL)  
#   ..$ f_df.add_VarNameT.deltaT0                   :function (DataSet.Date.NA.rmAllNA, VarName0, VarNameT, prefix = "", suffix = ".deltaT0")  
#   ..$ f_df.add_VarNameT.pdT0                      :function (DataSet.Date.NA.rmAllNA, VarName0, VarNameT, prefix = "", suffix = ".pdT0")  
#   ..$ f_df.add_RegExVars.cut                      :function (DataSet.Date.NA.rmAllNA, regex_pattern = ".", breaks = c(-Inf, -0.1, -0.05, 0.05, 0.1, Inf), 
#     suffix = paste0(".cut", length(breaks) - 1))  
#   ..$ f_df.add_RegExVars.quintile_factor          :function (DataSet.Date.NA.rmAllNA, regex_pattern, factor.ordered = FALSE)  
#   ..$ f_df.add_RegExVars.quartile_factor          :function (DataSet.Date.NA.rmAllNA, regex_pattern, factor.ordered = FALSE)  
#   ..$ f_formula.lhs_rhs_vars                      :function (formula, include_input_in_output = TRUE)  
#   ..$ f_list_formula.append_lhs_rhs_vars          :function (list_formula)  
#   ..$ f_path.size_files                           :function (.path4read = getwd(), literal_filename = NA, regex4filename = "\\.(rdata|rda|rds|csv|sas7bdat)(\\.[gx]z)?$", 
#     print2console = TRUE, VERBOSE = FALSE)  
#   ..$ f_DataSet_path_filename_ext.read.checkEntity:function (DataSet_path_filename_ext, vec_candidate4ID = c("rowname", "rownum", "Num", "ID", "CompositeKey", 
#     "PERSON_ID", "RN_INDI", "NIHID"), .width.cutoff = 120 - 15, print2console = TRUE, return.output = TRUE, 
#     print.name.dput = FALSE, print.names.tidyeval = FALSE, VERBOSE = FALSE)  
#   ..$ f_DataSetName.Search.read.checkEntity       :function (DataSetName, ext = "rds", .path4read = c(".", "data"), vec_candidate4ID = c("rowname", "rownum", 
#     "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID"), BreathFirstSearch = TRUE, max_depth = 3, 
#     .width.cutoff = 120 - 15, print2console = TRUE, return.output = TRUE, print.name.dput = FALSE, print.names.tidyeval = FALSE, 
#     VERBOSE = FALSE)  
#   ..$ f_df.NotNA_p_df                             :function (data)  
#   ..$ f_df.printVars_byMainOutcome                :function (DataSet, MainOutcome, VarName.selected)  
#   ..$ f_df.Table1byExposure.xlsx                  :function (DataSet.Date.NA.rmAllNA.select, DataSetName4output = "DataSet", VarNames4Exposure = c("InterventionGroup"), 
#     output.sink = FALSE, output.xlsx = TRUE, Table1byExposure.print = TRUE)  
#  $ source      :List of 11
#   ..$ .Rprofile                                     : chr "/home/rstudio/github_tidystat/.Rprofile"
#   ..$ env1$env.internal.source.r                    : chr "~/github_tidystat/env1$env.internal.source.r"
#   ..$ internal.f_path0.list_path_hierarchy.source.r : chr "~/github_tidystat/internal.f_path0.list_path_hierarchy.source.r"
#   ..$ f_expression.substitute_echo_and_dput.source.r: chr "~/github_tidystat/Rdev/00_base_program/007_base_expression/f_expression.substitute_echo_and_dput.source.r"
#   ..$ f_df.t.tribble_construct.source.r             : chr "~/github_tidystat/f_df.t.tribble_construct.source.r"
#   ..$ f_path.size_files.source.r                    : chr "~/github_tidystat/f_path.size_files.source.r"
#   ..$ f_DataSetName.Search.read.checkEntity.source.r: chr "~/github_tidystat/f_DataSetName.Search.read.checkEntity.source.r"
#   ..$ f_df.NotNA_p_df.source.r                      : chr "~/github_tidystat/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r"
#   ..$ f_df.printVars_byMainOutcome.source.r         : chr "~/github_tidystat/Rdev/60_communicate_report_export/f_df.printVars_byMainOutcome.source.r"
#   ..$ f_df.Table1byExposure.xlsx.source.r           : chr "~/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.source.r"
#   ..$ get_system_info.source.r                      : chr "~/github_tidystat/get_system_info.source.r"
#  $ path        :List of 10
#   ..$ source_base_local  : Named chr "~/github_tidystat"
#   ..$ source_base_github : chr "https://raw.githubusercontent.com/mkim0710/tidystat/master"
#   ..$ source_base        : chr "~/github_tidystat"
#   ..$ getwd              : chr "/home/rstudio/github_tidystat"
#   ..$ path0              : chr "/home/rstudio"
#   ..$ path1              : chr "/home/rstudio/github_tidystat"
#   ..$ .path4read         : chr "/home/rstudio/github_tidystat"
#   ..$ .path4write        : chr "/home/rstudio/github_tidystat"
#   ..$ git_path           : chr "/home/rstudio/github_tidystat/.git"
#   ..$ list_path_hierarchy:List of 6
# > env1 |> as.list() |> str(max.level = 2, give.attr = FALSE, width = 80)  
# List of 5
#  $ env.internal:<environment: 0x55fff4433250> 
#  $ info        :List of 9
#   ..$ GUI             : chr "X11"
#   ..$ os_type         : chr "unix"
#   ..$ os_sysname      : chr "Linux"
#   ..$ os_version      : chr "#1 SMP Fri Mar 29 23:14:13 UTC 2024"
#   ..$ machine_type    : chr "x86_64"
#   ..$ machine_nodename: chr "059a785fbdc6"
#   ..$ machine_cpu     : chr "13th Gen Intel(R) Core(TM) i7-13700KF"
#   ..$ Sys.getlocale   :List of 4
#   ..$ l10n_info       :List of 5
#  $ f           :List of 29
#   ..$ f_CodeText.echo                             :function (.CodeText, Execute = FALSE, deparse_cat = TRUE, LinePrefix4CodeText = "\t", 
#     LinePrefix4Output = "\t## ", substitute_ObjectNames = TRUE, ObjectNames4substitute = NULL, 
#     VERBOSE = FALSE)  
#   ..$ f_TerminalFromRCodeText.echo                :function (.TerminalCodeText, Execute = FALSE)  
#   ..$ f_file.switch_open                          :function (file)  
#   ..$ f_URL.open_in_edge_app                      :function (URL)  
#   ..$ f_URL.open_in_edge_app.printPowerShellCode  :function (URL)  
#   ..$ f_path.relative                             :function (path, basepath = env1$path$path1)  
#   ..$ f_file.git_lfs_track_add_f                  :function (.path_file, Execute = FALSE)  
#   ..$ f.updateTemplates                           :function (.path4APPDATA_RStudio = NULL)  
#   ..$ f_expression.substitute_echo_and_dput       :function (expr_text, expression_equals_evaluation = FALSE, .VERBOSE = FALSE)  
#   ..$ f_df.tribble_construct                      :function (df)  
#   ..$ f_df.transpose                              :function (df, varname4rowname = "varname")  
#   ..$ f_df.t.tribble_construct                    :function (df)  
#   ..$ f_vec.dput_line_by_line                     :function (vec, space_between_vec_elements = "  \n  ", sep_parentheses = FALSE, 
#     end_of_text = "  \n")  
#   ..$ f_list.dput_line_by_line                    :function (list_vec, space_between_vec_elements = "\n         ", space_between_list_elements = "\n     ", 
#     sep_parentheses = FALSE, end_of_text = "\n")  
#   ..$ f_vec1_vec2.setdiff_list                         :function (vec1, vec2)  
#   ..$ f_df.print_byVar                            :function (df, byVar, n = NULL)  
#   ..$ f_df.add_VarNameT.deltaT0                   :function (DataSet.Date.NA.rmAllNA, VarName0, VarNameT, prefix = "", suffix = ".deltaT0")  
#   ..$ f_df.add_VarNameT.pdT0                      :function (DataSet.Date.NA.rmAllNA, VarName0, VarNameT, prefix = "", suffix = ".pdT0")  
#   ..$ f_df.add_RegExVars.cut                      :function (DataSet.Date.NA.rmAllNA, regex_pattern = ".", breaks = c(-Inf, 
#     -0.1, -0.05, 0.05, 0.1, Inf), suffix = paste0(".cut", length(breaks) - 
#     1))  
#   ..$ f_df.add_RegExVars.quintile_factor          :function (DataSet.Date.NA.rmAllNA, regex_pattern, factor.ordered = FALSE)  
#   ..$ f_df.add_RegExVars.quartile_factor          :function (DataSet.Date.NA.rmAllNA, regex_pattern, factor.ordered = FALSE)  
#   ..$ f_formula.lhs_rhs_vars                      :function (formula, include_input_in_output = TRUE)  
#   ..$ f_list_formula.append_lhs_rhs_vars          :function (list_formula)  
#   ..$ f_path.size_files                           :function (.path4read = getwd(), literal_filename = NA, regex4filename = "\\.(rdata|rda|rds|csv|sas7bdat)(\\.[gx]z)?$", 
#     print2console = TRUE, VERBOSE = FALSE)  
#   ..$ f_DataSet_path_filename_ext.read.checkEntity:function (DataSet_path_filename_ext, vec_candidate4ID = c("rowname", "rownum", 
#     "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID"), .width.cutoff = 120 - 
#     15, print2console = TRUE, return.output = TRUE, print.name.dput = FALSE, 
#     print.names.tidyeval = FALSE, VERBOSE = FALSE)  
#   ..$ f_DataSetName.Search.read.checkEntity       :function (DataSetName, ext = "rds", .path4read = c(".", "data"), vec_candidate4ID = c("rowname", 
#     "rownum", "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID"), 
#     BreathFirstSearch = TRUE, max_depth = 3, .width.cutoff = 120 - 15, 
#     print2console = TRUE, return.output = TRUE, print.name.dput = FALSE, 
#     print.names.tidyeval = FALSE, VERBOSE = FALSE)  
#   ..$ f_df.NotNA_p_df                             :function (data)  
#   ..$ f_df.printVars_byMainOutcome                :function (DataSet, MainOutcome, VarName.selected)  
#   ..$ f_df.Table1byExposure.xlsx                  :function (DataSet.Date.NA.rmAllNA.select, DataSetName4output = "DataSet", 
#     VarNames4Exposure = c("InterventionGroup"), output.sink = FALSE, output.xlsx = TRUE, 
#     Table1byExposure.print = TRUE)  
#  $ source      :List of 11
#   ..$ .Rprofile                                     : chr "/home/rstudio/github_tidystat/.Rprofile"
#   ..$ env1$env.internal.source.r                    : chr "~/github_tidystat/env1$env.internal.source.r"
#   ..$ internal.f_path0.list_path_hierarchy.source.r : chr "~/github_tidystat/internal.f_path0.list_path_hierarchy.source.r"
#   ..$ f_expression.substitute_echo_and_dput.source.r: chr "~/github_tidystat/Rdev/00_base_program/007_base_expression/f_expression.substitute_echo_and_dput.source.r"
#   ..$ f_df.t.tribble_construct.source.r             : chr "~/github_tidystat/f_df.t.tribble_construct.source.r"
#   ..$ f_path.size_files.source.r                    : chr "~/github_tidystat/f_path.size_files.source.r"
#   ..$ f_DataSetName.Search.read.checkEntity.source.r: chr "~/github_tidystat/f_DataSetName.Search.read.checkEntity.source.r"
#   ..$ f_df.NotNA_p_df.source.r                      : chr "~/github_tidystat/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r"
#   ..$ f_df.printVars_byMainOutcome.source.r         : chr "~/github_tidystat/Rdev/60_communicate_report_export/f_df.printVars_byMainOutcome.source.r"
#   ..$ f_df.Table1byExposure.xlsx.source.r           : chr "~/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.source.r"
#   ..$ get_system_info.source.r                      : chr "~/github_tidystat/get_system_info.source.r"
#  $ path        :List of 10
#   ..$ source_base_local  : Named chr "~/github_tidystat"
#   ..$ source_base_github : chr "https://raw.githubusercontent.com/mkim0710/tidystat/master"
#   ..$ source_base        : chr "~/github_tidystat"
#   ..$ getwd              : chr "/home/rstudio/github_tidystat"
#   ..$ path0              : chr "/home/rstudio"
#   ..$ path1              : chr "/home/rstudio/github_tidystat"
#   ..$ .path4read         : chr "/home/rstudio/github_tidystat"
#   ..$ .path4write        : chr "/home/rstudio/github_tidystat"
#   ..$ git_path           : chr "/home/rstudio/github_tidystat/.git"
#   ..$ list_path_hierarchy:List of 6
# > env1 |> as.list() |> str(max.level = 2, give.attr = FALSE, strict.width = "cut")  
# List of 5
#  $ env.internal:<environment: 0x55fff4433250> 
#  $ info        :List of 9
#   ..$ GUI             : chr "X11"
#   ..$ os_type         : chr "unix"
#   ..$ os_sysname      : chr "Linux"
#   ..$ os_version      : chr "#1 SMP Fri Mar 29 23:14:13 UTC 2024"
#   ..$ machine_type    : chr "x86_64"
#   ..$ machine_nodename: chr "059a785fbdc6"
#   ..$ machine_cpu     : chr "13th Gen Intel(R) Core(TM) i7-13700KF"
#   ..$ Sys.getlocale   :List of 4
#   ..$ l10n_info       :List of 5
#  $ f           :List of 29
#   ..$ f_CodeText.echo                             :function (.CodeText, Execute = FALSE, deparse_cat = TRUE,"..
#     substitute_ObjectNames = TRUE, ObjectNames4substitute = NULL, VERBOSE = FALSE)  
#   ..$ f_TerminalFromRCodeText.echo                :function (.TerminalCodeText, Execute = FALSE)  
#   ..$ f_file.switch_open                          :function (file)  
#   ..$ f_URL.open_in_edge_app                      :function (URL)  
#   ..$ f_URL.open_in_edge_app.printPowerShellCode  :function (URL)  
#   ..$ f_path.relative                             :function (path, basepath = env1$path$path1)  
#   ..$ f_file.git_lfs_track_add_f                  :function (.path_file, Execute = FALSE)  
#   ..$ f.updateTemplates                           :function (.path4APPDATA_RStudio = NULL)  
#   ..$ f_expression.substitute_echo_and_dput       :function (expr_text, expression_equals_evaluation = FALSE,..
#   ..$ f_df.tribble_construct                      :function (df)  
#   ..$ f_df.transpose                              :function (df, varname4rowname = "varname")  
#   ..$ f_df.t.tribble_construct                    :function (df)  
#   ..$ f_vec.dput_line_by_line                     :function (vec, space_between_vec_elements = "  \n  ", sep"..
#   ..$ f_list.dput_line_by_line                    :function (list_vec, space_between_vec_elements = "\n     "..
#     sep_parentheses = FALSE, end_of_text = "\n")  
#   ..$ f_vec1_vec2.setdiff_list                         :function (vec1, vec2)  
#   ..$ f_df.print_byVar                            :function (df, byVar, n = NULL)  
#   ..$ f_df.add_VarNameT.deltaT0                   :function (DataSet.Date.NA.rmAllNA, VarName0, VarNameT, pr"..
#   ..$ f_df.add_VarNameT.pdT0                      :function (DataSet.Date.NA.rmAllNA, VarName0, VarNameT, pr"..
#   ..$ f_df.add_RegExVars.cut                      :function (DataSet.Date.NA.rmAllNA, regex_pattern = ".", br..
#     suffix = paste0(".cut", length(breaks) - 1))  
#   ..$ f_df.add_RegExVars.quintile_factor          :function (DataSet.Date.NA.rmAllNA, regex_pattern, factor.o..
#   ..$ f_df.add_RegExVars.quartile_factor          :function (DataSet.Date.NA.rmAllNA, regex_pattern, factor.o..
#   ..$ f_formula.lhs_rhs_vars                      :function (formula, include_input_in_output = TRUE)  
#   ..$ f_list_formula.append_lhs_rhs_vars          :function (list_formula)  
#   ..$ f_path.size_files                           :function (.path4read = getwd(), literal_filename = NA, re"..
#     print2console = TRUE, VERBOSE = FALSE)  
#   ..$ f_DataSet_path_filename_ext.read.checkEntity:function (DataSet_path_filename_ext, vec_candidate4ID = c"..
#     "PERSON_ID", "RN_INDI", "NIHID"), .width.cutoff = 120 - 15, print2console = TRUE, return.output = TRUE, 
#     print.name.dput = FALSE, print.names.tidyeval = FALSE, VERBOSE = FALSE)  
#   ..$ f_DataSetName.Search.read.checkEntity       :function (DataSetName, ext = "rds", .path4read = c(".", ""..
#     "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID"), BreathFirstSearch = TRUE, max_depth = 3, 
#     .width.cutoff = 120 - 15, print2console = TRUE, return.output = TRUE, print.name.dput = FALSE, print.name..
#     VERBOSE = FALSE)  
#   ..$ f_df.NotNA_p_df                             :function (data)  
#   ..$ f_df.printVars_byMainOutcome                :function (DataSet, MainOutcome, VarName.selected)  
#   ..$ f_df.Table1byExposure.xlsx                  :function (DataSet.Date.NA.rmAllNA.select, DataSetName4out"..
#     output.sink = FALSE, output.xlsx = TRUE, Table1byExposure.print = TRUE)  
#  $ source      :List of 11
#   ..$ .Rprofile                                     : chr "/home/rstudio/github_tidystat/.Rprofile"
#   ..$ env1$env.internal.source.r                    : chr "~/github_tidystat/env1$env.internal.source.r"
#   ..$ internal.f_path0.list_path_hierarchy.source.r : chr "~/github_tidystat/internal.f_path0.list_path_hier"..
#   ..$ f_expression.substitute_echo_and_dput.source.r: chr "~/github_tidystat/Rdev/00_base_program/f_expressi"..
#   ..$ f_df.t.tribble_construct.source.r             : chr "~/github_tidystat/f_df.t.tribble_construct.source.r"
#   ..$ f_path.size_files.source.r                    : chr "~/github_tidystat/f_path.size_files.source.r"
#   ..$ f_DataSetName.Search.read.checkEntity.source.r: chr "~/github_tidystat/f_DataSetName.Search.read.check"..
#   ..$ f_df.NotNA_p_df.source.r                      : chr "~/github_tidystat/Rdev/10_import_clean_datatype/1"..
#   ..$ f_df.printVars_byMainOutcome.source.r         : chr "~/github_tidystat/Rdev/60_communicate_report_expo"..
#   ..$ f_df.Table1byExposure.xlsx.source.r           : chr "~/github_tidystat/Rdev/60_communicate_report_expo"..
#   ..$ get_system_info.source.r                      : chr "~/github_tidystat/get_system_info.source.r"
#  $ path        :List of 10
#   ..$ source_base_local  : Named chr "~/github_tidystat"
#   ..$ source_base_github : chr "https://raw.githubusercontent.com/mkim0710/tidystat/master"
#   ..$ source_base        : chr "~/github_tidystat"
#   ..$ getwd              : chr "/home/rstudio/github_tidystat"
#   ..$ path0              : chr "/home/rstudio"
#   ..$ path1              : chr "/home/rstudio/github_tidystat"
#   ..$ .path4read         : chr "/home/rstudio/github_tidystat"
#   ..$ .path4write        : chr "/home/rstudio/github_tidystat"
#   ..$ git_path           : chr "/home/rstudio/github_tidystat/.git"
#   ..$ list_path_hierarchy:List of 6
# > env1 |> as.list() |> str(max.level = 2, give.attr = FALSE, strict.width = "cut", width = 80)  
# List of 5
#  $ env.internal:<environment: 0x55fff4433250> 
#  $ info        :List of 9
#   ..$ GUI             : chr "X11"
#   ..$ os_type         : chr "unix"
#   ..$ os_sysname      : chr "Linux"
#   ..$ os_version      : chr "#1 SMP Fri Mar 29 23:14:13 UTC 2024"
#   ..$ machine_type    : chr "x86_64"
#   ..$ machine_nodename: chr "059a785fbdc6"
#   ..$ machine_cpu     : chr "13th Gen Intel(R) Core(TM) i7-13700KF"
#   ..$ Sys.getlocale   :List of 4
#   ..$ l10n_info       :List of 5
#  $ f           :List of 29
#   ..$ f_CodeText.echo                             :function (.CodeText, Execu"..
#     LinePrefix4Output = "\t## ", substitute_ObjectNames = TRUE, ObjectNames4su..
#     VERBOSE = FALSE)  
#   ..$ f_TerminalFromRCodeText.echo                :function (.TerminalCodeText..
#   ..$ f_file.switch_open                          :function (file)  
#   ..$ f_URL.open_in_edge_app                      :function (URL)  
#   ..$ f_URL.open_in_edge_app.printPowerShellCode  :function (URL)  
#   ..$ f_path.relative                             :function (path, basepath = ..
#   ..$ f_file.git_lfs_track_add_f                  :function (.path_file, Execu..
#   ..$ f.updateTemplates                           :function (.path4APPDATA_RSt..
#   ..$ f_expression.substitute_echo_and_dput       :function (expr_text, expres..
#   ..$ f_df.tribble_construct                      :function (df)  
#   ..$ f_df.transpose                              :function (df, varname4rown"..
#   ..$ f_df.t.tribble_construct                    :function (df)  
#   ..$ f_vec.dput_line_by_line                     :function (vec, space_betwe"..
#     end_of_text = "  \n")  
#   ..$ f_list.dput_line_by_line                    :function (list_vec, space_"..
#     sep_parentheses = FALSE, end_of_text = "\n")  
#   ..$ f_vec1_vec2.setdiff_list                         :function (vec1, vec2)  
#   ..$ f_df.print_byVar                            :function (df, byVar, n = NU..
#   ..$ f_df.add_VarNameT.deltaT0                   :function (DataSet.Date.NA."..
#   ..$ f_df.add_VarNameT.pdT0                      :function (DataSet.Date.NA."..
#   ..$ f_df.add_RegExVars.cut                      :function (DataSet.Date.NA."..
#     -0.1, -0.05, 0.05, 0.1, Inf), suffix = paste0(".cut", length(breaks) - 
#     1))  
#   ..$ f_df.add_RegExVars.quintile_factor          :function (DataSet.Date.NA.r..
#   ..$ f_df.add_RegExVars.quartile_factor          :function (DataSet.Date.NA.r..
#   ..$ f_formula.lhs_rhs_vars                      :function (formula, include_..
#   ..$ f_list_formula.append_lhs_rhs_vars          :function (list_formula)  
#   ..$ f_path.size_files                           :function (.path4read = get"..
#     print2console = TRUE, VERBOSE = FALSE)  
#   ..$ f_DataSet_path_filename_ext.read.checkEntity:function (DataSet_path_fil"..
#     "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID"), .width.cuto..
#     15, print2console = TRUE, return.output = TRUE, print.name.dput = FALSE, 
#     print.names.tidyeval = FALSE, VERBOSE = FALSE)  
#   ..$ f_DataSetName.Search.read.checkEntity       :function (DataSetName, ext"..
#     "rownum", "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID"), 
#     BreathFirstSearch = TRUE, max_depth = 3, .width.cutoff = 120 - 15, 
#     print2console = TRUE, return.output = TRUE, print.name.dput = FALSE, 
#     print.names.tidyeval = FALSE, VERBOSE = FALSE)  
#   ..$ f_df.NotNA_p_df                             :function (data)  
#   ..$ f_df.printVars_byMainOutcome                :function (DataSet, MainOutc..
#   ..$ f_df.Table1byExposure.xlsx                  :function (DataSet.Date.NA."..
#     VarNames4Exposure = c("InterventionGroup"), output.sink = FALSE, output.xl..
#     Table1byExposure.print = TRUE)  
#  $ source      :List of 11
#   ..$ .Rprofile                                     : chr "/home/rstudio/gith"..
#   ..$ env1$env.internal.source.r                    : chr "~/github_tidystat/"..
#   ..$ internal.f_path0.list_path_hierarchy.source.r : chr "~/github_tidystat/"..
#   ..$ f_expression.substitute_echo_and_dput.source.r: chr "~/github_tidystat/"..
#   ..$ f_df.t.tribble_construct.source.r             : chr "~/github_tidystat/"..
#   ..$ f_path.size_files.source.r                    : chr "~/github_tidystat/"..
#   ..$ f_DataSetName.Search.read.checkEntity.source.r: chr "~/github_tidystat/"..
#   ..$ f_df.NotNA_p_df.source.r                      : chr "~/github_tidystat/"..
#   ..$ f_df.printVars_byMainOutcome.source.r         : chr "~/github_tidystat/"..
#   ..$ f_df.Table1byExposure.xlsx.source.r           : chr "~/github_tidystat/"..
#   ..$ get_system_info.source.r                      : chr "~/github_tidystat/"..
#  $ path        :List of 10
#   ..$ source_base_local  : Named chr "~/github_tidystat"
#   ..$ source_base_github : chr "https://raw.githubusercontent.com/mkim0710/ti"..
#   ..$ source_base        : chr "~/github_tidystat"
#   ..$ getwd              : chr "/home/rstudio/github_tidystat"
#   ..$ path0              : chr "/home/rstudio"
#   ..$ path1              : chr "/home/rstudio/github_tidystat"
#   ..$ .path4read         : chr "/home/rstudio/github_tidystat"
#   ..$ .path4write        : chr "/home/rstudio/github_tidystat"
#   ..$ git_path           : chr "/home/rstudio/github_tidystat/.git"
#   ..$ list_path_hierarchy:List of 6
# > env1 |> as.list() |> str(max.level = 2, give.attr = FALSE, strict.width = "wrap")  
# List of 5
# $ env.internal:<environment: 0x55fff4433250>
# $ info :List of 9
# ..$ GUI : chr "X11"
# ..$ os_type : chr "unix"
# ..$ os_sysname : chr "Linux"
# ..$ os_version : chr "#1 SMP Fri Mar 29 23:14:13 UTC 2024"
# ..$ machine_type : chr "x86_64"
# ..$ machine_nodename: chr "059a785fbdc6"
# ..$ machine_cpu : chr "13th Gen Intel(R) Core(TM) i7-13700KF"
# ..$ Sys.getlocale :List of 4
# ..$ l10n_info :List of 5
# $ f :List of 29
# ..$ f_CodeText.echo :function (.CodeText, Execute = FALSE, deparse_cat = TRUE, LinePrefix4CodeText = "\t",
#    LinePrefix4Output = "\t## ",
# substitute_ObjectNames = TRUE, ObjectNames4substitute = NULL, VERBOSE = FALSE)
# ..$ f_TerminalFromRCodeText.echo :function (.TerminalCodeText, Execute = FALSE)
# ..$ f_file.switch_open :function (file)
# ..$ f_URL.open_in_edge_app :function (URL)
# ..$ f_URL.open_in_edge_app.printPowerShellCode :function (URL)
# ..$ f_path.relative :function (path, basepath = env1$path$path1)
# ..$ f_file.git_lfs_track_add_f :function (.path_file, Execute = FALSE)
# ..$ f.updateTemplates :function (.path4APPDATA_RStudio = NULL)
# ..$ f_expression.substitute_echo_and_dput :function (expr_text, expression_equals_evaluation = FALSE,
#    .VERBOSE = FALSE)
# ..$ f_df.tribble_construct :function (df)
# ..$ f_df.transpose :function (df, varname4rowname = "varname")
# ..$ f_df.t.tribble_construct :function (df)
# ..$ f_vec.dput_line_by_line :function (vec, space_between_vec_elements = " \n ", sep_parentheses = FALSE,
#    end_of_text = " \n")
# ..$ f_list.dput_line_by_line :function (list_vec, space_between_vec_elements = "\n ",
#    space_between_list_elements = "\n ",
# sep_parentheses = FALSE, end_of_text = "\n")
# ..$ f_vec1_vec2.setdiff_list :function (vec1, vec2)
# ..$ f_df.print_byVar :function (df, byVar, n = NULL)
# ..$ f_df.add_VarNameT.deltaT0 :function (DataSet.Date.NA.rmAllNA, VarName0, VarNameT, prefix = "", suffix =
#    ".deltaT0")
# ..$ f_df.add_VarNameT.pdT0 :function (DataSet.Date.NA.rmAllNA, VarName0, VarNameT, prefix = "", suffix =
#    ".pdT0")
# ..$ f_df.add_RegExVars.cut :function (DataSet.Date.NA.rmAllNA, regex_pattern = ".", breaks = c(-Inf, -0.1,
#    -0.05, 0.05, 0.1, Inf),
# suffix = paste0(".cut", length(breaks) - 1))
# ..$ f_df.add_RegExVars.quintile_factor :function (DataSet.Date.NA.rmAllNA, regex_pattern, factor.ordered =
#    FALSE)
# ..$ f_df.add_RegExVars.quartile_factor :function (DataSet.Date.NA.rmAllNA, regex_pattern, factor.ordered =
#    FALSE)
# ..$ f_formula.lhs_rhs_vars :function (formula, include_input_in_output = TRUE)
# ..$ f_list_formula.append_lhs_rhs_vars :function (list_formula)
# ..$ f_path.size_files :function (.path4read = getwd(), literal_filename = NA, regex4filename =
#    "\\.(rdata|rda|rds|csv|sas7bdat)(\\.[gx]z)?$",
# print2console = TRUE, VERBOSE = FALSE)
# ..$ f_DataSet_path_filename_ext.read.checkEntity:function (DataSet_path_filename_ext, vec_candidate4ID =
#    c("rowname", "rownum", "Num", "ID", "CompositeKey",
# "PERSON_ID", "RN_INDI", "NIHID"), .width.cutoff = 120 - 15, print2console = TRUE, return.output = TRUE,
# print.name.dput = FALSE, print.names.tidyeval = FALSE, VERBOSE = FALSE)
# ..$ f_DataSetName.Search.read.checkEntity :function (DataSetName, ext = "rds", .path4read = c(".", "data"),
#    vec_candidate4ID = c("rowname", "rownum",
# "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID"), BreathFirstSearch = TRUE, max_depth = 3,
# .width.cutoff = 120 - 15, print2console = TRUE, return.output = TRUE, print.name.dput = FALSE,
#    print.names.tidyeval = FALSE,
# VERBOSE = FALSE)
# ..$ f_df.NotNA_p_df :function (data)
# ..$ f_df.printVars_byMainOutcome :function (DataSet, MainOutcome, VarName.selected)
# ..$ f_df.Table1byExposure.xlsx :function (DataSet.Date.NA.rmAllNA.select, DataSetName4output = "DataSet",
#    VarNames4Exposure = c("InterventionGroup"),
# output.sink = FALSE, output.xlsx = TRUE, Table1byExposure.print = TRUE)
# $ source :List of 11
# ..$ .Rprofile : chr "/home/rstudio/github_tidystat/.Rprofile"
# ..$ env1$env.internal.source.r : chr "~/github_tidystat/env1$env.internal.source.r"
# ..$ internal.f_path0.list_path_hierarchy.source.r : chr
#    "~/github_tidystat/internal.f_path0.list_path_hierarchy.source.r"
# ..$ f_expression.substitute_echo_and_dput.source.r: chr
#    "~/github_tidystat/Rdev/00_base_program/007_base_expression/f_expression.substitute_echo_and_dput.source.r"
# ..$ f_df.t.tribble_construct.source.r : chr "~/github_tidystat/f_df.t.tribble_construct.source.r"
# ..$ f_path.size_files.source.r : chr "~/github_tidystat/f_path.size_files.source.r"
# ..$ f_DataSetName.Search.read.checkEntity.source.r: chr
#    "~/github_tidystat/f_DataSetName.Search.read.checkEntity.source.r"
# ..$ f_df.NotNA_p_df.source.r : chr
#    "~/github_tidystat/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r"
# ..$ f_df.printVars_byMainOutcome.source.r : chr
#    "~/github_tidystat/Rdev/60_communicate_report_export/f_df.printVars_byMainOutcome.source.r"
# ..$ f_df.Table1byExposure.xlsx.source.r : chr
#    "~/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.source.r"
# ..$ get_system_info.source.r : chr "~/github_tidystat/get_system_info.source.r"
# $ path :List of 10
# ..$ source_base_local : Named chr "~/github_tidystat"
# ..$ source_base_github : chr "https://raw.githubusercontent.com/mkim0710/tidystat/master"
# ..$ source_base : chr "~/github_tidystat"
# ..$ getwd : chr "/home/rstudio/github_tidystat"
# ..$ path0 : chr "/home/rstudio"
# ..$ path1 : chr "/home/rstudio/github_tidystat"
# ..$ .path4read : chr "/home/rstudio/github_tidystat"
# ..$ .path4write : chr "/home/rstudio/github_tidystat"
# ..$ git_path : chr "/home/rstudio/github_tidystat/.git"
# ..$ list_path_hierarchy:List of 6
# > env1 |> as.list() |> str(max.level = 2, give.attr = FALSE, strict.width = "wrap", width = 80)  
# List of 5
# $ env.internal:<environment: 0x55fff4433250>
# $ info :List of 9
# ..$ GUI : chr "X11"
# ..$ os_type : chr "unix"
# ..$ os_sysname : chr "Linux"
# ..$ os_version : chr "#1 SMP Fri Mar 29 23:14:13 UTC 2024"
# ..$ machine_type : chr "x86_64"
# ..$ machine_nodename: chr "059a785fbdc6"
# ..$ machine_cpu : chr "13th Gen Intel(R) Core(TM) i7-13700KF"
# ..$ Sys.getlocale :List of 4
# ..$ l10n_info :List of 5
# $ f :List of 29
# ..$ f_CodeText.echo :function (.CodeText, Execute = FALSE, deparse_cat = TRUE,
#    LinePrefix4CodeText = "\t",
# LinePrefix4Output = "\t## ", substitute_ObjectNames = TRUE,
#    ObjectNames4substitute = NULL,
# VERBOSE = FALSE)
# ..$ f_TerminalFromRCodeText.echo :function (.TerminalCodeText, Execute = FALSE)
# ..$ f_file.switch_open :function (file)
# ..$ f_URL.open_in_edge_app :function (URL)
# ..$ f_URL.open_in_edge_app.printPowerShellCode :function (URL)
# ..$ f_path.relative :function (path, basepath = env1$path$path1)
# ..$ f_file.git_lfs_track_add_f :function (.path_file, Execute = FALSE)
# ..$ f.updateTemplates :function (.path4APPDATA_RStudio = NULL)
# ..$ f_expression.substitute_echo_and_dput :function (expr_text,
#    expression_equals_evaluation = FALSE, .VERBOSE = FALSE)
# ..$ f_df.tribble_construct :function (df)
# ..$ f_df.transpose :function (df, varname4rowname = "varname")
# ..$ f_df.t.tribble_construct :function (df)
# ..$ f_vec.dput_line_by_line :function (vec, space_between_vec_elements = " \n
#    ", sep_parentheses = FALSE,
# end_of_text = " \n")
# ..$ f_list.dput_line_by_line :function (list_vec, space_between_vec_elements =
#    "\n ", space_between_list_elements = "\n ",
# sep_parentheses = FALSE, end_of_text = "\n")
# ..$ f_vec1_vec2.setdiff_list :function (vec1, vec2)
# ..$ f_df.print_byVar :function (df, byVar, n = NULL)
# ..$ f_df.add_VarNameT.deltaT0 :function (DataSet.Date.NA.rmAllNA, VarName0,
#    VarNameT, prefix = "", suffix = ".deltaT0")
# ..$ f_df.add_VarNameT.pdT0 :function (DataSet.Date.NA.rmAllNA, VarName0,
#    VarNameT, prefix = "", suffix = ".pdT0")
# ..$ f_df.add_RegExVars.cut :function (DataSet.Date.NA.rmAllNA, regex_pattern =
#    ".", breaks = c(-Inf,
# -0.1, -0.05, 0.05, 0.1, Inf), suffix = paste0(".cut", length(breaks) -
# 1))
# ..$ f_df.add_RegExVars.quintile_factor :function (DataSet.Date.NA.rmAllNA,
#    regex_pattern, factor.ordered = FALSE)
# ..$ f_df.add_RegExVars.quartile_factor :function (DataSet.Date.NA.rmAllNA,
#    regex_pattern, factor.ordered = FALSE)
# ..$ f_formula.lhs_rhs_vars :function (formula, include_input_in_output = TRUE)
# ..$ f_list_formula.append_lhs_rhs_vars :function (list_formula)
# ..$ f_path.size_files :function (.path4read = getwd(), literal_filename = NA,
#    regex4filename = "\\.(rdata|rda|rds|csv|sas7bdat)(\\.[gx]z)?$",
# print2console = TRUE, VERBOSE = FALSE)
# ..$ f_DataSet_path_filename_ext.read.checkEntity:function
#    (DataSet_path_filename_ext, vec_candidate4ID = c("rowname", "rownum",
# "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID"), .width.cutoff =
#    120 -
# 15, print2console = TRUE, return.output = TRUE, print.name.dput = FALSE,
# print.names.tidyeval = FALSE, VERBOSE = FALSE)
# ..$ f_DataSetName.Search.read.checkEntity :function (DataSetName, ext = "rds",
#    .path4read = c(".", "data"), vec_candidate4ID = c("rowname",
# "rownum", "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID"),
# BreathFirstSearch = TRUE, max_depth = 3, .width.cutoff = 120 - 15,
# print2console = TRUE, return.output = TRUE, print.name.dput = FALSE,
# print.names.tidyeval = FALSE, VERBOSE = FALSE)
# ..$ f_df.NotNA_p_df :function (data)
# ..$ f_df.printVars_byMainOutcome :function (DataSet, MainOutcome,
#    VarName.selected)
# ..$ f_df.Table1byExposure.xlsx :function (DataSet.Date.NA.rmAllNA.select,
#    DataSetName4output = "DataSet",
# VarNames4Exposure = c("InterventionGroup"), output.sink = FALSE, output.xlsx =
#    TRUE,
# Table1byExposure.print = TRUE)
# $ source :List of 11
# ..$ .Rprofile : chr "/home/rstudio/github_tidystat/.Rprofile"
# ..$ env1$env.internal.source.r : chr
#    "~/github_tidystat/env1$env.internal.source.r"
# ..$ internal.f_path0.list_path_hierarchy.source.r : chr
#    "~/github_tidystat/internal.f_path0.list_path_hierarchy.source.r"
# ..$ f_expression.substitute_echo_and_dput.source.r: chr
#    "~/github_tidystat/Rdev/00_base_program/f_expression.substitute_echo_and_d"..
# ..$ f_df.t.tribble_construct.source.r : chr
#    "~/github_tidystat/f_df.t.tribble_construct.source.r"
# ..$ f_path.size_files.source.r : chr
#    "~/github_tidystat/f_path.size_files.source.r"
# ..$ f_DataSetName.Search.read.checkEntity.source.r: chr
#    "~/github_tidystat/f_DataSetName.Search.read.checkEntity.source.r"
# ..$ f_df.NotNA_p_df.source.r : chr
#    "~/github_tidystat/Rdev/10_import_clean_datatype/13_missing_value/f_df.Not"..
# ..$ f_df.printVars_byMainOutcome.source.r : chr
#    "~/github_tidystat/Rdev/60_communicate_report_export/f_df.printVars_byMain"..
# ..$ f_df.Table1byExposure.xlsx.source.r : chr
#    "~/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure"..
# ..$ get_system_info.source.r : chr "~/github_tidystat/get_system_info.source.r"
# $ path :List of 10
# ..$ source_base_local : Named chr "~/github_tidystat"
# ..$ source_base_github : chr
#    "https://raw.githubusercontent.com/mkim0710/tidystat/master"
# ..$ source_base : chr "~/github_tidystat"
# ..$ getwd : chr "/home/rstudio/github_tidystat"
# ..$ path0 : chr "/home/rstudio"
# ..$ path1 : chr "/home/rstudio/github_tidystat"
# ..$ .path4read : chr "/home/rstudio/github_tidystat"
# ..$ .path4write : chr "/home/rstudio/github_tidystat"
# ..$ git_path : chr "/home/rstudio/github_tidystat/.git"
# ..$ list_path_hierarchy:List of 6



##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## \$ f_list.str_by_element =  ----  
# Rdev/00_base_program/f_list.str_by_element.dev.r
env1$f$f_list.str_by_element = function(ls, max.level = 2, give.attr = FALSE, tabInsteadOfSpace = FALSE, width = getOption("width") - 4, strict.width = strO$strict.width, ...) {
    cat("# List of ",length(ls),"  \n", sep="")
    for(i in names(ls)) {
        cat("# $ ",i,"\t\t:", sep="")
        if (tabInsteadOfSpace) {
            str(ls[[i]], max.level = max.level-1, give.attr = give.attr, width = width - 4, ...) |> capture.output() |> str_replace_all(" {4,}","\t") |> cat(sep="\n##") # ; cat("\n")
        } else {
            str(ls[[i]], max.level = max.level-1, give.attr = give.attr, width = width - 4, ...) |> capture.output() |> cat(sep="\n##") # ; cat("\n")
        }
        cat("# ________________________________________________________________________________    \n")
    }
}



### env1 |> as.list() |> env1$f$f_list.str_by_element() ----
env1 |> as.list() |> env1$f$f_list.str_by_element()
# List of 5  
# $ env.internal		:<environment: 0x55fff4433250> 
# ________________________________________________________________________________    
# $ info		:List of 9
## $ GUI             : chr "X11"
## $ os_type         : chr "unix"
## $ os_sysname      : chr "Linux"
## $ os_version      : chr "#1 SMP Fri Mar 29 23:14:13 UTC 2024"
## $ machine_type    : chr "x86_64"
## $ machine_nodename: chr "059a785fbdc6"
## $ machine_cpu     : chr "13th Gen Intel(R) Core(TM) i7-13700KF"
## $ Sys.getlocale   :List of 4
## $ l10n_info       :List of 5
# ________________________________________________________________________________    
# $ f		:List of 29
## $ f_CodeText.echo                             :function (.CodeText, Execute = FALSE, deparse_cat = TRUE, LinePrefix4CodeText = "\t", LinePrefix4Output = "\t## ", 
##    substitute_ObjectNames = TRUE, ObjectNames4substitute = NULL, VERBOSE = FALSE)  
## $ f_TerminalFromRCodeText.echo                :function (.TerminalCodeText, Execute = FALSE)  
## $ f_file.switch_open                          :function (file)  
## $ f_URL.open_in_edge_app                      :function (URL)  
## $ f_URL.open_in_edge_app.printPowerShellCode  :function (URL)  
## $ f_path.relative                             :function (path, basepath = env1$path$path1)  
## $ f_file.git_lfs_track_add_f                  :function (.path_file, Execute = FALSE)  
## $ f.updateTemplates                           :function (.path4APPDATA_RStudio = NULL)  
## $ f_expression.substitute_echo_and_dput       :function (expr_text, expression_equals_evaluation = FALSE, .VERBOSE = FALSE)  
## $ f_df.tribble_construct                      :function (df)  
## $ f_df.transpose                              :function (df, varname4rowname = "varname")  
## $ f_df.t.tribble_construct                    :function (df)  
## $ f_vec.dput_line_by_line                     :function (vec, space_between_vec_elements = "  \n  ", sep_parentheses = FALSE, end_of_text = "  \n")  
## $ f_list.dput_line_by_line                    :function (list_vec, space_between_vec_elements = "\n         ", space_between_list_elements = "\n     ", 
##    sep_parentheses = FALSE, end_of_text = "\n")  
## $ f_vec1_vec2.setdiff_list                         :function (vec1, vec2)  
## $ f_df.print_byVar                            :function (df, byVar, n = NULL)  
## $ f_df.add_VarNameT.deltaT0                   :function (DataSet.Date.NA.rmAllNA, VarName0, VarNameT, prefix = "", suffix = ".deltaT0")  
## $ f_df.add_VarNameT.pdT0                      :function (DataSet.Date.NA.rmAllNA, VarName0, VarNameT, prefix = "", suffix = ".pdT0")  
## $ f_df.add_RegExVars.cut                      :function (DataSet.Date.NA.rmAllNA, regex_pattern = ".", breaks = c(-Inf, -0.1, -0.05, 0.05, 0.1, 
##    Inf), suffix = paste0(".cut", length(breaks) - 1))  
## $ f_df.add_RegExVars.quintile_factor          :function (DataSet.Date.NA.rmAllNA, regex_pattern, factor.ordered = FALSE)  
## $ f_df.add_RegExVars.quartile_factor          :function (DataSet.Date.NA.rmAllNA, regex_pattern, factor.ordered = FALSE)  
## $ f_formula.lhs_rhs_vars                      :function (formula, include_input_in_output = TRUE)  
## $ f_list_formula.append_lhs_rhs_vars          :function (list_formula)  
## $ f_path.size_files                           :function (.path4read = getwd(), literal_filename = NA, regex4filename = "\\.(rdata|rda|rds|csv|sas7bdat)(\\.[gx]z)?$", 
##    print2console = TRUE, VERBOSE = FALSE)  
## $ f_DataSet_path_filename_ext.read.checkEntity:function (DataSet_path_filename_ext, vec_candidate4ID = c("rowname", "rownum", "Num", "ID", "CompositeKey", 
##    "PERSON_ID", "RN_INDI", "NIHID"), .width.cutoff = 120 - 15, print2console = TRUE, return.output = TRUE, 
##    print.name.dput = FALSE, print.names.tidyeval = FALSE, VERBOSE = FALSE)  
## $ f_DataSetName.Search.read.checkEntity       :function (DataSetName, ext = "rds", .path4read = c(".", "data"), vec_candidate4ID = c("rowname", 
##    "rownum", "Num", "ID", "CompositeKey", "PERSON_ID", "RN_INDI", "NIHID"), BreathFirstSearch = TRUE, 
##    max_depth = 3, .width.cutoff = 120 - 15, print2console = TRUE, return.output = TRUE, print.name.dput = FALSE, 
##    print.names.tidyeval = FALSE, VERBOSE = FALSE)  
## $ f_df.NotNA_p_df                             :function (data)  
## $ f_df.printVars_byMainOutcome                :function (DataSet, MainOutcome, VarName.selected)  
## $ f_df.Table1byExposure.xlsx                  :function (DataSet.Date.NA.rmAllNA.select, DataSetName4output = "DataSet", VarNames4Exposure = c("InterventionGroup"), 
##    output.sink = FALSE, output.xlsx = TRUE, Table1byExposure.print = TRUE)  
# ________________________________________________________________________________    
# $ source		:List of 11
## $ .Rprofile                                     : chr "/home/rstudio/github_tidystat/.Rprofile"
## $ env1$env.internal.source.r                    : chr "~/github_tidystat/env1$env.internal.source.r"
## $ internal.f_path0.list_path_hierarchy.source.r : chr "~/github_tidystat/internal.f_path0.list_path_hierarchy.source.r"
## $ f_expression.substitute_echo_and_dput.source.r: chr "~/github_tidystat/Rdev/00_base_program/007_base_expression/f_expression.substitute_echo_and_dput.source.r"
## $ f_df.t.tribble_construct.source.r             : chr "~/github_tidystat/f_df.t.tribble_construct.source.r"
## $ f_path.size_files.source.r                    : chr "~/github_tidystat/f_path.size_files.source.r"
## $ f_DataSetName.Search.read.checkEntity.source.r: chr "~/github_tidystat/f_DataSetName.Search.read.checkEntity.source.r"
## $ f_df.NotNA_p_df.source.r                      : chr "~/github_tidystat/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r"
## $ f_df.printVars_byMainOutcome.source.r         : chr "~/github_tidystat/Rdev/60_communicate_report_export/f_df.printVars_byMainOutcome.source.r"
## $ f_df.Table1byExposure.xlsx.source.r           : chr "~/github_tidystat/Rdev/60_communicate_report_export/f_df.Table1byExposure.xlsx.source.r"
## $ get_system_info.source.r                      : chr "~/github_tidystat/get_system_info.source.r"
# ________________________________________________________________________________    
# $ path		:List of 10
## $ source_base_local  : Named chr "~/github_tidystat"
## $ source_base_github : chr "https://raw.githubusercontent.com/mkim0710/tidystat/master"
## $ source_base        : chr "~/github_tidystat"
## $ getwd              : chr "/home/rstudio/github_tidystat"
## $ path0              : chr "/home/rstudio"
## $ path1              : chr "/home/rstudio/github_tidystat"
## $ .path4read         : chr "/home/rstudio/github_tidystat"
## $ .path4write        : chr "/home/rstudio/github_tidystat"
## $ git_path           : chr "/home/rstudio/github_tidystat/.git"
## $ list_path_hierarchy:List of 6
# ________________________________________________________________________ 



### "env1 |> as.list() |> env1$f$f_list.str_by_element()" |> env1$f$f_CodeText.echo(Execute = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "") ----
"env1 |> as.list() |> env1$f$f_list.str_by_element()" |> env1$f$f_CodeText.echo(Execute = TRUE, deparse_cat = FALSE, LinePrefix4CodeText = "> ", LinePrefix4Output = "")





#@@ END ----

