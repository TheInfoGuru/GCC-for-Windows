@echo off

if exist "%~dp0KetarinAndPrograms\programs\RealTemp\RealTemp.exe" goto runRealTemp
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
xcopy /E /Z "\\10.1.10.13\tk\Local\Programs\RealTemp.7z" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs"
"%~dp07z.exe" x "%~dp0KetarinAndPrograms\Programs\RealTemp.7z" -o"%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs"
del /q "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\RealTemp.7z"
goto runRealTemp

:callError
echo Must have a connection with server to run this tool.
timeout 7 > nul
goto eof

:runRealTemp
start "" "%~dp0KetarinAndPrograms\programs\RealTemp\RealTemp.exe"
goto eof

:eof