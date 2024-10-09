Stop-Service -Name wuauserv
Remove-Item HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate -Recurse
Remove-Item HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\GPCache -Recurse
Start-Service -name wuauserv
