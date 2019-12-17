
if (-not (test-path "$env:ProgramFiles\7-Zip\7z.exe")) 
{throw "$env:ProgramFiles\7-Zip\7z.exe needed"}
set-alias 7z "$env:ProgramFiles\7-Zip\7z.exe"


 ##New-Item -Path "$outDir" -Name "logfiles_backup" -ItemType "directory"
$outDir = "D:\BPS\DMS\Logs\"
$inDir = "D:\BPS\DMS\Logs\"
$bkpDir = "$outDir\logfiles_backup"
$Month = Get-Date -Format "MM"
 
7z a -mx5 

D:\BPS\DMS\Logs\aaa.zip D:\BPS\DMS\Logs\DMSweb_2019-02-01_01.log

"DMSweb_2019-02-01_00.log" -match "DMSweb_\d{4}-\d{2}-\d{2}_\d{2}.log"

$string = "DMSweb_2019-02-01_00.log"
$a = $string.split('-')[1]
echo $a


$FileNames = (Get-ChildItem -Path $inDir\*.log ).Name
#$ext = (Get-ChildItem D:\BPS\DMS\Logs\).Extension
 foreach($FileName in $FileNames)
 {
 $a = $FileName.split('-')[1]
 #echo $a
 $diff = $Month - $a
 if($diff -gt 0 )
 {
 #echo "yes"
 7z u -mx2 $outDir\$a.zip $inDir\$Filename 
 }
 else 
 {
 echo "No"
 }
 }
 
 Move-Item -Path $outDir\*.log -Destination $outDir\logfiles_backup\ -force

 $zipFilenames = (Get-ChildItem -Path $inDir\*.zip ).Name
 foreach($zipFilename in $zipFilenames)
 {
 switch($zipFilename)
 {
    01.zip { $a = "JAN";Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break} 

    02.zip { $a = "FEB"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName "$a.zip";break}

    03.zip { $a = "MAR"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    04.zip { $a = "APR"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    05.zip { $a = "MAY"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    06.zip { $a = "JUN"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    07.zip { $a = "JUL"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    08.zip { $a = "AUG"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    09.zip { $a = "SEP"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    10.zip { $a = "OCT"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    11.zip { $a = "NOV"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}

    12.zip { $a = "DEC"; Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip";break}
 }
 Start-Sleep -Seconds 1
 if (-not (Get-ChildItem -Path $outDir| Where-Object {$_.Name -match "[A-Z]{3}.zip" } | Move-Item -Destination $outDir\ArchivedFiles\ -Force))
 {
    throw "Failed to move zipped files"
 }

 }

 
 
 $zipFilenames = (Get-ChildItem -Path $inDir\*.zip ).Name
 foreach($zipFilename in $zipFilenames)
 {

 Rename-Item -force -Path D:\BPS\DMS\Logs\$zipFilename -NewName  "$a.zip"
 }
