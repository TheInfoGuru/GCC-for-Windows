@echo off

if exist "%~dp0KetarinAndPrograms\programs\driveridentifier_portable.exe" goto runDriverIdentifier
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
copy /z "\\10.1.10.13\tk\Local\Programs\driveridentifier_portable.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\driveridentifier_portable.exe"
goto runDriverIdentifier

:callError
call "%~dp0fileError.bat"
goto eof

:runDriverIdentifier
start "" "%~dp0KetarinAndPrograms\programs\driveridentifier_portable.exe"
goto eof

:eof