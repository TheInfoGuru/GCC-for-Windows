@echo off

::check for admin control
:checkadmin
call "%~dp0CheckAdmin.bat"
if %errorlevel% == 1 goto eof

::Initiate Cleanup
xcopy /q /y "%~dp0cleanup.bat" "%appdata%"
start "" "%appdata%\cleanup.bat"
exit

::end of file
:eof