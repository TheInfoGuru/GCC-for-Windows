@echo off

::check for logs folder
:checkLogs
if exist "%appdata%\temp\logs\" goto setVariables
mkdir "%appdata%\temp\logs\"

::set variables
:setVariables
set "softwareListLocation=%appdata%\temp\logs\softwareList.txt"
set "temp1Location=%appdata%\temp\logs\temp1.txt"
set "temp2Location=%appdata%\temp\logs\temp2.txt"
REM Reference: http://www.techrepublic.com/forum/questions/101-215911/dos-command-to-list-all-installed-programs
echo ===================== >>"%softwareListLocation%
reg export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall "%temp1Location%"
find "DisplayName" "%temp1Location%"| find /V "ParentDisplayName" > "%temp2Location%"
for /f "tokens=2,3 delims==" %%a in (%temp2Location%) do (echo %%a >> "%softwareListLocation%")
echo ==== End of Program List ==== >> "%softwareListLocation%"
del "%temp1Location%"
del "%temp2Location%"
REM type software_list.txt | more
