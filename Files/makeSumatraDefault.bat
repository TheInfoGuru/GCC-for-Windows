@echo off

if exist "%ProgramFiles%\SumatraPDF\SumatraPDF.exe" goto setDefault
echo SumatraPDF not installed!
timeout 5 > nul
goto eof

:setDefault
start "Set SumatraPDF as Default" "%ProgramFiles%\SumatraPDF\SumatraPDF.exe" -register-for-pdf

:eof