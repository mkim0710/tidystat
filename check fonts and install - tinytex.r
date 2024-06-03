# check fonts and install - tinytex.r

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# https://chatgpt.com/c/8d563256-b9b9-4685-b048-343944290455
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  


# Install TinyTeX if not already installed
if (!requireNamespace("tinytex", quietly = TRUE)) {
  install.packages("tinytex")
}
tinytex::install_tinytex()


?tinytex::tlmgr_search
tinytex::tlmgr_search(what = "roboto", file = FALSE, all = TRUE, global = FALSE) |> dput()

# Function to check if a font package is installed and return its path
is_font_installed <- function(font_filename) {
  result <- tinytex::tlmgr_search(what = font_filename, file = FALSE, all = TRUE, global = FALSE)
  if (length(result) > 0) {
    return(result)
  } else {
    return(NULL)
  }
}

# Function to check fonts and print their paths if installed
check_fonts <- function(vec_fonts) {
  for (font_name in names(vec_fonts)) {
    font_path <- is_font_installed(vec_fonts[font_name])
    if (!is.null(font_path)) {
      message(font_name, " is already installed at the following path(s):\n", paste(font_path, collapse = "\n"))
    } else {
      message(font_name, " is not installed.")
    }
  }
}

# Execute the font  installation check and print paths
c("roboto" = "roboto",
  "Roboto Serif" = "sourcesanspro",
  "Cascadia Code Semibold" = "cascadia",
  "NanumMyeongjo" = "nanumtype1",
  "NanumGothic" = "nanumtype1",
  "D2Coding" = "d2coding") |> check_fonts() |> dput()
# > check_fonts()
# tlmgr search --file --global '/texmf-dist/fonts/roboto/'
# tlmgr: package repository https://www.texlive.info/tlnet-archive/2024/04/23/tlnet (not verified: gpg unavailable)
# roboto is already installed.
# tlmgr search --file --global '/texmf-dist/fonts/sourcesanspro/'
# tlmgr: package repository https://www.texlive.info/tlnet-archive/2024/04/23/tlnet (not verified: gpg unavailable)
# Roboto Serif is already installed.
# tlmgr search --file --global '/texmf-dist/fonts/cascadia/'
# tlmgr: package repository https://www.texlive.info/tlnet-archive/2024/04/23/tlnet (not verified: gpg unavailable)
# Cascadia Code Semibold is already installed.
# tlmgr search --file --global '/texmf-dist/fonts/nanumtype1/'
# tlmgr: package repository https://www.texlive.info/tlnet-archive/2024/04/23/tlnet (not verified: gpg unavailable)
# NanumMyeongjo is already installed.
# tlmgr search --file --global '/texmf-dist/fonts/nanumtype1/'
# tlmgr: package repository https://www.texlive.info/tlnet-archive/2024/04/23/tlnet (not verified: gpg unavailable)
# NanumGothic is already installed.
# tlmgr search --file --global '/texmf-dist/fonts/d2coding/'
# tlmgr: package repository https://www.texlive.info/tlnet-archive/2024/04/23/tlnet (not verified: gpg unavailable)
# D2Coding is already installed.

"nothing" |> check_fonts() |> dput()

# Function to install fonts if they are not installed
check_and_install_fonts <- function(vec_fonts) {
  for (font_name in names(vec_fonts)) {
    font_path <- is_font_installed(vec_fonts[font_name])
    if (!is.null(font_path)) {
      message(font_name, " is already installed at the following path(s):\n", paste(font_path, collapse = "\n"))
    } else {
      message(font_name, " is not installed. Installing...")
      tinytex::tlmgr_install(pkgs = vec_fonts[font_name])
    }
  }
}

# Execute the font installation check
c("roboto" = "roboto",
  "Roboto Serif" = "sourcesanspro",
  "Cascadia Code Semibold" = "cascadia",
  "NanumMyeongjo" = "nanumtype1",
  "NanumGothic" = "nanumtype1",
  "D2Coding" = "d2coding") |> check_and_install_fonts() |> dput()

# Verify the installation of each font package
verify_fonts <- function(vec_fonts) {
  for (font_name in names(vec_fonts)) {
    if (!is.null(is_font_installed(vec_fonts[font_name]))) {
      message(font_name, " is successfully installed.")
    } else {
      message(font_name, " is still not installed. Please check manually.")
    }
  }
}

# Verify font installations
c("roboto" = "roboto",
  "Roboto Serif" = "sourcesanspro",
  "Cascadia Code Semibold" = "cascadia",
  "NanumMyeongjo" = "nanumtype1",
  "NanumGothic" = "nanumtype1",
  "D2Coding" = "d2coding") |> verify_fonts() |> dput()




















#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----
cat("* To revert to the last commited file, run the following terminal command:\n", 
    '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"\n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  




