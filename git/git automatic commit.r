# git automatic commit.r
# # To paste text in the terminal use Shift + Insert.

system("git status")
system("git pull")
system("git add .")
system('git commit -m "automatic commit using system()"')
system("git config --global push.default simple")
system("git push")
# system("git status")

# system("git fetch")







# Caution) do not forget to add .gitignore to .gitignore
