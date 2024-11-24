# f.Options.set_option_value.dev-pending.r

?options
# Invoking options() with no arguments returns a list with the current values of the options. Note that not all options listed below are set initially. To access the value of a single option, one should use, e.g., getOption("width") rather than options("width") which is a list of length one.
# Note
# For compatibility with S there is a visible object .Options whose value is a pairlist containing the current options() (in no particular order). Assigning to it will make a local copy and not change the original. (Using it however is faster than calling options()).
# An option set to NULL is indistinguishable from a non existing option.

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##________________________________________________________________________________  
#|________________________________________________________________________________|#  ----  

options() %>% str(max.level = 0)
.Options %>% str(max.level = 0)

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
options()$DoesNotExist
.Options$DoesNotExist
# > options()$DoesNotExist
# NULL
# > .Options$DoesNotExist
# NULL

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.Options$DEBUGMODE = "input via .Options$DEBUGMODE = value"
options(DEBUGMODE = "input via options(DEBUGMODE = value)")
isTRUE(getOption("DEBUGMODE")) = "input via isTRUE(getOption("DEBUGMODE")) = value"
# > isTRUE(getOption("DEBUGMODE")) = "input via isTRUE(getOption("DEBUGMODE")) = value"
# Error in isTRUE(getOption("DEBUGMODE")) = "input via isTRUE(getOption("DEBUGMODE")) = value" : 
#   invalid (NULL) left side of assignment

.Options$DEBUGMODE
getOption("DEBUGMODE")
isTRUE(getOption("DEBUGMODE"))
# > .Options$DEBUGMODE
# [1] "input via .Options$DEBUGMODE = value"
# > getOption("DEBUGMODE")
# [1] "input via options(DEBUGMODE = value)"
# > isTRUE(getOption("DEBUGMODE"))
# [1] "input via options(DEBUGMODE = value)"

##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.Options$DEBUGMODE = "input via .Options$DEBUGMODE = value"
options(DEBUGMODE = "input via options(DEBUGMODE = value)")
isTRUE(getOption("DEBUGMODE")) = NULL
# > isTRUE(getOption("DEBUGMODE")) = NULL
# Error in isTRUE(getOption("DEBUGMODE")) = NULL : 
#   invalid (NULL) left side of assignment

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
.Options$DEBUGMODE = "input via .Options$DEBUGMODE = value"
options(DEBUGMODE = "input via options(DEBUGMODE = value)")
options(DEBUGMODE = NULL)
.Options$DEBUGMODE
getOption("DEBUGMODE")
isTRUE(getOption("DEBUGMODE"))
# > .Options$DEBUGMODE
# [1] "input via .Options$DEBUGMODE = value"
# > getOption("DEBUGMODE")
# NULL
# > isTRUE(getOption("DEBUGMODE"))
# NULL

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
.Options$DEBUGMODE = "input via .Options$DEBUGMODE = value"
options(DEBUGMODE = "input via options(DEBUGMODE = value)")
.Options$DEBUGMODE = NULL
.Options$DEBUGMODE
getOption("DEBUGMODE")
isTRUE(getOption("DEBUGMODE"))
# > .Options$DEBUGMODE
# NULL
# > getOption("DEBUGMODE")
# [1] "input via options(DEBUGMODE = value)"
# > isTRUE(getOption("DEBUGMODE"))
# [1] "input via options(DEBUGMODE = value)"


##________________________________________________________________________________  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.Options$NewBy.Options
.Options$NewBy.Options = ".Options$NewBy.Options = value"
.Options$NewBy.Options
options()$NewBy.Options
# > .Options$NewBy.Options
# NULL
# > .Options$NewBy.Options = ".Options$NewBy.Options = value"
# > .Options$NewBy.Options
# [1] ".Options$NewBy.Options = value"
# > options()$NewBy.Options
# NULL

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
options()$NewBy_options
options(NewBy_options = "options(NewBy_options = value)")
options()$NewBy_options
.Options$NewBy_options
# > options()$NewBy_options
# NULL
# > options(NewBy_options = "options(NewBy_options = value)")
# > options()$NewBy_options
# [1] "options(NewBy_options = value)"
# > .Options$NewBy_options
# NULL

