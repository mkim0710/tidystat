# function.print.options.dev.r
# https://pillar.r-lib.org/reference/pillar-package.html#package-options

# options() |> str(list.len=length(.)) #-----  
options() |> str(list.len=Inf) #-----
# > options() |> str(list.len=length(.)) #-----  
# List of 120
#  $ add.smooth                          : logi TRUE
#  $ ambiguousMethodSelection            :function (cond)  
#  $ askpass                             :function (prompt)  
#  $ asksecret                           :function (name, title = name, prompt = paste(name, ":", sep=""))  
#  $ askYesNo                            :function (msg, ...)  
#  $ browser                             :function (url)  
#  $ browserNLdisabled                   : logi FALSE
#  $ buildtools.check                    :function (action)  
#  $ buildtools.with                     :function (code)  
#  $ CBoundsCheck                        : logi FALSE
#  $ check.bounds                        : logi FALSE
#  $ citation.bibtex.max                 : int 1
#  $ connectionObserver                  :List of 3
#   ..$ connectionOpened :function (type, host, displayName, icon = NULL, connectCode, disconnect, listObjectTypes, listObjects, listColumns, previewObject, 
#     connectionObject, actions = NULL)  
#   ..$ connectionClosed :function (type, host, ...)  
#   ..$ connectionUpdated:function (type, host, hint, ...)  
#  $ continue                            : chr "+ "
#  $ contrasts                           : Named chr [1:2] "contr.treatment" "contr.poly"
#   ..- attr(*, "names")= chr [1:2] "unordered" "ordered"
#  $ datatable.alloccol                  : int 1024
#  $ datatable.allow.cartesian           : logi FALSE
#  $ datatable.auto.index                : logi TRUE
#  $ datatable.dfdispatchwarn            : logi TRUE
#  $ datatable.nomatch                   : int NA
#  $ datatable.old.unique.by.key         : logi FALSE
#  $ datatable.optimize                  : num Inf
#  $ datatable.print.class               : logi FALSE
#  $ datatable.print.colnames            : chr "auto"
#  $ datatable.print.keys                : logi FALSE
#  $ datatable.print.nrows               : int 100
#  $ datatable.print.rownames            : logi TRUE
#  $ datatable.print.topn                : int 5
#  $ datatable.use.index                 : logi TRUE
#  $ datatable.verbose                   : logi FALSE
#  $ datatable.warnredundantby           : logi TRUE
#  $ defaultPackages                     : chr [1:7] "datasets" "utils" "grDevices" "graphics" ...
#  $ demo.ask                            : chr "default"
#  $ deparse.cutoff                      : int 60
#  $ device                              : chr "RStudioGD"
#  $ device.ask.default                  : logi FALSE
#  $ digits                              : int 7
#  $ download.file.method                : chr "wininet"
#  $ dplyr.show_progress                 : logi TRUE
#  $ echo                                : logi TRUE
#  $ editor                              :function (name, file, title)  
#  $ encoding                            : chr "native.enc"
#  $ error                               : language (function ()  { ...
#  $ example.ask                         : chr "default"
#  $ expressions                         : int 5000
#  $ fansi.css                           : chr "PRE.fansi SPAN {padding-top: .25em; padding-bottom: .25em}  ;  "
#  $ fansi.ctrl                          : chr "all"
#  $ fansi.tab.stops                     : int 8
#  $ fansi.tabs.as.spaces                : logi FALSE
#  $ fansi.term.cap                      : chr [1:2] "bright" "256"
#  $ fansi.warn                          : logi TRUE
#  $ ggvis.renderer                      : chr "svg"
#  $ help.search.types                   : chr [1:3] "vignette" "demo" "help"
#  $ help.try.all.packages               : logi FALSE
#  $ help_type                           : chr "html"
#  $ HTTPUserAgent                       : chr "R (3.5.3 x86_64-w64-mingw32 x86_64 mingw32)"
#  $ httr_oauth_cache                    : logi NA
#  $ httr_oob_default                    : logi FALSE
#  $ install.packages.compile.from.source: chr "interactive"
#  $ internet.info                       : int 2
#  $ keep.source                         : logi TRUE
#  $ keep.source.pkgs                    : logi FALSE
#  $ locatorBell                         : logi TRUE
#  $ mailer                              : chr "mailto"
#  $ matprod                             : chr "default"
#  $ max.print                           : int 1000
#  $ menu.graphics                       : logi FALSE
#  $ na.action                           : chr "na.omit"
#  $ nwarnings                           : int 50
#  $ OutDec                              : chr "."
#  $ page_viewer                         :function (url, title = "RStudio Viewer", self_contained = FALSE)  
#  $ pager                               :function (files, header, title, delete.file)  
#  $ papersize                           : chr "letter"
#  $ PCRE_limit_recursion                : logi NA
#  $ PCRE_study                          : int 10
#  $ PCRE_use_JIT                        : logi TRUE
#  $ pdfviewer                           : chr "C:/PROGRA~1/MICROS~4/ROPEN~1/R-35~1.3/bin/x64/open.exe"
#  $ pillar.min_title_chars              : num Inf
#  $ pkgType                             : chr "both"
#  $ plumber.swagger.url                 :function (url)  
#   ..- attr(*, "plumberViewerType")= num 3
#  $ profvis.keep_output                 : logi TRUE
#  $ profvis.print                       :function (x)  
#  $ profvis.prof_extension              : chr ".Rprof"
#  $ profvis.prof_output                 : chr "D:/OneDrive - Harvard University/[][Rproject]/don_RStudioServer/.Rproj.user/61E30334/profiles-cache"
#  $ prompt                              : chr "> "
#  $ readr.show_progress                 : logi TRUE
#  $ repos                               : Named chr "https://mran.microsoft.com/snapshot/2019-04-15"
#   ..- attr(*, "names")= chr "CRAN"
#  $ restart                             :function (afterRestartCommand = "")  
#  $ reticulate.repl.hook                :function (buffer, contents, trimmed)  
#  $ reticulate.repl.initialize          :function ()  
#  $ reticulate.repl.teardown            :function ()  
#  $ rstudio.notebook.executing          : logi FALSE
#  $ scipen                              : num 0
#  $ shiny.launch.browser                :function (url)  
#   ..- attr(*, "shinyViewerType")= num 3
#  $ shinygadgets.showdialog             :function (caption, url, width=NULL, height = NULL)  
#  $ show.coef.Pvalues                   : logi TRUE
#  $ show.error.messages                 : logi TRUE
#  $ show.signif.stars                   : logi TRUE
#  $ str                                 :List of 3
#   ..$ strict.width: chr "no"
#   ..$ digits.d    : int 3
#   ..$ vec.len     : int 4
#  $ str.dendrogram.last                 : chr "`"
#  $ stringsAsFactors                    : logi TRUE
#  $ survey.adjust.domain.lonely         : logi FALSE
#  $ survey.drop.replicates              : logi TRUE
#  $ survey.lonely.psu                   : chr "fail"
#  $ survey.multicore                    : logi FALSE
#  $ survey.replicates.mse               : logi FALSE
#  $ survey.ultimate.cluster             : logi FALSE
#  $ survey.want.obsolete                : logi FALSE
#  $ terminal.manager                    :List of 13
#   ..$ terminalActivate:function (id = NULL, show = TRUE)  
#   ..$ terminalCreate  :function (caption = NULL, show = TRUE, shellType = NULL)  
#   ..$ terminalClear   :function (id)  
#   ..$ terminalList    :function ()  
#   ..$ terminalContext :function (id)  
#   ..$ terminalBuffer  :function (id, stripAnsi = TRUE)  
#   ..$ terminalVisible :function ()  
#   ..$ terminalBusy    :function (id)  
#   ..$ terminalRunning :function (id)  
#   ..$ terminalKill    :function (id)  
#   ..$ terminalSend    :function (id, text)  
#   ..$ terminalEXECUTE :function (command, workingDir = NULL, env = character(), show = TRUE)  
#   ..$ terminalExitCode:function (id)  
#  $ timeout                             : num 60
#  $ ts.eps                              : num 1e-05
#  $ ts.S.compat                         : logi FALSE
#  $ unzip                               : chr "internal"
#  $ useFancyQuotes                      : logi TRUE
#  $ verbose                             : logi FALSE
#  $ viewer                              :function (url, height = NULL)  
#  $ warn                                : num 0
#  $ warning.length                      : int 1000
#  $ width                               : int 132
#  $ windowsTimeouts                     : int [1:2] 100 500




ADS.TargetTrial2v40.2.206vs373.PersonTime_glm_RiskDifference_Model32.boot.list1$PrimaryOutcome123456 %>% 
    {rbind( as_tibble(as.list(.$t0)), map_df( {set_names(as_tibble(.$t), nm = names(.$t0))}, function(vec) norm.inter(vec, alpha = c(0.025, 0.975))[,2] ) )} %>% 
    {options(pillar.min_title_chars = Inf); print(., n = 20, width=130, n_extra = Inf)} #-----
# > ADS.TargetTrial2v40.2.206vs373.PersonTime_glm_RiskDifference_Model32.boot.list1$PrimaryOutcome123456 %>% 
# +     {rbind( as_tibble(as.list(.$t0)), map_df( {set_names(as_tibble(.$t), nm = names(.$t0))}, function(vec) norm.inter(vec, alpha = c(0.025, 0.975))[,2] ) )} %>% 
# +     {options(pillar.min_title_chars = Inf); print(., n = 20, width=130, n_extra = Inf)} #-----  
# # A tibble: 3 x 45
#   `max(k)` pNoEvent_k.cumprod0 pNoEvent_k.cumprod1 Risk0 Risk1 RiskDifference RiskRatio `(Intercept)` Exposure     k `I(k^2)`
#      <dbl>               <dbl>               <dbl> <dbl> <dbl>          <dbl>     <dbl>         <dbl>    <dbl> <dbl>    <dbl>
# 1       38               0.787               0.792 0.213 0.208       -0.00521     0.976     2.00e- 17 7.73e- 3 0.958     1.00
# 2       38               0.714               0.715 0.137 0.131       -0.0779      0.673     6.20e-162 3.67e-33 0.915     1.00
# 3       38               0.863               0.869 0.286 0.285        0.0627      1.36      3.22e+126 5.50e- 1 1.03      1.00
# # ... with 34 more variables: Window4Eligible.RxCONCEPT_NDC_SU_TZD_etc.any <dbl>, lmp.year <dbl>, Age_at_lmp <dbl>,
# #   t_N180_42.ICD9_CKD_exceptARF <dbl>, t_N180_42.ICD9_HTN.Superset <dbl>, t_N180_42.ICD9_Asthma <dbl>,
# #   t_N180_42.ICD9_Thyroid.Superset <dbl>, t_N180_42.ICD9_Depression.Superset <dbl>, t_N180_42.ICD9_SubstanceAbuse <dbl>,
# #   t_N180_42.ICD9_Bipolar <dbl>, t_N180_42.ICD9_Anxiety <dbl>, t_N180_42.ICD9_Hyperlipidemia <dbl>,
# #   t_N180_42.ICD9_Cerebrovascular <dbl>, t_N180_42.ICD9_Obesity <dbl>, t_N180_42.ICD9_PolycysticOvaries <dbl>,
# #   t_N180_42.ICD9_Acne <dbl>, t_N180_42.ICD9_CPT_PregnancyTest.Superset <dbl>, t_N180_42.ICD9_DMrenal <dbl>,
# #   t_N180_42.ICD9_DMophthalmic <dbl>, t_N180_42.ICD9_DMneurological <dbl>, t_N180_42.ICD9_DMperipheral <dbl>,
# #   t_N180_42.ICD9_DMother <dbl>, t_N180_42.ICD9_DMunspecifiedCx <dbl>, t_N180_42.ICD9_DMuncontrolledT2 <dbl>,
# #   t_N180_0.Nvisits <dbl>, t_N90_0.Nvisits <dbl>, t_N180_0.Nprocedures <dbl>, t_N90_0.Nprocedures <dbl>,
# #   t_N180_N91.RxCONCEPT_NDC_insulin.DDD.meanSTRNGTHpD.replace_na <dbl>,
# #   t_N180_N91.RxCONCEPT_NDC_metformin.DDD.meanSTRNGTHpD.replace_na <dbl>,
# #   t_N90_60.RxCONCEPT_NDC_insulin.DDD.meanSTRNGTHpD.replace_na <dbl>,
# #   t_N90_60.RxCONCEPT_NDC_metformin.DDD.meanSTRNGTHpD.replace_na <dbl>, `Exposure:k` <dbl>, `Exposure:I(k^2)` <dbl>




ADS.TargetTrial2v40.2.206vs373.PersonTime_glm_RiskDifference_Model32.boot.list1$PrimaryOutcome123456 %>% 
    {rbind( as_tibble(as.list(.$t0)), map_df( {set_names(as_tibble(.$t), nm = names(.$t0))}, function(vec) norm.inter(vec, alpha = c(0.025, 0.975))[,2] ) )} %>% 
    {options(pillar.min_title_chars = Inf); print(., n = 20, width=NULL, n_extra = Inf)} #-----
# > ADS.TargetTrial2v40.2.206vs373.PersonTime_glm_RiskDifference_Model32.boot.list1$PrimaryOutcome123456 %>% 
# +     {rbind( as_tibble(as.list(.$t0)), map_df( {set_names(as_tibble(.$t), nm = names(.$t0))}, function(vec) norm.inter(vec, alpha = c(0.025, 0.975))[,2] ) )} %>% 
# +     {options(pillar.min_title_chars = Inf); print(., n = 20, width=NULL, n_extra = Inf)} #-----  
# # A tibble: 3 x 45
#   `max(k)` pNoEvent_k.cumprod0 pNoEvent_k.cumprod1 Risk0 Risk1 RiskDifference RiskRatio `(Intercept)` Exposure     k `I(k^2)`
#      <dbl>               <dbl>               <dbl> <dbl> <dbl>          <dbl>     <dbl>         <dbl>    <dbl> <dbl>    <dbl>
# 1       38               0.787               0.792 0.213 0.208       -0.00521     0.976     2.00e- 17 7.73e- 3 0.958     1.00
# 2       38               0.714               0.715 0.137 0.131       -0.0779      0.673     6.20e-162 3.67e-33 0.915     1.00
# 3       38               0.863               0.869 0.286 0.285        0.0627      1.36      3.22e+126 5.50e- 1 1.03      1.00
# # ... with 34 more variables: Window4Eligible.RxCONCEPT_NDC_SU_TZD_etc.any <dbl>, lmp.year <dbl>, Age_at_lmp <dbl>,
# #   t_N180_42.ICD9_CKD_exceptARF <dbl>, t_N180_42.ICD9_HTN.Superset <dbl>, t_N180_42.ICD9_Asthma <dbl>, t_N180_42.ICD9_Thyroid.Superset <dbl>,
# #   t_N180_42.ICD9_Depression.Superset <dbl>, t_N180_42.ICD9_SubstanceAbuse <dbl>, t_N180_42.ICD9_Bipolar <dbl>, t_N180_42.ICD9_Anxiety <dbl>,
# #   t_N180_42.ICD9_Hyperlipidemia <dbl>, t_N180_42.ICD9_Cerebrovascular <dbl>, t_N180_42.ICD9_Obesity <dbl>,
# #   t_N180_42.ICD9_PolycysticOvaries <dbl>, t_N180_42.ICD9_Acne <dbl>, t_N180_42.ICD9_CPT_PregnancyTest.Superset <dbl>,
# #   t_N180_42.ICD9_DMrenal <dbl>, t_N180_42.ICD9_DMophthalmic <dbl>, t_N180_42.ICD9_DMneurological <dbl>, t_N180_42.ICD9_DMperipheral <dbl>,
# #   t_N180_42.ICD9_DMother <dbl>, t_N180_42.ICD9_DMunspecifiedCx <dbl>, t_N180_42.ICD9_DMuncontrolledT2 <dbl>, t_N180_0.Nvisits <dbl>,
# #   t_N90_0.Nvisits <dbl>, t_N180_0.Nprocedures <dbl>, t_N90_0.Nprocedures <dbl>,
# #   t_N180_N91.RxCONCEPT_NDC_insulin.DDD.meanSTRNGTHpD.replace_na <dbl>, t_N180_N91.RxCONCEPT_NDC_metformin.DDD.meanSTRNGTHpD.replace_na <dbl>,
# #   t_N90_60.RxCONCEPT_NDC_insulin.DDD.meanSTRNGTHpD.replace_na <dbl>, t_N90_60.RxCONCEPT_NDC_metformin.DDD.meanSTRNGTHpD.replace_na <dbl>,
# #   `Exposure:k` <dbl>, `Exposure:I(k^2)` <dbl>





## @ ------  
# https://github.com/r-lib/pillar/issues/101
# kovla commented on Feb 11, 2018
# Why not let the user decide how many characters they deem necessary? You have pillar.min_title_chars that controls column title truncation, why not implement something similar for character column width?
# As an aside, the workaround I am currently using is to set the mentioned option to Inf, and use variable name that exceeds or equals the number of characters I need to be shown (e.g., ID____________). Of course, this workaround is the same as having the separate option for column width, only less convenient.

# davidchall commented 26 days ago • 
# Or how about an option to disable truncation?
# options(pillar.truncate = FALSE)  # default: TRUE


# https://github.com/r-lib/pillar/pull/178
# statsmaths commented on Feb 4
# Addresses #101 by implementing an option pillar.min_character_chars to give control over how wide to make characters for a character column. The option works similarly to pillar.min_title_chars. The default is currently 0 to be backwards compatible.
# Like others, I needed this for a project I am working on (a bookdown book that needs users to see the full names of a kibble's character column) and was frustrated trying to get it to work. If there is a better approach to this, happy to adjust.

  
  
# __________|------  
# 〚〛 END-----  
