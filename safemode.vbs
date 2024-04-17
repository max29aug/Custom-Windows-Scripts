' Create WMI object to access Win32_OperatingSystem class
Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")

' Get the current operating system object
Set colOperatingSystems = objWMIService.ExecQuery("Select * from Win32_OperatingSystem")

' Loop through the operating system objects (should be only one)
For Each objOperatingSystem in colOperatingSystems
    ' Restart the computer in Safe Mode with Networking
    objOperatingSystem.Win32Shutdown 13 + 16 ' 13 = Shutdown, 16 = Restart, 4 = Force Close Applications, 1 = Reboot after shutdown
Next
