::Download Error
@echo off
title Download File Error
echo. 
echo "Server could not be reached to download file. Please check connection and try again."
timeout 5 > nul
::if not exist "%~dp0KetarinAndPrograms\programs\nircmd.exe" "%~dp07z.exe" e "%~dp0KetarinAndPrograms\programs\programs.7z" -o"%~dp0KetarinAndPrograms\programs" -y
::start "" "%~dp0KetarinAndPrograms\programs\nircmd.exe" qboxtop "Program files not found. Would you like to download them now?" "Confirm Tool Download" "%~dp0getPrograms.bat"
exit 