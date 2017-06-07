@echo off

if exist "%~dp0KetarinAndPrograms\programs\PNotes\PNotesPortable.exe" goto runPNotes
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
xcopy /E /Z "\\10.1.10.13\tk\Local\Programs\PNotes.7z" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs"
"%~dp07z.exe" x "%~dp0KetarinAndPrograms\Programs\PNotes.7z" -o"%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs"
del /q "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\PNotes.7z"
goto runPNotes

:callError
echo Must have a connection with server to run this tool.
timeout 7 > nul
goto eof

:runPNotes
start "" "%~dp0KetarinAndPrograms\programs\PNotes\PNotesPortable.exe"
goto eof

:eof