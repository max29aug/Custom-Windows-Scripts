@echo off

REM Enable specified services and their dependencies
REM Note: Modifying services in Safe Mode may not work as expected due to system restrictions

REM Enable FWASvc service and its dependencies
sc config FWASvc start= auto
sc config Tcpip depend= FWASvc

REM Enable USEngine service and its dependencies
sc config USEngine start= auto
sc config RpcSs depend= USEngine

REM Enable FWUSvc service and its dependencies
sc config FWUSvc start= auto
sc config RpcSs depend= FWUSvc

REM Set the system to boot into Safe Mode with Networking
bcdedit /set {current} safeboot network

REM Prompt the user to save their work
echo.
echo The system will restart in Safe Mode with Networking.
echo Please save your work and press any key to continue.
pause >nul

REM Reboot the system
shutdown /r /t 0 /f
