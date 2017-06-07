@echo off

if exist "%~dp0KetarinAndPrograms\programs\PatchMyPC.exe" goto runPatchMyPC
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
copy /z "\\10.1.10.13\tk\Local\Programs\PatchMyPC.exe" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\PatchMyPC.exe"
goto runPatchMyPC

:callError
call "%~dp0fileError.bat"

:runPatchMyPC
start "Title" "%~dp0KetarinAndPrograms\programs\PatchMyPC.exe"
goto eof

:eof