# Specify the drive letter or path you want to perform disk cleanup on
$driveLetter = "C:"

# Perform disk cleanup
Start-Process "cleanmgr.exe" -ArgumentList "/sagerun:1" -Wait

Write-Host "Disk cleanup on drive $driveLetter completed."
