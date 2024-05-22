@echo off
setlocal

REM Specify the drive letter to disable BitLocker on
set driveLetter=C:

REM Check BitLocker status
manage-bde -status %driveLetter% | find "Percentage Encrypted" >nul
if %errorlevel% neq 0 (
    echo BitLocker is not enabled on drive %driveLetter%.
    exit /b
)

REM Disable BitLocker
echo Disabling BitLocker on drive %driveLetter%...
manage-bde -off %driveLetter%
echo BitLocker decryption initiated on drive %driveLetter%. Decryption will continue in the background.

endlocal
