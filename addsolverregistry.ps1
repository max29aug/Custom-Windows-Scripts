# Reg2CI (c) 2022 by Roger Zander
if((Test-Path -LiteralPath "HKCU:\Software\FrontlineSystems\User Info") -ne $true) {  New-Item "HKCU:\Software\FrontlineSystems\User Info" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKCU:\Software\FrontlineSystems\AnalyticSolverPlatform\17.0") -ne $true) {  New-Item "HKCU:\Software\FrontlineSystems\AnalyticSolverPlatform\17.0" -force -ea SilentlyContinue };
New-ItemProperty -LiteralPath 'HKCU:\Software\FrontlineSystems\User Info' -Name 'UID' -Value '' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\FrontlineSystems\User Info' -Name 'Email' -Value '' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\FrontlineSystems\User Info' -Name 'FullName' -Value '' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\FrontlineSystems\User Info' -Name 'Company' -Value '' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\FrontlineSystems\User Info' -Name 'Telephone' -Value '' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\FrontlineSystems\User Info' -Name 'UserType' -Value '' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\FrontlineSystems\User Info' -Name 'IndustryType' -Value '' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\FrontlineSystems\AnalyticSolverPlatform\17.0' -Name 'DelayRESTCalls' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\FrontlineSystems\AnalyticSolverPlatform\17.0' -Name 'PreventRESTCalls' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\FrontlineSystems\AnalyticSolverPlatform\17.0' -Name 'checkUpdate' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
