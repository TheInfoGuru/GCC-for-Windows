@echo off

if exist "%~dp0KetarinAndPrograms\programs\SpaceSniffer.exe" goto runSpaceSniffer
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
copy /z "\\10.1.10.13\tk\Local\Programs\SpaceSniffer.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\SpaceSniffer.exe"
goto runSpaceSniffer

:callError
call "%~dp0fileError.bat"

:runSpaceSniffer
start "Title" "%~dp0KetarinAndPrograms\programs\SpaceSniffer.exe"
goto eof

:eof