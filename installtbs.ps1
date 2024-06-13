# Define the URL and file paths
$url = "https://cuyahogalibrary.sharepoint.com/:u:/g/publicfolders/Eamn7u3eTDtPoJLSBXtcedgBi6wFdcgER8kZxI5V8YQ8kg?download=1"
$installerPath = "C:\Temp\TBS_INSTALLER_7.0.0.9.exe"
$logFilePath = "C:\Temp\install.log"

# Create Temp directory if it does not exist
if (!(Test-Path -Path "C:\Temp")) {
    New-Item -ItemType Directory -Path "C:\Temp"
}

# Download the installer
Invoke-WebRequest -Uri $url -OutFile $installerPath

# Verify the installer is downloaded
if (-Not (Test-Path -Path $installerPath)) {
    Write-Host "Download failed. Exiting script."
    exit 1
}

# Run the installer with silent mode and logging
Start-Process -FilePath $installerPath -ArgumentList "/silent /norestart /log=$logFilePath" -Wait

# Check if the installation log exists and print a message accordingly
if (Test-Path -Path $logFilePath) {
    Write-Host "Installation completed. Log file created at $logFilePath"
} else {
    Write-Host "Installation might have failed. Log file not found."
}

# Optional: Clean up by deleting the installer
Remove-Item -Path $installerPath -Force

Write-Host "Script completed."
