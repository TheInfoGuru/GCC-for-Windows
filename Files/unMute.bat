@echo off
echo.
if not exist "%~dp0KetarinAndPrograms\programs\nircmd.exe" "%~dp07z.exe" e "%~dp0KetarinAndPrograms\programs\programs.7z" -o"%~dp0KetarinAndPrograms\programs" -y
"%~dp0KetarinAndPrograms\programs\nircmd.exe" mutesysvolume 0 