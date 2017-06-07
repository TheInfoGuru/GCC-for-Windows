::Disable ScreenSaver
@echo off
setlocal

title DisableScreenSaver

::run command
if not exist "%~dp0KetarinAndPrograms\programs\nircmd.exe" "%~dp07z.exe" e "%~dp0KetarinAndPrograms\programs\programs.7z" -o"%~dp0KetarinAndPrograms\programs" -y
start "" "%~dp0KetarinAndPrograms\programs\nircmd.exe" regsetval sz "HKCU\control panel\desktop" "ScreenSaveActive" 0
goto eof

::end of file
:eof
endlocal
