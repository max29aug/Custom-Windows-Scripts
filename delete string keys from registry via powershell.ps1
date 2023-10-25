# Define the registry key path and value names
$registryKeyPath = "HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$valueNames = @("legalnoticecaption", "legalnoticetext")  # Add more value names as needed

# Check if the registry key exists
if (Test-Path $registryKeyPath) {
    foreach ($valueName in $valueNames) {
        # Check if the value exists in the registry key
        if (Get-ItemProperty -Path $registryKeyPath -Name $valueName -ErrorAction SilentlyContinue) {
            # Remove the value from the registry key
            Remove-ItemProperty -Path $registryKeyPath -Name $valueName
            Write-Host "The value '$valueName' has been removed from the registry key."
        } else {
            Write-Host "The specified value '$valueName' does not exist in the registry key."
        }
    }
} else {
    Write-Host "The specified registry key does not exist."
}
