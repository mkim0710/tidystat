# install fonts.r


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
#|#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# *** You do not need to use sudo apt install to install LaTeX packages system-wide via your operating system's package manager. ***
# @ tinytex::tlmgr_search ----
tinytex::tlmgr_search("kotex") #----
tinytex::tlmgr_search("Cascadia") #----
tinytex::tlmgr_search("helvet") #----
tinytex::tlmgr_search("HCR") #----
tinytex::tlmgr_search("nanum") #----
tinytex::tlmgr_search("D2coding") #----
tinytex::tlmgr_search("d2coding") #----
# > tinytex::tlmgr_search("kotex") #----
# tlmgr search --file --global 'kotex'
# tlmgr: package repository https://www.texlive.info/tlnet-archive/2024/04/23/tlnet (not verified: gpg unavailable)
# 00texlive.image:
# 	tlpkg/tlpsrc/kotex-utf.tlpsrc
# 	tlpkg/tlpsrc/kotex-oblivoir.tlpsrc
# 	tlpkg/tlpsrc/kotex-utils.tlpsrc
# 	tlpkg/tlpsrc/kotex-plain.tlpsrc
# cjk-ko:
# 	texmf-dist/tex/latex/cjk-ko/kotex.sty
# kotex-oblivoir:
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-common/fapapersize.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/oblivoir-utf.cls
# 	texmf-dist/doc/latex/kotex-oblivoir/ob-mathleading-doc.pdf
# 	texmf-dist/doc/latex/kotex-oblivoir/obsideparas.tex
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-ucs/hfontsel.sty
# 	texmf-dist/doc/latex/kotex-oblivoir/oblivoir-test.tex
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-x/memucs-interword-x.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-ucs/nanumfontsel.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-x/xob-font.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-x/ob-mathleading.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-common/memucs-setspace.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-common/ob-nokoreanappendix.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-ucs/memhangul-ucs.sty
# 	texmf-dist/doc/latex/kotex-oblivoir/obchaptertoc-doc.pdf
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-ucs/memucs-interword.sty
# 	texmf-dist/doc/latex/kotex-oblivoir/chapstyfig.pdf
# 	texmf-dist/doc/latex/kotex-oblivoir/obsideparas.pdf
# 	texmf-dist/doc/latex/kotex-oblivoir/oblivoir-simpledoc.pdf
# 	texmf-dist/tex/latex/kotex-oblivoir/oblivoir-xl.cls
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-x/xob-paralist.sty
# 	texmf-dist/doc/latex/kotex-oblivoir/obchapterstyles-doc.tex
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-x/ob-unfontsdefault.sty
# 	texmf-dist/doc/latex/kotex-oblivoir/ob-mathleading-doc.tex
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-common/10_5.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-common/obchapterstyles.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-common/memucs-enumerate.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-x/xob-lwarp.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-x/xob-amssymb.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-common/memhangul-common.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/xoblivoir.cls
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-x/xetexko-var.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-common/ob-toclof.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/oblivoir.cls
# 	texmf-dist/doc/latex/kotex-oblivoir/README
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-common/ob-koreanappendix.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-x/xob-dotemph.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-ucs/hfontspec.nanum
# 	texmf-dist/doc/latex/kotex-oblivoir/obchaptertoc-doc.tex
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-common/memhangul-patch.sty
# 	texmf-dist/doc/latex/kotex-oblivoir/ChangeLog
# 	texmf-dist/doc/latex/kotex-oblivoir/obchapterstyles-doc.pdf
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-common/oblivoir-misc.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-common/obchaptertoc.sty
# 	texmf-dist/doc/latex/kotex-oblivoir/oblivoir-simpledoc.tex
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-x/memhangul-x.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-ucs/memucs-gremph.sty
# 	texmf-dist/tex/latex/kotex-oblivoir/memhangul-x/xob-hyper.sty
# kotex-plain:
# 	texmf-dist/doc/plain/kotex-plain/ChangeLog
# 	texmf-dist/tex/plain/kotex-plain/kotexplain.tex
# 	texmf-dist/tex/plain/kotex-plain/hangulcweb.tex
# 	texmf-dist/tex/plain/kotex-plain/kotexutf-core.tex
# 	texmf-dist/doc/plain/kotex-plain/README
# 	texmf-dist/tex/plain/kotex-plain/kotexutf.tex
# kotex-utf:
# 	texmf-dist/doc/latex/kotex-utf/fig/fntnormal.pdf
# 	texmf-dist/tex/latex/kotex-utf/contrib/dhucs-sectsty.sty
# 	texmf-dist/tex/latex/kotex-utf/contrib/kotex-logo.sty
# 	texmf-dist/doc/latex/kotex-utf/fig/histkotex.jpg
# 	texmf-dist/tex/latex/kotex-utf/tex4ht/dhucs.cfg
# 	texmf-dist/tex/latex/kotex-utf/contrib/dhucs-gremph.sty
# 	texmf-dist/doc/latex/kotex-utf/kotex-utf-doc.pdf
# 	texmf-dist/tex/latex/kotex-utf/kosections-utf.sty
# 	texmf-dist/tex/latex/kotex-utf/dhucs.sty
# 	texmf-dist/tex/latex/kotex-utf/contrib/dhucsfn.sty
# 	texmf-dist/doc/latex/kotex-utf/kotex-doc.tex
# 	texmf-dist/doc/latex/kotex-utf/kotex-utf-doc.tex
# 	texmf-dist/doc/latex/kotex-utf/README
# 	texmf-dist/doc/latex/kotex-utf/fig/testdhucsallowbreak.pdf
# 	texmf-dist/tex/latex/kotex-utf/dhucs-nanumfont.sty
# 	texmf-dist/tex/latex/kotex-utf/kotex.cfg
# 	texmf-dist/doc/latex/kotex-utf/fig/yettext.pdf
# 	texmf-dist/tex/latex/kotex-utf/tex4ht/dhucs.4ht
# 	texmf-dist/tex/latex/kotex-utf/kotexutf.sty
# 	texmf-dist/tex/latex/kotex-utf/contrib/dhucs-trivcj.sty
# 	texmf-dist/tex/latex/kotex-utf/contrib/dhucs-setspace.sty
# 	texmf-dist/doc/latex/kotex-utf/fig/linebreaktest.pdf
# 	texmf-dist/tex/latex/kotex-utf/hfontspec.default
# 	texmf-dist/doc/latex/kotex-utf/sample-finemath-setup.tex
# 	texmf-dist/tex/latex/kotex-utf/contrib/dhucs-ucshyper.sty
# 	texmf-dist/tex/latex/kotex-utf/contrib/dhucs-paralist.sty
# 	texmf-dist/tex/latex/kotex-utf/tex4ht/kosections-utf.4ht
# 	texmf-dist/doc/latex/kotex-utf/ChangeLog
# 	texmf-dist/doc/latex/kotex-utf/kotex-doc.pdf
# 	texmf-dist/doc/latex/kotex-utf/fig/fntexp.pdf
# 	texmf-dist/tex/latex/kotex-utf/contrib/kotex-varioref.sty
# 	texmf-dist/tex/latex/kotex-utf/kotex-sections.sty
# 	texmf-dist/doc/latex/kotex-utf/fig/allowbreak-dhucs.pdf
# 	texmf-dist/tex/latex/kotex-utf/contrib/dhucs-enumitem.sty
# 	texmf-dist/tex/latex/kotex-utf/lucuhcmj.fd
# 	texmf-dist/tex/latex/kotex-utf/contrib/dhucs-enumerate.sty
# 	texmf-dist/tex/latex/kotex-utf/lucenc.dfu
# 	texmf-dist/tex/latex/kotex-utf/contrib/dhucs-interword.sty
# 	texmf-dist/tex/latex/kotex-utf/contrib/dhucs-cmap.sty
# kotex-utils:
# 	texmf-dist/makeindex/kotex-utils/memucs-manual.ist
# 	texmf-dist/scripts/kotex-utils/komkindex.pl
# 	texmf-dist/scripts/kotex-utils/jamo-normalize.pl
# 	texmf-dist/makeindex/kotex-utils/kotex.ist
# 	texmf-dist/doc/latex/kotex-utils/utf8.xdy
# 	texmf-dist/doc/latex/kotex-utils/README
# 	texmf-dist/doc/latex/kotex-utils/utf8-lang.xdy
# 	texmf-dist/scripts/kotex-utils/ttf2kotexfont.pl
# 	texmf-dist/doc/latex/kotex-utils/ChangeLog
# kotex-utils.aarch64-linux:
# 	bin/aarch64-linux/ttf2kotexfont
# kotex-utils.amd64-freebsd:
# 	bin/amd64-freebsd/ttf2kotexfont
# kotex-utils.amd64-netbsd:
# 	bin/amd64-netbsd/ttf2kotexfont
# kotex-utils.armhf-linux:
# 	bin/armhf-linux/ttf2kotexfont
# kotex-utils.i386-freebsd:
# 	bin/i386-freebsd/ttf2kotexfont
# kotex-utils.i386-linux:
# 	bin/i386-linux/ttf2kotexfont
# kotex-utils.i386-netbsd:
# 	bin/i386-netbsd/ttf2kotexfont
# kotex-utils.i386-solaris:
# 	bin/i386-solaris/ttf2kotexfont
# kotex-utils.universal-darwin:
# 	bin/universal-darwin/ttf2kotexfont
# kotex-utils.windows:
# 	bin/windows/ttf2kotexfont.exe
# kotex-utils.x86_64-cygwin:
# 	bin/x86_64-cygwin/ttf2kotexfont
# kotex-utils.x86_64-darwinlegacy:
# 	bin/x86_64-darwinlegacy/ttf2kotexfont
# kotex-utils.x86_64-linux:
# 	bin/x86_64-linux/ttf2kotexfont
# kotex-utils.x86_64-linuxmusl:
# 	bin/x86_64-linuxmusl/ttf2kotexfont
# kotex-utils.x86_64-solaris:
# 	bin/x86_64-solaris/ttf2kotexfont
# > tinytex::tlmgr_search("Cascadia") #----
# tlmgr search --file --global 'Cascadia'
# tlmgr: package repository https://www.texlive.info/tlnet-archive/2024/04/23/tlnet (not verified: gpg unavailable)
# arara:
# 	texmf-dist/doc/support/arara/resources/CascadiaMono-Italic.otf
# 	texmf-dist/doc/support/arara/resources/CascadiaMono-ExtraLightItalic.otf
# 	texmf-dist/doc/support/arara/resources/CascadiaMono-Regular.otf
# 	texmf-dist/doc/support/arara/resources/CascadiaMono-LightItalic.otf
# 	texmf-dist/doc/support/arara/resources/CascadiaMono-Light.otf
# 	texmf-dist/doc/support/arara/resources/CascadiaMono-ExtraLight.otf
# cascadia-code:
# 	texmf-dist/tex/latex/cascadia-code/OT1CascadiaCode-Sup.fd
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-LightItalic-sup-t1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLight-sup-lgr.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBold-tlf-ts1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Italic-tlf-lgr.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-ExtraLight-sup-t1.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Light-sup-t1.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBold-tlf-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Regular-tlf-lgr--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Light-tlf-ly1.vf
# 	texmf-dist/fonts/type1/public/cascadia-code/CascadiaCode-Bold.pfb
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiLight-tlf-t1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLight-sup-lgr.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLight-tlf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-ot1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Light-sup-ot1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-LightItalic-sup-t1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Regular-sup-ly1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-BoldItalic-sup-t1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Bold-sup-lgr.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Light-sup-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLight-sup-lgr--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-LightItalic-tlf-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-t1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-LightItalic-sup-lgr.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-BoldItalic-tlf-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Light-tlf-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLight-sup-lgr--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiLightItalic-sup-t1.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-ExtraLightItalic-tlf-ts1.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-ExtraLight-tlf-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-LightItalic-tlf-ly1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-t1.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-BoldItalic-tlf-t1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-LightItalic-tlf-ts1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-BoldItalic-tlf-ts1--base.tfm
# 	texmf-dist/fonts/type1/public/cascadia-code/CascadiaCode-ExtraLight.pfb
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-ly1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLightItalic-tlf-lgr.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-BoldItalic-sup-ly1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Regular-sup-t1.vf
# 	texmf-dist/tex/latex/cascadia-code/LGRCascadiaCode-TLF.fd
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Light-tlf-ts1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Bold-tlf-lgr.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLightItalic-sup-ly1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Light-tlf-t1.tfm
# 	texmf-dist/fonts/opentype/public/cascadia-code/CascadiaCode-SemiBoldItalic.otf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLightItalic-tlf-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLightItalic-sup-ly1--base.tfm
# 	texmf-dist/fonts/map/dvips/cascadia-code/CascadiaCode.map
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-t1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Regular-sup-ly1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-ExtraLightItalic-sup-t1.vf
# 	texmf-dist/fonts/opentype/public/cascadia-code/CascadiaCode-Light.otf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Regular-tlf-ts1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLightItalic-sup-ly1--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-BoldItalic-sup-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Bold-sup-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Italic-sup-t1--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-ExtraLightItalic-tlf-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLightItalic-sup-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLight-tlf-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLightItalic-tlf-t1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Light-sup-t1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLightItalic-tlf-t1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLightItalic-sup-lgr.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Bold-sup-t1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-LightItalic-sup-lgr--base.tfm
# 	texmf-dist/tex/latex/cascadia-code/LGRCascadiaCode-Sup.fd
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Regular-tlf-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLightItalic-tlf-lgr.tfm
# 	texmf-dist/fonts/type1/public/cascadia-code/CascadiaCode-Light.pfb
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLightItalic-sup-lgr.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-ts1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBold-sup-t1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Bold-tlf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-ly1--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Italic-sup-lgr.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Italic-sup-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLight-tlf-ly1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Italic-tlf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Bold-tlf-ts1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLight-tlf-t1--base.tfm
# 	texmf-dist/tex/latex/cascadia-code/TS1CascadiaCode-TLF.fd
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLight-tlf-ly1--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Italic-tlf-ts1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-t1--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-ExtraLightItalic-tlf-t1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Bold-tlf-ot1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Bold-tlf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-sup-t1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLightItalic-tlf-ot1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-BoldItalic-tlf-lgr.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiLightItalic-tlf-ly1.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-ts1.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-LightItalic-tlf-t1.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-ExtraLightItalic-sup-lgr.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Bold-tlf-t1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLight-tlf-lgr.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Bold-sup-t1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Italic-tlf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLightItalic-tlf-ts1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Regular-tlf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLight-tlf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-LightItalic-tlf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-BoldItalic-tlf-ts1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Regular-tlf-t1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-ot1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-LightItalic-tlf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Regular-sup-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Light-sup-ly1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-sup-lgr.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Bold-sup-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Bold-tlf-lgr--base.tfm
# 	texmf-dist/fonts/opentype/public/cascadia-code/CascadiaCode-SemiBold.otf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Light-tlf-ly1.tfm
# 	texmf-dist/fonts/type1/public/cascadia-code/CascadiaCode-SemiBoldItalic.pfb
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-ot1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-ly1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Regular-sup-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-BoldItalic-tlf-t1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLight-tlf-ts1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLightItalic-tlf-ts1--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiLightItalic-tlf-lgr.vf
# 	texmf-dist/fonts/type1/public/cascadia-code/CascadiaCode-SemiLight.pfb
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-ExtraLight-sup-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-BoldItalic-tlf-ly1.tfm
# 	texmf-dist/fonts/opentype/public/cascadia-code/CascadiaCode-SemiLight.otf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBold-sup-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLightItalic-sup-t1.tfm
# 	texmf-dist/fonts/opentype/public/cascadia-code/CascadiaCode-ExtraLightItalic.otf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Italic-tlf-t1--base.tfm
# 	texmf-dist/fonts/type1/public/cascadia-code/CascadiaCode-SemiLightItalic.pfb
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiLightItalic-tlf-t1.vf
# 	texmf-dist/fonts/opentype/public/cascadia-code/CascadiaCode-ExtraLight.otf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Italic-tlf-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-sup-ly1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLightItalic-tlf-ly1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-ExtraLightItalic-sup-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLight-sup-t1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-BoldItalic-tlf-ot1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Light-tlf-ot1.tfm
# 	texmf-dist/tex/latex/cascadia-code/LY1CascadiaCode-Sup.fd
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-LightItalic-tlf-t1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-BoldItalic-sup-ot1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-ly1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-sup-lgr--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLight-sup-ot1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Regular-sup-ot1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLightItalic-sup-t1--base.tfm
# 	texmf-dist/fonts/opentype/public/cascadia-code/CascadiaCode-BoldItalic.otf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-LightItalic-tlf-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-sup-t1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Italic-tlf-t1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLight-sup-t1--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-ExtraLight-tlf-ts1.vf
# 	texmf-dist/fonts/opentype/public/cascadia-code/CascadiaCode-Regular.otf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Light-sup-ly1.tfm
# 	texmf-dist/fonts/opentype/public/cascadia-code/CascadiaCode-LightItalic.otf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLightItalic-tlf-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLight-tlf-lgr--base.tfm
# 	texmf-dist/fonts/opentype/public/cascadia-code/CascadiaCode-Italic.otf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLight-tlf-ot1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLight-sup-ot1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLightItalic-sup-ot1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLightItalic-tlf-t1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-LightItalic-sup-t1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-BoldItalic-sup-t1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Italic-tlf-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Regular-tlf-t1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Regular-sup-t1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Italic-sup-t1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLightItalic-sup-t1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiLight-sup-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-LightItalic-tlf-ot1.tfm
# 	texmf-dist/fonts/type1/public/cascadia-code/CascadiaCode-SemiBold.pfb
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Light-tlf-ts1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Regular-tlf-ts1.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Regular-tlf-ly1.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Bold-tlf-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-ts1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLight-tlf-ly1--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-t1.vf
# 	texmf-dist/fonts/type1/public/cascadia-code/CascadiaCode-Regular.pfb
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-t1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiLight-tlf-ts1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-t1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Italic-sup-t1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Light-tlf-lgr.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Bold-tlf-ly1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Italic-tlf-ot1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-sup-ot1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLight-sup-ly1--base.tfm
# 	texmf-dist/fonts/type1/public/cascadia-code/CascadiaCode-ExtraLightItalic.pfb
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-t1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-BoldItalic-tlf-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Italic-sup-ly1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Bold-sup-t1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLightItalic-tlf-ot1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-BoldItalic-sup-lgr.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-LightItalic-tlf-ts1.tfm
# 	texmf-dist/fonts/type1/public/cascadia-code/CascadiaCode-Italic.pfb
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Regular-tlf-ly1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Bold-sup-ly1.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Bold-tlf-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Bold-tlf-t1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiLight-tlf-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-BoldItalic-sup-ly1--base.tfm
# 	texmf-dist/fonts/opentype/public/cascadia-code/CascadiaCode-Bold.otf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiLight-tlf-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLight-tlf-t1--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-LightItalic-tlf-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-LightItalic-sup-ly1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Bold-tlf-t1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Light-tlf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Italic-tlf-ts1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBold-tlf-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Regular-sup-t1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-BoldItalic-tlf-lgr.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-LightItalic-sup-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLight-sup-t1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Italic-sup-ot1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Light-sup-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-BoldItalic-tlf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLight-tlf-ot1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-lgr.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Bold-sup-ot1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBold-sup-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Italic-tlf-ly1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLightItalic-tlf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Light-tlf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Bold-sup-ly1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-lgr.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLightItalic-tlf-ts1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLightItalic-tlf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-ly1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLightItalic-sup-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLightItalic-tlf-ts1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-BoldItalic-sup-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-LightItalic-sup-ly1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-ExtraLightItalic-tlf-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLightItalic-tlf-t1--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-ExtraLight-sup-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-sup-ly1--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiLightItalic-tlf-ts1.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-ExtraLight-tlf-t1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLight-tlf-t1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-BoldItalic-tlf-t1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLight-tlf-t1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLight-tlf-lgr.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Bold-tlf-ts1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Regular-tlf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Regular-sup-lgr.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Light-tlf-t1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Italic-tlf-t1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLight-tlf-ts1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBold-tlf-ly1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Light-tlf-t1--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Regular-sup-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLightItalic-sup-ot1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-tlf-lgr.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Light-sup-lgr.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiLightItalic-sup-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLight-sup-ly1.tfm
# 	texmf-dist/fonts/type1/public/cascadia-code/CascadiaCode-BoldItalic.pfb
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiLight-sup-ly1.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Light-sup-ly1.vf
# 	texmf-dist/fonts/type1/public/cascadia-code/CascadiaCode-LightItalic.pfb
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiBoldItalic-sup-lgr--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-BoldItalic-sup-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Italic-sup-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-LightItalic-tlf-t1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Bold-sup-ly1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Light-sup-t1--base.tfm
# 	texmf-dist/fonts/opentype/public/cascadia-code/CascadiaCode-SemiLightItalic.otf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-Light-tlf-lgr.vf
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-LightItalic-sup-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Regular-tlf-ot1.tfm
# 	texmf-dist/tex/latex/cascadia-code/OT1CascadiaCode-TLF.fd
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-BoldItalic-sup-t1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Italic-sup-ly1--base.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiLightItalic-sup-ly1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLightItalic-tlf-ly1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Regular-tlf-lgr.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-ExtraLight-tlf-lgr.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLight-sup-ly1--base.tfm
# 	texmf-dist/tex/latex/cascadia-code/T1CascadiaCode-TLF.fd
# 	texmf-dist/tex/latex/cascadia-code/LY1CascadiaCode-TLF.fd
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLight-sup-ly1.tfm
# 	texmf-dist/tex/latex/cascadia-code/T1CascadiaCode-Sup.fd
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-LightItalic-sup-ot1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Regular-tlf-t1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLight-tlf-ly1.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiBold-tlf-t1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-LightItalic-tlf-lgr.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-SemiLight-sup-t1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Italic-tlf-lgr--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-Italic-sup-lgr.tfm
# 	texmf-dist/fonts/vf/public/cascadia-code/CascadiaCode-BoldItalic-tlf-ts1.vf
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-ExtraLightItalic-sup-ly1.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLightItalic-sup-t1--base.tfm
# 	texmf-dist/fonts/tfm/public/cascadia-code/CascadiaCode-SemiLight-sup-t1.tfm
# > tinytex::tlmgr_search("arial") #----
# tlmgr search --file --global 'arial'
# tlmgr: package repository https://www.texlive.info/tlnet-archive/2024/04/23/tlnet (not verified: gpg unavailable)
# 00texlive.image:
# 	tlpkg/tlpsrc/actuarialsymbol.tlpsrc
# 	tlpkg/tlpsrc/actuarialangle.tlpsrc
# actuarialangle:
# 	texmf-dist/source/latex/actuarialangle/actuarialangle.dtx
# 	texmf-dist/tex/latex/actuarialangle/actuarialangle.sty
# 	texmf-dist/doc/latex/actuarialangle/README.md
# 	texmf-dist/doc/latex/actuarialangle/actuarialangle.pdf
# actuarialsymbol:
# 	texmf-dist/doc/latex/actuarialsymbol/README.md
# 	texmf-dist/doc/latex/actuarialsymbol/actuarialsymbol.pdf
# 	texmf-dist/tex/latex/actuarialsymbol/actuarialsymbol.sty
# 	texmf-dist/source/latex/actuarialsymbol/actuarialsymbol.dtx
# 	texmf-dist/doc/latex/actuarialsymbol/mosaic.jpg
# arabi:
# 	texmf-dist/tex/latex/arabi/lfefrarial.fd
# 	texmf-dist/tex/latex/arabi/laeararial.fd
# tex4ht:
# 	texmf-dist/tex4ht/ht-fonts/alias/sw/arial.htf
# ucs:
# 	texmf-dist/tex/latex/ucs/lucarial.fd
# 	texmf-dist/tex/latex/ucs/ltaarial.fd
# 	texmf-dist/tex/latex/ucs/ldvarial.fd
# > tinytex::tlmgr_search("helvet") #----
# tlmgr search --file --global 'helvet'
# tlmgr: package repository https://www.texlive.info/tlnet-archive/2024/04/23/tlnet (not verified: gpg unavailable)
# 00texlive.image:
# 	tlpkg/tlpsrc/helvetic.tlpsrc
# arev:
# 	texmf-dist/doc/fonts/arev/prosper-helvetica.tex
# cslatex:
# 	texmf-dist/tex/cslatex/cspsfonts/nhelvet.sty
# csplain:
# 	texmf-dist/tex/csplain/fonts/chelvet.tex
# helvetic:
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvri8c.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvb8tn.vf
# 	texmf-dist/fonts/vf/adobe/helvetic/phvr8cn.vf
# 	texmf-dist/fonts/tfm/monotype/helvetic/mhvb8t.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvro8cn.tfm
# 	texmf-dist/fonts/type1/urw/helvetic/uhvbo8a.pfb
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvbrn.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvb8c.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvbc7tn.tfm
# 	texmf-dist/fonts/tfm/monotype/helvetic/ari9t.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvro8cn.vf
# 	texmf-dist/fonts/tfm/monotype/helvetic/arb9t.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvri7tn.tfm
# 	texmf-dist/fonts/afm/urw/helvetic/uhvr8a.afm
# 	texmf-dist/fonts/map/dvips/helvetic/uhv.map
# 	texmf-dist/fonts/vf/adobe/helvetic/phvr8c.vf
# 	texmf-dist/fonts/type1/urw/helvetic/uhvr8ac.pfb
# 	texmf-dist/fonts/vf/adobe/helvetic/phvrc7t.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvbc7t.tfm
# 	texmf-dist/fonts/type1/urw/helvetic/uhvro8a.pfb
# 	texmf-dist/fonts/tfm/monotype/helvetic/arj8u.tfm
# 	texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvbi7t.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvri8r.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvr8tn.vf
# 	texmf-dist/fonts/type1/urw/helvetic/uhvbo8a.pfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvbc.vf
# 	texmf-dist/fonts/vf/adobe/helvetic/phvbo8c.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvrrn.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvr8c.vf
# 	texmf-dist/fonts/vf/adobe/helvetic/phvb8t.vf
# 	texmf-dist/fonts/tfm/monotype/helvetic/mhvbi.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvbo8cn.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvro.vf
# 	texmf-dist/fonts/vf/adobe/helvetic/phvbc7t.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvr7t.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvro7tn.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvr8rn.tfm
# 	texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvb8t.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvbi8t.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvbc8tn.vf
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvro7tn.vf
# 	texmf-dist/fonts/tfm/monotype/helvetic/arj7j.tfm
# 	texmf-dist/fonts/type1/urw/helvetic/uhvr8ac.pfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvb8cn.tfm
# 	texmf-dist/fonts/afm/adobe/helvetic/phvb8a.afm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvr8tn.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvrc.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvbi8c.vf
# 	texmf-dist/fonts/vf/adobe/helvetic/phvro7tn.vf
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvr7tn.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvb8t.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvri7t.vf
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvrc8t.vf
# 	texmf-dist/fonts/vf/monotype/helvetic/mhvri.vf
# 	texmf-dist/fonts/type1/urw/helvetic/uhvbo8ac.pfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvbo8tn.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvri8tn.tfm
# 	texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvr7tn.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvbc8tn.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvb7t.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvro8c.vf
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvbo7t.vf
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvbo8c.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvrc7t.tfm
# 	texmf-dist/tex/latex/helvetic/ts1uhv.fd
# 	texmf-dist/fonts/vf/adobe/helvetic/phvbc8t.vf
# 	texmf-dist/fonts/afm/adobe/helvetic/phvro8a.afm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvro7t.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvr7t.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvro8c.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvri8rn.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvr8t.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvbo7t.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvro8r.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvbo8cn.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvro8t.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvbo7tn.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvro8tn.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvb8t.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvr8r.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvbo7tn.vf
# 	texmf-dist/fonts/vf/adobe/helvetic/phvb.vf
# 	texmf-dist/fonts/afm/adobe/helvetic/phvbo8a.afm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvro8cn.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvb7tn.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvbo.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvri8cn.tfm
# 	texmf-dist/fonts/tfm/monotype/helvetic/arb2n.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvr8t.tfm
# 	texmf-dist/tex/latex/helvetic/ot1uhv.fd
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvro7t.tfm
# 	texmf-dist/fonts/tfm/monotype/helvetic/ari7j.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvrc7tn.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvro8t.tfm
# 	texmf-dist/fonts/afm/urw/helvetic/uhvro8ac.afm
# 	texmf-dist/fonts/afm/urw/helvetic/uhvbo8ac.afm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvbon.vf
# 	texmf-dist/fonts/tfm/monotype/helvetic/mhvri8t.tfm
# 	texmf-dist/tex/latex/helvetic/8ruhv.fd
# 	texmf-dist/fonts/afm/urw/helvetic/uhvb8a.afm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvrc8tn.vf
# 	texmf-dist/fonts/afm/adobe/helvetic/phvr8an.afm
# 	texmf-dist/fonts/tfm/monotype/helvetic/arj9t.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvb7t.vf
# 	texmf-dist/tex/latex/helvetic/omluhv.fd
# 	texmf-dist/fonts/vf/monotype/helvetic/mhvb.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvb7t.tfm
# 	texmf-dist/fonts/tfm/monotype/helvetic/arr7j.tfm
# 	texmf-dist/fonts/tfm/monotype/helvetic/arr10u.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvb7tn.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvro8r.tfm
# 	texmf-dist/fonts/tfm/monotype/helvetic/arb7j.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvb8rn.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvbc8t.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvr8c.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvro8tn.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvbo7t.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvrc7t.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvri8cn.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvri7t.tfm
# 	texmf-dist/fonts/vf/monotype/helvetic/mhvr.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvr8cn.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvr7t.vf
# 	texmf-dist/fonts/vf/adobe/helvetic/phvro8t.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvb8rn.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvb8tn.tfm
# 	texmf-dist/fonts/type1/urw/helvetic/uhvro8ac.pfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvri8t.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvrc8tn.tfm
# 	texmf-dist/tex/latex/helvetic/t1uhv.fd
# 	texmf-dist/fonts/tfm/monotype/helvetic/arb8u.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvrc8t.tfm
# 	texmf-dist/fonts/tfm/monotype/helvetic/arj2n.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvb7tn.vf
# 	texmf-dist/fonts/type1/urw/helvetic/uhvro8ac.pfb
# 	texmf-dist/fonts/tfm/monotype/helvetic/arr9t.tfm
# 	texmf-dist/fonts/vf/monotype/helvetic/mhvb8t.vf
# 	texmf-dist/fonts/afm/adobe/helvetic/phvb8an.afm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvbi8c.tfm
# 	texmf-dist/fonts/afm/urw/helvetic/uhvro8a.afm
# 	texmf-dist/fonts/type1/urw/helvetic/uhvro8a-105.pfb
# 	texmf-dist/fonts/tfm/monotype/helvetic/mhvri.tfm
# 	texmf-dist/fonts/afm/adobe/helvetic/phvro8an.afm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvbc7tn.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvbi7t.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvr8rn.tfm
# 	texmf-dist/fonts/vf/monotype/helvetic/mhvri8t.vf
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvbo8tn.vf
# 	texmf-dist/fonts/type1/urw/helvetic/uhvro8a.pfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvro8t.vf
# 	texmf-dist/fonts/vf/adobe/helvetic/phvbo8cn.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvbc7tn.tfm
# 	texmf-dist/fonts/vf/monotype/helvetic/mhvbi8t.vf
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvr8cn.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvbi8r.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvr8c.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvbc7tn.vf
# 	texmf-dist/fonts/vf/adobe/helvetic/phvrc.vf
# 	texmf-dist/fonts/vf/adobe/helvetic/phvbrn.vf
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvbc8t.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvrc7tn.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvr7t.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvbo8rn.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvbo8r.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvrc8tn.vf
# 	texmf-dist/tex/latex/helvetic/omsuhv.fd
# 	texmf-dist/fonts/tfm/monotype/helvetic/mhvr.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvbc8tn.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvri8c.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvro7tn.tfm
# 	texmf-dist/fonts/vf/monotype/helvetic/mhvr8t.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvbc8t.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvr7tn.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvri8t.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvb8r.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvro8tn.vf
# 	texmf-dist/fonts/vf/adobe/helvetic/phvrrn.vf
# 	texmf-dist/fonts/tfm/monotype/helvetic/arj10u.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvbo8tn.vf
# 	texmf-dist/fonts/vf/adobe/helvetic/phvr.vf
# 	texmf-dist/fonts/tfm/monotype/helvetic/mhvr8t.tfm
# 	texmf-dist/fonts/type1/urw/helvetic/uhvbo8ac.pfb
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvr8r.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvb8cn.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvron.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvro7t.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvbc7t.tfm
# 	texmf-dist/fonts/tfm/monotype/helvetic/arr8u.tfm
# 	texmf-dist/fonts/tfm/monotype/helvetic/arr2n.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvb8c.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvr8cn.tfm
# 	texmf-dist/fonts/vf/monotype/helvetic/mhvbi.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvrc8t.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvbi8t.vf
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvbo8cn.vf
# 	texmf-dist/fonts/vf/adobe/helvetic/phvrc8t.vf
# 	texmf-dist/fonts/afm/adobe/helvetic/phvr8a.afm
# 	texmf-dist/fonts/afm/adobe/helvetic/phvbo8an.afm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvro7t.vf
# 	texmf-dist/fonts/afm/urw/helvetic/uhvb8ac.afm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvbo8r.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvbo8t.vf
# 	texmf-dist/fonts/vf/adobe/helvetic/phvb8c.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvr8tn.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvrc8tn.tfm
# 	texmf-dist/fonts/tfm/monotype/helvetic/mhvbi8t.tfm
# 	texmf-dist/fonts/tfm/monotype/helvetic/ari8u.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvbo8t.tfm
# 	texmf-dist/fonts/type1/urw/helvetic/uhvb8ac.pfb
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvrc7t.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvbo8tn.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvro.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvro8c.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvron.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvb8c.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvbo8c.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvrc7tn.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvbo8c.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvro8tn.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvro8rn.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvr.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvbo7tn.vf
# 	texmf-dist/fonts/vf/adobe/helvetic/phvb8tn.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvbc.tfm
# 	texmf-dist/fonts/tfm/monotype/helvetic/ari2n.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvrc7tn.vf
# 	texmf-dist/dvips/helvetic/config.uhv
# 	texmf-dist/fonts/tfm/monotype/helvetic/ari10u.tfm
# 	texmf-dist/fonts/type1/urw/helvetic/uhvr8a-105.pfb
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvbc7t.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvro8c.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvb8cn.vf
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvr8t.vf
# 	texmf-dist/fonts/afm/urw/helvetic/uhvr8ac.afm
# 	texmf-dist/fonts/tfm/monotype/helvetic/arb10u.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvb8cn.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvb8r.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvb7tn.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvbon.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvbc8tn.vf
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvro8cn.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvro8rn.tfm
# 	texmf-dist/fonts/tfm/monotype/helvetic/mhvb.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvr8t.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvbo.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvb7t.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvbo8rn.tfm
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvri8tn.vf
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvbo8t.vf
# 	texmf-dist/fonts/vf/urw35vf/helvetic/uhvri7tn.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvbo8t.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvr8tn.vf
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvbo7tn.tfm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvb8tn.tfm
# 	texmf-dist/fonts/tfm/urw35vf/helvetic/uhvbo7t.tfm
# 	texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfm
# 	texmf-dist/fonts/type1/urw/helvetic/uhvb8ac.pfm
# 	texmf-dist/fonts/afm/urw/helvetic/uhvbo8a.afm
# 	texmf-dist/fonts/tfm/adobe/helvetic/phvb.tfm
# 	texmf-dist/fonts/vf/adobe/helvetic/phvr7tn.vf
# psnfss:
# 	texmf-dist/tex/latex/psnfss/helvet.sty
# tex4ht:
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvb8c.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvrrn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/rphvrrn.htf
# 	texmf-dist/tex4ht/ht-fonts/share/adobe/helvetic/phvr8z.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvrc8t.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvr7t.htf
# 	texmf-dist/tex4ht/ht-fonts/unicode/adobe/helvetic/ptmb8z.htf
# 	texmf-dist/tex4ht/ht-fonts/unicode/adobe/helvetic/ptmrc8z.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/pplb8z.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvbc.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvbo8tn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvbo7t.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvr8t.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvb7t.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvb8cn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvbo7tn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvb8z.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvrc8tn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvb8tn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvb8rn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvb.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvb8r.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvb8t.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvro8r.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvro8c.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/rphvbon.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/pplri8z.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/rphvbo.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvbc8t.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvro7tn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvr8tn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvbo8rn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvro8t.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvbc7tn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvrc7t.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvbc8tn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvbc7t.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvbo8r.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/rphvro.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvbo8cn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/pplr8z.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvbo8c.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvbo.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvro.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvrc.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvro8rn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvrc7tn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/pplbi8z.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvbon.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvr8cn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/rphvb.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvr8c.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvr8rn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/rphvbrn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvbo8t.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvro8cn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvro7t.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvron.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvbrn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvr.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/rphvr.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/rphvron.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvro8tn.htf
# 	texmf-dist/tex4ht/ht-fonts/alias/adobe/helvetic/phvr8r.htf
# > tinytex::tlmgr_search("HCR") #----
# tlmgr search --file --global 'HCR'
# tlmgr: package repository https://www.texlive.info/tlnet-archive/2024/04/23/tlnet (not verified: gpg unavailable)
# > tinytex::tlmgr_search("nanum") #----
	# texmf-dist/fonts/afm/public/nanumtype1/nanummjbbe.afm
	# texmf-dist/fonts/type1/public/nanumtype1/nanumgtm92.pfb
	# texmf-dist/fonts/afm/public/nanumtype1/nanummjbb4.afm
	# texmf-dist/fonts/tfm/public/nanumtype1/nanumgtmo7d.tfm
	# texmf-dist/fonts/afm/public/nanumtype1/nanumgtb23.afm
	# texmf-dist/fonts/tfm/public/nanumtype1/nanumgtbo67.tfm
	# texmf-dist/fonts/type1/public/nanumtype1/nanumgtm59.pfb
	# texmf-dist/fonts/afm/public/nanumtype1/nanumgtm92.afm
	# texmf-dist/fonts/afm/public/nanumtype1/nanumgtb58.afm
	# texmf-dist/fonts/tfm/public/nanumtype1/nanummjbob1.tfm
	# texmf-dist/fonts/tfm/public/nanumtype1/nanumgtbo73.tfm
	# texmf-dist/fonts/type1/public/nanumtype1/nanummjmbd.pfb
	# texmf-dist/fonts/tfm/public/nanumtype1/nanummjm21.tfm
	# texmf-dist/fonts/afm/public/nanumtype1/nanumgtm98.afm
	# texmf-dist/fonts/afm/public/nanumtype1/nanumgtm8c.afm
	# texmf-dist/fonts/tfm/public/nanumtype1/nanummjmo30.tfm
	# texmf-dist/fonts/type1/public/nanumtype1/nanumgtbb6.pfb
	# texmf-dist/fonts/tfm/public/nanumtype1/ts1nanummjmo.tfm
	# texmf-dist/fonts/tfm/public/nanumtype1/nanumgtmo9c.tfm
	# texmf-dist/fonts/afm/public/nanumtype1/nanumgtb87.afm
	# texmf-dist/fonts/tfm/public/nanumtype1/nanumgtboac.tfm
	# texmf-dist/fonts/tfm/public/nanumtype1/nanummjmca.tfm
	# texmf-dist/fonts/type1/public/nanumtype1/nanumgtm8c.pfb
# > tinytex::tlmgr_search("D2coding") #----
# tlmgr search --file --global 'D2coding'
# tlmgr: package repository https://www.texlive.info/tlnet-archive/2024/04/23/tlnet (not verified: gpg unavailable)
# > tinytex::tlmgr_search("d2coding") #----
# tlmgr search --file --global 'd2coding'
# tlmgr: package repository https://www.texlive.info/tlnet-archive/2024/04/23/tlnet (not verified: gpg unavailable)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#@ tinytex::tlmgr_install =====
tinytex::tlmgr_install(c("kotex", "fontspec"))
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# #  @ Download Cascadia Code (Recent version with Semibold variant) ----
# #| @ Download Cascadia Code (Recent version with Semibold variant) |#
# wget https://github.com/microsoft/cascadia-code/releases/download/v2106.17/CascadiaCode-2106.17.zip
# 
# # Extract the fonts
# unzip CascadiaCode-2106.17.zip -d CascadiaCode
# 
# # Copy to system fonts directory (requires sudo)
# sudo mkdir -p /usr/share/fonts/truetype/cascadia
# sudo cp CascadiaCode/ttf/*.ttf /usr/share/fonts/truetype/cascadia/
# 
# # Or copy to user fonts directory
# mkdir -p ~/.local/share/fonts
# cp CascadiaCode/ttf/*.ttf ~/.local/share/fonts/
# 
# # Update the font cache
# sudo fc-cache -fv
# # Or for user-specific installation
# fc-cache -fv
# 
# # Verify the installation
# 'fc-list | grep "Cascadia"' |> system(intern=TRUE) |> cat(sep="\n")
# 'fc-list | grep "Cascadia Code SemiBold"' |> system(intern=TRUE) |> cat(sep="\n")
# 
#|________________________________________________________________________________|#  
# #|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# #  @ Install Cascadia Code (older version without Semibold variant) ----
# 'sudo apt update' |> system(intern=TRUE) |> cat(sep="\n")
# 'sudo apt install fonts-cascadia-code' |> system(intern=TRUE) |> cat(sep="\n")
# # Update the font cache for user-specific installation
# 'fc-cache -fv' |> system(intern=TRUE) |> cat(sep="\n")
# 'fc-list | grep "Cascadia"' |> system(intern=TRUE) |> cat(sep="\n")
# 'fc-list | grep "Cascadia Code SemiBold"' |> system(intern=TRUE) |> cat(sep="\n")
# # Update the font cache
# 'sudo fc-cache -fv' |> system(intern=TRUE) |> cat(sep="\n")
# 'sudo fc-list | grep "Cascadia"' |> system(intern=TRUE) |> cat(sep="\n")
# 'sudo fc-list | grep "Cascadia Code SemiBold"' |> system(intern=TRUE) |> cat(sep="\n")
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#
#| If installed to the system font directory, Cascadia Code will be used as the main font, with Cascadia Code as the fallback font. If Cascadia Code is not available, the system will fall back to the default font.
---
title: "Document Title"
output:
  pdf_document:
    latex_engine: xelatex
header-includes:
   - \usepackage{fontspec}
   - \setmainfont{Cascadia Code SemiBold}[FallbackFamily=\fontspec{Cascadia Code}]
---
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
---
title: "Document Title"
output: 
  pdf_document:
    latex_engine: xelatex  # or lualatex
mainfont: "Cascadia Code SemiBold"
header-includes:
  - \IfFontExistsTF{Cascadia Code SemiBold}{}{%
      \setmainfont{Cascadia Code}
    }
---
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#| if you are not using system-installed fonts and need to specify a custom location or file type. 
\setmainfont{Cascadia Code SemiBold}[
    Extension = .ttf,
    Path = ./path/to/fonts/,  % Adjust the path if using a specific directory
    FallbackFamily = \fontspec{Cascadia Code}  % Default fallback
]
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#@ Setting multiple fallback fonts in XeLaTeX ----
\usepackage{fontspec}
\usepackage{ifxetex}
\usepackage{etoolbox}

% Define font families
\newfontfamily\mainfont{Cascadia Code SemiBold}[Extension=.ttf, Path=./path/to/fonts/]
\newfontfamily\fallbackfontone{Cascadia Code}[Extension=.ttf, Path=./path/to/fonts/]
\newfontfamily\fallbackfonttwo{Inconsolata}[Extension=.ttf, Path=./path/to/fonts/]
\newfontfamily\fallbackfontthree{D2Coding}[Extension=.ttf, Path=./path/to/fonts/]

% Command to select the main font or fallbacks
\newcommand{\selectfontwithfallback}{
  \ifboolexpr{ test {\IfFontExistsTF{Cascadia Code SemiBold}} }
    {\setmainfont{Cascadia Code SemiBold}}
    {\ifboolexpr{ test {\IfFontExistsTF{Cascadia Code}} }
      {\setmainfont{Cascadia Code}}
      {\ifboolexpr{ test {\IfFontExistsTF{Inconsolata}} }
        {\setmainfont{Inconsolata}}
        {\setmainfont{D2Coding}}
      }
    }
}

% Use the defined command to set the font
\selectfontwithfallback

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
#@ Inconsolata -----

Local Installation for LaTeX
# If you're working on your own machine or server where you have administrative rights, you can install Inconsolata for LaTeX using your LaTeX distribution’s package manager:
# For TeX Live (common on Linux and sometimes on macOS and Windows):
tlmgr list --only-installed | grep inconsolata

tlmgr install inconsolata


# For MiKTeX (common on Windows):
mpm --list | findstr inconsolata

miktex-console


---
title: "Your Document Title"
output:
  pdf_document:
    latex_engine: xelatex
header-includes:
  - \usepackage{inconsolata}
---

# Use Inconsolata for all Typewriter Text:
# If you want all typewriter (monospaced) text to automatically use Inconsolata, you can set it explicitly as follows in LaTeX:
\renewcommand{\ttdefault}{zi4}  % 'zi4' is the family code for Inconsolata




#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#@ Airal ----
FROM rocker/rstudio:latest

# Install MS core fonts
RUN apt update && \
    apt install -y software-properties-common && \
    echo "deb http://deb.debian.org/debian contrib" >> /etc/apt/sources.list && \
    apt update && \
    apt install -y ttf-mscorefonts-installer && \
    fc-cache -f -v

# Other necessary installations or configurations
RUN mktexlsr && \
    updmap-sys


docker build -t custom-rstudio .
docker run -d -p 8787:8787 custom-rstudio

---
title: "Your Document"
author: "Author Name"
output:
  pdf_document:
    latex_engine: xelatex
header-includes:
   - \usepackage{fontspec}
   - \setmainfont{Liberation Sans}
---



\documentclass{article}
\usepackage{fontspec}
\setmainfont{Arial}

\begin{document}
Hello, world!
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

