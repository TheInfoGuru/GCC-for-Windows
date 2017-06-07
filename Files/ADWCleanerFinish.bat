@echo off
mode 17,1
setlocal

::set variables

set "ADWCleanerLog=%~d0ADWCleaner\adwcleaner*.txt"

::First Loop
:loopOne
if not exist "%ADWCleanerLog%"  timeout 5 > nul && goto loopOne

::Second Loop
:loopTwo
find /I "EOF" "%ADWCleanerLog%"
if %errorlevel% equ 0 goto eof
timeout 20 > nul
goto loopTwo

:eof
move /Y "%ADWCleanerLog%" "%appdata%\temp\logs"
endlocal