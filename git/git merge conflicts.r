# git merge conflicts.r
# # To paste text in the terminal use Shift + Insert. (Or Ctrl + Shift + v)



# https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/resolving-a-merge-conflict-using-the-command-line
# 5. To see the beginning of the merge conflict in your file, search the file for the conflict marker <#<<<<<<. 
# When you open the file in your text editor, you'll see the changes from the HEAD or base branch after the line <<<<<<< HEAD. 
# Next, you'll see =======, which divides your changes from the changes in the other branch, followed by >>>>>>> BRANCH-NAME. 
# 
# In this example, one person wrote "open an issue" in the base or HEAD branch and another person wrote "ask your question in IRC" in the compare branch or branch-a.
# 
# If you have questions, please
# <#<<<<<< HEAD
# open an issue
# =======  
# ask your question in IRC.
# >#>>>>>> branch-a
# 
# 6. Decide if you want to keep only your branch's changes, keep only the other branch's changes, or make a brand new change, which may incorporate changes from both branches. 
# Delete the conflict markers <<<<<<<, =======, >>>>>>> and make the changes you want in the final merge. 
# 
# 
# 7. Add or stage your changes.
# $ git add .
# 
# 8. Commit your changes with a comment.
# $ git commit -m "Resolved merge conflict by incorporating both suggestions."





# ????? -----  
# https://stackoverflow.com/questions/4318161/can-git-pull-all-update-all-my-local-branches
# git fetch --all
# git rebase origin/master
# git checkout staging
# git rebase origin/staging
# git checkout production
# git rebase origin/production


system("git fetch") # Before Making Commits - Stay Updated About Remote Changes. Fetches updates for all branches from the default remote, updating remote-tracking branches.
# system('git fetch origin') # Specifically fetches all data from the origin remote, updating the associated remote-tracking branches.
# system('git fetch origin master') # Specifically fetches updates from the master branch of the origin remote, updating only the origin/master remote-tracking branch.




# https://easyengine.io/tutorials/git/git-resolve-merge-conflicts/
# 
# cd project-folder
# grep -lr '<<<<<<<' .
# 
# git checkout --theirs PATH/FILE
# git checkout --ours PATH/FILE
# 
# grep -lr '<<<<<<<' . | xargs git checkout --theirs
# grep -lr '<<<<<<<' . | xargs git checkout --ours




# ????? ------  
# # https://stackoverflow.com/questions/22135465/cant-commit-after-starting-a-merge-in-sourcetree/22135512#22135512
# # Do a git commit -a once you have resolved the conflicts. This is the last step when you are merging conflicts.
# 
# system('git commit -a')



