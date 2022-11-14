# tell the system to run chkdsk on C and says yes to running it on next reboot
$check_C = Start-Job -Name chkdsk_c -ScriptBlock {echo 'y'|chkdsk.exe c: /r}
$check_C

# reboot
shutdown -r -f -t 0