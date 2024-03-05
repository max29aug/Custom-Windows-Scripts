# Function to add registry keys
function Add-RegistryKeys {
    param(
        [string]$RegistryPath,
        [hashtable]$RegistryKeys
    )

    # Check if the registry path exists, if not, create it
    if (-not (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    # Add each registry key-value pair
    foreach ($key in $RegistryKeys.Keys) {
        $value = $RegistryKeys[$key]

        # If value is a DWORD, convert it to hex format
        if ($value -is [int]) {
            $value = "dword:{0:X8}" -f $value
        }

        New-ItemProperty -Path $RegistryPath -Name $key -Value $value -Force | Out-Null
    }
}

# Registry keys for FrontlineSystems
$FrontlineSystemsRegistryPath = "HKCU:\Software\FrontlineSystems"
$FrontlineSystemsKeys = @{
    "UID"          = ""
    "Email"        = ""
    "FullName"     = ""
    "Company"      = ""
    "Telephone"    = ""
    "UserType"     = ""
    "IndustryType" = ""
}

# Add registry keys for FrontlineSystems
Add-RegistryKeys -RegistryPath $FrontlineSystemsRegistryPath\User Info -RegistryKeys $FrontlineSystemsKeys

# Registry keys for AnalyticSolverPlatform 17.0
$ASP170RegistryPath = "HKCU:\Software\FrontlineSystems\AnalyticSolverPlatform\17.0"
$ASP170Keys = @{
    "DelayRESTCalls"   = 1
    "PreventRESTCalls" = 1
    "checkUpdate"      = 0
}

# Add registry keys for AnalyticSolverPlatform 17.0
Add-RegistryKeys -RegistryPath $ASP170RegistryPath -RegistryKeys $ASP170Keys

Write-Host "Registry keys added successfully."
