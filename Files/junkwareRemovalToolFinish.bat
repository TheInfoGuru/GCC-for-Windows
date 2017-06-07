@echo off

setlocal

::set variables
set numberWhy=1
set "jrtLog=%userprofile%\desktop\jrt.txt"

::First Loop
:loopOne
if not exist "%jrtLog%"  timeout 5 > nul && goto loopOne

::Second Loop
:loopTwo
cls
echo Waiting for Log File Creation ...
echo Check number %numberWhy% ...
find /I "End of JRT log" "%jrtLog%"
if %errorlevel% equ 0 goto eof
timeout 20 > nul
set /a numberWhy=%numberWhy%+1
goto loopTwo

:eof
endlocal