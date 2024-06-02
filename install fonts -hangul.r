# install fonts -hangul.r


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# https://r2bit.com/book_viz/viz-font.html
# https://github.com/naver/d2codingfont
# https://chatgpt.com/c/2ea68929-ae7c-47bb-b04d-ca3651eb00cb
#|________________________________________________________________________________|#  
#| System Fonts: XeLaTeX and LuaLaTeX can access any fonts that are installed in the operating system font directories. These directories are typically: |#
#| Windows: C:\Windows\Fonts |#
#| macOS: /Library/Fonts and ~/Library/Fonts |#
#| Linux: /usr/share/fonts, /usr/local/share/fonts, and possibly others depending on the distribution and user settings. |#
#|________________________________________________________________________________|#  
#|The fontspec package for XeLaTeX and LuaLaTeX: Use fontspec when you are compiling with XeLaTeX or LuaLaTeX to take advantage of modern font technologies and system font access.
#|\usepackage{fontspec}  # fontspec package for XeLaTeX and LuaLaTeX
#|Traditional Packages for pdfLaTeX: Use fontenc and traditional LaTeX font packages when compiling with pdfLaTeX.
#|\usepackage[T1]{fontenc}  # T1 font encoding
#|\usepackage{helvet}  # Helvetica font
#|\usepackage{courier}  # Courier font
#|\usepackage{mathptmx}  # Times New Roman font
#|\usepackage{lmodern}  # Latin Modern fonts, a modern replacement for Computer Modern
#|\usepackage{textcomp}  # for additional symbols
#|\renewcommand{\familydefault}{\sfdefault}  Set default font to Helvetica
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @ http://wiki.ktug.org/wiki/wiki.php/ko.TeX -----
% !TEX encoding = UTF-8 Unicode

\documentclass{article}

\usepackage{amsmath,amssymb}
\usepackage[hangul]{kotex}
\usepackage{kotex-logo}

\usepackage{iftex}
\ifPDFTeX
  \usepackage{dhucs-nanumfont}
\else\ifXeTeX
  \setmainhangulfont[Ligatures=TeX]{HCR Batang LVT}
  \setsanshangulfont[Ligatures=TeX]{HCR Dotum LVT}
\else\ifLuaTeX
  \setmainhangulfont[Ligatures=TeX]{HCR Batang LVT}
  \setsanshangulfont[Ligatures=TeX]{HCR Dotum LVT}
\fi\fi\fi

\begin{document}

\title{\koTeX-article 템플릿}
\author{저자}
\date{}
\maketitle

\section{절 제목}

\subsection{소절 제목}

이 문서는 \koTeX\ 문서입니다.

\end{document}


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @ http://www.ktug.org/xe/index.php?mid=Install ----
# http://wiki.ktug.org/wiki/wiki.php/설치하기Windows
# http://wiki.ktug.org/wiki/wiki.php/설치하기Windows/UserFont
# http://wiki.ktug.org/wiki/wiki.php/설치하기MacOSX
# http://wiki.ktug.org/wiki/wiki.php/설치하기Linux



#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@ D2 coding -----

#!/bin/bash

# Check if the D2 Coding font is installed
if fc-list | grep -qi "D2Coding"; then
    echo "D2 Coding font is already installed."
else
    echo "D2 Coding font is not installed. Installing now..."

    # Update package lists
    sudo apt-get update

    # Install the D2 Coding font
    sudo apt-get install -y fonts-naver-d2coding

    # Verify installation
    if fc-list | grep -qi "D2Coding"; then
        echo "D2 Coding font installed successfully."
    else
        echo "Failed to install D2 Coding font."
    fi
fi


#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
'sudo apt update' |> system(intern=TRUE) |> cat(sep="\n")
# > 'sudo apt update' |> system(intern=TRUE) |> cat(sep="\n")
# 
# WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
# 
# Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]                   
# Get:2 http://archive.ubuntu.com/ubuntu jammy InRelease [270 kB]                             
# Get:3 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages [1,858 kB]       
# Get:4 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]                     
# Get:5 http://archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]                   
# Get:6 http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages [1,792 kB]                 
# Get:7 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages [2,395 kB] 
# Get:8 http://archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages [266 kB]             
# Get:9 http://archive.ubuntu.com/ubuntu jammy/universe amd64 Packages [17.5 MB]"             
# Get:10 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages [44.7 kB] 
# Get:11 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [1,084 kB]  
# Get:12 http://archive.ubuntu.com/ubuntu jammy/restricted amd64 Packages [164 kB]            
# Get:13 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [2,129 kB]        
# Get:14 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [1,377 kB]    
# Get:15 http://archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages [2,468 kB]  
# Get:16 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages [51.1 kB]   
# Get:17 http://archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages [31.8 kB]   
# Get:18 http://archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [81.0 kB]       
# Fetched 31.9 MB in 8s (4,001 kB/s)                                                          
# Reading package lists...                                                                    
# Building dependency tree...                                                                 
# Reading state information...                                                                
# 24 packages can be upgraded. Run 'apt list --upgradable' to see them.  
# > 'sudo apt update' |> system(intern=TRUE) |> cat(sep="\n")
# 
# WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
# 
# Hit:1 http://archive.ubuntu.com/ubuntu jammy InRelease
# Hit:2 http://security.ubuntu.com/ubuntu jammy-security InRelease
# Hit:3 http://archive.ubuntu.com/ubuntu jammy-updates InRelease
# Hit:4 http://archive.ubuntu.com/ubuntu jammy-backports InRelease
# Reading package lists...
# Building dependency tree...
# Reading state information...
# 24 packages can be upgraded. Run 'apt list --upgradable' to see them.


'apt search d2coding' |> system(intern=TRUE) |> cat(sep="\n")
# > 'apt search d2coding' |> system(intern=TRUE) |> cat(sep="\n")
# 
# WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
# 
# Sorting...
# Full Text Search...
# fonts-naver-d2coding/jammy 1.3.2-2 all
#   D2Coding fixed-width Korean font


'sudo apt install fonts-d2coding' |> system(intern=TRUE) |> cat(sep="\n")
# > 'sudo apt install fonts-d2coding' |> system(intern=TRUE) |> cat(sep="\n")
# 
# WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
# 
# E: Unable to locate package fonts-d2coding
# Reading package lists...
# Building dependency tree...
# Reading state information...
# Warning message:
# In system("sudo apt install fonts-d2coding", intern = TRUE) :
#   running command 'sudo apt install fonts-d2coding' had status 100

'sudo apt install fonts-naver-d2coding' |> system(intern=TRUE) |> cat(sep="\n")
# > 'sudo apt install fonts-naver-d2coding' |> system(intern=TRUE) |> cat(sep="\n")
# 
# WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
# 
# debconf: delaying package configuration, since apt-utils is not installed
# Reading package lists...
# Building dependency tree...
# Reading state information...
# The following NEW packages will be installed:
#   fonts-naver-d2coding
# 0 upgraded, 1 newly installed, 0 to remove and 24 not upgraded.
# Need to get 3,176 kB of archives.
# After this operation, 8,478 kB of additional disk space will be used.
# Get:1 http://archive.ubuntu.com/ubuntu jammy/universe amd64 fonts-naver-d2coding all 1.3.2-2 [3,176 kB]
# Fetched 3,176 kB in 3s (908 kB/s)
# Selecting previously unselected package fonts-naver-d2coding.
# (Reading database ... 49644 files and directories currently installed.)
# Preparing to unpack .../fonts-naver-d2coding_1.3.2-2_all.deb ...
# Unpacking fonts-naver-d2coding (1.3.2-2) ...
# Setting up fonts-naver-d2coding (1.3.2-2) ...
# Processing triggers for fontconfig (2.13.1-4.2ubuntu5) ...

'fc-cache -fv' |> system(intern=TRUE) |> cat(sep="\n")
'fc-list | grep "D2Coding"' |> system(intern=TRUE) |> cat(sep="\n")
# > 'fc-cache -fv' |> system(intern=TRUE) |> cat(sep="\n")
# /usr/share/fonts: caching, new cache contents: 0 fonts, 6 dirs
# /usr/share/fonts/X11: caching, new cache contents: 0 fonts, 4 dirs
# /usr/share/fonts/X11/Type1: caching, new cache contents: 0 fonts, 0 dirs
# /usr/share/fonts/X11/encodings: caching, new cache contents: 0 fonts, 1 dirs
# /usr/share/fonts/X11/encodings/large: caching, new cache contents: 0 fonts, 0 dirs
# /usr/share/fonts/X11/misc: caching, new cache contents: 0 fonts, 0 dirs
# /usr/share/fonts/X11/util: caching, new cache contents: 0 fonts, 0 dirs
# /usr/share/fonts/cMap: caching, new cache contents: 0 fonts, 0 dirs
# /usr/share/fonts/cmap: caching, new cache contents: 0 fonts, 5 dirs
# /usr/share/fonts/cmap/adobe-cns1: caching, new cache contents: 0 fonts, 0 dirs
# /usr/share/fonts/cmap/adobe-gb1: caching, new cache contents: 0 fonts, 0 dirs
# /usr/share/fonts/cmap/adobe-japan1: caching, new cache contents: 0 fonts, 0 dirs
# /usr/share/fonts/cmap/adobe-japan2: caching, new cache contents: 0 fonts, 0 dirs
# /usr/share/fonts/cmap/adobe-korea1: caching, new cache contents: 0 fonts, 0 dirs
# /usr/share/fonts/opentype: caching, new cache contents: 0 fonts, 1 dirs
# /usr/share/fonts/opentype/urw-base35: caching, new cache contents: 35 fonts, 0 dirs
# /usr/share/fonts/truetype: caching, new cache contents: 0 fonts, 2 dirs
# /usr/share/fonts/truetype/naver-d2coding: caching, new cache contents: 4 fonts, 0 dirs
# /usr/share/fonts/truetype/roboto: caching, new cache contents: 0 fonts, 1 dirs
# /usr/share/fonts/truetype/roboto/unhinted: caching, new cache contents: 8 fonts, 1 dirs
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF: caching, new cache contents: 12 fonts, 0 dirs
# /usr/share/fonts/type1: caching, new cache contents: 0 fonts, 3 dirs
# /usr/share/fonts/type1/gsfonts: caching, new cache contents: 35 fonts, 0 dirs
# /usr/share/fonts/type1/texlive-fonts-recommended: caching, new cache contents: 0 fonts, 0 dirs
# /usr/share/fonts/type1/urw-base35: caching, new cache contents: 35 fonts, 0 dirs
# /usr/local/share/fonts: caching, new cache contents: 0 fonts, 0 dirs
# /home/rstudio/.local/share/fonts: skipping, no such directory
# /home/rstudio/.fonts: skipping, no such directory
# /usr/share/texmf/fonts/opentype/public/tex-gyre: caching, new cache contents: 33 fonts, 0 dirs
# /usr/share/texmf/fonts/opentype/public/tex-gyre-math: caching, new cache contents: 5 fonts, 0 dirs
# /usr/share/fonts/X11: skipping, looped directory detected
# /usr/share/fonts/cMap: skipping, looped directory detected
# /usr/share/fonts/cmap: skipping, looped directory detected
# /usr/share/fonts/opentype: skipping, looped directory detected
# /usr/share/fonts/truetype: skipping, looped directory detected
# /usr/share/fonts/type1: skipping, looped directory detected
# /usr/share/fonts/X11/Type1: skipping, looped directory detected
# /usr/share/fonts/X11/encodings: skipping, looped directory detected
# /usr/share/fonts/X11/misc: skipping, looped directory detected
# /usr/share/fonts/X11/util: skipping, looped directory detected
# /usr/share/fonts/cmap/adobe-cns1: skipping, looped directory detected
# /usr/share/fonts/cmap/adobe-gb1: skipping, looped directory detected
# /usr/share/fonts/cmap/adobe-japan1: skipping, looped directory detected
# /usr/share/fonts/cmap/adobe-japan2: skipping, looped directory detected
# /usr/share/fonts/cmap/adobe-korea1: skipping, looped directory detected
# /usr/share/fonts/opentype/urw-base35: skipping, looped directory detected
# /usr/share/fonts/truetype/naver-d2coding: skipping, looped directory detected
# /usr/share/fonts/truetype/roboto: skipping, looped directory detected
# /usr/share/fonts/type1/gsfonts: skipping, looped directory detected
# /usr/share/fonts/type1/texlive-fonts-recommended: skipping, looped directory detected
# /usr/share/fonts/type1/urw-base35: skipping, looped directory detected
# /usr/share/fonts/X11/encodings/large: skipping, looped directory detected
# /usr/share/fonts/truetype/roboto/unhinted: skipping, looped directory detected
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF: skipping, looped directory detected
# /var/cache/fontconfig: not cleaning unwritable cache directory
# /home/rstudio/.cache/fontconfig: cleaning cache directory
# /home/rstudio/.fontconfig: not cleaning non-existent cache directory
# fc-cache: succeeded
# > 'fc-list | grep "D2Coding"' |> system(intern=TRUE) |> cat(sep="\n")
# /usr/share/fonts/truetype/naver-d2coding/D2Coding-Ver1.3.2-20180524-all.ttc: D2Coding:style=Regular
# /usr/share/fonts/truetype/naver-d2coding/D2Coding-Ver1.3.2-20180524-all.ttc: D2Coding:style=Bold
# /usr/share/fonts/truetype/naver-d2coding/D2Coding-Ver1.3.2-20180524-all.ttc: D2Coding ligature:style=Regular
# /usr/share/fonts/truetype/naver-d2coding/D2Coding-Ver1.3.2-20180524-all.ttc: D2Coding ligature:style=Bold



\documentclass{article}
\usepackage{fontspec}
\setmonofont{D2Coding}  % Sets the monospaced font to D2 Coding

\begin{document}
This is a sample text in D2 Coding font.
\end{document}


#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @ https://statkclee.github.io/latex/latex-korean-helloworld.html ----

\documentclass{article}
\usepackage{kotex}
\usepackage{import}
\usepackage{lipsum}  

% Fonts
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
%% 영문 폰트
%\setmainfont{TeX Gyre Termes}
%\setromanfont{Times New Roman}
%\setsansfont{Arial}
%\setmonofont{Courier New}
%\setmainfont{Arial}
%% 한글 폰트
\setmainhangulfont{NanumMyeongjo} % NanumMyeongjo
\setsanshangulfont{맑은 고딕}     % MalgunGothic
\setmonohangulfont{D2Coding}

% References
\usepackage{babel}
\usepackage{csquotes}
\usepackage[style=authoryear, backend=bibtex]{biblatex}
\addbibresource{biblatex-examples.bib}

% 제 X 장 설정
\renewcommand{\thesection}{제 \arabic{section} 절}

\begin{document}
    % Title and Author
    \title{한글 \LaTeX}
    \author{이광춘}
    \maketitle
    
    % Main Contents
    \abstract{}
        {\fontfamily{lmtt}\selectfont
            \lipsum[1]  
        }
    \section{들어가며}
        {\hangulfontspec{맑은 고딕}
            \import{sections/}{01_intro.tex}
        }
    \section{main findings}
        \lipsum[1-2]
    \section{주장 증명방법}
            \import{sections/}{02_proof.tex}
    \section{코드}
        \begin{verbatim}
            코딩 글꼴 한글도 함께 합니다!!!
            Text enclosed inside \texttt{verbatim} environment 
            is printed directly 
            and all \LaTeX{} commands are ignored.
        \end{verbatim}
    % References
    \section{참고 문헌}
            Lorem \autocite{sigfridsson}
            ipsum \autocite{worman}
            dolor \autocite{nussbaum}
            sit \autocite{sigfridsson}
            amet \autocite{geer}    
    \printbibliography
\end{document}



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

