@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
::check if in safe mode
call "%~dp0checkAdmin.bat"
if %errorlevel% == 1 goto eof

::Set variables
:enterPassword
mode 85,15
cls
echo Please enter the password for the current user
set /p userPassword=:
if [%userPassword%] == [] goto $choice
goto setLogin

:$choice
set userAnswer=n
cls
echo Are you sure you want to skip? (y/N)
set /p userAnswer=:
if /I %userAnswer% == n goto makePassword
if /I %userAnswer% == y goto eof
goto $choice

::make password
:makePassword
set passwordAnswer=n
cls
echo Would you like to set default password(asdf) and turn on Auto Login? (y/N)
echo [Used to turn on AutoLogin with multiple users/no password]
set /p passwordAnswer=:
if /I %passwordAnswer% == n goto enterPassword
if /I %passwordAnswer% == y goto createUserPassword
goto makePassword

::create user password
:createUserPassword
net user "%username%" asdf
set userPassword=asdf
goto setLogin

::set registry to auto login
:setLogin
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d "%username%" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d "%userPassword%" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultDomainName /t REG_SZ /d "%computername%" /f

cls
echo AutoLogin Successfully Turned On
timeout 3 > nul
goto eof

:eof
endlocal