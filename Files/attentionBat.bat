::Brings up a Red CMD that beeps every 30 seconds until it is closed
@echo off
color 4f
mode 140,60
title Attention
echo.

::Center the Window
if not exist "%~dp0KetarinAndPrograms\programs\nircmd.exe" "%~dp07z.exe" e "%~dp0KetarinAndPrograms\programs\programs.7z" -o"%~dp0KetarinAndPrograms\programs" -y
"%~dp0KetarinAndPrograms\programs\nircmd.exe" win center ititle Attention


::display message to user
echo You must close this window to disable the alert and move on.

::loop beeping sound until closed
:loop
call "%~dp0attentionSound.bat" 
goto loop