# # objectname = "f_objectname.read.checkEntity"
# # f_objectname.read.checkEntity.dev.r
# # f_objectname.read.checkEntity.source.r
# #         https://github.com/mkim0710/tidystat/blob/master/f_objectname.read.checkEntity.dev.r
# # source("https://github.com/mkim0710/tidystat/raw/master/f_objectname.read.checkEntity.source.r")
# ####################################################################################################
# objectname = "f_objectname.read.checkEntity"
# cat("# ", 'objectname = "', objectname, '"', "\n",
#     "# ", objectname, ".dev.r", "\n",
#     "# ", objectname, ".source.r", "\n",
#     "#         https://github.com/mkim0710/tidystat/blob/master/", objectname, ".dev.r", "\n",
#     '# source("https://github.com/mkim0710/tidystat/raw/master/', objectname, '.source.r")', "\n",
#     sep = "")
# rstudioapi::navigateToFile(paste0(objectname, ".source.r"))
# rstudioapi::navigateToFile(paste0(objectname, ".dev.r"))



library(tidyverse)

# if(!exists("env.custom", envir = .GlobalEnv)) assign("env.custom", new.env(), envir = .GlobalEnv)
if(!exists("env.custom", envir = .GlobalEnv)) assign("env.custom", new.env(), envir = .GlobalEnv)
# env.custom = as.environment(env.custom)
# if(!exists("env.internal", envir = env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir = .GlobalEnv)
if(!"env.internal" %in% names(env.custom)) eval(parse(text = "env.custom$env.internal = new.env()"), envir = .GlobalEnv)

if(!"path" %in% names(env.custom)) {
    env.custom$path = list()
    objectname = "source_base_local"; object = "D:/OneDrive/[][Rproject]/github_tidystat"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; cat("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep = "")};
    objectname = "source_base_github"; object = "https://github.com/mkim0710/tidystat/raw/master"; if(!objectname %in% names(env.custom$path)) {env.custom$path[[objectname]] = object; cat("env.custom$path$", objectname, ": ", env.custom$path[[objectname]], "\n", sep = "")};
}
#@ for (env.custom.dependancy in c("")) { -----
for (env.custom.dependancy in c("f_filename.find_subpath", "f_path.size_files")) {
    if(!env.custom.dependancy %in% names(env.custom)) {
        cat(paste0("sys.nframe() = ", sys.nframe(), "\n"))
        objectname = env.custom.dependancy
        source(file.path(file.path(env.custom$path$source_base_local, ""), paste0(objectname, ".source.r")))
    }
}



#@ objectname = "f_objectname.read.checkEntity" =========
objectname = "f_objectname.read.checkEntity"
object = function(objectname, ext = "rds", path4read = ".", varname4ID = c("ID", "PERSON_ID", "RN_INDI"), BreathFirstSearch = TRUE, max_depth = 3, print.intermediate = FALSE) {
    if (getwd() != path4read) {warningText = paste0('getwd() != path4read == "', path4read, '"');  warning(warningText); cat("Warning: ", warningText, "\n")} else {cat("getwd() == path4read ==", path4read, "\n")} #----
    cat('objectname = "', objectname, '"\n', sep = "");
    filename.ext = paste0(objectname, ".", ext)
    if(file.exists(file.path(path4read, filename.ext))) {
    } else if(file.exists(file.path(path4read, paste0(filename.ext, ".xz")))) {
        filename.ext = paste0(filename.ext, ".xz")
    } else if(BreathFirstSearch) {
        path.filename.ext = env.custom$f_filename.find_subpath(filename.ext, input_path = path4read, max_depth = max_depth, print.intermediate = print.intermediate)
        if (is.null(path.filename.ext)) {
            path.filename.ext = env.custom$f_filename.find_subpath(paste0(filename.ext, ".xz"), input_path = path4read, max_depth = max_depth, print.intermediate = print.intermediate)
            if (is.null(path.filename.ext)) error(paste0(filename.ext, " does not exist!")) ;
        }
        path4read = dirname(path.filename.ext)
        cat('Found subpath: ', 'path4read = "', path4read, '"\n', sep = "");
        filename.ext = basename(path.filename.ext)
    } else {
        error(paste0(filename.ext, " does not exist!")) ;
    }
    cat('filename.ext = "', filename.ext, '"\n', sep = "");

    # filename.ext.regex = filename.ext %>%  
    #     str_replace_all("\\.", "\\\\.") %>%
    #     str_replace_all("\\(", "\\\\(") %>% 
    #     str_replace_all("\\)", "\\\\)") %>% 
    #     str_replace_all("\\[", "\\\\[") %>% 
    #     str_replace_all("\\]", "\\\\]") %>% 
    #     str_replace_all("\\-", "\\\\-") 
    filename.ext.regex <- filename.ext %>% str_replace_all("([().\\[\\]\\-])", "\\\\\\1")
    env.custom$f_path.size_files(path4read = path4read, regex4filename = filename.ext.regex)
    
    system.time(assign(objectname, read_rds(file.path(path4read, filename.ext)), envir = .GlobalEnv))

    # cat("----\n")
    CodeText = "dim(get(objectname))"; cat(CodeText); cat(" = "); dput(eval(parse(text = CodeText))); 
    for (varname in varname4ID) {
      if(varname %in% names(get(objectname))) {
          CodeText = paste0("n_distinct(get(objectname)$", varname, ")"); cat(CodeText); cat(" = "); dput(eval(parse(text = CodeText))); 
      } else {
          {warningText = paste0('varname for ID not identified.');  warning(warningText); cat("Warning: ", warningText, "\n")}
      }
    }
    cat("----\n> ", "names(get(objectname))", "\n", sep = ""); get(objectname) %>% names %>% {cat(deparse(., width.cutoff=120), '\n\n', sep='')} # dput() cat(deparse(., width.cutoff=120)), width.cutoff=500 is the max ----
    cat("----\n> ", "names(get(objectname))", "\n", sep = ""); get(objectname) %>% names %>% paste(collapse = ", ") %>% {cat(., '\n\n', sep='')}; # tidydplyr::select: paste(collapse = ", ") %>% cat ----
    cat("----\n> "); CodeText = "str(get(objectname), max.level = 2, give.attr = F)"; cat(CodeText); cat("\n"); eval(parse(text = CodeText));
    cat("----\n> "); CodeText = "as_tibble(get(objectname))"; cat(CodeText); cat("\n"); eval(parse(text = CodeText));
    cat("----\n> "); CodeText = "tail(rownames_to_column(get(objectname)))"; cat(CodeText); cat("\n"); eval(parse(text = CodeText));
    # cat("----\n> ", "summary(get(objectname) %>% dplyr::select_if(is.numeric))", "\n", sep = ""); get(objectname) %>% dplyr::select_if(is.numeric) %>% summary #-----
    # cat("----\n> ", "summary(get(objectname) %>% dplyr::select_if(is.logical))", "\n", sep = ""); get(objectname) %>% dplyr::select_if(is.logical) %>% summary #-----
    # cat("----\n> ", "summary(get(objectname) %>% dplyr::select_if(is.factor))", "\n", sep = ""); get(objectname) %>% dplyr::select_if(is.logical) %>% summary #-----
}
if(!objectname %in% names(env.custom)) {
    packageStartupMessage(paste0("Loading: ", "env.custom$", objectname)); 
    env.custom[[objectname]] = object
    # cat("> env.custom$", objectname, "()\n", sep = ""); get(objectname, envir = env.custom)() # Run the loaded function by default
}


# objectname = "fhs.index100le10"
# env.custom$f_objectname.read.checkEntity(objectname = objectname, ext = "rds", path4read = ".")
# env.custom$f_objectname.read.checkEntity(objectname = objectname, ext = "rds", path4read = ".", varname4ID = "randid")
# # > objectname = "fhs.index100le10"
# # > f_objectname.read.checkEntity(objectname = objectname)
# # Warning:  getwd() != path4read == "." 
# # objectname = "fhs.index100le10"
# # Found subpath: path4read = "./data"
# # filename.ext = "fhs.index100le10.rds"
# # "fhs.index100le10.rds"
# # ----
# # tibble::tribble(
# #                ~filename, ~size,   ~bytes,    ~KB,      ~MB,        ~GB,
# #   "fhs.index100le10.rds", 35747, "35,747", "34.9", "0.0341", "3.33e-05"
# #   )
# # ----
# # dim(get(objectname)) = c(450L, 81L)
# # Warning:  varname for ID not identified. 
# # Warning:  varname for ID not identified. 
# # Warning:  varname for ID not identified. 
# # ----
# # > names(get(objectname))
# # c("randid", "death", "angina", "hospmi", "mi_fchd", "anychd", "stroke", "cvd", "hyperten", "timeap", "timemi", "timemifc", "timechd", "timestrk", "timecvd", "timedth", "timehyp", "sex1", "time1", "age1", "sysbp1", "diabp1", "bpmeds1", "cursmoke1", "cigpday1", "educ1", "totchol1", "hdlc1", "ldlc1", "bmi1", "glucose1", "diabetes1", "heartrte1", "prevap1", "prevchd1", "prevmi1", "prevstrk1", "prevhyp1", "sex2", "time2", "age2", "sysbp2", "diabp2", "bpmeds2", "cursmoke2", "cigpday2", "educ2", "totchol2", "hdlc2", "ldlc2", "bmi2", "glucose2", "diabetes2", "heartrte2", "prevap2", "prevchd2", "prevmi2", "prevstrk2", "prevhyp2", "sex3", "time3", "age3", "sysbp3", "diabp3", "bpmeds3", "cursmoke3", "cigpday3", "educ3", "totchol3", "hdlc3", "ldlc3", "bmi3", "glucose3", "diabetes3", "heartrte3", "prevap3", "prevchd3", "prevmi3", "prevstrk3", "prevhyp3", "index100")
# # 
# # ----
# # > names(get(objectname))
# # randid, death, angina, hospmi, mi_fchd, anychd, stroke, cvd, hyperten, timeap, timemi, timemifc, timechd, timestrk, timecvd, timedth, timehyp, sex1, time1, age1, sysbp1, diabp1, bpmeds1, cursmoke1, cigpday1, educ1, totchol1, hdlc1, ldlc1, bmi1, glucose1, diabetes1, heartrte1, prevap1, prevchd1, prevmi1, prevstrk1, prevhyp1, sex2, time2, age2, sysbp2, diabp2, bpmeds2, cursmoke2, cigpday2, educ2, totchol2, hdlc2, ldlc2, bmi2, glucose2, diabetes2, heartrte2, prevap2, prevchd2, prevmi2, prevstrk2, prevhyp2, sex3, time3, age3, sysbp3, diabp3, bpmeds3, cursmoke3, cigpday3, educ3, totchol3, hdlc3, ldlc3, bmi3, glucose3, diabetes3, heartrte3, prevap3, prevchd3, prevmi3, prevstrk3, prevhyp3, index100
# # 
# # ----
# # > str(get(objectname), max.level = 2, give.attr = F)
# # tibble [450 × 81] (S3: tbl_df/tbl/data.frame)
# #  $ randid   : num [1:450] 24721 54224 83398 84815 95541 ...
# #  $ death    : num [1:450] 1 1 1 0 1 0 0 0 0 0 ...
# #  $ angina   : num [1:450] 0 0 0 0 0 0 0 0 0 1 ...
# #  $ hospmi   : num [1:450] 0 1 0 0 0 0 0 0 0 0 ...
# #  $ mi_fchd  : num [1:450] 0 1 0 0 0 0 0 0 0 0 ...
# #  $ anychd   : num [1:450] 0 1 0 0 0 0 0 0 0 1 ...
# #  $ stroke   : num [1:450] 0 0 1 1 0 0 0 0 0 0 ...
# #  $ cvd      : num [1:450] 0 1 1 1 0 0 0 0 0 0 ...
# #  $ hyperten : num [1:450] 1 0 1 1 1 1 1 1 1 0 ...
# #  $ timeap   : num [1:450] 17.55 1.18 17.16 24 7.38 ...
# #  $ timemi   : num [1:450] 17.55 1.18 17.16 24 7.38 ...
# #  $ timemifc : num [1:450] 17.55 1.18 17.16 24 7.38 ...
# #  $ timechd  : num [1:450] 17.55 1.18 17.16 24 7.38 ...
# #  $ timestrk : num [1:450] 17.55 1.18 15.03 23.82 7.38 ...
# #  $ timecvd  : num [1:450] 17.55 1.18 15.03 23.82 7.38 ...
# #  $ timedth  : num [1:450] 17.55 1.18 17.16 24 7.38 ...
# #  $ timehyp  : num [1:450] 12.07 1.18 0 0 0 ...
# #  $ sex1     : num [1:450] 2 1 1 2 2 2 1 1 1 2 ...
# #  $ time1    : num [1:450] 0 0 0 0 0 0 0 0 0 0 ...
# #  $ age1     : num [1:450] 39 47 52 42 53 47 56 41 53 46 ...
# #  $ sysbp1   : num [1:450] 114 102 160 153 206 130 121 152 138 112 ...
# #  $ diabp1   : num [1:450] 64 68 98 101 92 78 79 90 89 70 ...
# #  $ bpmeds1  : num [1:450] 0 0 0 0 1 0 0 0 0 0 ...
# #  $ cursmoke1: num [1:450] 1 1 0 1 0 1 1 1 1 1 ...
# #  $ cigpday1 : num [1:450] 9 20 0 1 0 20 20 43 20 3 ...
# #  $ educ1    : num [1:450] 2 4 1 1 3 2 4 2 1 1 ...
# #  $ totchol1 : num [1:450] 226 294 178 233 311 237 270 274 188 237 ...
# #  $ hdlc1    : num [1:450] NA NA NA NA NA NA NA NA NA NA ...
# #  $ ldlc1    : num [1:450] NA NA NA NA NA NA NA NA NA NA ...
# #  $ bmi1     : num [1:450] 22.4 24.2 40.1 28.9 21.5 ...
# #  $ glucose1 : num [1:450] NA 66 225 90 215 75 93 65 75 62 ...
# #  $ diabetes1: num [1:450] 0 0 1 0 1 0 0 0 0 0 ...
# #  $ heartrte1: num [1:450] 85 62 75 60 76 80 95 85 60 75 ...
# #  $ prevap1  : num [1:450] 0 0 0 0 0 0 0 0 0 0 ...
# #  $ prevchd1 : num [1:450] 0 0 0 0 0 0 0 0 0 0 ...
# #  $ prevmi1  : num [1:450] 0 0 0 0 0 0 0 0 0 0 ...
# #  $ prevstrk1: num [1:450] 0 0 0 0 0 0 0 0 0 0 ...
# #  $ prevhyp1 : num [1:450] 0 0 1 1 1 0 0 1 0 0 ...
# #  $ sex2     : num [1:450] 2 NA 1 2 2 2 1 1 1 2 ...
# #  $ time2    : num [1:450] 2268 NA 2205 2240 2081 ...
# #  $ age2     : num [1:450] 46 NA 58 48 59 53 62 47 60 52 ...
# #  $ sysbp2   : num [1:450] 136 NA 173 155 160 139 120 136 160 110 ...
# #  $ diabp2   : num [1:450] 89 NA 90 106 80 88.5 74 80 85.5 70 ...
# #  $ bpmeds2  : num [1:450] 0 NA 0 0 1 0 0 0 0 0 ...
# #  $ cursmoke2: num [1:450] 1 NA 0 1 0 1 1 1 0 1 ...
# #  $ cigpday2 : num [1:450] 50 NA 0 4 0 30 30 40 0 10 ...
# #  $ educ2    : num [1:450] 2 NA 1 1 3 2 4 2 1 1 ...
# #  $ totchol2 : num [1:450] 196 NA 155 242 281 324 303 229 232 201 ...
# #  $ hdlc2    : num [1:450] NA NA NA NA NA NA NA NA NA NA ...
# #  $ ldlc2    : num [1:450] NA NA NA NA NA NA NA NA NA NA ...
# #  $ bmi2     : num [1:450] 21.2 NA 36.9 29.3 22.5 ...
# #  $ glucose2 : num [1:450] 76 NA 200 NA 269 61 70 93 NA 75 ...
# #  $ diabetes2: num [1:450] 0 NA 1 0 1 0 0 0 0 0 ...
# #  $ heartrte2: num [1:450] 110 NA 72 60 80 80 80 75 70 90 ...
# #  $ prevap2  : num [1:450] 0 NA 0 0 0 0 0 0 0 0 ...
# #  $ prevchd2 : num [1:450] 0 NA 0 0 0 0 0 0 0 0 ...
# #  $ prevmi2  : num [1:450] 0 NA 0 0 0 0 0 0 0 0 ...
# #  $ prevstrk2: num [1:450] 0 NA 0 0 0 0 0 0 0 0 ...
# #  $ prevhyp2 : num [1:450] 0 NA 1 1 1 0 0 1 0 0 ...
# #  $ sex3     : num [1:450] 2 NA 1 2 NA 2 1 1 1 2 ...
# #  $ time3    : num [1:450] 4408 NA 4291 4429 NA ...
# #  $ age3     : num [1:450] 51 NA 64 54 NA 59 68 53 66 59 ...
# #  $ sysbp3   : num [1:450] 141 NA 205 202 NA 132 145 128 144 106 ...
# #  $ diabp3   : num [1:450] 81 NA 90 111 NA 77 77 78 81 63.5 ...
# #  $ bpmeds3  : num [1:450] 0 NA 1 0 NA 0 0 0 0 0 ...
# #  $ cursmoke3: num [1:450] 1 NA 0 1 NA 1 1 1 1 1 ...
# #  $ cigpday3 : num [1:450] 15 NA 0 3 NA 20 20 30 10 10 ...
# #  $ educ3    : num [1:450] 2 NA 1 1 NA 2 4 2 1 1 ...
# #  $ totchol3 : num [1:450] 264 NA NA 246 NA 251 229 204 196 NA ...
# #  $ hdlc3    : num [1:450] 58 NA NA 41 NA 53 39 15 35 NA ...
# #  $ ldlc3    : num [1:450] 206 NA NA 205 NA 197 170 189 161 NA ...
# #  $ bmi3     : num [1:450] 24.8 NA 36.5 26.6 NA ...
# #  $ glucose3 : num [1:450] 97 NA NA 80 NA 76 83 94 108 NA ...
# #  $ diabetes3: num [1:450] 0 NA 1 0 NA 0 0 0 0 0 ...
# #  $ heartrte3: num [1:450] 85 NA 77 63 NA 82 72 65 72 104 ...
# #  $ prevap3  : num [1:450] 0 NA 0 0 NA 0 0 0 0 0 ...
# #  $ prevchd3 : num [1:450] 0 NA 0 0 NA 0 0 0 0 0 ...
# #  $ prevmi3  : num [1:450] 0 NA 0 0 NA 0 0 0 0 0 ...
# #  $ prevstrk3: num [1:450] 0 NA 0 0 NA 0 0 0 0 0 ...
# #  $ prevhyp3 : num [1:450] 1 NA 1 1 NA 0 0 1 1 0 ...
# #  $ index100 : int [1:450] 3 3 8 8 3 10 8 2 4 3 ...
# # ----
# # > as_tibble(get(objectname))
# # ----
# # > tail(rownames_to_column(get(objectname)))
# # # A tibble: 6 × 82
# #   rowname  randid death angina hospmi mi_fchd anychd stroke   cvd hyperten timeap timemi timemifc timechd timestrk timecvd timedth timehyp  sex1 time1  age1 sysbp1 diabp1
# #   <chr>     <dbl> <dbl>  <dbl>  <dbl>   <dbl>  <dbl>  <dbl> <dbl>    <dbl>  <dbl>  <dbl>    <dbl>   <dbl>    <dbl>   <dbl>   <dbl>   <dbl> <dbl> <dbl> <dbl>  <dbl>  <dbl>
# # 1 445     9842231     0      0      0       0      0      0     0        0  24     24       24      24       24      24      24      24        1     0    41   132.   85  
# # 2 446     9869235     0      0      1       1      1      0     1        1  24     16.1     16.1    16.1     24      16.1    24       3.99     1     0    44   138.   87.5
# # 3 447     9873741     0      0      0       0      0      0     0        0  24     24       24      24       24      24      24      24        1     0    58   116.   71  
# # 4 448     9901842     1      0      0       1      1      0     1        1  20.2   20.2     13.6    13.6     20.2    13.6    20.2     0        2     0    63   170   105  
# # 5 449     9957743     1      0      0       0      0      0     0        1   5.23   5.23     5.23    5.23     5.23    5.23    5.23    0        1     0    56   149    98  
# # 6 450     9968499     1      0      0       0      0      0     0        0  11.4   11.4     11.4    11.4     11.4    11.4    11.4    11.4      1     0    43   130.   88  
# # # ℹ 59 more variables: bpmeds1 <dbl>, cursmoke1 <dbl>, cigpday1 <dbl>, educ1 <dbl>, totchol1 <dbl>, hdlc1 <dbl>, ldlc1 <dbl>, bmi1 <dbl>, glucose1 <dbl>, diabetes1 <dbl>,
# # #   heartrte1 <dbl>, prevap1 <dbl>, prevchd1 <dbl>, prevmi1 <dbl>, prevstrk1 <dbl>, prevhyp1 <dbl>, sex2 <dbl>, time2 <dbl>, age2 <dbl>, sysbp2 <dbl>, diabp2 <dbl>,
# # #   bpmeds2 <dbl>, cursmoke2 <dbl>, cigpday2 <dbl>, educ2 <dbl>, totchol2 <dbl>, hdlc2 <dbl>, ldlc2 <dbl>, bmi2 <dbl>, glucose2 <dbl>, diabetes2 <dbl>, heartrte2 <dbl>,
# # #   prevap2 <dbl>, prevchd2 <dbl>, prevmi2 <dbl>, prevstrk2 <dbl>, prevhyp2 <dbl>, sex3 <dbl>, time3 <dbl>, age3 <dbl>, sysbp3 <dbl>, diabp3 <dbl>, bpmeds3 <dbl>,
# # #   cursmoke3 <dbl>, cigpday3 <dbl>, educ3 <dbl>, totchol3 <dbl>, hdlc3 <dbl>, ldlc3 <dbl>, bmi3 <dbl>, glucose3 <dbl>, diabetes3 <dbl>, heartrte3 <dbl>, prevap3 <dbl>,
# # #   prevchd3 <dbl>, prevmi3 <dbl>, prevstrk3 <dbl>, prevhyp3 <dbl>, index100 <int>
# # Warning messages:
# # 1: In f_objectname.read.checkEntity(objectname = objectname) :
# #   getwd() != path4read == "."
# # 2: In f_objectname.read.checkEntity(objectname = objectname) :
# #   varname for ID not identified.
# # 3: In f_objectname.read.checkEntity(objectname = objectname) :
# #   varname for ID not identified.
# # 4: In f_objectname.read.checkEntity(objectname = objectname) :
# #   varname for ID not identified.
# # > f_objectname.read.checkEntity(objectname = objectname, varname4ID = "randid")
# # Warning:  getwd() != path4read == "." 
# # objectname = "fhs.index100le10"
# # Found subpath: path4read = "./data"
# # filename.ext = "fhs.index100le10.rds"
# # "fhs.index100le10.rds"
# # ----
# # tibble::tribble(
# #                ~filename, ~size,   ~bytes,    ~KB,      ~MB,        ~GB,
# #   "fhs.index100le10.rds", 35747, "35,747", "34.9", "0.0341", "3.33e-05"
# #   )
# # ----
# # dim(get(objectname)) = c(450L, 81L)
# # n_distinct(get(objectname)$randid) = 450L
# # ----
# # > names(get(objectname))
# # c("randid", "death", "angina", "hospmi", "mi_fchd", "anychd", "stroke", "cvd", "hyperten", "timeap", "timemi", "timemifc", "timechd", "timestrk", "timecvd", "timedth", "timehyp", "sex1", "time1", "age1", "sysbp1", "diabp1", "bpmeds1", "cursmoke1", "cigpday1", "educ1", "totchol1", "hdlc1", "ldlc1", "bmi1", "glucose1", "diabetes1", "heartrte1", "prevap1", "prevchd1", "prevmi1", "prevstrk1", "prevhyp1", "sex2", "time2", "age2", "sysbp2", "diabp2", "bpmeds2", "cursmoke2", "cigpday2", "educ2", "totchol2", "hdlc2", "ldlc2", "bmi2", "glucose2", "diabetes2", "heartrte2", "prevap2", "prevchd2", "prevmi2", "prevstrk2", "prevhyp2", "sex3", "time3", "age3", "sysbp3", "diabp3", "bpmeds3", "cursmoke3", "cigpday3", "educ3", "totchol3", "hdlc3", "ldlc3", "bmi3", "glucose3", "diabetes3", "heartrte3", "prevap3", "prevchd3", "prevmi3", "prevstrk3", "prevhyp3", "index100")
# # 
# # ----
# # > names(get(objectname))
# # randid, death, angina, hospmi, mi_fchd, anychd, stroke, cvd, hyperten, timeap, timemi, timemifc, timechd, timestrk, timecvd, timedth, timehyp, sex1, time1, age1, sysbp1, diabp1, bpmeds1, cursmoke1, cigpday1, educ1, totchol1, hdlc1, ldlc1, bmi1, glucose1, diabetes1, heartrte1, prevap1, prevchd1, prevmi1, prevstrk1, prevhyp1, sex2, time2, age2, sysbp2, diabp2, bpmeds2, cursmoke2, cigpday2, educ2, totchol2, hdlc2, ldlc2, bmi2, glucose2, diabetes2, heartrte2, prevap2, prevchd2, prevmi2, prevstrk2, prevhyp2, sex3, time3, age3, sysbp3, diabp3, bpmeds3, cursmoke3, cigpday3, educ3, totchol3, hdlc3, ldlc3, bmi3, glucose3, diabetes3, heartrte3, prevap3, prevchd3, prevmi3, prevstrk3, prevhyp3, index100
# # 
# # ----
# # > str(get(objectname), max.level = 2, give.attr = F)
# # tibble [450 × 81] (S3: tbl_df/tbl/data.frame)
# #  $ randid   : num [1:450] 24721 54224 83398 84815 95541 ...
# #  $ death    : num [1:450] 1 1 1 0 1 0 0 0 0 0 ...
# #  $ angina   : num [1:450] 0 0 0 0 0 0 0 0 0 1 ...
# #  $ hospmi   : num [1:450] 0 1 0 0 0 0 0 0 0 0 ...
# #  $ mi_fchd  : num [1:450] 0 1 0 0 0 0 0 0 0 0 ...
# #  $ anychd   : num [1:450] 0 1 0 0 0 0 0 0 0 1 ...
# #  $ stroke   : num [1:450] 0 0 1 1 0 0 0 0 0 0 ...
# #  $ cvd      : num [1:450] 0 1 1 1 0 0 0 0 0 0 ...
# #  $ hyperten : num [1:450] 1 0 1 1 1 1 1 1 1 0 ...
# #  $ timeap   : num [1:450] 17.55 1.18 17.16 24 7.38 ...
# #  $ timemi   : num [1:450] 17.55 1.18 17.16 24 7.38 ...
# #  $ timemifc : num [1:450] 17.55 1.18 17.16 24 7.38 ...
# #  $ timechd  : num [1:450] 17.55 1.18 17.16 24 7.38 ...
# #  $ timestrk : num [1:450] 17.55 1.18 15.03 23.82 7.38 ...
# #  $ timecvd  : num [1:450] 17.55 1.18 15.03 23.82 7.38 ...
# #  $ timedth  : num [1:450] 17.55 1.18 17.16 24 7.38 ...
# #  $ timehyp  : num [1:450] 12.07 1.18 0 0 0 ...
# #  $ sex1     : num [1:450] 2 1 1 2 2 2 1 1 1 2 ...
# #  $ time1    : num [1:450] 0 0 0 0 0 0 0 0 0 0 ...
# #  $ age1     : num [1:450] 39 47 52 42 53 47 56 41 53 46 ...
# #  $ sysbp1   : num [1:450] 114 102 160 153 206 130 121 152 138 112 ...
# #  $ diabp1   : num [1:450] 64 68 98 101 92 78 79 90 89 70 ...
# #  $ bpmeds1  : num [1:450] 0 0 0 0 1 0 0 0 0 0 ...
# #  $ cursmoke1: num [1:450] 1 1 0 1 0 1 1 1 1 1 ...
# #  $ cigpday1 : num [1:450] 9 20 0 1 0 20 20 43 20 3 ...
# #  $ educ1    : num [1:450] 2 4 1 1 3 2 4 2 1 1 ...
# #  $ totchol1 : num [1:450] 226 294 178 233 311 237 270 274 188 237 ...
# #  $ hdlc1    : num [1:450] NA NA NA NA NA NA NA NA NA NA ...
# #  $ ldlc1    : num [1:450] NA NA NA NA NA NA NA NA NA NA ...
# #  $ bmi1     : num [1:450] 22.4 24.2 40.1 28.9 21.5 ...
# #  $ glucose1 : num [1:450] NA 66 225 90 215 75 93 65 75 62 ...
# #  $ diabetes1: num [1:450] 0 0 1 0 1 0 0 0 0 0 ...
# #  $ heartrte1: num [1:450] 85 62 75 60 76 80 95 85 60 75 ...
# #  $ prevap1  : num [1:450] 0 0 0 0 0 0 0 0 0 0 ...
# #  $ prevchd1 : num [1:450] 0 0 0 0 0 0 0 0 0 0 ...
# #  $ prevmi1  : num [1:450] 0 0 0 0 0 0 0 0 0 0 ...
# #  $ prevstrk1: num [1:450] 0 0 0 0 0 0 0 0 0 0 ...
# #  $ prevhyp1 : num [1:450] 0 0 1 1 1 0 0 1 0 0 ...
# #  $ sex2     : num [1:450] 2 NA 1 2 2 2 1 1 1 2 ...
# #  $ time2    : num [1:450] 2268 NA 2205 2240 2081 ...
# #  $ age2     : num [1:450] 46 NA 58 48 59 53 62 47 60 52 ...
# #  $ sysbp2   : num [1:450] 136 NA 173 155 160 139 120 136 160 110 ...
# #  $ diabp2   : num [1:450] 89 NA 90 106 80 88.5 74 80 85.5 70 ...
# #  $ bpmeds2  : num [1:450] 0 NA 0 0 1 0 0 0 0 0 ...
# #  $ cursmoke2: num [1:450] 1 NA 0 1 0 1 1 1 0 1 ...
# #  $ cigpday2 : num [1:450] 50 NA 0 4 0 30 30 40 0 10 ...
# #  $ educ2    : num [1:450] 2 NA 1 1 3 2 4 2 1 1 ...
# #  $ totchol2 : num [1:450] 196 NA 155 242 281 324 303 229 232 201 ...
# #  $ hdlc2    : num [1:450] NA NA NA NA NA NA NA NA NA NA ...
# #  $ ldlc2    : num [1:450] NA NA NA NA NA NA NA NA NA NA ...
# #  $ bmi2     : num [1:450] 21.2 NA 36.9 29.3 22.5 ...
# #  $ glucose2 : num [1:450] 76 NA 200 NA 269 61 70 93 NA 75 ...
# #  $ diabetes2: num [1:450] 0 NA 1 0 1 0 0 0 0 0 ...
# #  $ heartrte2: num [1:450] 110 NA 72 60 80 80 80 75 70 90 ...
# #  $ prevap2  : num [1:450] 0 NA 0 0 0 0 0 0 0 0 ...
# #  $ prevchd2 : num [1:450] 0 NA 0 0 0 0 0 0 0 0 ...
# #  $ prevmi2  : num [1:450] 0 NA 0 0 0 0 0 0 0 0 ...
# #  $ prevstrk2: num [1:450] 0 NA 0 0 0 0 0 0 0 0 ...
# #  $ prevhyp2 : num [1:450] 0 NA 1 1 1 0 0 1 0 0 ...
# #  $ sex3     : num [1:450] 2 NA 1 2 NA 2 1 1 1 2 ...
# #  $ time3    : num [1:450] 4408 NA 4291 4429 NA ...
# #  $ age3     : num [1:450] 51 NA 64 54 NA 59 68 53 66 59 ...
# #  $ sysbp3   : num [1:450] 141 NA 205 202 NA 132 145 128 144 106 ...
# #  $ diabp3   : num [1:450] 81 NA 90 111 NA 77 77 78 81 63.5 ...
# #  $ bpmeds3  : num [1:450] 0 NA 1 0 NA 0 0 0 0 0 ...
# #  $ cursmoke3: num [1:450] 1 NA 0 1 NA 1 1 1 1 1 ...
# #  $ cigpday3 : num [1:450] 15 NA 0 3 NA 20 20 30 10 10 ...
# #  $ educ3    : num [1:450] 2 NA 1 1 NA 2 4 2 1 1 ...
# #  $ totchol3 : num [1:450] 264 NA NA 246 NA 251 229 204 196 NA ...
# #  $ hdlc3    : num [1:450] 58 NA NA 41 NA 53 39 15 35 NA ...
# #  $ ldlc3    : num [1:450] 206 NA NA 205 NA 197 170 189 161 NA ...
# #  $ bmi3     : num [1:450] 24.8 NA 36.5 26.6 NA ...
# #  $ glucose3 : num [1:450] 97 NA NA 80 NA 76 83 94 108 NA ...
# #  $ diabetes3: num [1:450] 0 NA 1 0 NA 0 0 0 0 0 ...
# #  $ heartrte3: num [1:450] 85 NA 77 63 NA 82 72 65 72 104 ...
# #  $ prevap3  : num [1:450] 0 NA 0 0 NA 0 0 0 0 0 ...
# #  $ prevchd3 : num [1:450] 0 NA 0 0 NA 0 0 0 0 0 ...
# #  $ prevmi3  : num [1:450] 0 NA 0 0 NA 0 0 0 0 0 ...
# #  $ prevstrk3: num [1:450] 0 NA 0 0 NA 0 0 0 0 0 ...
# #  $ prevhyp3 : num [1:450] 1 NA 1 1 NA 0 0 1 1 0 ...
# #  $ index100 : int [1:450] 3 3 8 8 3 10 8 2 4 3 ...
# # ----
# # > as_tibble(get(objectname))
# # ----
# # > tail(rownames_to_column(get(objectname)))
# # # A tibble: 6 × 82
# #   rowname  randid death angina hospmi mi_fchd anychd stroke   cvd hyperten timeap timemi timemifc timechd timestrk timecvd timedth timehyp  sex1 time1  age1 sysbp1 diabp1
# #   <chr>     <dbl> <dbl>  <dbl>  <dbl>   <dbl>  <dbl>  <dbl> <dbl>    <dbl>  <dbl>  <dbl>    <dbl>   <dbl>    <dbl>   <dbl>   <dbl>   <dbl> <dbl> <dbl> <dbl>  <dbl>  <dbl>
# # 1 445     9842231     0      0      0       0      0      0     0        0  24     24       24      24       24      24      24      24        1     0    41   132.   85  
# # 2 446     9869235     0      0      1       1      1      0     1        1  24     16.1     16.1    16.1     24      16.1    24       3.99     1     0    44   138.   87.5
# # 3 447     9873741     0      0      0       0      0      0     0        0  24     24       24      24       24      24      24      24        1     0    58   116.   71  
# # 4 448     9901842     1      0      0       1      1      0     1        1  20.2   20.2     13.6    13.6     20.2    13.6    20.2     0        2     0    63   170   105  
# # 5 449     9957743     1      0      0       0      0      0     0        1   5.23   5.23     5.23    5.23     5.23    5.23    5.23    0        1     0    56   149    98  
# # 6 450     9968499     1      0      0       0      0      0     0        0  11.4   11.4     11.4    11.4     11.4    11.4    11.4    11.4      1     0    43   130.   88  
# # # ℹ 59 more variables: bpmeds1 <dbl>, cursmoke1 <dbl>, cigpday1 <dbl>, educ1 <dbl>, totchol1 <dbl>, hdlc1 <dbl>, ldlc1 <dbl>, bmi1 <dbl>, glucose1 <dbl>, diabetes1 <dbl>,
# # #   heartrte1 <dbl>, prevap1 <dbl>, prevchd1 <dbl>, prevmi1 <dbl>, prevstrk1 <dbl>, prevhyp1 <dbl>, sex2 <dbl>, time2 <dbl>, age2 <dbl>, sysbp2 <dbl>, diabp2 <dbl>,
# # #   bpmeds2 <dbl>, cursmoke2 <dbl>, cigpday2 <dbl>, educ2 <dbl>, totchol2 <dbl>, hdlc2 <dbl>, ldlc2 <dbl>, bmi2 <dbl>, glucose2 <dbl>, diabetes2 <dbl>, heartrte2 <dbl>,
# # #   prevap2 <dbl>, prevchd2 <dbl>, prevmi2 <dbl>, prevstrk2 <dbl>, prevhyp2 <dbl>, sex3 <dbl>, time3 <dbl>, age3 <dbl>, sysbp3 <dbl>, diabp3 <dbl>, bpmeds3 <dbl>,
# # #   cursmoke3 <dbl>, cigpday3 <dbl>, educ3 <dbl>, totchol3 <dbl>, hdlc3 <dbl>, ldlc3 <dbl>, bmi3 <dbl>, glucose3 <dbl>, diabetes3 <dbl>, heartrte3 <dbl>, prevap3 <dbl>,
# # #   prevchd3 <dbl>, prevmi3 <dbl>, prevstrk3 <dbl>, prevhyp3 <dbl>, index100 <int>
# # Warning message:
# # In f_objectname.read.checkEntity(objectname = objectname, varname4ID = "randid") :
# #   getwd() != path4read == "."


