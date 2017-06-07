@echo off

if exist "%~dp0KetarinAndPrograms\programs\rkill.com" goto runRKill
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
copy /z "\\10.1.10.13\tk\Local\Programs\rkill.com" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\rkill.com"
goto runRKill

:callError
call "%~dp0fileError.bat"

:runRKill
start "" "%~dp0KetarinAndPrograms\programs\rkill.com"
goto eof

:eof