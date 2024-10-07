# f_font.tlmgr_installed.dev.r
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# check fonts and install - tinytex@Rocker.r
# https://chatgpt.com/c/8d563256-b9b9-4685-b048-343944290455
# https://chatgpt.com/c/798e2ff5-96bf-481c-8d2d-77129a2812d7
# https://chatgpt.com/c/2926bf45-de5a-44e6-9a5c-3515412462ef
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
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
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit( paste0("[Working Files List] ",basename(getwd()),".r") )  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/default.R  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# rm(list=ls())
# rstudioapi::restartSession()  # ctrl+shift+f10
# https://stackoverflow.com/questions/7505547/detach-all-packages-while-working-in-r
# .sourcename = "function.detachAllPackages" |> paste0(".source.r"); .subpath=r"()"|>str_replace_all("\\\\","/"); .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.); if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# cmd /C C:/PROGRA~2/MICROS~1/Edge/APPLIC~1/msedge_proxy.exe --app=https://github.com/mkim0710/tidystat/blob/master/.Rprofile    
#| ------------------------- < To be covered at .Rprofile > --------------------- |#  
if(!exists("env1", envir=.GlobalEnv)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
if(!".Rprofile" %in% names(.GlobalEnv$env1$source)) {  cat('> source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  \n')  ;  source("https://raw.githubusercontent.com/mkim0710/tidystat/master/.Rprofile")  ;  .First()  }  
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path ====  
# tibble( symbol = c("/", "~", ".", "..")) |> mutate(normalizePath = symbol |> normalizePath(winslash="/") ) |> format() |> (\(vec) vec[c(-1,-3)])() |> cat("  ", sep="  \n") 
# if (.Platform$OS.type == 'windows') { "." |> normalizePath(winslash="/") |> utils::browseURL() } else { "." |> dir(all.files=TRUE) %>% paste0('"',.,'"') |> paste(collapse = ", \n  ") %>% cat("c(",.,")", "  \n", sep="") }
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## env1\$path\$CurrentSource.path.filename.ext ====  
# *** Caution) In Rstudio Notebook, the path of the running Rmd file is set as the working directory~!!!
# env1$path$CurrentSource.path.filename.ext = rstudioapi::getSourceEditorContext()$path |> normalizePath(winslash="/") |> str_replace(fixed(getwd()|>normalizePath(winslash="/")), "") |> str_replace("^/", "")
env1$env.internal$f_path.CurrentSource.path.filename.ext(check_rstudioapi = TRUE, overwrite = TRUE)
if(!is.null(env1$path$CurrentSource.path)) env1$path$.path4write = .path4write = env1$path$CurrentSource.path
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# file.edit(paste0("[Working Files List] ",basename(getwd()),".r")); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext))
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) source -----  
### @ .subpath, .sourcename ======  




#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
library(tidyverse)
if (!requireNamespace("tinytex", quietly = TRUE)) {
  install.packages("tinytex")
}
library(tinytex)
# https://stackoverflow.com/questions/51468447/is-there-r-code-for-moving-the-focus-to-the-rstudio-console
# https://docs.posit.co/ide/server-pro/rstudio_ide_commands/rstudio_ide_commands.html
rstudioapi::executeCommand("activateConsole"); tinytex::install_tinytex(); rstudioapi::executeCommand("activateSource")
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ START) .tlmgr_installed_packages ----  
c(
  "fontspec",
  "xunicode",
  "xltxtra",
  "cm-unicode",
  "unicode-math",
  "roboto",
  "cascadia-code",
  "nanum-type1",
  "nanum-myeongjo",
  "nanum-gothic",
  "d2coding"
)

.tlmgr_installed_packages <- system2("tlmgr", args = c("info", "--list", "--only-installed"), stdout = TRUE)
.font_name = "roboto"; if(.tlmgr_installed_packages |> str_subset(.font_name) |> length() == 0) tinytex::tlmgr_install(.font_name)
.font_name = "cascadia-code"; if(.tlmgr_installed_packages |> str_subset(.font_name) |> length() == 0) tinytex::tlmgr_install(.font_name)

#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
.tlmgr_installed_packages <- tinytex::tlmgr(c('info', '--list', '--only-installed'), stdout = TRUE)
# tlmgr info --list --only-installed
.tlmgr_installed_packages |> str()
.tlmgr_installed_packages |> env1$f$f_vec.dput_line_by_line()

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## \$ .tlmgr_installed_packages.ASRockX300Ryzen5600G ====  
.tlmgr_installed_packages.ASRockX300Ryzen5600G = 
c("i amscls: AMS document classes for LaTeX",
  "i amsfonts: TeX fonts from the American Mathematical Society",
  "i amsmath: AMS mathematical facilities for LaTeX",
  "i atbegshi: Execute stuff at \\shipout time",
  "i atveryend: Hooks at the very end of a document",
  "i auxhook: Hooks for auxiliary files",
  "i babel: Multilingual support for LaTeX, LuaLaTeX, XeLaTeX, and Plain TeX",
  "i bibtex: Process bibliographies (bib files) for LaTeX or other formats",
  "i bibtex.windows: windows files of bibtex",
  "i bigintcalc: Integer calculations on very large numbers",
  "i bitset: Handle bit-vector datatype",
  "i bookmark: A new bookmark (outline) organization for hyperref",
  "i booktabs: Publication quality tables in LaTeX",
  "i cm: Computer Modern fonts",
  "i ctablestack: Catcode table stable support",
  "i dehyph: German hyphenation patterns for traditional orthography",
  "i dvipdfmx: An extended version of dvipdfm",
  "i dvipdfmx.windows: windows files of dvipdfmx",
  "i dvips: A DVI to PostScript driver",
  "i dvips.windows: windows files of dvips",
  "i ec: Computer modern fonts in T1 and TS1 encodings",
  "i epstopdf: Convert EPS to PDF using Ghostscript",
  "i epstopdf-pkg: Call epstopdf \"on the fly\"",
  "i epstopdf.windows: windows files of epstopdf",
  "i etex: An extended version of TeX, from the NTS project",
  "i etexcmds: Avoid name clashes with e-TeX commands",
  "i etoolbox: e-TeX tools for LaTeX",
  "i euenc: Unicode font encoding definitions for XeTeX",
  "i fancyvrb: Sophisticated verbatim text",
  "i filehook: Hooks for input files",
  "i firstaid: First aid for external LaTeX files and packages that need updating",
  "i float: Improved interface for floating objects",
  "i fontspec: Advanced font selection in XeLaTeX and LuaLaTeX",
  "i framed: Framed or shaded regions that can break across pages",
  "i geometry: Flexible and complete interface to document dimensions",
  "i gettitlestring: Clean up title references",
  "i glyphlist: Adobe Glyph List and TeX extensions",
  "i graphics: The LaTeX standard graphics bundle",
  "i graphics-cfg: Sample configuration files for LaTeX color and graphics",
  "i graphics-def: Colour and graphics option files",
  "i helvetic: URW 'Base 35' font pack for LaTeX",
  "i hycolor: Implements colour for packages hyperref and bookmark",
  "i hyperref: Extensive support for hypertext in LaTeX",
  "i hyph-utf8: Hyphenation patterns expressed in UTF-8",
  "i hyphen-base: core hyphenation support files",
  "i iftex: Am I running under pdfTeX, XeTeX or LuaTeX?",
  "i inconsolata: A monospaced font, with support files for use with TeX",
  "i infwarerr: Complete set of information/warning/error message macros",
  "i intcalc: Expandable arithmetic operations with integers",
  "i knuth-lib: Core TeX and Metafont sources from Knuth",
  "i kpathsea: Path searching library for TeX-related files",
  "i kpathsea.windows: windows files of kpathsea",
  "i kvdefinekeys: Define keys for use in the kvsetkeys package",
  "i kvoptions: Key value format for package options",
  "i kvsetkeys: Key value parser with default handler support",
  "i l3backend: LaTeX3 backend drivers",
  "i l3kernel: LaTeX3 programming conventions",
  "i l3packages: High-level LaTeX3 concepts",
  "i latex: A TeX macro package that defines LaTeX",
  "i latex-amsmath-dev: Development pre-release of the LaTeX amsmath bundle",
  "i latex-bin: LaTeX executables and man pages",
  "i latex-bin.windows: windows files of latex-bin",
  "i latex-fonts: A collection of fonts used in LaTeX distributions",
  "i latex-tools-dev: Development pre-release of the LaTeX tools bundle",
  "i latexconfig: configuration files for LaTeX-related formats",
  "i latexmk: Fully automated LaTeX document generation",
  "i latexmk.windows: windows files of latexmk",
  "i letltxmacro: Let assignment for LaTeX macros",
  "i lm: Latin modern fonts in outline formats",
  "i lm-math: OpenType maths fonts for Latin Modern",
  "i ltxcmds: Some LaTeX kernel commands for general use",
  "i lua-alt-getopt: Process application arguments the same way as getopt_long",
  "i lua-uni-algos: Unicode algorithms for LuaTeX",
  "i luahbtex: LuaTeX with HarfBuzz library for glyph shaping",
  "i luahbtex.windows: windows files of luahbtex",
  "i lualatex-math: Fixes for mathematics-related LuaLaTeX issues",
  "i lualibs: Additional Lua functions for LuaTeX macro programmers",
  "i luaotfload: OpenType 'loader' for Plain TeX and LaTeX",
  "i luaotfload.windows: windows files of luaotfload",
  "i luatex: The LuaTeX engine",
  "i luatex.windows: windows files of luatex",
  "i luatexbase: Basic resource management for LuaTeX code",
  "i mdwtools: Miscellaneous tools by Mark Wooding",
  "i metafont: A system for specifying fonts",
  "i metafont.windows: windows files of metafont",
  "i mfware: Supporting tools for use with Metafont",
  "i mfware.windows: windows files of mfware",
  "i modes: A collection of Metafont mode_def's",
  "i natbib: Flexible bibliography support",
  "i pdfescape: Implements pdfTeX's escape features using TeX or e-TeX",
  "i pdftex: A TeX extension for direct creation of PDF",
  "i pdftex.windows: windows files of pdftex",
  "i pdftexcmds: LuaTeX support for pdfTeX utility functions",
  "i plain: The Plain TeX format",
  "i psnfss: Font support for common PostScript fonts",
  "i refcount: Counter operations with label references",
  "i rerunfilecheck: Checksum based rerun checks on auxiliary files",
  "i scheme-infraonly: infrastructure-only scheme (no TeX at all)",
  "i selnolig: Selectively disable typographic ligatures",
  "i stringenc: Converting a string between different encodings",
  "i symbol: URW 'Base 35' font pack for LaTeX",
  "i tex: A sophisticated typesetting engine",
  "i tex-ini-files: Model TeX format creation files",
  "i tex.windows: windows files of tex",
  "i texlive-scripts: TeX Live infrastructure programs",
  "i texlive-scripts.windows: windows files of texlive-scripts",
  "i texlive.infra: basic TeX Live infrastructure",
  "i texlive.infra.windows: windows files of texlive.infra",
  "i times: URW 'Base 35' font pack for LaTeX",
  "i tipa: Fonts and macros for IPA phonetics characters",
  "i tlgpg: gpg for TeX Live",
  "i tlgpg.windows: windows files of tlgpg",
  "i tlgs.windows: Freely available PostScript interpreter",
  "i tlperl.windows: internal Perl for Windows",
  "i tools: The LaTeX standard tools bundle",
  "i unicode-data: Unicode data and loaders for TeX",
  "i unicode-math: Unicode mathematics support for XeTeX and LuaTeX",
  "i uniquecounter: Provides unlimited unique counter",
  "i url: Verbatim with URL-sensitive line breaks",
  "i xcolor: Driver-independent color extensions for LaTeX and pdfLaTeX",
  "i xetex: An extended variant of TeX for use with Unicode sources",
  "i xetex.windows: windows files of xetex",
  "i xetexconfig: crop.cfg for XeLaTeX",
  "i xkeyval: Extension of the keyval package",
  "i xunicode: Generate Unicode characters from accented glyphs",
  "i zapfding: URW 'Base 35' font pack for LaTeX")
.tlmgr_installed_packages.ASRockX300Ryzen5600G |> all.equal(.tlmgr_installed_packages)
.tlmgr_installed_packages.ASRockX300Ryzen5600G |> str()  ### ----
### > .tlmgr_installed_packages.ASRockX300Ryzen5600G %>% str  ### ----  
#  chr [1:126] "i amscls: AMS document classes for LaTeX" "i amsfonts: TeX fonts from the American Mathematical Society" "i amsmath: AMS mathematical facilities for LaTeX" ...
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
## \$ .tlmgr_installed_packages.MAGB760M13700KF ====  
.tlmgr_installed_packages.MAGB760M13700KF = 
c("i amscls: AMS document classes for LaTeX",
  "i amsfonts: TeX fonts from the American Mathematical Society",
  "i amsmath: AMS mathematical facilities for LaTeX",
  "i arphic: Arphic (Chinese) font packages",
  "i atbegshi: Execute stuff at \\shipout time",
  "i atveryend: Hooks at the very end of a document",
  "i auxhook: Hooks for auxiliary files",
  "i babel: Multilingual support for LaTeX, LuaLaTeX, XeLaTeX, and Plain TeX",
  "i bibtex: Process bibliographies (bib files) for LaTeX or other formats",
  "i bibtex.windows: windows files of bibtex",
  "i bigintcalc: Integer calculations on very large numbers",
  "i bitset: Handle bit-vector datatype",
  "i bookmark: A new bookmark (outline) organization for hyperref",
  "i booktabs: Publication quality tables in LaTeX",
  "i cascadia-code: The Cascadia Code font with support for LaTeX and pdfLaTeX",
  "i cjk: CJK language support",
  "i cjk-ko: Extension of the CJK package for Korean typesetting",
  "i cm: Computer Modern fonts",
  "i cns: Chinese/Japanese/Korean bitmap fonts",
  "i ctablestack: Catcode table stable support",
  "i dehyph: German hyphenation patterns for traditional orthography",
  "i dvipdfmx: An extended version of dvipdfm",
  "i dvipdfmx.windows: windows files of dvipdfmx",
  "i dvips: A DVI to PostScript driver",
  "i dvips.windows: windows files of dvips",
  "i ec: Computer modern fonts in T1 and TS1 encodings",
  "i epstopdf-pkg: Call epstopdf \"on the fly\"",
  "i etex: An extended version of TeX, from the NTS project",
  "i etexcmds: Avoid name clashes with e-TeX commands",
  "i etoolbox: e-TeX tools for LaTeX",
  "i euenc: Unicode font encoding definitions for XeTeX",
  "i fancyvrb: Sophisticated verbatim text",
  "i filehook: Hooks for input files",
  "i firstaid: First aid for external LaTeX files and packages that need updating",
  "i float: Improved interface for floating objects",
  "i fonts-tlwg: Thai fonts for LaTeX from TLWG",
  "i fontspec: Advanced font selection in XeLaTeX and LuaLaTeX",
  "i framed: Framed or shaded regions that can break across pages",
  "i garuda-c90: TeX support (from CJK) for the garuda font",
  "i geometry: Flexible and complete interface to document dimensions",
  "i gettitlestring: Clean up title references",
  "i glyphlist: Adobe Glyph List and TeX extensions",
  "i graphics: The LaTeX standard graphics bundle",
  "i graphics-cfg: Sample configuration files for LaTeX color and graphics",
  "i graphics-def: Colour and graphics option files",
  "i helvetic: URW 'Base 35' font pack for LaTeX",
  "i hycolor: Implements colour for packages hyperref and bookmark",
  "i hyperref: Extensive support for hypertext in LaTeX",
  "i hyph-utf8: Hyphenation patterns expressed in UTF-8",
  "i hyphen-base: core hyphenation support files",
  "i iftex: Am I running under pdfTeX, XeTeX or LuaTeX?",
  "i inconsolata: A monospaced font, with support files for use with TeX",
  "i infwarerr: Complete set of information/warning/error message macros",
  "i intcalc: Expandable arithmetic operations with integers",
  "i knuth-lib: Core TeX and Metafont sources from Knuth",
  "i koma-script: A bundle of versatile classes and packages",
  "i kpathsea: Path searching library for TeX-related files",
  "i kpathsea.windows: windows files of kpathsea",
  "i kvdefinekeys: Define keys for use in the kvsetkeys package",
  "i kvoptions: Key value format for package options",
  "i kvsetkeys: Key value parser with default handler support",
  "i l3backend: LaTeX3 backend drivers",
  "i l3kernel: LaTeX3 programming conventions",
  "i l3packages: High-level LaTeX3 concepts",
  "i latex: A TeX macro package that defines LaTeX",
  "i latex-amsmath-dev: Development pre-release of the LaTeX amsmath bundle",
  "i latex-bin: LaTeX executables and man pages",
  "i latex-bin.windows: windows files of latex-bin",
  "i latex-fonts: A collection of fonts used in LaTeX distributions",
  "i latex-tools-dev: Development pre-release of the LaTeX tools bundle",
  "i latexconfig: configuration files for LaTeX-related formats",
  "i latexmk: Fully automated LaTeX document generation",
  "i latexmk.windows: windows files of latexmk",
  "i letltxmacro: Let assignment for LaTeX macros",
  "i lm: Latin modern fonts in outline formats",
  "i lm-math: OpenType maths fonts for Latin Modern",
  "i ltxcmds: Some LaTeX kernel commands for general use",
  "i lua-alt-getopt: Process application arguments the same way as getopt_long",
  "i lua-uni-algos: Unicode algorithms for LuaTeX",
  "i luahbtex: LuaTeX with HarfBuzz library for glyph shaping",
  "i luahbtex.windows: windows files of luahbtex",
  "i lualatex-math: Fixes for mathematics-related LuaLaTeX issues",
  "i lualibs: Additional Lua functions for LuaTeX macro programmers",
  "i luaotfload: OpenType 'loader' for Plain TeX and LaTeX",
  "i luaotfload.windows: windows files of luaotfload",
  "i luatex: The LuaTeX engine",
  "i luatex.windows: windows files of luatex",
  "i luatexbase: Basic resource management for LuaTeX code",
  "i mdwtools: Miscellaneous tools by Mark Wooding",
  "i metafont: A system for specifying fonts",
  "i metafont.windows: windows files of metafont",
  "i mfware: Supporting tools for use with Metafont",
  "i mfware.windows: windows files of mfware",
  "i modes: A collection of Metafont mode_def's",
  "i natbib: Flexible bibliography support",
  "i norasi-c90: TeX support (from CJK) for the norasi font",
  "i pdfescape: Implements pdfTeX's escape features using TeX or e-TeX",
  "i pdftex: A TeX extension for direct creation of PDF",
  "i pdftex.windows: windows files of pdftex",
  "i pdftexcmds: LuaTeX support for pdfTeX utility functions",
  "i plain: The Plain TeX format",
  "i psnfss: Font support for common PostScript fonts",
  "i refcount: Counter operations with label references",
  "i rerunfilecheck: Checksum based rerun checks on auxiliary files",
  "i roboto: Support for the Roboto family of fonts",
  "i scheme-infraonly: infrastructure-only scheme (no TeX at all)",
  "i selnolig: Selectively disable typographic ligatures",
  "i stringenc: Converting a string between different encodings",
  "i symbol: URW 'Base 35' font pack for LaTeX",
  "i tex: A sophisticated typesetting engine",
  "i tex-ini-files: Model TeX format creation files",
  "i tex.windows: windows files of tex",
  "i texlive-scripts: TeX Live infrastructure programs",
  "i texlive-scripts.windows: windows files of texlive-scripts",
  "i texlive.infra: basic TeX Live infrastructure",
  "i texlive.infra.windows: windows files of texlive.infra",
  "i times: URW 'Base 35' font pack for LaTeX",
  "i tipa: Fonts and macros for IPA phonetics characters",
  "i tlgpg: gpg for TeX Live",
  "i tlgpg.windows: windows files of tlgpg",
  "i tlgs.windows: Freely available PostScript interpreter",
  "i tlperl.windows: internal Perl for Windows",
  "i tools: The LaTeX standard tools bundle",
  "i uhc: Fonts for the Korean language",
  "i unicode-data: Unicode data and loaders for TeX",
  "i unicode-math: Unicode mathematics support for XeTeX and LuaTeX",
  "i uniquecounter: Provides unlimited unique counter",
  "i url: Verbatim with URL-sensitive line breaks",
  "i wadalab: Wadalab (Japanese) font packages",
  "i xcolor: Driver-independent color extensions for LaTeX and pdfLaTeX",
  "i xetex: An extended variant of TeX for use with Unicode sources",
  "i xetex.windows: windows files of xetex",
  "i xetexconfig: crop.cfg for XeLaTeX",
  "i xetexko: Typeset Korean with Xe(La)TeX",
  "i xkeyval: Extension of the keyval package",
  "i xpatch: Extending etoolbox patching commands",
  "i xunicode: Generate Unicode characters from accented glyphs",
  "i zapfding: URW 'Base 35' font pack for LaTeX")
.tlmgr_installed_packages.MAGB760M13700KF |> all.equal(.tlmgr_installed_packages)
.tlmgr_installed_packages.MAGB760M13700KF |> str()  ###----
.tlmgr_installed_packages.MAGB760M13700KF |> env1$f$f_vec1_vec2.setdiff(.tlmgr_installed_packages.ASRockX300Ryzen5600G) |> str()  ### ----
### > .tlmgr_installed_packages.MAGB760M13700KF %>% str  ###----  
#  chr [1:138] "i amscls: AMS document classes for LaTeX" "i amsfonts: TeX fonts from the American Mathematical Society" "i amsmath: AMS mathematical facilities for LaTeX" ...
### > .tlmgr_installed_packages.MAGB760M13700KF |> env1$f$f_vec1_vec2.setdiff(.tlmgr_installed_packages.ASRockX300Ryzen5600G) |> str()  ### ----  
# List of 7
#  $ vec1.character: chr [1:138] "i amscls: AMS document classes for LaTeX" "i amsfonts: TeX fonts from the American Mathematical Society" "i amsmath: AMS mathematical facilities for LaTeX" "i arphic: Arphic (Chinese) font packages" ...
#  $ vec2.character: chr [1:126] "i amscls: AMS document classes for LaTeX" "i amsfonts: TeX fonts from the American Mathematical Society" "i amsmath: AMS mathematical facilities for LaTeX" "i atbegshi: Execute stuff at \\shipout time" ...
#  $ union         : chr [1:140] "i amscls: AMS document classes for LaTeX" "i amsfonts: TeX fonts from the American Mathematical Society" "i amsmath: AMS mathematical facilities for LaTeX" "i arphic: Arphic (Chinese) font packages" ...
#  $ intersect     : chr [1:124] "i amscls: AMS document classes for LaTeX" "i amsfonts: TeX fonts from the American Mathematical Society" "i amsmath: AMS mathematical facilities for LaTeX" "i atbegshi: Execute stuff at \\shipout time" ...
#  $ setdiff_1_2   : chr [1:14] "i arphic: Arphic (Chinese) font packages" "i cascadia-code: The Cascadia Code font with support for LaTeX and pdfLaTeX" "i cjk: CJK language support" "i cjk-ko: Extension of the CJK package for Korean typesetting" ...
#  $ setdiff_2_1   : chr [1:2] "i epstopdf: Convert EPS to PDF using Ghostscript" "i epstopdf.windows: windows files of epstopdf"
#  $ identical     : chr [1:2] "Lengths (138, 126) differ (string compare on first 126)" "123 string mismatches"

.tlmgr_installed_packages.MAGB760M13700KF |> setdiff(.tlmgr_installed_packages.ASRockX300Ryzen5600G) |> env1$f$f_vec.dput_line_by_line()
c("i arphic: Arphic (Chinese) font packages",
  "i cascadia-code: The Cascadia Code font with support for LaTeX and pdfLaTeX",
  "i cjk: CJK language support",
  "i cjk-ko: Extension of the CJK package for Korean typesetting",
  "i cns: Chinese/Japanese/Korean bitmap fonts",
  "i fonts-tlwg: Thai fonts for LaTeX from TLWG",
  "i garuda-c90: TeX support (from CJK) for the garuda font",
  "i koma-script: A bundle of versatile classes and packages",
  "i norasi-c90: TeX support (from CJK) for the norasi font",
  "i roboto: Support for the Roboto family of fonts",
  "i uhc: Fonts for the Korean language",
  "i wadalab: Wadalab (Japanese) font packages",
  "i xetexko: Typeset Korean with Xe(La)TeX",
  "i xpatch: Extending etoolbox patching commands")


## \$ .tlmgr_installed_packages.RockerVerse ====  
.tlmgr_installed_packages.RockerVerse = c("i ae: Virtual fonts for T1 encoded CMR-fonts",
  "i amsfonts: TeX fonts from the American Mathematical Society",
  "i amsmath: AMS mathematical facilities for LaTeX",
  "i atbegshi: Execute stuff at \\shipout time",
  "i atveryend: Hooks at the very end of a document",
  "i auxhook: Hooks for auxiliary files",
  "i babel: Multilingual support for LaTeX, LuaLaTeX, XeLaTeX, and Plain TeX",
  "i bibtex: Process bibliographies (bib files) for LaTeX or other formats",
  "i bibtex.x86_64-linux: x86_64-linux files of bibtex",
  "i bigintcalc: Integer calculations on very large numbers",
  "i bitset: Handle bit-vector datatype",
  "i bookmark: A new bookmark (outline) organization for hyperref",
  "i cm: Computer Modern fonts",
  "i context: The ConTeXt macro package",
  "i context-companion-fonts: companion fonts with fixes for ConTeXt",
  "i context-texlive: TL-specific helpers for ConTeXt (caches, papersize)",
  "i context-texlive.x86_64-linux: x86_64-linux files of context-texlive",
  "i context.x86_64-linux: x86_64-linux files of context",
  "i dehyph: German hyphenation patterns for traditional orthography",
  "i dvipdfmx: An extended version of dvipdfm",
  "i dvipdfmx.x86_64-linux: x86_64-linux files of dvipdfmx",
  "i ec: Computer modern fonts in T1 and TS1 encodings",
  "i epstopdf-pkg: Call epstopdf \"on the fly\"",
  "i etex: An extended version of TeX, from the NTS project",
  "i etexcmds: Avoid name clashes with e-TeX commands",
  "i etoolbox: e-TeX tools for LaTeX",
  "i fancyvrb: Sophisticated verbatim text",
  "i firstaid: First aid for external LaTeX files and packages that need updating",
  "i framed: Framed or shaded regions that can break across pages",
  "i geometry: Flexible and complete interface to document dimensions",
  "i gettitlestring: Clean up title references",
  "i glyphlist: Adobe Glyph List and TeX extensions",
  "i graphics: The LaTeX standard graphics bundle",
  "i graphics-cfg: Sample configuration files for LaTeX color and graphics",
  "i graphics-def: Colour and graphics option files",
  "i hycolor: Implements colour for packages hyperref and bookmark",
  "i hyperref: Extensive support for hypertext in LaTeX",
  "i hyph-utf8: Hyphenation patterns expressed in UTF-8",
  "i hyphen-base: core hyphenation support files",
  "i iftex: Am I running under pdfTeX, XeTeX or LuaTeX?",
  "i inconsolata: A monospaced font, with support files for use with TeX",
  "i infwarerr: Complete set of information/warning/error message macros",
  "i intcalc: Expandable arithmetic operations with integers",
  "i knuth-lib: Core TeX and Metafont sources from Knuth",
  "i koma-script: A bundle of versatile classes and packages",
  "i kpathsea: Path searching library for TeX-related files",
  "i kpathsea.x86_64-linux: x86_64-linux files of kpathsea",
  "i kvdefinekeys: Define keys for use in the kvsetkeys package",
  "i kvoptions: Key value format for package options",
  "i kvsetkeys: Key value parser with default handler support",
  "i l3backend: LaTeX3 backend drivers",
  "i l3kernel: LaTeX3 programming conventions",
  "i latex: A TeX macro package that defines LaTeX",
  "i latex-bin: LaTeX executables and man pages",
  "i latex-bin.x86_64-linux: x86_64-linux files of latex-bin",
  "i latex-fonts: A collection of fonts used in LaTeX distributions",
  "i latexconfig: configuration files for LaTeX-related formats",
  "i letltxmacro: Let assignment for LaTeX macros",
  "i listings: Typeset source code listings using LaTeX",
  "i lm: Latin modern fonts in outline formats",
  "i lm-math: OpenType maths fonts for Latin Modern",
  "i ltxcmds: Some LaTeX kernel commands for general use",
  "i lua-alt-getopt: Process application arguments the same way as getopt_long",
  "i lua-uni-algos: Unicode algorithms for LuaTeX",
  "i luahbtex: LuaTeX with HarfBuzz library for glyph shaping",
  "i luahbtex.x86_64-linux: x86_64-linux files of luahbtex",
  "i luajittex: LuaTeX with just-in-time (jit) compiler, with and without HarfBuzz",
  "i luajittex.x86_64-linux: x86_64-linux files of luajittex",
  "i lualibs: Additional Lua functions for LuaTeX macro programmers",
  "i luaotfload: OpenType 'loader' for Plain TeX and LaTeX",
  "i luaotfload.x86_64-linux: x86_64-linux files of luaotfload",
  "i luatex: The LuaTeX engine",
  "i luatex.x86_64-linux: x86_64-linux files of luatex",
  "i makeindex: Makeindex development sources",
  "i makeindex.x86_64-linux: x86_64-linux files of makeindex",
  "i manfnt-font: Knuth's \"manual\" fonts",
  "i mdwtools: Miscellaneous tools by Mark Wooding",
  "i metafont: A system for specifying fonts",
  "i metafont.x86_64-linux: x86_64-linux files of metafont",
  "i mflogo-font: Metafont logo font",
  "i mfware: Supporting tools for use with Metafont",
  "i mfware.x86_64-linux: x86_64-linux files of mfware",
  "i modes: A collection of Metafont mode_def's",
  "i parskip: Layout with zero \\parindent, non-zero \\parskip",
  "i pdfcrop: Crop PDF graphics",
  "i pdfcrop.x86_64-linux: x86_64-linux files of pdfcrop",
  "i pdfescape: Implements pdfTeX's escape features using TeX or e-TeX",
  "i pdftex: A TeX extension for direct creation of PDF",
  "i pdftex.x86_64-linux: x86_64-linux files of pdftex",
  "i pdftexcmds: LuaTeX support for pdfTeX utility functions",
  "i plain: The Plain TeX format",
  "i refcount: Counter operations with label references",
  "i rerunfilecheck: Checksum based rerun checks on auxiliary files",
  "i scheme-infraonly: infrastructure-only scheme (no TeX at all)",
  "i stmaryrd: St Mary Road symbols for theoretical computer science",
  "i stringenc: Converting a string between different encodings",
  "i tex: A sophisticated typesetting engine",
  "i tex-ini-files: Model TeX format creation files",
  "i tex.x86_64-linux: x86_64-linux files of tex",
  "i texlive-scripts: TeX Live infrastructure programs",
  "i texlive-scripts.x86_64-linux: x86_64-linux files of texlive-scripts",
  "i texlive.infra: basic TeX Live infrastructure",
  "i texlive.infra.x86_64-linux: x86_64-linux files of texlive.infra",
  "i tikzfill: TikZ libraries for filling with images and patterns",
  "i tools: The LaTeX standard tools bundle",
  "i unicode-data: Unicode data and loaders for TeX",
  "i uniquecounter: Provides unlimited unique counter",
  "i url: Verbatim with URL-sensitive line breaks",
  "i xcolor: Driver-independent color extensions for LaTeX and pdfLaTeX",
  "i xetex: An extended variant of TeX for use with Unicode sources",
  "i xetex.x86_64-linux: x86_64-linux files of xetex",
  "i xetexconfig: crop.cfg for XeLaTeX",
  "i xkeyval: Extension of the keyval package",
  "i xpatch: Extending etoolbox patching commands",
  "i zapfding: URW 'Base 35' font pack for LaTeX")
.tlmgr_installed_packages.RockerVerse |> all.equal(.tlmgr_installed_packages)
.tlmgr_installed_packages.RockerVerse |> str()  ###----
.tlmgr_installed_packages.RockerVerse |> env1$f$f_vec1_vec2.setdiff(.tlmgr_installed_packages.ASRockX300Ryzen5600G) |> str()  ### ----
### > .tlmgr_installed_packages.RockerVerse |> str()  ###----  
#  chr [1:115] "i ae: Virtual fonts for T1 encoded CMR-fonts" "i amsfonts: TeX fonts from the American Mathematical Society" "i amsmath: AMS mathematical facilities for LaTeX" ...
### > .tlmgr_installed_packages.RockerVerse |> env1$f$f_vec1_vec2.setdiff(.tlmgr_installed_packages.ASRockX300Ryzen5600G) |> str()  ### ----  
# List of 7
#  $ vec1.character: chr [1:115] "i ae: Virtual fonts for T1 encoded CMR-fonts" "i amsfonts: TeX fonts from the American Mathematical Society" "i amsmath: AMS mathematical facilities for LaTeX" "i atbegshi: Execute stuff at \\shipout time" ...
#  $ vec2.character: chr [1:126] "i amscls: AMS document classes for LaTeX" "i amsfonts: TeX fonts from the American Mathematical Society" "i amsmath: AMS mathematical facilities for LaTeX" "i atbegshi: Execute stuff at \\shipout time" ...
#  $ union         : chr [1:160] "i ae: Virtual fonts for T1 encoded CMR-fonts" "i amsfonts: TeX fonts from the American Mathematical Society" "i amsmath: AMS mathematical facilities for LaTeX" "i atbegshi: Execute stuff at \\shipout time" ...
#  $ intersect     : chr [1:81] "i amsfonts: TeX fonts from the American Mathematical Society" "i amsmath: AMS mathematical facilities for LaTeX" "i atbegshi: Execute stuff at \\shipout time" "i atveryend: Hooks at the very end of a document" ...
#  $ setdiff_1_2   : chr [1:34] "i ae: Virtual fonts for T1 encoded CMR-fonts" "i bibtex.x86_64-linux: x86_64-linux files of bibtex" "i context: The ConTeXt macro package" "i context-companion-fonts: companion fonts with fixes for ConTeXt" ...
#  $ setdiff_2_1   : chr [1:45] "i amscls: AMS document classes for LaTeX" "i bibtex.windows: windows files of bibtex" "i booktabs: Publication quality tables in LaTeX" "i ctablestack: Catcode table stable support" ...
#  $ identical     : chr [1:2] "Lengths (115, 126) differ (string compare on first 115)" "104 string mismatches"


.tlmgr_installed_packages.RockerVerse |> setdiff(.tlmgr_installed_packages.ASRockX300Ryzen5600G) |> env1$f$f_vec.dput_line_by_line()
.tlmgr_installed_packages.ASRockX300Ryzen5600G |> setdiff(.tlmgr_installed_packages.RockerVerse) |> env1$f$f_vec.dput_line_by_line()
# > .tlmgr_installed_packages.RockerVerse |> setdiff(.tlmgr_installed_packages.ASRockX300Ryzen5600G) |> env1$f$f_vec.dput_line_by_line()
c("i ae: Virtual fonts for T1 encoded CMR-fonts",
  "i bibtex.x86_64-linux: x86_64-linux files of bibtex",
  "i context: The ConTeXt macro package",
  "i context-companion-fonts: companion fonts with fixes for ConTeXt",
  "i context-texlive: TL-specific helpers for ConTeXt (caches, papersize)",
  "i context-texlive.x86_64-linux: x86_64-linux files of context-texlive",
  "i context.x86_64-linux: x86_64-linux files of context",
  "i dvipdfmx.x86_64-linux: x86_64-linux files of dvipdfmx",
  "i koma-script: A bundle of versatile classes and packages",
  "i kpathsea.x86_64-linux: x86_64-linux files of kpathsea",
  "i latex-bin.x86_64-linux: x86_64-linux files of latex-bin",
  "i listings: Typeset source code listings using LaTeX",
  "i luahbtex.x86_64-linux: x86_64-linux files of luahbtex",
  "i luajittex: LuaTeX with just-in-time (jit) compiler, with and without HarfBuzz",
  "i luajittex.x86_64-linux: x86_64-linux files of luajittex",
  "i luaotfload.x86_64-linux: x86_64-linux files of luaotfload",
  "i luatex.x86_64-linux: x86_64-linux files of luatex",
  "i makeindex: Makeindex development sources",
  "i makeindex.x86_64-linux: x86_64-linux files of makeindex",
  "i manfnt-font: Knuth's \"manual\" fonts",
  "i metafont.x86_64-linux: x86_64-linux files of metafont",
  "i mflogo-font: Metafont logo font",
  "i mfware.x86_64-linux: x86_64-linux files of mfware",
  "i parskip: Layout with zero \\parindent, non-zero \\parskip",
  "i pdfcrop: Crop PDF graphics",
  "i pdfcrop.x86_64-linux: x86_64-linux files of pdfcrop",
  "i pdftex.x86_64-linux: x86_64-linux files of pdftex",
  "i stmaryrd: St Mary Road symbols for theoretical computer science",
  "i tex.x86_64-linux: x86_64-linux files of tex",
  "i texlive-scripts.x86_64-linux: x86_64-linux files of texlive-scripts",
  "i texlive.infra.x86_64-linux: x86_64-linux files of texlive.infra",
  "i tikzfill: TikZ libraries for filling with images and patterns",
  "i xetex.x86_64-linux: x86_64-linux files of xetex",
  "i xpatch: Extending etoolbox patching commands")
# > .tlmgr_installed_packages.ASRockX300Ryzen5600G |> setdiff(.tlmgr_installed_packages.RockerVerse) |> env1$f$f_vec.dput_line_by_line()
c("i amscls: AMS document classes for LaTeX",
  "i bibtex.windows: windows files of bibtex",
  "i booktabs: Publication quality tables in LaTeX",
  "i ctablestack: Catcode table stable support",
  "i dvipdfmx.windows: windows files of dvipdfmx",
  "i dvips: A DVI to PostScript driver",
  "i dvips.windows: windows files of dvips",
  "i epstopdf: Convert EPS to PDF using Ghostscript",
  "i epstopdf.windows: windows files of epstopdf",
  "i euenc: Unicode font encoding definitions for XeTeX",
  "i filehook: Hooks for input files",
  "i float: Improved interface for floating objects",
  "i fontspec: Advanced font selection in XeLaTeX and LuaLaTeX",
  "i helvetic: URW 'Base 35' font pack for LaTeX",
  "i kpathsea.windows: windows files of kpathsea",
  "i l3packages: High-level LaTeX3 concepts",
  "i latex-amsmath-dev: Development pre-release of the LaTeX amsmath bundle",
  "i latex-bin.windows: windows files of latex-bin",
  "i latex-tools-dev: Development pre-release of the LaTeX tools bundle",
  "i latexmk: Fully automated LaTeX document generation",
  "i latexmk.windows: windows files of latexmk",
  "i luahbtex.windows: windows files of luahbtex",
  "i lualatex-math: Fixes for mathematics-related LuaLaTeX issues",
  "i luaotfload.windows: windows files of luaotfload",
  "i luatex.windows: windows files of luatex",
  "i luatexbase: Basic resource management for LuaTeX code",
  "i metafont.windows: windows files of metafont",
  "i mfware.windows: windows files of mfware",
  "i natbib: Flexible bibliography support",
  "i pdftex.windows: windows files of pdftex",
  "i psnfss: Font support for common PostScript fonts",
  "i selnolig: Selectively disable typographic ligatures",
  "i symbol: URW 'Base 35' font pack for LaTeX",
  "i tex.windows: windows files of tex",
  "i texlive-scripts.windows: windows files of texlive-scripts",
  "i texlive.infra.windows: windows files of texlive.infra",
  "i times: URW 'Base 35' font pack for LaTeX",
  "i tipa: Fonts and macros for IPA phonetics characters",
  "i tlgpg: gpg for TeX Live",
  "i tlgpg.windows: windows files of tlgpg",
  "i tlgs.windows: Freely available PostScript interpreter",
  "i tlperl.windows: internal Perl for Windows",
  "i unicode-math: Unicode mathematics support for XeTeX and LuaTeX",
  "i xetex.windows: windows files of xetex",
  "i xunicode: Generate Unicode characters from accented glyphs")


#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
# @@ END -----  
# paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/blob/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
# paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') |> system(intern=TRUE)
paste0("https://github.com/mkim0710/",basename(getwd()),"/commits/main/",env1$path$CurrentSource.path.filename.ext) %>% paste0('"C:/Program Files (x86)/Microsoft/Edge/Application/msedge_proxy.exe" --app="',.,'"') %>% paste0("'",.,"' |> system(intern=TRUE)") |> cat("  \n", sep="")
cat("* To revert to the last commited file, run the following terminal command:  \n")
paste0( "git checkout -- ",shQuote(rstudioapi::getSourceEditorContext()$path) ) |> deparse() |> cat(" |> system(intern=TRUE)  \n", sep="")
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
#|________________________________________________________________________________|#  
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


