@echo off

setlocal

::set variables
set numberTool=1
set "TDSSKillerLog=%appdata%\temp\logs\TDSSKILLER.log"

::First Loop
:loopOne
if not exist "%TDSSKillerLog%"  timeout 5 > nul && goto loopOne

::Second Loop
:loopTwo
cls
echo Waiting for Log File Creation ...
echo Check number %numberTool% ...
find /I "Scan Finished" "%TDSSKillerLog%"
if %errorlevel% equ 0 goto eof
timeout 20 > nul
set /a numberTool=%numberTool%+1
goto loopTwo

:eof
endlocal