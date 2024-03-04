# URL of the .reg file on GitHub
$regFileUrl = "https://raw.githubusercontent.com/max29aug/test/main/addlicense.reg"

# Destination path to save the .reg file
$regFilePath = "$env:TEMP\example.reg"

# Download the .reg file
Invoke-WebRequest -Uri $regFileUrl -OutFile $regFilePath

# Apply the .reg file
if (Test-Path $regFilePath) {
    Start-Process -FilePath "regedit.exe" -ArgumentList "/s", $regFilePath -Wait
    Write-Host "Registry keys from example.reg applied successfully."
} else {
    Write-Host "Failed to download the registry file."
}
