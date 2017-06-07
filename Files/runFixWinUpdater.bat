@echo off

:runCCleaner
call "%~dp0checkCPUType.bat"

if %cpuType% == 32 start "title" "%~dp0fixWinUpdates32.bat"
if %cpuType% == 64 start "title" "%~dp0fixWinUpdates64.bat"
goto eof

:eof