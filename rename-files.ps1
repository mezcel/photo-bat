# Guidance: https://stackoverflow.com/a/28424667/5861315
# run powserh in Administrators mode
# Vote yes to mod security
# Set-ExecutionPolicy RemoteSigned
# & "C:\ChildeFolder\helloworld.ps1"

# Rename using replace to insert text in the middle of the name
# Set directory where the files you want to rename reside
# This will allow you to run the script from outside the source directory

$myrootDrive = Read-Host -Prompt "Enter Drive"
$myrootDir = Read-Host -Prompt "Enter Directory folder path"
$desiredFileExtension = Read-Host -Prompt "file extension of the file to be renamed"
Set-Variable -Name sourcedir -Value $myrootDrive':\'$myrootDir
$desiredFileExtension = ".txt"

Write-Host "You want to rename all *.'$desiredFileExtension' in '$sourcedir'"
Write-Host "sourcedir = '$sourcedir'"

$mycounter=1
$files = Get-ChildItem -Path $sourcedir -Filter *$desiredFileExtension
#$files = Get-ChildItem -Path C:\Users\mezce\Documents\PowershellDemo\textFolder

foreach ($file in $files) 
{
	Write-Host "Renamed: '$file'"
    Rename-Item $file.name ("P100000"+$mycounter+$desiredFileExtension)
	$mycounter = $mycounter+1
}

Write-Host "Press any key"
$pause = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# rem End ------