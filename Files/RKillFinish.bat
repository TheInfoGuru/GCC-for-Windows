@echo off

setlocal

::set variables
set numberOh=1
set "rkillLog=%userprofile%\desktop\Rkill.txt"

::First Loop
:loopOne
if not exist "%rkillLog%"  timeout 5 > nul && goto loopOne

::Second Loop
:loopTwo
cls
echo Waiting for Log File Creation ...
echo Check number %numberOh% ...
find /I "Program finished at:" "%rkillLog%"
if %errorlevel% equ 0 goto eof
timeout 20 > nul
set /a numberOh=%numberOh%+1
goto loopTwo

:eof
taskkill /f /fi "windowtitle eq RKill*" /im *
move /Y "%rkillLog%" "%appdata%\temp\logs"
endlocal