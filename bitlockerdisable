# Check if BitLocker is enabled on any volume
$bitlockerEnabled = Get-BitLockerVolume | Where-Object { $_.EncryptionStatus -eq "Encrypted" }

# If BitLocker is enabled, prompt user for confirmation before disabling
if ($bitlockerEnabled) {
  Write-Host "BitLocker is currently enabled on this machine. Are you sure you want to disable it? (y/N)"
  $confirm = Read-Host ""
  if ($confirm -ne "y" -and $confirm -ne "Y") {
    Write-Host "BitLocker will not be disabled."
    exit
  }
}

# Disable BitLocker on all encrypted volumes
Get-BitLockerVolume | Where-Object { $_.EncryptionStatus -eq "Encrypted" } | ForEach-Object {
  Disable-BitLocker -MountPoint $_.MountPoint -Quiet
  Write-Host "BitLocker disabled on volume $_.MountPoint"
}

# Wait for BitLocker decryption to complete (optional)
Start-Sleep -Seconds 60
$decrypted = Get-BitLockerVolume | Where-Object { $_.EncryptionStatus -eq "FullyDecrypted" }
if ($decrypted.Count -ne $bitlockerEnabled.Count) {
  Write-Host "Warning: Not all volumes are fully decrypted. Consider waiting longer before proceeding with re-imaging."
} else {
  Write-Host "All encrypted volumes are now fully decrypted."
}


