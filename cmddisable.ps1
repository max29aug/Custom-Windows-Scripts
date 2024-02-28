# Define the registry key and value
$registryKey = "HKCU:\Software\Policies\Microsoft\Windows\System"
$registryValue = "DisableCMD"

# Create the registry key if it does not exist
if (!(Test-Path $registryKey)) {
    New-Item -Path $registryKey -Force | Out-Null
}

# Set the registry value to 1 to disable the Command Prompt
Set-ItemProperty -Path $registryKey -Name $registryValue -Value 1

# Export the registry key to a .reg file
reg export HKCU\Software\Policies\Microsoft\Windows\System C:\temp\DisableCMD.reg
