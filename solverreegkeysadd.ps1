if((Test-Path -LiteralPath "HKCU:\Software\FrontlineSystems\User Info") -ne $true) {  New-Item "HKCU:\Software\FrontlineSystems\User Info" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKCU:\Software\FrontlineSystems\AnalyticSolverPlatform\17.0") -ne $true) {  New-Item "HKCU:\Software\FrontlineSystems\AnalyticSolverPlatform\17.0" -force -ea SilentlyContinue };

# Set registry values for FrontlineSystems\User Info
Set-ItemProperty -Path "HKCU:\Software\FrontlineSystems\User Info" -Name "UID" -Value ""
Set-ItemProperty -Path "HKCU:\Software\FrontlineSystems\User Info" -Name "Email" -Value ""
Set-ItemProperty -Path "HKCU:\Software\FrontlineSystems\User Info" -Name "FullName" -Value ""
Set-ItemProperty -Path "HKCU:\Software\FrontlineSystems\User Info" -Name "Company" -Value ""
Set-ItemProperty -Path "HKCU:\Software\FrontlineSystems\User Info" -Name "Telephone" -Value ""
Set-ItemProperty -Path "HKCU:\Software\FrontlineSystems\User Info" -Name "UserType" -Value ""
Set-ItemProperty -Path "HKCU:\Software\FrontlineSystems\User Info" -Name "IndustryType" -Value ""

# Set registry values for FrontlineSystems\AnalyticSolverPlatform\17.0
Set-ItemProperty -Path "HKCU:\Software\FrontlineSystems\AnalyticSolverPlatform\17.0" -Name "DelayRESTCalls" -Value 1
Set-ItemProperty -Path "HKCU:\Software\FrontlineSystems\AnalyticSolverPlatform\17.0" -Name "PreventRESTCalls" -Value 1
Set-ItemProperty -Path "HKCU:\Software\FrontlineSystems\AnalyticSolverPlatform\17.0" -Name "checkUpdate" -Value 0
