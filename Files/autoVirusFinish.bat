@echo off
setlocal


::set variables
set waveLocation=%~dp0KetarinAndPrograms\programs\media\autoVirusFinish.wav

::Play sound
powershell -c (New-Object Media.SoundPlayer '%waveLocation%').PlaySync();

::end of file
:eof
endlocal