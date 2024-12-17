# Define task name and action
$taskName = "DiskCleanupAtLogoff"
$action = New-ScheduledTaskAction -Execute "cleanmgr.exe" -Argument "/sagerun:1"

# Define trigger for logoff
$trigger = New-ScheduledTaskTrigger -AtLogOff

# Define task settings
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable

# Register the scheduled task
Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings

Write-Output "Scheduled task for disk cleanup at logoff has been created."
