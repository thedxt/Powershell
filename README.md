# Powershell

## Installed Programs
this will list all the installed programs and save the list to C:\ as a CSV file
### known issues
* it will not list dumb programs that are installed to a user's AppData folder

## DK Multipass
this is tool that does many things like firewall settings and timezones and sleep settings. Below are the current functions and their sub menus
* Remote Event Log Management Firewall Rules
  * checking the status
  * turning it on
  * turning it off
* Remote Desktop Firewall Rules
  * checking the status
  * turning it on
  * turning it off
* File and Printer Sharing Firewall Rules
  * checking the status
  * turning it on
  * turning it off
* Sleep Settings
  * turns off all sleep settings possible
  * turns off system hibernate and standby sleep settings
  * turns off disk sleep settings
* Setting the timezone to Mountain Time
* Turning off Firewall
### possible issue
* You may need to set your PowerShell Execution Policy to Remote Signed. Run this command to fix it Set-ExecutionPolicy RemoteSigned
