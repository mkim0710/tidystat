
# https://gemini.google.com/app/142fd4bfa3d8de07

"df -h" |> system()
"ls -l ~" |> system()
"id" |> system()

"/etc/rstudio/rserver.conf" %>% {.[file.exists(.)]} |> file.edit()

Sys.getenv() %>% names %>% grep("^R",.,value = TRUE) %>% dput()
Sys.getenv() %>% names %>% grep("DIR",.,value = TRUE)


'find /var/log -name "*rstudio*" -o -name "messages"' |> system()
# > 'find /var/log -name "*rstudio*" -o -name "messages"' |> system()
# find: ‘/var/log/private’: Permission denied
# /var/log/rstudio
# /var/log/rstudio/rstudio-server

"/var/log" |> dir(all.files = TRUE) %>% dput
"/var/log/rstudio" |> dir(all.files = TRUE) %>% dput
"/var/log/rstudio/rstudio-server" |> dir(all.files = TRUE) %>% dput
# > dir("/var/log", all.files = TRUE) %>% dput
# c(".", "..", "alternatives.log", "apt", "bootstrap.log", "btmp", 
# "dpkg.log", "faillog", "fontconfig.log", "journal", "lastlog", 
# "private", "rstudio", "wtmp")
# > dir("/var/log/rstudio", all.files = TRUE) %>% dput
# c(".", "..", "rstudio-server")
# > dir("/var/log/rstudio/rstudio-server", all.files = TRUE) %>% dput
# c(".", "..")


"head /var/log/messages" %>% system
# > "head /var/log/messages" %>% system
# head: cannot open '/var/log/messages' for reading: No such file or directory

"~/.local/share/rstudio" |> dir(all.files = TRUE) %>% dput

"journalctl"


