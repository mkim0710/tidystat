# git reset --hard.r
# # To paste text in the terminal use Shift + Insert. (Or Ctrl + Shift + v)


## @ https://chatgpt.com/c/b244f16e-295a-4f40-b6ea-62cb774c3462  
system('git status')
system("git fetch") # Before Making Commits - Stay Updated About Remote Changes. Fetches updates for all branches from the default remote, updating remote-tracking branches.
# system('git fetch origin') # Specifically fetches all data from the origin remote, updating the associated remote-tracking branches.
# system('git fetch origin master') # Specifically fetches updates from the master branch of the origin remote, updating only the origin/master remote-tracking branch.
system('git stash')
# system('git reset --hard origin/master')
system('git status')



# https://stackoverflow.com/questions/1125968/how-do-i-force-git-pull-to-overwrite-local-files
# git fetch --all
# git reset --hard origin/master



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




# ????? -----  
# https://stackoverflow.com/questions/4318161/can-git-pull-all-update-all-my-local-branches
# git fetch --all
# git rebase origin/master
# git checkout staging
# git rebase origin/staging
# git checkout production
# git rebase origin/production




