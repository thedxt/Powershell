# quick and dirty KB4326 patch install

Get-ChildItem -Path "C:\Temp\KB4326\" -Recurse -Force | Unblock-File

# Make the folders to store the backed up DLLs
mkdir "C:\Temp\KB4326\orig\Program Files\Veeam\Backup365\"
mkdir "C:\Temp\KB4326\orig\Program Files\Veeam\Backup365\Packages\Proxy\"
mkdir "C:\Temp\KB4326\orig\Program Files\Veeam\Backup and Replication\Explorers\SharePoint\"

# stop the services
Get-Service -DisplayName "Veeam Backup for Microsoft 365 Service" | Stop-service

Get-Service -DisplayName "Veeam Backup Proxy for Microsoft 365 Service" | Stop-service


# Backup Veeam.SharePoint.Engine.dll

Copy-Item "C:\Program Files\Veeam\Backup365\Veeam.SharePoint.Engine.dll" "C:\temp\KB4326\orig\Program Files\Veeam\Backup365\"

Copy-Item "C:\Program Files\Veeam\Backup and Replication\Explorers\SharePoint\Veeam.SharePoint.Engine.dll" "C:\temp\KB4326\orig\Program Files\Veeam\Backup and Replication\Explorers\SharePoint\"

# Backup Veeam.Archiver.Source.dll

Copy-Item "C:\Program Files\Veeam\Backup365\Veeam.Archiver.Source.dll" "C:\temp\KB4326\orig\Program Files\Veeam\Backup365\"

Copy-Item "C:\Program Files\Veeam\Backup365\Packages\Proxy\Veeam.Archiver.Source.dll" "C:\temp\KB4326\orig\Program Files\Veeam\Backup365\Packages\Proxy\"


# replace the DLLs

Copy-Item "C:\temp\KB4326\Veeam.SharePoint.Engine.dll" "C:\Program Files\Veeam\Backup365\"

Copy-Item "C:\temp\KB4326\Veeam.SharePoint.Engine.dll" "C:\Program Files\Veeam\Backup and Replication\Explorers\SharePoint\"

Copy-Item "C:\temp\KB4326\Veeam.Archiver.Source.dll" "C:\Program Files\Veeam\Backup365\"

Copy-Item "C:\temp\KB4326\Veeam.Archiver.Source.dll" "C:\Program Files\Veeam\Backup365\Packages\Proxy\"


# Start the Services

Get-Service -DisplayName "Veeam Backup for Microsoft 365 Service" | Start-service

Get-Service -DisplayName "Veeam Backup Proxy for Microsoft 365 Service" | Start-service


# Follow the steps in the veeam KB to upgade the backup poxy
# https://www.veeam.com/kb4326

