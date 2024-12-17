# Clear temporary files
Clear-TemporaryFile -Path "C:\Users\$env:USERNAME\AppData\Local\Temp"
Clear-TemporaryFile -Path "C:\Windows\Temp"

# Clear Internet Explorer temporary files
Clear-IEHistory

# Clear Edge temporary files (adjust path if needed)
Remove-Item "C:\Users\$env:USERNAME\AppData\Local\Microsoft\Edge\User Data\Default\Cache" -Recurse -Force
Remove-Item "C:\Users\$env:USERNAME\AppData\Local\Microsoft\Edge\User Data\Default\Cookies" -Recurse -Force
