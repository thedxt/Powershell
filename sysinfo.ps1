#Grab System info and save to TXT file with Hostname as file name.

#change this to where you want it to save to
$outfolder = "C:\temp\"

#file info stuff
$system = Get-WmiObject -class Win32_ComputerSystem
$filename = $system.Name
$filetype = ".txt"
$output = "$outfolder$filename$filetype"
$date = get-date

#grab most of the info
$Bios = Get-WmiObject -Class Win32_BIOS
$cpu = get-wmiobject Win32_Processor
$Ipinfo = Get-NetIPConfiguration -Detailed
$shares = Get-SmbShare
$tasks = Get-ScheduledTask -TaskPath "\"

#disk info
$diskinfo = Get-WmiObject Win32_LogicalDisk -Filter DriveType=3 | Select-Object DeviceID,
@{'Name'='Size (GB)'; 'Expression'={[string]::Format('{0:N0}',[math]::truncate($_.size / 1GB))}},
@{'Name'='Used (GB)'; 'Expression'={[string]::Format('{0:N0}',[math]::truncate(($_.size - $_.freespace) / 1GB))}},
@{'Name'='Free (GB)'; 'Expression'={[string]::Format('{0:N0}',[math]::truncate($_.freespace / 1GB))}},
@{'Name'='Free Percent'; 'Expression'={[string]::Format('{0:N2}',[math]::round(($_.freespace / $_.size ) * 100))}}


#output the info and save it
[PSCustomObject]@{
Hostname = $system.Name
Domain = $system.Domain
Manufacturer = $system.Manufacturer
Model = $system.Model
SN = $bios.SerialNumber
CPU = $cpu.Name
} | Out-File -FilePath $output
Write-Output "system info $env:computername on $date" >> $output
Write-Output "`nDISK INFO" >> $output
$diskinfo | Out-File -FilePath $output -append
Write-Output "`nNETWORK INFO" >> $output
$ipinfo | Out-File -FilePath $output -append
Write-Output "`nSHARES ON $env:computername" >> $output
$shares | Out-File -FilePath $output -append
Write-Output "`nSCHEDULED STUFF INFO" >> $output
$tasks | ft -AutoSize | Out-File -FilePath $output -append
