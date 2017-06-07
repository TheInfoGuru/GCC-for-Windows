::Get Programs
setlocal
@echo off 

call "%~dp0checkInternetConnection.bat"
if %errorlevel% == 1 goto eof
ver > nul
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto startDownload
copy /z "\\10.1.10.13\tk\Local\programs" "%~dp0KetarinAndPrograms\programs"
goto done$

:startDownload
mode 70,15
color 0a

cls
echo Checking if NetFramework 4.5 ^^ exists ...
echo Please wait ...
reg query "HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\full" /v version | findstr "4.5 4.6" > nul
if not %errorlevel% equ 0 goto preLoop
goto startUpdate

:preLoop
if not [%SAFEBOOT_OPTION%] == [] goto safeModeEnabled
start "title" "%~dp0KetarinAndPrograms\programs\netInstaller.exe"
set numberTry=1

:mainLoop
echo This is loop number %numberTry% ...
timeout 60 > nul
reg query "HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\full" /v version | findstr "4.5 4.6" > nul
if %errorlevel% equ 0 goto startUpdate
set /a numberTry=%numberTry%+1
goto mainLoop

:startUpdate
"%~dp0KetarinAndPrograms\ketarin.exe" /silent /log="%~dp0KetarinAndPrograms\ketarinlog.txt
goto done$

:safeModeEnabled
cls
echo Cannot install .Net Framework from safe mode ...
echo Please boot to normal mode before trying to run ...
timeout 5 > nul
exit

:done$
color 1f
cls
echo Files were downloaded.
timeout 5 > nul
endlocal
exit