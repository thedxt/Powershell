# Single Task
A collection of scripts that usually do a single task or a very simple one.

## DK Defaults
Will turn on Remote Desktop with NLA and turns on file and printer sharing

## File Perms
Requires editing the powershell file for your setup. See the defining factors section in the script
Intended for use with Domains and new folder setups.
* Turns off inheritance and nukes out the permissions
* sets the permissions
  * System gets Full Control
  * FC Group is for whatever you want to have Full Control
  * RO Group is for whatever you want to have Read Only access (Includes Execute)
  * RW is for whatever you want to have Read and Write access 

### possible issue
If you already have inheritance turned off it wont blow up the pervious permissions but will simply add the new ones.


## Nuke WSUS
will blow up any wsus setting from the registry

### possible issue
If there is no WSUS configured on the system it will error when trying to remoove the registry key.


## Pulse_purge
When Pulseway uninstalls it leave a bunch of junk behind this will nuke out the left over services and program files folder

### possible issue
you may get an error saying the service doesn't exist. There are instances when only one of the services exists. everything still works despite the error.
