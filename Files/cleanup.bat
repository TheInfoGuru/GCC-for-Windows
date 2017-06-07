@echo off
echo Loading ...
timeout 5 > nul
mode 70,15
color 1f
title Cleanup Mess
setlocal ENABLEDELAYEDEXPANSION
::Check if log folder exists
if not exist "%appdata%\temp\logs" goto checkAutoLogin

::Last chance to backup Log folder::
::presetting variable to answer yes
set backupChoice=y

echo LAST CHANCE TO BACKUP GENERATED LOGS!!
echo Would you like to back them up now? (Y/n)
set /p backupChoice=:

if /I %backupChoice% == y (
call "%~dp0temp\Global Command Center\Files\backupUserLogs.bat"
::if not %errorlevel% == 1 goto $halt
goto checkAutoLogin
)
if /I %backupChoice% == n goto checkAutoLogin

::Determine if autologin was turned on when computer originally had no password and default asdf password was used
:checkAutoLogin
reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword | find "asdf" > nul
if %errorlevel% == 0  call "%~dp0temp\Global Command Center\Files\setBlankPassword.bat" && goto removeStuff
if %errorlevel% == 1 goto removeStuff
echo Could not determine if default password was used ...
echo Not changing password; do so manually if needed ...
timeout 5 > nul
goto removeStuff

::remove stuff
:removeStuff
call "%~dp0temp\Global Command Center\Files\enableUAC.bat"
call "%~dp0temp\Global Command Center\Files\autoLoginOff"
start %windir%\system32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v consentpromptbehavioradmin /t REG_DWORD /d 5 /f
set itemsRemoved=0
cls
echo Uninstalling Tech Malwarebytes ...
if exist "%ProgramFiles(x86)%\Malwarebytes' Anti-Malware\unins000.exe" "%ProgramFiles(x86)%\Malwarebytes' Anti-Malware\unins000.exe" /silent /norestart &&  set /a itemsRemoved=%itemsRemoved%+1
if exist "%ProgramFiles%\Malwarebytes' Anti-Malware\unins000.exe" "%ProgramFiles%\Malwarebytes' Anti-Malware\unins000.exe" /silent /norestart &&  set /a itemsRemoved=%itemsRemoved%+1
echo Removing Malwarebytes License Key ...
reg delete "HKLM\software\wow6432node\malwarebytes' anti-malware" /f
reg delete "HKLM\software\malwarebytes' anti-malware" /f
echo Removing any logs from the desktop ...
if exist "%userprofile%\desktop\jrt.txt" del /f/q "%userprofile%\desktop\jrt.txt" &&  set /a itemsRemoved=%itemsRemoved%+1
if exist "%userprofile%\desktop\rkill.txt" del /f/q "%userprofile%\desktop\rkill.txt" &&  set /a itemsRemoved=%itemsRemoved%+1
echo Removing appdata leftovers ...
if exist "%appdata%\Malwarebytes\Malwarebytes' Anti-Malware" rmdir /q /s "%appdata%\Malwarebytes\Malwarebytes' Anti-Malware" &&  set /a itemsRemoved=%itemsRemoved%+1
if exist "%appdata%\Geek Uninstaller" rmdir /q /s "%appdata%\Geek Uninstaller" &&  set /a itemsRemoved=%itemsRemoved%+1
if exist "%appdata%\driveridentifier" rmdir /q /s "%appdata%\driveridentifier" &&  set /a itemsRemoved=%itemsRemoved%+1
if exist "%~d0\ADWcleaner" rmdir /q /s "%~d0\ADWcleaner" &&  set /a itemsRemoved=%itemsRemoved%+1
echo Removing temp folder placed on in appdata ...
if exist "%appdata%\temp" rmdir  /q /s "%appdata%\temp" &&  set /a itemsRemoved=%itemsRemoved%+1
echo Removing Desktop shortcut icon ...
if exist "%userprofile%\desktop\Command Center.lnk" del /f /q "%userprofile%\desktop\Command Center.lnk" &&  set /a itemsRemoved=%itemsRemoved%+1
echo -------------------------------------------------
echo Cleanup Succesful! Removed %itemsRemoved% items!
timeout 5 > nul
echo Restarting computer to finish cleanup ...
shutdown -r -t 10 -f
(goto) 2>nul & del "%~f0" && exit
goto eof

:eof
exit

::ERROR OCCURED TRANSFERRING LOGS
:$halt
color 4f
mode 80,10
cls
echo AN ERROR OCCURED BACKING UP LOGS!
echo CLEANUP PROCESS HAS BEEN HALTED!
echo MANUALLY BACKUP LOG FOLDER TO SAVE DATA!
pause
exit
