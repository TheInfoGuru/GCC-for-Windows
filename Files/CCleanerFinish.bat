@echo off

timeout 20 > nul

call "%~dp0checkCPUType.bat"

if %cpuType% == 32 goto loopA
if %cpuType% == 64 goto loopB

set numberCheck=1

:loopA
cls
echo Waiting for CCleaner to finish
echo Check number %numberCheck% ...
tasklist /FI "IMAGENAME eq CCleaner.exe" 2>NUL | find /I /N "CCleaner.exe" >NUL
if not "%ERRORLEVEL%"=="0" goto eof
set /a numberCheck=%numberCheck%+1
goto loopA


:loopB
cls
echo Waiting for CCleaner to finish
echo Check number %numberCheck% ...
tasklist /FI "IMAGENAME eq CCleaner64.exe.exe" 2>NUL | find /I /N "CCleaner64.exe" >NUL
if not "%ERRORLEVEL%"=="0" goto eof
set /a numberCheck=%numberCheck%+1
goto loopB

:eof