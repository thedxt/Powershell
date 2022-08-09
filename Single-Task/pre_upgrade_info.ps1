# Pre upgrade info
# exports out the info that Microsoft says you should have before you in place upgrade
# author theDXT

write-host "Starting pre upgrade info"
Write-host " "

# temp folder name
$temp = "temp"

# check is folder exists if not create folder
if (-not (Test-Path $Env:SystemDrive\$temp))
{
New-Item -ItemType Directory $Env:SystemDrive\$temp
}

# Get BuildLabEx and export to txt file
Write-host "Getting the BuildLabEx"
Write-host " "
$BuildLabEx = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -name "BuildLabEx"
$BuildLabEx.BuildLabEx | out-file -filepath "$($Env:SystemDrive)$("\")$($temp)$("\BuildLabEx.txt")" -Encoding ASCII
Write-host "Exported BuildLabEx to $Env:SystemDrive\$temp\BuildLabEx.txt"
Write-host " "

# Get EditionID and export to txt file
Write-host "Getting the EditionID"
Write-host " "
$EditionID  = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -name "EditionID"
$EditionID.EditionID | out-file -filepath "$($Env:SystemDrive)$("\")$($temp)$("\EditionID.txt")" -Encoding ASCII
Write-host "Exported EditionID to $Env:SystemDrive\$temp\EditionID.txt"
Write-host " "

# Get System Info and export to txt file
Write-host "Getting the system info"
Write-host "This may take a bit"
Write-host " "
systeminfo.exe | out-file -filepath "$($Env:SystemDrive)$("\")$($temp)$("\systeminfo.txt")" -Encoding ASCII
Write-host "Exported systeminfo to $Env:SystemDrive\$temp\systeminfo.txt"
Write-host " "

Write-host "Getting All IP Config"
Write-host " "
ipconfig /all | out-file -filepath "$($Env:SystemDrive)$("\")$($temp)$("\IP_Config_All.txt")" -Encoding ASCII
Write-host "Exported IP Config All to $Env:SystemDrive\$temp\IP_Config_All.txt"
Write-host " "

write-host "All Pre upgrade info exported to $Env:SystemDrive\$temp"
