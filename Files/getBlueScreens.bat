@echo off

::REM Generate file
::check for logs folder
if not exist "%appdata%\temp\logs\" mkdir "%appdata%\temp\logs\"

"%~dp0KetarinAndPrograms\programs\BlueScreenView.exe" /stext "%appdata%\temp\logs\BlueScreens.txt"
goto eof

:eof