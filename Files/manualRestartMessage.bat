@echo off
echo.
if not exist "%~dp0KetarinAndPrograms\programs\nircmd.exe" "%~dp07z.exe" e "%~dp0KetarinAndPrograms\programs\programs.7z" -o"%~dp0KetarinAndPrograms\programs" -y
start "" "%~dp0KetarinAndPrograms\programs\nircmd.exe" infobox "Please manually restart computer after running the program." "Important Message" 