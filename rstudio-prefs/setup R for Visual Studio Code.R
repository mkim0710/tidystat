# https://code.visualstudio.com/docs/languages/r
for(.packagename in c("languageserver")) {if(!require(.packagename,character.only=TRUE)) install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}

# https://renkun.me/2020/06/16/using-httpgd-in-vscode-a-web-based-svg-graphics-device/
for(.packagename in c("httpgd")) {if(!require(.packagename,character.only=TRUE)) install.packages(.packagename)  ;  library(.packagename,character.only=TRUE)}



