#!/bin/bash
# https://github.com/desktop/desktop/issues/16285
# https://github.com/desktop/desktop/issues/15406
# https://chatgpt.com/c/032950e7-32ae-44c2-9824-37c9133103a4
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# Define the backup file name with the current date.
BACKUP_FILE=".git.backup-$(date +'%y%m%d').7z"

# Archive the .git directory to a backup file
echo "Archiving .git directory to $BACKUP_FILE..."
7z a "$BACKUP_FILE" .git

# Check if the backup was successful
if [ $? -ne 0 ]; then
    echo "Failed to create backup of .git directory. Exiting."
    exit 1
fi
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# Define the directory to start the search from. Here, it is set to the .git directory within the current working directory.
SEARCH_DIR="./.git/"
# Define an array of patterns to search for in filenames.
PATTERNS=(
    "*-ID92i5-4570T*"
    "*-MKIM-15ZD980-HX70K*"
    "*-LIVAi7-8700*"
    "*-ASRockX300Ryzen5600G*"
    "*-Min-Hyung’s MacBook Pro*"
    "*-MAGB760M13700KF*"
)
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# # Loop through all elements of the array using ${array[@]} and find/delete matching files
# for PATTERN in "${PATTERNS[@]}"; do
#     # Find files matching the pattern
#     find "$SEARCH_DIR" -type f -name "$PATTERN" | while read -r FILE; do
#         # Print the name of the file being removed
#         echo "Removing file: $FILE"
#         # Remove the file using git rm
#         git rm "$FILE"
#     done
# done
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
# Loop through all elements of the array using ${array[@]} and find/delete matching files
for PATTERN in "${PATTERNS[@]}"; do
    # Find files matching the pattern and print their names (-print option before the -exec git rm -r {} + command deletes it.)
    # find "$SEARCH_DIR" -type f -name "$PATTERN" -print -exec rm -f {} +  # -f: force option to remove without prompt.
    find "$SEARCH_DIR" -type f -name "$PATTERN" -print -exec git rm {} -r +  # git rm to remove files from both filesystem & the git index. -r: recursive option.
done
# Print completion message
echo "Files containing the specified patterns have been removed from $SEARCH_DIR."
