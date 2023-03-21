# Script to lock Windows 10 to a specific release version

# check to see if Win 10 else exit
$OSVersionCheck = (Get-WmiObject Win32_OperatingSystem).Caption
If($OSVersionCheck -notlike '*Windows 10*'){Write-host 'Not running Windows 10, cannot update registry key'
Exit}

# reg folder for the settings
$WindowsUpdateRegfolder = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"

# Stop Windows update service
Write-host "Stopping Windows Update service"
Stop-Service -Name wuauserv

Write-host "Tweaking the Windows Update reg settings"

# check to see if the Windows update reg folder exists if not make it
if (test-path $WindowsUpdateRegfolder) {
Write-host "Windows Update Reg folder already exists moving to Reg settings"
}
ELSE{
write-host "Making the Windows Update Reg folder"
new-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" | Out-Null
}

# sets the reg settings to lock it to Win 10 and a specific release
new-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name TargetReleaseVersion -Value 1 -Type DWORD -Force | Out-Null
new-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name TargetReleaseVersionInfo -Value 22H2 -Type String -Force | Out-Null
new-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name ProductVersion -Value "Windows 10" -Type String -Force | Out-Null

# Start Windows update service
Write-host "Starting Windows Update service"
Start-Service -name wuauserv

# output the results of the changes
Write-host "The results of your actions"
get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" | select ProductVersion, TargetReleaseVersionInfo, TargetReleaseVersion | fl
