$domain = "deploy.local"
$password = "P@ssw0rd" | ConvertTo-SecureString -asPlainText -Force
$username = "$DEPLOY\Administrator" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
Add-Computer -DomainName $domain -Credential $credential
