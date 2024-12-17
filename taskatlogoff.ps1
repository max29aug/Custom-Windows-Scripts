# Get the current user's SID
$userSID = [Security.Principal.WindowsIdentity]::GetCurrent().User.Value

# UNC path to the cleanup script
$uncPath = "\\pdc\SharedApps\clear temporary files.ps1"

# Create a task definition to clear temporary files
$taskDef = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File \"$uncPath\""

# Create a trigger to run the task at logon with a delay
$trigger = New-ScheduledTaskTrigger -AtLogOn -Delay 10s # Adjust the delay as needed

# Register the task
Register-ScheduledTask -Action $taskDef -Trigger $trigger -User $userSID -RunLevel Highest
