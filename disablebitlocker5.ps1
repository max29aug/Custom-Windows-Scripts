# Disable BitLocker on all encrypted drives

# Function to disable BitLocker on a given drive
function Disable-BitLockerOnDrive {
    param (
        [string]$DriveLetter
    )

    # Check the BitLocker status
    $bitlockerStatus = Get-BitLockerVolume -MountPoint $DriveLetter

    if ($bitlockerStatus.ProtectionStatus -eq "On") {
        Write-Host "BitLocker is enabled on drive $DriveLetter. Disabling BitLocker..."
        Disable-BitLocker -MountPoint $DriveLetter
        
        # Wait for the decryption to complete
        Write-Host "Waiting for decryption to complete on drive $DriveLetter. This may take some time..."
        $bitlockerVolume = Get-BitLockerVolume -MountPoint $DriveLetter
        while ($bitlockerVolume.VolumeStatus -ne "FullyDecrypted") {
            Start-Sleep -Seconds 60
            $bitlockerVolume = Get-BitLockerVolume -MountPoint $DriveLetter
            Write-Host "Current status for $DriveLetter: $($bitlockerVolume.VolumeStatus)"
        }
        
        Write-Host "Decryption completed successfully on drive $DriveLetter."
    } else {
        Write-Host "BitLocker is already disabled on drive $DriveLetter."
    }
}

# Get all BitLocker volumes
$bitlockerVolumes = Get-BitLockerVolume

# Iterate through each BitLocker volume and disable BitLocker
foreach ($volume in $bitlockerVolumes) {
    Disable-BitLockerOnDrive -DriveLetter $volume.MountPoint
}
