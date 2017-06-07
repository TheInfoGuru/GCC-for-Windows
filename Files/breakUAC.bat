@echo off

echo Breaking UAC ...
timeout 1 > nul

::BREAKS UAC
start %windir%\system32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v consentpromptbehavioradmin /t REG_DWORD /d 0 /f

echo UAC Breaking was successful!
timeout 1 > nul