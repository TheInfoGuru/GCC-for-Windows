@echo off

bcdedit /deletevalue {current} safeboot

echo Boot mode set to normal
timeout 3 > nul