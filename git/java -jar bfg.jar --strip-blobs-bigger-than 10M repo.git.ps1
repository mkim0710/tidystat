# https://chatgpt.com/c/6707b65a-edf8-800e-a45a-2fd88ac2ccf1

# *** --dry-run creates bfg-report.txt with a list of large files? -> feature not implemented yet! -_- ***

# mkdir repo-mirror
mkdir github_tidystat-mirror
# cd repo-mirror
cd github_tidystat-mirror
# git clone --mirror https://github.com/username/repo.git
git clone --mirror https://github.com/mkim0710/tidystat.git

# wget https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar
# Invoke-WebRequest -Uri "https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar" -OutFile "bfg-1.14.0.jar"
curl -L -o bfg-1.14.0.jar https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar

# https://adoptium.net/temurin/archive/?version=17
# OpenJDK17U-jre_x64_windows_hotspot_17.0.12_7.msi (JRE 17 LTS) was enough to run bfg-1.14.0.jar
java -version

# java -jar /path/to/bfg.jar --strip-blobs-bigger-than 10M /path/to/repo-mirror/repo.git
java -jar bfg-1.14.0.jar --strip-blobs-bigger-than 10M tidystat.git

# cd repo.git
cd tidystat.git
git reflog expire --expire=now --all && git gc --prune=now --aggressive
git push --force --all
git push --force --tags


##################################
#@ in other computers
# If I have changes in my local repository, I need to stash (back up) them.
git stash
#++++++++++++++++++++++++++++++++++
## If I am not on the main branch, I need to switch to the main branch.
# git checkout main
# git checkout master
#==================================
# Fetch the updated remote history
git fetch --all
#----------------------------------
# Reset Local Branches to Match the Remote
git reset --hard origin/main 
git reset --hard origin/master 
## Cf) Discard all local changes and pull the latest from the remote repository
# git reset --hard HEAD
#==================================
# Shrink the .git Folder Size After Running BFG: Run Garbage Collection
git reflog expire --expire=now --all && git gc --prune=now --aggressive
git prune --expire now
#----------------------------------
# Verify the Size of .git Folder on Linux/macOS
du -sh .git
# Verify the Size of .git Folder on Windows
Get-ChildItem -Recurse .git | Measure-Object -Property Length -Sum
#++++++++++++++++++++++++++++++++++
# If I had stashed changes, I can reapply them with:
git stash pop

