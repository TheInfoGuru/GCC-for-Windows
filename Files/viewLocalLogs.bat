@echo off

::check to see if logs exist
if not exist "%appdata%\temp\Logs" goto noLogs

start "openLogs" "%appdata%\temp\Logs"
goto eof

::end of file
:eof
exit /b 1

::No logs on computer
:noLogs
cls
color 4f 
mode 80,20

set genLogs=N

echo No logs were located on this computer.
echo Would you like to generate logs now? (y/N)
set /p genLogs=:

if /I %genLogs% == y goto generateLogs
if /I %genLogs% == n goto eof
goto noLogs

::Generate Logs
:generateLogs
color 07
cls
call "%~dp0generateLogs.bat"
goto eof