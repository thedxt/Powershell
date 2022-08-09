#DK Defaults
#Turns on Remote Dekstop, File and Printer sharing
Set-NetFirewallRule -DisplayGroup "File and Printer Sharing*" -Enabled True
Set-NetFirewallRule -DisplayGroup "Remote Desktop*" -Enabled True
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" –Value 0
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -Name "UserAuthentication" –Value 1
