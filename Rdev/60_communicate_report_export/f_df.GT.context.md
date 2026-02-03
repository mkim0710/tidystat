analyze the following github repo:
https://github.com/ddsjoberg/gtsummary
analyze the functionality and the program logics - I want to eventually adopt some features in the repo into my custom functions for data table/report generation.

___
## I want to make a manuscript like the one generated from the code I shared (using tbl_uvregression).
See the following code, which were my previous code for manuscirpt table generation.

https://github.com/mkim0710/tidystat/blob/master/Rdev/60_communicate_report_export/f_df.summary_byExposure.dev.Rmd
https://github.com/mkim0710/tidystat/blob/master/Rdev/50_model_formula_evaluation/57_model_time2event/f_df.PersonTime.dev.r
https://github.com/mkim0710/tidystat/blob/master/Rdev/60_communicate_report_export/function.HazardRatios.spread.dev.r
https://github.com/mkim0710/tidystat/blob/master/Rdev/60_communicate_report_export/function.ggplot.ORCI.dev.r
https://github.com/mkim0710/tidystat/blob/master/Rdev/60_communicate_report_export/function.tbl_varname_level_ORCI.source.r
https://github.com/mkim0710/tidystat/blob/master/Rdev/60_communicate_report_export/function.tbl_varname_level_HRCI.dev.r
https://github.com/mkim0710/tidystat/blob/master/Rdev/60_communicate_report_export/function.lm_object.summary.coefCI.dev.r
https://github.com/mkim0710/tidystat/blob/master/Rdev/60_communicate_report_export/function.glm_object.summary.exp()%20-debug%20180806.r
https://github.com/mkim0710/tidystat/blob/master/Rdev/50_model_formula_evaluation/55_model_weighted/function.svyglm.MainModel.byEffectModifier.dev.r

Please explain how I may modify them to look like the code I shared (using tbl_uvregression).

### Table Structure: 
Do your manuscript tables usually present all predictors together in a single panel (i.e., one large table), or do you prefer to group them by domain (e.g., demographics, clinical labs, etc.)? prefer to group them by domain 

### Three-variable Tables: 
For the GT2_3vregression scripts, are the three variables always fixed, or should the refactored function accept an arbitrary list of 1–3 predictors to include side-by-side? main exposure & age & sex

### Excel Export: 
Should Excel export preserve flextable formatting (e.g., via flextable::save_as_excel() or officer::print()) or is a raw data export sufficient (via writexl::write_xlsx() or similar)? I prefer flextable & officer because I need to write word & excel files.

### Statistical Models: 
Should the refactored logic automatically detect model family (e.g., logistic, linear, Cox) based on outcome, or do you prefer passing the method explicitly? need both automation & explicit assignment

___
## I want to refactor the following code to reduce the dependency on the gtsummary library.
If dependency on the gtsummary remains, I need the function to be compatible with gtsummary version 2.2.0 or above. Note that the functions in gtsummary might not be backward compatible. 
I still want tidyverse, flextable, and officer, because I want the final output to be in both word & excel, which will be finally formatted as scientific journal manuscript.
I need to reduce the dependency on the env1 object (https://raw.githubusercontent.com/mkim0710/tidystat/refs/heads/master/env1%24env.internal.source.r) as well.

```r
byVar = "A01_BMI_ge250"
.Regex4proxies.byVar = byVar %>% str_extract("^[A-Za-z0-9]+_[A-Za-z0-9]+")
DS4uvregression = DS.DNR %>%
select(matches("^A0[0-1]"), all_of(byVar)) %>%
select(-matches(.Regex4proxies.byVar), all_of(byVar)) %>%
# mutate_if(is.factor, droplevels) %>%
# select_if(function(x) !is.factor(x) || is.factor(x) && length(levels(x)) = 2) %>%
select_if(function(x) !is.factor(x)) %>%
select_if(function(x) !all(is.na(x))) %>%
select_if(function(vec) !is.Date(vec))
env1$env.internal.attach$Sys.time.set_t0()
GT2_uvregression = DS4uvregression %>%
mutate_if(is.factor, droplevels) %>%
select_if(function(x) !all(is.na(x))) %>%
select_if(function(vec) !is.Date(vec)) %>%
select_if(function(vec) n_distinct(vec[!is.na(vec)]) > 1) %>%
tbl_uvregression(
method = glm,
method.arg = list(family = binomial),
y = !!rlang::sym(byVar),
exponentiate = TRUE
) %>%
add_global_p(keep = TRUE) %>%
# add_n(location = "both") %>%
# add_nevent(location = "both") |>
add_n(location = "level") %>%
add_nevent(location = "level") |>
# modify_header(all_stat_cols() ~ "**{level}**  nN = {n} ({style_percent(p)}%)", p.value ~ "***p***") |>
modify_header(p.value ~ "***p***") |>
# modify_spanning_header(all_stat_cols() ~ "summary") |>
bold_p(t = 0.10) |>
bold_labels() |>
italicize_levels() |>
env1$f$f_expression.eval.withCallingHandlers.attr_warnings.summary()
env1$env.internal.attach$Sys.time.from_t0()  # Time difference of 4.008291 mins → Time difference of 31.2056 secs @ select_if(function(x) !is.factor(x))

GT2_uvregression %>% show_header_names
GT2_uvregression$table_body %>% select(variable, N_obs, N_event, label, estimate, std.error, statistic, conf.low, conf.high, ci, p.value) |> print(n=99)
GT2_uvregression |>
print() |> invisible()
```
