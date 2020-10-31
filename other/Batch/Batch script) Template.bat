:: https://stackoverflow.com/questions/11269338/how-to-comment-out-add-comment-in-a-batch-cmd
:: Using :: in nested logic (IF-ELSE, FOR loops, etc...) will cause an error. In those cases, use REM instead.
:: 
:: https://stackoverflow.com/questions/15428777/whats-the-difference-between-a-and-variable-variables
:: https://stackoverflow.com/questions/10552812/defining-and-using-a-variable-in-batch-file
:: https://stackoverflow.com/questions/42496973/case-sensitivity-in-windows-batch-file
:: set file="bob"
:: 
:: https://stackoverflow.com/questions/3827567/how-to-get-the-path-of-the-batch-script-in-windows
:: You can use %~dp0, d means the drive only, p means the path only, 0 is the argument for the full filename of the batch file.
:: %~dp0 will be the directory. Here's some documentation on all of the path modifiers. Fun stuff :-)
:: :: To remove the final backslash, you can use the :n,m substring syntax, like so:
:: :: SET mypath=%~dp0
:: :: echo %mypath:~0,-1%
:: :: I don't believe there's a way to combine the %0 syntax with the :~n,m syntax, unfortunately.
:: If the trailing backslash disturbs, simply append a dot .; do not remove the \ as you do, because this will result in an unintentional relative path when the script is located in the root directory of a drive, since D:\ (absolute) and D: (relative) may point to different locations, depending on the current working directory, but D:\. is still absolute
:: SET mypath=%~dp0.
:: 
:: echo %cd%
:: %CD% is the current working folder, not the folder, where the batch file is stored. They can be the same location, but often they are not. 
:: 
:: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/call#batch-parameters
:: %~1	Expands %1 and removes surrounding quotation marks.
:: %~f1	Expands %1 to a fully qualified path.
:: %~d1	Expands %1 to a drive letter only.
:: %~p1	Expands %1 to a path only.
:: %~n1	Expands %1 to a file name only.
:: %~x1	Expands %1 to a file name extension only.
:: %~s1	Expands %1 to a fully qualified path that contains short names only.
:: %~a1	Expands %1 to the file attributes.
:: %~t1	Expands %1 to the date and time of file.
:: %~z1	Expands %1 to the size of the file.
:: %~$PATH:1	Searches the directories listed in the PATH environment variable, and expands %1 to the fully qualified name of the first directory :: found. If the environment variable name is not defined or the file is not found by the search, then this modifier expands to the empty string.
:: %~dp1	Expands %1 to a drive letter and path only.
:: %~nx1	Expands %1 to a file name and extension only.
:: %~dp$PATH:1	Searches the directories listed in the PATH environment variable for %1, and then expands to the drive letter and path of the :: first directory found.
:: %~ftza1	Expands %1 to display output similar to the dir command.
:: 
:: https://gist.github.com/steven2358/ba153c642fe2bb1e47485962df07c730
:: https://gist.github.com/mkim0710/24603ce80ff62b1e7f03a44792856a54
:: 
:: Basic conversion
:: ffmpeg -i in.mp4 out.avi
:: 
:: Remux an MKV file into MP4
:: ffmpeg -i in.mkv -c:v copy -c:a copy out.mp4
:: 
:: High-quality encoding
:: Use the crf (Constant Rate Factor) parameter to control the output quality. The lower crf, the higher the quality (range: 0-51). The default value is 23, and visually lossless compression corresponds to -crf 18. Use the preset parameter to control the speed of the compression process. Additional info: https://trac.ffmpeg.org/wiki/Encode/H.264
:: ffmpeg -i in.mp4 -preset slower -crf 18 out.mp4
:: 
:: Create a video slideshow from images
:: Parameters: -r marks the image framerate (inverse time of each image); -vf fps=25 marks the true framerate of the output.
:: ffmpeg -r 1/5 -i img%03d.png -c:v libx264 -vf fps=25 -pix_fmt yuv420p out.mp4
:: 
:: https://ffmpeg.org/documentation.html
:: https://ffmpeg.org/ffmpeg.html
:: 
:: 
:: 
:: https://stackoverflow.com/questions/59902282/ffmpeg-batch-convert-all-audio-mp3-in-folder-to-video-mp4-with-album-artwor
:: Start of code
ECHO Now press ctrl-c to interrupt execution or enter to continue
PAUSE

echo off
SET currentpath=%cd%
SET mypath4batchfile=%~dp0.
SET mypath4ffmpeg=D:\OneDrive\[Note]\[[Media]] Video\ffmpeg-4.3.1-2020-10-01-essentials_build\bin
SET mypath4mp3=D:\OneDrive\[[No Sync]]\[[Upload]]\Marshall Rosenberg\Nonviolent Communication Disc 4
SET mypath4image=D:\OneDrive\[Note]\[[Media]] Video
SET mypath4output=%mypath4mp3%

GOTO EndComment0
ECHO "%currentpath%"
ECHO "%mypath4batchfile%"
ECHO "%mypath4mp3%"
ECHO "%mypath4mp3%\*.mp3"
ECHO "%mypath4output%"
:EndComment0

for %%1 in ("%mypath4mp3%\*.mp3") do (
    @REM ECHO %%1
    @REM ECHO %%~n1
    "%mypath4ffmpeg%\ffmpeg.exe" -i "%%1" -an -y -vcodec copy "%mypath4image%\Black 640 x 480.png"
    "%mypath4ffmpeg%\ffmpeg.exe" -loop 1 -i  "%mypath4image%\Black 640 x 480.png" -i "%%1" -y -c:v libx264 -preset veryslow -tune stillimage -crf 18 -pix_fmt yuv420p -c:a aac -shortest -strict experimental -b:a 192k -shortest "%mypath4output%\%%~n1.mp4" 
    @REM "%mypath4ffmpeg%\ffmpeg.exe" -loop 1 -i  "%mypath4image%\Black 640 x 480.png" -i "%%1" -y -c:v libx264 -tune stillimage -pix_fmt yuv420p -c:a aac -shortest -strict experimental -b:a 128k -shortest "%mypath4output%\%%~n1.mp4"     
)
pause