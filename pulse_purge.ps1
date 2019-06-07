Set-Service "PC Monitor" -StartupType Disabled
Stop-Service "PC Monitor"
sc.exe delete "PC Monitor"
Remove-Item –path "C:\Program Files\Pulseway\" –recurse -force
