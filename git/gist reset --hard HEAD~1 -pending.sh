# https://shell.cloud.google.com/
# Caution) no multiple line paste in git bash

tmpdir=$(mktemp -d) && cd "$tmpdir"

gistid="29d2db81045d1c01a4b18e609f182962"
git clone --depth 2 https://gist.github.com/${gistid}.git
cd "${gistid}"

# Check what we have before reset
echo "=== BEFORE RESET ==="
git log --oneline -2

# Do the reset
git reset --hard HEAD~1

# Check after reset
echo "=== AFTER RESET ==="
git log --oneline -2

# mhkim710@cloudshell:~$ git config --get credential.helper
# manager-core

# If it prints manager-core or manager, you know Git will expect the Git-Credential-Manager (GCM) binary. GCM isn’t shipped in Cloud Shell by default (cloud.google.com).
# Install GCM (official installer for Linux)
# curl -fsSL https://aka.ms/gcm/linux-install-source.sh | bash

# git config --global credential.helper manager-core  # GCM was renamed from manager-core → manager in 2021, so using the new name avoids the missing-binary error (github.com).
git config --global credential.helper manager  # GCM was renamed from manager-core → manager in 2021, so using the new name avoids the missing-binary error (github.com).

# # Now you can safely purge the old secret and push:
# git credential reject <<EOF
# protocol=https
# host=gist.github.com
# EOF


# # Push with verbose output - Caution: this will overwrite the remote gist. Let's be careful, and run manually.
# echo "=== PUSHING ==="
# git push --force -v
# # mhkim710@cloudshell:/tmp/tmp.wHbUYDfYkJ/29d2db81045d1c01a4b18e609f182962$ git push --force -v
# # Pushing to https://gist.github.com/29d2db81045d1c01a4b18e609f182962.git
# # git: 'credential-manager' is not a git command. See 'git --help'.
# # remote: Repository not found.
# # fatal: repository 'https://gist.github.com/29d2db81045d1c01a4b18e609f182962.git/' not found

# # Create a personal access token on GitHub first
# # Then use it with HTTPS
# git remote set-url origin https://mkim0710:github_pat_@gist.github.com/29d2db81045d1c01a4b18e609f182962.git
# git push --force -v

# export GITHUB_TOKEN="github_pat_"
git remote set-url origin https://mkim0710:${GITHUB_TOKEN}@gist.github.com/29d2db81045d1c01a4b18e609f182962.git

history -c

# Check the result
echo "=== FINAL STATE ==="
git log --oneline -2

