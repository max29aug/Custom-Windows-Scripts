# Define the UNC path where the installer is located
$installerUNCPath = "\\pdc\SharedApps\ExpressLRS-Configurator-Setup-1.7.6.exe"

# Define the local path where the installer will be temporarily copied (optional step)
$localTempPath = "$env:TEMP\BantamTools-2.7.0.exe"

# Check if the installer exists on the UNC path
if (Test-Path -Path $installerUNCPath) {
    
    # Copy the installer to the local system (optional step)
    Copy-Item -Path $installerUNCPath -Destination $localTempPath -Force

    # Install the application silently using the copied installer
    Start-Process -FilePath $localTempPath -ArgumentList '/silent' -Wait -NoNewWindow

    # Capture the exit code
    $exitCode = $LASTEXITCODE

    # Check if the installation was successful
    if ($exitCode -eq 0) {
        Write-Host "BantamTools installed successfully."
    } else {
        Write-Host "Installation failed with exit code: $exitCode"
    }

    # Optionally, clean up the installer file
    Remove-Item -Path $localTempPath -Force

} else {
    Write-Host "Installer not found at $installerUNCPath"
}
