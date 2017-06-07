@echo off

::check if exist
call "%~dp0checkCPUType.bat"
if %cpuType% == 32 set programName=wumt_x86.exe
if %cpuType% == 64 set programName=wumt_x64.exe
if exist "%~dp0KetarinAndPrograms\programs\%programName%" goto runWinUpMiniTool

::check if connected to server
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError

::Check CPU type
if %cpuType% == 32 copy /z "\\10.1.10.13\tk\Local\Programs\wumt_x86.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\wumt_x86.exe"
if %cpuType% == 64 copy /z "\\10.1.10.13\tk\Local\Programs\wumt_x64.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\wumt_x64.exe"

:runWinUpMiniTool
start "start Window Update Mini Tool" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\%programName%"
goto eof

:callError
echo ERROR! MUST BE ABLE TO CONNECT TO SERVER TO RUN THIS TOOL!
timeout 5 > nul
goto eof

:eof
