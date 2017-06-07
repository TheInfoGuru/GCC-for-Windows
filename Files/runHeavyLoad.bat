@echo off

::Check CPU type
call "%~dp0checkCPUType.bat"

::Direct which version of program
if %cpuType% == 64 goto startx64
if %cpuType% == 32 goto startx86

:startx64
if exist "%~dp0KetarinAndPrograms\programs\HeavyLoadx64\HeavyLoad.exe" goto runHeavyLoad
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
xcopy /e /i /z "\\10.1.10.13\tk\Local\Programs\HeavyLoadx64" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\HeavyLoadx64"
goto runHeavyLoad

:startx86
if exist "%~dp0KetarinAndPrograms\programs\HeavyLoadx86\HeavyLoad.exe" goto runHeavyLoad
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
xcopy /e /i /z "\\10.1.10.13\tk\Local\Programs\HeavyLoadx86" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\HeavyLoadx86"
goto runHeavyLoad

:callError
call "%~dp0fileError.bat"
goto eof

:runHeavyLoad
if %cpuType% == 64 start "Title" "%~dp0KetarinAndPrograms\programs\HeavyLoadx64\HeavyLoad.exe"
if %cpuType% == 32 start "Title" "%~dp0KetarinAndPrograms\programs\HeavyLoadx86\HeavyLoad.exe"

goto eof

:eof