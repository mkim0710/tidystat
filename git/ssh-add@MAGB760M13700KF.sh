
# https://chatgpt.com/c/95c83c3d-7eb6-4895-993c-9a28dec79777

####################################################################################################
#===================================================================================================
####################################################################################################
#===================================================================================================
####################################################################################################
#@ Check for Existing SSH Directory
# user home directory
cd ~
if (Test-Path .ssh) { "Directory exists" } else { "Directory does not exist" }
mkdir .ssh
cd .ssh

#===================================================================================================
#@ Generate SSH Key (if you don’t already have one)
ssh-keygen -t rsa -b 4096 -C "mkim0710@gmail.com"
# what about ED25519???




####################################################################################################
#@ Start-Service ssh-agent
Start-Service ssh-agent
# PS C:\Users\mkim0\.ssh> Start-Service ssh-agent
# Start-Service : Service 'OpenSSH Authentication Agent (ssh-agent)' cannot be started due to the following error: Cannot
#  start service ssh-agent on computer '.'.
# At line:1 char:1
# + Start-Service ssh-agent
# + ~~~~~~~~~~~~~~~~~~~~~~~
#     + CategoryInfo          : OpenError: (System.ServiceProcess.ServiceController:ServiceController) [Start-Service],
#    ServiceCommandException
#     + FullyQualifiedErrorId : CouldNotStartService,Microsoft.PowerShell.Commands.StartServiceCommand

Get-Service ssh-agent | Select Status
# PS C:\Users\mkim0\.ssh> Get-Service ssh-agent | Select Status
#  Status
#  ------
# Stopped



#===================================================================================================
#@ services.msc > OpenSSH Authentication Agent > Startup type: Automatic (Delayed) or Manual
# Automatic: If you frequently use SSH keys for authentication right from system startup, setting it to automatic might be convenient.
# Automatic (Delayed Start): Useful if the system feels sluggish at boot and ssh-agent isn't immediately needed. It also helps if ssh-agent needs other services to be up first.
# Manual: If you use SSH keys infrequently or are concerned about conserving system resources, setting it to manual would be appropriate. You can start the service when needed.

Start-Service ssh-agent
# PS C:\Users\mkim0\.ssh> Start-Service ssh-agent

Get-Service ssh-agent | Select Status
# PS C:\Users\mkim0\.ssh> Get-Service ssh-agent | Select Status
#  Status
#  ------
# Running
####################################################################################################
ssh-add .\id_ed25519
# PS C:\Users\mkim0\.ssh> ssh-add .\id_ed25519
# Enter passphrase for .\id_ed25519:
# Identity added: .\id_ed25519 (mkim0@MAGB760M13700KF)

ssh-add -l
# PS C:\Users\mkim0\.ssh> ssh-add -l
# 256 SHA256:46bDljfpEVGw4pT+ACm635P25jAHGwYf/MNCZFU+hYA mkim0@MAGB760M13700KF (ED25519)

#===================================================================================================
ssh -T git@github.com
# PS C:\Users\mkim0\.ssh> ssh -T git@github.com
# The authenticity of host 'github.com (20.200.245.247)' can't be established.
# ECDSA key fingerprint is SHA256:p2QAMXNIC1TJYWeIOttrVc98/R1BUFWu3/LiyKgUfQM.
# Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
# Warning: Permanently added 'github.com,20.200.245.247' (ECDSA) to the list of known hosts.
# Connection closed by 20.200.245.247 port 22

#===================================================================================================
# https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints
# GitHub's SSH key fingerprints
# Public key fingerprints can be used to validate a connection to a remote server.
# These are GitHub's public key fingerprints:
# SHA256:uNiVztksCsDhcc0u9e8BujQXVUpKZIDTMczCvj3tD2s (RSA)
# SHA256:br9IjFspm1vxR3iA35FWE+4VTyz1hYVLIE2t1/CeyWQ (DSA - deprecated)
# SHA256:p2QAMXNIC1TJYWeIOttrVc98/R1BUFWu3/LiyKgUfQM (ECDSA)
# SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU (Ed25519)

# You can add the following ssh key entries to your ~/.ssh/known_hosts file to avoid manually verifying GitHub hosts:
# github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl
# github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=
# github.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj7ndNxQowgcQnjshcLrqPEiiphnt+VTTvDP6mHBL9j1aNUkY4Ue1gvwnGLVlOhGeYrnZaMgRK6+PKCUXaDbC7qtbW8gIkhL7aGCsOr/C56SJMy/BCZfxd1nWzAOxSDPgVsmerOBYfNqltV9/hWCqBywINIR+5dIg6JTJ72pcEpEjcYgXkE2YEFXV1JHnsKgbLWNlhScqb2UmyRkQyytRLtL+38TGxkxCflmO+5Z8CSSNY7GidjMIZ7Q4zMjA2n1nGrlTDkzwDCsw+wqFPGQA179cnfGWOWRVruj16z6XyvxvjJwbz0wQZ75XK5tKSb7FNyeIEs4TT4jk+S4dhPeAUC5y+bDYirYgM4GC7uEnztnZyaVWQ7B381AK4Qdrwt51ZqExKbQpTUNn+EjqoTwvqNj4kqx5QUCI0ThS/YkOxJCXmPUWZbhjpCg56i+2aB6CmK2JGhn57K5mj0MNdBXA4/WnwH6XoPWJzK5Nyu2zB3nAZp+S5hpQs+p1vN1/wsjk=
#===================================================================================================

# Define the GitHub keys
$githubKeys = @(
    "github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl",
    "github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=",
    "github.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj7ndNxQowgcQnjshcLrqPEiiphnt+VTTvDP6mHBL9j1aNUkY4Ue1gvwnGLVlOhGeYrnZaMgRK6+PKCUXaDbC7qtbW8gIkhL7aGCsOr/C56SJMy/BCZfxd1nWzAOxSDPgVsmerOBYfNqltV9/hWCqBywINIR+5dIg6JTJ72pcEpEjcYgXkE2YEFXV1JHnsKgbLWNlhScqb2UmyRkQyytRLtL+38TGxkxCflmO+5Z8CSSNY7GidjMIZ7Q4zMjA2n1nGrlTDkzwDCsw+wqFPGQA179cnfGWOWRVruj16z6XyvxvjJwbz0wQZ75XK5tKSb7FNyeIEs4TT4jk+S4dhPeAUC5y+bDYirYgM4GC7uEnztnZyaVWQ7B381AK4Qdrwt51ZqExKbQpTUNn+EjqoTwvqNj4kqx5QUCI0ThS/YkOxJCXmPUWZbhjpCg56i+2aB6CmK2JGhn57K5mj0MNdBXA4/WnwH6XoPWJzK5Nyu2zB3nAZp+S5hpQs+p1vN1/wsjk="
)

# Path to the known_hosts file
$knownHostsPath = "$env:USERPROFILE\.ssh\known_hosts"

# Check if the known_hosts file exists, if not create it
if (-Not (Test-Path $knownHostsPath)) {
    New-Item -Path $knownHostsPath -ItemType File
}

# Add each key to the known_hosts file if it is not already added
foreach ($key in $githubKeys) {
    if (-Not (Select-String -Path $knownHostsPath -Pattern ([Regex]::Escape($key)) -Quiet)) {
        Add-Content -Path $knownHostsPath -Value $key
    }
}

# Output the current contents of the known_hosts file
Get-Content $knownHostsPath


####################################################################################################
####################################################################################################
####################################################################################################
#@@@ Configure Docker Containers to Use SSH Agent
#1. Find the SSH Agent Socket:
# The SSH agent socket path on Windows is usually not set in the same way as on Unix-like systems. Windows doesn’t use the UNIX socket but rather named pipes.
# You can typically find the agent socket path in Windows by looking at the environment variables. Run this command:
Get-ChildItem env:SSH_AUTH_SOCK
# PS C:\Users\mkim0\.ssh> Get-ChildItem env:SSH_AUTH_SOCK
# Get-ChildItem : Cannot find path 'SSH_AUTH_SOCK' because it does not exist.
# At line:1 char:1
# + Get-ChildItem env:SSH_AUTH_SOCK
# + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#     + CategoryInfo          : ObjectNotFound: (SSH_AUTH_SOCK:String) [Get-ChildItem], ItemNotFoundException
#     + FullyQualifiedErrorId : PathNotFound,Microsoft.PowerShell.Commands.GetChildItemCommand

#===================================================================================================
# If this does not show anything, you might need to configure SSH agent differently, as Windows handling of sockets can differ. Alternatively, consider using third-party tools like "weasel-pageant" or "win32-openssh" which can help in interfacing with Windows SSH agent from within Docker containers.

#2. Mount the SSH Agent Socket in Docker:
# Due to differences in how Windows handles sockets, directly mounting $SSH_AUTH_SOCK as you would in Linux is not straightforward.
# One approach is to use a helper tool to bridge Windows named pipes and UNIX sockets. Tools like weasel-pageant or win32-openssh can facilitate this.
# Once you have a UNIX-like socket or named pipe available, you can mount it into your Docker container using the -v or --mount option of docker run. For example:
docker run -v //./pipe/ssh-pageant://tmp/ssh-pageant -e SSH_AUTH_SOCK=/tmp/ssh-pageant myimage
# Ensure that your Docker container has an SSH client that can use this socket.
#===================================================================================================
#@ Additional Considerations
# Security: Ensure that only trusted containers have access to the SSH agent socket.
# Compatibility: Handling SSH agent sockets on Windows with Docker can be complex due to platform differences. Tools that create a compatibility layer between Windows named pipes and UNIX sockets are necessary.
# This setup on Windows is more complex than on UNIX-like systems, and depending on your specific needs and environment, you might need additional configurations or tools to bridge these compatibility issues effectively.

####################################################################################################

# Configuring Docker containers to use an SSH agent on Windows involves a few additional steps compared to a UNIX-based system, primarily because Windows does not use UNIX sockets for SSH agent communication but instead uses named pipes.

# Since the SSH_AUTH_SOCK environment variable is not set (as indicated by your PowerShell output), you'll need to set up an environment where Docker can communicate with the SSH agent running on your Windows host. Here’s how you can achieve this:

# Step 1: Install a Compatibility Layer
# To allow Docker containers to access the SSH agent running on Windows, you can use a tool like weasel-pageant or npiperelay, which bridges the gap between Windows named pipes and UNIX domain sockets.

# Using weasel-pageant (Recommended for simplicity):
# Download and Configure weasel-pageant:

# You can find weasel-pageant on GitHub. Download the latest release.
# Extract it to a convenient location on your system.
# Run weasel-pageant:

# Open a command prompt or PowerShell window.
# Navigate to the directory where you extracted weasel-pageant.
# Run the following command to start it:
# bash
# Copy code
# .\weasel-pageant -r
# This command will relay the SSH agent socket using a UNIX-like socket that can be accessed by Docker.
# Step 2: Configure Docker to Use the SSH Agent
# Once you have the SSH agent relay set up, you can configure your Docker containers to use it:

# Mount the SSH Socket in Docker:
# When running a Docker container, you'll need to mount the socket created by weasel-pageant. You'll typically provide a volume mount point that matches the socket path expected by the SSH client inside the container.
# For example, if weasel-pageant creates a socket at /tmp/.ssh-agent, use:
# bash
# Copy code
# docker run -v /tmp/.ssh-agent:/tmp/.ssh-agent -e SSH_AUTH_SOCK=/tmp/.ssh-agent your_docker_image
# Step 3: Verify SSH Agent Functionality in Docker
# After setting up the container, you can check whether the SSH agent is accessible from within the Docker container:

# Connect to your Docker container:

# Use docker exec to start a shell session inside your container:
# bash
# Copy code
# docker exec -it your_container_name /bin/sh
# Check for SSH Agent Connectivity:

# Run ssh-add -l inside the container to list the SSH keys that the agent currently holds. If everything is set up correctly, you should see your keys listed.
# Troubleshooting
# If you encounter issues where the Docker container cannot communicate with the SSH agent, make sure:

# The paths are correctly specified and match between the host and container.
# The weasel-pageant is running and properly relaying the SSH agent socket.
# Proper permissions are set for the socket so that the container can access it.
# This setup should enable your Docker containers to seamlessly use the SSH agent running on your Windows machine, enhancing security by avoiding the need to manage SSH keys directly within each container.




####################################################################################################
#===================================================================================================
####################################################################################################
#===================================================================================================
####################################################################################################


