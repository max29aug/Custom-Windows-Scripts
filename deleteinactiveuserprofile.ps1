$daysToKeep = 5 
$currentDate = Get-Date 
$profiles = Get-WmiObject Win32_UserProfile | Where-Object { $_.Special -eq $false } 
foreach ($profile in $profiles) { 
$lastUseDate = $profile.ConvertToDateTime($profile.LastUseTime) 
$daysSinceLastUse = ($currentDate - $lastUseDate).Days 
if ($daysSinceLastUse -ge $daysToKeep) { 
Remove-WmiObject -InputObject $profile 
Write-Host "Deleted profile $($profile.LocalPath)" 
} 
} 
Write-Host "Profile cleanup complete." 
