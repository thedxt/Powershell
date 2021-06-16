# Pulse Purge
# uninstalls Pulseway
# author theDXT

# find pulseway reg info
$PulseReg = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -match 'Pulseway'}

# kill pulseway service
Set-Service "PC Monitor" -StartupType Disabled
Stop-Service "PC Monitor"

# kill pulseway processes
Get-Process | Where {$_.ProcessName -Like "PCMonitorSrv"} | Stop-Process -force
Get-Process | Where {$_.ProcessName -Like "pcmontask"} | Stop-Process -force


# kill main reg key for pulseway if found
if (test-path 'HKLM:\SOFTWARE\MMSOFT Design')
{
write-host "purging the reg key"
Remove-Item -Path 'HKLM:\SOFTWARE\MMSOFT Design' -Recurse
}


# run normal pulseway uninstall
if (test-path $PulseReg.PSpath)
{
write-host "running normal uninstall"
msiexec.exe /x $PulseReg.PSChildName /qn
start-sleep -s 45
}


# test if there are reg leftovers from the normal uninstall and clean up
if (test-path $PulseReg.PSpath)
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
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Pulseway Manager.lnk" | out-null
Remove-Item "C:\Users\Public\Desktop\Pulseway Manager.lnk" | out-null


# delete pulseway service
sc.exe delete "PC Monitor" | out-null
sc.exe delete "PulsewayDeploymentService" | out-null

# end
write-host "Pulse Purge is completed"
