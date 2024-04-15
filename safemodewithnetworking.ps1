Write-Output "Launching Windows 11 in Safe Mode with Networking..."

# Create a scheduled task to boot into Safe Mode with Networking on next restart
$taskAction = New-ScheduledTaskAction -Execute "bcdedit" -Argument "/set {current} safeboot network"
$taskTrigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1)
Register-ScheduledTask -TaskName "SafeMode" -Action $taskAction -Trigger $taskTrigger -Force

# Prompt the user to restart the system
Write-Output ""
Write-Output "The system will restart in Safe Mode with Networking on the next boot."
Write-Output "Please save your work and press Enter to restart the system."
Read-Host

# Restart the system
Restart-Computer -Force
