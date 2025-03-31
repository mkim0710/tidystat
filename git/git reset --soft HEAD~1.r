
# https://chatgpt.com/c/d1690614-64a0-4cf3-8e0e-879c3816a96b

# HEAD
# HEAD is a reference to the current commit, the snapshot of the repository that your working directory is based on. It points to the latest commit on the currently checked-out branch. Essentially, HEAD is what Git considers to be the current state of the repository.
# 
# HEAD~1
# HEAD~1 refers to the commit immediately before the current HEAD. The tilde (~) followed by a number indicates the number of commits to go back from HEAD


# To cancel the last commit in Git, you can use the following commands depending on your specific needs:
# 
# 1. Undo the last commit but keep the changes:
# If you want to undo the last commit but keep the changes in your working directory, use:
# 
# bash
# Copy code
# git reset --soft HEAD~1


# 2. Undo the last commit and discard the changes:
# If you want to undo the last commit and discard the changes, use:
# 
# bash
# Copy code
# git reset --hard HEAD~1


# 3. Undo the last commit and keep changes in the staging area:
# If you want to undo the last commit and keep the changes in the staging area (index), use:
# 
# bash
# Copy code
# git reset --mixed HEAD~1


# 4. Revert a commit (create a new commit that undoes the changes):
# If the commit has already been pushed and you need to create a new commit that undoes the changes made by the last commit, use:
# 
# bash
# Copy code
# git revert HEAD
# These commands will help you manage the last commit according to your requirements.

'git reset --soft HEAD~1' |> system(intern=TRUE) |> cat(sep='\n')



'git status' |> system(intern=TRUE) |> cat(sep='\n')
# > 'git status' |> system(intern=TRUE) |> cat(sep='\n')
# On branch master
# Your branch and 'origin/master' have diverged,
# and have 1 and 41 different commits each, respectively.
#   (use "git pull" to merge the remote branch into yours)
# 
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git restore <file>..." to discard changes in working directory)
# 	modified:   git/git reset --soft HEAD~1.r
# 	modified:   rstudio-prefs/templates/default.R
# 
# no changes added to commit (use "git add" and/or "git commit -a")




# Checking FileNames of staged changes:
# git diff --cached --name-only
'git diff --cached --name-only' |> system(intern=TRUE) |> cat(sep='\n')
# Nothing


# Checking FileNames of unstaged changes:
# git diff --name-only
'git diff --name-only' |> system(intern=TRUE) |> cat(sep='\n')
# > 'git diff --name-only' |> system(intern=TRUE) |> cat(sep='\n')
# git/git reset --soft HEAD~1.r
# rstudio-prefs/templates/default.R



# 1. To discard changes to a specific file:
# git checkout -- <file>

# 2. To discard changes to all unstaged files:
# git checkout -- .

'git checkout -- rstudio-prefs/templates/default.R' |> system(intern=TRUE) |> cat(sep='\n')





