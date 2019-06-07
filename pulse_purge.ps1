Set-Service "PC Monitor" -StartupType Disabled
Stop-Service "PC Monitor"
sc.exe delete "PC Monitor"
sc.exe delete "PulsewayDeploymentService"
Remove-Item –path "C:\Program Files\Pulseway\" –recurse -force
