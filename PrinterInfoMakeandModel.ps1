# Function to get printer information
function Get-PrinterInfo {
    # Get all printers installed on the system
    $printers = Get-WmiObject -Query "SELECT * FROM Win32_Printer" | Select-Object Name, DriverName, PortName, SystemName

    # Iterate through each printer
    foreach ($printer in $printers) {
        $printerName = $printer.Name
        $driverName = $printer.DriverName
        $portName = $printer.PortName
        $systemName = $printer.SystemName

        # Check if the printer is a network printer or a local printer
        $printerType = if ($portName -like "*\\*") { "Network Printer" } else { "Local Printer" }

        # Get printer make and model information
        $printerInfo = Get-WmiObject -Query "SELECT * FROM Win32_Printer WHERE Name = '$printerName'"

        # Extract make and model information
        $makeAndModel = $printerInfo.Name -split ', '

        # Output printer information
        [PSCustomObject]@{
            PrinterName = $printerName
            PrinterType = $printerType
            Make = $makeAndModel[0]
            Model = $makeAndModel[1]
        }
    }
}

# Call the function to get printer information
Get-PrinterInfo
