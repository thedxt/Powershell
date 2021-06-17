# Single Task
A collection of scripts that usually do a single task or a very simple one.

## DK Defaults
Will turn on Remote Desktop with NLA and turns on file and printer sharing

## Disable Auto Updates
This will turn off Windows Auto Updates. It will check if the Reg Key for Auto updates already exists. If it exists it will only update the Auto Update value. If the key does not exist it will create it.

## File Perms
Requires editing the powershell file for your setup. See the defining factors section in the script. This script is intended for use with Domains and new folder setups.

* Turns off inheritance and nukes out the permissions
* sets the permissions
  * System gets Full Control
  * FC Group is for whatever you want to have Full Control
  * RO Group is for whatever you want to have Read Only access (Includes Execute)
  * RW is for whatever you want to have Read and Write access 

### possible issue
If you already have inheritance turned off it wont blow up the pervious permissions but will simply add the new ones.

## SMB Open Finder
Run as admin on a system that has SMB shares. Change what to the open file/folder you are trying to find. It will list the usernames of the people that have the file or folder open


## Nuke WSUS
will blow up any wsus setting from the registry

### possible issue
If there is no WSUS configured on the system it will error when trying to remoove the registry key.

## WAC SSO
Run on a domain controller as admin. This will enable WAC SSO to the server using Kerberos constrained delegation.

## Win 11 Taskbar Left
Set the taskbar to the left in Windows 11

## Pulse purge
Pulseway RMM Removal tool this will remove Pulseway and cleanup any leftovers from the uninstall

### possible issue
you may get an error saying the service doesn't exist. There are instances when only one of the services exists. everything still works despite the error.
