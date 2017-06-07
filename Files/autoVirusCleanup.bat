@echo off
title Auto Virus Removal
mode 70, 20
color 1f

::Check admin
::call "%~dp0checkAdmin.bat"
::if %errorlevel% == 1 goto eof

cls && echo Loading ...
timeout 15 > nul

::Either start or resume
set "rebootFileLocation=%appdata%\temp\autoReboot.txt"
if not exist "%appdata%\temp\" mkdir "%appdata%\temp\"
call :Resume
goto %current%
goto :eof

:one
::try and get local files
echo [%time%] [INFO] Attempting to get files from server
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto callError
for %%i in (startuplite.exe geek.exe jrt.exe tdsskiller.exe rkill.com mbam-setup-1.75.0.1300.exe HitmanPro_x64.exe HitmanPro.exe roguekillercmd.exe roguekillercmdx64.exe) do xcopy /e /i /z "\\10.1.10.13\tk\Local\Programs\%%i" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs"
xcopy /e /i /z "\\10.1.10.13\tk\Local\Programs\CCleaner" "%appdata%\temp\Global Command Center\files\KetarinAndPrograms\programs\CCleaner"
goto startCleanup

::Update All Malware Tool
:callError
echo [%time%] [ERROR] Could not get files from server
echo [%time%] [ERROR] Stopping script.
::echo [%time%] [INFO] Attempting to get files through Ketarin
::call "%~dp0checkServerConnection.bat"
::if %errorlevel%==0 call "%~dp0getLocalPrograms.bat"
::start "Get Programs" "%~dp0getPrograms.bat"
exit /b 1

::start cleanup
:startCleanup
::Add script to Run key
echo [%time%] [INFO] Adding registry to continue after reboot
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v AutoVirusCleanup /d "%~dpnx0" /f

::Create restore point
echo [%time%] [INFO] Attempting to create restore point
call "%~dp0createRestorePoint.bat"

::Run Tech Environment
echo [%time%] [INFO] Setting up tech environment
call "%~dp0techEnvironmentVirus.bat"

::set volume
echo [%time%] [INFO] Setting volume
call "%~dp0unMute.bat"
call "%~dp0setVolume.bat"

::basic check loop
::loopBegin
::cls 
::echo [%time%] [INFO] Checking to see if downloads are finished
::if exist "%~dp0KetarinAndPrograms\programs\RogueKillerCMDX64.exe" goto startCleanup
::timeout 7 > nul
::goto loopBegin

cls && echo [%time%] [INFO] Starting StartupLite
call "%~dp0runStartupLite.bat"
timeout 1 > nul
echo [%time%] [INFO] Starting Geek Uninstaller
call "%~dp0runGeek.bat"
timeout 1 > nul
call "%~dp0manualRestartMessage.bat"
echo three >"%rebootFileLocation%"
goto eof

:three
cls && echo [%time%] [INFO] Starting Junkware Removal Tool
start "Attention" "%~dp0attentionBat.bat"
call "%~dp0runJunkwareRemovalTool.bat"
echo [%time%] [INFO] Waiting on Junkware Removal Tool to finish
call "%~dp0junkwareRemovalToolFinish.bat"
call "%~dp0scanFinishedSound.bat"
timeout 5 > nul
echo four >"%rebootFileLocation%"
echo [%time%] [INFO] Rebooting computer
call "%~dp0restartComputer.bat"
goto eof

:four
move /Y "%userprofile%\desktop\JRT.txt" "%appdata%\temp\logs\"
cls && echo [%time%] [INFO] Starting TDSSKiller
call "%~dp0runTDSSKiller.bat"
echo [%time%] [INFO] Waiting on TDSSKiller to finish
call "%~dp0TDSSKillerFinish.bat"
call "%~dp0scanFinishedSound.bat"
timeout 5 > nul
echo five >"%rebootFileLocation%"
echo [%time%] [INFO] Reboot computer
call "%~dp0restartComputer.bat"
goto eof

:five
cls && echo [%time%] [INFO] Starting RKill
call "%~dp0runRKill.bat"
echo [%time%] [INFO] Waiting for RKill to finish
call "%~dp0RKillFinish.bat"
cls && echo [%time%] [INFO] Waiting for things to finish up
timeout 5 > nul
goto six
cls && echo [%time%] [INFO] Starting Malwarebytes Anti-Malware
call "%~dp0installAndRunMalwarebytes.bat"
echo [%time%] [INFO] Waiting for Malwarebytes to finish
call "%~dp0malwarebytesFinish.bat"
call "%~dp0scanFinishedSound.bat"
timeout 5 > nul
echo six >"%rebootFileLocation%"
echo [%time%] [INFO] Rebooting computer
call "%~dp0restartComputer.bat"
goto :eof

:six
cls && echo [%time%] [INFO] Starting Hitman Pro
call "%~dp0runHitmanPro.bat"
echo [%time%] [INFO] Waiting for Hitman Pro to finish
call "%~dp0hitmanProFinish.bat"
call "%~dp0scanFinishedSound.bat"
timeout 5 > nul
echo eight >"%rebootFileLocation%"
echo [%time%] [INFO] Reboot computer
call "%~dp0restartComputer.bat"
goto :eof

::seven
::cls && echo Starting ADWCleaner
::start "Attention" "%~dp0attentionBat.bat"
::call "%~dp0runADWCleaner.bat"
::call "%~dp0ADWCleanerFinish.bat"
::call "%~dp0unMute.bat"
::call "%~dp0setVolume.bat"
::call "%~dp0scanFinishedSound.bat"
::timeout 5 > nul
::echo eight >"%rebootFileLocation%"
::call "%~dp0restartComputer.bat"
::goto :eof

:eight
cls && echo [%time%] [INFO] Starting RogueKillerCMD
call "%~dp0runRogueKillerCMD.bat"
echo [%time%] [INFO] Waiting for RogueKillerCMD to finish
call "%~dp0rogueKillerFinish.bat"
call "%~dp0scanFinishedSound.bat"
timeout 5 > nul
echo nine >"%rebootFileLocation%"
echo [%time%] [INFO] Rebooting computer
call "%~dp0restartComputer.bat"
goto :eof

:nine
cls && echo [%time%] [INFO] Starting CCleaner in the background
call "%~dp0runCCleanerAuto.bat"
cls
echo [%time%] [INFO] CCleaner is running in the background please wait ...
timeout 7 > nul
call "%~dp0CCleanerFinish.bat"
call "%~dp0scanFinishedSound.bat"
timeout 5 > nul
echo ten >"%rebootFileLocation%"
echo [%time%] [INFO] Rebooting computer
call "%~dp0restartComputer.bat"
goto :eof

:ten
color 2F
mode 90,5
title Virus Removal Complete


::Remove script from Run key
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v AutoVirusCleanup /f
del %rebootFileLocation%

cls
echo [%time%] [INFO] VIRUS REMOVAL COMPLETED SUCCESSFULLY!
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