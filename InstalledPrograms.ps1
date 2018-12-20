$savepath = Split-Path -parent "C:\*.*"
$DateStamp = get-date -f yyyyMMddhhmm
$save = $savepath + "\InstalledProgs_$DateStamp.csv"

Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*", "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object { $_.DisplayName -ne $null }|Select-Object @{Label = "Program";Expression = {$_.DisplayName}},
@{Label = "Version";Expression = {$_.DisplayVersion}},
@{Label = "Publisher";Expression = {$_.Publisher}},
@{Label = "Website";Expression = {$_.URLInfoAbout}},
@{Label = "Install Source";Expression = {$_.InstallSource}},
@{Label = "Install Location";Expression = {$_.InstallLocation}},
@{Label = "Install Date";Expression = {$_.InstallDate}},
@{Label = "Loud Uninstall";Expression = {$_.UninstallString}},
@{Label = "Silent Uninstall";Expression = {$_.QuietUninstallString}},
@{Label = "Size";Expression = {$_.EstimatedSize}}|export-csv -path $save -NoTypeInformation
