@echo off

::set variables
set waveLocation="%~dp0KetarinAndPrograms\programs\media\attention.wav"

::Play sound
:playSound
powershell -c (New-Object Media.SoundPlayer '%waveLocation%').PlaySync();
timeout 30 > nul

::end of file
:eof
