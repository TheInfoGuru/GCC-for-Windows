@echo off

if exist "%~dp0KetarinAndPrograms\programs\GoogleChromePortable\GoogleChrome.exe" goto runChrome
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
xcopy /E /Z "\\10.1.10.13\tk\Local\Programs\GoogleChrome.7z" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs"
"%~dp07z.exe" x "%~dp0KetarinAndPrograms\Programs\GoogleChrome.7z" -o"%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs"
del /q "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\GoogleChrome.7z"
goto runChrome

:callError
echo Must have a connection with server to run this tool.
timeout 7 > nul
goto eof

:runChrome
start "" "%~dp0KetarinAndPrograms\programs\GoogleChromePortable\GoogleChrome.exe"
goto eof

:eof