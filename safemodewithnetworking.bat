@echo off
echo Launching Windows 11 in Safe Mode with Networking...

REM Create a scheduled task to boot into Safe Mode with Networking on next restart
schtasks /create /tn "SafeMode" /tr "bcdedit /set {current} safeboot network" /sc once /st 00:00

REM Prompt the user to restart the system
echo.
echo The system will restart in Safe Mode with Networking on the next boot.
echo Please save your work and press any key to restart the system.
pause >nul

REM Restart the system
shutdown /r /t 0
