@echo off
setlocal enabledelayedexpansion

REM -- Set the base path where GitHub Desktop versions are stored
set "BASE_PATH=%LOCALAPPDATA%\GitHubDesktop\"

echo Checking in: !BASE_PATH!

REM -- Find the latest version directory and construct the correct path to git.exe
for /f "tokens=* delims=" %%i in ('dir "!BASE_PATH!app-*" /b /ad-h /o-n') do (
   set "VERSION_DIR=%%i"
   set "GIT_PATH=!BASE_PATH!!VERSION_DIR!\resources\app\git\cmd\git.exe"
   echo Checking version: !VERSION_DIR! at !GIT_PATH!

   REM -- Check if git.exe exists in this directory
   if exist "!GIT_PATH!" (
      echo Found git.exe at !GIT_PATH!
      goto found
   )
)

:found
if defined GIT_PATH (
   echo Found Git at: !GIT_PATH!
   REM -- Use cmd /k to keep the window open and execute the git command directly
   "!GIT_PATH!" --version
   if %ERRORLEVEL% neq 0 (
      echo Error: Failed to run git --version
      pause
      exit /b %ERRORLEVEL%
   )

   "!GIT_PATH!" config --global core.autocrlf input
   if %ERRORLEVEL% neq 0 (
      echo Error: Failed to set core.autocrlf
      pause
      exit /b %ERRORLEVEL%
   )
   echo Successfully set core.autocrlf to input

   REM -- Check the current setting of core.autocrlf
   "!GIT_PATH!" config --global --get core.autocrlf
   if %ERRORLEVEL% neq 0 (
      echo Error: Failed to get core.autocrlf
      pause
      exit /b %ERRORLEVEL%
   ) else (
      set /p GIT_SETTING= 
      echo Current setting of core.autocrlf is: %GIT_SETTING%
   )
) else (
   echo No Git installation found in GitHub Desktop directories.
   pause
)

cmd /k
endlocal
