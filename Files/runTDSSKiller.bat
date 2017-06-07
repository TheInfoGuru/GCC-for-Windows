@echo off


if exist "%~dp0KetarinAndPrograms\programs\TDSSKILLER.exe" goto runTDSSKiller
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
copy /z "\\10.1.10.13\tk\Local\Programs\TDSSKILLER.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\TDSSKILLER.exe"
goto runTDSSKiller

:callError
call "%~dp0fileError.bat"
goto eof

::Execute TDSSKiller with correct parameters
:runTDSSKiller
start "" "%~dp0KetarinAndPrograms\programs\TDSSKILLER.exe" -accepteula -accepteulaksn -qpath "%appdata%\temp\TDSSKillerQuarantine" -l "%appdata%\temp\logs\TDSSKILLER.log" -tdlfs -qall -dcexact
goto eof

::End of File
:eof

