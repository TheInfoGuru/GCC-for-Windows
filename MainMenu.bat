@echo off

call "%~dp0Files\checkAdmin.bat"
if %errorlevel% == 1 goto eof

:: ============================================= SCRIPT BELOW THIS LINE ============================================::
:MainMenu
Title MainMenu
 color 1F   
 mode 85,25
 set option=[]
 cls
echo                                    %date%
echo.                                                                                     
echo		   	            __  __   ____   _  __  _ 
echo	   			   ^|  ^\/  ^| / () ^\ ^| ^|^|  ^\^| ^|
echo	   			   ^|_^|^\/^|_^|/__/^\__^\^|_^|^|_^|^\__^|
echo         _____________________________________________________________________
echo.
echo           { Main }  ControlPanel   VirusRemoval   Fresh PC   Tools
echo.
echo.   
echo             1. Setup Tech Environment        8. Start Auto Virus Removal
echo             2. Generate Logs                 9. Reset Auto Virus Removal
echo             3. Backup Logs                  10. Turn AutoLogin On
echo             4. Leave Note                   11. Open Net Share Folder
echo             5. Disable UAC                  12. Open Server Log Folder
echo             6. View Local Logs              13. Submit bug/suggestion
echo             7. Auto Deployment (W/R)        14. Final Cleanup
echo.
echo.
echo.
echo.
echo     [M]=Main  [CP]=Control Panel  [VR]=Virus Removal  [FP]=Fresh PC  [T]=Tools
echo.
echo.

 set /p option=Selection: 
 if %option%==1 cls && call "%~dp0Files\techEnvironment.bat"
 if %option%==2 start "Logs" "%~dp0Files\generateLogs.bat"
 if %option%==3 call "%~dp0Files\backupUserLogs.bat"
 if %option%==4 call "%~dp0Files\leaveNote.bat"
 if %option%==5 call "%~dp0Files\disableUAC.bat"
 if %option%==6 call "%~dp0Files\viewLocalLogs.bat"
 if %option%==7 call "%~dp0Files\autoWipeDeploy.bat"
 if %option%==8 call "%~dp0Files\startAutoVirusCleanup.bat"
 if %option%==9 call "%~dp0Files\stopVirusRemoval.bat"
 if %option%==10 call "%~dp0Files\autoLogin.bat"
 if %option%==11 start "Net Share" "\\10.1.10.13\Net"
 if %option%==12 call "%~dp0Files\openServerFolder.bat"
 if %option%==13 start https://goo.gl/forms/J8tAuPXrw5sSBLn42
 if %option%==14 (
	start "Initiate Cleanup" "%~dp0Files\startCleanupNoRestart.bat"
	exit
	)
if %option%==14r (
	start "Initiate Cleanup" "%~dp0Files\startCleanup.bat"
	exit
	)

::Menu Options::

 if /I %option%==M goto MainMenu
 if /I %option%==CP goto ControlPanel
 if /I %option%==VR goto VirusRemoval
 if /I %option%==FP goto FreshPC
 if /I %option%==T goto Tools
 
 goto MainMenu
 
:: ============================================= SCRIPT BELOW THIS LINE ============================================::
:ControlPanel
title Control Panel
 color 1F
 mode 85,25
  set option=[]
 cls
echo                                    %date%
echo.                                                                                     
echo 	     ____  _____ _____  _      _____  ____   __  _  ____  _    
echo 	    / (__^\ ^|_  _^|^| () ^|^| ^|__   ^| ()_)/ () ^\ ^|  ^\^| ^|^| ===^|^| ^|__ 
echo 	    ^\____)  ^|_^|  ^|_^|^\_^\^|____^|  ^|_^|  /__/^\__^\^|_^|^\__^|^|____^|^|____^|
echo         _____________________________________________________________________
echo.
echo            Main  { ControlPanel }  VirusRemoval   Fresh PC   Tools
echo. 
echo.
echo             1. Add/Remove Programs           8. Enable UAC
echo             2. Device Manager                9. Disable UAC
echo             3. Devices and Printers         10. Reboot Menu (Win8+)
echo             4. Create a Restore Point       11. Reboot PC
echo             5. Network and Sharing Center   12. Set boot to safe mode
echo             6. View System Info             13. Set boot to normal mode
echo             7. Set Wireless Guest           14. Jon's Break UAC
echo.
echo.
echo.
echo.
echo     [M]=Main  [CP]=Control Panel  [VR]=Virus Removal  [FP]=Fresh PC  [T]=Tools
echo.
echo.

 set /p option=Selection: 
 if %option%==1 call "%~dp0Files\addOrRemovePrograms.bat"
 if %option%==2 call "%~dp0Files\deviceManager.bat"
 if %option%==3 call "%~dp0Files\devicesAndPrinters.bat"
 if %option%==4 call "%~dp0Files\createRestorePoint.bat"
 if %option%==5 call "%~dp0Files\networkAndSharingCenter.bat"
 if %option%==6 call "%~dp0Files\viewSystem.bat"
 if %option%==7 call "%~dp0Files\setWIFI.bat"
 if %option%==8 call "%~dp0Files\enableUAC.bat"
 if %option%==9 call "%~dp0Files\disableUAC.bat"
 if %option%==10 call "%~dp0Files\uefiRebootMenu.bat"
 if %option%==11 call "%~dp0Files\restartComputer.bat"
 if %option%==12 call "%~dp0Files\safeMode.bat"
 if %option%==13 call "%~dp0Files\normalMode.bat"
 if %option%==14 call "%~dp0Files\breakUAC.bat"
 

::Menu Options::

 if /I %option%==M goto MainMenu
 if /I %option%==CP goto ControlPanel
 if /I %option%==VR goto VirusRemoval
 if /I %option%==FP goto FreshPC
 if /I %option%==T goto Tools
 
goto ControlPanel
 
:: ============================================= SCRIPT BELOW THIS LINE ============================================::
:VirusRemoval
title Virus Removal
 color 1F
 mode 85,25
  set option=[]
 cls
echo                                    %date%
echo.                                                                                     
echo 	   __  __ _ _____  __ __  ____     _____  ____  __  __ __  __ _    
echo 	   ^\ ^\/ /^| ^|^| () )^|  ^|  ^|(_ (_^\    ^| () )^| ===^|^|  ^\/  ^|^\ ^\/ /^| ^|__ 
echo  	    ^\__/ ^|_^|^|_^|^\_^\ ^\___/ .__)__)   ^|_^|^\_^\^|____^|^|_^|^\/^|_^| ^\__/ ^|____^|
echo         _____________________________________________________________________
echo.
echo            Main   ControlPanel  { VirusRemoval }  Fresh PC   Tools
echo.
echo.
echo             1. Download All Programs        7. Run RKill
echo             2. Start Auto Virus Cleanup     8. Run Malwarebytes
echo             3. Run Startup Lite             9. Run HitmanPro
echo             4. Run Geek Uninstaller        10. 
echo             5. Run Junkware Tool           11. Run RogueKillerCMD
echo             6. Run TDSSKiller              12. Open CCleaner
echo.
echo.
echo.
echo.
echo.
echo     [M]=Main  [CP]=Control Panel  [VR]=Virus Removal  [FP]=Fresh PC  [T]=Tools
echo.
echo.

 set /p option=Selection: 
 if %option%==1 pushd "%~dp0Files" && start "Download Programs" "getPrograms.bat"
 if %option%==2 call "%~dp0Files\startAutoVirusCleanup.bat"
 if %option%==3 call "%~dp0Files\runStartupLite.bat"
 if %option%==4 call "%~dp0Files\runGeek.bat"
 if %option%==5 call "%~dp0Files\runJunkwareRemovalTool.bat"
 if %option%==6 call "%~dp0Files\runTDSSKiller.bat"
 if /I %option%==6m call "%~dp0Files\openTDSSKiller.bat"
 if %option%==7 call "%~dp0Files\runRKill.bat"
 if %option%==8 start "title" "%~dp0Files\installAndRunMalwarebytes.bat"
 if /I %option%==8m start "title" "%~dp0Files\installAndOpenMalwarebytes.bat"
 if %option%==9 call "%~dp0Files\runHitmanPro.bat"
 ::if %option%==10
 if %option%==11 call "%~dp0Files\runRogueKillerCMD.bat"
 if %option%==12 call "%~dp0Files\runCCleaner.bat"


::Menu Options::

 if /I %option%==M goto MainMenu
 if /I %option%==CP goto ControlPanel
 if /I %option%==VR goto VirusRemoval
 if /I %option%==FP goto FreshPC
 if /I %option%==T goto Tools
 
 goto VirusRemoval
 
:: ============================================= SCRIPT BELOW THIS LINE ============================================::
:FreshPC
title Fresh PC
 color 1F
 mode 85,25
  set option=[]
 cls
echo                                 %date%
echo.                                                                                     
echo 		    ____ _____  ____   ____  _   _    _____  ____ 
echo			   ^| ===^|^| () )^| ===^| (_ (_^\^| ^|_^| ^|   ^| ()_)/ (__^\
echo 		   ^|__^|  ^|_^|^\_^\^|____^|.__)__)^|_^| ^|_^|   ^|_^|   ^\____)
echo         _____________________________________________________________________
echo.
echo         Main   ControlPanel   VirusRemoval  { Fresh PC }  Tools
echo.
echo.
echo         1. Auto Deployment                      8. Run Ninite
echo         2. Run SDI Drivers                      9. Run Ninite (XP/Vista)
echo         3. Activate Windows                    10. Auto Deployment (Skip Drivers)
echo         4. Set Sumatra PDF as default          11. Start Boot Loop
echo         5. Update Security Essentials (Win7)   12. 
echo         6. Update Windows Defender (Win8+)     13.
echo         7. Run DriverIdentifier (Online Only)  14.
echo.
echo.
echo.
echo.
echo    [M]=Main  [CP]=Control Panel  [VR]=Virus Removal  [FP]=Fresh PC  [T]=Tools
echo.
echo.


 set /p option=Selection: 
 if %option%==1 call "%~dp0Files\autoWipeDeploy.bat"
 if %option%==2 call "%~dp0Files\runSDIauto.bat"
 if /i %option%==2m call "%~dp0Files\openSDI.bat"
 if %option%==3 call "%~dp0Files\activateWindows.bat"
 if %option%==4 call "%~dp0Files\makeSumatraDefault.bat"
 if %option%==5 call "%~dp0Files\updateSecurityEssentials.bat"
 if %option%==6 call "%~dp0Files\updateWindowsDefender.bat"
 if %option%==7 call "%~dp0Files\runDriverIdentifier.bat"
 if %option%==8 call "%~dp0Files\runNinite.bat"
 if %option%==9 call "%~dp0Files\runNiniteXPVista.bat"
 if %option%==10 call "%~dp0Files\autoWipeDeployNoDrivers.bat"
 if %option%==11 call "%~dp0Files\bootLoop.bat"
 ::if %option%==12 call "%~dp0Files\.bat"
:: if %option%==13 call "%~dp0Files\runDriverIdentifier.bat"
:: if %option%==14 call "%~dp0Files\runDriverIdentifier.bat"


::Menu Options::

 if /I %option%==M goto MainMenu
 if /I %option%==CP goto ControlPanel
 if /I %option%==VR goto VirusRemoval
 if /I %option%==FP goto FreshPC
 if /I %option%==T goto Tools
 
goto FreshPC
 
:: ============================================= SCRIPT BELOW THIS LINE ============================================::
:Tools
title Tools
 color 1F
 mode 85,25
  set option=[]
 cls
echo                                 %date%
echo.                                                                                                                                 
echo 		          _____  ____  ____  _      ____ 
echo 		         ^|_   _^|/ () ^\/ () ^\^| ^|__  (_ (_^\
echo   		           ^|_^|  ^\____/^\____/^|____^|.__)__)
echo         _____________________________________________________________________
echo.
echo         Main   ControlPanel   VirusRemoval   Fresh PC  { Tools }
echo.
echo.
echo         1. Stress Test                    8. Process Explorer
echo         2. SpaceSniffer                   9. Windows Update MiniTool
echo         3. Everything Search             10. CPU Temp Monitor
echo         4. System Monitor                11. Turn Win 8/8.1/10 FastBoot Off
echo         5. Software Updater              12. Autoruns
echo         6. BlueScreenView                13. Super Task Manager
echo         7. Windows AIO Repair            14. NEXT PAGE OF TOOLS
echo.
echo.
echo.
echo.
echo     [M]=Main  [CP]=Control Panel  [VR]=Virus Removal  [FP]=Fresh PC  [T]=Tools
echo.
echo.


 set /p option=Selection: 
 if %option%==easterEgg cls && mode 135,62 && type "%~dp0Files\KetarinAndPrograms\programs\media\ee.txt" && pause > nul
 if %option%==1 call "%~dp0Files\runHeavyLoad.bat"
 if %option%==2 call "%~dp0Files\runSpaceSniffer.bat"
 if %option%==3 call "%~dp0Files\runEverything.bat"
 if %option%==4 call "%~dp0Files\runComputerMonitor.bat"
 if %option%==5 call "%~dp0Files\runPatchMyPC.bat"
 if %option%==6 call "%~dp0Files\runBlueScreenView.bat"
 if %option%==7 call "%~dp0Files\runWindowsAIORepair.bat"
 if %option%==8 call "%~dp0Files\runProcessExplorer.bat"
 if %option%==9 call "%~dp0Files\runWinUpMiniTool.bat"
 if %option%==10 call "%~dp0Files\runTempMonitor.bat"
 if %option%==11 call "%~dp0Files\fastStartupOff.bat"
 if %option%==12 call "%~dp0Files\runAutoruns.bat"
 if %option%==13 call "%~dp0Files\runSuperTaskManager.bat"
 if %option%==14 goto tools2


::Menu Options::

 if /I %option%==M goto MainMenu
 if /I %option%==CP goto ControlPanel
 if /I %option%==VR goto VirusRemoval
 if /I %option%==FP goto FreshPC
 if /I %option%==T goto Tools

goto Tools

:: ============================================= SCRIPT BELOW THIS LINE ============================================::
:Tools2
title Tools
 color 1F
 mode 85,25
  set option=[]
 cls
echo                                 %date%
echo.                                                                                                                                 
echo 		          _____  ____  ____  _      ____ 
echo 		         ^|_   _^|/ () ^\/ () ^\^| ^|__  (_ (_^\
echo   		           ^|_^|  ^\____/^\____/^|____^|.__)__)
echo         _____________________________________________________________________
echo.
echo         Main   ControlPanel   VirusRemoval   Fresh PC  { Tools }
echo.
echo.
echo         1. Open Sticky Notes              8. 
echo         2. Open Admin CMD                 9. 
echo         3. Google Chrome                 10. 
echo         4. FreeCommander                 11. 
echo         5. Notepad++                     12. 
echo         6.                               13. 
echo         7.                               14. PREVIOUS PAGE OF TOOLS
echo.
echo.
echo.
echo.
echo     [M]=Main  [CP]=Control Panel  [VR]=Virus Removal  [FP]=Fresh PC  [T]=Tools
echo.
echo.


 set /p option=Selection: 
 if %option%==1 call "%~dp0Files\runPNotes.bat"
 if %option%==2 start "Admin CMD" cmd
 if %option%==3 call "%~dp0Files\runGoogleChrome.bat"
 if %option%==4 call "%~dp0Files\runFreeCommander.bat"
 if %option%==5 call "%~dp0Files\runNotepad++.bat"
 if %option%==14 goto Tools



::Menu Options::

 if /I %option%==M goto MainMenu
 if /I %option%==CP goto ControlPanel
 if /I %option%==VR goto VirusRemoval
 if /I %option%==FP goto FreshPC
 if /I %option%==T goto Tools

goto Tools