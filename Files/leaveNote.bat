@echo off
mode 100,40
color 1f
title Leave Note

::set variables
:setVariables
set "noteLocation=%appdata%\temp\logs"

::check for logs folder
if exist "%noteLocation%" goto leaveNote
mkdir "%noteLocation%"

::get Note
:leaveNote
cls
echo. 
echo Leave your note below. It will be in the logs folder.
echo --------------------------
set /p noteLeft=:
call "%~dp0cursorNormal.bat"

::add time and date to note
call "%~dp0getDate.bat"
set "fullNote=%todayDate% %time% --- %noteLeft%"

::write the note
:writeNote
if exist "%noteLocation%\TechNotes.txt" echo ################################# >> "%noteLocation%\TechNotes.txt"
echo %fullNote% >> "%noteLocation%\TechNotes.txt"
goto eof

::end of file
:eof