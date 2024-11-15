which ssh
sudo apt-get update
sudo apt-get install openssh-client
git config --global core.sshCommand
git config --global core.sshCommand "ssh"
ssh -T git@github.com
