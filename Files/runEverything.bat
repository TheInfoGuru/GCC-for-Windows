@echo off

if exist "%~dp0KetarinAndPrograms\programs\Everything.exe" goto runEverything
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
copy /z "\\10.1.10.13\tk\Local\Programs\Everything.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\Everything.exe"
goto runEverything

:callError
call "%~dp0fileError.bat"

:runEverything
start "Title" "%~dp0KetarinAndPrograms\programs\Everything.exe"
goto eof

:eof