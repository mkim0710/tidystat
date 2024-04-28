# git merge conflicts.r
# # To paste text in the terminal use Shift + Insert.

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



# https://stackoverflow.com/questions/1146973/how-do-i-revert-all-local-changes-in-git-managed-project-to-previous-state
# If you want to revert changes made to your working copy, do this:
# git checkout .
# 
# If you want to revert changes made to the index (i.e., that you have added), do this. Warning this will reset all of your unpushed commits to master!:
# git reset
# 
# If you want to revert a change that you have committed, do this:
# git revert <commit 1> <commit 2>
# 
# If you want to remove untracked files (e.g., new files, generated files):
# git clean -f
# 
# Or untracked directories (e.g., new or automatically generated directories):
# git clean -fd



# ????? -----
# https://stackoverflow.com/questions/4318161/can-git-pull-all-update-all-my-local-branches
# git fetch --all
# git rebase origin/master
# git checkout staging
# git rebase origin/staging
# git checkout production
# git rebase origin/production







# https://docs.gitlab.com/ee/topics/git/numerous_undo_possibilities_in_git/
# At this point there are 3 options to undo the local changes you have:
# 
# Discard all local changes, but save them for possible re-use later:
# git stash
# 
# Discarding local changes (permanently) to a file:
# git checkout -- <file>
# 
# Discard all local changes to all files permanently:
# git reset --hard
# 
# Before executing git reset --hard, keep in mind that there is also a way to just temporary store the changes without committing them using git stash. This command resets the changes to all files, but it also saves them in case you would like to apply them at some later time. You can read more about it in section below.



# ????? ------
# # https://stackoverflow.com/questions/22135465/cant-commit-after-starting-a-merge-in-sourcetree/22135512#22135512
# # Do a git commit -a once you have resolved the conflicts. This is the last step when you are merging conflicts.
# 
# system('git commit -a')



