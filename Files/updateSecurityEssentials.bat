@echo off

if exist "%ProgramFiles%\Microsoft Security Client\MpCmdRun.exe" goto startUpdate

cls
color 4f
echo Microsoft Security Essentials not found!!
timeout 5 > nul
goto eof

:startUpdate
start "title" "%ProgramFiles%\Microsoft Security Client\msseces.exe"
goto eof

:eof