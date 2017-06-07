@echo off

if exist "%~dp0KetarinAndPrograms\programs\Tweaking.com - Windows Repair\Repair_Windows.exe" goto runWindowsAIO
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
xcopy /E /Z "\\10.1.10.13\tk\Local\Programs\tweaking.com_windows_repair_aio.zip" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs"
"%~dp07z.exe" x "%~dp0KetarinAndPrograms\Programs\tweaking.com_windows_repair_aio.zip" -o"%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs"
del /q "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\tweaking.com_windows_repair_aio.zip"
goto runWindowsAIO

:callError
echo Must have a connection with server to run this tool.
timeout 7 > nul
goto eof

:runWindowsAIO
start "" "%~dp0KetarinAndPrograms\programs\Tweaking.com - Windows Repair\Repair_Windows.exe"
goto eof

:eof