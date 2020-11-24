# Powershell

## Single Task
A collection of scripts that usually do a single task or a very simple one. Go to the folder for more.

## Installed Programs
this will list all the installed programs and save the list to C:\ as a CSV file
### known issues
* it will not list dumb programs that are installed to a user's AppData folder

## DK Win Updates
This will check for update and download and install them. It will list all the updates it finds it will then move on to installing those updates. Once done installing the updates if the system needs a reboot it will reboot the system and give 5 min warning before the reboot. It won't install any driver updates.

* This has only been tested on Windows 10 / Server 2016 / Server 2019. You should upgrade if you are running stuff older than that :P
* This can't detect Windows 10 Feature Updates / Upgrades
* It may install a preview update but only if the preview update would normally be available if you clicked check for updates in the normal Windows update UI
* The Windows Updates history in settings won't show the fact that the script has installed the updates, but if you look in Programs and Features > Installed Updates they will show up. They also show in event viewer.
### Future Plans
* better verbose output of the updates it is downloading and installing as it does them


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
