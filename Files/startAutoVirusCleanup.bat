::start auto virus confirmation
@echo off
setlocal


echo.
::conirmation box
if not exist "%~dp0KetarinAndPrograms\programs\nircmd.exe" "%~dp07z.exe" e "%~dp0KetarinAndPrograms\programs\programs.7z" -o"%~dp0KetarinAndPrograms\programs" -y
start "" "%~dp0KetarinAndPrograms\programs\nircmd.exe" qboxtop "Are you sure you want to start the (Mostly) Automatic Virus Removal?" "Confirm Auto Virus Removal Start" "%~dp0autoVirusCleanup.bat"
goto eof

::end of file
:eof
endlocal