@echo off
setlocal

if exist "%~dp0KetarinAndPrograms\programs\HitmanPro.exe" goto runHitmanPro
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
copy /z "\\10.1.10.13\tk\Local\Programs\HitmanPro.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\HitmanPro.exe"
copy /z "\\10.1.10.13\tk\Local\Programs\HitmanPro_x64.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\HitmanPro_x64.exe"
goto runHitmanPro

:callError
call "%~dp0fileError.bat"

:runHitmanPro
call "%~dp0checkCPUType.bat"

if %cpuType% == 32 start "" "%~dp0KetarinAndPrograms\programs\HitmanPro.exe" /clean /noinstall /log="%appdata%\temp\logs\HitmanPro.txt"
if %cpuType% == 64 start "" "%~dp0KetarinAndPrograms\programs\HitmanPro_x64.exe" /clean /noinstall /log="%appdata%\temp\logs\HitmanPro.txt"
goto eof

:eof