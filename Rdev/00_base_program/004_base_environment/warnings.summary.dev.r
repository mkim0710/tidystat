"Rdev/00_base_program/004_base_environment/warnings.summary.dev.r"
"Rdev/00_base_program/004_base_environment/f_expression.withCallingHandlers.list_warning.summary.dev.r"
"Rdev/00_base_program/004_base_environment/f_expression.withCallingHandlers.attr_warning.summary.dev.r"
"Rdev/00_base_program/004_base_environment/f_expression.withCallingHandlers.attr_warning.summary.dev.Rmd"
# f_expression.withCallingHandlers.list_warning.summary
# f_expression.withCallingHandlers.attr_warning.summary


# https://chatgpt.com/c/672ab3e9-0e90-800e-b768-f39f29e22b6f


assign("warnings.summary", function() {summary(warnings())}, envir = baseenv())
# > assign("warnings.summary", function() {summary(warnings())}, envir = baseenv())
# Error in assign("warnings.summary", function() { : 
#   cannot add binding of 'warnings.summary' to the base environment


# warnings = function() {summary(warnings())}
warnings.summary = function() {summary(warnings())}
warnings.last = function() {last.warning}
warnings.last10 = function() {tail(warnings(), 10)}

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## :: warnings.summary ====  
## :: warnings.last ====  
## :: warnings.last10 ====  
env1$env.internal.attach$warnings.summary = function() {summary(warnings())}
env1$env.internal.attach$warnings.last = function() {last.warning}
env1$env.internal.attach$warnings.last10 = function() {tail(warnings(), 10)}

