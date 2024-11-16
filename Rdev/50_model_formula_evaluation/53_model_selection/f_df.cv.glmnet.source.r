# .sourcename_root = "f_cv_glmnet_object.ggplot"  
#### Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.dev.r----  
#### Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.dev.Rmd----  
#### Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.source.r----  
# # source(paste0(env1$path$source_base,"/","Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.source.r"))  
# # if(!file.exists("D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.dev.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.dev.r")  
# # if(!file.exists("D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.dev.Rmd")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.dev.Rmd")  
# # if(!file.exists("D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.source.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.source.r")  
# file.edit("D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.dev.r"); if(!is.null(env1$path$LastSourceEditorContext.path_filename.ext)) if(env1$path$LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename.ext));  
# file.edit("D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.dev.Rmd"); if(!is.null(env1$path$LastSourceEditorContext.path_filename.ext)) if(env1$path$LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename.ext));  
# file.edit("D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.source.r"); if(!is.null(env1$path$LastSourceEditorContext.path_filename.ext)) if(env1$path$LastSourceEditorContext.path_filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename.ext));  
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
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) source -----  

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function -----  
# .sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.sourcename_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r")
# --> Now included in "f_df.t.tribble_construct.source.r"
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## \$ f_df.cv.glmnet =  ----
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/51_model_formula/53_model_selection/f_df.cv.glmnet.source.r
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/51_model_formula/53_model_selection/f_df.cv.glmnet.dev.Rmd
.tmp$objectname = "f_df.cv.glmnet"
.tmp$object = function(formula, include_input_in_output = TRUE) {

}
### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, function.reload = options()$function.reload, runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## \$ f_cv_glmnet_object.ggplot =  ----
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/51_model_formula/53_model_selection/f_df.cv.glmnet.source.r
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/51_model_formula/53_model_selection/f_cv_glmnet_object.ggplot.dev.Rmd
.tmp$objectname = "f_cv_glmnet_object.ggplot"
.tmp$object = function(cv_glmnet_object, xvar = c("norm", "lambda", "dev"), label = TRUE) {
    # Load necessary libraries
    library(ggplot2)
    library(dplyr)
    library(tidyr)
    library(scales)
    
    xvar <- match.arg(xvar)
    # xvar_name = xvar
    # if (xvar == "dev") xvar_name = "DevianceExplained"
    # if (xvar == "norm") xvar_name = "l1norm"
    xvar_name <- switch(
        xvar,
        "norm" = "l1norm",
        "lambda" = "lambda",
        "dev" = "DevianceExplained",
        "penalty" = "penalty"
    )
    
    # Extract data from cv.glmnet object
    glmnet_object <- cv_glmnet_object$glmnet.fit
    mat_coef <- as.matrix(coef(glmnet_object))
    vec_lambda <- glmnet_object$lambda
    variables <- rownames(mat_coef)[-1]  # Exclude intercept
    
    # Calculate measures for x-axis
    # mat_coef[-1, ]  # Remove intercept
    vec_l1norm <- apply(abs(mat_coef[-1, ]), 2, sum)
    vec_dev.ratio <- glmnet_object$dev.ratio  # Proportion of deviance explained
    
    # Prepare data frame
    coef_df <- as.data.frame(t(mat_coef[-1, ]))
    coef_df$lambda <- vec_lambda
    coef_df$l1norm <- vec_l1norm
    coef_df$DevianceExplained <- vec_dev.ratio
    coef_df <- coef_df %>%
        pivot_longer(cols = all_of(variables), names_to = "variable", values_to = "coefficient")
    
    # Calculate label positions
    label_positions <- coef_df %>%
        group_by(variable) %>%
        filter(
            .data[[xvar_name]] == if (xvar == "lambda") min(.data[[xvar_name]]) else max(.data[[xvar_name]])
        ) %>%
        ungroup()
    
    # Calculate number of non-zero coefficients at each xvar
    non_zero_counts <- coef_df %>%
        group_by(.data[[xvar_name]]) %>%
        summarize(
            non_zero_count = sum(coefficient != 0),
            .groups = "drop"
        ) %>%
        arrange(.data[[xvar_name]]) %>%
        filter(row_number() == 1 | non_zero_count != lag(non_zero_count, default = first(non_zero_count)))
    
    # Ensure initial zero count is included
    if (!any(non_zero_counts$non_zero_count == 0)) {
        non_zero_counts <- bind_rows(
            tibble(!!xvar_name := min(coef_df[[xvar_name]]), non_zero_count = 0),
            non_zero_counts
        ) %>%
            arrange(.data[[xvar_name]])
    }

    # Axis labels and transformations
    xvar_labels <- list(
        l1norm = "L1 Norm",
        lambda = expression(lambda~(log[e]~scale)),
        DevianceExplained = "Proportion Deviance Explained"
    )
    x_transformation <- if (xvar == "lambda") scales::log_trans(base = exp(1)) else "identity"
    x_breaks <- if (xvar == "lambda") scales::trans_breaks("log", exp) else waiver()
    x_labels <- if (xvar == "lambda") scales::trans_format("log", scales::math_format(e^.x)) else waiver()
    hjust_value <- if (xvar == "lambda") 1.1 else -0.2  # Adjust label position
    
    # Create the plot
    plot <- ggplot(coef_df, aes(x = .data[[xvar_name]], y = coefficient, color = variable, group = variable)) +
        geom_line() +
        scale_x_continuous(
            name = xvar_labels[[xvar_name]],
            trans = x_transformation,
            breaks = x_breaks,
            labels = x_labels,
            sec.axis = sec_axis(
                trans = ~ .,
                breaks = non_zero_counts[[xvar_name]],
                labels = non_zero_counts$non_zero_count,
                name = "Number of Non-Zero Coefficients"
            )
        ) +
        labs(
            title = "Coefficient Paths from Cross-Validated glmnet Model",
            y = "Coefficient Value"
        ) +
        theme_minimal() +
        theme(legend.position = "none")
    
    # Add labels if requested
    if (label) {
        plot <- plot +
            geom_text(
                data = label_positions,
                aes(label = variable),
                hjust = hjust_value,
                size = 3,
                check_overlap = TRUE  # Avoid overlapping labels
            )
    }
    
    return(plot)
}

### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, function.reload = options()$function.reload, runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## \$ f_cv_glmnet_object_enet.ggplot =  ----
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/51_model_formula/53_model_selection/f_df.cv.glmnet.source.r
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/51_model_formula/53_model_selection/f_cv_glmnet_object.ggplot.dev.Rmd
.tmp$objectname = "f_cv_glmnet_object_enet.ggplot"
.tmp$object = function(cv_glmnet_object, xvar = c("norm", "lambda", "dev", "penalty"), label = TRUE, alpha = NULL) {
    # Load necessary libraries
    library(ggplot2)
    library(dplyr)
    library(tidyr)
    library(scales)
    
    xvar <- match.arg(xvar)
    xvar_name <- switch(
        xvar,
        "norm" = "l1norm",
        "lambda" = "lambda",
        "dev" = "DevianceExplained",
        "penalty" = "penalty"
    )
        
    # Extract data from cv.glmnet object
    glmnet_object <- cv_glmnet_object$glmnet.fit
    mat_coef <- as.matrix(coef(glmnet_object))
    vec_lambda <- glmnet_object$lambda
    variables <- rownames(mat_coef)[-1]  # Exclude intercept
    
    # Retrieve alpha parameter
    if (is.null(alpha)) {
        # Attempt to retrieve alpha from glmnet_object$call$alpha
        alpha_call <- glmnet_object$call$alpha
        if (is.numeric(alpha_call)) {
            alpha <- alpha_call
        } else {
            # alpha is a symbol or expression, attempt to evaluate it
            alpha_env <- environment(glmnet_object$call)
            if (is.null(alpha_env)) {
                alpha_env <- parent.frame()
            }
            alpha_value <- try(eval(alpha_call, envir = alpha_env), silent = TRUE)
            if (inherits(alpha_value, "try-error") || !is.numeric(alpha_value)) {
                warning("Alpha parameter is not specified or could not be retrieved from the glmnet object. Defaulting to alpha = 1 (Lasso). Please provide 'alpha' as an argument if using Elastic Net.")
                alpha <- 1
            } else {
                alpha <- alpha_value
            }
        }
    }

    # Calculate measures for x-axis
    mat_coef_no_intercept <- mat_coef[-1, ]  # Remove intercept

    # Compute L1 and L2 norms
    vec_l1norm <- apply(abs(mat_coef_no_intercept), 2, sum)
    vec_l2norm <- apply(mat_coef_no_intercept^2, 2, sum)

    # Compute Elastic Net penalty
    vec_penalty <- (1 - alpha) * 0.5 * vec_l2norm + alpha * vec_l1norm

    # Proportion of deviance explained
    vec_dev_ratio <- glmnet_object$dev.ratio

    # Prepare data frame
    coef_df <- as.data.frame(t(mat_coef_no_intercept))
    coef_df$lambda <- vec_lambda
    coef_df$l1norm <- vec_l1norm  # For compatibility
    coef_df$DevianceExplained <- vec_dev_ratio
    coef_df$penalty <- vec_penalty
    coef_df <- coef_df %>%
        pivot_longer(
            cols = all_of(variables),
            names_to = "variable",
            values_to = "coefficient"
        )

    # Calculate label positions
    label_positions <- coef_df %>%
        group_by(variable) %>%
        filter(
            .data[[xvar_name]] == if (xvar == "lambda") min(.data[[xvar_name]]) else max(.data[[xvar_name]])
        ) %>%
        ungroup()

    # Calculate number of non-zero coefficients at each xvar
    non_zero_counts <- coef_df %>%
        group_by(.data[[xvar_name]]) %>%
        summarize(
            non_zero_count = sum(coefficient != 0),
            .groups = "drop"
        ) %>%
        arrange(.data[[xvar_name]]) %>%
        filter(row_number() == 1 | non_zero_count != lag(non_zero_count, default = first(non_zero_count)))

    # Ensure initial zero count is included
    if (!any(non_zero_counts$non_zero_count == 0)) {
        non_zero_counts <- bind_rows(
            tibble(!!xvar_name := min(coef_df[[xvar_name]]), non_zero_count = 0),
            non_zero_counts
        ) %>%
            arrange(.data[[xvar_name]])
    }

    # Axis labels and transformations
    xvar_labels <- list(
        l1norm = "L1 Norm",
        lambda = expression(lambda~(log[e]~scale)),
        DevianceExplained = "Proportion Deviance Explained",
        penalty = "Elastic Net Penalty"
    )
    
    x_transformation <- if (xvar == "lambda") scales::log_trans(base = exp(1)) else "identity"
    x_breaks <- if (xvar == "lambda") scales::trans_breaks("log", exp) else waiver()
    x_labels <- if (xvar == "lambda") scales::trans_format("log", scales::math_format(e^.x)) else waiver()
    hjust_value <- if (xvar == "lambda") 1.1 else -0.2  # Adjust label position

    # Create the plot
    plot <- ggplot(coef_df, aes(x = .data[[xvar_name]], y = coefficient, color = variable, group = variable)) +
        geom_line() +
        scale_x_continuous(
            name = xvar_labels[[xvar_name]],
            trans = x_transformation,
            breaks = x_breaks,
            labels = x_labels,
            sec.axis = sec_axis(
                trans = ~ .,
                breaks = non_zero_counts[[xvar_name]],
                labels = non_zero_counts$non_zero_count,
                name = "Number of Non-Zero Coefficients"
            )
        ) +
        labs(
            title = "Coefficient Paths from Cross-Validated glmnet Model",
            y = "Coefficient Value"
        ) +
        theme_minimal() +
        theme(legend.position = "none")

    # Add labels if requested
    if (label) {
        plot <- plot +
            geom_text(
                data = label_positions,
                aes(label = variable),
                hjust = hjust_value,
                size = 3,
                check_overlap = TRUE  # Avoid overlapping labels
            )
    }

    return(plot)
}

### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, function.reload = options()$function.reload, runLoadedFunction = FALSE)


#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ MetaData ----  
## .GlobalEnv$MetaData = list() ====  
if(!exists("MetaData", envir=.GlobalEnv)) { assign("MetaData", list(), envir=.GlobalEnv) }  
.parentname = "MetaData"
for (.sublistname in c("tblVarName", "DataSetNames", "VarNames", "VarNames.select", "VarNames.filter", "VarNames.recode", "ModelList")) {
    if(!.sublistname %in% names(.GlobalEnv[[.parentname]])) { .GlobalEnv[[.parentname]][[.sublistname]] = list() }
}
#________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#@@ START) Data -----
## \$ DataSetName |> paste0(".rds") %>% paste0(.path4read.subpath,ifelse(.path4read.subpath=="","","/"),.) |> read_rds() %>% assign(DataSetName, value = ., envir = .GlobalEnv) ====
.path4read.subpath = r"(data)"|>str_replace_all("\\\\","/")
DataSetName = "CohortGJ0910.BaselineJKGJ2085NoHx...01"
# # .path4read.subpath_filename.ext = DataSetName |> paste0(".rds") %>% paste0(.path4read.subpath,ifelse(.path4read.subpath=="","","/"),.)
# # .path_filename.ext = ifelse( file.exists(.path4read.subpath_filename.ext), .path4read.subpath_filename.ext, paste0(env1$path$source_base_github,"/data/",DataSetName,".rds") )
# # cat(".path_filename.ext = ", .path_filename.ext, "  \n", sep = "")
# DataSetName |> paste0(".rds") %>% paste0(.path4read.subpath,ifelse(.path4read.subpath=="","","/"),.) |> read_rds() %>% assign(DataSetName, value = ., envir = .GlobalEnv)
if(!exists("DataSetName0")) {DataSetName0 = DataSetName; cat('  Setting DataSetName0 = "',DataSetName0,'"  \n', sep="")}
MetaData$DataSetNames[[DataSetName]] = env1$f$f_DataSetName.Search.read.checkEntity(DataSetName=DataSetName,ext="rds", .path4read=.path4read|>paste0(ifelse(.path4read.subpath=="","","/"),.path4read.subpath), return.output = TRUE)



###### \% |> () ----  



###### \% |> () ----  



###### \% |> () ----  








# __________|------  
## @ write_rds( get(.objectname), paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".rds",".xz"), compress = "xz", compression = 9L) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
if(exists("MetaData")) {
    # MetaData$DataSetNames |> names() |> paste0(collapse = "\n") |> cat("\n", sep="")
    cat("    ________________________________________________________________________    \n")
    for (.objectname in names(MetaData$DataSetNames)) {
        assign(.objectname, structure(get(.objectname), MetaData = MetaData))
        env1$f$f_objectname.size.write_rds.git_lfs_track_add_f(.objectname = .objectname, .path4write = env1$path$.path4write, createBackup = FALSE, Execute = FALSE, path.size_files = TRUE, git_lfs_track = TRUE, git_add_f = TRUE, CompressionMethod = "xz")
        cat("    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    \n")
    }
}
# #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# .path_filename.xlsx = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".xlsx")
# openxlsx2::write_xlsx(get(.objectname), file = .path_filename.xlsx, as_table = TRUE) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n") 
# if (Sys.info()["sysname"] == "Windows") openxlsx2::xl_open(.path_filename.xlsx)
# #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# .path_filename.UTF8BOM.csv = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".UTF8BOM.csv")
# if (Sys.info()["sysname"] == "Windows") {
#     readr::write_excel_csv(get(.objectname), file = .path_filename.UTF8BOM.csv) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
#     openxlsx2::xl_open(.path_filename.xlsx)
# } else {
#     readr::write_excel_csv(get(.objectname), file = .path_filename.UTF8BOM.csv|>paste0(".xz")) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
# }
# #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# .path_filename.UTF8.csv.xz = paste0(.path4write,ifelse(.path4write=="","","/"),.objectname,".UTF8.csv.xz")
# readr::write_csv(get(.objectname), file = .path_filename.UTF8.csv.xz) |> system.time() |> round(3) |> unclass() |> deparse() |> cat("\n")
##////////////////////////////////////////////////////////////////////////////////  
##::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##********************************************************************************  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  
# @@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


