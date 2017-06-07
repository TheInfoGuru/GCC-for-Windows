@echo off

if exist "%~dp0KetarinAndPrograms\programs\FreeCommander\FreeCommander.exe" goto runFreeCommander
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
xcopy /E /Z "\\10.1.10.13\tk\Local\Programs\FreeCommander.7z" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs"
"%~dp07z.exe" x "%~dp0KetarinAndPrograms\Programs\FreeCommander.7z" -o"%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs"
del /q "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\FreeCommander.7z"
goto runFreeCommander

:callError
echo Must have a connection with server to run this tool.
timeout 7 > nul
goto eof

:runFreeCommander
start "" "%~dp0KetarinAndPrograms\programs\FreeCommander\FreeCommander.exe"
goto eof

:eof