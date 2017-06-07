@echo off

::Check CPU type
call "%~dp0checkCPUType.bat"

::Direct which version of program
if %cpuType% == 64 goto startx64
if %cpuType% == 32 goto startx86

:startx64
if exist "%~dp0KetarinAndPrograms\programs\Autoruns64.exe" goto runAutoruns
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
copy /z "\\10.1.10.13\tk\Local\Programs\Autoruns64.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\Autoruns64.exe"
goto runAutoruns

:startx86
if exist "%~dp0KetarinAndPrograms\programs\Autoruns.exe" goto runAutoruns
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
copy /z "\\10.1.10.13\tk\Local\Programs\Autoruns.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\Autoruns.exe"
goto runAutoruns

:callError
call "%~dp0fileError.bat"
goto eof

:runAutoruns
if %cpuType% == 64 start "Title" "%~dp0KetarinAndPrograms\programs\Autoruns64.exe"
if %cpuType% == 32 start "Title" "%~dp0KetarinAndPrograms\programs\Autoruns.exe"

goto eof

:eof