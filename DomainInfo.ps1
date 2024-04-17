# Get the domain name from the environment variables
$domainName = $env:USERDNSDOMAIN

# Get the NetBIOS name of the domain using the "set" command and filtering the output
$netBiosName = (cmd /c set | Select-String "USERDOMAIN=").ToString() -replace ".*=", ""

# Get the name of the domain controller using the "set" command and filtering the output
$domainController = (cmd /c set | Select-String "LOGONSERVER=").ToString() -replace ".*=", ""

# Check if any value is null and provide default values or handle the error
if ([string]::IsNullOrEmpty($domainName)) {
    $domainName = "Unknown"
}
if ([string]::IsNullOrEmpty($netBiosName)) {
    $netBiosName = "Unknown"
}
if ([string]::IsNullOrEmpty($domainController)) {
    $domainController = "Unknown"
}

# Display the fetched domain information
Write-Output "Domain Name: $domainName"
Write-Output "NetBIOS Name: $netBiosName"
Write-Output "Domain Controller: $domainController"
