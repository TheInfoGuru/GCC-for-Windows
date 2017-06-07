@echo off
cls
call "%~dp0listPrograms.bat"
call "%~dp0generateInfo.bat"
call "%~dp0saveWireless.bat"
call "%~dp0getComputerInfo.bat"
call "%~dp0getBlueScreens.bat"
call "%~dp0getProductKeys.bat"
call "%~dp0getSMARTData.bat"
goto eof

:eof
exit