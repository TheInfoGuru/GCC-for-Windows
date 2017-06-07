::@echo off
setlocal

::check if in safe mode
call "%~dp0checkAdmin.bat"
if %errorlevel% == 1 goto eof

reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 0 /f
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /f
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /f
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultDomainName /f

cls
echo AutoLogin Successfully Turned Off
timeout 3 > nul

:eof
endlocal