@echo off

::check for admin control
:checkadmin
call "%~dp0CheckAdmin.bat"
if %errorlevel% == 1 goto eof

::Initiate Cleanup
xcopy /q /y "%~dp0cleanupNoRestart.bat" "%appdata%"
start "" "%appdata%\cleanupNoRestart.bat"
exit

::end of file
:eof