@echo off
echo Checking Internet Connectivity
ping -n 2 google.com|find "Reply from" > nul
IF NOT %ERRORLEVEL% == 0 goto failedTest
goto eof


:failedTest
cls
mode 50,7
color 4f 
echo Need an internet connection to run! 
echo Press any key to exit.
pause > nul
exit /b 1


:eof
exit /b 0