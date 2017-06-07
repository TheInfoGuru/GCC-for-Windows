@echo off
title Reset Auto Virus Removal

::Check if auto virus cleanup has already been started
echo Checking if Auto Virus Removal has been started ...
reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v AutoVirusCleanup
if %errorlevel% == 0 goto resetAutoVirus
cls
echo Auto Virus Cleanup has not been started yet!
timeout 5 > nul
goto eof

::Start auto virus cleanup reset
:resetAutoVirus
echo Resetting Auto Virus Cleanup ...
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v AutoVirusCleanup /f
if exist "%appdata%\temp\autoReboot.txt" del "%appdata%\temp\autoReboot.txt" /f /Q
cls
echo Auto Virus Cleanup has been reset ...
timeout 5 > nul
goto eof

:eof