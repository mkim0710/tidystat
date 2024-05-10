# git automatic commit.r
# # To paste text in the terminal use Shift + Insert. (Or Ctrl + Shift + v)


# if (Sys.getenv("USE_GIT") == "TRUE") {
#     message("Checking Git status and pulling latest changes...")
#     env.custom$info$git_status <- list()
#     env.custom$info$git_status[[Sys.Date()]] <- system("git status", intern = TRUE)
#     result <- system("git pull", intern = TRUE)
#     if (length(grep("Already up to date.", result)) == 0) {
#         message("New changes pulled from Git.")
#     } else {
#         message("Already up to date.")
#     }
# }


if (file.exists(".git")) {
    message("Git repository detected. Checking status and pulling latest changes...")
    tryCatch({
        git_status <- system("git status", intern = TRUE)
        git_pull_result <- system("git pull", intern = TRUE)
        if (length(grep("Already up to date.", git_pull_result)) == 0) {
            message("New changes pulled from Git.")
        } else {
            message("Already up to date.")
        }
    }, error = function(e) {
        message("Failed to run Git commands: ", e$message)
    })
} else {
    message("No Git repository detected in the current project.")
}

    
#@ https://chatgpt.com/c/b244f16e-295a-4f40-b6ea-62cb774c3462

# 1. Start of Day - Sync with Remote Repository: git pull at the beginning of everyday work
system("git status")
system("git pull") # Simple merge. Integrates changes from the upstream branch of the currently checked out branch, assuming it's properly set up with an upstream link.
# system("git pull origin") # Simple merge. Fetches from the origin remote and merges changes based on the currently checked out branch’s tracking configuration, still somewhat dependent on proper setup.
# system("git pull origin master") # Simple merge. Explicitly pulls and merges changes from the master branch of the origin remote into your current branch, used for direct control over the sources of changes you are integrating.
# system("git status") 

# 2. Before Making Commits - Stay Updated About Remote Changes: git fetch before any of my git commit
system("git status") 
system("git add .")
system("git fetch") # Before Making Commits - Stay Updated About Remote Changes. Fetches updates for all branches from the default remote, updating remote-tracking branches.
# system('git fetch origin') # Specifically fetches all data from the origin remote, updating the associated remote-tracking branches.
# system('git fetch origin master') # Specifically fetches updates from the master branch of the origin remote, updating only the origin/master remote-tracking branch.
system('git commit -m "automatic commit using system()"')
# system("git status") 

# 3. Before Pushing Changes - Final Sync and Merge/Rebase: git pull before any of my push
system("git status") 
# system("git pull --ff-only origin master") # If your branch can be fast-forwarded
# system("git pull --rebase origin master") # If you want to maintain a linear project history by replaying your changes on top of the fetched changes
system("git pull --rebase") # If you want to maintain a linear project history by replaying your changes on top of the fetched changes
# system("git config --global push.default simple") # simple (default in Git 2.0 and later): Pushes the current branch to its upstream branch, but only if the branch names match, and it refuses to push if the upstream branch does not already exist.
# system("git config --global push.default matching") # matching (default prior to Git 2.0): Pushes branches to the remote branches with the same name. 
# system("git config --global push.default current") # Pushes the current branch to the remote branch of the same name.
# system("git config --global push.default upstream") # Pushes the current branch to its upstream branch.
# system("git config --global push.default nothing") # Disables automatic pushing. This requires a branch to be explicitly specified.
system("git push") # Pushes branches based on the configuration of push.default. It is context-sensitive and relies on previous setup or defaults.
# system("git push origin") # Pushes to the origin remote, relying on push.default for branch specifics.
# system("git push origin master") # Explicitly pushes the local master branch to the master branch at the origin remote, useful for precise control over what is being pushed and where.
system("git status") 



# Caution) do not forget to add .gitignore to .gitignore

