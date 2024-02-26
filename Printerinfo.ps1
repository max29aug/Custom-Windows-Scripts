# Import the PrintManagement module (if not already loaded)
Import-Module PrintManagement

# Get all printers, including network printers
$allPrinters = Get-Printer

# Define a function to determine printer type (local or network)
function Get-PrinterType {
    param(
        [Parameter(Mandatory = $true)]
        [psobject] $printer
    )

    if ($printer.Location -like "*\\*") {
        return "Network"
    } else {
        return "Local"
    }
}

# Get information for each printer and format output
$printerInfo = $allPrinters | Select-Object @{Name = "Name"; Expression = { $_.Name }},
                                             @{Name = "Type"; Expression = { Get-PrinterType $_ }},
                                             Status, Location, DriverName |
                                             Format-Table -AutoSize

# Display the information in the console
Write-Host "** Information about Installed Printers **"
$printerInfo

# Optionally, save the information to a file (uncomment the following lines)
# $fileName = "$env:TEMP\printer_info.txt"
# $printerInfo | Out-File -FilePath $fileName -Append
# Write-Host "Printer information saved to: $fileName"
