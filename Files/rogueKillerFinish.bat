@echo off

setlocal

::set variables
set numberWhy=1
set "rogueKillerLog=%~d0\rogueKillerLog.txt"

::First Loop
echo Waiting until RogueKiller starts the scan ...
:loopOne
if not exist "%rogueKillerLog%"  timeout 5 > nul && goto loopOne
goto loopTwo

::Second Loop
:loopTwo
cls
echo Waiting for RogueKiller Finish ...
echo Check number %numberWhy% ...
find "Scan Finished." "%rogueKillerLog%" > nul
if %errorlevel% equ 0 goto eof
timeout 300 > nul
set /a numberWhy=%numberWhy%+1
goto loopTwo

:eof
mkdir "%appdata%\temp\logs" 2> nul
move /Y "%rogueKillerLog%" "%appdata%\temp\logs\rogueKillerLog.txt" > nul
echo Moved log file to log folder.
endlocal