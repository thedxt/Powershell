# PowerShell 5.1 Install
# Installes PowerShell 5.1
# author theDXT

# temp folder name
$temp = "temp"

# download uri
$DL_URI = "https://download.microsoft.com/download/6/F/5/6F5FF66C-6775-42B0-86C4-47D41F2DA187/Win8.1AndW2K12R2-KB3191564-x64.msu"

# out file name
$Outname = "Win8.1AndW2K12R2-KB3191564-x64.msu"

# check if temp folder name exists if not make it.
if (-not (Test-Path $Env:SystemDrive\$temp))
{
New-Item -ItemType Directory $Env:SystemDrive\$temp
}

# download the file
Invoke-WebRequest -uri $DL_URI -OutFile "$Env:SystemDrive\$temp\$Outname"

# run the install
Invoke-Expression $Env:SystemDrive\$temp\$Outname
