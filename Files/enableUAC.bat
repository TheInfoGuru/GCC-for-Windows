@echo off

setlocal

::check for admin
call "%~dp0checkAdmin.bat"
if %errorlevel% == 1 goto eof

::enable uac
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f 
cls
echo UAC successfully enabled
timeout 3 > nul
goto eof

::end of file
:eof
endlocal