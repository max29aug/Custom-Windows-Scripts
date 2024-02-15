# Define the URL of the application's installer
$url = "https://app.ringcentral.com/download/RingCentral.exe?brandId=1210"

# Define the path where the installer will be saved
$output = "$env:TEMP\installer.exe"

# Download the installer
Invoke-WebRequest -Uri $url -OutFile $output

# Run the installer silently
Start-Process -FilePath $output -ArgumentList "/S" -Wait -PassThru
