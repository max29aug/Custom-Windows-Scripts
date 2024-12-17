# Check if the scheduled task already exists
$taskName = "DiskCleanupAtLogoff"
$existingTask = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue

if ($null -eq $existingTask) {
    # Define task parameters
    $action = New-ScheduledTaskAction -Execute "cleanmgr.exe" -Argument "/sagerun:1"
    $trigger = New-ScheduledTaskTrigger -AtLogon
    $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable
    
    # Register the scheduled task
    Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings -User "NT AUTHORITY\SYSTEM"
    Write-Output "Scheduled task for disk cleanup at logoff has been created."
} else {
    Write-Output "Scheduled task already exists."
}
