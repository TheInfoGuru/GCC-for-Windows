@echo off
echo Checking Server Connection
ping -4 -n 2 10.1.10.13|find "TTL" > nul
IF NOT %ERRORLEVEL% == 0 goto failedTest
goto eof


:failedTest
cls
mode 50,7
color 4f 
echo Can't connect to the server!
echo Press any key to continue
pause > nul
exit /b 1


:eof
