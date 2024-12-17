# Get the current user's SID
$userSID = [Security.Principal.WindowsIdentity]::GetCurrent().User.Value

# Create a new task definition
$taskDef = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File \"C:\path\to\your\script.ps1\""

# Register the task
Register-ScheduledTask -Action $taskDef -Trigger (New-ScheduledTaskTrigger -AtLogOn) -User $userSID -RunLevel Highest
