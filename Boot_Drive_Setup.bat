(echo Rescan
echo List Disk
echo Select Disk 1
echo clean
echo convert gpt
echo create partition primary size=20000
echo format fs=FAT32 quick label=SCCM
echo assign letter=G
echo create partition primary size=20000
echo select volume 4
echo format fs=FAT32 quick
echo create partition primary
echo select volume 5
echo format fs=FAT32 quick
)  | diskpart


@echo off
setlocal
cd /d %~dp0
Call :UnZipFile "G:" "%~dp0SCCM_WinPE_A30.zip"
exit /b

:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%

say done