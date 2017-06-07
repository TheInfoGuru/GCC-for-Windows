@echo off

setlocal

::check for admin
call "%~dp0checkAdmin.bat"
if %errorlevel% == 1 goto eof

::disable uac
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
cls
echo UAC successfully disabled
timeout 3 > nul
goto eof

::end of file
:eof
endlocal