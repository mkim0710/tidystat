# https://stackoverflow.com/questions/11478660/is-there-similar-r-function-to-sas-pwencode
# https://web.archive.org/web/20180201120258/http://www.gilfillan.space/2016/04/21/Using-PowerShell-and-DPAPI-to-securely-mask-passwords-in-R-scripts/

#@  PowerShell Script to Encrypt Passwords:
system('
# Create directory in user profile if it doesn't already exist
$passwordDir = "$($env:USERPROFILE)\DPAPI\passwords\$($env:computername)"
New-Item -ItemType Directory -Force -Path $passwordDir

# Prompt for password to encrypt
$account = Read-Host "Please enter a label for the text to encrypt. This will be how you refer to the password in R. eg. MYDB_MYUSER"
$SecurePassword = Read-Host -AsSecureString "Enter password" | ConvertFrom-SecureString | Out-File "$($passwordDir)\$($account).txt"

# Check output and press any key to exit
Write-Host "Press any key to continue..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
')



#@ Retrieve the Encrypted Password in R:

getEncryptedPassword <- function(credential_label, credential_path) {
    # if path not supplied, use %USERPROFILE%\DPAPI\passwords\computername\credential_label.txt as default
    if (missing(credential_path)) {
      credential_path <- paste0(Sys.getenv("USERPROFILE"), "\\DPAPI\\passwords\\", Sys.info()["nodename"], "\\", credential_label, ".txt")
    }
    # construct command
    command <- paste0('powershell -command "$PlainPassword = Get-Content ', credential_path, '; $SecurePassword = ConvertTo-SecureString $PlainPassword; $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword); $UnsecurePassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR); echo $UnsecurePassword"')
    # execute powershell and return command
    return(system(command, intern = TRUE))
  }


 dbConnect(driver, "MYUSER", getEncryptedPassword("MYUSER_MYDB"), dbname = "MYDB")

  
