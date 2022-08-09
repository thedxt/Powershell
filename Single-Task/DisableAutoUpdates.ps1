$RegKey = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU'
$KeyName = 'NoAutoUpdate'
$KeyValue = '1'
 
if(-not (Test-Path $RegKey)){
 
    New-Item -Path $RegKey -Force
 
    New-ItemProperty -Path $RegKey -Name $KeyName -Value $KeyValue -PropertyType DWORD -Force
}else {
Set-ItemProperty -Path $RegKey -Name $KeyName -Value $KeyValue
}
