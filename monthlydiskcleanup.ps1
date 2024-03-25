# Specify the drive letter or path you want to perform disk cleanup on
$driveLetter = "C:"

# Perform disk cleanup
Start-Process "cleanmgr.exe" -ArgumentList "/sagerun:1" -Wait

Write-Host "Disk cleanup on drive $driveLetter completed."

# Specify the task name and description
$taskName = "DiskCleanupTask"
$taskDescription = "Run Disk Cleanup once a month"

# Specify the path to cleanmgr.exe (Disk Cleanup)
$cleanMgrPath = "C:\Windows\System32\cleanmgr.exe"

# Create a new task action to run cleanmgr.exe with arguments
$action = New-ScheduledTaskAction -Execute $cleanMgrPath -Argument "/sagerun:1"

# Create a trigger to run the task monthly
$trigger = New-ScheduledTaskTrigger -Monthly -MonthsInterval 1

# Register the task with Task Scheduler
Register-ScheduledTask -TaskName $taskName -Description $taskDescription -Action $action -Trigger $trigger -RunLevel Highest

Write-Host "Task '$taskName' added to run Disk Cleanup once a month."
