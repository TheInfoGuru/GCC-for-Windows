@echo off

bcdedit /set {current} safeboot network

echo Boot mode set to safe mode with Networking
timeout 3 > nul