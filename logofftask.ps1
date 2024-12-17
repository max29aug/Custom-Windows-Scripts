# Perform disk cleanup silently
$cleanupResult = Start-Process "cleanmgr.exe" -ArgumentList "/sagerun:1" -PassThru -NoNewWindow -Wait

# Check if disk cleanup completed successfully
if ($cleanupResult.ExitCode -eq 0) {
    Write-Host "Disk cleanup completed successfully."
} else {
    Write-Host "Disk cleanup encountered an error. Exit code: $($cleanupResult.ExitCode)"
}

# Specify the task name and description
$taskName = "DiskCleanupTask"
$taskDescription = "Run Disk Cleanup on user logoff"

# Define the PowerShell script to run disk cleanup silently
$scriptBlock = {
    Start-Process "cleanmgr.exe" -ArgumentList "/sagerun:1" -Wait -WindowStyle Hidden
}

# Create a new scheduled task trigger to run on user logoff
$trigger = New-ScheduledTaskTrigger -Logoff

# Create a new scheduled task action to run the PowerShell script
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-ExecutionPolicy Bypass -WindowStyle Hidden -Command &{ $scriptBlock }"

# Register the task with Task Scheduler
Register-ScheduledTask -TaskName $taskName -Description $taskDescription -Action $action -Trigger $trigger -User "SYSTEM" -RunLevel Highest -Force

Write-Host "Task '$taskName' added to run Disk Cleanup on logoff."
