# .sourcename_root = "f_df.cv.glmnet"  
## Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.dev.r----  
## Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.dev.Rmd----  
## Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source.r----  
# .sourcename_root = "f_cv_glmnet_object.ggplot"  
## Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.dev.r----  
## Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.dev.Rmd----  
## Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.source.r----  
# # source(paste0(env1$path$source_base,"/","Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source.r"))  
# # if(!file.exists("D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.dev.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.dev.r")  
# # if(!file.exists("D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.dev.Rmd")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.dev.Rmd")  
# # if(!file.exists("D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source.r")  
# file.edit("D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.dev.r"); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext));  
# file.edit("D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.dev.Rmd"); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext));  
# file.edit("D:/D_Repositories/github_tidystat/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source.r"); if(!is.null(env1$path$LastSourceEditorContext.path_filename_ext)) if(env1$path$LastSourceEditorContext.path_filename_ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$LastSourceEditorContext.path_filename_ext));  
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  message('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/",mustWork=NA) ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (Sys.info()['sysname'] == 'Windows') { "." |> normalizePath(winslash="/",mustWork=NA) |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### env1\$path\$LastSourceEditorContext.path_filename_ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$LastSourceEditorContext.path_filename_ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/",mustWork=NA) |> str_replace(fixed(getwd()|>normalizePath(winslash="/",mustWork=NA)), "") |> str_replace("^/", "")
env1$env.internal.attach$getSourceEditorContext.update_LastSourceEditorContext.path_filename_ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$LastSourceEditorContext.path)) env1$path$.path4write = .path4write = env1$path$LastSourceEditorContext.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ SOURCE) -----  

#_________________________________________________________________________________|----  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) function -----  
# .sourcename_root = .filename.source.r |> str_replace("\\.source\\.r$", "")
## .GlobalEnv$env1$f[[.sourcename_root]] = "Sourcing..." 
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
# source("https://raw.githubusercontent.com/mkim0710/tidystat/master/Rdev/10_import_clean_datatype/13_missing_value/f_df.NotNA_p_df.source.r")
# --> Now included in "f_df.t.tribble_construct.source.r"
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_df.cv.glmnet =  ----
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source.r
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.dev.Rmd
.tmp$objectname = "f_df.cv.glmnet"
.tmp$object = function(
        train_data,
        formula,
        i.alpha = 1,
        family = "binomial",
        type_measure = "auc",
        nfolds = 5,
        seed = 1,
        ...
) {
    library(glmnet)
    set.seed(seed)
    
    # Prepare model matrix
    x <- model.matrix(formula, data = train_data)[, -1]  # Remove intercept
    
    # Extract response variable
    y <- model.response(model.frame(formula, data = train_data))
    
    message(paste("Training glmnet model with alpha =", i.alpha))
    
    # Train cross-validated glmnet model
    cv_glmnet_object <- cv.glmnet(
        x = x,
        y = y,
        alpha = i.alpha,
        family = family,
        type.measure = type_measure,
        nfolds = nfolds
    )
    
    attributes(cv_glmnet_object)$mat_coef = cv_glmnet_object %>% f_cv_glmnet_object.mat_coef
    
    # The purpose of cross-validation in cv.glmnet is to determine the optimal lambda value based on the cross-validated error.
    # The cross-validation metrics (e.g., mean error, standard deviation) are stored in the $cvm and $cvsd components of the cv.glmnet object for each lambda in $lambda. The cv.glmnet object does not store the individual models fitted for each fold.
    # After determining the optimal lambda value, the entire dataset is used to fit a single glmnet model, which is stored in $glmnet.fit. 
    return(cv_glmnet_object)
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### ::: f_cv_glmnet_object.mat_coef =  ----
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source.r
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.dev.Rmd
.tmp$objectname = "f_cv_glmnet_object.mat_coef"
.tmp$object = function(cv_glmnet_object) {
    cv_glmnet_object.list_coef = list()
    cv_glmnet_object.list_coef[["min"]] = cv_glmnet_object %>% coef(s = "lambda.min")
    cv_glmnet_object.list_coef[["1se"]] = cv_glmnet_object %>% coef(s = "lambda.1se")

    cv_glmnet_object.mat_coef = cv_glmnet_object.list_coef %>% (function(ls) {
        out = ls %>% reduce(cbind); 
        colnames(out) = names(ls); 
        out
    })()
    cv_glmnet_object.mat_coef
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_cv_glmnet_object.lamda_1se.vec_VarName = function(cv_glmnet_object, lambda = "lambda.1se") ----
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source.r
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.dev.Rmd
.tmp$objectname = "f_cv_glmnet_object.lamda_1se.vec_VarName"
.tmp$object = function(cv_glmnet_object, lambda = "lambda.1se") {
    library(glmnet)
    # Extract coefficients at specified lambda
    coef_matrix <- coef(cv_glmnet_object, s = lambda)
    
    # Identify non-zero coefficients
    vec_VarName_lamda <- rownames(coef_matrix)[which(coef_matrix != 0)]
    
    # Check if any variables were selected
    if (length(vec_VarName_lamda) == 0) {
        message("No variables were selected at the specified lambda.")
        return(NULL)
    }
    
    # Remove the intercept if present
    vec_VarName_lamda <- vec_VarName_lamda[vec_VarName_lamda != "(Intercept)"]
    
    return(vec_VarName_lamda)
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### ::: f_cv_glmnet_object.lamda_list.vec_VarName =  ----
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source.r
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.dev.Rmd
.tmp$objectname = "f_cv_glmnet_object.lamda_list.vec_VarName"
.tmp$object = function(cv_glmnet_object, vec_lambda = c("lambda.min", "lambda.1se")) {
    list_VarName_lamda = vec_lambda %>% set_names() %>% map(~ cv_glmnet_object %>% f_cv_glmnet_object.lamda_1se.vec_VarName(lambda = .x))
    return(list_VarName_lamda)
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_cv_glmnet_object.lamda_1se.glm = function(cv_glmnet_object, formula = as.formula(y ~ .), family = "binomial", test_data, lambda = "lambda.1se", attr_warnings.summary = TRUE) ----
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source.r
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.dev.Rmd
.tmp$objectname = "f_cv_glmnet_object.lamda_1se.glm"
.tmp$object = function(cv_glmnet_object, formula = as.formula(y ~ .), family = "binomial", test_data, lambda = "lambda.1se", attr_warnings.summary = TRUE) {
    library(glmnet)
    vec_VarName_lamda <- f_cv_glmnet_object.lamda_1se.vec_VarName(cv_glmnet_object, lambda = lambda)
    
    # Construct new formula
    formula.lhs <- formula[[2]]  # Extract response variables
    formula_new <- as.formula(
        paste(formula.lhs, "~", paste(vec_VarName_lamda, collapse = " + "))
    )
    
    # Fit glm model on test set
    if (attr_warnings.summary) {
        glm_object <- env1$f$f_expression.eval.withCallingHandlers.attr_warnings.summary(glm(formula_new, family = family, data = test_data))
        # print(attributes(glm_object)$warnings.summary)
    } else {
        glm_object <- glm(formula_new, family = family, data = test_data)
    }
    return(glm_object)
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### ::: f_cv_glmnet_object.lamda_list.glm = function(cv_glmnet_object, formula = as.formula(y ~ .), family = "binomial", test_data, vec_lambda = c("lambda.min", "lambda.1se")) ----
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source.r
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.dev.Rmd
.tmp$objectname = "f_cv_glmnet_object.lamda_list.glm"
.tmp$object = function(cv_glmnet_object, formula = as.formula(y ~ .), family = "binomial", test_data, vec_lambda = c("lambda.min", "lambda.1se")) {
    list_VarName_lamda = vec_lambda %>% set_names() %>% imap(\(x, idx) {message(paste0(" $ ", idx)); cv_glmnet_object %>% f_cv_glmnet_object.lamda_1se.glm(formula = formula, family = family, test_data = test_data, lambda = x)})
    return(list_VarName_lamda)
}
#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## :: f_cv_glmnet_object.ggplot = function(cv_glmnet_object, xvar = c("norm", "lambda", "dev"), label = TRUE) ----
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source.r
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.dev.Rmd
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

#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
### ::: f_cv_glmnet_object_enet.ggplot = function(cv_glmnet_object, xvar = c("norm", "lambda", "dev", "penalty"), label = TRUE, alpha = NULL) ----
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/53_model_selection/f_df.cv.glmnet.source.r
# https://github.com/mkim0710/blob/main/Rdev/50_model_formula_evaluation/53_model_selection/f_cv_glmnet_object.ggplot.dev.Rmd
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

#### \% |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
.tmp$env1_subenv_name = "f"; env1$env.internal$f_function.load2env.internal(function_object = .tmp$object, function_name = .tmp$objectname, env1_subenv_name = .tmp$env1_subenv_name, show_packageStartupMessage = TRUE, RELOAD_FUNCTION = isTRUE(getOption("RELOAD_FUNCTION"))||isTRUE(getOption("DEVMODE")), runLoadedFunction = FALSE)




###### \% |> () ----  



###### \% |> () ----  



###### \% |> () ----  





# @@ END -----  
# # paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# # paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$LastSourceEditorContext.path_filename_ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# cat("* To revert to the last commited file, run the following terminal command:  \n")
# paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  



