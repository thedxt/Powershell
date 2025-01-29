# Single Task
A collection of scripts that usually do a single task or a very simple one.

## BASupSrvcCnfg_focus_kill.ps1
Kills off BASupSrvcCnfg as it randomly steals focus

## DKDefaults.ps1
Will turn on Remote Desktop with NLA and turns on file and printer sharing

## DisableAutoUpdates.ps1
This will turn off Windows Auto Updates. It will check if the Reg Key for Auto updates already exists. If it exists it will only update the Auto Update value. If the key does not exist it will create it.

## FilePerms.ps1
Requires editing the powershell file for your setup. See the defining factors section in the script. This script is intended for use with Domains and new folder setups.

* Turns off inheritance and nukes out the permissions
* sets the permissions
  * System gets Full Control
  * FC Group is for whatever you want to have Full Control
  * RO Group is for whatever you want to have Read Only access (Includes Execute)
  * RW is for whatever you want to have Read and Write access 

### possible issue
If you already have inheritance turned off it wont blow up the pervious permissions but will simply add the new ones.

## Lock-Win10-Release.ps1

This script will check if the system is Windows 10. It will then stop the Windows update service. It will then make the changes needed in the registry to lock the system to Windows 10 and the release 22H2. After that it will start the Windows update service again. No reboots are needed.

## Nuke_WSUS.ps1
Moved to https://github.com/thedxt/win-updates

## SMB_Open_Finder.ps1
Run as admin on a system that has SMB shares. Change what to the open file/folder you are trying to find. It will list the usernames of the people that have the file or folder open.

Can also close the open file/folder if needed. (you need to uncomment the last line if you want to do that)

## SQLFW.ps1
Creates the firewall rule for MS SQL

## VeeamOff.ps1
Turns off Veeam Services

## VeeamOn.ps1
Turns On Veeam Services

## WAC_SSO.ps1
Run on a domain controller as admin. This will enable WAC SSO to the server using Kerberos constrained delegation.

## Win11_taskbar_Left.ps1
Set the taskbar to the left in Windows 11

## chkdsk_reboot.ps1
Runs chkdsk on C drive on next reboot and reboots the PC

## files_folder_export.ps1
will list out all the files and folders to a csv file for the path that you give it.

## hidden_installs.ps1
Lists all programs that are hidden (aka listed as SystemComponent) and ignores null entries

## pre_upgrade_info.ps1
Exports out the BuildLabEx, the EditionID, the System Info, and all the IP config. Useful to do before running an in place upgrade on a server. You should copy the files off the server before doing the upgrade.

Link to more info about in place upgrades https://docs.microsoft.com/en-us/windows-server/upgrade/upgrade-2016-to-2019

## ps_5.1.ps1
Installs PowerShell 5.1 by using PowerShell. Useful on Server 2012 R2

Other versions of PowerShell 5.1 https://docs.microsoft.com/en-us/powershell/scripting/windows-powershell/wmf/setup/install-configure?#download-and-install-the-wmf-51-package

## pulse_purge.ps1
Pulseway RMM Removal tool this will remove Pulseway and cleanup any leftovers from the uninstall

### possible issue
you may get an error saying the service doesn't exist. There are instances when only one of the services exists. everything still works despite the error.

## sfc_scannow_reboot.ps1
runs sfc scan now and reboots when done

