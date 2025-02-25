<<<<<<< HEAD
﻿# Define the SSID and the password of the WiFi network
$ssid = "FTTH-5G"
$password = "SLAGR320"

# Convert the SSID to hexadecimal
$hex = ($ssid.ToCharArray() | ForEach-Object { "{0:X2}" -f [byte][char]$_ }) -join ''

# Define the WiFi profile in XML format
$xml = @"
<?xml version="1.0"?>
<WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1">
    <name>$ssid</name>
    <SSIDConfig>
        <SSID>
            <hex>$hex</hex>
            <name>$ssid</name>
        </SSID>
    </SSIDConfig>
    <connectionType>ESS</connectionType>
    <connectionMode>auto</connectionMode>
    <MSM>
        <security>
            <authEncryption>
                <authentication>WPA2PSK</authentication>
                <encryption>AES</encryption>
                <useOneX>false</useOneX>
            </authEncryption>
            <sharedKey>
                <keyType>passPhrase</keyType>
                <protected>false</protected>
                <keyMaterial>$password</keyMaterial>
            </sharedKey>
        </security>
    </MSM>
</WLANProfile>
"@

# Save the WiFi profile to a file
$xml | Out-File -FilePath "$env:TEMP\WiFiProfile.xml"

# Add the WiFi profile
netsh wlan add profile filename="$env:TEMP\WiFiProfile.xml"

# Delete the WiFi profile file
Remove-Item -Path "$env:TEMP\WiFiProfile.xml"
=======
﻿# Define the SSID and the password of the WiFi network
$ssid = "FTTH-5G"
$password = "SLAGR320"

# Convert the SSID to hexadecimal
$hex = ($ssid.ToCharArray() | ForEach-Object { "{0:X2}" -f [byte][char]$_ }) -join ''

# Define the WiFi profile in XML format
$xml = @"
<?xml version="1.0"?>
<WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1">
    <name>$ssid</name>
    <SSIDConfig>
        <SSID>
            <hex>$hex</hex>
            <name>$ssid</name>
        </SSID>
    </SSIDConfig>
    <connectionType>ESS</connectionType>
    <connectionMode>auto</connectionMode>
    <MSM>
        <security>
            <authEncryption>
                <authentication>WPA2PSK</authentication>
                <encryption>AES</encryption>
                <useOneX>false</useOneX>
            </authEncryption>
            <sharedKey>
                <keyType>passPhrase</keyType>
                <protected>false</protected>
                <keyMaterial>$password</keyMaterial>
            </sharedKey>
        </security>
    </MSM>
</WLANProfile>
"@

# Save the WiFi profile to a file
$xml | Out-File -FilePath "$env:TEMP\WiFiProfile.xml"

# Add the WiFi profile
netsh wlan add profile filename="$env:TEMP\WiFiProfile.xml"

# Delete the WiFi profile file
Remove-Item -Path "$env:TEMP\WiFiProfile.xml"
>>>>>>> 76b4754 (Initial commit)
