@echo off

setlocal

::set variables

set "rogueKillerLog=%~d0\rogueKillerLog.txt"

::First Loop
:loopOne
if not exist "%rogueKillerLog%"  timeout 5 > nul && goto loopOne

:eof
move /Y "%rogueKillerLog%" "%appdata%\temp\logs"
endlocal