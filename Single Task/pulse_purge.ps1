# Pulse Purge
# uninstalls Pulseway
# author theDXT

# find pulseway reg info
$PulseReg = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -match 'Pulseway'}

if (Get-Service "PC Monitor" -ErrorAction SilentlyContinue)
{
 Wirte-host "Pulseway PC Monitor Service found"
 # kill pulseway service
Set-Service "PC Monitor" -StartupType Disabled
Stop-Service "PC Monitor"

# kill pulseway processes
Get-Process | Where {$_.ProcessName -Like "PCMonitorSrv"} | Stop-Process -force
Get-Process | Where {$_.ProcessName -Like "pcmontask"} | Stop-Process -force
Wirte-host "Pulseway PC Monitor Service disabled"
}else
{
write-host "Disabling of Pulseway PC Monitor Service NOT needed"
}


# kill main reg key for pulseway if found
if (test-path 'HKLM:\SOFTWARE\MMSOFT Design')
{
write-host "purging the reg key"
Remove-Item -Path 'HKLM:\SOFTWARE\MMSOFT Design' -Recurse
}


# run normal pulseway uninstall
if ($PulseReg.PSpath)
{
write-host "running normal uninstall"
msiexec.exe /x $PulseReg.PSChildName /qn
start-sleep -s 45
}


# test if there are reg leftovers from the normal uninstall and clean up
if ($PulseReg.PSpath)
{
write-host "cleaning up the fallout"
remove-item -path $PulseReg.PSPath
}

# kill pulseway folders
Remove-Item "C:\Program Files\Pulseway" -Recurse -Force -ErrorAction silentlycontinue

# get the users
$list_of_users = Get-ChildItem -Path $Env:SystemDrive\Users

Foreach ($user in $list_of_users)

{
# check if per user pulseway shortcut exists
if (Test-Path "$($user.FullName)$("\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Pulseway Manager.lnk")")

# if found kill it
{
write-host "Found Pulseway shortcut for $user"
Remove-Item "$($user.FullName)$("\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Pulseway Manager.lnk")"
write-host "deleted Pulseway shortcut for $user"
}
}

# kill other pulseway shortcuts
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Pulseway Manager.lnk" -ErrorAction silentlycontinue
Remove-Item "C:\Users\Public\Desktop\Pulseway Manager.lnk" -ErrorAction silentlycontinue


# delete pulseway service
if (Get-Service "PC Monitor" -ErrorAction SilentlyContinue)
{
Wirte-host "Pulseway PC Monitor Service still found"
sc.exe delete "PC Monitor" | out-null
Wirte-host "Pulseway PC Monitor Service deleted"
}else
{
write-host "Pulseway PC Monitor Service NOT found"
}

# delete pulseway service
if (Get-Service "PulsewayDeploymentService" -ErrorAction SilentlyContinue)
{
Wirte-host "Pulseway PulsewayDeploymentService Service still found"
sc.exe delete "PulsewayDeploymentService" | out-null
Wirte-host "Pulseway PulsewayDeploymentService Service deleted"
}else
{
write-host "Pulseway PulsewayDeploymentService Service NOT found"
}

# end
write-host "Pulse Nuke is completed"
