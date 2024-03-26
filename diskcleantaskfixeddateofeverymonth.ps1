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
$taskDescription = "Run Disk Cleanup"

# Define the PowerShell script to run disk cleanup silently
$scriptBlock = {
    Start-Process "cleanmgr.exe" -ArgumentList "/sagerun:1" -Wait -WindowStyle Hidden
}

# Get the current date
$currentDate = Get-Date

# Calculate the next run date as the 29th of the next month
$nextRunDate = $currentDate.AddMonths(1).Date.AddDays(29 - $currentDate.Day)

# Calculate the time of day to run the task
$runTime = "00:00"

# Combine the date and time
$nextRunDateTime = [datetime]::ParseExact("$($nextRunDate.ToString('yyyy-MM-dd')) $runTime", "yyyy-MM-dd HH:mm", $null)

# Create a new scheduled task trigger to run monthly on the calculated date and time
$trigger = New-ScheduledTaskTrigger -Once -At $nextRunDateTime

# Create a new scheduled task action to run the PowerShell script
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-ExecutionPolicy Bypass -WindowStyle Hidden -Command &{ $scriptBlock }"

# Register the task with Task Scheduler
Register-ScheduledTask -TaskName $taskName -Description $taskDescription -Action $action -Trigger $trigger -User "SYSTEM" -RunLevel Highest -Force

Write-Host "Task '$taskName' added to run Disk Cleanup monthly on the 29th."
