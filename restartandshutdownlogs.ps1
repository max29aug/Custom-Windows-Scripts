# Specify the network share path and output file name
$networkSharePath = "\\PDC\SystemLogs-Clients"
$outputFileName = "LastShutdownEvents.txt"

# Combine the network share path and output file name
$outputFilePath = Join-Path $networkSharePath $outputFileName

# Query the System Event Log for shutdown and restart events
$events = Get-WinEvent -LogName System -FilterXPath @"
    <QueryList>
        <Query Id="0" Path="System">
            <Select Path="System">
                *[System[(EventID=1074 or EventID=1076 or EventID=6006 or EventID=6008) and TimeCreated[timediff(@SystemTime) &lt;= 604800000]]]
            </Select>
        </Query>
    </QueryList>
"@

# Store the results in an array
$results = foreach ($event in $events) {
    $time = $event.TimeCreated
    $eventId = $event.Id
    $message = $event.Message
    "Event ID: $eventId, Time: $time, Message: $message"
}

# Save the results to the specified file on the network share
$results | Out-File -FilePath $outputFilePath -Append

# Display the results in the console
$results
