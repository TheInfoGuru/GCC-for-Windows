@echo off

if exist "%~dp0KetarinAndPrograms\programs\CCleaner\ccleaner.exe" goto runCCleaner
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
copy /e /i /z "\\10.1.10.13\tk\Local\Programs\CCleaner" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\CCleaner"
goto runCCleaner

:callError
call "%~dp0fileError.bat"
goto eof

:runCCleaner
call "%~dp0checkCPUType.bat"

if %cpuType% == 32 start "" "%~dp0KetarinAndPrograms\programs\CCleaner\ccleaner.exe" /auto
if %cpuType% == 64 start "" "%~dp0KetarinAndPrograms\programs\CCleaner\ccleaner64.exe" /auto
goto eof

:eof