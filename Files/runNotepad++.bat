@echo off

if exist "%~dp0KetarinAndPrograms\programs\Notepad++Portable\Notepad++Portable.exe" goto runNotepad++
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
xcopy /E /Z "\\10.1.10.13\tk\Local\Programs\notepad++.7z" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs"
"%~dp07z.exe" x "%~dp0KetarinAndPrograms\Programs\notepad++.7z" -o"%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs"
del /q "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\notepad++.7z"
goto runNotepad++

:callError
echo Must have a connection with server to run this tool.
timeout 7 > nul
goto eof

:runNotepad++
start "" "%~dp0KetarinAndPrograms\programs\Notepad++Portable\Notepad++Portable.exe"
goto eof

:eof