@echo off
call  "%~dp0checkAdmin.bat"
if %errorlevel% == 1 goto eof

echo Setting up tech environment
call "%~dp0disableUAC.bat"
::call "%~dp0autoLogin.bat"
::reg import "%~dp0Default_VBS.reg"
::call "%~dp0createRestorePoint.vbs"
call "%~dp0disableScreensaver.bat"
call "%~dp0setPowerHigh.bat"
call "%~dp0setTimeZone.bat"

::conirmation box
::if not exist "%~dp0KetarinAndPrograms\programs\nircmd.exe" "%~dp07z.exe" e "%~dp0KetarinAndPrograms\programs\programs.7z" -o"%~dp0KetarinAndPrograms\programs" -y
::start "" "%~dp0KetarinAndPrograms\programs\nircmd.exe" qboxtop "A system restart is required to complete setup. Would you like to restart now?" "Confirm Restart Computer" "%~dp0restartComputer.bat"
::goto eof

:eof