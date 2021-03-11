#kill service
Set-Service "PC Monitor" -StartupType Disabled
Stop-Service "PC Monitor"

#kill processes
Get-Process | Where {$_.ProcessName -Like "PCMonitorSrv"} | Stop-Process -force
Get-Process | Where {$_.ProcessName -Like "pcmontask"} | Stop-Process -force


#kill regs
Remove-Item -Path 'HKLM:\SOFTWARE\MMSOFT Design' -Recurse

#find version
$VersionFinder = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -match 'Pulseway'}
msiexec.exe /x $VersionFinder.PSChildName /qn

#kill folders
Remove-Item "C:\Program Files\Pulseway" -Recurse -Force -ErrorAction silentlycontinue

# kill shortcuts
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Pulseway Manager.lnk"
Remove-Item "C:\Users\Public\Desktop\Pulseway Manager.lnk"

#delete service
sc.exe delete "PC Monitor"
sc.exe delete "PulsewayDeploymentService"
