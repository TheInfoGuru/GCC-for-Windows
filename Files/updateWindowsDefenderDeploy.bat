@echo off

if exist "%ProgramFiles%\Windows Defender\MpCmdRun.exe" goto startUpdate
::if exist "%ProgramFiles(x86)%\Windows Defender\MpCmdRun.exe" goto startUpdate64
cls
color 4f
echo Windows Defender not found!!
timeout 5 > nul
goto eof

::startUpdate32
::start "title" "%ProgramFiles%\Windows Defender\MSASCui.exe"
::goto eof

:startUpdate
start "title" "%ProgramFiles%\Windows Defender\MSASCui.exe"
goto eof

:eof
exit