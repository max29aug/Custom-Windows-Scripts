# Get the current user's SID
$userSID = [Security.Principal.WindowsIdentity]::GetCurrent().User.Value

# UNC path to the cleanup script
$uncPath = "\\your_server_name\share_name\cleanup_script.ps1"

# Create a task definition to clear temporary files
$taskDef = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File \"$uncPath\""

# Create a trigger to run the task at logoff
$trigger = New-ScheduledTaskTrigger -AtLogOff

# Register the task
Register-ScheduledTask -Action $taskDef -Trigger $trigger -User $userSID -RunLevel Highest
