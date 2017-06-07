@echo off
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 set serverAvailable=n
if %errorlevel% == 0 set serverAvailable=y
title Backup Logs
color 1f
mode 70,13

::Start, Checks, and moves
if not exist "%appdata%\temp\logs" (
echo No log files found
timeout 5 > nul
goto eof
)

pushd "%~dp0"
::Set Customer Name
echo What is the customer's name?
set /p cusName=:

::Choose Path
if %serverAvailable% == n goto localSave
if %serverAvailable% == y goto serverSave


::################Save File on Server###################:
:serverSave
set "logServerLocation=\\10.1.10.13\CustomerLogs"
if not exist "%logServerLocation%\%cusName%" mkdir "%logServerLocation%\%cusName%"

::Take the slashes out of the date and store new format into variable
for /f "tokens=1-3 delims=/" %%a in ("%date%") do set "fixedDate=%%a_%%b_%%c" 

::Make the archive of the logs
"%~dp07z.exe" a -tzip -y "%fixedDate%-%time:~0,2%.%time:~3,2%.zip" "%appdata%\temp\logs\"
popd
::Move the archive to the customer's folder on the server
move "%~dp0%fixedDate%-%time:~0,2%.%time:~3,2%.zip" "%logServerLocation%\%cusName%"
goto eof


::#################Backup Logs Locally######################:
:localSave
::set save location
call "%~dp0saveFolderLocation.bat"
if not exist "%folderLocation%\%cusName%" mkdir "%folderLocation%\%cusName%"

title Backup Logs
color 1f
mode 70,13

::Take the slashes out of the date and store new format into variable
for /f "tokens=1-3 delims=/" %%a in ("%date%") do set "fixedDate=%%a_%%b_%%c" 

::Make the archive of the logs

"%~dp07z.exe" a -tzip -y "%fixedDate%-%time:~0,2%.%time:~3,2%.zip" "%appdata%\temp\logs\"
popd
::Move the archive to the customer's folder on the server

move "%~dp0%fixedDate%-%time:~0,2%.%time:~3,2%.zip" "%folderLocation%\%cusName%"
goto eof

::end of file
:eof
exit /b 1
