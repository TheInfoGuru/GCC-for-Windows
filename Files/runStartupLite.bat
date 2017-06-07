@echo off


if exist "%~dp0KetarinAndPrograms\programs\startuplite.exe" goto runStartupLite
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
copy /z "\\10.1.10.13\tk\Local\Programs\startuplite.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\startuplite.exe"
goto runStartupLite

:callError
call "%~dp0fileError.bat"

::Execute StartupLight
:runStartupLite
start "" "%~dp0KetarinAndPrograms\programs\startuplite.exe" 
goto eof

::End of File
:eof

