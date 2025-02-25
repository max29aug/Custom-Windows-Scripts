<<<<<<< HEAD
# Define the URL to the installer
$InstallerUrl = "https://cdn.watchguard.com/SoftwareCenter/Files/MUVPN_SSL/12_7/WG-MVPN-SSL_12_7.exe"

# Define the path where the installer will be downloaded
$DownloadPath = "$env:TEMP\installer.exe"

# Download the installer
Invoke-WebRequest -Uri $InstallerUrl -OutFile $DownloadPath

# Check if the installer was downloaded successfully
if (Test-Path $DownloadPath) {
    # Start the installer
    Start-Process -FilePath $DownloadPath -ArgumentList "/S" -Wait
    Write-Host "Installation completed successfully."
} else {
    Write-Host "Failed to download the installer from $InstallerUrl"
}
=======
# Define the URL to the installer
$InstallerUrl = "https://cdn.watchguard.com/SoftwareCenter/Files/MUVPN_SSL/12_7/WG-MVPN-SSL_12_7.exe"

# Define the path where the installer will be downloaded
$DownloadPath = "$env:TEMP\installer.exe"

# Download the installer
Invoke-WebRequest -Uri $InstallerUrl -OutFile $DownloadPath

# Check if the installer was downloaded successfully
if (Test-Path $DownloadPath) {
    # Start the installer
    Start-Process -FilePath $DownloadPath -ArgumentList "/S" -Wait
    Write-Host "Installation completed successfully."
} else {
    Write-Host "Failed to download the installer from $InstallerUrl"
}
>>>>>>> 76b4754 (Initial commit)
