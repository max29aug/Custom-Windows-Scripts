<<<<<<< HEAD
# Specify the network share path and output file name
$networkSharePath = "\\PDC\SystemLogs-Clients"
$outputFileName = "WindowsLogs.txt"

# Combine the network share path and output file name
$outputFilePath = Join-Path $networkSharePath $outputFileName

try {
    # Get events from the System log with specific Event IDs
    $events = Get-WinEvent -LogName System -FilterXPath @"
        <QueryList>
            <Query Id="0" Path="System">
                <Select Path="System">
                    *[System[(EventID=1074 or EventID=1076 or EventID=6006 or EventID=6008) and TimeCreated[timediff(@SystemTime) &lt;= 604800000]]]
                </Select>
            </Query>
        </QueryList>
"@

    # Save the results to the specified text file on the network share
    $events | Format-Table -AutoSize | Out-File -FilePath $outputFilePath -Force

    # Display the results in the console
    $events | Format-Table -AutoSize

    Write-Host "Results saved to $outputFilePath"
} catch {
    Write-Host "Error: $_"
}
=======
# Specify the network share path and output file name
$networkSharePath = "\\PDC\SystemLogs-Clients"
$outputFileName = "WindowsLogs.txt"

# Combine the network share path and output file name
$outputFilePath = Join-Path $networkSharePath $outputFileName

try {
    # Get events from the System log with specific Event IDs
    $events = Get-WinEvent -LogName System -FilterXPath @"
        <QueryList>
            <Query Id="0" Path="System">
                <Select Path="System">
                    *[System[(EventID=1074 or EventID=1076 or EventID=6006 or EventID=6008) and TimeCreated[timediff(@SystemTime) &lt;= 604800000]]]
                </Select>
            </Query>
        </QueryList>
"@

    # Save the results to the specified text file on the network share
    $events | Format-Table -AutoSize | Out-File -FilePath $outputFilePath -Force

    # Display the results in the console
    $events | Format-Table -AutoSize

    Write-Host "Results saved to $outputFilePath"
} catch {
    Write-Host "Error: $_"
}
>>>>>>> 76b4754 (Initial commit)
