# Powershell

## Single Task
A collection of scripts that usually do a single task or a very simple one. Go to the folder for more.

## Installed Programs
this will list all the installed programs and save the list to C:\ as a CSV file
### known issues
* it will not list dumb programs that are installed to a user's AppData folder

## DK Win Updates
Moved to new repo https://github.com/thedxt/win-updates


## DK Multipass v1.04
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
* Veeam Services
  * check veeam services status
  * stop veeam services
  * start veeam services
* Restarting Explorer.exe
* Processes
  * lists all current processes
  * kill a process by name
  * Restarting Explorer.exe
* MMC Firewall Rules
  * Check Stauts of the rules
  * Allow MMC Firewall Stuff
  * Block MMC Firewall Stuff
### possible issue
* You may need to set your PowerShell Execution Policy to Remote Signed. Run this command to fix it Set-ExecutionPolicy RemoteSigned

## Sysinfo
This will pull a bunch of system info and save it to a txt file in C:\temp (you can change this with $outfolder)
Info this will pull
* Hostname
* Domain
* Manufacturer
* Model
* SN
* CPU
* Disk Info in GB for all local disks includes Size, Used, Free, and Free in a precent.
* Network info all the settings for all network devices.
* Network Shares on the system
* Scheduled Tasks in / (so it should be all the user created ones)
### known issues
* If no Scheduled Tasks exist in / it will still work but give an error.
