# check fonts and install.r

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# https://chatgpt.com/c/8d563256-b9b9-4685-b048-343944290455
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  


'fc-list :family' |> system(intern = TRUE) |> cat(sep = "\n") #----
# > 'fc-list :family' |> system(intern = TRUE) |> cat(sep = "\n") #----
# /usr/share/fonts/opentype/urw-base35/URWBookman-LightItalic.otf: URW Bookman:style=Light Italic
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-Thin.ttf: Roboto,Roboto Thin:style=Thin,Regular
# /usr/share/fonts/opentype/urw-base35/URWBookman-Light.otf: URW Bookman:style=Light
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrebonum-bold.otf: TeX Gyre Bonum:style=Bold
# /usr/share/fonts/opentype/urw-base35/NimbusMonoPS-Italic.otf: Nimbus Mono PS:style=Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrecursor-italic.otf: TeX Gyre Cursor:style=Italic
# /usr/share/fonts/opentype/urw-base35/P052-Italic.otf: P052:style=Italic
# /usr/share/fonts/type1/urw-base35/URWGothic-BookOblique.t1: URW Gothic:style=Book Oblique
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-MediumItalic.ttf: Roboto,Roboto Medium:style=Medium Italic,Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyretermes-italic.otf: TeX Gyre Termes:style=Italic
# /usr/share/fonts/type1/gsfonts/n021024l.pfb: Nimbus Roman No9 L:style=Medium Italic
# /usr/share/fonts/opentype/urw-base35/NimbusSans-Regular.otf: Nimbus Sans:style=Regular
# /usr/share/fonts/truetype/naver-d2coding/D2Coding-Ver1.3.2-20180524-all.ttc: D2Coding:style=Regular
# /usr/share/fonts/type1/urw-base35/URWBookman-DemiItalic.t1: URW Bookman:style=Demi Italic
# /usr/share/fonts/opentype/urw-base35/NimbusSansNarrow-Oblique.otf: Nimbus Sans Narrow:style=Oblique
# /usr/share/fonts/truetype/naver-d2coding/D2Coding-Ver1.3.2-20180524-all.ttc: D2Coding:style=Bold
# /usr/share/fonts/type1/urw-base35/NimbusSans-Regular.t1: Nimbus Sans:style=Regular
# /usr/share/fonts/opentype/urw-base35/C059-Roman.otf: C059:style=Roman
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreadventor-bold.otf: TeX Gyre Adventor:style=Bold
# /usr/share/fonts/type1/gsfonts/n021004l.pfb: Nimbus Roman No9 L:style=Medium
# /usr/share/fonts/opentype/urw-base35/NimbusMonoPS-BoldItalic.otf: Nimbus Mono PS:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/URWGothic-DemiOblique.t1: URW Gothic:style=Demi Oblique
# /usr/share/fonts/type1/gsfonts/p052023l.pfb: URW Palladio L:style=Italic
# /usr/share/fonts/type1/gsfonts/n022003l.pfb: Nimbus Mono L:style=Regular
# /usr/share/fonts/truetype/roboto/unhinted/RobotoCondensed-Italic.ttf: Roboto Condensed:style=Italic
# /usr/share/fonts/truetype/roboto/unhinted/RobotoCondensed-Bold.ttf: Roboto Condensed:style=Bold
# /usr/share/fonts/truetype/roboto/unhinted/RobotoCondensed-Medium.ttf: Roboto Condensed,Roboto Condensed Medium:style=Medium,Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre-math/texgyreschola-math.otf: TeX Gyre Schola Math:style=Regular
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-ThinItalic.ttf: Roboto,Roboto Thin:style=Thin Italic,Italic
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-LightItalic.ttf: Roboto,Roboto Light:style=Light Italic,Italic
# /usr/share/fonts/type1/gsfonts/z003034l.pfb: URW Chancery L:style=Medium Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre-math/texgyrepagella-math.otf: TeX Gyre Pagella Math:style=Regular
# /usr/share/fonts/type1/urw-base35/URWBookman-LightItalic.t1: URW Bookman:style=Light Italic
# /usr/share/fonts/opentype/urw-base35/NimbusSansNarrow-BoldOblique.otf: Nimbus Sans Narrow:style=Bold Oblique
# /usr/share/fonts/truetype/roboto/unhinted/RobotoCondensed-BoldItalic.ttf: Roboto Condensed:style=Bold Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrepagella-bolditalic.otf: TeX Gyre Pagella:style=Bold Italic
# /usr/share/fonts/type1/gsfonts/c059013l.pfb: Century Schoolbook L:style=Roman
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreheros-regular.otf: TeX Gyre Heros:style=Regular
# /usr/share/fonts/type1/urw-base35/NimbusSansNarrow-BoldOblique.t1: Nimbus Sans Narrow:style=Bold Oblique
# /usr/share/fonts/opentype/urw-base35/NimbusSans-Bold.otf: Nimbus Sans:style=Bold
# /usr/share/fonts/type1/urw-base35/NimbusMonoPS-Italic.t1: Nimbus Mono PS:style=Italic
# /usr/share/fonts/type1/urw-base35/NimbusRoman-BoldItalic.t1: Nimbus Roman:style=Bold Italic
# /usr/share/fonts/truetype/roboto/unhinted/RobotoCondensed-LightItalic.ttf: Roboto Condensed,Roboto Condensed Light:style=Light Italic,Italic
# /usr/share/fonts/opentype/urw-base35/Z003-MediumItalic.otf: Z003:style=Medium Italic
# /usr/share/fonts/opentype/urw-base35/NimbusSans-BoldItalic.otf: Nimbus Sans:style=Bold Italic
# /usr/share/fonts/opentype/urw-base35/URWGothic-Book.otf: URW Gothic:style=Book
# /usr/share/fonts/type1/gsfonts/d050000l.pfb: Dingbats:style=Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreheroscn-bolditalic.otf: TeX Gyre Heros Cn:style=Bold Italic
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-Italic.ttf: Roboto:style=Italic
# /usr/share/fonts/type1/gsfonts/n021023l.pfb: Nimbus Roman No9 L:style=Regular Italic
# /usr/share/fonts/opentype/urw-base35/D050000L.otf: D050000L:style=Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrecursor-bold.otf: TeX Gyre Cursor:style=Bold
# /usr/share/fonts/type1/gsfonts/n019063l.pfb: Nimbus Sans L:style=Regular Condensed Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreschola-regular.otf: TeX Gyre Schola:style=Regular
# /usr/share/fonts/opentype/urw-base35/C059-BdIta.otf: C059:style=Bold Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreadventor-italic.otf: TeX Gyre Adventor:style=Italic
# /usr/share/fonts/type1/gsfonts/a010013l.pfb: URW Gothic L:style=Book
# /usr/share/fonts/opentype/urw-base35/NimbusRoman-Regular.otf: Nimbus Roman:style=Regular
# /usr/share/fonts/opentype/urw-base35/C059-Italic.otf: C059:style=Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyretermes-bolditalic.otf: TeX Gyre Termes:style=Bold Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreheroscn-italic.otf: TeX Gyre Heros Cn:style=Italic
# /usr/share/fonts/opentype/urw-base35/NimbusMonoPS-Bold.otf: Nimbus Mono PS:style=Bold
# /usr/share/fonts/opentype/urw-base35/NimbusRoman-Bold.otf: Nimbus Roman:style=Bold
# /usr/share/fonts/type1/urw-base35/NimbusSansNarrow-Bold.t1: Nimbus Sans Narrow:style=Bold
# /usr/share/fonts/opentype/urw-base35/NimbusRoman-BoldItalic.otf: Nimbus Roman:style=Bold Italic
# /usr/share/fonts/type1/gsfonts/n019064l.pfb: Nimbus Sans L:style=Bold Condensed Italic
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-BlackItalic.ttf: Roboto,Roboto Black:style=Black Italic,Italic
# /usr/share/fonts/type1/gsfonts/p052004l.pfb: URW Palladio L:style=Bold
# /usr/share/fonts/type1/urw-base35/C059-Roman.t1: C059:style=Roman
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreheroscn-bold.otf: TeX Gyre Heros Cn:style=Bold
# /usr/share/texmf/fonts/opentype/public/tex-gyre-math/texgyrebonum-math.otf: TeX Gyre Bonum Math:style=Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrebonum-bolditalic.otf: TeX Gyre Bonum:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/NimbusRoman-Italic.t1: Nimbus Roman:style=Italic
# /usr/share/fonts/opentype/urw-base35/NimbusSans-Italic.otf: Nimbus Sans:style=Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrecursor-bolditalic.otf: TeX Gyre Cursor:style=Bold Italic
# /usr/share/fonts/type1/gsfonts/n022023l.pfb: Nimbus Mono L:style=Regular Oblique
# /usr/share/fonts/type1/urw-base35/URWBookman-Demi.t1: URW Bookman:style=Demi
# /usr/share/texmf/fonts/opentype/public/tex-gyre-math/texgyretermes-math.otf: TeX Gyre Termes Math:style=Regular
# /usr/share/fonts/type1/gsfonts/a010015l.pfb: URW Gothic L:style=Demi
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreadventor-bolditalic.otf: TeX Gyre Adventor:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/URWGothic-Book.t1: URW Gothic:style=Book
# /usr/share/fonts/type1/urw-base35/NimbusRoman-Regular.t1: Nimbus Roman:style=Regular
# /usr/share/fonts/opentype/urw-base35/NimbusMonoPS-Regular.otf: Nimbus Mono PS:style=Regular
# /usr/share/fonts/opentype/urw-base35/NimbusSansNarrow-Regular.otf: Nimbus Sans Narrow:style=Regular
# /usr/share/fonts/type1/gsfonts/n019043l.pfb: Nimbus Sans L:style=Regular Condensed
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreschola-bolditalic.otf: TeX Gyre Schola:style=Bold Italic
# /usr/share/fonts/truetype/naver-d2coding/D2Coding-Ver1.3.2-20180524-all.ttc: D2Coding ligature:style=Regular
# /usr/share/fonts/opentype/urw-base35/URWBookman-Demi.otf: URW Bookman:style=Demi
# /usr/share/fonts/type1/urw-base35/NimbusMonoPS-Regular.t1: Nimbus Mono PS:style=Regular
# /usr/share/fonts/type1/urw-base35/NimbusSans-BoldItalic.t1: Nimbus Sans:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/NimbusSans-Bold.t1: Nimbus Sans:style=Bold
# /usr/share/fonts/type1/gsfonts/n019044l.pfb: Nimbus Sans L:style=Bold Condensed
# /usr/share/fonts/type1/urw-base35/NimbusMonoPS-BoldItalic.t1: Nimbus Mono PS:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/StandardSymbolsPS.t1: Standard Symbols PS:style=Regular
# /usr/share/fonts/opentype/urw-base35/URWGothic-Demi.otf: URW Gothic:style=Demi
# /usr/share/fonts/type1/gsfonts/a010033l.pfb: URW Gothic L:style=Book Oblique
# /usr/share/fonts/truetype/roboto/unhinted/RobotoCondensed-Light.ttf: Roboto Condensed,Roboto Condensed Light:style=Light,Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrepagella-italic.otf: TeX Gyre Pagella:style=Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrechorus-mediumitalic.otf: TeX Gyre Chorus:style=Regular
# /usr/share/fonts/type1/gsfonts/n021003l.pfb: Nimbus Roman No9 L:style=Regular
# /usr/share/fonts/type1/gsfonts/s050000l.pfb: Standard Symbols L:style=Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreheros-bold.otf: TeX Gyre Heros:style=Bold
# /usr/share/fonts/truetype/roboto/unhinted/RobotoCondensed-MediumItalic.ttf: Roboto Condensed,Roboto Condensed Medium:style=Medium Italic,Italic
# /usr/share/fonts/opentype/urw-base35/NimbusSansNarrow-Bold.otf: Nimbus Sans Narrow:style=Bold
# /usr/share/fonts/opentype/urw-base35/URWBookman-DemiItalic.otf: URW Bookman:style=Demi Italic
# /usr/share/fonts/opentype/urw-base35/URWGothic-BookOblique.otf: URW Gothic:style=Book Oblique
# /usr/share/fonts/type1/gsfonts/b018035l.pfb: URW Bookman L:style=Demi Bold Italic
# /usr/share/fonts/type1/gsfonts/c059033l.pfb: Century Schoolbook L:style=Italic
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-Medium.ttf: Roboto,Roboto Medium:style=Medium,Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrepagella-regular.otf: TeX Gyre Pagella:style=Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrecursor-regular.otf: TeX Gyre Cursor:style=Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrebonum-regular.otf: TeX Gyre Bonum:style=Regular
# /usr/share/fonts/type1/urw-base35/Z003-MediumItalic.t1: Z003:style=Medium Italic
# /usr/share/fonts/type1/urw-base35/P052-BoldItalic.t1: P052:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/C059-Italic.t1: C059:style=Italic
# /usr/share/fonts/type1/gsfonts/a010035l.pfb: URW Gothic L:style=Demi Oblique
# /usr/share/fonts/type1/urw-base35/P052-Roman.t1: P052:style=Roman
# /usr/share/fonts/type1/urw-base35/NimbusRoman-Bold.t1: Nimbus Roman:style=Bold
# /usr/share/fonts/type1/urw-base35/NimbusSansNarrow-Oblique.t1: Nimbus Sans Narrow:style=Oblique
# /usr/share/fonts/opentype/urw-base35/P052-BoldItalic.otf: P052:style=Bold Italic
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-Bold.ttf: Roboto:style=Bold
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreadventor-regular.otf: TeX Gyre Adventor:style=Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrepagella-bold.otf: TeX Gyre Pagella:style=Bold
# /usr/share/fonts/type1/urw-base35/D050000L.t1: D050000L:style=Regular
# /usr/share/fonts/opentype/urw-base35/StandardSymbolsPS.otf: Standard Symbols PS:style=Regular
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-Black.ttf: Roboto,Roboto Black:style=Black,Regular
# /usr/share/fonts/type1/gsfonts/n019023l.pfb: Nimbus Sans L:style=Regular Italic
# /usr/share/fonts/type1/gsfonts/b018012l.pfb: URW Bookman L:style=Light
# /usr/share/fonts/truetype/naver-d2coding/D2Coding-Ver1.3.2-20180524-all.ttc: D2Coding ligature:style=Bold
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreheros-italic.otf: TeX Gyre Heros:style=Italic
# /usr/share/fonts/type1/urw-base35/URWGothic-Demi.t1: URW Gothic:style=Demi
# /usr/share/fonts/type1/urw-base35/NimbusSans-Italic.t1: Nimbus Sans:style=Italic
# /usr/share/fonts/type1/urw-base35/C059-BdIta.t1: C059:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/NimbusMonoPS-Bold.t1: Nimbus Mono PS:style=Bold
# /usr/share/fonts/type1/gsfonts/c059016l.pfb: Century Schoolbook L:style=Bold
# /usr/share/fonts/type1/gsfonts/n022004l.pfb: Nimbus Mono L:style=Bold
# /usr/share/fonts/type1/gsfonts/n019024l.pfb: Nimbus Sans L:style=Bold Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre-math/texgyredejavu-math.otf: TeX Gyre DejaVu Math:style=Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreschola-italic.otf: TeX Gyre Schola:style=Italic
# /usr/share/fonts/type1/gsfonts/b018032l.pfb: URW Bookman L:style=Light Italic
# /usr/share/fonts/type1/gsfonts/p052003l.pfb: URW Palladio L:style=Roman
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreheros-bolditalic.otf: TeX Gyre Heros:style=Bold Italic
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-Light.ttf: Roboto,Roboto Light:style=Light,Regular
# /usr/share/fonts/opentype/urw-base35/URWGothic-DemiOblique.otf: URW Gothic:style=Demi Oblique
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreschola-bold.otf: TeX Gyre Schola:style=Bold
# /usr/share/fonts/type1/urw-base35/P052-Bold.t1: P052:style=Bold
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreheroscn-regular.otf: TeX Gyre Heros Cn:style=Regular
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-Regular.ttf: Roboto:style=Regular
# /usr/share/fonts/type1/gsfonts/n019004l.pfb: Nimbus Sans L:style=Bold
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyretermes-regular.otf: TeX Gyre Termes:style=Regular
# /usr/share/fonts/type1/gsfonts/b018015l.pfb: URW Bookman L:style=Demi Bold
# /usr/share/fonts/type1/gsfonts/n022024l.pfb: Nimbus Mono L:style=Bold Oblique
# /usr/share/fonts/type1/urw-base35/P052-Italic.t1: P052:style=Italic
# /usr/share/fonts/type1/urw-base35/NimbusSansNarrow-Regular.t1: Nimbus Sans Narrow:style=Regular
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-BoldItalic.ttf: Roboto:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/C059-Bold.t1: C059:style=Bold
# /usr/share/fonts/truetype/roboto/unhinted/RobotoCondensed-Regular.ttf: Roboto Condensed:style=Regular
# /usr/share/fonts/type1/gsfonts/c059036l.pfb: Century Schoolbook L:style=Bold Italic
# /usr/share/fonts/type1/gsfonts/p052024l.pfb: URW Palladio L:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/URWBookman-Light.t1: URW Bookman:style=Light
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyretermes-bold.otf: TeX Gyre Termes:style=Bold
# /usr/share/fonts/opentype/urw-base35/P052-Roman.otf: P052:style=Roman
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrebonum-italic.otf: TeX Gyre Bonum:style=Italic
# /usr/share/fonts/opentype/urw-base35/C059-Bold.otf: C059:style=Bold
# /usr/share/fonts/opentype/urw-base35/P052-Bold.otf: P052:style=Bold
# /usr/share/fonts/opentype/urw-base35/NimbusRoman-Italic.otf: Nimbus Roman:style=Italic
# /usr/share/fonts/type1/gsfonts/n019003l.pfb: Nimbus Sans L:style=Regular

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
fc_list_family.fonts.unique <- function() {
  # Get font list from fc-list
  fonts <- system("fc-list :family", intern = TRUE)
  
  # Process and clean font list
  unique_fonts <- unique(sapply(strsplit(fonts, ","), `[`, 1))
  unique_fonts <- gsub("^\\s+|\\s+$", "", unique_fonts)
  
  return(unique_fonts)
}

fc_list_family.fonts.unique() |> cat(sep = "\n") #----
# > fc_list_family.fonts.unique() |> cat(sep = "\n") #----
# /usr/share/fonts/opentype/urw-base35/URWBookman-LightItalic.otf: URW Bookman:style=Light Italic
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-Thin.ttf: Roboto
# /usr/share/fonts/opentype/urw-base35/URWBookman-Light.otf: URW Bookman:style=Light
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrebonum-bold.otf: TeX Gyre Bonum:style=Bold
# /usr/share/fonts/opentype/urw-base35/NimbusMonoPS-Italic.otf: Nimbus Mono PS:style=Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrecursor-italic.otf: TeX Gyre Cursor:style=Italic
# /usr/share/fonts/opentype/urw-base35/P052-Italic.otf: P052:style=Italic
# /usr/share/fonts/type1/urw-base35/URWGothic-BookOblique.t1: URW Gothic:style=Book Oblique
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-MediumItalic.ttf: Roboto
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyretermes-italic.otf: TeX Gyre Termes:style=Italic
# /usr/share/fonts/type1/gsfonts/n021024l.pfb: Nimbus Roman No9 L:style=Medium Italic
# /usr/share/fonts/opentype/urw-base35/NimbusSans-Regular.otf: Nimbus Sans:style=Regular
# /usr/share/fonts/truetype/naver-d2coding/D2Coding-Ver1.3.2-20180524-all.ttc: D2Coding:style=Regular
# /usr/share/fonts/type1/urw-base35/URWBookman-DemiItalic.t1: URW Bookman:style=Demi Italic
# /usr/share/fonts/opentype/urw-base35/NimbusSansNarrow-Oblique.otf: Nimbus Sans Narrow:style=Oblique
# /usr/share/fonts/truetype/naver-d2coding/D2Coding-Ver1.3.2-20180524-all.ttc: D2Coding:style=Bold
# /usr/share/fonts/type1/urw-base35/NimbusSans-Regular.t1: Nimbus Sans:style=Regular
# /usr/share/fonts/opentype/urw-base35/C059-Roman.otf: C059:style=Roman
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreadventor-bold.otf: TeX Gyre Adventor:style=Bold
# /usr/share/fonts/type1/gsfonts/n021004l.pfb: Nimbus Roman No9 L:style=Medium
# /usr/share/fonts/opentype/urw-base35/NimbusMonoPS-BoldItalic.otf: Nimbus Mono PS:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/URWGothic-DemiOblique.t1: URW Gothic:style=Demi Oblique
# /usr/share/fonts/type1/gsfonts/p052023l.pfb: URW Palladio L:style=Italic
# /usr/share/fonts/type1/gsfonts/n022003l.pfb: Nimbus Mono L:style=Regular
# /usr/share/fonts/truetype/roboto/unhinted/RobotoCondensed-Italic.ttf: Roboto Condensed:style=Italic
# /usr/share/fonts/truetype/roboto/unhinted/RobotoCondensed-Bold.ttf: Roboto Condensed:style=Bold
# /usr/share/fonts/truetype/roboto/unhinted/RobotoCondensed-Medium.ttf: Roboto Condensed
# /usr/share/texmf/fonts/opentype/public/tex-gyre-math/texgyreschola-math.otf: TeX Gyre Schola Math:style=Regular
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-ThinItalic.ttf: Roboto
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-LightItalic.ttf: Roboto
# /usr/share/fonts/type1/gsfonts/z003034l.pfb: URW Chancery L:style=Medium Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre-math/texgyrepagella-math.otf: TeX Gyre Pagella Math:style=Regular
# /usr/share/fonts/type1/urw-base35/URWBookman-LightItalic.t1: URW Bookman:style=Light Italic
# /usr/share/fonts/opentype/urw-base35/NimbusSansNarrow-BoldOblique.otf: Nimbus Sans Narrow:style=Bold Oblique
# /usr/share/fonts/truetype/roboto/unhinted/RobotoCondensed-BoldItalic.ttf: Roboto Condensed:style=Bold Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrepagella-bolditalic.otf: TeX Gyre Pagella:style=Bold Italic
# /usr/share/fonts/type1/gsfonts/c059013l.pfb: Century Schoolbook L:style=Roman
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreheros-regular.otf: TeX Gyre Heros:style=Regular
# /usr/share/fonts/type1/urw-base35/NimbusSansNarrow-BoldOblique.t1: Nimbus Sans Narrow:style=Bold Oblique
# /usr/share/fonts/opentype/urw-base35/NimbusSans-Bold.otf: Nimbus Sans:style=Bold
# /usr/share/fonts/type1/urw-base35/NimbusMonoPS-Italic.t1: Nimbus Mono PS:style=Italic
# /usr/share/fonts/type1/urw-base35/NimbusRoman-BoldItalic.t1: Nimbus Roman:style=Bold Italic
# /usr/share/fonts/truetype/roboto/unhinted/RobotoCondensed-LightItalic.ttf: Roboto Condensed
# /usr/share/fonts/opentype/urw-base35/Z003-MediumItalic.otf: Z003:style=Medium Italic
# /usr/share/fonts/opentype/urw-base35/NimbusSans-BoldItalic.otf: Nimbus Sans:style=Bold Italic
# /usr/share/fonts/opentype/urw-base35/URWGothic-Book.otf: URW Gothic:style=Book
# /usr/share/fonts/type1/gsfonts/d050000l.pfb: Dingbats:style=Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreheroscn-bolditalic.otf: TeX Gyre Heros Cn:style=Bold Italic
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-Italic.ttf: Roboto:style=Italic
# /usr/share/fonts/type1/gsfonts/n021023l.pfb: Nimbus Roman No9 L:style=Regular Italic
# /usr/share/fonts/opentype/urw-base35/D050000L.otf: D050000L:style=Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrecursor-bold.otf: TeX Gyre Cursor:style=Bold
# /usr/share/fonts/type1/gsfonts/n019063l.pfb: Nimbus Sans L:style=Regular Condensed Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreschola-regular.otf: TeX Gyre Schola:style=Regular
# /usr/share/fonts/opentype/urw-base35/C059-BdIta.otf: C059:style=Bold Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreadventor-italic.otf: TeX Gyre Adventor:style=Italic
# /usr/share/fonts/type1/gsfonts/a010013l.pfb: URW Gothic L:style=Book
# /usr/share/fonts/opentype/urw-base35/NimbusRoman-Regular.otf: Nimbus Roman:style=Regular
# /usr/share/fonts/opentype/urw-base35/C059-Italic.otf: C059:style=Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyretermes-bolditalic.otf: TeX Gyre Termes:style=Bold Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreheroscn-italic.otf: TeX Gyre Heros Cn:style=Italic
# /usr/share/fonts/opentype/urw-base35/NimbusMonoPS-Bold.otf: Nimbus Mono PS:style=Bold
# /usr/share/fonts/opentype/urw-base35/NimbusRoman-Bold.otf: Nimbus Roman:style=Bold
# /usr/share/fonts/type1/urw-base35/NimbusSansNarrow-Bold.t1: Nimbus Sans Narrow:style=Bold
# /usr/share/fonts/opentype/urw-base35/NimbusRoman-BoldItalic.otf: Nimbus Roman:style=Bold Italic
# /usr/share/fonts/type1/gsfonts/n019064l.pfb: Nimbus Sans L:style=Bold Condensed Italic
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-BlackItalic.ttf: Roboto
# /usr/share/fonts/type1/gsfonts/p052004l.pfb: URW Palladio L:style=Bold
# /usr/share/fonts/type1/urw-base35/C059-Roman.t1: C059:style=Roman
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreheroscn-bold.otf: TeX Gyre Heros Cn:style=Bold
# /usr/share/texmf/fonts/opentype/public/tex-gyre-math/texgyrebonum-math.otf: TeX Gyre Bonum Math:style=Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrebonum-bolditalic.otf: TeX Gyre Bonum:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/NimbusRoman-Italic.t1: Nimbus Roman:style=Italic
# /usr/share/fonts/opentype/urw-base35/NimbusSans-Italic.otf: Nimbus Sans:style=Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrecursor-bolditalic.otf: TeX Gyre Cursor:style=Bold Italic
# /usr/share/fonts/type1/gsfonts/n022023l.pfb: Nimbus Mono L:style=Regular Oblique
# /usr/share/fonts/type1/urw-base35/URWBookman-Demi.t1: URW Bookman:style=Demi
# /usr/share/texmf/fonts/opentype/public/tex-gyre-math/texgyretermes-math.otf: TeX Gyre Termes Math:style=Regular
# /usr/share/fonts/type1/gsfonts/a010015l.pfb: URW Gothic L:style=Demi
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreadventor-bolditalic.otf: TeX Gyre Adventor:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/URWGothic-Book.t1: URW Gothic:style=Book
# /usr/share/fonts/type1/urw-base35/NimbusRoman-Regular.t1: Nimbus Roman:style=Regular
# /usr/share/fonts/opentype/urw-base35/NimbusMonoPS-Regular.otf: Nimbus Mono PS:style=Regular
# /usr/share/fonts/opentype/urw-base35/NimbusSansNarrow-Regular.otf: Nimbus Sans Narrow:style=Regular
# /usr/share/fonts/type1/gsfonts/n019043l.pfb: Nimbus Sans L:style=Regular Condensed
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreschola-bolditalic.otf: TeX Gyre Schola:style=Bold Italic
# /usr/share/fonts/truetype/naver-d2coding/D2Coding-Ver1.3.2-20180524-all.ttc: D2Coding ligature:style=Regular
# /usr/share/fonts/opentype/urw-base35/URWBookman-Demi.otf: URW Bookman:style=Demi
# /usr/share/fonts/type1/urw-base35/NimbusMonoPS-Regular.t1: Nimbus Mono PS:style=Regular
# /usr/share/fonts/type1/urw-base35/NimbusSans-BoldItalic.t1: Nimbus Sans:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/NimbusSans-Bold.t1: Nimbus Sans:style=Bold
# /usr/share/fonts/type1/gsfonts/n019044l.pfb: Nimbus Sans L:style=Bold Condensed
# /usr/share/fonts/type1/urw-base35/NimbusMonoPS-BoldItalic.t1: Nimbus Mono PS:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/StandardSymbolsPS.t1: Standard Symbols PS:style=Regular
# /usr/share/fonts/opentype/urw-base35/URWGothic-Demi.otf: URW Gothic:style=Demi
# /usr/share/fonts/type1/gsfonts/a010033l.pfb: URW Gothic L:style=Book Oblique
# /usr/share/fonts/truetype/roboto/unhinted/RobotoCondensed-Light.ttf: Roboto Condensed
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrepagella-italic.otf: TeX Gyre Pagella:style=Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrechorus-mediumitalic.otf: TeX Gyre Chorus:style=Regular
# /usr/share/fonts/type1/gsfonts/n021003l.pfb: Nimbus Roman No9 L:style=Regular
# /usr/share/fonts/type1/gsfonts/s050000l.pfb: Standard Symbols L:style=Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreheros-bold.otf: TeX Gyre Heros:style=Bold
# /usr/share/fonts/truetype/roboto/unhinted/RobotoCondensed-MediumItalic.ttf: Roboto Condensed
# /usr/share/fonts/opentype/urw-base35/NimbusSansNarrow-Bold.otf: Nimbus Sans Narrow:style=Bold
# /usr/share/fonts/opentype/urw-base35/URWBookman-DemiItalic.otf: URW Bookman:style=Demi Italic
# /usr/share/fonts/opentype/urw-base35/URWGothic-BookOblique.otf: URW Gothic:style=Book Oblique
# /usr/share/fonts/type1/gsfonts/b018035l.pfb: URW Bookman L:style=Demi Bold Italic
# /usr/share/fonts/type1/gsfonts/c059033l.pfb: Century Schoolbook L:style=Italic
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-Medium.ttf: Roboto
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrepagella-regular.otf: TeX Gyre Pagella:style=Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrecursor-regular.otf: TeX Gyre Cursor:style=Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrebonum-regular.otf: TeX Gyre Bonum:style=Regular
# /usr/share/fonts/type1/urw-base35/Z003-MediumItalic.t1: Z003:style=Medium Italic
# /usr/share/fonts/type1/urw-base35/P052-BoldItalic.t1: P052:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/C059-Italic.t1: C059:style=Italic
# /usr/share/fonts/type1/gsfonts/a010035l.pfb: URW Gothic L:style=Demi Oblique
# /usr/share/fonts/type1/urw-base35/P052-Roman.t1: P052:style=Roman
# /usr/share/fonts/type1/urw-base35/NimbusRoman-Bold.t1: Nimbus Roman:style=Bold
# /usr/share/fonts/type1/urw-base35/NimbusSansNarrow-Oblique.t1: Nimbus Sans Narrow:style=Oblique
# /usr/share/fonts/opentype/urw-base35/P052-BoldItalic.otf: P052:style=Bold Italic
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-Bold.ttf: Roboto:style=Bold
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreadventor-regular.otf: TeX Gyre Adventor:style=Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrepagella-bold.otf: TeX Gyre Pagella:style=Bold
# /usr/share/fonts/type1/urw-base35/D050000L.t1: D050000L:style=Regular
# /usr/share/fonts/opentype/urw-base35/StandardSymbolsPS.otf: Standard Symbols PS:style=Regular
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-Black.ttf: Roboto
# /usr/share/fonts/type1/gsfonts/n019023l.pfb: Nimbus Sans L:style=Regular Italic
# /usr/share/fonts/type1/gsfonts/b018012l.pfb: URW Bookman L:style=Light
# /usr/share/fonts/truetype/naver-d2coding/D2Coding-Ver1.3.2-20180524-all.ttc: D2Coding ligature:style=Bold
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreheros-italic.otf: TeX Gyre Heros:style=Italic
# /usr/share/fonts/type1/urw-base35/URWGothic-Demi.t1: URW Gothic:style=Demi
# /usr/share/fonts/type1/urw-base35/NimbusSans-Italic.t1: Nimbus Sans:style=Italic
# /usr/share/fonts/type1/urw-base35/C059-BdIta.t1: C059:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/NimbusMonoPS-Bold.t1: Nimbus Mono PS:style=Bold
# /usr/share/fonts/type1/gsfonts/c059016l.pfb: Century Schoolbook L:style=Bold
# /usr/share/fonts/type1/gsfonts/n022004l.pfb: Nimbus Mono L:style=Bold
# /usr/share/fonts/type1/gsfonts/n019024l.pfb: Nimbus Sans L:style=Bold Italic
# /usr/share/texmf/fonts/opentype/public/tex-gyre-math/texgyredejavu-math.otf: TeX Gyre DejaVu Math:style=Regular
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreschola-italic.otf: TeX Gyre Schola:style=Italic
# /usr/share/fonts/type1/gsfonts/b018032l.pfb: URW Bookman L:style=Light Italic
# /usr/share/fonts/type1/gsfonts/p052003l.pfb: URW Palladio L:style=Roman
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreheros-bolditalic.otf: TeX Gyre Heros:style=Bold Italic
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-Light.ttf: Roboto
# /usr/share/fonts/opentype/urw-base35/URWGothic-DemiOblique.otf: URW Gothic:style=Demi Oblique
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreschola-bold.otf: TeX Gyre Schola:style=Bold
# /usr/share/fonts/type1/urw-base35/P052-Bold.t1: P052:style=Bold
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyreheroscn-regular.otf: TeX Gyre Heros Cn:style=Regular
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-Regular.ttf: Roboto:style=Regular
# /usr/share/fonts/type1/gsfonts/n019004l.pfb: Nimbus Sans L:style=Bold
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyretermes-regular.otf: TeX Gyre Termes:style=Regular
# /usr/share/fonts/type1/gsfonts/b018015l.pfb: URW Bookman L:style=Demi Bold
# /usr/share/fonts/type1/gsfonts/n022024l.pfb: Nimbus Mono L:style=Bold Oblique
# /usr/share/fonts/type1/urw-base35/P052-Italic.t1: P052:style=Italic
# /usr/share/fonts/type1/urw-base35/NimbusSansNarrow-Regular.t1: Nimbus Sans Narrow:style=Regular
# /usr/share/fonts/truetype/roboto/unhinted/RobotoTTF/Roboto-BoldItalic.ttf: Roboto:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/C059-Bold.t1: C059:style=Bold
# /usr/share/fonts/truetype/roboto/unhinted/RobotoCondensed-Regular.ttf: Roboto Condensed:style=Regular
# /usr/share/fonts/type1/gsfonts/c059036l.pfb: Century Schoolbook L:style=Bold Italic
# /usr/share/fonts/type1/gsfonts/p052024l.pfb: URW Palladio L:style=Bold Italic
# /usr/share/fonts/type1/urw-base35/URWBookman-Light.t1: URW Bookman:style=Light
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyretermes-bold.otf: TeX Gyre Termes:style=Bold
# /usr/share/fonts/opentype/urw-base35/P052-Roman.otf: P052:style=Roman
# /usr/share/texmf/fonts/opentype/public/tex-gyre/texgyrebonum-italic.otf: TeX Gyre Bonum:style=Italic
# /usr/share/fonts/opentype/urw-base35/C059-Bold.otf: C059:style=Bold
# /usr/share/fonts/opentype/urw-base35/P052-Bold.otf: P052:style=Bold
# /usr/share/fonts/opentype/urw-base35/NimbusRoman-Italic.otf: Nimbus Roman:style=Italic
# /usr/share/fonts/type1/gsfonts/n019003l.pfb: Nimbus Sans L:style=Regular



#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  



fc-list | grep -i 'Roboto Condensed'
fc-list | grep -i 'Roboto Serif'
fc-list | grep -i 'Cascadia Code Semibold'
fc-list | grep -i 'NanumMyeongjo'
fc-list | grep -i 'NanumGothic'
fc-list | grep -i 'D2Coding'

apt-get update
apt-get install -y fonts-roboto
apt-get install -y fonts-cascadia-code
apt-get install -y fonts-nanum

wget https://github.com/naver/d2codingfont/releases/download/VER1.3.2/D2Coding-Ver1.3.2-20180524.zip
unzip D2Coding-Ver1.3.2-20180524.zip -d /usr/share/fonts/truetype/d2coding
fc-cache -f -v

fc-list | grep -i 'Roboto Condensed'
fc-list | grep -i 'Roboto Serif'
fc-list | grep -i 'Cascadia Code Semibold'
fc-list | grep -i 'NanumMyeongjo'
fc-list | grep -i 'NanumGothic'
fc-list | grep -i 'D2Coding'


# Function to generate a PDF with a specified font family
generate_pdf_with_font <- function(font_family, filename) {
  pdf(filename, family = font_family)
  plot(1:10, main = paste("Sample Plot with", font_family, "Font"))
  dev.off()
}

# List of fonts to try
font_families <- c("Roboto Condensed", "Roboto Serif", "Cascadia Code", "NanumMyeongjo", "NanumGothic", "D2Coding")

# Generate PDFs with different fonts
for (font_family in font_families) {
  generate_pdf_with_font(font_family, paste0("plot_", gsub(" ", "_", font_family), ".pdf"))
}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#!/bin/bash

# Function to check if a font is installed
check_font() {
  fc-list | grep -i "$1" > /dev/null
  if [ $? -eq 0 ]; then
    echo "$1 is already installed."
  else
    echo "$1 is not installed."
    return 1
  fi
}

# List of fonts to check
fonts_to_check=(
  "Roboto Condensed"
  "Roboto Serif"
  "Cascadia Code Semibold"
  "NanumMyeongjo"
  "NanumGothic"
  "D2Coding"
)

# Update package lists
apt-get update

# Check and install missing fonts
for font in "${fonts_to_check[@]}"; do
  if ! check_font "$font"; then
    case "$font" in
      "Roboto Condensed"|"Roboto Serif")
        apt-get install -y fonts-roboto
        ;;
      "Cascadia Code Semibold")
        apt-get install -y fonts-cascadia-code
        ;;
      "NanumMyeongjo"|"NanumGothic")
        apt-get install -y fonts-nanum
        ;;
      "D2Coding")
        wget https://github.com/naver/d2codingfont/releases/download/VER1.3.2/D2Coding-Ver1.3.2-20180524.zip
        unzip D2Coding-Ver1.3.2-20180524.zip -d /usr/share/fonts/truetype/d2coding
        fc-cache -f -v
        rm D2Coding-Ver1.3.2-20180524.zip
        ;;
    esac
  fi
done

# Recheck fonts to verify installation
for font in "${fonts_to_check[@]}"; do
  check_font "$font"
done

echo "Font check and installation script completed."

#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
chmod +x check_and_install_fonts.sh

docker exec -it rstudio_server bash
./check_and_install_fonts.sh

#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  


# Define a function to check if a font is installed
check_font_installed <- function(font_name) {
  result <- system(paste("fc-list | grep -i", shQuote(font_name)), intern = TRUE)
  return(length(result) > 0)
}


fonts_to_check <- c("Roboto Condensed", "Roboto Serif", "Cascadia Code Semibold", 
                    "NanumMyeongjo", "NanumGothic", "D2Coding")
for (font in fonts_to_check) {
  if (check_font_installed(font)) {
    message(font, " is successfully installed.")
  } else {
    message(font, " is still not installed. Please check manually.")
  }
}
# Roboto Condensed is successfully installed.
# Roboto Serif is still not installed. Please check manually.
# Cascadia Code Semibold is still not installed. Please check manually.
# NanumMyeongjo is still not installed. Please check manually.
# NanumGothic is still not installed. Please check manually.
# D2Coding is successfully installed.
# Warning messages:
# 1: In system(paste("fc-list | grep -i", shQuote(font_name)), intern = TRUE) :
#   running command 'fc-list | grep -i 'Roboto Serif'' had status 1
# 2: In system(paste("fc-list | grep -i", shQuote(font_name)), intern = TRUE) :
#   running command 'fc-list | grep -i 'Cascadia Code Semibold'' had status 1
# 3: In system(paste("fc-list | grep -i", shQuote(font_name)), intern = TRUE) :
#   running command 'fc-list | grep -i 'NanumMyeongjo'' had status 1
# 4: In system(paste("fc-list | grep -i", shQuote(font_name)), intern = TRUE) :
#   running command 'fc-list | grep -i 'NanumGothic'' had status 1


# Define a function to install fonts if they are not installed
install_missing_fonts <- function(fonts_to_check) {
  for (font in fonts_to_check) {
    if (!check_font_installed(font)) {
      message(font, " is not installed. Installing...")
      if (font %in% c("Roboto Condensed", "Roboto Serif")) {
        system("apt-get update && apt-get install -y fonts-roboto")
      } else if (font == "Cascadia Code Semibold") {
        system("apt-get update && apt-get install -y fonts-cascadia-code")
      } else if (font %in% c("NanumMyeongjo", "NanumGothic")) {
        system("apt-get update && apt-get install -y fonts-nanum")
      } else if (font == "D2Coding") {
        system("wget https://github.com/naver/d2codingfont/releases/download/VER1.3.2/D2Coding-Ver1.3.2-20180524.zip")
        system("unzip D2Coding-Ver1.3.2-20180524.zip -d /usr/share/fonts/truetype/d2coding")
        system("fc-cache -f -v")
        system("rm D2Coding-Ver1.3.2-20180524.zip")
      }
    } else {
      message(font, " is already installed.")
    }
  }
}

# Execute the font installation check
install_missing_fonts(c("Roboto Condensed", "Roboto Serif", "Cascadia Code Semibold", 
                      "NanumMyeongjo", "NanumGothic", "D2Coding"))
# > # Execute the font installation check
# > install_missing_fonts(c("Roboto Condensed", "Roboto Serif", "Cascadia Code Semibold", 
# +                       "NanumMyeongjo", "NanumGothic", "D2Coding"))
# Roboto Condensed is already installed.
# Roboto Serif is not installed. Installing...
# Reading package lists...
# E: Could not open lock file /var/lib/apt/lists/lock - open (13: Permission denied)
# E: Unable to lock directory /var/lib/apt/lists/
# Cascadia Code Semibold is not installed. Installing...
# Reading package lists...
# E: Could not open lock file /var/lib/apt/lists/lock - open (13: Permission denied)
# E: Unable to lock directory /var/lib/apt/lists/
# NanumMyeongjo is not installed. Installing...
# Reading package lists...
# E: Could not open lock file /var/lib/apt/lists/lock - open (13: Permission denied)
# E: Unable to lock directory /var/lib/apt/lists/
# NanumGothic is not installed. Installing...
# Reading package lists...
# E: Could not open lock file /var/lib/apt/lists/lock - open (13: Permission denied)
# E: Unable to lock directory /var/lib/apt/lists/
# D2Coding is already installed.
# Warning messages:
# 1: In system(paste("fc-list | grep -i", shQuote(font_name)), intern = TRUE) :
#   running command 'fc-list | grep -i 'Roboto Serif'' had status 1
# 2: In system(paste("fc-list | grep -i", shQuote(font_name)), intern = TRUE) :
#   running command 'fc-list | grep -i 'Cascadia Code Semibold'' had status 1
# 3: In system(paste("fc-list | grep -i", shQuote(font_name)), intern = TRUE) :
#   running command 'fc-list | grep -i 'NanumMyeongjo'' had status 1
# 4: In system(paste("fc-list | grep -i", shQuote(font_name)), intern = TRUE) :
#   running command 'fc-list | grep -i 'NanumGothic'' had status 1
# Recheck the fonts to confirm installation


fonts_to_check <- c("Roboto Condensed", "Roboto Serif", "Cascadia Code Semibold", 
                    "NanumMyeongjo", "NanumGothic", "D2Coding")
for (font in fonts_to_check) {
  if (check_font_installed(font)) {
    message(font, " is successfully installed.")
  } else {
    message(font, " is still not installed. Please check manually.")
  }
}
# Roboto Condensed is successfully installed.
# Roboto Serif is still not installed. Please check manually.
# Cascadia Code Semibold is still not installed. Please check manually.
# NanumMyeongjo is still not installed. Please check manually.
# NanumGothic is still not installed. Please check manually.
# D2Coding is successfully installed.
# Warning messages:
# 1: In system(paste("fc-list | grep -i", shQuote(font_name)), intern = TRUE) :
#   running command 'fc-list | grep -i 'Roboto Serif'' had status 1
# 2: In system(paste("fc-list | grep -i", shQuote(font_name)), intern = TRUE) :
#   running command 'fc-list | grep -i 'Cascadia Code Semibold'' had status 1
# 3: In system(paste("fc-list | grep -i", shQuote(font_name)), intern = TRUE) :
#   running command 'fc-list | grep -i 'NanumMyeongjo'' had status 1
# 4: In system(paste("fc-list | grep -i", shQuote(font_name)), intern = TRUE) :
#   running command 'fc-list | grep -i 'NanumGothic'' had status 1













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


