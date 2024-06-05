# docker volume create usr_share_fonts.sh
# https://chatgpt.com/c/2926bf45-de5a-44e6-9a5c-3515412462ef
# https://gopensource.com/going-through-docker-hell-once-243199d6f7a1
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# "." |> normalizePath(winslash="/") |> browseURL()
# paste0("[Working Files List] ",basename(getwd()),".r") |> file.edit()
# "D:/OneDrive/[][Rproject]/github_tidystat/rstudio-prefs/templates/default.R" |> shQuote(type="cmd") |> shell.exec()
# "D:/OneDrive/[][Rproject]/Rproject_Rmd/templates-00env1.minimum.Rmd" |> shQuote(type="cmd") |> (\(.) shell( paste0('cmd /c ""', file.path(Sys.getenv('LOCALAPPDATA'),"Programs","Microsoft VS Code","Code.exe")|>normalizePath(winslash="/"), '" "', ., '""') ) )()
#|________________________________________________________________________________|#  ----
#| Ctrl(+Shift)+1: Move focus (zoom) to Source Editor 
#| Ctrl+Shift+.[period]: Switch to tab (Show List of Open Tabs~!!!)
#| Ctrl+Alt+Shift+Left/Right: First/Last tab
#| Ctrl+Alt+D: Show diff between current and last commit
#| Ctrl+Alt+M: Commit changes to Git
#| Ctrl+Shift+O: Show/Hide Document Outline
#| Alt+Shift+Drag: Multiline Cursor
#| Ctrl+Shift+F10: Restart R Session 
#| Ctrl+Alt+B: Run from start to current line 
#| Shift+F9: Toggle Breakpoint 
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ #1. Create a new Docker Volume ====
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
docker volume create usr_share_fonts
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ #2. Copy the exising contents in the Dockerfile to the new Docker Volume ====
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #2-1. Run the Container Temporarily to Copy Existing Fonts ----
docker run -it --rm --name temp-rstudio -v texlive_fonts:/new_fonts rocker/verse bash
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #2-2. Copy the exising contents inside the Container to the new Docker Volume ----
cp -r /usr/share/fonts/* /new_fonts/
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #2-3. Exit the Container ----
exit
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ #3. Start the Docker Container with the new Docker Volume ====
docker run -d -p 8787:8787 -e DISABLE_AUTH=true --name rstudio-server -v texlive_fonts:/usr/share/fonts rocker/verse
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ #4. Install Additional Fonts to the new Docker Volume ====
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #4-1a. Install Additional Fonts Using RStudio Terminal ----
# Update package lists
sudo apt-get update

# Install font dependencies
sudo apt-get install -y fontconfig wget unzip

# Install TinyTeX using R
R -e "if (!requireNamespace('tinytex', quietly = TRUE)) install.packages('tinytex'); tinytex::install_tinytex()"

# Install additional LaTeX packages via TinyTeX
R -e "tinytex::tlmgr_install(c( \
    'fontspec', \
    'xunicode', \
    'xltxtra', \
    'cm-unicode', \
    'unicode-math', \
    'roboto', \
    'cascadia-code', \
    'nanum-type1', \
    'nanum-myeongjo', \
    'nanum-gothic', \
    'd2coding' \
  )); tinytex::tlmgr_update()"
# https://www.ctan.org/pkg/cascadia-code
# https://www.ctan.org/tex-archive/fonts/cascadia-code
# https://mirrors.ctan.org/fonts/cascadia-code.zip
# https://mirrors.ctan.org/fonts/cascadia-code/README
# \usepackage{cascadia-code}
# https://www.ctan.org/pkg/roboto
# https://www.ctan.org/tex-archive/fonts/roboto
# https://mirrors.ctan.org/fonts/roboto.zip
# https://mirrors.ctan.org/fonts/roboto/README
# \usepackage{roboto}
# \usepackage[sfdefault]{roboto}
# \usepackage[condensed]{roboto} ????
# \usepackage{roboto-mono}
# \usepackage{roboto-serif}
# https://www.ctan.org/pkg/fira
# https://www.ctan.org/tex-archive/fonts/fira
# https://mirrors.ctan.org/fonts/fira.zip
# https://mirrors.ctan.org/fonts/fira/README

# https://www.ctan.org/topic/korean
# https://www.ctan.org/pkg/kotex-plain
# https://www.ctan.org/pkg/kotex-utf
# https://www.ctan.org/pkg/kotex-utils
# https://www.ctan.org/pkg/xetexko
# https://www.ctan.org/pkg/luatexko
# https://www.ctan.org/pkg/cjk-ko
# https://www.ctan.org/pkg/nanumtype1
# https://www.ctan.org/pkg/baekmuk
# https://www.ctan.org/pkg/unfonts-core
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
##@ #4-1b. Install the required fonts manually ----
# https://fonts.google.com/specimen/Roboto
# https://fonts.google.com/specimen/Roboto+Condensed
# https://fonts.google.com/specimen/Source+Serif+4
# https://fonts.google.com/specimen/Source+Sans+3
# https://fonts.google.com/specimen/Source+Code+Pro
# https://fonts.google.com/specimen/Open+Sans
# https://fonts.google.com/noto/specimen/Noto+Serif
# https://fonts.google.com/noto/specimen/Noto+Sans
# https://fonts.google.com/noto/specimen/Noto+Sans+KR
# https://fonts.google.com/specimen/Fira+Code
# https://fonts.google.com/specimen/Nanum+Myeongjo
# https://fonts.google.com/specimen/Nanum+Gothic
# https://fonts.google.com/specimen/Nanum+Gothic+Coding

# https://github.com/google/fonts
# You can download all Google Fonts in a simple ZIP snapshot (over 1GB) from https://github.com/google/fonts/archive/main.zip
sudo wget https://github.com/google/fonts/archive/main.zip -O /usr/share/fonts/google-fonts.zip
sudo unzip /usr/share/fonts/google-fonts.zip -d /usr/share/fonts/google-fonts
sudo cp /usr/share/fonts/google-fonts/fonts-main/apache/robotocondensed/*.ttf /usr/share/fonts/
sudo cp /usr/share/fonts/google-fonts/fonts-main/apache/roboto/*.ttf /usr/share/fonts/

sudo wget https://github.com/microsoft/cascadia-code/releases/download/v2108.26/CascadiaCode-2108.26.zip -O /usr/share/fonts/cascadia-code.zip
sudo unzip /usr/share/fonts/cascadia-code.zip -d /usr/share/fonts/cascadia-code
sudo cp /usr/share/fonts/cascadia-code/ttf/*.ttf /usr/share/fonts/

sudo wget https://github.com/naver/nanumfont/releases/download/VER2.5/NanumFont_TTF_ALL.zip -O /usr/share/fonts/nanum-fonts.zip
sudo unzip /usr/share/fonts/nanum-fonts.zip -d /usr/share/fonts/nanum
sudo cp /usr/share/fonts/nanum/NanumFont_TTF_ALL/*.ttf /usr/share/fonts/

sudo wget https://github.com/naver/d2codingfont/releases/download/VER1.3.2/D2Coding-Ver1.3.2-20180524.zip -O /usr/share/fonts/d2coding.zip
sudo unzip /usr/share/fonts/d2coding.zip -d /usr/share/fonts/d2coding
sudo cp /usr/share/fonts/d2coding/D2Coding/*.ttf /usr/share/fonts/
sudo fc-cache -f -v





#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@@ END -----
# cat("* To revert to the last commited file, run the following terminal command:\n",
#     '"git checkout -- ',rstudioapi::getSourceEditorContext()$path,'" |> system(intern=TRUE)',"\n", sep="")
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  

