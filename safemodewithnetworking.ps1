# Check if running with administrative privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Please run this script as an administrator to reboot into Safe Mode with Networking."
    Exit
}

# Set the boot options to Safe Mode with Networking using bcdedit
& bcdedit /set {current} safeboot network

# Reboot the system to apply Safe Mode with Networking
Restart-Computer -Force
