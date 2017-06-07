@echo off


if exist "%~dp0KetarinAndPrograms\programs\RogueKillerCMDX64.exe" goto runRogueKiller
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
copy /z "\\10.1.10.13\tk\Local\Programs\RogueKillerCMD.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\RogueKillerCMD.exe"
copy /z "\\10.1.10.13\tk\Local\Programs\RogueKillerCMDX64.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\RogueKillerCMDX64.exe"
goto runRogueKiller

:callError
call "%~dp0fileError.bat"

:runRogueKiller
call "%~dp0checkCPUType.bat"

if %cpuType% == 32 start "Run RogueKillerCMD" "%~dp0KetarinAndPrograms\programs\RogueKillerCMD.exe" -scan -dont_ask -debugpath "C:\rogueKillerLog.txt"
if %cpuType% == 64 start "Run RogueKillerCMD" "%~dp0KetarinAndPrograms\programs\RogueKillerCMDX64.exe" -scan -dont_ask -debugpath "C:\rogueKillerLog.txt"
goto eof

:eof
