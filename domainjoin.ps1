# Define domain credentials
$domain = "deploy.local"
$username = "adprashant"
$password = ConvertTo-SecureString "Partners@2024" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ($username, $password)

# Specify the organizational unit (OU) where the computer account will be created
$ouPath = "OU=Computers,DC=deploy,DC=local"

# Set the computer name for the client machine
$computerName = "Client1"

# Attempt to join the domain
try {
    Add-Computer -DomainName $domain -Credential $credential -OUPath $ouPath -NewName $computerName -Force -Restart
    Write-Output "Computer joined to domain successfully."
}
catch {
    Write-Output "Failed to join the domain: $_"
}
