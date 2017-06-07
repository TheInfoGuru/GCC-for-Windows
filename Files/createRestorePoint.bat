@echo off
setlocal

if not [%SAFEBOOT_OPTION%] == [] (
cls
echo Cannot create restore point automatically in Safe Mode ...
timeout 7 > nul
goto eof
)

reg import "%~dp0Default_VBS.reg"
cscript "%~dp0createRestorePoint.vbs"
goto eof

:eof