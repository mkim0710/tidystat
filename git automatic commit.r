# git automatic commit.r
# # To paste text in the terminal use Shift + Insert.

system("git pull")
system("git add .")
system('git commit -m "automatic commit using system()"')
system("git push")


# # https://stackoverflow.com/questions/22135465/cant-commit-after-starting-a-merge-in-sourcetree/22135512#22135512
# # Do a git commit -a once you have resolved the conflicts. This is the last step when you are merging conflicts.
# 
# system('git commit -a')

# Caution) do not forget to add .gitignore to .gitignore
