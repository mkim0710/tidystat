
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


