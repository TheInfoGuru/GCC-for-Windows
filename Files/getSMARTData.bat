@echo off
::check for logs folder
if not exist "%appdata%\temp\logs\" mkdir "%appdata%\temp\logs\"
"%~dp0KetarinAndPrograms\programs\disksmartview.exe" /shtml "%appdata%\temp\logs\SMARTData.html"
goto eof

:eof