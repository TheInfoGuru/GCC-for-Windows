::Enable ScreenSaver
@echo off 

setlocal
title EnableScreenSaver

::run code
if not exist "%~dp0KetarinAndPrograms\programs\nircmd.exe" 7z e "%~dp0KetarinAndPrograms\programs\programs.7z" -o"%~dp0KetarinAndPrograms\programs" -y
start "" "%~dp0KetarinAndPrograms\programs\nircmd.exe" regsetval sz "HKCU\control panel\desktop" "ScreenSaveActive" 1
goto eof

::end of file
:eof
endlocal