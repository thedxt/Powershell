# SMB Open Finder
# lists all the files that are open or folders
# author theDXT

# change this to define what open file or folder you are looking for
$what = "pdf"

# searches and lists the open files
Get-SmbOpenFile | Where-Object -Property Path -like *$what* | select clientusername, path | FT

# close the open files
# Uncomment the line below if you want it to close the open files
#Get-SmbOpenFile | Where-Object -Property Path -like *$what* | Close-SmbOpenFile -Force
