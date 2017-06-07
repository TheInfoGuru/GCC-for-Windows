@echo off
title Auto Deploy
mode 70, 20
color 1f

::Check admin
::call "%~dp0checkAdmin.bat"
::if %errorlevel% == 1 goto eof

cls && echo Loading ...
timeout 15 > nul

::Either start or resume
set "rebootFileLocation=%appdata%\temp\autoRebootWipe.txt"
if not exist "%appdata%\temp\" mkdir "%appdata%\temp\"
call :Resume
goto %current%
goto :eof

::########################ONE##########################
:one
::Add script to Run key
echo [%time%] [INFO] Setting registry key for restart process
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v AutoDeploy /d "%~dpnx0" /f

::inject Computer Resource Guest Wifi
echo [%time%] [INFO] Importing wireless Profile
call "%~dp0setWIFI.bat"

::set volume
echo [%time%] [INFO] Setting volume
call "%~dp0unMute.bat"
call "%~dp0setVolume.bat"

::Run Tech Environment
echo [%time%] [INFO] Setting up Tech Environment
call "%~dp0techEnvironmentAuto.bat"

::Get Drivers
::cls && echo [%time%] [INFO] Starting SDI
::call "%~dp0runSDIauto.bat"
::echo [%time%] [INFO] Waiting for SDI to finish
::timeout 30 > nul
	::loopStartA
	::ver > nul
	::tasklist /FI "imagename eq SDI*" 2>NUL | find /i /n "sdi" >NUL
	::if not %errorlevel% == 0 goto loopEndA
	::goto loopStartA
::loopEndA	
::echo [%time%] [INFO] SDI has finished
echo two >"%rebootFileLocation%"
echo [%time%] [INFO] Rebooting Computer
call "%~dp0restartComputer.bat"
goto eof

::########################TWO##########################
::Run Ninite
:two
cls && echo [%time%] [INFO] Starting Ninite
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "6.0" call "%~dp0runNiniteXPVista.bat" && goto loopStartBA 
echo [%time%] [INFO] Waiting on Ninite to finish
call "%~dp0runNinite.bat"
timeout 10 > nul
	:loopStartBA
	timeout 40 > nul
	if exist "%ProgramFiles%\LibreOffice*" goto loopBB
	goto loopStartBA
		:loopBB
		cd "%ProgramFiles%\LibreOffice*"
		:loopStartBB
		timeout 15 > nul
		if exist "license.html" goto finalLoop
		goto loopStartBB
	:finalLoop
	timeout 120 > nul
	taskkill /f /fi "imagename eq ninite*" 
	call "%~dp0checkCPUType.bat"
		if %cpuType% == 32 set "appFolder=%ProgramFiles%"
		if %cpuType% == 64 set "appFolder=%ProgramFiles(x86)%"
	for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
	if "%version%" == "6.0" goto endLoopB
	echo [%time%] [INFO] Making sure Chrome gets installed
	call "%~dp0runNinite.bat"
		:finalLoopStart
		timeout 45 > nul
		if exist "%appFolder%\Google\Chrome\Application\chrome.exe" timeout 30 > nul && goto endLoopB
		goto finalLoopStart		
:endLoopB		
echo [%time%] [INFO] Ninite is finished
echo three >"%rebootFileLocation%"
echo [%time%] [INFO] Rebooting computer
call "%~dp0restartComputer.bat"
goto eof

::#######################THREE#########################
::Finishing Deployment
:three
cls && echo [%time%] [INFO] Finishing deployment
timeout 1 > nul
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION2=%%i.%%j
echo [%time%] [INFO] Trying to make Sumatra Default PDF Reader
call "%~dp0makeSumatraDefault.bat"
if not %version2% == 6.0 goto setShortcut
reg import "%~dp0Default_VBS.reg"
timeout 1 > nul
echo [%time%] [INFO] Making Firefox Default
cscript "%~dp0setFirefoxDefault.vbs"
::set shortcut
:setShortcut
echo [%time%] [INFO] Setting Computer Resource Contact shortcut on desktop
if not exist "%~dp0KetarinAndPrograms\programs\nircmd.exe" "%~dp07z.exe" e "%~dp0KetarinAndPrograms\programs\programs.7z" -o"%~dp0KetarinAndPrograms\programs" -y
"%~dp0KetarinAndPrograms\programs\nircmd.exe" urlshortcut "https://www.google.com/maps/place/Computer+Resource/@30.5899514,-88.1993071,13z/data=!4m8!1m2!2m1!1scomputer+resoruce!3m4!1s0x0:0x6b389abef3befa6d!8m2!3d30.5905816!4d-88.1706369" "~$folder.desktop$" "Computer Resource Contact Information"
::updateLoop
::	timeout 15 > nul
::	ver > nul
::	tasklist /FI "imagename eq MpCmdRun*" 2>NUL | find /i /n "MpCmdRun" >NUL
::	if not %errorlevel% == 0 goto doneUpdates
::	goto updateLoop
::doneUpdates
::echo [%time%] [INFO] Malware Definitions have been updated.
echo four >"%rebootFileLocation%"
echo [%time%] [INFO] Rebooting Computer
call "%~dp0restartComputer.bat"
goto eof

::#######################FOUR#########################
::FINISHED!!
:four
color 2F
mode 90,5
title Deployment Complete

for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION2=%%i.%%j
if "%version2%" == "6.1" call "%~dp0activateWindows.bat"
echo [%time%] [INFO] Opening MS AntiVirus. Please manually update virus definitions.
if "%version2%" == "6.0" start "Update" "%~dp0updateSecurityEssentialsDeploy.bat" && goto cleanupDeploy
if "%version2%" == "6.1" start "Update" "%~dp0updateSecurityEssentialsDeploy.bat" && goto cleanupDeploy
start "Update" "%~dp0updateWindowsDefenderDeploy.bat"

timeout 3 > nul

::Remove script from Run key
:cleanupDeploy
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v AutoDeploy /f
del %rebootFileLocation%

cls
echo [%time%] [INFO] AUTO PC DEPLOYMENT FINISHED SUCCESSFULLY!
echo [%time%] [INFO] PLEASE PRESS ANY KEY TO CLOSE THIS SCREEN
call "%~dp0autoVirusFinish.bat"
pause > nul
goto :eof

:eof
exit

::Resume or set start script
:resume
if exist "%rebootFileLocation%" (
    set /p current=<"%rebootFileLocation%"
) else (
    set current=one
)