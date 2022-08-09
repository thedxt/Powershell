#set folder permissions
#Folder can be either UNC or mounted drive
#enter the groups as DOMAIN\GROUP NAME
#author theDXT
#last update 29 June 2019

#defining factors
$folder = "E:\Shares\"
$FCGroup = "DOMAIN\Something - FC"
$ROGroup = "DOMAIN\Something - RO"
$RWGroup = "DOMAIN\Something - RW"

#scripy mcscript stuff
$systemgroup = "SYSTEM"
$permissions = Get-Acl -path $folder
$permissions.SetAccessRuleProtection($true,$false)
$InheritanceFlag = @([System.Security.AccessControl.InheritanceFlags]::ContainerInherit,[System.Security.AccessControl.InheritanceFlags]::ObjectInherit) 
$PropagationFlag = [System.Security.AccessControl.PropagationFlags]::None
$SystemRule = New-Object System.Security.AccessControl.FileSystemAccessRule($systemgroup,'FullControl',$InheritanceFlag,$PropagationFlag,"Allow")
$FCRule = New-Object System.Security.AccessControl.FileSystemAccessRule($FCGroup,'FullControl',$InheritanceFlag,$PropagationFlag,"Allow")
$RORule = New-Object System.Security.AccessControl.FileSystemAccessRule($ROGroup,'ReadAndExecute',$InheritanceFlag,$PropagationFlag,"Allow")
$RWRule = New-Object System.Security.AccessControl.FileSystemAccessRule($RWGroup,'Modify',$InheritanceFlag,$PropagationFlag,"Allow")
$permissions.AddAccessRule($SystemRule)
$permissions.AddAccessRule($FCRule)
$permissions.AddAccessRule($RORule)
$permissions.AddAccessRule($RWRule)
Write-Host "setting permissions on $folder please wait if you have lots of files this will take a bit"
$permissions | set-acl
Write-Host "The setting of the permissions has completed for $folder"
(get-acl -Path $folder).Access.IdentityReference
