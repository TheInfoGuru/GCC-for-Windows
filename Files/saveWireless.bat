@echo off

setlocal
echo.
::check for logs folder
if not exist "%appdata%\temp\logs" mkdir "%appdata%\temp\logs"
if not exist "%~dp0KetarinAndPrograms\programs\wirelesskeyview.exe" "%~dp07z.exe" e "%~dp0KetarinAndPrograms\programs\programs.7z" -o"%~dp0KetarinAndPrograms\programs" -y

::set variables
"%~dp0KetarinAndPrograms\programs\wirelesskeyview.exe" /stext "%appdata%\temp\logs\WirelessInfo.txt"
goto eof

::end of file
:eof
endlocal