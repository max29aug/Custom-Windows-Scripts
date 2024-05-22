# Ensure the script is run as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Host "This script must be run as an Administrator" -ForegroundColor Red
    exit
}

# Function to decrypt and disable BitLocker on a specified drive
function Disable-BitLocker($driveLetter) {
    try {
        # Check if BitLocker is enabled on the specified drive
        $bitLockerStatus = Get-BitLockerVolume -MountPoint $driveLetter
        if ($bitLockerStatus.ProtectionStatus -eq 'On') {
            Write-Host "BitLocker is enabled on drive $driveLetter. Decrypting and disabling BitLocker..." -ForegroundColor Yellow

            # Disable BitLocker and start decryption
            Disable-BitLocker -MountPoint $driveLetter

            # Monitor decryption progress
            do {
                $bitLockerStatus = Get-BitLockerVolume -MountPoint $driveLetter
                Write-Host "Decryption Progress: $($bitLockerStatus.DecryptionPercentage)%"
                Start-Sleep -Seconds 5
            } while ($bitLockerStatus.ProtectionStatus -eq 'On' -or $bitLockerStatus.VolumeStatus -eq 'DecryptionInProgress')

            Write-Host "BitLocker has been successfully decrypted and disabled on drive $driveLetter." -ForegroundColor Green
        } else {
            Write-Host "BitLocker is not enabled on drive $driveLetter." -ForegroundColor Green
        }
    } catch {
        Write-Host "An error occurred: $_" -ForegroundColor Red
    }
}

# Specify the drive letter to decrypt and disable BitLocker
$driveLetter = "C:"  # Change this to the appropriate drive letter if necessary

# Call the function to disable BitLocker
Disable-BitLocker -driveLetter $driveLetter
