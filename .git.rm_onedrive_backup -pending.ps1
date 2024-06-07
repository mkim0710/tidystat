#!/bin/bash
# https://github.com/desktop/desktop/issues/16285
# https://github.com/desktop/desktop/issues/15406
# https://chatgpt.com/c/032950e7-32ae-44c2-9824-37c9133103a4
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#@ PowerShell uses the backtick (`) as the escape character. 
# # cd "D:\OneDrive\`[`]`[Rproject`]\Rproject_Rmd"
# cd "D:\OneDrive\```[```]```[Rproject```]\Rproject_Rmd"
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#@ Universal Naming Convention (UNC) path forma
# # cd "\\?\D:\OneDrive\[][Rproject]\Rproject_Rmd"
# # cd "\\?\D:\OneDrive\`[`]`[Rproject`]\Rproject_Rmd"
# # cd "\\?\D:\OneDrive\```[```]```[Rproject```]\Rproject_Rmd"
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#@ Set-Location -LiteralPath 
# Set-Location -LiteralPath "D:\OneDrive\[][Rproject]\Rproject_Rmd"
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
# Define the backup file name with the current date.
$BACKUP_FILE = ".git.backup-$(Get-Date -Format 'yyMMdd').7z"


# Full path to 7z executable
$SevenZipPath = "C:\Program Files\7-Zip\7z.exe"

# Archive the .git directory to a backup file
Write-Host "Archiving .git directory to $BACKUP_FILE..."
& "$SevenZipPath" a "$BACKUP_FILE" .git

# Check if the backup was successful
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to create backup of .git directory. Exiting."
    Pause
    exit 1
}
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# Define the directory to start the search from. Here, it is set to the .git directory under the current working directory.
$SEARCH_DIR = "./.git/"

# Define an array of patterns to search for in filenames.
$PATTERNS = @(
    "*-ID92i5-4570T*",
    "*-MKIM-15ZD980-HX70K*",
    "*-LIVAi7-8700*",
    "*-ASRockX300Ryzen5600G*",
    "*-Min-Hyung’s MacBook Pro*",
    "*-MAGB760M13700KF*"
)

# Loop through each pattern and find/delete matching files using git rm
foreach ($PATTERN in $PATTERNS) {
    # Find files matching the pattern
    Get-ChildItem -Path $SEARCH_DIR -Recurse -Filter $PATTERN | ForEach-Object {
        $FILE = $_.FullName
        # Print the name of the file being removed
        Write-Host "Removing file: $FILE"

        # Escape the file path for Git
        $ESCAPED_FILE = $FILE -replace '\[', '`[' -replace '\]', '`]' -replace ' ', '` '
        # Remove the file index (cache) using git rm
        git rm --cache $ESCAPED_FILE
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Warning: Failed to remove $FILE from Git index. It might not be tracked by Git."
        }
        # Remove the file from the filesystem
        Remove-Item -LiteralPath $FILE -Force
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Successfully removed $FILE from the filesystem."
        } else {
            Write-Host "Failed to remove $FILE from the filesystem."
        }
    }
}

# Print completion message
Write-Host "Files containing the specified patterns have been removed from $SEARCH_DIR using git rm."

Pause



