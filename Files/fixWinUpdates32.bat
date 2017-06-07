@echo off

:copyWinUpdateFix32
::retrieve update from local server
if exist "%appdata%\temp\UpdateFix32.msu" goto runWinUpdateFix32
copy "\\10.1.10.13\tk\UpdateFix32.msu" "%appdata%\temp\"

:runWinUpdateFix32
start "start Update Fix" "%appdata%\temp\UpdateFix32.msu"
goto eof

:eof
exit