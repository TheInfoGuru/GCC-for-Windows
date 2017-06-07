::Todays Date without Day
@echo off

for /f "usebackq delims== tokens= 2" %%i in (
  `WMIC OS GET localdatetime /format:value`
  ) do set localTime=%%i

set "YYYY=%localTime:~0,4%"
set "M=%localTime:~4,1%"
set "MM=%localTime:~5,1%"
set "D=%localTime:~6,1%"
set "DD=%localTime:~7,1%"

if %M%==0 set M=
if %D%==0 set D=

set todayDate=%M%%MM%_%D%%DD%_%YYYY%