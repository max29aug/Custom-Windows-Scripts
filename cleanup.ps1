# Clear temporary files
Remove-Item "C:\Users\$env:USERNAME\AppData\Local\Temp\*" -Recurse -Force
Remove-Item "C:\Windows\Temp\*" -Recurse -Force

# Clear Internet Explorer history
$ie = New-Object -ComObject InternetExplorer.Application
$ie.Visible = $false
$ie.Quit()

# Clear Edge history (adjust path if needed)
$edgeProfilePath = "C:\Users\$env:USERNAME\AppData\Local\Microsoft\Edge\User Data\Default"
Remove-Item "$edgeProfilePath\Cache\*" -Recurse -Force
Remove-Item "$edgeProfilePath\Cookies\*" -Recurse -Force
