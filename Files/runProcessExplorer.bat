@echo off

::check if exist
call "%~dp0checkCPUType.bat"
if %cpuType% == 32 set programName=procexp.exe
if %cpuType% == 64 set programName=procexp64.exe
if exist "%~dp0KetarinAndPrograms\programs\%programName%" goto runProcessExplorer

::check if connected to server
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError

::Check CPU type
if %cpuType% == 32 copy /z "\\10.1.10.13\tk\Local\Programs\procexp.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\procexp.exe"
if %cpuType% == 64 copy /z "\\10.1.10.13\tk\Local\Programs\procexp64.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\procexp64.exe"

:runProcessExplorer
start "start process explorer" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\%programName%"
goto eof

:callError
call "%~dp0fileError.bat"
goto eof

:eof
