# https://code.visualstudio.com/docs/languages/r
for(.tmp$packagename in c("languageserver")) {if(!require(.tmp$packagename,character.only=TRUE))install.packages(.tmp$packagename) else library(.tmp$packagename,character.only=TRUE)}

# https://renkun.me/2020/06/16/using-httpgd-in-vscode-a-web-based-svg-graphics-device/
for(.tmp$packagename in c("httpgd")) {if(!require(.tmp$packagename,character.only=TRUE))install.packages(.tmp$packagename) else library(.tmp$packagename,character.only=TRUE)}



