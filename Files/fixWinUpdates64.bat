@echo off

:copyWinUpdateFix64
::retrieve update from local server
if exist "%appdata%\temp\UpdateFix64.msu" goto runWinUpdateFix64
copy "\\10.1.10.13\tk\UpdateFix64.msu" "%appdata%\temp\"

:runWinUpdateFix64
start "start Update Fix" "%appdata%\temp\UpdateFix64.msu"
goto eof

:eof
exit