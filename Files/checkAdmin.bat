@echo off


set $NOTADMIN=0
if [%SAFEBOOT_OPTION%] == [] goto check_Permissions
goto eof

:check_Permissions
net session >nul 2>&1

::If not admin ...
if not %errorlevel% == 0 (
cls
color 4f 
echo Need to run as admin! 
echo Press any key to exit.
pause > nul
exit /b 1
)

:eof
