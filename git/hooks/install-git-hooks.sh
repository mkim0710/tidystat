#!/bin/sh
cp git/hooks/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
# In Windows, you don't need to explicitly set executable permissions on the hook script because Git for Windows will execute the script as long as it has the correct shebang (#!/bin/sh) and is located in the correct directory (.git/hooks).

