# RStudio.Cloud set up.r 
# https://rstudio.cloud/project/1815569
# https://rstudio.cloud/project/1815559


for (packagename in c("tidyverse", "datapasta")) {
  if(packagename %in% installed.packages()[,"Package"]) {   
    # If that package is already installed, then just load it. (You don't want to re-install if it is already installed.)
    require(packagename, character.only = T)
  } else {  
    # If that package is not already installed, then install first.
    install.packages(packagename)  # I am installing via "binary" because the installed R version is too old.
    # install.packages(packagename, type = "binary")  # I am installing via "binary" because the installed R version is too old.
    require(packagename, character.only = T)
  }
}

# https://github.com/maurolepore/cloudgithub
# Connecting rstudio.cloud and GitHub
# Tools > Global options > Git > Create key
# https://github.com/settings/keys


# >>> /usr/bin/git commit -F /tmp/Rtmpw9zfpP/git-commit-message-8a2e196d1d.txt --amend
# 
# *** Please tell me who you are.
# 
# Run
# 
#   git config --global user.email "you@example.com"
#   git config --global user.name "Your Name"
# 
# to set your account's default identity.
# Omit --global to set the identity only in this repository.
# 
# fatal: unable to auto-detect email address (got 'rstudio-user@application-3089508-deployment-7850965-gpdff.(none)')

# # If necessary configure git
# # To paste text in the terminal use Shift + Insert.
# # git config --global user.email "USEREMAIL@gmail.com"
# # git config --global user.name "USERNAME"
# system('git config --global user.email "mkim0710@gmail.com"')
# system('git config --global user.name "mkim0710@RStudio.Cloud"')



# Caution) do not forget to add .gitignore to .gitignore


#@ end ----

