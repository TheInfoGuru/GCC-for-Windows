@echo off
mkdir "%~dp0programs" 2> nul
"%~dp0ketarin.exe" /silent /log=ketarinlog.txt
exit