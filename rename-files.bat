:: Guidance: ht	tps://stackoverflow.com/a/25583317
:: Guidance: https://ss64.com/nt/
:: Guidance: https://stackoverflow.com/a/7044572/5861315

@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: ASCII ART HEADER


set mydirectory="demoDir"
set a=1000000
set TAB=	
set BORDER=--------------------------------------------------------------------------------
set LF=^


rem Two empty lines are required for newline LF^

set multiLine=photo-bat!LF!https://www.github.com/mezcel/photo-bat.git!LF!!LF!!TAB!This batch is intened to rename media file names. !LF!!TAB!I made this for transfering image files and video files on a Windows PC !LF!!TAB!to my iPad1 via Apple iPad Camera Connection Kit. Why? I wanted !LF!!TAB!to spontaneousely change my wallpaper and upload LoFi Hiphop YouTubes, !LF!!TAB!and I wanted to do it the DIY jerry-rigged way.!LF!!LF!
echo !multiLine!

set multiLine=!LF!!BORDER!!LF!
echo !multiLine!
type batwings.txt
set multiLine=!LF!!BORDER!!LF!
echo !multiLine!
@pause

set multiLine=USER INPUTS:!LF!!BORDER!!LF!
echo !multiLine!

:: User Input, Drive Letter
set multiLine=Enter the Drive letter of the Drive containing your desired media.!LF!For example: !LF!!TAB! for the C dive or C:, just enter c!LF!!LF!
echo !multiLine!
set /p myDrive="	Enter your Letter, then press [enter] = "
echo !LF!***!LF!*** You have selected the !myDrive!: drive!LF!***!LF!!LF!

:: User Input, File Path
set multiLine=Enter the foldeder path containing your media. !LF!!LF!!TAB!Remember to use backslash for Windows. !LF!!LF!!TAB!Example: ParentFolder\ChildFolder!LF!!LF!!LF!!LF!!TAB!Example: DCIM\ChildFolder
echo !multiLine!
set /p myFolderPath="Path of Multimedia Folder = "
echo !LF!***!LF!*** You have selected !myDrive!:\!myFolderPath!!LF!*** !LF!!LF!

:: User Input, File Extenstion
set multiLine=Enter the file type extension of the files you want transfered. !LF!!LF!!TAB!Example" for .jpg or .mp4, enter jpg or mp4 !LF!!TAB!IPORTANT: Leave out the dot "."!LF!!LF!
echo !multiLine!
set /p myMediaTypeExtension="File Extension = "
set multiLine=!LF!***!LF!*** You have selected !myDrive!:\!myFolderPath!\*.!myMediaTypeExtension! !LF!*** !LF!!LF!
echo !multiLine!

:: User Input, Confirmation
set multiLine=!BORDER!!LF!All files with the file extensions .!myMediaTypeExtension! is about to be renamed!LF!!TAB!The Name convention will be P00000n!LF!!TAB!The n will be an intremented number from1 to how ever many files !LF!!TAB!are in the: !myDrive!:\!myFolderPath! Directory!LF!!LF! Do you want to continue? !LF!!TAB!Example: P00001.!myMediaTypeExtension!, P00002.!myMediaTypeExtension!, P00003.!myMediaTypeExtension!, ect.  !LF!!TAB!Enter [y] to coninue or [n] to exit!LF!!LF!
echo !multiLine!

:mychoice

set /p confirmation="Enter [y] or [n] = "

if !confirmation!==y GOTO yes
if !confirmation!==n GOTO no
if !confirmation! NEQ y GOTO mychoice

echo !LF!!BORDER!!LF!Renaming Files!LF!!BORDER!

:: set myRoot=F:\photo-bat\demoDir
set myRoot=!myDrive!:\!myFolderPath!
:: set myRootList=*.txt
set myRootList=*.!myMediaTypeExtension!

echo myRoot is !myRoot!
echo myRootList = !myRootList!
echo !LF!!BORDER!!LF!!LF!

:yes

:: Perform the Rename Process
!myDrive!:
cd !myFolderPath!
for /R %%G IN (*.!myMediaTypeExtension!) do (

	Echo ren "%%G" "P!a!.*.!myMediaTypeExtension!" 
	ren "%%G" "P!a!.!myMediaTypeExtension!" 
	set /a a+=1
	Echo Counter val !a!
)

echo !LF!!BORDER!!LF!Files are renamed!LF!!BORDER!

:no
echo !LF!!BORDER!!LF!Exiting BAT!LF!!BORDER!
@pause