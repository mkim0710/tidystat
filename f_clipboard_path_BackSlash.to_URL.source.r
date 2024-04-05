# f_clipboard_path_BackSlash.to_URL.source.r


# https://www.listendata.com/2015/06/convert-backslash-file-path-to-forward.html
f_clipboard_path_BackSlash.to_ForwardSlash <- function(clipboard_path_BackSlash = TRUE) {
    input_path_BackSlash.escaped <- if (clipboard_path_BackSlash) {
        readClipboard()
    } else {
        cat("Please enter the path:\n\n")
        readline()
    }
    input_path.ForwardSlash <- chartr("\\", "/", input_path_BackSlash.escaped)
    writeClipboard(input_path.ForwardSlash)
    cat(input_path.ForwardSlash); cat("\n")
    return(input_path.ForwardSlash)
}
# D:\OneDrive\[Note]\[Note] Stat\[[Stat]] CRAN R\[[[[R]]]] Cheatsheets\[[[[Cheat Sheets]]]] RStudio
# copy (Ctrl + C) the path above and run the function below
f_clipboard_path_BackSlash.to_ForwardSlash()
# > f_path_BackSlash.to_ForwardSlash()
# [1] "D:/OneDrive/[Note]/[Note] Stat/[[Stat]] CRAN R/[[[[R]]]] Cheatsheets/[[[[Cheat Sheets]]]] RStudio"
f_clipboard_path_BackSlash.to_ForwardSlash(clipboard_path_BackSlash = FALSE)
# > f_clipboard_path_BackSlash.to_ForwardSlash(clipboard_path_BackSlash = FALSE)
# Please enter the path:
# 
# D:\OneDrive\[Note]\[Note] Stat\[[Stat]] CRAN R\[[[[R]]]] Cheatsheets\[[[[Cheat Sheets]]]] RStudio
# D:/OneDrive/[Note]/[Note] Stat/[[Stat]] CRAN R/[[[[R]]]] Cheatsheets/[[[[Cheat Sheets]]]] RStudio
# [1] "D:/OneDrive/[Note]/[Note] Stat/[[Stat]] CRAN R/[[[[R]]]] Cheatsheets/[[[[Cheat Sheets]]]] RStudio"


f_clipboard_path_BackSlash.to_URL = function(clipboard_path_BackSlash = TRUE) {
    input_path_BackSlash.escaped <- if (clipboard_path_BackSlash) {
        readClipboard()
    } else {
        cat("Please enter the path:\n\n")
        readline()
    }
    input_path.ForwardSlash <- chartr("\\", "/", input_path_BackSlash.escaped)

    # Use the built-in URLencode function to encode the URL
    input_path.URL <- URLencode(input_path.ForwardSlash)
    
    # Replace encoded slashes back to normal slashes
    input_path.URL2 <- gsub("%2F", "/", input_path.URL)
    
    # Return the modified URL
    writeClipboard(input_path.URL2)
    cat(input_path.URL2); cat("\n")
    return(input_path.URL2)
}
# D:\OneDrive\[Note]\[Note] Stat\[[Stat]] CRAN R\[[[[R]]]] Cheatsheets\[[[[Cheat Sheets]]]] RStudio
# copy (Ctrl + C) the path above and run the function below
f_clipboard_path_BackSlash.to_URL()
# > f_clipboard_path_BackSlash.to_URL()
# D:/OneDrive/[Note]/[Note]%20Stat/[[Stat]]%20CRAN%20R/[[[[R]]]]%20Cheatsheets/[[[[Cheat%20Sheets]]]]%20RStudio
# [1] "D:/OneDrive/[Note]/[Note]%20Stat/[[Stat]]%20CRAN%20R/[[[[R]]]]%20Cheatsheets/[[[[Cheat%20Sheets]]]]%20RStudio"
f_clipboard_path_BackSlash.to_URL(clipboard_path_BackSlash = FALSE)
# > f_clipboard_path_BackSlash.to_URL(clipboard_path_BackSlash = FALSE)
# Please enter the path:
# 
# D:\OneDrive\[Note]\[Note] Stat\[[Stat]] CRAN R\[[[[R]]]] Cheatsheets\[[[[Cheat Sheets]]]] RStudio
# D:/OneDrive/[Note]/[Note]%20Stat/[[Stat]]%20CRAN%20R/[[[[R]]]]%20Cheatsheets/[[[[Cheat%20Sheets]]]]%20RStudio
# [1] "D:/OneDrive/[Note]/[Note]%20Stat/[[Stat]]%20CRAN%20R/[[[[R]]]]%20Cheatsheets/[[[[Cheat%20Sheets]]]]%20RStudio"

# Below is the path when opened in the Edge browser: 
# file:///D:/OneDrive/[Note]/[Note]%20Stat/[[Stat]]%20CRAN%20R/[[[[R]]]]%20Cheatsheets/[[[[Cheat%20Sheets]]]]%20RStudio/data-import%20&%20transformation%20cheatsheet%202017.01.pdf
#         D:/OneDrive/[Note]/[Note]%20Stat/[[Stat]]%20CRAN%20R/[[[[R]]]]%20Cheatsheets/[[[[Cheat%20Sheets]]]]%20RStudio/data-import%20&%20transformation%20cheatsheet%202017.01.pdf



#@ end ----
