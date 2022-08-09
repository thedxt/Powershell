# get all files and folders in a folder and export them to CSV

# what you want to see the files and folders for
$path = "C:\temp\"

# the locations you want the output saved to (it must end with a \ )
$csv_save = "C:\users\"



# date stuff
$thedate = Get-Date -Format "MMM-dd-yyyy_HH-mm-ss"

# confirm if the csv save locaiton exists if not make it
if (-not (Test-Path $csv_save))
{
New-Item -ItemType Directory $csv_save | out-null
}

# make the path name safe for use as the save location
$pathsafe = $path.Replace("\","_").Replace(":","").Replace(" ","")

# get all the folders recursively and export it out as a CSV 
Get-ChildItem -Directory -Literalpath $path -recurse | Select FullName | Export-Csv "$($csv_save)$($pathsafe)$($thedate)_folders.csv" -NoTypeInformation

# get all the files recursively and export it out as a CSV
Get-ChildItem -file -Literalpath $path -recurse | select fullname | Export-Csv "$($csv_save)$($pathsafe)$($thedate)_files.csv" -NoTypeInformation
