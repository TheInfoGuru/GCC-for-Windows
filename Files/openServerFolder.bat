@echo off
call "%~dp0checkServerConnection.bat"
if %errorlevel% == 1 goto errorMessage

start "" "\\10.1.10.13\CustomerLogs"
goto eof

::end of file
:eof
exit /b 0

::error Message
:errorMessage
cls
title No Server Connection

echo Connection to server cannot be made.
echo Please check your connection.
timeout 5 > nul
goto eof