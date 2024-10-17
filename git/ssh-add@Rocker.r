
# https://chatgpt.com/c/97499aa6-b413-44c2-ad01-cd13a3e6c3fa

.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}

## @ Check if an SSH Agent is Already Running: ====  
# [ -z "$SSH_AGENT_PID" ]: This checks if the variable SSH_AGENT_PID is empty (-z tests for an empty string). If this variable is unset or empty, it indicates that there is no SSH agent PID known to the session, implying no agent is running.
system.output_vec = system('
if [ -z "$SSH_AGENT_PID" ]; then
    eval "$(ssh-agent -s)"
else
    echo "SSH Agent already running on PID $SSH_AGENT_PID"
fi
       ', intern = TRUE); dput(system.output_vec)
"SSH Agent already running on PID 2732"
str_extract(system.output_vec, "[0-9]+$")
"2732"



## \$ system('ps aux | grep ssh-agent') ------  
system('ps aux | grep ssh-agent')
# > system('ps aux | grep ssh-agent')
# rstudio   2732  0.0  0.0   7980  3496 ?        Ss   07:59   0:00 ssh-agent -s
# rstudio   2777  0.0  0.0   2892   284 ?        S    08:21   0:00 sh -c ps aux | grep ssh-agent
# rstudio   2779  0.0  0.0   6480  2216 ?        S    08:21   0:00 grep ssh-agent
# > system('ps aux | grep ssh-agent')
# rstudio    720  0.0  0.0   7980  3372 ?        Ss   14:50   0:00 ssh-agent -s
# rstudio    745  0.0  0.0   2892   288 ?        S    14:50   0:00 sh -c ps aux | grep ssh-agent
# rstudio    747  0.0  0.0   6612  2280 ?        S    14:50   0:00 grep ssh-agent
# system("kill 3214")


## \$ cat ~/.ssh/ssh-agent.socket -------  
system.output_vec = system('
cat ~/.ssh/ssh-agent.socket
       ', intern = TRUE); dput(system.output_vec)


## @ Reusing Existing SSH Agents -dev ====  

## \% parts  ----  
system.output_vec = system('
# Source the existing agent details if available
if [ -f ~/.ssh/ssh-agent.socket ]; then
    echo "Sourcing existing SSH agent details..."
    . ~/.ssh/ssh-agent.socket
else
    echo "No existing agent details file found."
fi

# Display current stored values (for debugging)
echo "Stored SSH_AUTH_SOCK: $SSH_AUTH_SOCK"
echo "Stored SSH_AGENT_PID: $SSH_AGENT_PID"
       ', intern = TRUE); dput(system.output_vec)




## \% parts test ----  
system.output_vec = system('
[ -z "$SSH_AGENT_PID" ]
echo $?  # Outputs the exit status of the last command, 0 for true, non-0 for false
       ', intern = TRUE); dput(system.output_vec)
system.output_vec = system('
[ ! -z "$SSH_AGENT_PID" ]
echo $?  # Outputs the exit status of the last command, 0 for true, non-0 for false
       ', intern = TRUE); dput(system.output_vec)

system.output_vec = system('
ps -p $SSH_AGENT_PID
echo $?  # Outputs the exit status of the last command, 0 for true, non-0 for false
       ', intern = TRUE); dput(system.output_vec)
system.output_vec = system('
ps -p $SSH_AGENT_PID > /dev/null 2>&1
echo $?  # Outputs the exit status of the last command, 0 for true, non-0 for false
       ', intern = TRUE); dput(system.output_vec)
system.output_vec = system('
! ps -p $SSH_AGENT_PID > /dev/null 2>&1
echo $?  # Outputs the exit status of the last command, 0 for true, non-0 for false
       ', intern = TRUE); dput(system.output_vec)

system.output_vec = system('
ps -p $SSH_AGENT_PID -o comm=
echo $?  # Outputs the exit status of the last command, 0 for true, non-0 for false
       ', intern = TRUE); dput(system.output_vec)
system.output_vec = system('
ps -p $SSH_AGENT_PID -o comm= | grep -q ssh-agent
echo $?  # Outputs the exit status of the last command, 0 for true, non-0 for false
       ', intern = TRUE); dput(system.output_vec)



system.output_vec = system('
if [ ! -z "$SSH_AGENT_PID" ] && ps -p $SSH_AGENT_PID -o comm= | grep -q ssh-agent; then
    echo "SSH Agent already running on PID $SSH_AGENT_PID"
fi
       ', intern = TRUE); dput(system.output_vec)






## @ Reusing Existing SSH Agents ====  
system.output_vec = system('
# Source the existing agent details if available
if [ -f ~/.ssh/ssh-agent.socket ]; then
    echo "Sourcing existing SSH agent details..."
    . ~/.ssh/ssh-agent.socket
else
    echo "No existing agent details file found."
fi

# Display current stored values (for debugging)
echo "Stored SSH_AUTH_SOCK: $SSH_AUTH_SOCK"
echo "Stored SSH_AGENT_PID: $SSH_AGENT_PID"
       ', intern = TRUE); dput(system.output_vec)


system.output_vec = system('
# Validate the existing SSH agent
if [ -z "$SSH_AGENT_PID" ] || ! ps -p $SSH_AGENT_PID > /dev/null 2>&1; then
    echo "No valid SSH agent found or not running. Starting a new one..."
else
    echo "Using existing SSH agent with PID: $SSH_AGENT_PID"
fi
       ', intern = TRUE); dput(system.output_vec)


system.output_vec = system('
# Validate the existing SSH agent
if [ -z "$SSH_AGENT_PID" ] || ! ps -p $SSH_AGENT_PID > /dev/null 2>&1; then
    echo "No valid SSH agent found or not running. Starting a new one..."
    eval "$(ssh-agent -s)"
    echo "New SSH_AUTH_SOCK: $SSH_AUTH_SOCK"
    echo "New SSH_AGENT_PID: $SSH_AGENT_PID"
else
    echo "Using existing SSH agent with PID: $SSH_AGENT_PID"
fi
# Whether or not using the existing agent, write to ss-aget.socket to ensure that it is most current.
echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" > ~/.ssh/ssh-agent.socket
echo "export SSH_AGENT_PID=$SSH_AGENT_PID" >> ~/.ssh/ssh-agent.socket
       ', intern = TRUE); dput(system.output_vec)








## \$ system('ps aux | grep ssh-agent') ------  
system('ps aux | grep ssh-agent')
# > system('ps aux | grep ssh-agent')
# rstudio   2732  0.0  0.0   7980  3496 ?        Ss   07:59   0:00 ssh-agent -s
# rstudio   2777  0.0  0.0   2892   284 ?        S    08:21   0:00 sh -c ps aux | grep ssh-agent
# rstudio   2779  0.0  0.0   6480  2216 ?        S    08:21   0:00 grep ssh-agent

# system("kill 3214")


## \$ cat ~/.ssh/ssh-agent.socket -------  
system.output_vec = system('
cat ~/.ssh/ssh-agent.socket
       ', intern = TRUE); dput(system.output_vec)


## @ ssh-add -------  

if(file.exists("~/.ssh/id_ed25519")) {
    path.file_sshKey = "~/.ssh/id_ed25519"
} else if (file.exists("~/.ssh/id_rsa")) {
    path.file_sshKey = "~/.ssh/id_rsa"
}  ;   cat("> path.file_sshKey = ",path.file_sshKey,"  \n", sep="")

system.output_vec = system(paste0('ssh-add ', path.file_sshKey), intern = TRUE); dput(system.output_vec)




