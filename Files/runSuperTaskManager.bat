@echo off

if exist "%~dp0KetarinAndPrograms\programs\SuperTaskManager\DTaskManagerPortable.exe" goto runSuperTaskManager
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
xcopy /E /Z "\\10.1.10.13\tk\Local\Programs\SuperTaskManager.7z" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs"
"%~dp07z.exe" x "%~dp0KetarinAndPrograms\Programs\SuperTaskManager.7z" -o"%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs"
del /q "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\SuperTaskManager.7z"
goto runSuperTaskManager

:callError
echo Must have a connection with server to run this tool.
timeout 7 > nul
goto eof

:runSuperTaskManager
start "" "%~dp0KetarinAndPrograms\programs\SuperTaskManager\DTaskManagerPortable.exe"
goto eof

:eof