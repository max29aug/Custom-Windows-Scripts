# Define the network paths to your installer and dependencies
$installerPath = "\\pdc\SharedApps\TBSMyPC\TBS_INSTALLER_7.0.0.9.exe"
$dependencyPath1 = "\\pdc\SharedApps\TBSMyPC\config.bat"
$dependencyPath2 = "\\server\share\dependency2.msi"
$dependencyPath3 = "\\pdc\SharedApps\TBSMyPC\English_US.xml"
$dependencyPath4 = "\\pdc\SharedApps\TBSMyPC\English_UK.xml"
$dependencyPath5 = "\\pdc\SharedApps\TBSMyPC\AEspanol_ES.xml"
$dependencyPath6 = "\\pdc\SharedApps\TBSMyPC\English_US.rtf"
$dependencyPath7 = "\\pdc\SharedApps\TBSMyPC\English_UK.rtf"
$dependencyPath8 = "\\pdc\SharedApps\TBSMyPC\AEspanol_ES.rtf"

# Add more dependencies as needed

# Function to check if a process is running and wait until it finishes
function Wait-ProcessComplete {
    param(
        [string]$processName
    )
    while (Get-Process -Name $processName -ErrorAction SilentlyContinue) {
        Start-Sleep -Seconds 5
    }
}

# Install dependencies
Start-Process -FilePath $dependencyPath1 -ArgumentList "/quiet" -Wait
Wait-ProcessComplete -processName "dependency1"

Start-Process -FilePath $dependencyPath2 -ArgumentList "/quiet" -Wait
Wait-ProcessComplete -processName "dependency2"

Start-Process -FilePath $dependencyPath2 -ArgumentList "/quiet" -Wait
Wait-ProcessComplete -processName "dependency3"

Start-Process -FilePath $dependencyPath2 -ArgumentList "/quiet" -Wait
Wait-ProcessComplete -processName "dependency4"

Start-Process -FilePath $dependencyPath2 -ArgumentList "/quiet" -Wait
Wait-ProcessComplete -processName "dependency5"

Start-Process -FilePath $dependencyPath2 -ArgumentList "/quiet" -Wait
Wait-ProcessComplete -processName "dependency6"

Start-Process -FilePath $dependencyPath2 -ArgumentList "/quiet" -Wait
Wait-ProcessComplete -processName "dependency7"

Start-Process -FilePath $dependencyPath2 -ArgumentList "/quiet" -Wait
Wait-ProcessComplete -processName "dependency8"
# Install the main application
Start-Process -FilePath $installerPath -ArgumentList "/silent" -Wait
Wait-ProcessComplete -processName "TBS_INSTALLER_7.0.0.9"

Write-Host "Installation completed successfully."
