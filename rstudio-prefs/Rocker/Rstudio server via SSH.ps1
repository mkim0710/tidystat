# https://chatgpt.com/c/e292bdbc-e3f0-429e-bcf3-b0b29f951a57?model=o1-preview


############################################################
#@ SSH Server Setup on Windows 10
# Windows 10 Settings > Apps > Optional features > OpenSSH Server
# Start Menu Search > Services > OpenSSH SSH Server > Properties > Startup type: Automatic
# Start Menu Search > Services > OpenSSH SSH Server > Start
# Start Menu Windows Security > Firewall & network protection > Allow an app through firewall > Change settings > OpenSSH SSH Server > Private/Public > Check
## If it's not listed, click Allow another app and add sshd.exe from C:\Windows\System32\OpenSSH\.

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#@ Using PowerShell 
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
# -> This will start the SSH server and set it to start automatically on boot
Get-Service sshd
# -> If it's running, you'll see the Status as Running
New-NetFirewallRule -Name "SSH" -DisplayName "OpenSSH SSH Server" -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
# -> This will create a new firewall rule to allow incoming SSH connections on port 22


############################################################
#@ Create a new local user on your work PC for SSH access
# Start Menu Search > Computer Management > Local Users and Groups > Users > New User
# Set a username and password, uncheck User must change password at next logon, check User cannot change password, check Password never expires, check Account is disabled
# (Optional) Add the user to the Administrators group: Local Users and Groups > Groups > Administrators > Add > Advanced > Find Now > Select the user > OK > OK > OK

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#@ Create a new local user on your work PC for SSH access in cmd
net user <username> <password> /add
net localgroup Administrators <username> /add

############################################################
#@ Test SSH connection locally on the work PC 
# Open PowerShell or Command Prompt
ssh <username>@localhost
# Enter the password for ED25519 key fingerprint

############################################################
#@ Configure SSH Server on Windows 10
# Start Menu Search > Notepad > Right-click > Run as administrator > File > Open > C:\Windows\System32\OpenSSH\sshd_config

# Change the following lines:
# Port 22
# ListenAddress
# PermitRootLogin no
# PasswordAuthentication yes
# PubkeyAuthentication yes
# AuthorizedKeysFile .ssh/authorized_keys
# AllowUsers <username>



############################################################
#@ SSH into your work PC from your home PC

