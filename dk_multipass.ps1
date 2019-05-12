#The DK Multipass
while ($loop -ne 99) {
$loop = 0;
 Write-Host "Welcome to the DK Mulitpass v1.04"
 Write-Host "1. Remote Event Log Management Firewall Rules"
 Write-Host "2. Remote Desktop Firewall Rules"
 Write-Host "3. File and Printer Sharing Firewall Rules"
 Write-Host "4. Sleep Settings"
 Write-Host "5. Set Timezone to Mountain Time"
 Write-Host "6. Turn Off Firewall"
 Write-Host "7. Veeam Services"
 Write-Host "8. Restart Explorer.exe"
 Write-Host "9. Processes"
 Write-Host "10. MMC Firewall Rules"
 Write-Host "type exit to exit"
 $menu_1 = Read-host "Enter your selection"
 
Write-Host " "
 
 
switch ($menu_1) 
    { 
#option 1
         1 { Clear-Host
            while ($loop -ne 98) {
                                    Write-host "Remote Event Log Management Firewall Rules Settings"
                                    Write-host "1. Check Stauts of Remote Event Log Management Firewall Rules"
                                    Write-host "2. Turn On Remote Event Log Management Firewall Rules"
                                    Write-host "3. Turn Off Remote Event Log Management Firewall Rules"
                                    Write-Host "type exit to exit or back to go back"
                                    $Firewall_select_remote_event = Read-host "Enter your selection"

                                    Write-Host " "
            
           switch ($Firewall_select_remote_event)
            {
        1 {
            "`n `n";
            "Stauts of Remote Event Log Management Firewall Rules";
            Get-NetFirewallRule -DisplayGroup "Remote Event Log Management" | Format-Table -Property DisplayName, Enabled
            "`n `n";
            break;
            }
        2 {
           "`n `n";
            "Turning On Remote Event Log Management Firewall Rules";
            Set-NetFirewallRule -DisplayGroup "Remote Event Log Management" -Enabled True
            Write-host "Remote Event Log Management Firewall Rules are On";
            "`n `n";
            break;
            } 
        3 {
            "`n `n";
            "Turning Off Remote Event Log Management Firewall Rules";
            Set-NetFirewallRule -DisplayGroup "Remote Event Log Management" -Enabled False
            Write-host "Remote Event Log Management Firewall Rules are Off";
            "`n `n";
            break;
          } 
        exit {
                exit;
                break;
            } 
	    back {
                clear;
                $loop = 98;
                break;
            } 
            default {
            "** The selection could not be determined **";
            break;
            }
            }}}
#Option 2
         2 { Clear-Host 
            while ($loop -ne 98) {
                                    Write-host "Remote Desktop Firewall Rules Settings"
                                    Write-host "1. Check Stauts of Remote Desktop Firewall Rules"
                                    Write-host "2. Turn On Remote Desktop Firewall Rules"
                                    Write-host "3. Turn Off Remote Remote Desktop Firewall Rules"
                                    Write-Host "type exit to exit or back to go back"
                                    $Firewall_select_rdp = Read-Host "Enter your selection"

                                    Write-Host " "
            
           switch ($Firewall_select_rdp)
            {
                1 {
            "`n `n";
            "Stauts of Remote Desktop Firewall Rules";
            Get-NetFirewallRule -DisplayGroup "Remote Desktop" | Format-Table -Property DisplayName, Enabled
            "`n `n";
            break;
            }
        2 {
           "`n `n";
            "Turning On Remote Desktop Firewall Rules and reg setting";
            Set-NetFirewallRule -DisplayGroup "Remote Desktop" -Enabled True
            Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0
            Write-host "Remote Desktop Firewall Rules and reg setting are On";
            "`n `n";
            break;
            } 
        3 {
            "`n `n";
            "Turning Off Remote Desktop Firewall Rules and reg setting";
            Set-NetFirewallRule -DisplayGroup "Remote Desktop" -Enabled False
            Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 1
            Write-host "Remote Desktop Firewall Rules and reg setting are Off";
            "`n `n";
            break;
          } 
        exit {
                exit;
                break;
            } 
	    back {
                clear;
                $loop = 98;
                break;
            } 
            default {
            "** The selection could not be determined **";
            break;
            }
            }}}
#option 3
         3 { Clear-Host 
            while ($loop -ne 98) {
                                    Write-host "File and Printer Sharing Firewall Rules"
                                    Write-host "1. Check Stauts of File and Printer Sharing Firewall Rules"
                                    Write-host "2. Turn On File and Printer Sharing Firewall Rules"
                                    Write-host "3. Turn Off File and Printer Sharing Firewall Rules"
                                    Write-Host "type exit to exit or back to go back"
                                    $Firewall_select_file = Read-host "Enter your selection"

                                    Write-Host " "
          
           switch ($Firewall_select_file)
           {
         1 {
            "`n `n";
            "Stauts of File and Printer Sharing Firewall Rules";
            Get-NetFirewallRule -DisplayGroup "File and Printer Sharing" | Format-Table -Property DisplayName, Enabled
            "`n `n";
            break;
            }
        2 {
           "`n `n";
            "Turning On File and Printer Sharing Firewall Rules";
            Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True
            Write-host "File and Printer Sharing Firewall Rules are On";
            "`n `n";
            break;
            } 
        3 {
            "`n `n";
            "Turning Off File and Printer Sharing Firewall Rules";
            Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled False
            Write-host "File and Printer Sharing Firewall Rules are Off";
            "`n `n";
            break;
          } 
        exit {
                exit;
                break;
            } 
	    back {
                clear;
                $loop = 98;
                break;
            } 
            default {
            "** The selection could not be determined **";
            break;
            }
            }}}
#option 4
         4 { Clear-Host 
            while ($loop -ne 98) {
                                    Write-host "Sleep Settings"
                                    Write-host "1. Turn off Every single possible sleep setting"
                                    Write-host "2. Turn Off system hibernate and standby sleep settings"
                                    Write-host "3. Turn Off disk sleep settings"
                                    Write-Host "type exit to exit or back to go back"
                                    $die_sleep_select = Read-host "Enter your selection"

                                    Write-Host " "
          
           switch ($die_sleep_select)
           {
         1 {
            "`n `n";
            "Turning off Every single possible sleep setting";
             powercfg.exe -x -monitor-timeout-ac 0
             powercfg.exe -x -monitor-timeout-dc 0
             powercfg.exe -x -disk-timeout-ac 0
             powercfg.exe -x -disk-timeout-dc 0
             powercfg.exe -x -standby-timeout-ac 0
             powercfg.exe -x -standby-timeout-dc 0
             powercfg.exe -x -hibernate-timeout-ac 0
             powercfg.exe -x -hibernate-timeout-dc 0
            "`n `n";
            break;
            }
        2 {
           "`n `n";
            "Turning Off system hibernate and standby sleep settings";
             powercfg.exe -x -standby-timeout-ac 0
             powercfg.exe -x -standby-timeout-dc 0
             powercfg.exe -x -hibernate-timeout-ac 0
             powercfg.exe -x -hibernate-timeout-dc 0
            "`n `n";
            break;
            } 
        3 {
            "`n `n";
            "Turning Off disk sleep settings";
             powercfg.exe -x -disk-timeout-ac 0
             powercfg.exe -x -disk-timeout-dc 0
            "`n `n";
            break;
          } 
        exit {
                exit;
                break;
            } 
	    back {
                clear;
                $loop = 98;
                break;
            } 
            default {
            "** The selection could not be determined **";
            break;
            }
            }}}
#option 5
         5 {
    "`n `n";
     "Setting Timezone to Mountain Time";
             TZUTIL /s "Mountain Standard Time"
            "`n `n";
            break;
   }

  #Option 6
         6 {
    "`n `n";
     "Turning off firewall";
             Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
            "`n `n";
            break;
            }
#option 7
         7 { Clear-Host 
            while ($loop -ne 98) {
                                    Write-host "Veeam Services"
                                    Write-host "1. Check Stauts of Veeam Services"
                                    Write-host "2. Turn On Veeam Services"
                                    Write-host "3. Turn Off Veeam Services"
                                    Write-Host "type exit to exit or back to go back"
                                    $veeam_select = Read-host "Enter your selection"

                                    Write-Host " "
          
           switch ($veeam_select)
           {
         1 {
            "`n `n";
            "Stauts of Veeam Services";
            Get-service -displayname veeam*
            "`n `n";
            break;
            }
        2 {
           "`n `n";
            "Turning On Veeam Services";
            Get-service -displayname veeam* | start-service
            Write-host "Veeam Services are On";
            "`n `n";
            break;
            } 
        3 {
            "`n `n";
            "Turning Off Veeam Services";
            Get-service -displayname veeam* | stop-service
            Write-host "Veeam Services are Off";
            "`n `n";
            break;
          } 
        exit {
                exit;
                break;
            } 
	    back {
                clear;
                $loop = 98;
                break;
            } 
            default {
            "** The selection could not be determined **";
            break;
            }
            }}}
#option 8
         8 {
    "`n `n";
     "Restarting Explorer.exe";
             Stop-Process -force -ProcessName explorer
            "`n `n";
            break;
            }
#option 9
         9 { Clear-Host 
            while ($loop -ne 98) {
                                    Write-host "Processes"
                                    Write-host "1. List all running Processes"
                                    Write-host "2. Stop a Process"
                                    Write-Host "type exit to exit or back to go back"
                                    $Process_select = Read-host "Enter your selection"

                                    Write-Host " "
          
           switch ($Process_select)
           {
         1 {
            "`n `n";
            "List all running Processes";
            Get-Process
            "`n `n";
            break;
            }
        2 {
           "`n `n";
            "Killing Process";
           $Process_Name=Read-Host "Type Name of Process";
           Stop-Process -Force -Name $Process_Name
            Write-host "Process has been terminated";
            "`n `n";
            break;
            }  
        exit {
                exit;
                break;
            } 
	    back {
                clear;
                $loop = 98;
                break;
            } 
            default {
            "** The selection could not be determined **";
            break;
            }
            }}}

        exit {
           exit;
           break;
          } 
        default {
          "** The selection could not be determined **";
          break;
          }

#option 10
10 { Clear-Host 
            while ($loop -ne 98) {
                                    Write-host "MMC Firewall Rules"
                                    Write-host "1. Check Stauts of the rules"
                                    Write-host "2. Allow MMC Firewall Stuff"
                                    Write-host "3. Block MMC Firewall Stuff"
                                    Write-Host "type exit to exit or back to go back"
                                    $MMC_select = Read-host "Enter your selection"

                                    Write-Host " "
          
           switch ($MMC_select)
           {
         1 {
            "`n `n";
            "Check Stauts of the rules";
            Get-NetFirewallRule -DisplayGroup "Windows Defender Firewall Remote Management" |ft -AutoSize
            Get-NetFirewallRule -DisplayGroup "Remote Volume Management" |ft -AutoSize
            Get-NetFirewallRule -DisplayGroup "Performance Logs and Alerts" |ft -AutoSize
            Get-NetFirewallRule -DisplayGroup "Remote Scheduled Tasks Management" |ft -AutoSize
            Get-NetFirewallRule -DisplayGroup "File and Printer Sharing" |ft -AutoSize
            Get-NetFirewallRule -DisplayGroup "Remote Service Management" |ft -AutoSize
            Get-NetFirewallRule -DisplayGroup "Remote Event Log Management" |ft -AutoSize
            "`n `n";
            break;
            }
        2 {
           "`n `n";
            "Allowing MMC Firewall Stuff";
            Set-NetFirewallRule -DisplayGroup "Windows Defender Firewall Remote Management" -Enabled True
            Set-NetFirewallRule -DisplayGroup "Remote Volume Management" -Enabled True
            Set-NetFirewallRule -DisplayGroup "Performance Logs and Alerts" -Enabled True
            Set-NetFirewallRule -DisplayGroup "Remote Scheduled Tasks Management" -Enabled True
            Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True
            Set-NetFirewallRule -DisplayGroup "Remote Service Management" -Enabled True
            Set-NetFirewallRule -DisplayGroup "Remote Event Log Management" -Enabled True
            Write-host "MMC Firewall Stuff is now Allowed";
            "`n `n";
            break;
            } 
        3 {
            "`n `n";
            "Blocking MMC Firewall Stuff";
            Set-NetFirewallRule -DisplayGroup "Windows Defender Firewall Remote Management" -Enabled False
            Set-NetFirewallRule -DisplayGroup "Remote Volume Management" -Enabled False
            Set-NetFirewallRule -DisplayGroup "Performance Logs and Alerts" -Enabled False
            Set-NetFirewallRule -DisplayGroup "Remote Scheduled Tasks Management" -Enabled False
            Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled False
            Set-NetFirewallRule -DisplayGroup "Remote Service Management" -Enabled False
            Set-NetFirewallRule -DisplayGroup "Remote Event Log Management" -Enabled False
            Write-host "MMC Firewall Stuff is now Blocked";
            "`n `n";
            break;
          } 
        exit {
                exit;
                break;
            } 
	    back {
                clear;
                $loop = 98;
                break;
            } 
            default {
            "** The selection could not be determined **";
            break;
            }
            }}}
#end of menu
    }
}
Start-Sleep -s 10?
