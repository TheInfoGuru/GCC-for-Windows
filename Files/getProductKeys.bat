@echo off
::check for logs folder
echo.
if not exist "%appdata%\temp\logs\" mkdir "%appdata%\temp\logs\"
if not exist "%~dp0KetarinAndPrograms\programs\ProduKey.exe" "%~dp07z.exe" e "%~dp0KetarinAndPrograms\programs\programs.7z" -o"%~dp0KetarinAndPrograms\programs" -y
"%~dp0KetarinAndPrograms\programs\ProduKey.exe" /stext "%appdata%\temp\logs\ProductKeys.txt"
goto eof

:eof