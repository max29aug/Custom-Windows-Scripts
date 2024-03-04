# URL of the .reg file
$regFileUrl = "https://raw.githubusercontent.com/max29aug/test/main/addlicense.reg"

# Destination path to save the .reg file
$regFilePath = "$env:TEMP\your.reg"

# Download the .reg file
Invoke-WebRequest -Uri $regFileUrl -OutFile $regFilePath

# Apply the .reg file silently
Start-Process -FilePath "regedit.exe" -ArgumentList "/s", $regFilePath -Wait

# Clean up: Delete the downloaded .reg file
Remove-Item -Path $regFilePath
