write-host "Starting SFC scan"
# run sfc scan now and reboot
$sfc = Start-Job -Name sfc -ScriptBlock {sfc /scannow}
$sfc
#wait for the job to be done
wait-job -Name sfc
write-host "SFC scan done"
#add a sleep just to be safe
sleep -Seconds 60
# reboot
shutdown -r -f -t 0