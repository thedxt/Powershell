# tells the system to run chkdsk on C and says yes to running it on next reboot
$check_C = Start-Job -Name chkdsk_c -ScriptBlock {echo 'y'|chkdsk.exe c: /r}
$check_C
# added sleep to let it finish scheduling the job before rebooting
sleep -Seconds 60
# reboot
shutdown -r -f -t 0
