# Perform disk cleanup silently
Start-Process "cleanmgr.exe" -ArgumentList "/sagerun:1" -Wait

Write-Host "Disk cleanup completed."

# Specify the task name and description
$taskName = "DiskCleanupMonthly"
$taskDescription = "Run Disk Cleanup on the 26th of every month"

# Create a new task action to run Disk Cleanup
$action = New-ScheduledTaskAction -Execute "cleanmgr.exe" -Argument "/sagerun:1"

# Create a trigger to run the task on the 26th of every month
$trigger = New-ScheduledTaskTrigger -Weekly -WeeksInterval 4 -DaysOfWeek Sunday -At 03:00

# Register the task with Task Scheduler
Register-ScheduledTask -TaskName $taskName -Description $taskDescription -Action $action -Trigger $trigger -RunLevel Highest -Force

Write-Host "Task '$taskName' added to run Disk Cleanup on the 26th of every month."
