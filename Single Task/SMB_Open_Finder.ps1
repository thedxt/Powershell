# SMB Open Finder
# lists all the files that are open or folders
# author theDXT

# change this to define what open file or folder you are looking for
$what = "pdf"

# searches list the open files
Get-SmbOpenFile | Where-Object -Property Path -like *$what* | select clientusername, path | FT
