# Get all printers
$printers = Get-WmiObject -Class Win32_Printer

# Loop through each printer
foreach ($printer in $printers) {
    # Determine if the printer is a network printer or a local printer
    if ($printer.Shared) {
        $printerType = "Network Printer"
    } else {
        $printerType = "Local Printer"
    }

    # Output the printer details
    Write-Output "Printer Name: $($printer.Name)"
    Write-Output "Printer Type: $printerType"
    Write-Output "Make: $($printer.Manufacturer)"
    Write-Output "Model: $($printer.Model)"
    Write-Output "------------------------------------"
}
