# output all programs that are hidden and ignore null
Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall  | 
Get-ItemProperty | Where-Object {$_.SystemComponent -eq 1 } | Where-Object {$_.DisplayName -ne $null } | select displayname
