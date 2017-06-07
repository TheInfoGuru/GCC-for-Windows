@echo off
if [%1]==[/d] goto manualDeployment

::Auto deploy location
::check for logs folder
::if not exist "%appdata%\temp\Global Command Center" mkdir "%appdata%\temp\Global Command Center"
cls
echo Deploying Toolkit ...

::SET ACCESS CREDENTIALS TO SERVER
cmdkey /add:10.1.10.13 /user:Guest > nul

:deployAuto
set "deployLocation=%appdata%\temp\Global Command Center"
xcopy /E /Q /Y /I /Z "%~dp0Files" "%appdata%\temp\Global Command Center\Files"
xcopy /Q /Y /Z "%~dp0MainMenu.bat" "%appdata%\temp\Global Command Center"
"%~dp0Files\KetarinAndPrograms\programs\shortcut.exe" /F:"%userprofile%\desktop\Command Center.lnk" /A:C /T:"%appdata%\temp\Global Command Center\MainMenu.bat" /I:"%appdata%\temp\Global Command Center\Files\KetarinAndPrograms\programs\media\toolkitIcon.ico"
goto displayMessage

::Manually set deploy location
:manualDeployment
call "%~dp0Files\saveFolderLocation.bat" shortcut 
xcopy /E /I /Q /Y /Z "%~dp0Files" "%folderLocation%\Files"
xcopy /E /I /Q /Y /Z "%~dp0MainMenu.bat" "%folderLocation%"
"%~dp0Files\KetarinAndPrograms\programs\shortcut.exe" /F:"%userprofile%\desktop\Command Center.lnk" /A:C /T:"%folderLocation%\MainMenu.bat" /I:"%folderLocation%\files\KetarinAndPrograms\programs\media\toolkitIcon.ico"
goto displayMessage

::Display Message to start toolkit
:displayMessage
title Toolkit Deployment
color 1f
mode 50,7
cls

echo Toolkit has successfully been deployed.
echo Please run shortcut on desktop as admin.
echo Press any key to exit this prompt.
pause > nul
goto eof

:eof
