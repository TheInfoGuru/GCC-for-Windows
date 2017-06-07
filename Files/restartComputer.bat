::@echo off
setlocal

choice /c yn /t 15 /d n /m "Do you wish to cancel the reboot?"

if %errorlevel% == 1 goto breakCycle
if %errorlevel% == 2 goto reboot

:breakCycle
if "%~f0" == "%appdata%\Microsoft\Windows\start menu\programs\restartComputer.bat" pause && (goto) 2>nul & del "%~f0" && exit
pause
exit /b 1

:reboot
shutdown -r -t 1 -f