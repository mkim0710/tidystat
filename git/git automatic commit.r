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

    
#@ https://chatgpt.com/c/b244f16e-295a-4f40-b6ea-62cb774c3462


f_git.01_start.pull = function(intern = TRUE) {
    # 1. Start of Day - Sync with Remote Repository: git pull at the beginning of everyday work
    out.list = list()
    # system("git status") 
    Text4SystemCommand = "git status"; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))
    # system("git pull") # Simple merge. Integrates changes from the upstream branch of the currently checked out branch, assuming it's properly set up with an upstream link.
    Text4SystemCommand = "git pull"; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))  # Simple merge. Integrates changes from the upstream branch of the currently checked out branch, assuming it's properly set up with an upstream link.
    # # system("git pull origin") # Simple merge. Fetches from the origin remote and merges changes based on the currently checked out branch’s tracking configuration, still somewhat dependent on proper setup.
    # # system("git pull origin master") # Simple merge. Explicitly pulls and merges changes from the master branch of the origin remote into your current branch, used for direct control over the sources of changes you are integrating.
    # # system("git status") 
    out.list
}

f_git.02_interim.fetch_add_commit = function(intern = TRUE) {
    # 2. Before Making Commits - Stay Updated About Remote Changes: git fetch before any of my git commit
    out.list = list()
    # system("git status") 
    Text4SystemCommand = "git status"; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))
    # system("git fetch")  # Before Making Commits - Stay Updated About Remote Changes. Fetches updates for all branches from the default remote, updating remote-tracking branches.
    Text4SystemCommand = "git fetch"; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))  # Before Making Commits - Stay Updated About Remote Changes. Fetches updates for all branches from the default remote, updating remote-tracking branches. 
    # # system('git fetch origin') # Specifically fetches all data from the origin remote, updating the associated remote-tracking branches.
    # # system('git fetch origin master') # Specifically fetches updates from the master branch of the origin remote, updating only the origin/master remote-tracking branch.
    # system("git add .")
    Text4SystemCommand = "git add ."; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))
    # system('git commit -m "automatic commit using system()"')
    Text4SystemCommand = 'git commit -m "automatic commit using system()"'; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))
    # # system("git status") 
    out.list
}


f_git.03_final.pull_rebase_push = function(intern = TRUE) {
    # 3. Before Pushing Changes - Final Sync and Merge/Rebase: git pull before any of my push
    out.list = list()
    # system("git status") 
    Text4SystemCommand = "git status"; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))
    # # system("git pull --ff-only origin master") # If your branch can be fast-forwarded
    # # system("git pull --rebase origin master") # If you want to maintain a linear project history by replaying your changes on top of the fetched changes
    # system("git pull --rebase") # If you want to maintain a linear project history by replaying your changes on top of the fetched changes
    Text4SystemCommand = "git pull --rebase"; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))
    # # system("git config --global push.default simple") # simple (default in Git 2.0 and later): Pushes the current branch to its upstream branch, but only if the branch names match, and it refuses to push if the upstream branch does not already exist.
    # # system("git config --global push.default matching") # matching (default prior to Git 2.0): Pushes branches to the remote branches with the same name. 
    # # system("git config --global push.default current") # Pushes the current branch to the remote branch of the same name.
    # # system("git config --global push.default upstream") # Pushes the current branch to its upstream branch.
    # # system("git config --global push.default nothing") # Disables automatic pushing. This requires a branch to be explicitly specified.
    # system("git push") # Pushes branches based on the configuration of push.default. It is context-sensitive and relies on previous setup or defaults.
    Text4SystemCommand = "git push"; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))
    # # system("git push origin") # Pushes to the origin remote, relying on push.default for branch specifics.
    # # system("git push origin master") # Explicitly pushes the local master branch to the master branch at the origin remote, useful for precise control over what is being pushed and where.
    # system("git status") 
    # Text4SystemCommand = "git status"; out.list[Text4SystemCommand] = list(system(Text4SystemCommand, intern = intern))
    out.list
}



# if (file.exists(".git")) {
#     message("Git repository detected. Checking status and pulling latest changes...")
#     out.list = list()
#     out.list$`f_git.01_start.pull` = f_git.01_start.pull(intern = TRUE)
#     out.list$`f_git.02_interim.fetch_add_commit` = f_git.02_interim.fetch_add_commit(intern = TRUE)
#     out.list$`f_git.03_final.pull_rebase_push` = f_git.03_final.pull_rebase_push(intern = TRUE)
#     str(out.list)
# } else {
#     message("No Git repository detected in the current project.")
# }
if (file.exists(".git")) f_git.01_start.pull(intern = TRUE)
if (file.exists(".git")) f_git.02_interim.fetch_add_commit(intern = TRUE)
if (file.exists(".git")) f_git.03_final.pull_rebase_push(intern = TRUE)
    
# if (file.exists(".git")) {
#     message("Git repository detected. Checking status and pulling latest changes...")
#     tryCatch({
#         out.list = list()
#         out.list$`01_start.pull` <- f_git.01_start.pull(intern = TRUE))
#         out.list$`02_interim.fetch_add_commit` <- f_git.02_interim.fetch_add_commit(intern = TRUE))
#         out.list$`03_final.pull_rebase_push` <- f_git.03_final.pull_rebase_push(intern = TRUE))
#         if (length(grep("Already up to date.", unlist(out.list$`01_start.pull`))) == 0) {
#             message("New changes pulled from Git.")
#         } else {
#             message("Already up to date.")
#         }
#     }, error = function(e) {
#         message("Failed to run Git commands: ", e$message)
#     })
# } else {
#     message("No Git repository detected in the current project.")
# }


# Caution) do not forget to add .gitignore to .gitignore

