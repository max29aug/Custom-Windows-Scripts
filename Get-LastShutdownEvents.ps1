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

# Display the results
foreach ($event in $events) {
    $time = $event.TimeCreated
    $eventId = $event.Id
    $message = $event.Message
    Write-Output "Event ID: $eventId, Time: $time, Message: $message"
}
