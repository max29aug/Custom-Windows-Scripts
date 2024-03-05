# Registry keys for User Info
$UserInfoRegistryPath = "HKCU:\Software\FrontlineSystems\User Info"
$UserInfoKeys = @{
    "UID"          = ""
    "Email"        = ""
    "FullName"     = ""
    "Company"      = ""
    "Telephone"    = ""
    "UserType"     = ""
    "IndustryType" = ""
}

# Registry keys for AnalyticSolverPlatform 17.0
$ASP170RegistryPath = "HKCU:\Software\FrontlineSystems\AnalyticSolverPlatform\17.0"
$ASP170Keys = @{
    "DelayRESTCalls"   = 1
    "PreventRESTCalls" = 1
    "checkUpdate"      = 0
}

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
        Set-ItemProperty -Path $RegistryPath -Name $key -Value $value
    }
}

# Add registry keys for User Info
Add-RegistryKeys -RegistryPath $UserInfoRegistryPath -RegistryKeys $UserInfoKeys

# Add registry keys for AnalyticSolverPlatform 17.0
Add-RegistryKeys -RegistryPath $ASP170RegistryPath -RegistryKeys $ASP170Keys

Write-Host "Registry keys added successfully."
