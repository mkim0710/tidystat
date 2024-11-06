
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

