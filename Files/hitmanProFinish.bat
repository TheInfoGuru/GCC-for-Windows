@echo off
setlocal

::set variables

set "hitmanProLog=%appdata%\temp\logs\HitmanPro.txt"
set numberLook=1

::First Loop
:loopOne
if not exist "%hitmanProLog%"  timeout 5 > nul && goto loopOne

::Second Loop
:loopTwo
cls
echo Waiting for Log File Creation ...
echo Check number %numberLook% ...
find /I "[/code]" "%hitmanProLog%"
if %errorlevel% equ 0 goto eof
timeout 20 > nul
if %numberLook% == 120 start "Attention" "%~dp0attentionBat.bat"
set /a numberLook=%numberLook%+1
goto loopTwo

:eof
endlocal