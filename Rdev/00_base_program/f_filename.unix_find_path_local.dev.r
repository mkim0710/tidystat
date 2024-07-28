# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_font_regex_perl.search_TeXLiveDB.dev.r
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  ;  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  ;  
#!/bin/bash
# https://github.com/mkim0710/tidystat/blob/master/Rdev/00_base_program/f_filename.unix_find_path_local.dev.r
## Ctrl+Alt+Enter @ Rstudio
whoami
echo $PATH 
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
sudo find / -type d -name texlive 
sudo find / -type d -name texmf-dist 
sudo find /usr/local/texlive -type d -name fonts
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  ;  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  ;  
### if(.Platform$OS.type == "unix")  -----
'whoami' |> system(intern = TRUE)
'echo $PATH' |> system(intern = TRUE) 
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
'sudo find / -type d -name texlive' |> system(intern = TRUE) 
'sudo find / -type d -name texmf-dist' |> system(intern = TRUE) 
'sudo find /usr/local/texlive -type d -name fonts' |> system(intern = TRUE) |> env1$f_vec.dput_line_by_line()
c("/usr/local/texlive/texmf-dist/tex/context/fonts",
  "/usr/local/texlive/texmf-dist/metapost/context/fonts",
  "/usr/local/texlive/texmf-dist/fonts")
dir("/usr/local/texlive")
dir("/usr/local/texlive/bin")
dir("/usr/local/texlive/tlpkg/tlpobj")
dir("/usr/local/texlive/texmf-dist")
dir("/usr/local/texlive/texmf-dist/fonts")
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
### \% f_filename.unix_find_path_local ====
f_filename.unix_find_path_local <- function(filename) {
    vec_path.file <- paste0('sudo find / -type f -iname "*',filename,'*"') |> system(intern = TRUE)
    vec_path = vec_path.file |> dirname() |> unique() |> sort()
    vec_path = vec_path[vec_path != "."]
    if (length(vec_path) > 0) {
        return(vec_path)
    } else {
        return(NULL)
    }
}
"roboto" |> f_filename.unix_find_path_local() |> env1$f_vec.dput_line_by_line()
c("/usr/local/lib/R/library/grDevices/fonts/Roboto",
  "/usr/local/lib/R/site-library/rmarkdown/rmd/h/bootstrap/css/fonts",
  "/usr/share/fonts/truetype/roboto/unhinted",
  "/usr/share/fonts/truetype/roboto/unhinted/RobotoTTF",
  "/usr/share/lintian/overrides",
  "/var/lib/dpkg/info")
c("/usr/local/lib/R/library/grDevices/fonts/Roboto",
  "/usr/local/lib/R/site-library/rmarkdown/rmd/h/bootstrap/css/fonts",
  "/usr/local/texlive/texmf-dist/fonts/map/dvips/roboto",
  "/usr/local/texlive/texmf-dist/fonts/opentype/google/roboto",
  "/usr/local/texlive/texmf-dist/fonts/tfm/google/roboto",
  "/usr/local/texlive/texmf-dist/fonts/type1/google/roboto",
  "/usr/local/texlive/texmf-dist/fonts/vf/google/roboto",
  "/usr/local/texlive/texmf-dist/tex/latex/roboto",
  "/usr/local/texlive/tlpkg/tlpobj",
  "/usr/share/fonts/truetype/roboto/unhinted",
  "/usr/share/fonts/truetype/roboto/unhinted/RobotoTTF",
  "/usr/share/lintian/overrides",
  "/var/lib/dpkg/info")
"lmodern" |> f_filename.unix_find_path_local() |> env1$f_vec.dput_line_by_line()
c("/etc/fonts/conf.avail",
  "/etc/X11/fonts/Type1",
  "/usr/local/texlive/texmf-dist/tex/latex/lm",
  "/var/lib/dpkg/info")
"serif" |> f_filename.unix_find_path_local() |> env1$f_vec.dput_line_by_line()
c("/etc/fonts/conf.avail",
  "/usr/lib/rstudio-server/bin/quarto/share/formats/revealjs/reveal/css/theme/source",
  "/usr/lib/rstudio-server/bin/quarto/share/formats/revealjs/themes",
  "/usr/lib/rstudio-server/resources/mathjax-27/extensions/a11y/mathmaps/en/symbols",
  "/usr/lib/rstudio-server/resources/mathjax-27/extensions/a11y/mathmaps/es/symbols",
  "/usr/lib/rstudio-server/resources/mathjax-27/fonts/HTML-CSS/TeX/otf",
  "/usr/lib/rstudio-server/resources/mathjax-27/jax/output/CommonHTML/fonts/TeX",
  "/usr/local/lib/R/doc/html/katex/fonts")
c("/etc/fonts/conf.avail",
  "/usr/lib/rstudio-server/bin/quarto/share/formats/revealjs/reveal/css/theme/source",
  "/usr/lib/rstudio-server/bin/quarto/share/formats/revealjs/themes",
  "/usr/lib/rstudio-server/resources/mathjax-27/extensions/a11y/mathmaps/en/symbols",
  "/usr/lib/rstudio-server/resources/mathjax-27/extensions/a11y/mathmaps/es/symbols",
  "/usr/lib/rstudio-server/resources/mathjax-27/fonts/HTML-CSS/TeX/otf",
  "/usr/lib/rstudio-server/resources/mathjax-27/jax/output/CommonHTML/fonts/TeX",
  "/usr/local/lib/R/doc/html/katex/fonts",
  "/usr/local/texlive/texmf-dist/fonts/opentype/google/roboto",
  "/usr/local/texlive/texmf-dist/fonts/tfm/google/roboto",
  "/usr/local/texlive/texmf-dist/fonts/type1/google/roboto",
  "/usr/local/texlive/texmf-dist/fonts/vf/google/roboto",
  "/usr/local/texlive/texmf-dist/tex/latex/roboto")

