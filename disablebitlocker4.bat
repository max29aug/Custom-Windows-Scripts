@echo off
setlocal

REM Specify the drive letter
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

REM Wait for the decryption to complete
:CheckStatus
manage-bde -status %driveLetter% | find "Percentage Encrypted" | find "0%" >nul
if %errorlevel% neq 0 (
    echo Waiting for decryption to complete. This may take some time...
    timeout /t 60 >nul
    goto CheckStatus
)

echo Decryption completed successfully.
endlocal
