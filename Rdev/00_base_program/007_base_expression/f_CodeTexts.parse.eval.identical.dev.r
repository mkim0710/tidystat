# Rdev/00_base_program/007_base_expression/f_CodeTexts.parse.eval.identical.dev.r


env1$path$lastSourceEditorContext.path_filename.ext
# set_lastSourceEditorContext.path_filename.ext()

f_CodeTexts.parse.eval.identical = function(CodeText1, CodeText2, show_CodeTexts.parse.eval = TRUE, show_in_one_line = FALSE, LinePrefix4CodeText = "\t") {
    CodeText1.parse.eval = eval(parse(text = CodeText1))
    CodeText2.parse.eval = eval(parse(text = CodeText2))
    CodeTexts.parse.eval.identical = identical(CodeText1.parse.eval, CodeText2.parse.eval) 

    if(show_CodeTexts.parse.eval) {
        if (show_in_one_line) {
            cat(LinePrefix4CodeText, CodeText1, ifelse(CodeTexts.parse.eval.identical, " == ", " != "), CodeText2, " == ", deparse(CodeText2.parse.eval), "  \n", sep = "")
        } else {
            cat(LinePrefix4CodeText);   cat(CodeText1, "  \n", sep = "")
            cat(LinePrefix4CodeText);   cat(LinePrefix4CodeText);   cat(" == ", deparse(CodeText1.parse.eval), "  \n", sep = "")
            cat(LinePrefix4CodeText);   cat(LinePrefix4CodeText);   cat(ifelse(CodeTexts.parse.eval.identical, " == ", " != "), "  \n", sep = "")
            cat(LinePrefix4CodeText);   cat(CodeText2, "  \n", sep = "")
            cat(LinePrefix4CodeText);   cat(LinePrefix4CodeText);   cat(" == ", deparse(CodeText2.parse.eval), "  \n", sep = "")
        }
    }
    invisible(CodeTexts.parse.eval.identical)
}

f_CodeTexts.parse.eval.identical("env1$path$lastSourceEditorContext.path_filename.ext", "rstudioapi::getSourceEditorContext()$path")
# > f_CodeTexts.parse.eval.identical("env1$path$lastSourceEditorContext.path_filename.ext", "rstudioapi::getSourceEditorContext()$path")
# 	env1$path$lastSourceEditorContext.path_filename.ext  
# 		 == NA  
# 		 !=   
# 	rstudioapi::getSourceEditorContext()$path  
# 		 == "~/github_tidystat/Rdev/00_base_program/007_base_expression/f_CodeTexts.parse.eval.identical.dev.r" 

result = f_CodeTexts.parse.eval.identical("env1$path$lastSourceEditorContext.path_filename.ext", "rstudioapi::getSourceEditorContext()$path", show_CodeTexts.parse.eval = FALSE)
result
# > result = f_CodeTexts.parse.eval.identical("env1$path$lastSourceEditorContext.path_filename.ext", "rstudioapi::getSourceEditorContext()$path", show_CodeTexts.parse.eval = FALSE)
# > result
# [1] FALSE
