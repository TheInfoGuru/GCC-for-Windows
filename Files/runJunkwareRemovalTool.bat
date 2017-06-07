@echo off

if exist "%~dp0KetarinAndPrograms\programs\JRT.exe" goto runJunkwareRemovalTool
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
copy /z "\\10.1.10.13\tk\Local\Programs\jrt.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\jrt.exe"
goto runJunkwareRemovalTool

:callError
call "%~dp0fileError.bat"

:runJunkwareRemovalTool
start "" "%~dp0KetarinAndPrograms\programs\jrt.exe"
goto eof

:eof