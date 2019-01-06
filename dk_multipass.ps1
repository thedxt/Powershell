#The DK Multipass
while ($loop -ne 99) {
$loop = 0;
 Write-Host "Welcome to the DK Mulitpass"
 Write-Host "1. Remote Event Log Management Firewall Rules"
 Write-Host "2. Remote Desktop Firewall Rules"
 Write-Host "3. File and Printer Sharing Firewall Rules"
 Write-Host "type exit to exit"
 $menu_1 = Read-host "Enter your selection"
 
Write-Host " "
 
switch ($menu_1) 
    { 
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
            Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" –Value 0
            Write-host "Remote Desktop Firewall Rules and reg setting are On";
            "`n `n";
            break;
            } 
        3 {
            "`n `n";
            "Turning Off Remote Desktop Firewall Rules and reg setting";
            Set-NetFirewallRule -DisplayGroup "Remote Desktop" -Enabled False
            Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" –Value 1
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
        exit {
           exit;
           break;
          } 
        default {
          "** The selection could not be determined **";
          break;
          }
    }
}
Start-Sleep -s 10?
