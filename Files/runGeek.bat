@echo off

if exist "%~dp0KetarinAndPrograms\programs\Geek.exe" goto runGeek
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
copy /z "\\10.1.10.13\tk\Local\Programs\Geek.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\Geek.exe"
goto runGeek

:callError
call "%~dp0fileError.bat"

:runGeek
start "Title" "%~dp0KetarinAndPrograms\programs\Geek.exe"
goto eof

:eof