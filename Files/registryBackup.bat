@echo off
setlocal

echo Registry Backup Started
echo Please wait ...

::REM Generate file
::check for logs folder
if exist "%appdata%\temp\logs\" goto startLoop
mkdir "%appdata%\temp\logs\"

:startLoop
for %%k in (lm cu cr u cc) do call :ExpReg %%k
goto :eof
:ExpReg
reg.exe export hk%1 "%appdata%\temp\logs\hk%1.reg" /y > nul 
if "%errorlevel%"=="1" (
  echo ^>^> Export --hk%1-- Failed.
) else (
  echo ^>^> Export --hk%1-- Fine.
)

timeout 3 > nul
goto :eof
endlocal