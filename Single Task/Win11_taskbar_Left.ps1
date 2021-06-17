# Windows 11 set taskbar to the left
Set-ItemProperty -path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -name "TaskbarAl" –Value 0
