which ssh
sudo apt-get update
sudo apt-get install openssh-client
git config --global core.sshCommand
git config --global core.sshCommand "ssh"
ssh -T git@github.com



##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### @ git remote set-url origin git@github.com:mkim0710/Rproject_.git ----  
git remote -v
# git.remote.v = "git remote -v" |> system(intern=TRUE)
# git.remote.v |> dput()
# c("origin\thttps://github.com/mkim0710/RprojectAgePeriodCohort.git (fetch)", 
#   "origin\thttps://github.com/mkim0710/RprojectAgePeriodCohort.git (push)")
# # > system("git remote -v")
# # origin	https://github.com/mkim0710/tidystat (fetch)
# # origin	https://github.com/mkim0710/tidystat (push)
# 
# git.remote.v2 = git.remote.v %>% str_replace("^origin\\t", "") %>% str_replace(" \\((fetch|push)\\)$", "") %>% 
#   str_replace("https://github.com/", "git@github.com:") |> unique()
# git.remote.v2
# # [1] "git@github.com:mkim0710/RprojectAgePeriodCohort.git"
# 
# # system("git remote set-url origin git@github.com:mkim0710/REPOSITORY.git")
# # system("git config remote.origin.url git@github.com:mkim0710/tidystat.git")
# paste0("git config remote.origin.url ", git.remote.v2) |> system(intern = TRUE)
# 
# system("git remote -v")
# # > system("git remote -v")
# # origin	git@github.com:mkim0710/tidystat.git (fetch)
# # origin	git@github.com:mkim0710/tidystat.git (push)


##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### @ install-git-hooks.sh ----  

chmod +x git/hooks/install-git-hooks.sh
./git/hooks/install-git-hooks.sh

##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
### @ git config --global pull.rebase false ----  

git config --global pull.rebase false
git config --global pull.rebase


##________________________________________________________________________________    
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
## @ git lfs install
sudo apt-get update
sudo apt-get install -y curl ca-certificates
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install -y git-lfs

